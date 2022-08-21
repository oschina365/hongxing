<%@ WebHandler Language="C#" Class="NSW.Web.Manager.Handler.upload" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using NSW.Entities;
using System.Data;
using BlueCrystal.Data;
using System.Xml;
using NSW.Utls;
using System.Collections;
using Newtonsoft.Json;
using NSW.Admin.Tools;
using System.Text.RegularExpressions;

namespace NSW.Web.Manager.Handler
{
    public class upload : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            //检查来源
            if (!CheckPostSource())
            {
                context.Response.Write(NSW.ORes.Error.SuspiciousOfPostingSourceAndBeIgnored);
                return;
            }
            if (!NSW.BLL.Admin.CheckPassport() && IsFlash(true))
            {
                if (!ColumnTools.CheckPermissionID(context.Request.Form["PermissionID"]))
                {
                    context.Response.Write("您尚未登录，不能操作！");
                    return;
                }
            }
            string action = context.Request.QueryString["action"];
            switch (action)
            {
                case "SaveHttpPostedFile": UploadTools.SaveHttpPostedFile(); break;
                case "SavePictureHttpPostedFile": UploadTools.SavePictureHttpPostedFile(); break;
                case "SaveFilesHttpPostedFile":
                    if (!string.IsNullOrEmpty(context.Request["guid"]) && !string.IsNullOrEmpty(context.Request["chunk"]))
                    {
                        if (NSW.BLL.Admin.CheckPassport() && ComUtls.CheckPostSource())
                        {
                            UploadChunkedFile(context);
                            return;
                        }
                        else
                        {
                            ShowChunkedError("请刷新后重试！");
                        }
                        return;
                    }
                    UploadTools.SaveFilesHttpPostedFile();
                    break;
                //合并成文件
                case "MergeChunkedFiles":
                    MergeChunkedFiles(context);
                    break;
                default:
                    UploadTools.showError("无效请求！");
                    break;
            }
        }
        private void ShowChunkedError(string msg,string path)
        {
            HttpContext.Current.Response.ContentType = "text/plain";
            HttpContext.Current.Response.Write("{\"hasError\" : \"" + msg.Replace("\"", "“") + "\"}");
            HttpContext.Current.Response.End();
            if (!string.IsNullOrEmpty(path))
            {
                DeleteFolder(path);
            }
        }
        private void ShowChunkedError(string msg)
        {
            ShowChunkedError(msg, string.Empty);
        }
        private bool IsFlash(bool ckSession)
        {
            HttpContext Content = HttpContext.Current;
            ckSession = ckSession ? Content.Session.Count < 2 : !ckSession;
            string userAgent = Content.Request.UserAgent;
            if (string.IsNullOrEmpty(userAgent)) return false;
            return ckSession && (userAgent.IndexOf("Shockwave Flash", StringComparison.OrdinalIgnoreCase) > -1 || userAgent.IndexOf("Adobe Flash Player", StringComparison.OrdinalIgnoreCase) > -1) && Content.Request.ContentType.IndexOf("multipart/form-data;", StringComparison.OrdinalIgnoreCase) > -1;
        }
        
        public bool CheckPostSource()
        {
            string str;
            bool flag = false;
            string host = HttpContext.Current.Request.Url.Host;
            if (HttpContext.Current.Request.UrlReferrer == null)
            {
                str = "";
                if (IsFlash(false))
                {
                    return true;
                }
            }
            else
            {
                str = HttpContext.Current.Request.UrlReferrer.ToString();
            }
            if (str.Length > 0)
            {
                str = str.ToLower();
                host = host.ToLower();
                if (str.Substring(7, host.Length).Equals(host))
                {
                    flag = true;
                }
            }
            return flag;
        }

        private string TempPath = "~/1/";
        private void UploadChunkedFile(HttpContext context)
        {
            //取得chunk和chunks
            int chunk = NSW.ComUtls.ParseInt(context.Request.Form["chunk"], -1);//当前分片在上传分片中的顺序（从0开始）
            int chunks = NSW.ComUtls.ParseInt(context.Request.Form["chunks"], -1);//总分片数
            string guid = context.Request.Form["guid"];
            int total = NSW.ComUtls.ParseInt(context.Request.Form["total"], -1);
            string ext = context.Request.Form["ext"];

            #region 验证
            if (chunk < 0 || chunks < 0 || string.IsNullOrEmpty(guid) || total < 0 || string.IsNullOrEmpty(ext)) ShowChunkedError("参数错误，请稍后重试！");

            if (string.Format("|{0}|", NSW.OConfig.Admin.AdminUploadFileTypes).IndexOf(string.Format("|.{0}|", ext)) == -1)
            {
                ShowChunkedError("上传文件扩展名是不允许的扩展名。");
                return;
            }
            if (total > NSW.OConfig2.SMTP.BigSize * 1024 * 1024)
            {
                ShowChunkedError("上传文件大小超过限制。");
                return;
            } 
            #endregion
            
            //根据GUID创建用该GUID命名的临时文件夹
            string folder = context.Server.MapPath(TempPath + guid + "/");
            string path = folder + chunk;
            //建立临时传输文件夹
            if (!System.IO.Directory.Exists(System.IO.Path.GetDirectoryName(folder)))
            {
                System.IO.Directory.CreateDirectory(folder);
            }
            using (System.IO.FileStream addFile = new System.IO.FileStream(path, System.IO.FileMode.Append, System.IO.FileAccess.Write))
            {
                using (System.IO.BinaryWriter AddWriter = new System.IO.BinaryWriter(addFile))
                {
                    //获得上传的分片数据流
                    HttpPostedFile file = context.Request.Files[0];
                    using (System.IO.Stream stream = file.InputStream)
                    {
                        using (System.IO.BinaryReader TempReader = new System.IO.BinaryReader(stream))
                        {
                            //将上传的分片追加到临时文件末尾
                            AddWriter.Write(TempReader.ReadBytes((int)stream.Length));
                        }
                    }
                    ext = System.IO.Path.GetExtension(file.FileName);
                }
            }
            context.Response.ContentType = "text/plain";
            context.Response.Write("{\"chunked\" : true, \"hasError\" : false, \"f_ext\" : \"" + ext + "\"}");
        }
        
        private void MergeChunkedFiles(HttpContext context)
        {
            string guid = context.Request["guid"];
            string fileExt = context.Request["ext"];
            string root = context.Server.MapPath(TempPath);
            string sourcePath = System.IO.Path.Combine(root, guid + "/");//源数据文件夹
            int columnid = NSW.ComUtls.ParseInt(context.Request["columnid"], 1);
            string name = context.Request.Form["name"];
            string title = context.Request.Form["title"];
            if (string.IsNullOrEmpty(title)) {
                title = name;
                title = title == null ? "" : title;
            }
            string targetPath = UploadTools.SavePath;
            System.Data.DataRow row = AdminTools.GetColumnByWhere(AdminTools.GetColumsByCacheByOrderBySID("Files"), "ID=" + columnid);
            if (row == null)
            {
                ShowChunkedError("请选择目录！", sourcePath);
                return;
            }
            if (string.Format("|{0}|", NSW.OConfig.Admin.AdminUploadFileTypes).IndexOf(string.Format("|{0}|", fileExt)) == -1)
            {
                ShowChunkedError("上传文件扩展名是不允许的扩展名。", sourcePath);
                return;
            }
            targetPath += row["Path"].ToString().TrimStart('/');
            string directory = NSW.Utls.IOUtls.GetMapPath(targetPath);
            targetPath += DateTime.Now.ToString("yyyyMMddHHmmss_ffff", System.Globalization.DateTimeFormatInfo.InvariantInfo) + fileExt;
            
            System.IO.DirectoryInfo dicInfo = new System.IO.DirectoryInfo(sourcePath);
            if (System.IO.Directory.Exists(System.IO.Path.GetDirectoryName(sourcePath)))
            {
                System.IO.FileInfo[] files = dicInfo.GetFiles();
                Array.Sort<System.IO.FileInfo>(files, new FileInfoComparer());
                string _path = NSW.Utls.IOUtls.GetMapPath(targetPath);
                if (!System.IO.Directory.Exists(directory))
                {
                    System.IO.Directory.CreateDirectory(directory);
                }
                foreach (System.IO.FileInfo file in files)
                {
                    using (System.IO.FileStream addFile = new System.IO.FileStream(_path, System.IO.FileMode.Append, System.IO.FileAccess.Write))
                    {
                        using (System.IO.BinaryWriter AddWriter = new System.IO.BinaryWriter(addFile))
                        {
                            //获得上传的分片数据流
                            using (System.IO.Stream stream = file.Open(System.IO.FileMode.Open))
                            {
                                using (System.IO.BinaryReader TempReader = new System.IO.BinaryReader(stream))
                                {
                                    //将上传的分片追加到临时文件末尾
                                    AddWriter.Write(TempReader.ReadBytes((int)stream.Length));
                                }
                            }
                        }
                    }
                }
                System.IO.FileInfo info = new System.IO.FileInfo(_path);
                if (info.Length > NSW.OConfig2.SMTP.BigSize * 1024 * 1024) {
                    ShowChunkedError("上传文件大小超过限制。", sourcePath);
                    try
                    {
                        info.Delete();
                    }
                    catch { }
                    return;
                }
                int fid = 0;
                try
                {
                    NSW.Entities.tbFiles Files = new NSW.Entities.tbFiles();
                    
                    Files.ColumnID = columnid;
                    Files.ContentSize = (int)info.Length / 1024;
                    Files.Enable = true;
                    Files.Ext = fileExt;
                    Files.InputTime = DateTime.Now;
                    Files.Path = targetPath.ToLower();
                    Files.SrcFilename = string.IsNullOrEmpty(name) ? title : name;
                    Files.Title = title;
                    Files.Revision = 1;
                    Files.UpdateTime = DateTime.Now;
                    Files.OrderID = 50;

                    fid = BlueCrystal.Data.DbSession.Default.Save(Files);
                }
                catch { }
                
                DeleteFolder(sourcePath);
                context.Response.Write("{\"chunked\" : true, \"hasError\" : false, \"url\" :\"" + System.Web.HttpUtility.UrlEncode(targetPath) + "\", \"name\" :\"" + System.Web.HttpUtility.UrlEncode(title) + "\", \"fileID\" :" + fid + ", \"error\" :0}");
            }
            else
                context.Response.Write("{\"hasError\" : true}");
        }

        /// <summary>
        /// 删除文件夹及其内容
        /// </summary>
        /// <param name="dir"></param>
        private static void DeleteFolder(string strPath)
        {
            try
            {
                //删除这个目录下的所有子目录
                string[] list = System.IO.Directory.GetDirectories(strPath);
                if (list.Length > 0)
                {
                    foreach (string fl in list)
                    {
                        System.IO.Directory.Delete(fl, true);
                    }
                }
                list = System.IO.Directory.GetFiles(strPath);
                //删除这个目录下的所有文件
                if (list.Length > 0)
                {
                    foreach (string f in list)
                    {
                        System.IO.File.Delete(f);
                    }
                }
                System.IO.Directory.Delete(strPath, true);
            }
            catch { }
        }
        
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }

    public class FileInfoComparer : IComparer<System.IO.FileInfo>
    {
        public int Compare(System.IO.FileInfo x, System.IO.FileInfo y)
        {
            return x.Name.CompareTo(y.Name);
        }
    }
}