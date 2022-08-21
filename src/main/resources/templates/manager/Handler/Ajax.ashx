<%@ WebHandler Language="C#" Class="NSW.Web.Manager.Handler.Ajax" %>

#region namspace
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
using System.Text.RegularExpressions;
using LitJson;
using NSW.Admin.Tools;
using System.Drawing;
using System.IO;
#endregion

#region 程序著作权以及用途
/**********************************************************************
 * 程序作者：牛商网程序部，李施霖，张鸿飞，杨军
 * 电子邮件：masterlijf@hotmail.com, likecode#qq.com
 * 公司名称：深圳市牛商网络有限公司
 * 程序书写时间：2009-2-21
 * 程序实现目的：
 * 1. 后台程序AJAX服务端代码
 **********************************************************************/
#endregion;


namespace NSW.Web.Manager.Handler
{
    public class Ajax : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {

            //检查来源
            if (!ComUtls.CheckPostSource())
            {
                WriteJson(false,ORes.Error.SuspiciousOfPostingSourceAndBeIgnored);
                return; 
            }
            //延时，用于客户端测试
            //System.Threading.Thread.Sleep(2000);
            if (!NSW.BLL.Admin.CheckPassport())
            {
                context.Response.Write("您尚未登录，不能操作！");
                return;
            }
            /****************************************
             * 加快方法调用响应速度，所有方法和属性尽量以静态的形式实现
             ***************************************/
            //操作
            string action = context.Request.QueryString["action"];
            switch (action)
            {
                    //获取分类图片大小
                case "getpicsize": GetColumnPicSize(); break;

                case "SendOrderDeliveriedMailNotyfi":
                    SendOrderDeliveriedMailNotyfi();
                    break;
                //发送订单已付款邮件通知
                case "SendOrderPaidMailNotyfi":
                    SendOrderPaidMailNotyfi();
                    break;
                //发送订单已取消邮件通知
                case "SendOrderCanceledMailNotyfi":
                    SendOrderCanceledMailNotyfi();
                    break;
                //发送获取产品列表通知
                case "SendGetProductByColumn":
                    SendGetProductByColumn();
                    break;
                //发送获取资讯列表通知
                case "SendGetNewsByColumn":
                    SendGetNewsByColumn();
                    break;
                //发送获取广告列表通知
                case "SendGetAdByColumn":
                    SendGetADByColumn();
                    break;
                //发送获取帮助列表通知
                case "SendGetHelpByColumn":
                    SendGetHelpByColumn();
                    break;   
                //发送获取代理商文案列表通知
                case "SendGetAgentByColumn":
                    SendGetAgentByColumn();
                    break;                                      
                //获取产品分类
                case "GetProductColumns":
                    GetProductColumns();
                    break;                    
                //获取文件内容
                case "sendGetHtmlFileNotify":
                    GetHTMLFileContent();
                    break;
                //获得定单状态的EC短信话语
                case "getOrderContent":
                    GetOrderContent();
                    break;
                //获得会员列表的EC短信话语
                case "getUserContent":
                    GetUserContent();
                    break;
                //获得EC短信会员区电话的cookies值
                case "getPhonesCookies":
                    GetPhonesCookies();
                    break;
                //设置EC短信会员区电话的cookies值
                case "setPhonesCookies":
                    SetPhonesCookies();
                    break;
                //生成会员的关键词（八爪图）
                case "SearchKeyWords": SearchKeyWords(); break;
                case "BatchAddColumn": BatchAddColumn(); break;//批量添加分类
                case "BatchAddMune": BatchAddMune(); break;//批量添加导航
                case "BatchAddTags": BatchAddTags(); break;
                case "BatchAddKeywords": BatchAddKeywords(); break;
                case "BatchTransferColumn": BatchTransferColumn(); break;//分类批量转移
                case "extensionClassification": ExtensionClassification(); break;//详细添加扩展分类
                case "cancelExtensionClassification": CancelExtensionClassification(); break;//详细取消扩展分类
                case "MassTransfer": MassTransfer(); break;
                    
                case "delete": Delete(); break;//删除
                case "getPingYing": GetPingYing(); break;//获取拼音
                case "checkFile": _CheckFile(); break;//检查是否可用
                //修改置顶字段
                case "ajaxbit": ajaxbit(); break;
                //修改排序
                case "alertOrder": alertOrder(); break;
                case "alertTitle": alertTitle(); break;
                //修改直属分类
                case "alertColumn": alertColumn(); break;
                case "updateColumn": updateColumn(); break;
                case "init_imgsize": initimgsize(); break;
                    
                /*日志 Start*/
                case "dellog": dellog(); break;//删除日志
                case "emptylog": emptylog(); break;//清空日志
                /*日志 End*/
                /*回收站操作*/
                case "recyclebin": recyclebin(); break;//还原
                //删除管理员
                case "deladmin": deladmin(); break;
                case "checkTemp": CheckTemp(); break;
                case "templateDownload": TemplateDownload(); break;
                case "delTemp": DelTemp(); break;
                case "BatchAddAdminUser": BatchAddAdminUser(); break;//添加后台管理员
                case "RightColumn": RightColumn(); break;//右边栏目操作
                case "SetTemp": SetTemp(); break;//设置默认模板
                case "ImportedColumnAttribute": ImportedColumnAttribute(); break;
                case "checkTitle": CheckTitle(); break;
                case "BatchAddFiles": BatchAddFiles(); break;
                case "addLocal": AddLocal(); break;
                case "cropimg": CropImg(); break;
                case "saveTemp": SaveTemp(); break;
                default:
                    //WriteString("无效请求。");
                    WriteJson(false, "无效请求！");
                    break;
            }
        }
        private static int RMax = 0;
        
        public static void SaveTemp()
        {
            HttpContext context = HttpContext.Current;
            string html = context.Request.Form["html"].ToString().Trim();
            string msg = "参数错误";
            if (AdminTools.IsSystem && context.Request.UrlReferrer != null)
            {
                Uri url = context.Request.UrlReferrer;
                string path = url.AbsolutePath.ToLower();
                if (path.EndsWith(".html"))
                {
                    string hz = "";
                    if (html.Contains("<html") && html.Contains("</html>"))
                    {
                        hz = "html";
                    }
                    try
                    {
                        if (path.Contains("/config/"))
                        {
                            //path = path.Replace(".html", ".config").Replace("/template/", "/");
                            hz = "config";
                        }
                        if (string.IsNullOrEmpty(hz))
                        {
                            string opath = context.Request.Form["path"];
                            if (!string.IsNullOrEmpty(opath))
                            {
                                int index = opath.LastIndexOf(".");
                                if (index > 0) {
                                    hz = opath.Substring(index + 1);
                                }
                            }
                        }
                        if (!string.IsNullOrEmpty(hz))
                        {
                            path = path.Replace(".html", "." + hz).Replace("/_js_/", "/").Replace("/_css_/", "/");
                            if (!hz.Equals("html"))
                            {
                                path = new Regex("/template").Replace(path, "/", 1);
                            }
                            path = NSW.Utls.IOUtls.GetMapPath(path);
                            bool IsExist = IOUtls.IsExist(path, IOUtls.FsoMethod.File);
                            if (IsExist)
                            {
                                FileInfo info = new FileInfo(path);
                                if (!IOUtls.ReadFile(path).Trim().Equals(html))
                                {
                                    info.CopyTo(path + DateTime.Now.ToString("yyMMddHHmmss") + ".bak");
                                    IOUtls.WriteFile(path, html);
                                    NVEngine.NVTempHelp.ClearCache();
                                }
                                msg = "保存成功";
                            }
                            else
                            {
                                msg = "保存失败";
                            }
                        }
                    }
                    catch(Exception e){
                        msg = e.Message;
                    }
                }
            }
            WriteString(msg);   
        }
        
        public Dictionary<string,string> GetPicturePath(string path_)
        {
            Dictionary<string, string> dic = new Dictionary<string, string>();
            string loc = NSW.Utls.IOUtls.GetMapPath("/").ToLower();
            string path = NSW.Utls.IOUtls.GetMapPath(path_).ToLower();
            string key = "\\uploadfiles\\";
            string cnewpath = path;

            string ext = Path.GetExtension(cnewpath);
            if (cnewpath.Contains(key))
            {
                cnewpath = cnewpath.Replace(key, key + "cropimg\\");
            }
            else
            {
                cnewpath = cnewpath.Replace(loc, "").TrimStart('\\');
                cnewpath = Path.Combine(loc, key.TrimStart('\\') + "cropimg\\" + cnewpath);
            }
            string newtype = "__$" + DateTime.Now.ToString("yy_M_d_H_m_s") + ext;
            string newpath = cnewpath.Replace(ext, newtype);
            string opath = path.Replace(ext, "_" + DateTime.Now.ToString("yyMMddHHmmss") + ext);

            if (File.Exists(path) && !File.Exists(cnewpath))
            {
                string dic_ = Path.GetDirectoryName(cnewpath);
                if (!Directory.Exists(dic_))
                {
                    Directory.CreateDirectory(dic_);
                }
                File.Copy(path, cnewpath);
            }
            
            dic.Add("path_", path_);
            dic.Add("loc", loc);
            dic.Add("path", path);
            dic.Add("cnewpath", cnewpath);
            dic.Add("newpath", newpath);
            dic.Add("opath", opath);
            
            return dic;
        }
        private Hashtable CropImg(string path,Hashtable ht,bool save,int x,int y,int w,int h,int _w)
        {
            ht["rs"] = false;
            if (path.StartsWith("/"))
            {
                Dictionary<string, string> paths = GetPicturePath(path);
                string cpath = paths["path"];
                string newpath = paths["newpath"];
                string cnewpath = paths["cnewpath"];
                string opath = paths["opath"];
                string loc = paths["loc"];
                bool rs = false;
                if (File.Exists(cpath))
                {
                    try
                    {
                        if (save)
                        {
                            string dic = Path.GetDirectoryName(newpath);
                            if (!Directory.Exists(dic))
                            {
                                Directory.CreateDirectory(dic);
                            }
                            File.Copy(cpath, newpath);
                        }
                        else
                        {
                            newpath = cpath;
                            //保存成新文件
                            cpath = opath;
                        }
                        Bitmap bitmap = new Bitmap(cnewpath);
                        if (_w > 0)
                        {
                            decimal bl = w / _w;
                            w = (int)(w * bl);
                            h = (int)(h * bl);
                            x = (int)(x * bl);
                            y = (int)(x * bl);
                        }
                        Rectangle cropArea = new Rectangle(x, y, w, h);//要截取的区域大小
                        if ((bitmap.Width >= x + w) && bitmap.Height >= y + h)
                        {
                            //进行裁剪
                            Bitmap bmpCrop = bitmap.Clone(cropArea, bitmap.PixelFormat);
                            bitmap.Dispose();
                            bmpCrop.Save(cpath, System.Drawing.Imaging.ImageFormat.Jpeg);
                            bmpCrop.Dispose();
                            rs = true;
                            ht["state"] = true;
                            ht["rs"] = true;
                        }
                        else
                        {
                            ht["message"] = "尺寸有误";
                        }
                    }
                    catch (Exception ex)
                    {
                        ht["message"] = ex.Message;
                        if (save)
                        {
                            try
                            {
                                if (File.Exists(newpath))
                                {
                                    File.Delete(newpath);
                                }
                            }
                            catch { }
                        }
                        Log.Error(ex);
                    }
                    if (rs)
                    {
                        if (!save)
                        {
                            ht["path"] = "/" + cpath.Replace(loc, "").Replace("\\", "/").Trim('/');
                        }
                    }
                }
                else
                {
                    ht["message"] = "文件不存在";
                }
            }
            else
            {
                ht["message"] = "路径不是本地路径";
            }
            return ht;
        }
        
        private void CropImg()
        {
            int oid = NSW.ComUtls.ParseInt(GF("oid"), -1);
            string fn = GF("fn");
            Hashtable ht = null;
            if (string.IsNullOrEmpty(fn))
            {
                int x = NSW.ComUtls.ParseInt(GF("x"), -1);
                int y = NSW.ComUtls.ParseInt(GF("y"), -1);

                int w = NSW.ComUtls.ParseInt(GF("w"), -1);
                int _w = NSW.ComUtls.ParseInt(GF("_w"), -1);
                int h = NSW.ComUtls.ParseInt(GF("h"), -1);
                bool save = NSW.ComUtls.ParseBool(GF("save"), true);
                string src = GF("src").Trim().ToLower();
                int type = NSW.ComUtls.ParseInt(GF("type"), -1);
                if (!string.IsNullOrEmpty(src)) {
                    int last = src.LastIndexOf("?");
                    if (last > 0) {
                        src = src.Substring(0, last);
                    }
                }
                if (x > 0 && y > 0 && w > 0 && h > 0)
                {
                    ht = new Hashtable();
                    ht["state"] = false;
                    ht["message"] = "参数错误";
                    string path = "";
                    if (oid > 0)
                    {
                        tbPicture picture = DbSession.Default.Get<tbPicture>(oid);
                        if (picture != null)
                        {
                            path = picture.Path;
                            CropImg(path, ht, save, x, y, w, h, _w);
                        }
                        else
                        {
                            ht["message"] = "图库不存在";
                        }
                    }
                    else if (type == 1 && !string.IsNullOrEmpty(src)) {
                        path = src;
                        save = false;
                        CropImg(path, ht, save, x, y, w, h, _w);
                        if (ht["state"].Equals(true)) {
                            string newpath = ht["path"].ToString();
                            string o = NSW.Utls.IOUtls.GetMapPath(newpath);
                            tbPicture pi = DbSession.Default.From<tbPicture>().Where(tbPicture._.Path == src.ToLower()).ToFirst();
                            if (pi == null)
                            {
                                pi = new tbPicture();
                                pi.ColumnID = 22;
                                pi.Enable = true;
                                pi.Ext = Path.GetExtension(o);
                                pi.InputTime = DateTime.Now;
                                pi.IsThumb = true;
                                pi.OrderID = 50;
                                pi.Revision = 0;
                                pi.SrcFilename = src;
                                pi.Title = Path.GetFileNameWithoutExtension(o);
                                pi.UpdateTime = DateTime.Now;
                            }
                            else {
                                pi.Detach();
                            }
                            pi.Title = "裁剪（" + w + "X" + h + "）" + pi.Title;
                            pi.Path = newpath;
                            pi.ContentSize = (int)(new FileInfo(o).Length);
                            pi.Revision += 1;
                            
                            DbSession.Default.Save<tbPicture>(pi);
                            
                            ht["message"] = newpath;
                        }
                    }
                    WriteJson(ht["state"].Equals(true), ht["message"].ToString());
                }
            }
            else if (fn.Equals("getcropimg"))
            {
                tbPicture picture = DbSession.Default.Get<tbPicture>(oid);
                if (picture != null)
                {
                    Dictionary<string, string> paths = GetPicturePath(picture.Path);
                    string cnewpath = paths["cnewpath"];
                    string loc = paths["loc"];
                    ht = new Hashtable();
                    ht["url"] = "/" + cnewpath.Replace(loc, "").Replace("\\", "/").Trim('/');
                    WriteJson(true, ht);
                }
            }
            else if (fn.Equals("clearcropimg")) {
                tbPicture picture = DbSession.Default.Get<tbPicture>(oid);
                if (picture != null)
                {
                    Dictionary<string, string> paths = GetPicturePath(picture.Path);
                    string cnewpath = paths["cnewpath"];
                    ht = new Hashtable();
                    if (File.Exists(cnewpath))
                    {
                        File.Delete(cnewpath);
                    }
                    ht["url"] = picture.Path;
                    WriteJson(true, ht);
                }
            }
            WriteJson(false, "参数错误");
        }
        
        //添加本地文件
        private void AddLocal()
        {
            int columnid = NSW.ComUtls.ParseInt(GF("ColumnID"), -1);
            string pictureTitle = GF("pictureTitle").ToLower();
            string pictureAddress = GF("pictureAddress").ToLower();
            bool isfile = NSW.ComUtls.ParseBool(GF("isfile"), false);
            if (columnid > 0 && !string.IsNullOrEmpty(pictureAddress))
            {
                if (!isfile)
                {
                    System.Data.DataRow row = AdminTools.GetColumnByWhere(AdminTools.GetColumsByCacheByOrderBySID("picture"), "ID=" + columnid);
                    string fileName = "";
                    string ext = "";
                    int index = pictureAddress.LastIndexOf("/");
                    if (index > 0)
                    {
                        fileName = pictureAddress.Substring(index + 1);
                        index = fileName.LastIndexOf(".");
                        if (index > 0)
                        {
                            ext = fileName.Substring(index);
                        }
                    }
                    fileName = string.IsNullOrEmpty(pictureTitle) ? fileName : pictureTitle;
                    if (row != null)
                    {
                        tbPicture picture = DbSession.Default.From<tbPicture>().Where(tbPicture._.Path == pictureAddress).ToFirst();
                        if (picture == null)
                        {
                            picture = new tbPicture();
                            picture.ColumnID = (int)row["ID"];
                            picture.ContentSize = 0;
                            picture.Enable = true;
                            picture.Ext = ext;
                            //picture.Ext = System.IO.Path.GetExtension(pictureAddress);
                            picture.InputTime = picture.UpdateTime = DateTime.Now;
                            picture.IsThumb = true;
                            picture.OrderID = 50;
                            picture.Path = pictureAddress;
                            picture.Revision = 1;
                            picture.SrcFilename = pictureAddress;
                            picture.Title = pictureTitle;
                            int s = DbSession.Default.Save<tbPicture>(picture);
                            if (s > 1)
                            {
                                WriteJson(true, fileName);
                            }
                        }
                        else
                        {
                            WriteJson(true, fileName);
                        }
                    }
                }
                else {
                    System.Data.DataRow row = AdminTools.GetColumnByWhere(AdminTools.GetColumsByCacheByOrderBySID("files"), "ID=" + columnid);
                    string fileName = "";
                    string ext = "";
                    int index = pictureAddress.LastIndexOf("/");
                    if (index > 0)
                    {
                        fileName = pictureAddress.Substring(index + 1);
                        index = fileName.LastIndexOf(".");
                        if (index > 0)
                        {
                            ext = fileName.Substring(index);
                        }
                    }
                    fileName = string.IsNullOrEmpty(pictureTitle) ? fileName : pictureTitle;
                    if (row != null)
                    {
                        tbFiles file = DbSession.Default.From<tbFiles>().Where(tbFiles._.Path == pictureAddress).ToFirst();
                        if (file == null)
                        {
                            file = new tbFiles();
                            file.ColumnID = (int)row["ID"];
                            file.ContentSize = 0;
                            file.Enable = true;
                            file.Ext = ext;
                            //picture.Ext = System.IO.Path.GetExtension(pictureAddress);
                            file.InputTime = file.UpdateTime = DateTime.Now;
                            file.IsThumb = true;
                            file.OrderID = 50;
                            file.Path = pictureAddress;
                            file.Revision = 1;
                            file.SrcFilename = pictureAddress;
                            file.Title = pictureTitle;
                            int s = DbSession.Default.Save<tbFiles>(file);
                            if (s > 1)
                            {
                                WriteJson(true, fileName);
                            }
                        }
                        else
                        {
                            WriteJson(true, fileName);
                        }
                    }
                }
            }
            WriteJson(false, "参数错误！");
        }
        private void BatchAddFiles() {
            int cid = NSW.ComUtls.ParseInt(GF("cid"), -1);
            string folder = GF("folder").Trim().ToLower();
            //必须包含uploadfiles，但是又不能是pictures和files
            HttpContext Context = HttpContext.Current;
            if (cid > 0 && !folder.Contains(".") && !folder.Contains("~") && (folder.StartsWith("/uploadfiles/") && !folder.Contains("/uploadfiles/pictures/") && !folder.Contains("/uploadfiles/files/")))
            {
                string folder_ = Context.Server.MapPath(folder);
                int index = 10;
                string locPath = Context.Server.MapPath("~/").TrimEnd('\\').ToLower();
                if (System.IO.Directory.Exists(folder_)) {
                    string[] files = System.IO.Directory.GetFiles(folder_);
                    int count = 0;
                    foreach (string file in files) {
                        string dic = System.IO.Path.GetDirectoryName(file);
                        string ext = System.IO.Path.GetExtension(file);
                        string fileName = System.IO.Path.GetFileName(file);
                        string fileNameWithoutExtension = System.IO.Path.GetFileNameWithoutExtension(file);
                        //自动添加
                        if (!file.Contains("_autoadd") && Utls.IOUtls.CheckFileType(OConfig.Admin.AdminUploadFileTypes, file))
                        {
                            string newfileName = NSW.Admin.Tools.StrToPinyin.GetPinYin(fileNameWithoutExtension).Trim() + "_autoadd" + ext;
                            string newfile = System.IO.Path.Combine(dic, newfileName);
                            while (System.IO.File.Exists(newfile)) {
                                newfileName = NSW.Admin.Tools.StrToPinyin.GetPinYin(fileNameWithoutExtension).Trim() + "_autoadd" + "_" + index.ToString() + ext;
                                newfile = System.IO.Path.Combine(dic, newfileName);
                                index++;
                            }
                            bool istrue = false;
                            try
                            {
                                System.IO.File.Move(file, newfile);
                                istrue = true;
                            }
                            catch (Exception ex) {
                                Log.Error(ex);
                            }
                            if (istrue) {
                                System.IO.FileInfo fInfo = new System.IO.FileInfo(newfile);
                                if (fInfo.Exists)
                                {
                                    tbFiles tbfile = new tbFiles();
                                    tbfile.ColumnID = cid;
                                    tbfile.ContentSize = (int)fInfo.Length / 1024;
                                    tbfile.Description = tbfile.Title = tbfile.SrcFilename = tbfile.FileName = fileNameWithoutExtension;
                                    tbfile.Ext = ext;
                                    tbfile.Enable = true;
                                    tbfile.InputTime=tbfile.UpdateTime = DateTime.Now;
                                    tbfile.IsThumb = false;
                                    tbfile.OrderID = 50;
                                    tbfile.Revision = 1;
                                    tbfile.Path = newfile.ToLower().Replace(locPath, "").Replace('\\', '/');
                                    int i = DbSession.Default.Save<tbFiles>(tbfile);
                                    //保存失败，还原
                                    if (i < 1)
                                    {
                                        try
                                        {
                                            System.IO.File.Move(newfile, file);
                                        }
                                        catch (Exception ex)
                                        {
                                            Log.Error(ex);
                                        }
                                    }
                                    else {
                                        count++;
                                    }
                                } 
                            }
                        }
                    }
                    if (count == 0)
                    {
                        WriteJson(false, "没有可上传的附件...");
                    }
                    else {
                        WriteJson(true, "成功上传" + count + "个附件。");
                    }
                }
            }
            WriteJson(false, "参数错误！");
        }
        private void CheckTitle()
        {
            //string tbname = GF("tbname");
            string title = HttpUtility.UrlDecode(GF("title", ""));
            string field = GF("field", "title");
            bool checkTitle = false;
            string tbname = string.Empty;
            if (!string.IsNullOrEmpty(title) && !string.IsNullOrEmpty(field))
            {
                Uri uri = HttpContext.Current.Request.UrlReferrer;
                if (uri != null)
                {
                    string query = uri.Query;
                    int oid = -1;
                    if (!string.IsNullOrEmpty(query)) {
                        query = query.ToLower();
                        Regex r = new Regex(@"oid=(\d+)", RegexOptions.IgnoreCase);
                        Match m = r.Match(query);
                        if (m.Success) {
                            oid = NSW.ComUtls.ParseInt(m.Groups[1].Value, -1);
                        }
                        if (oid > 0 && query.Contains("action=copy")) {
                            oid = -1;
                        }
                    }
                    string path = uri.AbsolutePath.ToLower();
                    int index = path.LastIndexOf("/");
                    if (index > 0) {
                        path = path.Substring(index + 1);
                    }
                    switch (path) {
                        case "products_edit.aspx":
                            tbname = "tbproduct";
                            break;
                        case "projects_edit.aspx":
                            tbname = "tbproject";
                            break;
                        case "news_edit.aspx":
                            tbname = "tbnews";
                            break;
                        case "helps_edit.aspx":
                            tbname = "tbhelp";
                            break;
                        case "agents_edit.aspx":
                            tbname = "tbagent";
                            break;
                    }
                    if (!string.IsNullOrEmpty(tbname))
                    {
                        checkTitle = AdminTools.CheckTitle(tbname, field, title, oid, true);
                    }
                }
            }
            WriteJson(checkTitle, checkTitle.ToString().ToLower());
        }
        
        private void BatchAddKeywords() {
            string cid = GF("cid", GF("ddlColumnID"));
            string columns = GF("columns").Replace("'", "“").Replace(";", "").Trim();
            string[] arr = null;
            if (!string.IsNullOrEmpty(cid) && !string.IsNullOrEmpty(columns) && (arr = ComUtls.SplitByEnter(columns)) != null && arr.Length > 0)
            {
                if (!CheckPermission("keywords.aspx", BLL.Admin.AdminPermission.InsertPermission))
                {
                    WriteJson(false, "您没有添加权限！");
                    return;
                }
                if (AdminTools.CheckSIDFormat(cid))
                {
                    cid = AdminTools.GetColumnIDBySID(cid).ToString();
                }
                tbKeywordColumn keywordColumn = DbSession.Default.Get<tbKeywordColumn>(cid);
                if (keywordColumn != null)
                {
                    int r = 0;
                    foreach (string value in arr)
                    {
                        string[] values = value.Split(new char[] { '/' }, 2);
                        if (values != null && values.Length > 0)
                        {
                            string title = values[0];
                            string url = values.Length > 1 ? "/" + values[1] : string.Empty;
                            
                            tbKeyword keyword = new tbKeyword();
                            keyword.ColumnID = keywordColumn.ID;
                            keyword.Enable = true;
                            keyword.InputTime = DateTime.Now;
                            keyword.Title = title;
                            keyword.Len = keyword.Title.Length;
                            keyword.Mode = keyword.Len;
                            keyword.OrderID = 50;
                            keyword.ShortDesc = string.Empty;
                            keyword.URL = url;
                            int r0 = DbSession.Default.Save<tbKeyword>(keyword);
                            if (r0 > 0)
                            {
                                r++;
                            }
                        }
                    }
                    if (r > 0)
                    {
                        NVEngine.Tools.NewTools.ClearCache("tbKeyword");
                        WriteJson(true, "成功添加" + r + "条数据");
                        return;
                    }
                }
            }
            WriteJson(false, "参数错误");
        }

        private void BatchAddTags()
        {
            string cid = GF("cid", GF("ddlColumnID"));
            string columns = GF("columns").Replace("'", "“").Replace(";", "").Trim();
            string[] arr = null;
            if (!string.IsNullOrEmpty(cid) && !string.IsNullOrEmpty(columns) && (arr = ComUtls.SplitByEnter(columns)) != null && arr.Length > 0)
            {
                if (!CheckPermission("tags.aspx", BLL.Admin.AdminPermission.InsertPermission))
                {
                    WriteJson(false, "您没有添加权限！");
                    return;
                }
                if (AdminTools.CheckSIDFormat(cid)) {
                    cid = AdminTools.GetColumnIDBySID(cid).ToString();
                }
                tbTagColumn tagColumn = DbSession.Default.Get<tbTagColumn>(cid);
                if (tagColumn != null)
                {
                    int r = 0;
                    foreach (string value in arr)
                    {
                        string[] values = value.Split(new char[] { '/' }, 2);
                        if (values != null && values.Length > 0)
                        {
                            string title = values[0];
                            string url = values.Length > 1 ? "/" + values[1] : string.Empty;
                            
                            tbTag tag = new tbTag();
                            tag.ColumnID = tagColumn.ID;
                            tag.Enable = true;
                            tag.Hits = 0;
                            tag.InputTime = DateTime.Now;
                            tag.isTop = false;
                            tag.URL = url;
                            tag.OrderID = 50;
                            tag.ShortDesc = string.Empty;
                            tag.Title = title;
                            tag.Len = tag.Title.Length;
                            int r0 = DbSession.Default.Save<tbTag>(tag);
                            if (r0 > 0)
                            {
                                r++;
                            }
                        }
                    }
                    if (r > 0) {
                        NVEngine.Tools.NewTools.ClearCache("tbTag");
                        WriteJson(true, "成功添加" + r + "条数据");
                        return;
                    }
                }
            }
            WriteJson(false, "参数错误");
        }
        
        private void BatchAddMune() {
            string cid = GF("cid");
            string columns = GF("columns").Replace("'", "“").Replace(";", "").Trim();
            string[] arr = null;
            if (!string.IsNullOrEmpty(cid) && !string.IsNullOrEmpty(columns) && (arr = ComUtls.SplitByEnter(columns)) != null && arr.Length > 0)
            {
                if (!CheckPermission("mune_config.aspx", BLL.Admin.AdminPermission.InsertPermission))
                {
                    WriteJson(false, "您没有添加权限！");
                    return;
                }
                string parentid = NSW.ComUtls.ParseInt(cid, 1).ToString();
                int menuType = 1;
                List<MuneXML> list = NSW.OConfig2.SMTP.GetMunelist();
                int count = list.Count;
                if (parentid.Equals("1") || parentid.Equals("2"))
                {
                    menuType = NSW.ComUtls.ParseInt(parentid, menuType);
                    parentid = "0";
                }
                else
                {
                    MuneXML Parent = list.Find(delegate(MuneXML p) { return p.OID == parentid; });
                    if (Parent == null)
                    {
                        parentid = "1";
                    }
                    else
                    {
                        menuType = Parent.MenuType;
                        parentid = Parent.OID;
                    }
                }

                int i = 10;
                foreach (string value in arr)
                {
                    if (!string.IsNullOrEmpty(value))
                    {
                        string[] values = value.Split(new char[] { '/' }, 2);
                        if (values != null && values.Length > 0)
                        {
                            string title = values[0];
                            string url = values.Length > 1 ? "/" + values[1] : string.Empty;

                            MuneXML OBJ = new MuneXML();
                            OBJ.OID = DateTime.Now.ToString("yymmss") + ((new Random()).Next(1000) + i).ToString();
                            OBJ.ParentID = parentid;
                            OBJ.Title = title;
                            OBJ.URL = url;
                            OBJ.Target = "本窗口";
                            OBJ.ReTitle = string.Empty;
                            OBJ.Order = 50;
                            OBJ.IsRel = 0;
                            OBJ.Enable = 1;
                            OBJ.CssName = "";
                            OBJ.MenuType = menuType;
                            list.Add(OBJ);
                            i = i + 20;
                        }
                    }
                }
                
                bool istrue = false;
                if (list.Count > count) {
                    try
                    {
                        XMLTool.SerObject(HttpContext.Current.Server.MapPath("/") + "/Config/Mune.xml", list);
                        istrue = true;
                        HttpContext.Current.Cache["footmenu"] = HttpContext.Current.Cache["headmenu"] = "";
                        NVEngine.Tools.NewTools.ClearCache("tbMune");
                    }
                    catch (Exception ex)
                    {
                        WriteJson(false, ex.Message);
                    }
                }
                if (istrue) {
                    WriteJson(istrue, "成功添加" + (list.Count - count) + "条数据");
                }
            }
            WriteJson(false, "参数错误");
        }
        
        private void ImportedColumnAttribute()
        {
            string str_type = GF("type");
            string attrids = GF("attrids").Trim().Trim(',');
            string columnids = GF("columnids").Trim().Trim(',');
            bool cover = NSW.ComUtls.ParseBool(GF("cover"), true);
            if (!string.IsNullOrEmpty(str_type) && ComUtls.CheckIDsFormat(attrids) && ComUtls.CheckIDsFormat(columnids))
            {
                NSW.Web.API.ColumnType type = NVTools.Tools.GetColumnType(str_type);
                int count = 0;
                string title = "";
                if (type == API.ColumnType.Product)
                {
                    if (!CheckPermission("product_column_edit.aspx", BLL.Admin.AdminPermission.UpdatePermission))
                    {
                        WriteJson(false, "您没有权限！");
                        return;
                    }
                    title = "产品属性";
                    List<tbProductColumn> list = DbSession.Default.From<tbProductColumn>().Where(tbProductColumn._.ID.In(columnids.Split(','))).ToList<tbProductColumn>() as List<tbProductColumn>;
                    if (list != null && list.Count > 0) {
                        if (cover)
                        {
                            foreach (tbProductColumn productColumn in list)
                            {
                                if (!productColumn.Attribute.Equals(attrids))
                                {
                                    productColumn.Attach();
                                    productColumn.Attribute = attrids;
                                    count += DbSession.Default.Save<tbProductColumn>(productColumn);
                                }
                            }
                        }
                        else {
                            foreach (tbProductColumn productColumn in list)
                            {
                                string attr = productColumn.Attribute;
                                if (!attr.Equals(attrids)) {
                                    string[] arr = attrids.Split(',');
                                    StringBuilder sb = new StringBuilder(attr);
                                    attr = "," + attr + ",";
                                    bool isUpdate = false;
                                    foreach (string at in arr) {
                                        if (!attr.Contains("," + at + ",")) {
                                            sb.Append("," + at);
                                            isUpdate = true;
                                        }
                                    }
                                    if (isUpdate) {
                                        productColumn.Attach();
                                        productColumn.Attribute = sb.ToString().Trim(',');
                                        count += DbSession.Default.Save<tbProductColumn>(productColumn);
                                    }
                                }
                            }
                        }
                    }
                }
                else if(type== API.ColumnType.Project){
                    if (!CheckPermission("project_column_edit.aspx", BLL.Admin.AdminPermission.UpdatePermission))
                    {
                        WriteJson(false, "您没有权限！");
                        return;
                    }
                    title = "方案属性";
                    List<tbProjectColumn> list = DbSession.Default.From<tbProjectColumn>().Where(tbProjectColumn._.ID.In(columnids.Split(','))).ToList<tbProjectColumn>() as List<tbProjectColumn>;
                    if (list != null && list.Count > 0)
                    {
                        if (cover)
                        {
                            foreach (tbProjectColumn projectColumn in list)
                            {
                                if (!projectColumn.Attribute.Equals(attrids))
                                {
                                    projectColumn.Attach();
                                    projectColumn.Attribute = attrids;
                                    count += DbSession.Default.Save<tbProjectColumn>(projectColumn);
                                }
                            }
                        }
                        else {
                            foreach (tbProjectColumn projectColumn in list)
                            {
                                string attr = projectColumn.Attribute;
                                if (!attr.Equals(attrids))
                                {
                                    string[] arr = attrids.Split(',');
                                    StringBuilder sb = new StringBuilder(attr);
                                    attr = "," + attr + ",";
                                    bool isUpdate = false;
                                    foreach (string at in arr)
                                    {
                                        if (!attr.Contains("," + at + ","))
                                        {
                                            sb.Append("," + at);
                                            isUpdate = true;
                                        }
                                    }
                                    if (isUpdate)
                                    {
                                        projectColumn.Attach();
                                        projectColumn.Attribute = sb.ToString().Trim(',');
                                        count += DbSession.Default.Save<tbProjectColumn>(projectColumn);
                                    }
                                }
                            }
                        }
                    }
                }
                else if (type == API.ColumnType.DownLoad)
                {
                    if (!CheckPermission("downLoad_column_edit.aspx", BLL.Admin.AdminPermission.UpdatePermission))
                    {
                        WriteJson(false, "您没有权限！");
                        return;
                    }
                    title = "下载属性";
                    List<tbDownloadColumn> list = DbSession.Default.From<tbDownloadColumn>().Where(tbDownloadColumn._.ID.In(columnids.Split(','))).ToList<tbDownloadColumn>() as List<tbDownloadColumn>;
                    if (list != null && list.Count > 0)
                    {
                        if (cover)
                        {
                            foreach (tbDownloadColumn downloadColumn in list)
                            {
                                if (!downloadColumn.Attribute.Equals(attrids))
                                {
                                    downloadColumn.Attach();
                                    downloadColumn.Attribute = attrids;
                                    count += DbSession.Default.Save<tbDownloadColumn>(downloadColumn);
                                }
                            }
                        }
                        else
                        {
                            foreach (tbDownloadColumn downloadColumn in list)
                            {
                                string attr = downloadColumn.Attribute;
                                if (!attr.Equals(attrids))
                                {
                                    string[] arr = attrids.Split(',');
                                    StringBuilder sb = new StringBuilder(attr);
                                    attr = "," + attr + ",";
                                    bool isUpdate = false;
                                    foreach (string at in arr)
                                    {
                                        if (!attr.Contains("," + at + ","))
                                        {
                                            sb.Append("," + at);
                                            isUpdate = true;
                                        }
                                    }
                                    if (isUpdate)
                                    {
                                        downloadColumn.Attach();
                                        downloadColumn.Attribute = sb.ToString().Trim(',');
                                        count += DbSession.Default.Save<tbDownloadColumn>(downloadColumn);
                                    }
                                }
                            }
                        }
                    }
                }
                if (count > 0) {
                    NVEngine.Tools.NewTools.ClearCache("tbProductColumn");
                    AdminTools.InsertLog("批量" + (cover ? "替换" : "导入") + title, "分类属性，分类ID->“" + columnids + "”，属性ID->“" + attrids + "”", false, count, UI.BasePage.RequestActions.Update, -1);
                }
                WriteJson(true, count + "条记录更新成功！");
            }
            WriteJson(false, "更新失败！");
        }
        private void SetTemp()
        {
            string type = GF("type");
            string page = GF("page");
            string diretorie = GF("diretorie");
            string operation = GF("operation");
            string types = "|product|project|agent|help|news|download|";
            string operations = "|setDefault|setTemp|";
            bool isTrue = false;
            int r = -1;
            if (!string.IsNullOrEmpty(type) && !string.IsNullOrEmpty(page) && !string.IsNullOrEmpty(diretorie) && !string.IsNullOrEmpty(operation) && types.Contains("|" + type + "|") && operations.Contains("|" + operation + "|"))
            {
                string title = "";
                bool isMobile = false;
                bool isColumn = false;
                switch (page)
                {
                    case "nvtemps":
                        title = "分类";
                        isColumn = true;
                        break;
                    case "detailedpagetemps":
                        title = "详细页";
                        break;
                    case "mobilenvtemps":
                        title = "手机分类";
                        isMobile = true;
                        isColumn = true;
                        break;
                    case "mobiledetailedpagetemps":
                        title = "手机详细页";
                        isMobile = true;
                        break;
                }
                if (!string.IsNullOrEmpty(title))
                {
                    try
                    {
                        //设置默认
                        if (operation.Equals("setDefault"))
                        {
                            if (isColumn)
                            {
                                if (isMobile)
                                {
                                    NVEngine.Tools.NewTools.SaveMobileGlobal(type + "diretorie", diretorie);
                                    isTrue = true;
                                }
                                else
                                {
                                    NVEngine.Tools.NewTools.SetAppWebConfig(type + "diretorie", diretorie);
                                    isTrue = true;
                                }
                            }
                            else
                            {
                                NSW.Web.API.ColumnType columnType = NVTools.Tools.GetColumnType(type);
                                if (isMobile)
                                {
                                    NVEngine.Tools.NewTools.SaveMobileGlobal(columnType + "TemplatePath", diretorie);
                                    isTrue = true;
                                }
                                else
                                {
                                    NVEngine.Tools.NewTools.SetAppWebConfig(columnType + "TemplatePath", diretorie);
                                    isTrue = true;
                                }
                            }
                        }
                        else {
                            //统一更新为该模板
                            int columnid = NSW.ComUtls.ParseInt(GF("columnid"), -1);
                            NSW.Web.API.ColumnType columnType = NVTools.Tools.GetColumnType(type);
                            string sp = "#$$#";
                            if (columnid > 0)
                            {
                                DataTable dt = DbSession.Default.FromSql(string.Format("select DetaiPageURL as TempPath from tb{0} where DetaiPageURL Not Like'{1}' and ColumnID={2} Group By DetaiPageURL", columnType, isMobile ? "%" + sp + diretorie : diretorie + "%", columnid)).ToDataTable();
                                if (dt.Rows.Count > 0) {
                                    List<string[]> List = new List<string[]>();
                                    foreach (DataRow row in dt.Rows)
                                    {
                                        string TempPath = row["TempPath"].ToString();
                                        string[] arr = new string[3] { TempPath, "", "" };
                                        string[] temps = null;
                                        if (!string.IsNullOrEmpty(TempPath) && (temps = NSW.Utls.StringUtls.Split(TempPath, sp)) != null && TempPath.Length > 0)
                                        {
                                            arr[1] = temps[0];
                                            if (temps.Length > 1)
                                            {
                                                arr[2] = temps[1];
                                            }
                                        }
                                        if (isMobile)
                                        {
                                            arr[2] = diretorie;
                                        }
                                        else
                                        {
                                            arr[1] = diretorie;
                                        }
                                        List.Add(arr);
                                    }
                                    
                                    StringBuilder sb = new StringBuilder();
                                    string update = string.Format("update tb{0} set DetaiPageURL='#UpdateTemp#' where DetaiPageURL='#CurTemp#' and ColumnID={1}\r\n", columnType, columnid);
                                    foreach (string[] temps in List)
                                    {
                                        sb.Append(update.Replace("#UpdateTemp#", temps[1] + sp + temps[2]).Replace("#CurTemp#", temps[0]));
                                    }
                                    if (sb.Length > 0)
                                    {
                                        r = DbSession.Default.Excute(sb.ToString());
                                    }
                                }
                                isTrue = true;
                            }
                            else
                            {
                                DataTable dt = DbSession.Default.FromSql(string.Format("select {3} as TempPath from tb{0}{1} where {3} Not Like'{2}' Group By {3}", columnType, isColumn ? "Column" : "", isMobile ? "%" + sp + diretorie : diretorie + "%", isColumn ? "TempPath" : "DetaiPageURL")).ToDataTable();
                                if (dt.Rows.Count > 0)
                                {
                                    List<string[]> List = new List<string[]>();
                                    foreach (DataRow row in dt.Rows)
                                    {
                                        string TempPath = row["TempPath"].ToString();
                                        string[] arr = new string[3] { TempPath, "", "" };
                                        string[] temps = null;
                                        if (!string.IsNullOrEmpty(TempPath) && (temps = NSW.Utls.StringUtls.Split(TempPath, sp)) != null && TempPath.Length > 0)
                                        {
                                            arr[1] = temps[0];
                                            if (temps.Length > 1)
                                            {
                                                arr[2] = temps[1];
                                            }
                                        }
                                        if (isMobile)
                                        {
                                            arr[2] = diretorie;
                                        }
                                        else
                                        {
                                            arr[1] = diretorie;
                                        }
                                        List.Add(arr);
                                    }
                                    StringBuilder sb = new StringBuilder();
                                    string update = string.Format("update tb{0}{1} set {2}='#UpdateTemp#' where {2}='#CurTemp#'\r\n", columnType, isColumn ? "Column" : "", isColumn ? "TempPath" : "DetaiPageURL");
                                    foreach (string[] temps in List)
                                    {
                                        sb.Append(update.Replace("#UpdateTemp#", temps[1] + sp + temps[2]).Replace("#CurTemp#", temps[0]));
                                    }
                                    if (sb.Length > 0)
                                    {
                                        r = DbSession.Default.Excute(sb.ToString());
                                    }
                                }
                                isTrue = true;
                            }
                        }  
                    }
                    catch (Exception ex) {
                        WriteJson(false,ex.Message);
                        return;
                    }
                }
            }
            if (isTrue)
            {
                WriteJson(isTrue, r > -1 ? "设置成功，" + r + "条数据更新成功！" : "设置成功！");
            }
            else {
                WriteJson(false, "更新失败！");
            }
        }
        private static Hashtable _ColumnListKetValueHashtable = null;
        /// <summary>
        /// 一些特殊的界面拼接分类链接的时候有问题，需要特殊处理下
        /// </summary>
        public static Hashtable ColumnListKetValueHashtable
        {
            get
            {
                if (_ColumnListKetValueHashtable == null)
                {
                    _ColumnListKetValueHashtable = new Hashtable();
                    _ColumnListKetValueHashtable.Add("new_column.aspx", "news_column.aspx");
                    //_ColumnListKetValueHashtable.Add("picture_column.aspx", "pictures.aspx");
                }
                return _ColumnListKetValueHashtable;
            }
        }
        /// <summary>
        /// 根据URL，获取分类的URL
        /// </summary>
        /// <returns></returns>
        private string GeColumnListPage()
        {
            if (HttpContext.Current.Request.UrlReferrer != null)
            {
                string url = HttpContext.Current.Request.UrlReferrer.AbsolutePath.ToLower();
                url = url.Substring(url.LastIndexOf('/') + 1);
                if (url.Contains("_column")) {
                    return url;
                }
                url = url.Replace(".aspx", string.Empty).TrimEnd('s') + "_column.aspx";
                if (ColumnListKetValueHashtable.ContainsKey(url)) {
                    return ColumnListKetValueHashtable[url] as string;
                }
                return url;
            }
            return string.Empty;
        }
        
        private void updateColumn()
        {
            int oid = ComUtls.ParseInt(GF("oid"), 0);//当前ID
            int pid = ComUtls.ParseInt(GF("pid"), 0);//其他数值
            int result = 0;
            string error = "修改失败，请稍后重试！";
            string typename = GF("typename");//类型
            string op = GF("op", "showtype");//操作
            if (typename == "marticlecolumn")
            {
                op = "mshowdetail";
            }
            string updateTemp = "update tb{0} set {3}={1} where id={2}";
            if (pid > 0 && oid > 0)
            {
                string url = string.Empty;
                if (!string.IsNullOrEmpty(typename))
                {
                    if (!CheckPermission(typename, BLL.Admin.AdminPermission.UpdatePermission))
                    {
                        WriteJson(false, "您没有权限！");
                        return;
                    }
                }
                else if (HttpContext.Current.Request.UrlReferrer != null)
                {
                    url = HttpContext.Current.Request.UrlReferrer.AbsolutePath;
                    url = url.Substring(url.LastIndexOf('/') + 1);
                    if (!CheckPermission(url, NSW.BLL.Admin.AdminPermission.UpdatePermission))
                    {
                        WriteJson(false, "您没有权限！");
                        return;
                    }
                }
                try
                {
                    string tips = GetTypeTitle(typename);
                    if (!string.IsNullOrEmpty(op) && !string.IsNullOrEmpty(typename))
                    {
                        switch (op) {
                            case "showtype":
                                result = DbSession.Default.Excute(string.Format(updateTemp, typename, pid, oid, op));
                                break;
                            case "mshowdetail":
                                result = DbSession.Default.Excute(string.Format(updateTemp, typename, pid, oid, op));
                                break;
                        }
                    }
                    if (result > 0)
                    {
                        AdminTools.InsertLog("修改" + tips, "ID：" + oid, true, result, UI.BasePage.RequestActions.Update, oid);
                        NVEngine.Tools.NewTools.ClearCache(typename);
                        error = "修改成功！";
                    }
                }
                catch (Exception e)
                {
                    error = e.Message;
                }
                WriteJson(result > 0, error);
            }
            else
            {
                WriteJson(false, "拉取记录出错！此记录是否已经被删除!");
            }
        }
        /// <summary>
        /// RightColumn控件
        /// </summary>
        private void RightColumn()
        {
            string url = GeColumnListPage();
            string oids = ClearGF("oids");
            string editsort = ClearGF("editsort").ToLower();
            string title = ClearGF("title").Replace("'", "''").Replace("└", "").Replace("├", "").Trim('-').Trim();
            string pageTitle = GetTypeTitle("") + "栏目";
            
            int oid = NSW.ComUtls.ParseInt(ClearGF("oid"), -1);
            bool isAdd = oid < 1;
            bool iseditsort = !string.IsNullOrEmpty(oids) && !string.IsNullOrEmpty(editsort);
            if (iseditsort) {
                isAdd = false;
            }
            if (oid == 1) {
                WriteJson(false, "根目录无法删除！");
                return;
            }
            
            string tabName = string.Empty;
            if (string.IsNullOrEmpty(url) || !CheckPermission(url, isAdd ? NSW.BLL.Admin.AdminPermission.InsertPermission : NSW.BLL.Admin.AdminPermission.UpdatePermission))
            {
                WriteJson(false, "您没有权限！");
                return;
            }
            if (!string.IsNullOrEmpty(tabName = GetTableName(url)))
            {
                if (isAdd)
                {
                    if (InsertHashtable.ContainsKey(tabName)) {
                        try
                        {
                            int rowsAffected = DbSession.Default.FromSql(string.Format(InsertHashtable[tabName].ToString() + ";select @@IDENTITY", title)).ToScalar<int>();
                            if (rowsAffected > 0)
                            {
                                AdminTools.InsertLog("添加" + pageTitle, title, true, rowsAffected, UI.BasePage.RequestActions.Insert, -1);
                                NVEngine.Tools.NewTools.ClearCache(tabName);
                                //NVEngine.Tools.NewTools.ClearCache(tabName.Replace("column", ""));
                                
                                Hashtable hash = new Hashtable();
                                hash["error"] = 1;
                                hash["oid"] = rowsAffected;
                                hash["msg"] = "添加" + pageTitle + "成功！";
                                
                                HttpContext.Current.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                                HttpContext.Current.Response.Write(JsonMapper.ToJson(hash));
                                HttpContext.Current.Response.Flush();
                                HttpContext.Current.Response.End();
                                return;
                            }
                            else {
                                WriteJson(false, "添加" + pageTitle + "失败！");
                                return;
                            }
                        }
                        catch (Exception ex) {
                            WriteJson(false, ex.Message);
                            return;
                        }
                    }
                }
                else
                {
                    if (iseditsort)
                    {
                        StringBuilder sb = new StringBuilder();
                        string[] idsArr = oids.Split(',');
                        int i = 1;
                        foreach (string id in idsArr)
                        {
                            if (!string.IsNullOrEmpty(id))
                            {
                                switch (editsort)
                                {
                                    case "inputtime":
                                        DateTime time = DateTime.Now.AddHours(i);
                                        sb.AppendLine(string.Format("update {0} set {1}='{2}' where id={3}", tabName, editsort, time.ToString("yyyy-MM-dd HH:mm:ss"), id));
                                        break;
                                }
                                i++;
                            }
                        }
                        if (sb.Length > 0) {
                            int rowsAffected = DbSession.Default.FromSql(sb.ToString()).Execute();
                            if (rowsAffected > 0)
                            {
                                WriteJson(true, "更新" + pageTitle + "成功！");
                                NVEngine.Tools.NewTools.ClearCache(tabName);
                                //NVEngine.Tools.NewTools.ClearCache(tabName.Replace("column", ""));
                            }
                        }
                    }
                    else
                    {
                        if (NSW.ComUtls.ParseBool(ClearGF("isdelete"), false))
                        {
                            if (!isAdd)
                            {
                                string delTemp = "delete from {0} Where ID={1}";
                                try
                                {
                                    int rowsAffected = DbSession.Default.Excute(string.Format(delTemp, tabName, oid));
                                    if (rowsAffected > 0)
                                    {
                                        AdminTools.InsertLog("删除" + pageTitle, title, true, rowsAffected, UI.BasePage.RequestActions.Delete, oid);
                                        NVEngine.Tools.NewTools.ClearCache(tabName);
                                        //NVEngine.Tools.NewTools.ClearCache(tabName.Replace("column", ""));

                                        WriteJson(true, "删除" + pageTitle + "成功！");
                                        return;
                                    }
                                    else
                                    {
                                        WriteJson(false, "删除" + pageTitle + "失败！");
                                        return;
                                    }
                                }
                                catch (Exception ex)
                                {
                                    WriteJson(false, ex.Message);
                                    return;
                                }
                            }
                        }
                        else
                        {
                            string updateTemp = "update {0} set Title='{1}' Where ID={2}";
                            switch (tabName)
                            {
                                default:
                                    try
                                    {
                                        int rowsAffected = DbSession.Default.Excute(string.Format(updateTemp, tabName, title, oid));
                                        if (rowsAffected > 0)
                                        {
                                            AdminTools.InsertLog("修改" + pageTitle, title, true, rowsAffected, UI.BasePage.RequestActions.Update, oid);
                                            NVEngine.Tools.NewTools.ClearCache(tabName);
                                            //NVEngine.Tools.NewTools.ClearCache(tabName.Replace("column", ""));
                                            WriteJson(true, "修改" + pageTitle + "成功！");
                                            return;
                                        }
                                        else
                                        {
                                            WriteJson(false, "修改" + pageTitle + "失败！");
                                            return;
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        WriteJson(false, ex.Message);
                                        return;
                                    }
                            }
                        }
                    }
                }
            }
            WriteJson(false, "参数错误！");
        }
        
        /// <summary>
        /// 批量添加admin
        /// </summary>
        private void BatchAddAdminUser()
        {
            string username = GF("username").Trim();
            string password = GF("password").Trim();
             if (!CheckPermission("admin", BLL.Admin.AdminPermission.InsertPermission))
            {
                WriteJson(false, "您没有权限添加数据！");
                return;
            }else if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password)) {
                WriteJson(false, "输入字符不能为空！");
                return;
            }
            if (DbSession.Default.Exists<tbAdmin>(tbAdmin._.UserName == username))
            {
                WriteJson(false, "用户名已存在，更新管理员失败。");
                return;
            }
            DateTime DateTimeNow = DateTime.Now;
            tbAdmin loginUser = DbSession.Default.Get<tbAdmin>(NSW.OSession.Admin.ID);
            tbAdmin admin = new tbAdmin();
            admin.UserName = username;
            admin.UserPassword = StringUtls.MD5(password);
            admin.LastIP = IP;
            admin.isSystem = false;
            admin.InputTime = DateTimeNow;
            admin.LastLogin = DateTimeNow;
            admin.ModelAuth = "1";
            admin.MPhone = admin.Question = admin.Answer = admin.ChnName = admin.Department = admin.ShortDesc = admin.UserEmail = "";
            admin.Authority = loginUser.Authority;
            admin.CurrentAuth = 1;
            admin.Enable = true;
            admin.UserLogins = 0;
            int rowsAffected= DbSession.Default.Save<tbAdmin>(admin);
            if (rowsAffected > 0)
            { WriteJson(true, "管理员“" + username + "”添加成功！"); }
            else { WriteJson(false, "管理员“" + username + "”添加失败！"); }
        }
        
        /// <summary>
        /// 检查模版是否已经存在
        /// </summary>
        private void CheckTemp() {
            string type = ClearGF("type").ToLower();
            int tempID = NSW.ComUtls.ParseInt(ClearGF("tempid"), -1);
            string path = ClearGF("page").ToLower();
            if (string.IsNullOrEmpty(path))
            {
                path = "nvtemps";
            }
            if (tempID > 0&&!string.IsNullOrEmpty(type)&&"|project|product|news|agent|help|".Contains(type)) {
                string tabName = string.Empty;
                string _path = HttpContext.Current.Server.MapPath(NVTools.NTools.GetTemplateByPage(path, NVTools.Tools.GetColumnType(type), tempID, ref tabName));
                
                if (System.IO.Directory.Exists(_path))
                {
                    WriteJson(true, "文件夹已存在");
                    return;
                }
                WriteJson(false, "文件夹不存在");
                return;
            }
            WriteJson(false, "参数错误");
            return;
        }

        private static Regex NumberRegex = new Regex("[1-9][0-9]*");
        /// <summary>
        /// 删除模板
        /// </summary>
        private void DelTemp()
        {
            string type = ClearGF("type").ToLower();
            string path = ClearGF("page").ToLower();
            string diretorie = ClearGF("diretorie").ToLower();
            if (!string.IsNullOrEmpty(type) && !string.IsNullOrEmpty(diretorie) && diretorie[0].Equals('v') && "|project|product|news|agent|help|".Contains(type))
            {
                string tabName = string.Empty;
                Match mc = NumberRegex.Match(diretorie);
                if (mc.Success)
                {
                    int tempID = NSW.ComUtls.ParseInt(mc.Groups[0].Value, -1);
                    if (tempID > 0) {
                        string _path = HttpContext.Current.Server.MapPath(NVTools.NTools.GetTemplateByPage(path, NVTools.Tools.GetColumnType(type), tempID, ref tabName));
                        if (System.IO.Directory.Exists(_path))
                        {
                            try
                            {
                                System.IO.Directory.Delete(_path, true);
                                WriteJson(true, "删除成功！");
                            }
                            catch (Exception e) {
                                WriteJson(false, e.Message);
                            }
                        }
                    }
                }
            }
            WriteJson(false, "参数错误");
        }
        
        
        /// <summary>
        /// 下载模版
        /// </summary>
        private void TemplateDownload() {
            string type = ClearGF("type").ToLower();
            int tempID = NSW.ComUtls.ParseInt(ClearGF("tempid"), -1);
            string path = ClearGF("page").ToLower();
            if (string.IsNullOrEmpty(path)) {
                path = "nvtemps";
            }
            if (tempID > 0 && !string.IsNullOrEmpty(type) && "|project|product|news|agent|help|".Contains(type))
            {
                NVTools.NTools.TemplateDownload(path, NVTools.Tools.GetColumnType(type), tempID);
                return;
            }
            WriteJson(false, "参数错误");
        }
        
        //删除文件
        private void DeleteFile(string file) {
            string path = string.Empty;
            if (System.IO.File.Exists((path = HttpContext.Current.Server.MapPath(file))))
            {
                if (path.EndsWith(".html"))
                {
                    System.IO.File.Delete(path);
                }

                //file = file.ToLower();
                //if (!file.EndsWith(".html"))
                //{
                //    DbSession.Default.From<tbPicture>().Where(tbPicture._.Path == file);
                //}
            }
        }
        
        //删除回收站
        private void recyclebin()
        {
            string type = ClearGF("type").Trim().ToLower(),
               cmd = QS("cmd").Trim().ToLower();
            int oid = NSW.ComUtls.ParseInt(ClearGF("oid").Trim(), -1);
            if (string.IsNullOrEmpty(type) || string.IsNullOrEmpty(cmd) || oid < 1) {
                WriteJson(false, "无效参数！");
                return;
            }
            if (cmd.Equals("completelyDelete") && !CheckPermission(type, BLL.Admin.AdminPermission.DelPermission))
            {
                WriteJson(false, "您没有权限删除！");
                return;
            }
            if (cmd.Equals("reduction") && !CheckPermission(type, BLL.Admin.AdminPermission.UpdatePermission))
            {
                WriteJson(false, "您没有权限修改！");
                return;
            }
            int rowsAffected = -1;
            string title = string.Empty;
            List<string> files = new List<string>();

            string tips = GetTypeTitle(type);
            if (cmd.Equals("completelydelete"))
            {
                switch (type)
                {
                    case "news":
                        tbNews news = DbSession.Default.Get<tbNews>(oid);
                        if (news!=null&&news.isDelete == true)
                        {
                            title = news.Title;
                            files.Add(news.PhotoPath);
                            files.Add(news.FirstPage);
                            files.Add(news.MobilePage);
                            files.Add(news.MobilePath);
                            rowsAffected = DbSession.Default.Delete(news);
                        }
                        break;
                    case "agent":
                        tbAgent agent = DbSession.Default.Get<tbAgent>(oid);
                        if (agent != null && agent.isDelete == true)
                        {
                            title = agent.Title;
                            files.Add(agent.PhotoPath);
                            files.Add(agent.FirstPage);
                            files.Add(agent.MobilePage);
                            files.Add(agent.MobilePath);
                            rowsAffected = DbSession.Default.Delete(agent);
                        }
                        break;
                    case "help":
                        tbHelp help = DbSession.Default.Get<tbHelp>(oid);
                        if (help != null && help.isDelete == true)
                        {
                            title = help.Title;
                            files.Add(help.PhotoPath);
                            files.Add(help.FirstPage);
                            files.Add(help.MobilePage);
                            files.Add(help.MobilePath);
                            rowsAffected = DbSession.Default.Delete(help);
                        }
                        break;
                    case "product":
                        tbProduct product = DbSession.Default.Get<tbProduct>(oid);
                        if (product != null && product.isDelete == true)
                        {
                            title = product.Title;
                            files.Add(product.PhotoPath);
                            files.Add(product.FirstPage);
                            files.Add(product.OtherPhotos);
                            files.Add(product.MobilePage);
                            files.Add(product.MobilePath);
                            rowsAffected = DbSession.Default.Delete(product);
                        }
                        break;
                    case "project":
                        tbProject project = DbSession.Default.Get<tbProject>(oid);
                        if (project != null && project.isDelete == true)
                        {
                            title = project.Title;
                            files.Add(project.PhotoPath);
                            files.Add(project.FirstPage);
                            files.Add(project.OtherPhotos);
                            files.Add(project.MobilePage);
                            files.Add(project.MobilePath);
                            rowsAffected = DbSession.Default.Delete(project);
                        }
                        break;
                    case "download":
                        tbDownload download = DbSession.Default.Get<tbDownload>(oid);
                        if (download != null && download.isDelete == true)
                        {
                            title = download.Title;
                            files.Add(download.PhotoPath);
                            files.Add(download.FirstPage);
                            files.Add(download.OtherPhotos);
                            files.Add(download.MobilePage);
                            //files.Add(download.MobilePath);
                            rowsAffected = DbSession.Default.Delete(download);
                        }
                        break;
                    default:
                        string tabs = NSW.OConfig.GlobalConfig.Get("DeleteTables");
                        string tab = "tb" + type;
                        if (tabs.Contains("|" + tab + "|")) {
                            title = tab + "_" + oid;
                            rowsAffected = DbSession.Default.Excute(string.Format("delete from {0} where IsDelete=1 and ID={1}", tab, oid));
                        }
                        break;
                }
                if (rowsAffected > 0)
                {
                    AdminTools.InsertLog("删除" + tips, title, true, rowsAffected, UI.BasePage.RequestActions.Delete, oid);
                    string path = string.Empty;
                    foreach (string file in files) {
                        if (!string.IsNullOrEmpty(file)) {
                            //$#$/uploadfiles/pictures/product/20150514190226_6544.jpg||1罗建刚$#$/uploadfiles/pictures/product/20150515091555_2968.jpg||1罗建刚$#$/uploadfiles/pictures/product/20150515091609_1406.jpg||1罗建刚$#$/uploadfiles/pictures/product/20150515140714_2656.jpg||1罗建刚$#$
                            if (file.IndexOf("||") > 0)
                            {
                                string[] arr = NSW.Utls.StringUtls.Split(file, "$#$");
                                if (arr != null && arr.Length > 0)
                                {
                                    foreach(string str in arr){
                                        if (!string.IsNullOrEmpty(str)) {
                                            string[] values = NSW.Utls.StringUtls.Split(str, "||");
                                            if (values != null && values.Length > 0) {
                                                DeleteFile(values[0]);
                                            }
                                        }
                                    }
                                }
                            }
                            else {
                                DeleteFile(file);
                            }
                        }
                    }
                    WriteJson(true, "彻底删除" + tips + "成功！");
                    return;
                }
                else {
                    WriteJson(false, "彻底删除" + tips + "成功！");
                    return;
                }
            }
            if (cmd.Equals("reduction"))
            {
                switch (type)
                {
                    case "news":
                        tbNews news = DbSession.Default.Get<tbNews>(oid);
                        if (news != null && news.isDelete == true)
                        {
                            title = news.Title;
                            news.Attach();
                            news.isDelete = false;
                            rowsAffected = DbSession.Default.Save<tbNews>(news);
                        }
                        break;
                    case "agent":
                        tbAgent agent = DbSession.Default.Get<tbAgent>(oid);
                        if (agent != null && agent.isDelete == true)
                        {
                            title = agent.Title;
                            agent.Attach();
                            agent.isDelete = false;
                            rowsAffected = DbSession.Default.Save<tbAgent>(agent);
                        }
                        break;
                    case "help":
                        tbHelp help = DbSession.Default.Get<tbHelp>(oid);
                        if (help != null && help.isDelete == true)
                        {
                            title = help.Title;
                            help.Attach();
                            help.isDelete = false;
                            rowsAffected = DbSession.Default.Save<tbHelp>(help);
                        }
                        break;
                    case "product":
                        tbProduct product = DbSession.Default.Get<tbProduct>(oid);
                        if (product != null && product.isDelete == true)
                        {
                            title = product.Title;
                            product.Attach();
                            product.isDelete = false;
                            rowsAffected = DbSession.Default.Save<tbProduct>(product);
                        }
                        break;
                    case "project":
                        tbProject project = DbSession.Default.Get<tbProject>(oid);
                        if (project != null && project.isDelete == true)
                        {
                            title = project.Title;
                            project.Attach();
                            project.isDelete = false;
                            rowsAffected = DbSession.Default.Save<tbProject>(project);
                        }
                        break;
                    case "download":
                        tbDownload download = DbSession.Default.Get<tbDownload>(oid);
                        if (download != null && download.isDelete == true)
                        {
                            title = download.Title;
                            download.Attach();
                            download.isDelete = false;
                            rowsAffected = DbSession.Default.Save<tbDownload>(download);
                        }
                        break;
                    default:
                        string tabs = NSW.OConfig.GlobalConfig.Get("DeleteTables");
                        string tab = "tb" + type;
                        if (tabs.Contains("|" + tab + "|")) {
                            title = tab + "_" + oid;
                            rowsAffected = DbSession.Default.Excute(string.Format("update {0} set IsDelete=0 where IsDelete=1 and ID={1}", tab, oid));
                        }
                        break;
                }
                if (rowsAffected > 0)
                {
                    AdminTools.InsertLog("还原" + tips, title, true, rowsAffected, UI.BasePage.RequestActions.Update, oid);
                    NVEngine.Tools.NewTools.ClearCache(type);
                    
                    WriteJson(true, "还原" + tips + "成功！");
                    return;
                }
                else {
                    WriteJson(false, "还原" + tips + "失败！");
                }
            }
            WriteJson(false, "无效参数！");
        }
        
        /// <summary>
        /// 删除帐号
        /// </summary>
        private void deladmin()
        {
            string ids = ClearGF("ids").Trim();
            string type = ClearGF("type").Trim().ToLower();

            if (!ComUtls.CheckIDsFormat(ids))
            {
                WriteJson(false, "数据格式化错误，请刷新后重试！");
                return;
            }

            else if (!CheckPermission(type, BLL.Admin.AdminPermission.DelPermission))
            {
                WriteJson(false, "您没有权限删除！");
                return;
            }
            string sqlWhere = string.Format("{0} IN({1}) AND [isSystem] <> 1", "ID", ids);

            int rowsAffected = DbSession.Default.Excute(string.Format("DELETE FROM FROM {0} WHERE {1}", "[tbAdmin]", sqlWhere));
            AdminTools.InsertLog("删除帐户", ids, false, rowsAffected, UI.BasePage.RequestActions.Delete, 0);
            //InsertLog(ItemName, "<i>null</i>", false, rowsAffected, RequestActions.Delete);
            WriteJson(true, "删除成功！");
            
        }
        
        /// <summary>
        /// 检查是否已有相似的
        /// </summary>
        /// <param name="hidfile">已存在的</param>
        /// <param name="sou">新的</param>
        /// <param name="type">product,productcolumn等等...</param>
        /// <returns></returns>
        private bool __CheckFile(string hidfile, string py, string type, string directory)
        {
            if (TypeTitle.ContainsKey(type) && !string.IsNullOrEmpty(py))
            {
                if (hidfile.Equals(py))
                {
                    return true;
                }
                if (type.EndsWith("column"))
                {
                    //分类
                    int i = DbSession.Default.Count<tbExpandURL>(tbExpandURL._.ExpandURL == py);
                    if (i == 0)
                    {
                        return true;
                    }
                }
                else {
                    //详细页
                    if ((type.Equals("marticle") || type.Equals("mproduct"))) //手机
                    {
                        directory = string.IsNullOrEmpty(directory) ? (type.Equals("marticle") ? "articles" : "products") : directory;
                        if (!directory.Contains("mobile"))
                        {
                            directory = "mobile/" + directory;
                        }
                    }
                    else
                    {  // pc
                        directory = string.IsNullOrEmpty(directory) ? (type.Equals("news") ? "article" : type + "s") : directory;
                    }
                    string path = "/" + directory + "/" + py + ".html";
                    if (!System.IO.File.Exists(HttpContext.Current.Server.MapPath(path)))
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        /*检查并且加_1*/
        /// <summary>
        /// 检查静态文件是否已经存在
        /// </summary>
        private void _CheckFile()
        {
            string hidfile = HttpUtility.UrlDecode(GetUrlParams("hidfile", ""));
            string py = HttpUtility.UrlDecode(GetUrlParams("py", ""));
            string type = GF("type").ToLower().Trim();
            int columnid = NSW.ComUtls.ParseInt(GF("columnid", "-1"), -1);
            string directory = string.Empty;
            if(columnid > 0 && !string.IsNullOrEmpty(type) && "|product|project|news|agent|help|download|marticle|mproduct|".Contains("|"+type+"|"))
            {
                DataRow row = NVTools.Tools.GetColumn(NVTools.Tools.GetColumnType(type), columnid);
                if (row != null)
                {
                    directory = row["Directory"].ToString().Trim('/');
                }
            }
            WriteJson(true, __CheckFile(hidfile, py, type, directory).ToString().ToLower());
        }

        //private static Regex Page = new Regex(@"^\S*(_(\d*))$");
        /// <summary>
        /// 检查静态文件是否已经存在,如果存在就+_1
        /// </summary>
        /// <param name="hidfile">原来的</param>
        /// <param name="py">新的</param>
        /// <param name="type">product,productcolumn等等...</param>
        /// <returns></returns>
        private string RecursiveFileName(string hidfile, string py, string type, string allpy, string directory)
        {
            if (__CheckFile(hidfile, py, type, directory))
            {
                return py;
            }
            if (allpy.Length > py.Length)
            {
                py = allpy.Substring(0, py.Length + 1);
            }
            else {
                Match mc = new Regex(@"^\S*(_(\d*))$").Match(py);
                int count = -1;
                if (mc.Success && mc.Groups.Count > 2 && (count = NSW.ComUtls.ParseInt(mc.Groups[2].Value.TrimStart('0'), count)) > 0)
                {
                    py = py.Replace(mc.Groups[1].Value, "_" + (count + 1).ToString().PadLeft(2, '0'));
                }
                else
                {
                    py += "_1";
                }
            }
            return RecursiveFileName(hidfile, py, type, allpy, directory);
        }

        private string GetRandom()
        {
            Random rn = new Random();
            int v = rn.Next(0, (int)Math.Pow(10, RMax));
            return v.ToString().PadLeft(RMax, '0');
        }

        private string RecursiveFileName_(string hidfile, string py, string type, string allpy, string directory)
        {
            if (__CheckFile(hidfile, py, type, directory))
            {
                return py;
            }
            if (allpy.Length > py.Length)
            {
                py = allpy.Substring(0, py.Length + 1);
            }
            else
            {
                Match mc = new Regex(@"\d+").Match(py);
                bool istrue = false;
                if (mc.Success)
                {
                    int v = NSW.ComUtls.ParseInt(mc.Value.Trim().TrimStart('0'), -1);
                    if (v > 0)
                    {
                        py = (v + 1).ToString().PadLeft(RMax, '0');
                        istrue = true;
                    }
                }
                if (!istrue)
                {
                    py += "1";
                }
            }
            return RecursiveFileName_(hidfile, py, type, allpy, directory);
        }
        
        /// <summary>
        /// 获取拼音
        /// </summary>
        private void GetPingYing()
        {
            string title = HttpUtility.UrlDecode(GetUrlParams("title", ""));
            string hidfile = HttpUtility.UrlDecode(GetUrlParams("hidfile", ""));
            string type = GF("type").ToLower().Trim();
            int pylength = NSW.ComUtls.ParseInt(GF("pylength"), 10);
            int columnid = NSW.ComUtls.ParseInt(GF("columnid", "-1"), -1);
            string directory = string.Empty;
            if (columnid > 0 && !string.IsNullOrEmpty(type) && "|product|project|news|agent|help|download|marticle|mproduct|".Contains("|" + type + "|"))
            {
                DataRow row = NVTools.Tools.GetColumn(NVTools.Tools.GetColumnType(type), columnid);
                if (row != null)
                {
                    directory = row["Directory"].ToString().Trim('/');
                }
            }
            if (TypeTitle.ContainsKey(type) && !string.IsNullOrEmpty(title))
            {
                string py = RMax > 0 ? GetRandom() : NSW.Admin.Tools.StrToPinyin.GetChineseSpell(title).Trim();
                string allpy = py;
                if (py.Length > pylength)
                {
                    py = py.Substring(0, pylength);
                }
                WriteJson(true, RMax > 0 ? RecursiveFileName_(hidfile, py, type, allpy, directory) : RecursiveFileName(hidfile, py, type, allpy, directory));
            }
            WriteJson(false, "无效参数！");
        }

        /// <summary>
        /// 清空日志
        /// </summary>
        private void emptylog()
        {
            string type = ClearGF("type").Trim().ToLower(),
                isbak = ClearGF("cmd").Trim().ToLower(),
                bakPath = "/UploadFiles/WebLog/" + DateTime.Now.ToString("yyyy-MM-dd") + ".csv";
            string AbsolutebakPath = IOUtls.GetMapPath(bakPath);
            if (isbak != "export" &&isbak != "del") //如果不是导出也不是删除
            {
                if (IOUtls.IsExist(AbsolutebakPath, IOUtls.FsoMethod.File))
                {
                    WriteJson(true, "");
                    return;
                }
                else
                {
                    WriteJson(false, "");
                    return;
                }
            }
            else if (isbak == "del")
            {
                //判断权限
                if (!CheckPermission(type, BLL.Admin.AdminPermission.DelPermission))
                {
                    WriteJson(false, "您没有权限删除！");
                    return;
                }
                //导出日志
                AbsolutebakPath = GetLogFile(bakPath);
                int rowsAffected = DbSession.Default.Delete<tbSystemLog>(new WhereClip(" 1=1 "));
                AdminTools.InsertLog("删除日志", "<i>清空表tbSystemLog</i>", false, rowsAffected, UI.BasePage.RequestActions.Delete,-1);
                WriteJson(true, bakPath);
                return;
            }
            else if (isbak == "export")
            {
                AbsolutebakPath = GetLogFile(bakPath);
                if (!string.IsNullOrEmpty(AbsolutebakPath))
                {
                    WriteJson(true, bakPath);
                    return;
                }      
            }
            WriteJson(false, "参数不正确或服务器内部错误！！");
        }
        
        /// <summary>
        /// 删除后并下载日志文件
        /// </summary>
        /// <param name="bakPath">路径</param>
        /// <returns></returns>
        private string GetLogFile(string bakPath)
        {
            bakPath = IOUtls.GetMapPath(bakPath);
            if (IOUtls.IsExist(bakPath, IOUtls.FsoMethod.File))//如果存在,可以删除,删除后并下载日志文件
            {
                return bakPath;
            }
            DataTable dt = DbSession.Default.From<tbSystemLog>().OrderBy(tbSystemLog._.ID.Desc).ToDataTable();
            string titlename = "序号,操作人,操作对象,具体操作,操作IP,操作时间";
            //string filedname = "ID,ColumnName,UserName,ShortDesc,LastIP,InputTime";
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(titlename);
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    sb.AppendLine(item["ID"].ToString() + "," +
                        item["UserName"].ToString() + "," +
                        item["ColumnName"].ToString() + "," +
                        //剔除换行,制表符,逗号
                        item["ShortDesc"].ToString().Replace("\r\n", "　　").Replace("\t\t", "　").Replace(",","，") + "," +
                        item["LastIP"].ToString() + "," +
                        item["InputTime"].ToString());
                }

                int pos = bakPath.LastIndexOf("\\");
                string file = bakPath.Substring(0, pos);
                if (!System.IO.Directory.Exists(file))
                {
                    System.IO.Directory.CreateDirectory(file);
                }

                System.IO.StreamWriter sw = new System.IO.StreamWriter(bakPath, true, Encoding.UTF8);
                sw.Write(sb.ToString());
                sw.Dispose();
                sw.Close();
                return bakPath;
            }
            return "";
        }
        
        /// <summary>
        /// 删除日志
        /// </summary>
        private void dellog()
        {
            string ids = ClearGF("ids").Trim();
            string type = ClearGF("type").Trim().ToLower();

            if (!ComUtls.CheckIDsFormat(ids))
            {
                WriteJson(false, "数据格式化错误，请刷新后重试！");
                return;
            }
            else if (!CheckPermission(type, BLL.Admin.AdminPermission.DelPermission))
            {
                WriteJson(false, "您没有权限删除！");
                return;
            }

            string sqlWhere = string.Format("{0} IN({1})", "ID", ids);

            int rowsAffected = DbSession.Default.Excute(string.Format("DELETE FROM {0} WHERE {1}", "[tbSystemLog]", sqlWhere));
            AdminTools.InsertLog("删除日志", ids, false, rowsAffected, UI.BasePage.RequestActions.Delete, 0);
            //InsertLog(ItemName, "<i>null</i>", false, rowsAffected, RequestActions.Delete);
            WriteJson(true, "删除成功！");
        }
        
        /// <summary>
        /// 删除
        /// </summary>
        private void Delete()
        {
            string type = GF("type").Trim().ToLower();
            int oid = NSW.ComUtls.ParseInt(GF("oid"), -1);
            if (oid < 1) {
                WriteJson(false, "无效参数！");
                return;
            }
            if (string.IsNullOrEmpty(type) || oid < 1)
            {
                WriteJson(false, "无效参数！");
                return;
            }
            List<string> imgs = new List<string>();

            if (type.EndsWith("column") && oid == 1) {
                WriteJson(false, "根目录无法删除！");
            }
            int rowsAffected = 0;
            string Title = string.Empty;
            string tips = GetTypeTitle(type);

            string url = string.Empty;
            string ExpandURL = string.Empty;
            if (!CheckPermission(type, BLL.Admin.AdminPermission.DelPermission))
            {
                WriteJson(false, "您没有权限删除！");
                return;
            }
            if (!string.IsNullOrEmpty(type))
            {
                switch (type)
                {
                    /*单篇*/
                    case "product":
                        tbProduct product = DbSession.Default.Get<tbProduct>(oid);
                        if (product == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        product.Attach();
                        product.DeleteTime = DateTime.Now;
                        product.isDelete = true;
                        Title = product.Title;
                        rowsAffected = DbSession.Default.Save<tbProduct>(product);
                        break;
                    case "project":
                        tbProject project = DbSession.Default.Get<tbProject>(oid);
                        if (project == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        project.Attach();
                        project.DeleteTime = DateTime.Now;
                        project.isDelete = true;
                        Title = project.Title;
                        rowsAffected = DbSession.Default.Save<tbProject>(project);
                        break;
                    case "news":
                        tbNews news = DbSession.Default.Get<tbNews>(oid);
                        if (news == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        news.Attach();
                        news.DeleteTime = DateTime.Now;
                        news.isDelete = true;
                        Title = news.Title;
                        rowsAffected = DbSession.Default.Save<tbNews>(news);
                        break;
                    case "agent":
                        tbAgent agent = DbSession.Default.Get<tbAgent>(oid);
                        if (agent == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        agent.Attach();
                        agent.DeleteTime = DateTime.Now;
                        agent.isDelete = true;
                        Title = agent.Title;
                        rowsAffected = DbSession.Default.Save<tbAgent>(agent);
                        break;
                    case "help":
                        tbHelp help = DbSession.Default.Get<tbHelp>(oid);
                        if (help == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        help.Attach();
                        help.DeleteTime = DateTime.Now;
                        help.isDelete = true;
                        Title = help.Title;
                        rowsAffected = DbSession.Default.Save<tbHelp>(help);
                        break;
                    case "download":
                        tbDownload download = DbSession.Default.Get<tbDownload>(oid);
                        if (download == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        download.Attach();
                        download.DeleteTime = DateTime.Now;
                        download.isDelete = true;
                        Title = download.Title;
                        rowsAffected = DbSession.Default.Save<tbDownload>(download);
                        break;

                    /*分类*/
                    case "productcolumn":
                        tbProductColumn productColumn = DbSession.Default.Get<tbProductColumn>(oid);
                        if (productColumn == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        ExpandURL = productColumn.ExpandURL;
                        Title = productColumn.Title;
                        rowsAffected = DbSession.Default.Delete<tbProductColumn>(productColumn);
                        DbSession.Default.Excute("update tbProduct set ColumnID=1 where ColumnID=" + productColumn.ID);
                        break;
                    case "projectcolumn":
                        tbProjectColumn projectcolumn = DbSession.Default.Get<tbProjectColumn>(oid);
                        if (projectcolumn == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        ExpandURL = projectcolumn.ExpandURL;
                        Title = projectcolumn.Title;
                        rowsAffected = DbSession.Default.Delete<tbProjectColumn>(projectcolumn);
                        DbSession.Default.Excute("update tbProject set ColumnID=1 where ColumnID=" + projectcolumn.ID);
                        break;
                    case "newscolumn":
                        tbNewsColumn newscolumn = DbSession.Default.Get<tbNewsColumn>(oid);
                        if (newscolumn == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        ExpandURL = newscolumn.ExpandURL;
                        Title = newscolumn.Title;
                        rowsAffected = DbSession.Default.Delete<tbNewsColumn>(newscolumn);
                        DbSession.Default.Excute("update tbNews set ColumnID=1 where ColumnID=" + newscolumn.ID);
                        break;
                    case "helpcolumn":
                        tbHelpColumn helpcolumn = DbSession.Default.Get<tbHelpColumn>(oid);
                        if (helpcolumn == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        ExpandURL = helpcolumn.ExpandURL;
                        Title = helpcolumn.Title;
                        rowsAffected = DbSession.Default.Delete<tbHelpColumn>(helpcolumn);
                        DbSession.Default.Excute("update tbHelp set ColumnID=1 where ColumnID=" + helpcolumn.ID);
                        break;
                    case "agentcolumn":
                        tbAgentColumn agentcolumn = DbSession.Default.Get<tbAgentColumn>(oid);
                        if (agentcolumn == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        ExpandURL = agentcolumn.ExpandURL;
                        Title = agentcolumn.Title;
                        rowsAffected = DbSession.Default.Delete<tbAgentColumn>(agentcolumn);
                        DbSession.Default.Excute("update tbAgent set ColumnID=1 where ColumnID=" + agentcolumn.ID);
                        break;
                    case "downloadcolumn":
                        tbDownloadColumn downloadcolumn = DbSession.Default.Get<tbDownloadColumn>(oid);
                        if (downloadcolumn == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        ExpandURL = downloadcolumn.ExpandURL;
                        Title = downloadcolumn.Title;
                        rowsAffected = DbSession.Default.Delete<tbDownloadColumn>(downloadcolumn);
                        DbSession.Default.Excute("update tbDownload set ColumnID=1 where ColumnID=" + downloadcolumn.ID);
                        break;
                    case "productattributecolumn":
                        tbProductAttributeColumn productattributecolumn = DbSession.Default.Get<tbProductAttributeColumn>(oid);
                        if (productattributecolumn == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        Title = productattributecolumn.Title;
                        rowsAffected = DbSession.Default.Delete<tbProductAttributeColumn>(productattributecolumn);
                        break;
                    case "projectattributecolumn":
                        tbProjectAttributeColumn projectattributecolumn = DbSession.Default.Get<tbProjectAttributeColumn>(oid);
                        if (projectattributecolumn == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        Title = projectattributecolumn.Title;
                        rowsAffected = DbSession.Default.Delete<tbProjectAttributeColumn>(projectattributecolumn);
                        break;
                    case "admin_systemmenu":
                        if (oid == 1) {
                            WriteJson(false, tips + "根目录不能删！");
                            return;
                        }
                        tbSystemMenu men = DbSession.Default.Get<tbSystemMenu>(oid);
                        if (men == null)
                        {
                            WriteJson(false, tips + "不存在！");
                            return;
                        }
                        Title = men.Title;
                        rowsAffected = DbSession.Default.Delete<tbSystemMenu>(men);
                        break;
                    //孵化/case "mproductcolumn":
                    //孵化/    tbMProductColumn mproductColumn = DbSession.Default.Get<tbMProductColumn>(oid);
                    //孵化/    if (mproductColumn == null)
                    //孵化/    {
                    //孵化/        WriteJson(false, tips + "不存在！");
                    //孵化/        return;
                    //孵化/    }
                    //孵化/    ExpandURL = mproductColumn.ExpandURL;
                    //孵化/    Title = mproductColumn.Title;
                    //孵化/    rowsAffected = DbSession.Default.Delete<tbMProductColumn>(mproductColumn);
                    //孵化/    DbSession.Default.Excute("update tbMProduct set ColumnID=1 where ColumnID=" + mproductColumn.ID);
                    //孵化/    break;
                    //孵化/case "marticlecolumn":
                    //孵化/    tbMArticleColumn marticleColumn = DbSession.Default.Get<tbMArticleColumn>(oid);
                    //孵化/    if (marticleColumn == null)
                    //孵化/    {
                    //孵化/        WriteJson(false, tips + "不存在！");
                    //孵化/        return;
                    //孵化/    }
                    //孵化/    ExpandURL = marticleColumn.ExpandURL;
                    //孵化/    Title = marticleColumn.Title;
                    //孵化/    rowsAffected = DbSession.Default.Delete<tbMArticleColumn>(marticleColumn);
                    //孵化/    DbSession.Default.Excute("update tbMArticle set ColumnID=1 where ColumnID=" + marticleColumn.ID);
                    //孵化/    break;
                }
            }
            else {
                if (!string.IsNullOrEmpty(url) && !string.IsNullOrEmpty(type = GetTableName(url)))
                {
                    rowsAffected = DbSession.Default.Excute(string.Format("delete from {0} where id={1}", type, oid));
                }
            }
            if (rowsAffected > 0)
            {
                if (!string.IsNullOrEmpty(ExpandURL))
                {
                    DbSession.Default.Delete<tbExpandURL>(tbExpandURL._.ExpandURL == ExpandURL);
                }
                AdminTools.InsertLog("删除" + tips, Title, true, rowsAffected, UI.BasePage.RequestActions.Delete, oid);
                NVEngine.Tools.NewTools.ClearCache(type);
                WriteJson(true, "删除" + tips + "成功！");
            }
            else {
                WriteJson(false, "删除" + tips + "失败，请稍后重试！");
            }
            WriteJson(false, "参数错误！");
        }
        
        /// <summary>
        /// 详细批量添加扩展分类
        /// </summary>
        private void ExtensionClassification()
        {
            string ids = GF("ids").TrimEnd(',');
            string type = GF("typename").ToLower();
            string cid = GF("cid");
            int ColumnID = 0;
            if (AdminTools.CheckSIDFormat(cid))
            {
                ColumnID = AdminTools.GetColumnIDBySID(cid);
            }
            else
            {
                ColumnID = NSW.ComUtls.ParseInt(cid, -1);
            }
            if (string.IsNullOrEmpty(type) || string.IsNullOrEmpty(ids) || ColumnID < 1) {
                WriteJson(false, "参数错误！");
                return;
            }
            int max = 0;
            if (!CheckPermission(type, BLL.Admin.AdminPermission.UpdatePermission))
            {
                WriteJson(false, "您没有修改权限！");
                return;
            }
            
            string tips = GetTypeTitle(type);
            switch (type) {
                case "product": max = DbSession.Default.Excute(string.Format("update tbProduct set OtherColumns=Replace(OtherColumns+'{0}'+'$$','$$$$','$$') where OtherColumns not like'%$${0}$$%' and id in({1})", ColumnID, ids)); break;
                case "project": max = DbSession.Default.Excute(string.Format("update tbProject set OtherColumns=Replace(OtherColumns+'{0}'+'$$','$$$$','$$') where OtherColumns not like'%$${0}$$%' and id in({1})", ColumnID, ids)); break;
            }
            if (max > 0)
            {
                AdminTools.InsertLog("批量添加" + tips + "扩展分类", ids, false, max, UI.BasePage.RequestActions.Update, -1);
                NVEngine.Tools.NewTools.ClearCache(type);
                
                WriteJson(true, max + "条产品更新了扩展分类！");
            }
            else {
                WriteJson(false, "无可更新产品！");
            }
        }
        private void MassTransfer() {
            string ids = GF("ids").TrimEnd(',').Replace(";", "").Replace("'", "").Replace("\r\n", "").Replace("go", "");
            string cid = GF("cid");
            int ColumnID = 0;
            if (AdminTools.CheckSIDFormat(cid))
            {
                ColumnID = AdminTools.GetColumnIDBySID(cid);
            }
            else
            {
                ColumnID = NSW.ComUtls.ParseInt(cid, -1);
            }
            if (string.IsNullOrEmpty(ids) || ColumnID < 1)
            {
                WriteJson(false, "参数错误！");
                return;
            }

            int max = 0;
            string url = HttpContext.Current.Request.UrlReferrer.AbsolutePath;
            url = url.Substring(url.LastIndexOf('/') + 1);
            if (!CheckPermission(url, NSW.BLL.Admin.AdminPermission.UpdatePermission))
            {
                WriteJson(false, "您没有权限！");
                return;
            }
            string tabName = GetTableName(url);
            if (!string.IsNullOrEmpty(tabName)) {
                object s = DbSession.Default.FromSql(string.Format("select top 1 ID from {0}Column where ID={1}", tabName, ColumnID)).ToScalar();
                if (s != null)
                {
                    max = DbSession.Default.Excute(string.Format("update {0} set ColumnID={1} where ID in({2})", tabName, s, ids));
                }
            }
            if (max > 0) {
                AdminTools.InsertLog("批量转移" + tabName + "分类", ids, false, max, UI.BasePage.RequestActions.Update, ColumnID);
                NVEngine.Tools.NewTools.ClearCache(tabName);
                WriteJson(true, max + "条记录更新成功！");
                return;
            }
            WriteJson(false, "参数错误！");
        }
        /// <summary>
        /// 详细批量取消扩展分类
        /// </summary>
        private void CancelExtensionClassification()
        {
            string ids = GF("ids").TrimEnd(',');
            string type = GF("typename").ToLower();
            string cid = GF("cid");
            int ColumnID = 0;
            if (AdminTools.CheckSIDFormat(cid))
            {
                ColumnID = AdminTools.GetColumnIDBySID(cid);
            }
            else
            {
                ColumnID = NSW.ComUtls.ParseInt(cid, -1);
            }
            if (string.IsNullOrEmpty(type) || string.IsNullOrEmpty(ids) || ColumnID < 1)
            {
                WriteJson(false, "参数错误！");
                return;
            }
            int max = 0;
            if (!CheckPermission(type, BLL.Admin.AdminPermission.UpdatePermission))
            {
                WriteJson(false, "您没有权限修改！");
                return;
            }

            string tips = GetTypeTitle(type);
            switch (type)
            {
                case "product": max = DbSession.Default.Excute(string.Format("update tbProduct set OtherColumns=Replace(OtherColumns,'$${0}$$','$$')  where OtherColumns like'%$${0}$$%' and id in({1})", ColumnID, ids)); break;
                case "project": max = DbSession.Default.Excute(string.Format("update tbProject set OtherColumns=Replace(OtherColumns,'$${0}$$','$$') where OtherColumns like'%$${0}$$%' and id in({1})", ColumnID, ids)); break;
            }
            if (max > 0)
            {
                AdminTools.InsertLog("批量取消" + tips + "扩展分类", ids, false, max, UI.BasePage.RequestActions.Update, -1);
                NVEngine.Tools.NewTools.ClearCache(type);
                
                WriteJson(true, max + "条产品取消了扩展分类！");
            }
            else
            {
                WriteJson(false, "无可更新产品！");
            }
        }
        
        /// <summary>
        /// 分类批量转移分类
        /// </summary>
        private void BatchTransferColumn()
        {
            string type = GF("typename").ToLower();
            string cid = GF("cid");
            string columns = GF("columns").Replace("'", "”");
            
            int ColumnID = -1;
            string[] arr = null;
            if (AdminTools.CheckSIDFormat(cid))
            {
                ColumnID = AdminTools.GetColumnIDBySID(cid);
            }
            else
            {
                ColumnID = NSW.ComUtls.ParseInt(cid, -1);
            }
            if (ColumnID > 0 && !string.IsNullOrEmpty(columns) && (arr = ComUtls.SplitByEnter(columns)) != null && arr.Length > 0)
            {
                if (!CheckPermission(type, BLL.Admin.AdminPermission.UpdatePermission))
                {
                    WriteJson(false, "您没有权限修改！");
                    return;
                }
                string sql = string.Empty;
                int max = 0;
                string sid = string.Empty;
                string ids = string.Empty;
                string tips = GetTypeTitle(type);
                try
                {
                    switch (type)
                    {
                        /*分类处理*/
                        case "productcolumn":
                            VW_ProductColumn productColumn = DbSession.Default.From<VW_ProductColumn>().Where(VW_ProductColumn._.ID == ColumnID).Select(VW_ProductColumn._.sid, VW_ProductColumn._.ID).ToFirst();
                            if (productColumn == null)
                            {
                                throw new Exception("分类不存在！");
                            }
                            List<tbProductColumn> tbProductColumns = DbSession.Default.From<tbProductColumn>().Where(tbProductColumn._.Enable == true && tbProductColumn._.Title.In(arr)).ToList<tbProductColumn>() as List<tbProductColumn>;
                            sid = "," + productColumn.sid + ",";
                            ids = "";
                            foreach (tbProductColumn pColumn in tbProductColumns)
                            {
                                if (!sid.Contains("," + pColumn.ID.ToString().PadLeft(4, '0') + ",")) {
                                    ids += pColumn.ID + ",";
                                }
                            }
                            ids = ids.Trim(',');
                            if (!string.IsNullOrEmpty(ids)) {
                                max = DbSession.Default.Excute(string.Format("updata tbProductColumn set ParentID={0} where ID in({1})", productColumn.ID, ids));
                            }
                            break;
                        case "projectcolumn":
                            VW_ProjectColumn projectColumn = DbSession.Default.From<VW_ProjectColumn>().Where(VW_ProjectColumn._.ID == ColumnID).Select(VW_ProjectColumn._.sid, VW_ProjectColumn._.ID).ToFirst();
                            if (projectColumn == null)
                            {
                                throw new Exception("分类不存在！");
                            }
                            List<tbProjectColumn> tbProjectColumns = DbSession.Default.From<tbProjectColumn>().Where(tbProjectColumn._.Enable == true && tbProjectColumn._.Title.In(arr)).ToList<tbProjectColumn>() as List<tbProjectColumn>;
                            sid = "," + projectColumn.sid + ",";
                            ids = "";
                            foreach (tbProjectColumn pColumn in tbProjectColumns)
                            {
                                if (!sid.Contains("," + pColumn.ID.ToString().PadLeft(4, '0') + ",")) {
                                    ids += pColumn.ID + ",";
                                }
                            }
                            ids = ids.Trim(',');
                            if (!string.IsNullOrEmpty(ids)) {
                                max = DbSession.Default.Excute(string.Format("updata tbProjectColumn set ParentID={0} where ID in({1})", projectColumn.ID, ids));
                            }
                            break;
                        case "newscolumn":
                            VW_NewsColumn newscolumn = DbSession.Default.From<VW_NewsColumn>().Where(VW_NewsColumn._.ID == ColumnID).Select(VW_NewsColumn._.sid, VW_NewsColumn._.ID).ToFirst();
                            if (newscolumn == null)
                            {
                                throw new Exception("分类不存在！");
                            }
                            List<tbNewsColumn> newscolumns = DbSession.Default.From<tbNewsColumn>().Where(tbNewsColumn._.Enable == true && tbNewsColumn._.Title.In(arr)).ToList<tbNewsColumn>() as List<tbNewsColumn>;
                            sid = "," + newscolumn.sid + ",";
                            ids = "";
                            foreach (tbNewsColumn pColumn in newscolumns)
                            {
                                if (!sid.Contains("," + pColumn.ID.ToString().PadLeft(4, '0') + ","))
                                {
                                    ids += pColumn.ID + ",";
                                }
                            }
                            ids = ids.Trim(',');
                            if (!string.IsNullOrEmpty(ids))
                            {
                                max = DbSession.Default.Excute(string.Format("updata tbNewsColumn set ParentID={0} where ID in({1})", newscolumn.ID, ids));
                            }
                            break;
                        case "helpcolumn":
                            VW_HelpColumn helpcolumn = DbSession.Default.From<VW_HelpColumn>().Where(VW_HelpColumn._.ID == ColumnID).Select(VW_HelpColumn._.sid, VW_HelpColumn._.ID).ToFirst();
                            if (helpcolumn == null)
                            {
                                throw new Exception("分类不存在！");
                            }
                            List<tbHelpColumn> helpcolumns = DbSession.Default.From<tbHelpColumn>().Where(tbHelpColumn._.Enable == true && tbHelpColumn._.Title.In(arr)).ToList<tbHelpColumn>() as List<tbHelpColumn>;
                            sid = "," + helpcolumn.sid + ",";
                            ids = "";
                            foreach (tbHelpColumn pColumn in helpcolumns)
                            {
                                if (!sid.Contains("," + pColumn.ID.ToString().PadLeft(4, '0') + ","))
                                {
                                    ids += pColumn.ID + ",";
                                }
                            }
                            ids = ids.Trim(',');
                            if (!string.IsNullOrEmpty(ids))
                            {
                                max = DbSession.Default.Excute(string.Format("updata tbHelpColumn set ParentID={0} where ID in({1})", helpcolumn.ID, ids));
                            }
                            break;
                        case "agentcolumn":
                            VW_AgentColumn agentcolumn = DbSession.Default.From<VW_AgentColumn>().Where(VW_AgentColumn._.ID == ColumnID).Select(VW_AgentColumn._.sid, VW_AgentColumn._.ID).ToFirst();
                            if (agentcolumn == null)
                            {
                                throw new Exception("分类不存在！");
                            }
                            List<tbAgentColumn> agentcolumns = DbSession.Default.From<tbAgentColumn>().Where(tbAgentColumn._.Enable == true && tbAgentColumn._.Title.In(arr)).ToList<tbAgentColumn>() as List<tbAgentColumn>;
                            sid = "," + agentcolumn.sid + ",";
                            ids = "";
                            foreach (tbAgentColumn pColumn in agentcolumns)
                            {
                                if (!sid.Contains("," + pColumn.ID.ToString().PadLeft(4, '0') + ","))
                                {
                                    ids += pColumn.ID + ",";
                                }
                            }
                            ids = ids.Trim(',');
                            if (!string.IsNullOrEmpty(ids))
                            {
                                max = DbSession.Default.Excute(string.Format("updata tbAgentColumn set ParentID={0} where ID in({1})", agentcolumn.ID, ids));
                            }
                            break;
                        case "downloadcolumn":
                            VW_DownloadColumn downloadcolumn = DbSession.Default.From<VW_DownloadColumn>().Where(VW_DownloadColumn._.ID == ColumnID).Select(VW_DownloadColumn._.sid, VW_DownloadColumn._.ID).ToFirst();
                            if (downloadcolumn == null)
                            {
                                throw new Exception("分类不存在！");
                            }
                            List<tbDownloadColumn> downloadcolumns = DbSession.Default.From<tbDownloadColumn>().Where(tbDownloadColumn._.Enable == true && tbDownloadColumn._.Title.In(arr)).ToList<tbDownloadColumn>() as List<tbDownloadColumn>;
                            sid = "," + downloadcolumn.sid + ",";
                            ids = "";
                            foreach (tbDownloadColumn pColumn in downloadcolumns)
                            {
                                if (!sid.Contains("," + pColumn.ID.ToString().PadLeft(4, '0') + ","))
                                {
                                    ids += pColumn.ID + ",";
                                }
                            }
                            ids = ids.Trim(',');
                            if (!string.IsNullOrEmpty(ids))
                            {
                                max = DbSession.Default.Excute(string.Format("updata tbDownloadColumn set ParentID={0} where ID in({1})", downloadcolumn.ID, ids));
                            }
                            break;
                    }

                    if (max > 0)
                    {
                        columns = columns.Replace(",", "，").Replace("\r\n", ",").Replace("\n", ",").Replace(",,", ",");
                        AdminTools.RemoveCache<DataTable>("SelectRelevant" + type.Replace("column", "").Replace("tb", ""));
                        AdminTools.InsertLog("批量转移" + tips, columns, false, max, UI.BasePage.RequestActions.Update, -1);
                        NVEngine.Tools.NewTools.ClearCache(type);
                        
                        WriteJson(true, "批量转移了" + max + "个" + tips);
                    }
                    else {
                        WriteJson(false, "没有可更新数据...");
                    }
                }
                catch (Exception ex)
                {
                    WriteJson(false, ex.Message);
                }
            }
            WriteJson(false, "参数错误！");
        }

        //public static Regex IllegalRegex = new Regex("[^a-zA-Z0-9\u4e00-\u9fa5]");
        /// <summary>
        /// 批量添加分类
        /// </summary>
        private void BatchAddColumn()
        {
            string type = GF("typename").ToLower();
            string cid = GF("cid");
            string columns = GF("columns").Replace("'", "“").Replace(";", "").Trim();
            string mode = GF("mode");//单行模式、多行模式
            
            int ColumnID = -1;
            string[] arr = null;
            
            if (AdminTools.CheckSIDFormat(cid))
            {
                ColumnID = AdminTools.GetColumnIDBySID(cid);
            }
            else {
                ColumnID = NSW.ComUtls.ParseInt(cid, -1);
            }
            
            if (ColumnID>0 && !string.IsNullOrEmpty(columns) && (arr = ComUtls.SplitByEnter(columns))!=null&&arr.Length>0)
            {
                if (!CheckPermission(type, BLL.Admin.AdminPermission.InsertPermission))
                {
                    WriteJson(false, "您没有权限添加！");
                    return;
                }
                int max = 0;
                string temp = string.Empty;

                string tips = GetTypeTitle(type);
                try
                {
                    switch (type)
                    {
                        case "productcolumn":
                            tbProductColumn productColumn = DbSession.Default.Get<tbProductColumn>(ColumnID);
                            if (productColumn == null)
                            {
                                throw new Exception(tips + "不存在！");
                            }
                            temp = OConfig.Common.ProductHtmlTargetPath;
                            break;
                        case "projectcolumn":
                            tbProjectColumn projectcolumn = DbSession.Default.Get<tbProjectColumn>(ColumnID);
                            if (projectcolumn == null)
                            {
                                throw new Exception(tips + "不存在！");
                            }
                            temp = OConfig.Common.ProjectHtmlTargetPath;
                            break;
                        case "newscolumn":
                            tbNewsColumn newscolumn = DbSession.Default.Get<tbNewsColumn>(ColumnID);
                            if (newscolumn == null)
                            {
                                throw new Exception(tips + "不存在！");
                            }
                            temp = OConfig.Common.NewsHtmlTargetPath;
                            break;
                        case "helpcolumn":
                            tbHelpColumn helpcolumn = DbSession.Default.Get<tbHelpColumn>(ColumnID);
                            if (helpcolumn == null)
                            {
                                throw new Exception(tips + "不存在！");
                            }
                            temp = OConfig.Common.HelpHtmlTargetPath;
                            break;
                        case "agentcolumn":
                            tbAgentColumn agentcolumn = DbSession.Default.Get<tbAgentColumn>(ColumnID);
                            if (agentcolumn == null)
                            {
                                throw new Exception(tips + "不存在！");
                            }
                            temp = OConfig.Common.AgentHtmlTargetPath;
                            break;
                        case "downloadcolumn":
                            tbDownloadColumn downloadcolumn = DbSession.Default.Get<tbDownloadColumn>(ColumnID);
                            if (downloadcolumn == null)
                            {
                                throw new Exception(tips + "不存在！");
                            }
                            temp = OConfig.Common.DownLoadHtmlTargetPath;
                            break;
                        case "mproductcolumn":
                            //孵化/tbMProductColumn mproductColumn = DbSession.Default.Get<tbMProductColumn>(ColumnID);
                            //孵化/if (mproductColumn == null)
                            //孵化/{
                            //孵化/    throw new Exception(tips + "不存在！");
                            //孵化/}
                            //孵化/temp = OConfig.Common.ProductHtmlTargetPath;
                            //孵化/break;
                        case "marticlecolumn":
                            //孵化/tbMArticleColumn marticlecolumn = DbSession.Default.Get<tbMArticleColumn>(ColumnID);
                            //孵化/if (marticlecolumn == null)
                            //孵化/{
                            //孵化/    throw new Exception(tips + "不存在！");
                            //孵化/}
                            //temp = OConfig.Common.NewsHtmlTargetPath;
                            break;
                    }

                    string InsertTemp = ColumnSqlTemp[type] as string;
                    if (!string.IsNullOrEmpty(InsertTemp))
                    {
                        StringBuilder sb = new StringBuilder();

                        bool isColumn = type.EndsWith("column");
                        bool isTrue = true;
                        Regex IllegalRegex = new Regex("[^a-zA-Z0-9\u4e00-\u9fa5]");
                        foreach (string title in arr)
                        {
                            string title_ = title.Trim();
                            if (!string.IsNullOrEmpty(title_))
                            {
                                if (isColumn)
                                {
                                    if (isTrue) {
                                        sb.AppendLine("declare @id int");
                                        isTrue = false;
                                    }
                                    string dic = type.Replace("column",string.Empty);
                                    if (RMax < 1)
                                    {
                                        bool isSpelling = NVEngine.Tools.NewTools.GetAppWebConfig("Spelling").Equals("true");
                                        if (isSpelling)
                                        {
                                            InsertTemp = InsertTemp.Replace("dbo.procGetPY('{5}',10)", "dbo.procGetPinYin('{5}')");
                                        }
                                    }
                                    else {
                                        InsertTemp = InsertTemp.Replace("dbo.procGetPY('{5}',10)", "'" + GetRandom() + "'");
                                    }
                                    string def = NVEngine.Tools.NewTools.GetAppWebConfig(dic + "diretorie");
                                    if (string.IsNullOrEmpty(def)) {
                                        def = dic + "01";
                                    }
                                    sb.AppendFormat(InsertTemp + "\r\n", title_, AdminTools.GetColumnIDBySID(cid), dic, temp, def, IllegalRegex.Replace(title_, string.Empty));
                                    sb.AppendLine("select @id = @@IDENTITY");
                                    //sb.AppendFormat("INSERT INTO [dbo].[tbExpandURL](SID,ExpandURL,ColumnName,UrlType,InputTime,ColumnID,ParsePage,MParsePage) SELECT SID,ExpandURL,Title,'{0}',GETDATE(),ID,ParsePage,MParsePage FROM VW_{0}Column Where ID=@id\r\n", dic);
                                    string template = dic;
                                    if (dic.Equals("marticle"))
                                    {
                                        //孵化/template = NSW.Tools.OnlyMobile.MAdminTools.GetMColumnTypeByID(ColumnID, "marticle");
                                    }
                                    else if (dic.Equals("mproduct"))
                                    {
                                        //孵化/template = NSW.Tools.OnlyMobile.MAdminTools.GetMColumnTypeByID(ColumnID, "mproduct");
                                    }
                                    sb.AppendFormat("INSERT INTO [tbExpandURL](SID,ExpandURL,ColumnName,UrlType,InputTime,ColumnID,ParsePage,MParsePage) SELECT SID,ExpandURL,Title,'{0}',GETDATE(),ID,ParsePage,MParsePage FROM VW_{0}Column Where ID=@id\r\n", template);
                                }
                            }
                        }
                        if (sb.Length > 0)
                        {
                            max = DbSession.Default.Excute(sb.ToString());
                            if (max > 0)
                            {
                                columns = columns.Replace(",", "，").Replace("\r\n", ",").Replace("\n", ",").Replace(",,", ",");
                                AdminTools.RemoveCache<DataTable>("SelectRelevant" + type.Replace("column", "").Replace("tb", ""));
                                NVEngine.Tools.NewTools.ClearCache(type);

                                max = max / 2;
                                AdminTools.InsertLog("批量添加" + tips, columns, false, max, UI.BasePage.RequestActions.Insert, -1);
                                WriteJson(true, "批量添加了" + max + "个" + tips);
                                return;
                            }
                            else
                            {
                                WriteJson(false, "没有可添加的记录！");
                                return;
                            }
                        }
                        else
                        {
                            WriteJson(false, "没有可添加的记录！");
                            return;
                        }
                    }
                }
                catch (Exception ex) {
                    WriteJson(false, ex.Message);
                    return;
                }
            }
            WriteJson(false, "参数错误！");
            return;
        }
        
        /// <summary>
        /// 获取栏目尺寸
        /// </summary>
        private void GetColumnPicSize()
        {
            int oid = ComUtls.ParseInt(QS("oid"),0);
            string type = QS("type", "");
            if (oid == 0)
            {
                WriteString("无");
            }
            ColumnExtend c = null;
            string info = "无";
            try
            {
                switch (type)
                {
                    case "agent":
                        c = ColumnExtendXMLTools.ReadInfo(oid, API.ColumnType.Agent);
                        break;
                    case "news":
                        c = ColumnExtendXMLTools.ReadInfo(oid, API.ColumnType.News);
                        break;
                    case "help":
                        c = ColumnExtendXMLTools.ReadInfo(oid, API.ColumnType.Help);
                        break;
                    case "product":
                        if (NSW.OConfig2.SMTP.P_img_width != 0 || NSW.OConfig2.SMTP.P_img_height != 0)
                        {
                            info = NSW.OConfig2.SMTP.P_img_width + "*" + NSW.OConfig2.SMTP.P_img_height;
                        }
                        break;
                    case "project":
                        if (NSW.OConfig2.SMTP.ProjectImgWidth != 0 || NSW.OConfig2.SMTP.ProjectImgHeight != 0)
                        {
                            info = NSW.OConfig2.SMTP.ProjectImgWidth + "*" + NSW.OConfig2.SMTP.ProjectImgHeight;
                        }
                        break;

                }
            }
            catch { }
            if (c != null && (c.Width != 0 || c.Height != 0))
            {
                WriteString(string.Format("{0}*{1}", c.Width, c.Height));
            }
            else if (info != "无")
            {
                WriteString(info);
            }
            else
            {
                WriteString("无");
            }
        }
        
        /// <summary>
        /// 点击操作，如精华什么的
        /// </summary>
        private void ajaxbit()
        {
            int oid = ComUtls.ParseInt(GF("OID"), 0);
            string fileColumn = GF("fileColumn").ToLower();
            int enable = ComUtls.ParseInt(GF("enable"), 0);
            string typename = GF("typename").ToLower();
            int result = 0;
            string error = "无效操作！";
            
            string url = string.Empty;
            if (!string.IsNullOrEmpty(typename))
            {
                if (!CheckPermission(typename, BLL.Admin.AdminPermission.UpdatePermission))
                {
                    WriteJson(false, "您没有权限！");
                    return;
                }

                if (oid == 1 && (typename.EndsWith("column") || "|systemmenu|".Contains(typename)))
                {
                    WriteJson(false, "根分类无法修改！");
                    return;
                }
            }
            else if (HttpContext.Current.Request.UrlReferrer != null)
            {
                url = HttpContext.Current.Request.UrlReferrer.AbsolutePath;
                url = url.Substring(url.LastIndexOf('/') + 1);
                if (!CheckPermission(url, NSW.BLL.Admin.AdminPermission.UpdatePermission))
                {
                    WriteJson(false, "您没有权限！");
                    return;
                }
            }
            
            if(typename.Equals("admin") && oid>0){//对是否为系统管理员的更新设置
                tbAdmin admin = DbSession.Default.Get<tbAdmin>(tbAdmin._.ID == oid);
                if (admin != null && admin.isSystem)
                {
                    WriteJson(false, "无法对系统管理员进行操作！");
                    return;
                }
            }
            if (AdminTools.CheckManagerUsersDataInput() && fileColumn.Equals("enable"))
            {
                WriteJson(false, "非系统管理员无权【启用\\禁用】数据！");
                return;
            }
            if (oid > 0)
            {
                try
                {
                    //Field file = null;
                    switch (typename)
                    {
                        case "news":
                            switch (fileColumn)
                            {
                                case "iscommend":
                                    result = DbSession.Default.Update<tbNews>(tbNews._.isCommend, enable, tbNews._.ID == oid);
                                    break;
                                case "istop":
                                    result = DbSession.Default.Update<tbNews>(tbNews._.isTop, enable, tbNews._.ID == oid);
                                    break;
                                case "isbest":
                                    result = DbSession.Default.Update<tbNews>(tbNews._.isBest, enable, tbNews._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbNews>(tbNews._.Enable, enable, tbNews._.ID == oid);
                                    break;
                                case "delay":
                                case "isindex":
                                    result = DbSession.Default.Update<tbNews>(tbNews._.Delay, enable, tbNews._.ID == oid);
                                    break;
                            }
                            break;
                        case "newscolumn":
                            switch (fileColumn)
                            {
                                case "iscommend":
                                    result = DbSession.Default.Update<tbNewsColumn>(tbNewsColumn._.isCommend, enable, tbNewsColumn._.ID == oid);
                                    break;
                                case "istop":
                                    result = DbSession.Default.Update<tbNewsColumn>(tbNewsColumn._.isTop, enable, tbNewsColumn._.ID == oid);
                                    break;
                                case "isbest":
                                    result = DbSession.Default.Update<tbNewsColumn>(tbNewsColumn._.isBest, enable, tbNewsColumn._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbNewsColumn>(tbNewsColumn._.Enable, enable, tbNewsColumn._.ID == oid);
                                    break;
                            }
                            break;
                        case "agent":
                            switch (fileColumn)
                            {
                                case "delay":
                                case "isindex":
                                    result = DbSession.Default.Update<tbAgent>(tbAgent._.Delay, enable, tbAgent._.ID == oid);
                                    break;
                                case "iscommend":
                                    result = DbSession.Default.Update<tbAgent>(tbAgent._.isCommend, enable, tbAgent._.ID == oid);
                                    break;
                                case "istop":
                                    result = DbSession.Default.Update<tbAgent>(tbAgent._.isTop, enable, tbAgent._.ID == oid);
                                    break;
                                case "isbest":
                                    result = DbSession.Default.Update<tbAgent>(tbAgent._.isBest, enable, tbAgent._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbAgent>(tbAgent._.Enable, enable, tbAgent._.ID == oid);
                                    break;
                            }
                            break;
                        case "agentcolumn":
                            switch (fileColumn)
                            {
                                case "iscommend":
                                    result = DbSession.Default.Update<tbAgentColumn>(tbAgentColumn._.isCommend, enable, tbAgentColumn._.ID == oid);
                                    break;
                                case "istop":
                                    result = DbSession.Default.Update<tbAgentColumn>(tbAgentColumn._.isTop, enable, tbAgentColumn._.ID == oid);
                                    break;
                                case "isbest":
                                    result = DbSession.Default.Update<tbAgentColumn>(tbAgentColumn._.isBest, enable, tbAgentColumn._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbAgentColumn>(tbAgentColumn._.Enable, enable, tbAgentColumn._.ID == oid);
                                    break;
                            }
                            break;
                        case "help":
                            switch (fileColumn)
                            {
                                case "delay":
                                case "isindex":
                                    result = DbSession.Default.Update<tbHelp>(tbHelp._.Delay, enable, tbHelp._.ID == oid);
                                    break;
                                case "iscommend":
                                    result = DbSession.Default.Update<tbHelp>(tbHelp._.isCommend, enable, tbHelp._.ID == oid);
                                    break;
                                case "istop":
                                    result = DbSession.Default.Update<tbHelp>(tbHelp._.isTop, enable, tbHelp._.ID == oid);
                                    break;
                                case "isbest":
                                    result = DbSession.Default.Update<tbHelp>(tbHelp._.isBest, enable, tbHelp._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbHelp>(tbHelp._.Enable, enable, tbHelp._.ID == oid);
                                    break;
                            }
                            break;
                        case "helpcolumn":
                            switch (fileColumn)
                            {
                                case "iscommend":
                                    result = DbSession.Default.Update<tbHelpColumn>(tbHelpColumn._.isCommend, enable, tbHelpColumn._.ID == oid);
                                    break;
                                case "istop":
                                    result = DbSession.Default.Update<tbHelpColumn>(tbHelpColumn._.isTop, enable, tbHelpColumn._.ID == oid);
                                    break;
                                case "isbest":
                                    result = DbSession.Default.Update<tbHelpColumn>(tbHelpColumn._.isBest, enable, tbHelpColumn._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbHelpColumn>(tbHelpColumn._.Enable, enable, tbHelpColumn._.ID == oid);
                                    break;
                            }
                            break;
                        case "download":
                            switch (fileColumn)
                            {
                                case "iscommend":
                                    result = DbSession.Default.Update<tbDownload>(tbDownload._.isCommend, enable, tbDownload._.ID == oid);
                                    break;
                                case "istop":
                                    result = DbSession.Default.Update<tbDownload>(tbDownload._.isTop, enable, tbDownload._.ID == oid);
                                    break;
                                case "isbest":
                                    result = DbSession.Default.Update<tbDownload>(tbDownload._.isBest, enable, tbDownload._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbDownload>(tbDownload._.Enable, enable, tbDownload._.ID == oid);
                                    break;
                                case "delay":
                                case "isindex":
                                    result = DbSession.Default.Update<tbDownload>(tbDownload._.Delay, enable, tbDownload._.ID == oid);
                                    break;
                            }
                            break;
                        case "downloadcolumn":
                            switch (fileColumn)
                            {
                                case "iscommend":
                                    result = DbSession.Default.Update<tbDownloadColumn>(tbDownloadColumn._.isCommend, enable, tbDownloadColumn._.ID == oid);
                                    break;
                                case "istop":
                                    result = DbSession.Default.Update<tbDownloadColumn>(tbDownloadColumn._.isTop, enable, tbDownloadColumn._.ID == oid);
                                    break;
                                case "isbest":
                                    result = DbSession.Default.Update<tbDownloadColumn>(tbDownloadColumn._.isBest, enable, tbDownloadColumn._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbDownloadColumn>(tbDownloadColumn._.Enable, enable, tbDownloadColumn._.ID == oid);
                                    break;
                            }
                            break;
                        case "admin":
                            result = DbSession.Default.Update<tbAdmin>(tbAdmin._.Enable, enable, tbAdmin._.ID == oid);
                            break;
                        case "systemmenu":
                            bool isadmin = AdminTools.IsSystem;
                            bool modify = NSW.ComUtls.ParseInt(GF("modify"), 0) == 1 && isadmin;
                            tbSystemMenu menu = DbSession.Default.Get<tbSystemMenu>(oid);
                            
                            if (menu != null) {
                                menu.Enable = enable == 1;
                                result = DbSession.Default.Save<tbSystemMenu>(menu);
                                if (result > 0 && menu.Enable)
                                {
                                    tbAdmin admin = DbSession.Default.Get<tbAdmin>(OSession.Admin.ID);
                                    string authority = "," + admin.Authority.Trim(',') + ",";
                                    string key = "," + menu.ID + "-";
                                    string[] qx = new string[] { "1", "2", "3", "4" };
                                    string a = string.Empty;
                                    foreach (string q in qx) {
                                        string key_ = key + q;
                                        authority = authority.Replace(key_ + ",", ",").Replace(",,", ",");
                                        a += key_ + ",";
                                    }
                                    authority = authority.Trim(',') + "," + a.Trim(',');
                                    if (!authority.Equals(admin.Authority))
                                    {
                                        DbSession.Default.Save<tbAdmin>(admin);
                                    }
                                }
                            }
                            break;
                        case "productattributecolumn":
                            result = DbSession.Default.Update<tbProductAttributeColumn>(tbProductAttributeColumn._.Enable, enable, tbProductAttributeColumn._.ID == oid);
                            break;
                        case "projectattributecolumn":
                            result = DbSession.Default.Update<tbProjectAttributeColumn>(tbProjectAttributeColumn._.Enable, enable, tbProjectAttributeColumn._.ID == oid);
                            break;
                        case "product":
                            switch (fileColumn)
                            {
                                case "delay":
                                case "isindex":
                                    result = DbSession.Default.Update<tbProduct>(tbProduct._.Delay, enable, tbProduct._.ID == oid);
                                    break;
                                case "iscommend":
                                    result = DbSession.Default.Update<tbProduct>(tbProduct._.isCommend, enable, tbProduct._.ID == oid);
                                    break;
                                case "istop":
                                    result = DbSession.Default.Update<tbProduct>(tbProduct._.isTop, enable, tbProduct._.ID == oid);
                                    break;
                                case "isbest":
                                    result = DbSession.Default.Update<tbProduct>(tbProduct._.isBest, enable, tbProduct._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbProduct>(tbProduct._.Enable, enable, tbProduct._.ID == oid);
                                    break;
                            }
                            break;
                        case "productcolumn":
                            switch (fileColumn)
                            {
                                case "iscommend":
                                    result = DbSession.Default.Update<tbProductColumn>(tbProductColumn._.isCommend, enable, tbProductColumn._.ID == oid);
                                    break;
                                case "istop":
                                    result = DbSession.Default.Update<tbProductColumn>(tbProductColumn._.isTop, enable, tbProductColumn._.ID == oid);
                                    break;
                                case "isbest":
                                    result = DbSession.Default.Update<tbProductColumn>(tbProductColumn._.isBest, enable, tbProductColumn._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbProductColumn>(tbProductColumn._.Enable, enable, tbProductColumn._.ID == oid);
                                    break;
                            }
                            break;
                        case "project":
                            switch (fileColumn)
                            {
                                case "iscommend":
                                    result = DbSession.Default.Update<tbProject>(tbProject._.isCommend, enable, tbProject._.ID == oid);
                                    break;
                                case "istop":
                                    result = DbSession.Default.Update<tbProject>(tbProject._.isTop, enable, tbProject._.ID == oid);
                                    break;
                                case "isbest":
                                    result = DbSession.Default.Update<tbProject>(tbProject._.isBest, enable, tbProject._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbProject>(tbProject._.Enable, enable, tbProject._.ID == oid);
                                    break;
                                case "delay":
                                case "isindex":
                                    result = DbSession.Default.Update<tbProject>(tbProject._.Delay, enable, tbProject._.ID == oid);
                                    break;
                            }
                            break;
                        case "projectcolumn":
                            switch (fileColumn)
                            {
                                case "iscommend":
                                    result = DbSession.Default.Update<tbProjectColumn>(tbProjectColumn._.isCommend, enable, tbProjectColumn._.ID == oid);
                                    break;
                                case "istop":
                                    result = DbSession.Default.Update<tbProjectColumn>(tbProjectColumn._.isTop, enable, tbProjectColumn._.ID == oid);
                                    break;
                                case "isbest":
                                    result = DbSession.Default.Update<tbProjectColumn>(tbProjectColumn._.isBest, enable, tbProjectColumn._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbProjectColumn>(tbProjectColumn._.Enable, enable, tbProjectColumn._.ID == oid);
                                    break;
                            }
                            break;
                        case "menu":
                            List<MuneXML> listAll = XMLTool.Deserialize(HttpContext.Current.Server.MapPath("/") + "/Config/Mune.xml");
                            MuneXML m = new MuneXML();
                            typename = "mune";
                            switch (fileColumn)
                            {
                                case "enable":
                                    m = listAll.Find(delegate(MuneXML ml) { return ml.OID == oid.ToString(); });
                                    m.Enable = enable;
                                    XMLTool.SerObject(HttpContext.Current.Server.MapPath("/") + "/Config/Mune.xml", listAll);
                                    result = 1;
                                    break;
                                case "isrel":
                                    m = listAll.Find(delegate(MuneXML ml) { return ml.OID == oid.ToString(); });
                                    m.IsRel = enable;
                                    XMLTool.SerObject(HttpContext.Current.Server.MapPath("/") + "/Config/Mune.xml", listAll);
                                    result = 1;
                                    break;
                            }
                            break;
                        case "pdcomment":
                        case "pjcomment":
                        case "newscomment":
                        case "agentcomment":
                        case "helpcomment":
                            result = DbSession.Default.Update<tbComment>(tbComment._.Enable, enable, tbComment._.ID == oid);
                            break;
                        case "usergroup":
                            result = DbSession.Default.Update<tbUserGroup>(tbUserGroup._.Enable, enable, tbUserGroup._.ID == oid);
                            break;
                        case "users":
                            switch (fileColumn)
                            {
                                case "active":
                                    result = DbSession.Default.Update<tbUser>(tbUser._.Active, enable, tbUser._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbUser>(tbUser._.Enable, enable, tbUser._.ID == oid);
                                    break;
                            }
                            break;
                        case "firendlink":
                            result = DbSession.Default.Update<tbFriendLink>(tbFriendLink._.Enable, enable, tbFriendLink._.ID == oid);
                            break;
                        case "jobcolumns":
                            switch (fileColumn)
                            {
                                case "showdetail":
                                    result = DbSession.Default.Update<tbJobColumn>(tbJobColumn._.ShowDetail, enable, tbJobColumn._.ID == oid);
                                    break;
                                case "enable":
                                    result = DbSession.Default.Update<tbJobColumn>(tbJobColumn._.Enable, enable, tbJobColumn._.ID == oid);
                                    break;
                            }
                            break;
                        case "keywordcolumns":
                            result = DbSession.Default.Update<tbKeywordColumn>(tbKeywordColumn._.Enable, enable, tbKeywordColumn._.ID == oid);
                            break;
                        case "nvcontrols":
                            result = DbSession.Default.Update<tbNVControls>(tbNVControls._.Enable, enable, tbNVControls._.ID == oid);
                            break;
                        case "sitepagecolumn":
                            result = DbSession.Default.Update<tbSitePageColumns>(tbSitePageColumns._.Enable, enable, tbSitePageColumns._.ID == oid);
                            break;
                        case "tagcolumn":
                            result = DbSession.Default.Update<tbTagColumn>(tbTagColumn._.Enable, enable, tbTagColumn._.ID == oid);
                            break;
                        case "tbforms":
                            FormDB.Entity.tbForms forms = FormDB.Entity.tbForms.GetEntity(oid);
                            if (forms.ID > 0) {
                                forms.IsEnable = enable == 1;
                                result = forms.Save();
                            }
                            break;
                        case "tbleavemessage":
                            FormDB.Entity.tbLeaveMessage leaveMessage = FormDB.Entity.tbLeaveMessage.GetEntity(oid);
                            if (leaveMessage.ID > 0)
                            {
                                leaveMessage.IsEnable = enable == 1;
                                result = leaveMessage.Save();
                            }
                            break;
                        case "templatecolumn":
                            result = DbSession.Default.Excute(string.Format("update tbtemplatecolumn set {2}={0} where id={1}",enable, oid, fileColumn));
                            break;
                        case "video":
                            result = DbSession.Default.Excute(string.Format("update tbvideo set {2}={0} where id={1}", enable, oid, fileColumn));
                            break;
                        //手机界面单独添加
                        //孵化/case "marticle":
                        //孵化/    switch (fileColumn)
                        //孵化/    {
                        //孵化/        case "iscommend":
                        //孵化/            result = DbSession.Default.Update<tbMArticle>(tbMArticle._.isCommend, enable, tbMArticle._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "istop":
                        //孵化/            result = DbSession.Default.Update<tbMArticle>(tbMArticle._.isTop, enable, tbMArticle._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "isbest":
                        //孵化/            result = DbSession.Default.Update<tbMArticle>(tbMArticle._.isBest, enable, tbMArticle._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "enable":
                        //孵化/            result = DbSession.Default.Update<tbMArticle>(tbMArticle._.Enable, enable, tbMArticle._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "delay":
                        //孵化/        case "isindex":
                        //孵化/            result = DbSession.Default.Update<tbMArticle>(tbMArticle._.Delay, enable, tbMArticle._.ID == oid);
                        //孵化/            break;
                        //孵化/    }
                        //孵化/    break;
                        //孵化/case "marticlecolumn":
                        //孵化/    switch (fileColumn)
                        //孵化/    {
                        //孵化/        case "iscommend":
                        //孵化/            result = DbSession.Default.Update<tbMArticleColumn>(tbMArticleColumn._.isCommend, enable, tbMArticleColumn._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "istop":
                        //孵化/            result = DbSession.Default.Update<tbMArticleColumn>(tbMArticleColumn._.isTop, enable, tbMArticleColumn._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "isbest":
                        //孵化/            result = DbSession.Default.Update<tbMArticleColumn>(tbMArticleColumn._.isBest, enable, tbMArticleColumn._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "enable":
                        //孵化/            result = DbSession.Default.Update<tbMArticleColumn>(tbMArticleColumn._.Enable, enable, tbMArticleColumn._.ID == oid);
                        //孵化/            break;
                        //孵化/    }
                        //孵化/    break;

                        //孵化/case "mproduct":
                        //孵化/    switch (fileColumn)
                        //孵化/    {
                        //孵化/        case "delay":
                        //孵化/        case "isindex":
                        //孵化/            result = DbSession.Default.Update<tbMProduct>(tbMProduct._.Delay, enable, tbMProduct._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "iscommend":
                        //孵化/            result = DbSession.Default.Update<tbMProduct>(tbMProduct._.isCommend, enable, tbMProduct._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "istop":
                        //孵化/            result = DbSession.Default.Update<tbMProduct>(tbMProduct._.isTop, enable, tbMProduct._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "isbest":
                        //孵化/            result = DbSession.Default.Update<tbMProduct>(tbMProduct._.isBest, enable, tbMProduct._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "enable":
                        //孵化/            result = DbSession.Default.Update<tbMProduct>(tbMProduct._.Enable, enable, tbMProduct._.ID == oid);
                        //孵化/            break;
                        //孵化/    }
                        //孵化/    break;
                        //孵化/case "mproductcolumn":
                        //孵化/    switch (fileColumn)
                        //孵化/    {
                        //孵化/        case "iscommend":
                        //孵化/            result = DbSession.Default.Update<tbMProductColumn>(tbMProductColumn._.isCommend, enable, tbMProductColumn._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "istop":
                        //孵化/            result = DbSession.Default.Update<tbMProductColumn>(tbMProductColumn._.isTop, enable, tbMProductColumn._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "isbest":
                        //孵化/            result = DbSession.Default.Update<tbMProductColumn>(tbMProductColumn._.isBest, enable, tbMProductColumn._.ID == oid);
                        //孵化/            break;
                        //孵化/        case "enable":
                        //孵化/            result = DbSession.Default.Update<tbMProductColumn>(tbMProductColumn._.Enable, enable, tbMProductColumn._.ID == oid);
                        //孵化/            break;
                        //孵化/    }
                        //孵化/    break;
                        default:
                            if (!string.IsNullOrEmpty(url) && !string.IsNullOrEmpty(typename = GetTableName(url)))
                            {
                                result = DbSession.Default.Excute(string.Format("update {0} set {3}={1} where id={2}", typename, enable, oid, fileColumn));
                            }
                            break;
                    }
                }
                catch (Exception ex)
                {
                    error = ex.Message;
                }
                if (result > 0)
                {
                    NVEngine.Tools.NewTools.ClearCache(typename);
                    WriteJson(true, enable.Equals(0) ? "禁用" : "可用");
                    return;
                }
                else
                {
                    WriteJson(false, error);
                }
            }
            else {
                WriteJson(false, "拉取记录出错！此记录是否已经被删除!");
                return;
            }

            WriteJson(false, "无效操作！");
            return;
        }

        /// <summary>
        /// 直接修改分类
        /// </summary>
        private void alertColumn()
        {
            //当前分类
            int oid = ComUtls.ParseInt(GF("oid"), 0);
            //所属分类
            string _pid = GF("pid");
            if (AdminTools.CheckSIDFormat(_pid)) {
                _pid = AdminTools.GetColumnIDBySID(_pid).ToString();
            }
            int pid = ComUtls.ParseInt(_pid, 0);
            int result = 0;
            string error = "修改失败，请稍后重试！";
            string typename = GF("typename");
            
            if (pid > 0 && oid>0)
            {
                string url = string.Empty;
                if (!string.IsNullOrEmpty(typename))
                {
                    if (!CheckPermission(typename, BLL.Admin.AdminPermission.UpdatePermission))
                    {
                        WriteJson(false, "您没有权限！");
                        return;
                    }
                }
                else if (HttpContext.Current.Request.UrlReferrer != null)
                {
                    url = HttpContext.Current.Request.UrlReferrer.AbsolutePath;
                    url = url.Substring(url.LastIndexOf('/') + 1);
                    if (!CheckPermission(url, NSW.BLL.Admin.AdminPermission.UpdatePermission))
                    {
                        WriteJson(false, "您没有权限！");
                        return;
                    }
                }
                try
                {
                    string tips = GetTypeTitle(typename);
                    if (!string.IsNullOrEmpty(typename))
                    {
                        switch (typename)
                        {
                            case "product":
                                result = DbSession.Default.Update<tbProduct>(tbProduct._.ColumnID, pid, tbProduct._.ID == oid);
                                break;
                            case "project":
                                result = DbSession.Default.Update<tbProject>(tbProject._.ColumnID, pid, tbProject._.ID == oid);
                                break;
                            case "news":
                                result = DbSession.Default.Update<tbNews>(tbNews._.ColumnID, pid, tbNews._.ID == oid);
                                break;
                            case "help":
                                result = DbSession.Default.Update<tbHelp>(tbHelp._.ColumnID, pid, tbHelp._.ID == oid);
                                break;
                            case "agent":
                                result = DbSession.Default.Update<tbAgent>(tbAgent._.ColumnID, pid, tbAgent._.ID == oid);
                                break;
                            case "download":
                                result = DbSession.Default.Update<tbDownload>(tbDownload._.ColumnID, pid, tbDownload._.ID == oid);
                                break;
                            case "picture":
                                tbPicture Picture = DbSession.Default.Get<tbPicture>(oid);
                                if (Picture != null)
                                {
                                    Picture.Attach();
                                    Picture.ColumnID = pid;
                                    Picture.Revision = ++Picture.Revision;
                                    result = DbSession.Default.Save<tbPicture>(Picture);
                                }
                                break;
                            //手机添加
                            //孵化/case "marticle":
                            //孵化/    result = DbSession.Default.Update<tbMArticle>(tbMArticle._.ColumnID, pid, tbMArticle._.ID == oid);
                            //孵化/    break;
                            //孵化/case "mproduct":
                            //孵化/    result = DbSession.Default.Update<tbMProduct>(tbMProduct._.ColumnID, pid, tbMProduct._.ID == oid);
                            //孵化/    break;
                            case "files":
                                tbFiles files = DbSession.Default.Get<tbFiles>(oid);
                                if (files != null)
                                {
                                    files.Attach();
                                    files.ColumnID = pid;
                                    files.Revision = ++files.Revision;
                                    result = DbSession.Default.Save<tbFiles>(files);
                                }
                                break;
                        }
                    }
                    else {
                        if (!string.IsNullOrEmpty(url) && !string.IsNullOrEmpty(typename = GetTableName(url)))
                        {
                            string updateTemp = "update {0} set ColumnID={1} where id={2}";
                            result = DbSession.Default.Excute(string.Format(updateTemp, typename, pid, oid));
                        }
                    }
                    if (result > 0)
                    {
                        AdminTools.InsertLog("修改" + tips + "所属分类", "ColumnID:" + pid, true, result, UI.BasePage.RequestActions.Update, oid);
                        NVEngine.Tools.NewTools.ClearCache(typename);
                        error = "修改成功！";
                    }
                }
                catch (Exception e)
                {
                    error = e.Message;
                }
                WriteJson(result > 0, error);
                return;
            }
            else
            {
                WriteJson(false, "拉取记录出错！此记录是否已经被删除!");
                return;
            }
        }
        /// <summary>
        /// 修改标题
        /// </summary>
        private void alertTitle()
        {
            int oid = ComUtls.ParseInt(GF("OID"), 0);
            string title = GF("value").Replace("'", "''");
            int result = 0;
            string typename = GF("typename");
            string error = "修改失败，请稍后重试！";
            
            if (!string.IsNullOrEmpty(title)) {
                string url = string.Empty;
                if (!string.IsNullOrEmpty(typename))
                {
                    if (!CheckPermission(typename, BLL.Admin.AdminPermission.UpdatePermission))
                    {
                        WriteJson(false, "您没有权限！");
                        return;
                    }
                }
                else if (HttpContext.Current.Request.UrlReferrer != null)
                {
                    url = HttpContext.Current.Request.UrlReferrer.AbsolutePath;
                    url = url.Substring(url.LastIndexOf('/') + 1);
                    if (!CheckPermission(url, NSW.BLL.Admin.AdminPermission.UpdatePermission))
                    {
                        WriteJson(false, "您没有权限！");
                        return;
                    }
                }
                
                try
                {
                    string tips = GetTypeTitle(typename);
                    if (!string.IsNullOrEmpty(typename))
                    {
                        switch (typename)
                        {
                            case "picture":
                                tbPicture Picture = DbSession.Default.Get<tbPicture>(oid);
                                if (Picture != null)
                                {
                                    Picture.Attach();
                                    Picture.Title = title;
                                    Picture.Revision = ++Picture.Revision;
                                    result = DbSession.Default.Save<tbPicture>(Picture);
                                }
                                break;
                        }
                    }
                    else {
                        if (!string.IsNullOrEmpty(url) && !string.IsNullOrEmpty(typename = GetTableName(url)))
                        {
                            string updateTemp = "update {0} set Title='{1}' where id={2}";
                            result = DbSession.Default.Excute(string.Format(updateTemp, typename, title, oid));
                        }
                    }
                    if (result > 0)
                    {
                        AdminTools.InsertLog("修改" + tips + "标题", title, true, result, UI.BasePage.RequestActions.Update, oid);
                        NVEngine.Tools.NewTools.ClearCache(typename);
                        
                        error = "修改成功！";
                    }
                }
                catch (Exception e)
                {
                    error = e.Message;
                }
                WriteJson(result > 0, error);
                return;
            }
        }
        private static Hashtable _PageTableName = null;
        /// <summary>
        /// 一些特殊界面，没办法跟url拼接成表名的
        /// </summary>
        public static Hashtable PageTableName {
            get {
                if (_PageTableName == null) {
                    _PageTableName = new Hashtable();
                    _PageTableName.Add("im_service_groups.aspx", "tbIMGroup");
                    _PageTableName.Add("agent_applies.aspx", "tbAgentApply");
                    _PageTableName.Add("wxusers.aspx", "tbWeiXinUsers");
                    _PageTableName.Add("email.aspx", "tbUserEmail");
                    _PageTableName.Add("news.aspx", "tbNews");
                    _PageTableName.Add("ggs.aspx", "tbAd");
                    _PageTableName.Add("gg_column.aspx", "tbAdColumn");
                }
                return _PageTableName;
            }
        }
        /// <summary>
        /// 根据url，获取表名
        /// </summary>
        /// <param name="url">url</param>
        /// <returns>返回表名</returns>
        private static string GetTableName(string url) {
            url = url.ToLower();
            string tabName = PageTableName[url] as string;
            if (!string.IsNullOrEmpty(tabName))
            {
                return tabName.ToLower();
            }
            bool isColumn = url.Contains("_column");
            
            url = Regex.Replace(url, @"(s?\.aspx|_column\.aspx)", "");
            url = url.Replace("_", string.Empty);
            tabName = "tb" + url + (isColumn ? "column" : string.Empty);

            return tabName.Replace("'", "").Replace(";", "").Replace("tbtb", "tb");
        }
        private void alertOrder() 
        {
            int oid = ComUtls.ParseInt(GF("OID"), 0);
            int Order = ComUtls.ParseInt(GF("value"), 0);
            int result = 0;
            string typename = GF("typename");
            string error = "修改失败，请稍后重试！";
            if (oid > 0)
            {
                string url = string.Empty;
                if (!string.IsNullOrEmpty(typename))
                {
                    if (!CheckPermission(typename, BLL.Admin.AdminPermission.UpdatePermission))
                    {
                        WriteJson(false, "您没有权限！");
                        return;
                    }
                }
                else if (HttpContext.Current.Request.UrlReferrer != null)
                {
                    url = HttpContext.Current.Request.UrlReferrer.AbsolutePath;
                    url = url.Substring(url.LastIndexOf('/') + 1);
                    if (!CheckPermission(url,NSW.BLL.Admin.AdminPermission.UpdatePermission)){
                        WriteJson(false, "您没有权限！");
                        return;
                    }
                }
                try
                {
                    string tips = GetTypeTitle(typename);
                    switch (typename)
                    {
                        case "news":
                            result = DbSession.Default.Update<tbNews>(tbNews._.OrderID, Order, tbNews._.ID == oid);
                            break;
                        case "newscolumn":
                            result = DbSession.Default.Update<tbNewsColumn>(tbNewsColumn._.OrderID, Order, tbNewsColumn._.ID == oid);
                            break;
                        case "product":
                            result = DbSession.Default.Update<tbProduct>(tbProduct._.OrderID, Order, tbProduct._.ID == oid);
                            break;
                        case "productcolumn":
                            result = DbSession.Default.Update<tbProductColumn>(tbProductColumn._.OrderID, Order, tbProductColumn._.ID == oid);
                            break;
                        case "project":
                            result = DbSession.Default.Update<tbProject>(tbProject._.OrderID, Order, tbProject._.ID == oid);
                            break;
                        case "projectcolumn":
                            result = DbSession.Default.Update<tbProjectColumn>(tbProjectColumn._.OrderID, Order, tbProjectColumn._.ID == oid);
                            break;
                        case "help":
                            result = DbSession.Default.Update<tbHelp>(tbHelp._.OrderID, Order, tbHelp._.ID == oid);
                            break;
                        case "helpcolumn":
                            result = DbSession.Default.Update<tbHelpColumn>(tbHelpColumn._.OrderID, Order, tbHelpColumn._.ID == oid);
                            break;
                        case "agent":
                            result = DbSession.Default.Update<tbAgent>(tbAgent._.OrderID, Order, tbAgent._.ID == oid);
                            break;
                        case "agentcolumn":
                            result = DbSession.Default.Update<tbAgentColumn>(tbAgentColumn._.OrderID, Order, tbAgentColumn._.ID == oid);
                            break;
                        case "download":
                            result = DbSession.Default.Update<tbDownload>(tbDownload._.OrderID, Order, tbDownload._.ID == oid);
                            break;
                        case "downloadcolumn":
                            result = DbSession.Default.Update<tbDownloadColumn>(tbDownloadColumn._.OrderID, Order, tbDownloadColumn._.ID == oid);
                            break;
                        case "systemmenu":
                            result = DbSession.Default.Update<tbSystemMenu>(tbSystemMenu._.OrderID, Order, tbSystemMenu._.ID == oid);
                            break;
                        case "productattributecolumn":
                            result = DbSession.Default.Update<tbProductAttributeColumn>(tbProductAttributeColumn._.OrderID, Order, tbProductAttributeColumn._.ID == oid);
                            break;
                        case "menu":
                            List<MuneXML> listAll = XMLTool.Deserialize(HttpContext.Current.Server.MapPath("/") + "/Config/Mune.xml");
                            MuneXML m = listAll.Find(delegate(MuneXML ml) { return ml.OID == oid.ToString(); });
                            m.Order = Order;
                            XMLTool.SerObject(HttpContext.Current.Server.MapPath("/") + "/Config/Mune.xml", listAll);
                            result = 1;
                            break;
                        case "pdcomment":
                        case "pjcomment":
                        case "newscomment":
                        case "agentcomment":
                        case "helpcomment":
                            result = DbSession.Default.Update<tbComment>(tbComment._.OrderID, Order, tbComment._.ID == oid);
                            break;
                        default:
                            if (!string.IsNullOrEmpty(url) && !string.IsNullOrEmpty(typename = GetTableName(url)))
                            {
                                result = DbSession.Default.Excute(string.Format("update {0} set OrderID={1} where id={2}", typename, Order, oid));
                            }
                            break;

                    }
                    if (result > 0)
                    {
                        AdminTools.InsertLog("修改" + tips + "排序", "(OrderID:" + Order + ")", true, result, UI.BasePage.RequestActions.Update, oid);
                        NVEngine.Tools.NewTools.ClearCache(typename);
                    }
                }
                catch (Exception ex)
                {
                    error = ex.Message;
                }
                if (result > 0)
                {
                    WriteJson(true, "更新成功！");
                    return;
                }
                else
                {
                    WriteJson(false,error);
                    return;
                }
            }
            else {
                WriteJson(false, "拉取记录出错！此记录是否已经被删除!");
                return;
            }
        }
        
        /// <summary>
        /// 取出配置文件中产品图片的大小
        /// </summary>
        public static void initimgsize()
        {
            try
            {
                HttpContext.Current.Response.Write(OConfig2.SMTP.P_img_height + "|" + OConfig2.SMTP.P_img_width);
            }
            catch (Exception e)
            {
                HttpContext.Current.Response.Write("0|0");
            }
        }
        /// <summary>
        /// 生成会员的关键词（八爪图）
        /// </summary>
        private static void SearchKeyWords()
        {
            //获得参数
            string A6 = GF("A6").Replace(",", "").Replace("，", "");
            string A8 = GF("A8").Replace(",", "").Replace("，", "");
            string A10 = GF("A10").Replace(",", "").Replace("，", "");
            string A12 = GF("A12").Replace(",", "").Replace("，", "");
            string A14 = GF("A14").Replace(",", "").Replace("，", "");
            string A16 = GF("A16").Replace(",", "").Replace("，", "");
            string A18 = GF("A18").Replace(",", "").Replace("，", "");
            string A20 = GF("A20").Replace(",", "").Replace("，", "");
            string A22 = GF("A22").Replace(",", "").Replace("，", "");
            string A24 = GF("A24").Replace(",", "").Replace("，", "");
            string A26 = GF("A26").Replace(",", "").Replace("，", "");
            KeyValuePair<string, string> node1;
            KeyValuePair<string, string> node2;
            KeyValuePair<string, string> node3;

            if (A16.Trim().Length == 0 || A16.Trim() == "")
            {
                node1 = new KeyValuePair<string, string>("state", "0");
                node2 = new KeyValuePair<string, string>("msg", "核心关键词不能为空，请点击修改核心关键词！");
                WriteXml(node1, node2);
                return;
            }


            //生成关键词
            string KeyWords = NSW.BLL.KeyWords.GetKeyWordsGenius(A6, A8, A10, A12, A14, A16, A18, A20, A22, A24, A26);


            //返回数据
            if (KeyWords.Trim().Length > 0)
            {
                string temp = "";
                string[] str = KeyWords.Split(',');
                if (str.Length > 15)
                {
                    for (int i = 0; i < 10; i++)
                    {
                        temp += "<span>" + str[i] + "</span>";
                    }
                }
                else
                {
                    for (int i = 0; i < str.Length; i++)
                    {
                        temp += "<span>" + str[i] + "</span>";
                    }
                }

                node1 = new KeyValuePair<string, string>("state", "1");
                node2 = new KeyValuePair<string, string>("msg", KeyWords);
                node3 = new KeyValuePair<string, string>("commend", temp);
                WriteXml(node1, node2, node3);
            }
            else
            {
                node1 = new KeyValuePair<string, string>("state", "0");
                node2 = new KeyValuePair<string, string>("msg", "生成精准关键词失败，请至少填写一项组合项！");
                WriteXml(node1, node2);

            }
        }
        
        /// <summary>
        /// 获取产品分类
        /// </summary>
        private static void GetProductColumns()
        {
            DataTable dataSrc = OCache.ProductColumnTree;
            StringBuilder sbVal = new StringBuilder();
            string clnName;
            int clnId;

            for (int i = 0; i < dataSrc.Rows.Count; i++)
            {
                clnName = dataSrc.Rows[i]["ReName"].ToString();
                clnId = (int)dataSrc.Rows[i]["ID"];

                if (i != 0)
                {
                    sbVal.Append("||");
                }

                sbVal.AppendFormat("{0}{1}{2}", clnId, "$$", clnName);
            }

            WriteString(sbVal.ToString());
        }

        /// <summary>
        /// 设置EC短信中会员的电话cookies值
        /// </summary>
        private static void SetPhonesCookies()
        {

            //1\获得参数
            string Ids = GF("Ids");

            if (!ComUtls.CheckIDsFormat(Ids))
            {
                return;
            }

            WhereClip NWhere = (tbUser._.ID.In(Ids.Split(',')));
            OrderByClip NOrder = (tbUser._.ID.Desc);
            Field[] NField = new BlueCrystal.Data.Field[] { 
                tbUser._.ID,
                tbUser._.MPhone,
                tbUser._.UserName,
                tbUser._.CUserName
            };
            DataTable DT = DbSession.Default.From<tbUser>().Select(NField).Where(NWhere).OrderBy(NOrder).ToDataTable();

            string uid = string.Empty;
            string Phones = string.Empty;
            bool flag = true;

            if (DT.Rows.Count > 0)
            {
                Regex reg = new Regex(@"(((13|15|18)\d{9})|(147\d{8}))$");
                foreach (DataRow ObjRow in DT.Rows)
                {
                    if (reg.IsMatch(ObjRow["MPhone"].ToString()))
                    {
                        if (flag == true)
                        {
                            Phones = ObjRow["MPhone"].ToString();
                            flag = false;
                        }
                        else
                        {
                            Phones += "," + ObjRow["MPhone"].ToString();
                        }

                    }
                }
            }

            string PhonesCookies = OCookie.Mem.EcPhones;
            ArrayList NewCookies = new ArrayList();

            //2\处理参数和cookies
            string[] arr = Phones.Split(',');
            string[] cookies = PhonesCookies.Split(',');

            if (PhonesCookies != "")
            {
                foreach (string cookie in cookies)
                {
                    NewCookies.Add(cookie);
                }
            }

            foreach (string phone in arr)
            {
                if (!NewCookies.Contains(phone))
                {
                    NewCookies.Add(phone);
                }
            }

            //3\处理cookies，组成新的cookies
            bool res = true;
            string NewPhones = string.Empty;
            foreach (string temp in NewCookies)
            {
                if (res == true)
                {
                    NewPhones = temp;
                    res = false;
                }
                else
                {
                    NewPhones += "," + temp;
                }
            }

            OCookie.Mem.EcPhones = NewPhones;
            //4\结束
            WriteString(NewPhones);

        }



        /// <summary>
        /// 获得EC短信中会员的电话cookies值
        /// </summary>
        private static void GetPhonesCookies()
        {

            //1\获得参数
            string DelPhone = GF("DelPhone");
            string PhonesCookies = OCookie.Mem.EcPhones;

            //2\处理参数和cookies
            string[] cookies = PhonesCookies.Split(',');

            //3\处理cookies，组成新的cookies
            bool res = true;
            string NewPhones = string.Empty;
            foreach (string temp in cookies)
            {
                if (temp != DelPhone)
                {
                    if (res == true)
                    {
                        NewPhones = temp;
                        res = false;
                    }
                    else
                    {
                        NewPhones += "," + temp;
                    }
                }

            }

            OCookie.Mem.EcPhones = NewPhones;
            //4\结束
            WriteString(NewPhones);

        }


        /// <summary>
        /// 获得定单状态的EC短信话语
        /// </summary>
        private static void GetUserContent()
        {

            //1\获得参数
            string EcContent = string.Empty;
            int OrderState = ComUtls.ParseInt(GF("OrderState"), -1);

            //2\获得EC短信话语
            switch (OrderState)
            {
                case 0:
                    EcContent = OConfig.GlobalConfig.EC.EcUserContent;
                    break;

                case 1:
                    EcContent = OConfig.GlobalConfig.EC.EcRegContent;
                    break;
                default:
                    EcContent = "请填写要发送的短信内容";
                    break;

            }

            //3\结束
            WriteString(EcContent);

        }


        /// <summary>
        /// 获得定单状态的EC短信话语
        /// </summary>
        private static void GetOrderContent()
        {

            //1\获得参数
            string EcContent = string.Empty;
            int OrderState = ComUtls.ParseInt(GF("OrderState"), 1);

            //2\获得EC短信话语
            EcContent = BLL.EC.EcOrderContent(OrderState);

            //3\结束
            WriteString(EcContent);

        }
        

        /// <summary>
        /// 获取文件内容
        /// </summary>
        private static void GetHTMLFileContent()
        {
            //1>定义变量
            string FileName, ResultString="";

            //2>设置变量值
            FileName = GF("URL");
            string gs = NSW.ComUtls.GetAppWebConfig("TempUpdateTypes");
            if (string.IsNullOrEmpty(gs)) gs = ".aspx|.ascx|.html|.htm|.txt|.css|.js|.ashx";
            try
            {
                //3>检查文件是否存在，如果不存在，则返回错误信息
                if (NSW.Utls.IOUtls.CheckFileType(gs,FileName))
                {

                    //4>检查文件是否存在，如果文件不存在，则提示文件不存在信息
                    if (!IOUtls.IsExist(IOUtls.GetMapPath(FileName), IOUtls.FsoMethod.File))
                    {
                        ResultString="文件名称：" + FileName + "不存在";

                    }
                    //4>把文件内容写入到制定文件
                    else
                    {
                        FileName = IOUtls.GetMapPath(FileName);
                        ResultString = IOUtls.ReadFile(FileName);
                        
                    }

                    //5>结束

                }
                else
                {
                    ResultString = "修改的模板名称只能是" + gs.Replace("*", "").Replace("|", "、") + "等格式";
                }
            }
            catch(Exception e)
            {
                ResultString="文件读取出错，请检查文件的物理路径是否正确";
            }
            finally
            {
                WriteString(ResultString);
            }
        }        
        
        
        /// <summary>
        /// 发送获取产品列表通知
        /// </summary>
        private static void SendGetProductByColumn()
        {
            string reason = ClearGF("reason");
            //1\定义变量
            string ColumnID;
            string ResultString = "";

            //2\获取产品数据列表
            ColumnID = GF("columnid");


            //3\绑定数据
            WhereClip nwhere = (VW_Product._.sid.Like(ColumnID + "%")
                && VW_Product._.Enable == true);
            Field[] nfields = new Field[] { 
                VW_Product._.ID,
                VW_Product._.Title                
            };
            DataTable dt = DbSession.Default.From<VW_Product>().Select(nfields).Where(nwhere).ToDataTable(1000);

            foreach (DataRow dr in dt.Rows)
            {
                ResultString += dr[VW_Product._.ID.Name].ToString() + "$$" + dr[VW_Product._.Title.Name].ToString().Replace("$$", "").Replace("||", "");
                ResultString += "||";
            }

            //4\结束
            WriteString(ResultString);

        }
        /// <summary>
        /// 发送获取广告列表通知
        /// </summary>
        private static void SendGetADByColumn()
        {
            string reason = ClearGF("reason");
            //1\定义变量
            string ColumnID;
            string ResultString = "";

            //2\获取产品数据列表
            ColumnID = GF("columnid");


            //3\绑定数据
            WhereClip nwhere = (VW_Ad._.SID.Like(ColumnID + "%")
                && VW_Ad._.Enable == true);
            Field[] nfields = new Field[] { 
                VW_Ad._.KeyName,
                VW_Ad._.Title                
            };
            DataTable dt = DbSession.Default.From<VW_Ad>().Select(nfields).Where(nwhere).ToDataTable(1000);

            foreach (DataRow dr in dt.Rows)
            {
                ResultString += dr[VW_Ad._.KeyName.Name].ToString() + "$$" + dr[VW_Ad._.Title.Name].ToString().Replace("$$", "").Replace("||", "");
                ResultString += "||";
            }

            //4\结束
            WriteString(ResultString);

        }
         /// <summary>
        /// 发送获取帮助文档列表通知
        /// </summary>
        private static void SendGetHelpByColumn()
        {
            string reason = ClearGF("reason");
            //1\定义变量
            string ColumnID;
            string ResultString = "";

            //2\获取产品数据列表
            ColumnID = GF("columnid");


            //3\绑定数据
            WhereClip nwhere = (VW_Help._.sid.Like(ColumnID + "%")
                && VW_Help._.Enable == true);
            Field[] nfields = new Field[] { 
                VW_Help._.ID,
                VW_Help._.Title                
            };
            DataTable dt = DbSession.Default.From<VW_Help>().Select(nfields).Where(nwhere).ToDataTable(1000);

            foreach (DataRow dr in dt.Rows)
            {//1$$asdf||2$$lksdf
                ResultString += dr[VW_Help._.ID.Name].ToString() + "$$" + dr[VW_Help._.Title.Name].ToString().Replace("$$", "").Replace("||", "");
                ResultString += "||";
            }
            if (!string.IsNullOrEmpty(ResultString))
            {
                ResultString = ResultString.Substring(0, ResultString.Length - 2);
            }
            //4\结束
            WriteString(ResultString);

        }

        /// <summary>
        /// 发送获取帮助文档列表通知
        /// </summary>
        private static void SendGetAgentByColumn()
        {
            string reason = ClearGF("reason");
            //1\定义变量
            string ColumnID;
            string ResultString = "";

            //2\获取产品数据列表
            ColumnID = GF("columnid");


            //3\绑定数据
            WhereClip nwhere = (VW_Agent._.sid.Like(ColumnID + "%")
                && VW_Agent._.Enable == true);
            Field[] nfields = new Field[] { 
                VW_Agent._.ID,
                VW_Agent._.Title                
            };
            DataTable dt = DbSession.Default.From<VW_Agent>().Select(nfields).Where(nwhere).ToDataTable(1000);

            foreach (DataRow dr in dt.Rows)
            {
                ResultString += dr[VW_Agent._.ID.Name].ToString() + "$$" + dr[VW_Agent._.Title.Name].ToString().Replace("$$", "").Replace("||", "");
                ResultString += "||";
            }

            //4\结束
            WriteString(ResultString);

        } 
         
        /// <summary>
        /// 发送获取资讯列表通知
        /// </summary>
        private static void SendGetNewsByColumn()
        {
            string reason = ClearGF("reason");
            //1\定义变量
            string ColumnID, SearchText;
            string ResultString = "";

            //2\获取产品数据列表
            ColumnID = GF("columnid");
            SearchText = GF("searchtext");

            WhereClip nwhere;
            //3\绑定数据
            if (SearchText.Length > 0)
            {
                nwhere = (VW_News._.sid.Like(ColumnID + "%") && VW_News._.Title.Like("%" + SearchText + "%")
                    && VW_News._.Enable == true);
            }
            else
            {
                nwhere = (VW_News._.sid.Like(ColumnID + "%")
                    && VW_News._.Enable == true);
            }
            Field[] nfields = new Field[] { 
                VW_News._.ID,
                VW_News._.Title                
            };
            DataTable dt = DbSession.Default.From<VW_News>().Select(nfields).Where(nwhere).ToDataTable(1000);

            foreach (DataRow dr in dt.Rows)
            {
                ResultString += dr[VW_News._.ID.Name].ToString() + "$$" + dr[VW_News._.Title.Name].ToString().Replace("$$", "").Replace("||", "");
                ResultString += "||";
            }

            //4\结束
            WriteString(ResultString);

        }

        /// <summary>
        /// 发送订单已取消邮件通知
        /// </summary>
        private static void SendOrderCanceledMailNotyfi()
        {
            string reason = ClearGF("reason");
            DateTime orderInputTime = ComUtls.ParseDateTime(GF("orderInputTime"));
            DateTime canceledTime = ComUtls.ParseDateTime(GF("canceledTime"));
            string orderNo = ClearGF("orderNo");
            string mailTo = ClearGF("mailTo");
            bool result = BLL.Order.SendOrderCanceledMailNotify(orderInputTime, orderNo, canceledTime, reason, mailTo);

            WriteString(result ? "1" : "0");
        }

        /// <summary>
        /// 发送订单已付款邮件通知
        /// </summary>
        private static void SendOrderPaidMailNotyfi()
        {
            string paymentTitle = ClearGF("paymentTitle");
            DateTime orderInputTime = ComUtls.ParseDateTime(GF("orderInputTime"));
            DateTime paidTime = ComUtls.ParseDateTime(GF("_paidTime"));
            string orderNo = ClearGF("orderNo");
            string mailTo = ClearGF("mailTo");
            bool result = BLL.Order.SendOrderPaidMailNotify(orderInputTime, orderNo, paymentTitle, paidTime, mailTo);

            WriteString(result ? "1" : "0");
        }

        /// <summary>
        /// 发送订单已发货邮件通知
        /// </summary>
        private static void SendOrderDeliveriedMailNotyfi()
        {
            DateTime deliveriedTime = ComUtls.ParseDateTime(GF("deliveriedTime"));
            DateTime orderInputTime = ComUtls.ParseDateTime(GF("orderInputTime"));
            string orderNo = ClearGF("orderNo");
            string mailTo = ClearGF("mailTo");
            bool result = BLL.Order.SendOrderDeliveriedMailNotify(orderInputTime, orderNo, deliveriedTime, mailTo);

            WriteString(result ? "1" : "0");
        }

        private string NullEmpty(string input, string defaultString)
        {
            return string.IsNullOrEmpty(input) ? defaultString : input;
        }

        private string GetDirectoryInfo(DataRow[] dt,string filed, string defaultString)
        {
            if (string.IsNullOrEmpty(filed)) { filed = "directory"; }
            if (dt.Length>0)
            { 
                string _tmp = dt[0][filed].ToString();
                return string.IsNullOrEmpty(_tmp) ? defaultString : _tmp;
            }
            return defaultString;
        }
        
        #region ***常用对象***

        /// <summary>
        /// 检查类型枚举
        /// </summary>
        public enum CheckingType
        {
            ForbiddenIP = 1,
            BlockToSubmitIPs = 5,
            GlobalCommentabled = 2,
            VerifyCode = 3,
            GlobalSubmittingFrequency = 4
        }

        /// <summary>
        /// 输出 XML 对象
        /// </summary>
        /// <param name="node">节点</param>
        protected static void WriteXml(params KeyValuePair<string, string>[] nodes)
        {

            string xmlCode = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                                + "<root>"
                                + "{node}"
                                + "</root>";

            StringBuilder sbNodes = new StringBuilder();

            foreach (KeyValuePair<string, string> node in nodes)
            {
                sbNodes.AppendFormat("<node key=\"{0}\">{1}</node>",
                    node.Key,
                   HttpUtility.HtmlEncode(node.Value));
            }

            xmlCode = xmlCode.Replace("{node}", sbNodes.ToString());

            HttpContext.Current.Response.ContentType = "text/xml";
            HttpContext.Current.Response.Write(xmlCode);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

        /// <summary>
        /// 输出 XML 对象
        /// </summary>
        /// <param name="node">节点</param>
        protected static void WriteXml(string xml)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "text/xml";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.UTF8;
            HttpContext.Current.Response.Write(xml);
            HttpContext.Current.Response.End();

            //HttpContext.Current.Response.ContentType = "text/xml";
            //HttpContext.Current.Response.Write(xml);
            //HttpContext.Current.Response.Flush();
            //HttpContext.Current.Response.End();
        }

        protected static void WriteXml(List<KeyValuePair<string, string>> listNodes)
        {
            KeyValuePair<string, string>[] nodes = new KeyValuePair<string, string>[listNodes.Count];

            for (int i = 0; i < listNodes.Count; ++i)
            {
                nodes[i] = listNodes[i];
            }

            WriteXml(nodes);
        }
        
        /// <summary>
        /// 安全检查
        /// </summary>
        /// <param name="verCode">源验证码，如果不检查验证，则传递null</param>
        /// <param name="checkingTypes">检查类型参数组</param>
        /// <returns>检查是否通过</returns>
        private static bool SecurityCheck(string verCode, params CheckingType[] checkingTypes)
        {
            //bool rtnVal = true;

            if (Contain(checkingTypes, CheckingType.ForbiddenIP))
            {
                if (ComUtls.IsForbiddenIP(OConfig.GlobalConfig.ForbiddenIPs, IP))
                {
                    WriteString(ORes.Error.TheIpIsForbidToSubmitData);
                    return false;
                }
            }


            if (Contain(checkingTypes, CheckingType.BlockToSubmitIPs))
            {
                if (ComUtls.IsForbiddenIP(OConfig.GlobalConfig.BlockToSubmitIPs, IP))
                {
                    WriteString(ORes.Error.TheIpIsForbidden);
                    return false;
                }
            }

            if (Contain(checkingTypes, CheckingType.GlobalCommentabled))
            {
                if (!OConfig.GlobalConfig.Commentabled)
                {
                    WriteString(ORes.Error.CommentIsClosedBySystem);
                    return false;
                }
            }

            if (Contain(checkingTypes, CheckingType.GlobalSubmittingFrequency))
            {
                if (!BLL.OSecurity.CheckSubmitFrequency(OConfig.GlobalConfig.GlobalSubmitDataInterval))
                {
                    WriteString(ORes.Error.ToAvoidMaliceSubmittingPlsWaitAndResubmit);
                    return false;
                }
            }

            if (Contain(checkingTypes, CheckingType.VerifyCode) && verCode != null)
            {
                if (verCode.Length == 0)
                {
                    WriteString(ORes.Error.VerifyCodeIsRequiredField);
                    return false;
                }

                if (!CheckVerifyCode(verCode))
                {
                    WriteString(ORes.Error.VerifyCodeIsInvalidPlsRefreshAndTryAgain);
                    return false;
                }
            }

            return true;
        }


        private static bool Contain(CheckingType[] checkingTypes, CheckingType checking)
        {
            foreach (CheckingType item in checkingTypes)
            {
                if (item == checking)
                    return true;
            }

            return false;
        }

        /// <summary>
        /// 从 URL 解析参数[Request.QueryString]，解析失败则返回 string.Empty
        /// </summary>
        /// <param name="paraName">参数名</param>
        /// <returns>参数值</returns>
        protected static string QS(string paraName)
        {
            string s = HttpContext.Current.Request.QueryString[paraName];
            return s == null ? string.Empty : s;
        }

        /// <summary>
        /// 从 URL 解析参数[Request.QueryString]，解析失败则返回 默认值;
        /// </summary>
        /// <param name="paraName">参数名</param>
        /// <param name="defaultVal">默认值</param>
        /// <returns>参数值</returns>
        protected static string QS(string paraName, string defaultVal)
        {
            string s = HttpContext.Current.Request.QueryString[paraName];
            return s == null ? defaultVal : s;
        }

        /// <summary>
        /// 获取表单值Request.Form并编码，获取失败则返回 string.Empty
        /// </summary>
        /// <param name="paraName"></param>
        /// <returns></returns>
        private static string ClearGF(string paraName)
        {
            return HttpUtility.HtmlEncode(GF(paraName));
        }

        private const string StrRegex = @"^\+/v(8|9)|\b(and|or)\b.{1,6}?(=|>|<|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)";
        /// <summary>
        /// 获取表单值Request.Form，获取失败则返回 string.Empty
        /// </summary>
        /// <param name="paraName">参数名</param>
        /// <returns>参数值</returns>
        private static string GF(string paraName)
        {
            //string val = HttpContext.Current.Request.Form[paraName];
            //return val == null ? string.Empty : val.Trim();
            string val = HttpContext.Current.Request.Form[paraName];
            if (val == null) { return ""; }
            if (Regex.IsMatch(val, StrRegex))
            {
                //HttpContext.Current.Response.Write("您提交的参数不合法！");
                //HttpContext.Current.Response.End();
                WriteJson(false, "您提交的参数不合法！");
                return "";
            }
            else
            {
                return val == null ? string.Empty : val.Trim();
            }
        }

        /// <summary>
        /// 获取表单值Request.Form，获取失败则返回默认值
        /// </summary>
        /// <param name="paraName">参数名</param>
        /// <param name="defaultVal">默认值</param>
        /// <returns>参数值</returns>
        private static string GF(string paraName, string defaultVal)
        {
            string val = HttpContext.Current.Request.Form[paraName];
            return val == null ? defaultVal : val.Trim();
        }

        /// <summary>
        /// 获取客户端IP地址
        /// </summary>
        protected static string IP
        {
            get
            {
                return ComUtls.HostAddress;
            }
        }

        /// <summary>
        /// 检查验证码
        /// </summary>
        /// <param name="verCode">源验证码</param>
        /// <returns>是否正确</returns>
        protected static bool CheckVerifyCode(string verCode)
        {
            return BLL.OSecurity.CheckVerifyCode(verCode);
        }

        /// <summary>
        /// 输出字符串
        /// </summary>
        /// <param name="str">字符串</param>
        protected static void WriteString(string str)
        {
            HttpContext.Current.Response.ContentType = "plain/text";
            HttpContext.Current.Response.Write(str);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

        protected static void WriteString(string format, params object[] args)
        {
            WriteString(string.Format(format, args));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        #endregion

        #region 读取url参数值
        /// <summary>
        /// 读取url参数值
        /// </summary>
        /// <param name="paramName"></param>
        /// <param name="defaultValue"></param>
        /// <returns></returns>
        private string GetUrlParams(string paramName, string defaultValue)
        {
            string tmp = HttpContext.Current.Request[paramName];
            if (string.IsNullOrEmpty(tmp))
                return defaultValue;
            return tmp.Replace("'", "''");
        }
        #endregion
        /// <summary>
        /// 输出字符串
        /// </summary>
        /// <param name="str">字符串</param>
        protected static void WriteJson(bool state,string msg)
        {
            Hashtable hash = new Hashtable();
            hash["error"] = state ? 1 : 0;
            hash["msg"] = msg;
            HttpContext.Current.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            HttpContext.Current.Response.Write(JsonMapper.ToJson(hash));
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

        /// <summary>
        /// 输出字符串
        /// </summary>
        /// <param name="str">字符串</param>
        protected static void WriteJson(bool state, Hashtable hash)
        {
            hash["error"] = state ? 1 : 0;
            HttpContext.Current.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            HttpContext.Current.Response.Write(JsonMapper.ToJson(hash));
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
        
        public bool CheckPermission(string Permission)
        {
            string url = HttpContext.Current.Request.UrlReferrer.ToString().ToLower();
            string key = "/" + NSW.OConfig2.PrivateSet.OverrideManagerPath + "/";
            key = key.ToLower();
            if (string.IsNullOrEmpty(url) || !url.Contains(key))
            {
                WriteJson(false, "来源可疑，系统忽略该次请求。");
                return false;
            }
            url = url.Substring(url.IndexOf(key) + key.Length);
            return NSW.BLL.Admin.CheckPermission(key, Permission);
        }

        /// <summary>
        /// 根据类型获取提示
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        private static string GetTypeTitle(string typename)
        {
            string tips = string.Empty;
            if (!string.IsNullOrEmpty(typename))
            {
                tips = TypeTitle[typename] as string;
                if (!string.IsNullOrEmpty(tips))
                {
                    return tips;
                }
            }
            tips = ClearGF("pagetitle");
            if (!string.IsNullOrEmpty(tips)) {
                return tips;
            }
            return QS("pagetitle", "");
        }

        public bool CheckPermission_(string url, string Permission) {

            return OSession.Admin.Username.Equals(NSW.BLL.Admin.AdminPermission.AllPERMISSION) || AdminTools.IsSystem || NSW.BLL.Admin.CheckPermission(url, Permission);
        }
        public bool CheckPermission(string type, string Permission)
        {
            type = type.ToLower();
            if (PageHash.ContainsKey(type))
            {
                string[] urls = PageHash[type].ToString().Split(';');
                bool isPermission = false;
                foreach (string url in urls)
                {
                    string page = url;
                    bool isck = false;
                    if (page.Contains("#"))
                    {
                        string _page = page.Substring(0, page.LastIndexOf("#"));
                        string permissions = "," + page.Replace(_page, "") + ",";
                        page = _page;
                        if (permissions.Contains(Permission))
                        {
                            //isPermission = NSW.BLL.Admin.CheckPermission(BLL.Admin.AdminPermission.AllPERMISSION);
                            isPermission = CheckPermission_(page, Permission);
                            isck = true;
                        }
                    }
                    else if (page.Equals("*"))
                    {
                        isPermission = true;
                        isck = true;
                    }
                    if (!isck) {
                        isPermission = CheckPermission_(page, Permission);
                        //isPermission = NSW.BLL.Admin.CheckPermission(BLL.Admin.AdminPermission.AllPERMISSION);
                    }
                    if (isPermission) {
                        return isPermission;
                    }
                }
                return isPermission;
            }
            else if (type.EndsWith(".aspx"))
            {
                return CheckPermission_(type, Permission);
            }
            else {
                WriteJson(false, "来源可疑，系统忽略该次请求。");
                return false;
            }
        }

        private static Hashtable _TypeTitle;
        public static Hashtable TypeTitle
        {
            get
            {
                if (_TypeTitle == null)
                {
                    _TypeTitle = new Hashtable();
                    _TypeTitle.Add("product", "产品");
                    _TypeTitle.Add("productcolumn", "产品分类");

                    _TypeTitle.Add("download", "下载");
                    _TypeTitle.Add("downloadcolumn", "下载分类");
                    
                    _TypeTitle.Add("project", "方案");
                    _TypeTitle.Add("projectcolumn", "方案分类");

                    _TypeTitle.Add("news", "资讯");
                    _TypeTitle.Add("newscolumn", "资讯分类");

                    _TypeTitle.Add("help", "帮助");
                    _TypeTitle.Add("helpcolumn", "帮助分类");

                    _TypeTitle.Add("agent", "招商加盟");
                    _TypeTitle.Add("agentcolumn", "加盟分类");

                    _TypeTitle.Add("productattributecolumn", "产品属性");

                    _TypeTitle.Add("projectattributecolumn", "方案属性");

                    _TypeTitle.Add("picture", "图库");

                    _TypeTitle.Add("admin_systemmenu", "系统菜单");

                    _TypeTitle.Add("vpage", "微网页");

                    _TypeTitle.Add("mproduct", "产品管理");
                    _TypeTitle.Add("mproductcolumn", "产品管理分类");

                    _TypeTitle.Add("marticle", "文章管理");
                    _TypeTitle.Add("marticlecolumn", "文章管理分类");
                }
                return _TypeTitle;
            }
            set { _TypeTitle = value; }
        }

        private Hashtable _PageHash;
        public Hashtable PageHash
        {
            get
            {
                if (_PageHash == null)
                {
                    _PageHash = new Hashtable();
                    _PageHash.Add("product", "products.aspx");
                    _PageHash.Add("productcolumn", "product_column.aspx");

                    _PageHash.Add("download", "downloads.aspx");
                    _PageHash.Add("downloadcolumn", "download_column.aspx");
                    
                    _PageHash.Add("project", "projects.aspx");
                    _PageHash.Add("projectcolumn", "project_column.aspx");

                    _PageHash.Add("news", "news.aspx");
                    _PageHash.Add("newscolumn", "news_column.aspx");

                    _PageHash.Add("help", "helps.aspx");
                    _PageHash.Add("helpcolumn", "help_column.aspx");

                    _PageHash.Add("agent", "agents.aspx");
                    _PageHash.Add("agentcolumn", "agent_column.aspx");

                    _PageHash.Add("dellog", "admin_systemlog.aspx");
                    //_PageHash.Add("deladmin", "admin_admin.aspx");
                    _PageHash.Add("systemmenu", "admin_systemmenu.aspx#delpermission,updatepermission");
                    _PageHash.Add("admin", "admin_admin.aspx#insertpermission,updatepermission");
                    _PageHash.Add("usergroup", "usergroup.aspx");
                    _PageHash.Add("users", "users.aspx");
                    _PageHash.Add("menu", "Mune_config.aspx");
                    _PageHash.Add("firendlink", "friend_links_edit.aspx");
                    _PageHash.Add("jobcolumns", "jobs.aspx");
                    _PageHash.Add("keywordcolumns", "keywords.aspx");
                    _PageHash.Add("nvcontrols", "nvcontrols.aspx");
                    _PageHash.Add("sitepagecolumn", "sitepage.aspx");
                    _PageHash.Add("tagcolumn", "tags.aspx");
                    _PageHash.Add("tbleavemessage", "tbleavemessage.aspx");
                    _PageHash.Add("tbforms", "tbforms.aspx");

                    _PageHash.Add("productattributecolumn", "product_attribute.aspx");
                    _PageHash.Add("projectattributecolumn", "project_attribute.aspx");

                    _PageHash.Add("pdcomment", "product_comment.aspx");
                    _PageHash.Add("pjcomment", "project_comment.aspx");
                    _PageHash.Add("newscomment", "news_comment.aspx");
                    _PageHash.Add("agentcomment", "agent_comment.aspx");
                    _PageHash.Add("helpcomment", "help_comment.aspx");

                    _PageHash.Add("picture", "*");
                    _PageHash.Add("files", "*");
                    
                    _PageHash.Add("templatecolumn", "template.aspx#delpermission,updatepermission");

                    _PageHash.Add("admin_systemmenu", "admin_systemmenu.aspx");
                    _PageHash.Add("video", "video_edit.aspx");

                    //界面权限
                    _PageHash.Add("ad_column.aspx", "ads.aspx;ggs.aspx");
                    _PageHash.Add("gg_column.aspx", "ads.aspx;ggs.aspx");
                    
                    _PageHash.Add("template_column.aspx", "template.aspx");

                    _PageHash.Add("job_column.aspx", "jobs.aspx");
                    _PageHash.Add("tbleavemessage.aspx", "tbforms.aspx");

                    _PageHash.Add("ggs.aspx", "ggs.aspx;ads.aspx");

                    _PageHash.Add("picture_column.aspx", "*");

                    //手机单独添加 
                    _PageHash.Add("marticle", "marticle.aspx");
                    _PageHash.Add("marticlecolumn", "marticle_column.aspx");
                    _PageHash.Add("mproduct", "mproducts.aspx");
                    _PageHash.Add("mproductcolumn", "mproduct_column.aspx");
                }
                return _PageHash;
            }
            set { _PageHash = value; }
        }

        private static Hashtable _ColumnSqlTemp;
        public static Hashtable ColumnSqlTemp
        {
            get
            {
                if (_ColumnSqlTemp == null)
                {
                    _ColumnSqlTemp = new Hashtable();
                    _ColumnSqlTemp.Add("productcolumn", @"
INSERT INTO [tbProductColumn]
    ([Title]
    ,[ParentID]
    ,[Directory]
    ,[TitleKeyword]
    ,[PageTitle]
    ,[MetaKeyword]
    ,[MetaDescription]
    ,[PhotoName]
    ,[PhotoPath]
    ,[DefaultTag]
    ,[URL]
    ,[ShortDesc]
    ,[Attribute]
    ,[BrankName]
    ,[Icon]
    ,[ExtendTag]
    ,[isShowSubFolder]
    ,[isShowMsg]
    ,[MsgTags]
    ,[MsgNewsIDs]
    ,[isShowAD]
    ,[ADKeyword]
    ,[isShowCommend]
    ,[Discount]
    ,[OrderID]
    ,[isCommend]
    ,[isBest]
    ,[isTop]
    ,[Enable]
    ,[InputTime]
    ,[ExpandURL]
    ,[Height]
    ,[Width]
    ,[MShowDetail]
    ,[ParsePage]
    ,[MParsePage]
    ,[Authority]
    ,[isFullScreen]
    ,[BannerPath]
    ,[BannerAlt]
    ,[BannerURL]
    ,[BannerHeight]
    ,[PageSize]
    ,[MsgProductIDs]
    ,[isShowDesc]
    ,[CustomFields01]
    ,[CustomFields02]
    ,[TempPath])
VALUES
    ('{0}'
    ,{1}
    ,'{3}'
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,0
    ,0
    ,''
    ,''
    ,0
    ,''
    ,0
    ,0
    ,50
    ,0
    ,0
    ,0
    ,1
    ,getdate()
    ,dbo.procGetPY('{5}',10)
    ,0
    ,0
    ,1
    ,''
    ,''
    ,''
    ,0
    ,''
    ,''
    ,''
    ,''
    ,20
    ,''
    ,0
    ,''
    ,''
    ,'{4}');
");
                    _ColumnSqlTemp.Add("projectcolumn", @"
INSERT INTO [tbProjectColumn]
    ([Title]
    ,[ParentID]
    ,[Directory]
    ,[TitleKeyword]
    ,[PageTitle]
    ,[MetaKeyword]
    ,[MetaDescription]
    ,[PhotoName]
    ,[PhotoPath]
    ,[DefaultTag]
    ,[URL]
    ,[ShortDesc]
    ,[Attribute]
    ,[BrankName]
    ,[Icon]
    ,[ExtendTag]
    ,[isShowSubFolder]
    ,[isShowMsg]
    ,[MsgTags]
    ,[MsgNewsIDs]
    ,[isShowAD]
    ,[ADKeyword]
    ,[isShowCommend]
    ,[Discount]
    ,[OrderID]
    ,[isCommend]
    ,[isBest]
    ,[isTop]
    ,[Enable]
    ,[InputTime]
    ,[ExpandURL]
    ,[Height]
    ,[Width]
    ,[MShowDetail]
    ,[ParsePage]
    ,[MParsePage]
    ,[Authority]
    ,[isFullScreen]
    ,[BannerPath]
    ,[BannerAlt]
    ,[BannerURL]
    ,[BannerHeight]
    ,[PageSize]
    ,[MsgProductIDs]
    ,[isShowDesc]
    ,[CustomFields01]
    ,[CustomFields02]
    ,[TempPath])
VALUES
    ('{0}'
    ,{1}
    ,'{3}'
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,0
    ,0
    ,''
    ,''
    ,0
    ,''
    ,0
    ,0
    ,50
    ,0
    ,0
    ,0
    ,1
    ,getdate()
    ,dbo.procGetPY('{5}',10)
    ,0
    ,0
    ,1
    ,''
    ,''
    ,''
    ,0
    ,''
    ,''
    ,''
    ,''
    ,20
    ,''
    ,0
    ,''
    ,''
    ,'{4}');
");

                    _ColumnSqlTemp.Add("newscolumn", @"
INSERT INTO [tbNewsColumn]
    ([Title]
    ,[ParentID]
    ,[Directory]
    ,[PageTitle]
    ,[MetaKeyword]
    ,[MetaDescription]
    ,[TitleKeyword]
    ,[DefaultTag]
    ,[PhotoName]
    ,[PhotoPath]
    ,[ShowDetail]
    ,[ShortDesc]
    ,[URL]
    ,[OrderID]
    ,[Enable]
    ,[IsOpen]
    ,[InputTime]
    ,[ExpandURL]
    ,[Height]
    ,[Width]
    ,[MShowDetail]
    ,[ParsePage]
    ,[MParsePage]
    ,[isFullScreen]
    ,[BannerPath]
    ,[BannerAlt]
    ,[BannerURL]
    ,[BannerHeight]
    ,[PageSize]
    ,[MsgProductIDs]
    ,[isShowDesc]
    ,[CustomFields01]
    ,[CustomFields02]
    ,[isCommend]
    ,[isBest]
    ,[isTop]
    ,[Authority]
    ,[Icon]
    ,[isShowIntroduction]
    ,[ShowType]
    ,[TempPath])
VALUES
    ('{0}'
    ,{1}
    ,'{3}'
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,0
    ,''
    ,''
    ,50
    ,1
    ,0
    ,getdate()
    ,dbo.procGetPY('{5}',10)
    ,0
    ,0
    ,1
    ,''
    ,''
    ,0
    ,''
    ,''
    ,''
    ,''
    ,20
    ,''
    ,0
    ,''
    ,''
    ,0
    ,0
    ,0
    ,''
    ,''
    ,0
    ,1
    ,'{4}');
");
                    _ColumnSqlTemp.Add("helpcolumn", @"
INSERT INTO [tbHelpColumn]
    ([Title]
    ,[ParentID]
    ,[Directory]
    ,[PageTitle]
    ,[MetaKeyword]
    ,[MetaDescription]
    ,[TitleKeyword]
    ,[DefaultTag]
    ,[PhotoName]
    ,[PhotoPath]
    ,[ShowDetail]
    ,[ShortDesc]
    ,[URL]
    ,[OrderID]
    ,[Enable]
    ,[IsOpen]
    ,[InputTime]
    ,[ExpandURL]
    ,[Height]
    ,[Width]
    ,[MShowDetail]
    ,[ParsePage]
    ,[MParsePage]
    ,[isFullScreen]
    ,[BannerPath]
    ,[BannerAlt]
    ,[BannerURL]
    ,[BannerHeight]
    ,[PageSize]
    ,[MsgProductIDs]
    ,[isShowDesc]
    ,[CustomFields01]
    ,[CustomFields02]
    ,[isCommend]
    ,[isBest]
    ,[isTop]
    ,[Authority]
    ,[Icon]
    ,[isShowIntroduction]
    ,[ShowType]
    ,[TempPath])
VALUES
    ('{0}'
    ,{1}
    ,'{3}'
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,0
    ,''
    ,''
    ,50
    ,1
    ,0
    ,getdate()
    ,dbo.procGetPY('{5}',10)
    ,0
    ,0
    ,1
    ,''
    ,''
    ,0
    ,''
    ,''
    ,''
    ,''
    ,20
    ,''
    ,0
    ,''
    ,''
    ,0
    ,0
    ,0
    ,''
    ,''
    ,0
    ,1
    ,'{4}');
");
                    _ColumnSqlTemp.Add("agentcolumn", @"INSERT INTO [tbAgentColumn]
    ([Title]
    ,[ParentID]
    ,[Directory]
    ,[PageTitle]
    ,[MetaKeyword]
    ,[MetaDescription]
    ,[TitleKeyword]
    ,[DefaultTag]
    ,[PhotoName]
    ,[PhotoPath]
    ,[ShowDetail]
    ,[ShortDesc]
    ,[URL]
    ,[OrderID]
    ,[Enable]
    ,[IsOpen]
    ,[InputTime]
    ,[ExpandURL]
    ,[Height]
    ,[Width]
    ,[MShowDetail]
    ,[ParsePage]
    ,[MParsePage]
    ,[isFullScreen]
    ,[BannerPath]
    ,[BannerAlt]
    ,[BannerURL]
    ,[BannerHeight]
    ,[PageSize]
    ,[MsgProductIDs]
    ,[isShowDesc]
    ,[CustomFields01]
    ,[CustomFields02]
    ,[isCommend]
    ,[isBest]
    ,[isTop]
    ,[Authority]
    ,[Icon]
    ,[isShowIntroduction]
    ,[ShowType]
    ,[TempPath])
VALUES
    ('{0}'
    ,{1}
    ,'{3}'
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,0
    ,''
    ,''
    ,50
    ,1
    ,0
    ,getdate()
    ,dbo.procGetPY('{5}',10)
    ,0
    ,0
    ,1
    ,''
    ,''
    ,0
    ,''
    ,''
    ,''
    ,''
    ,20
    ,''
    ,0
    ,''
    ,''
    ,0
    ,0
    ,0
    ,''
    ,''
    ,0
    ,1
    ,'{4}');
");
                    //手机添加
                    _ColumnSqlTemp.Add("mproductcolumn", @"
INSERT INTO [tbMProductColumn]
    ([Title]
    ,[ParentID]
    ,[Directory]
    ,[TitleKeyword]
    ,[PageTitle]
    ,[MetaKeyword]
    ,[MetaDescription]
    ,[PhotoName]
    ,[PhotoPath]
    ,[DefaultTag]
    ,[URL]
    ,[ShortDesc]
    ,[Attribute]
    ,[BrankName]
    ,[Icon]
    ,[ExtendTag]
    ,[isShowSubFolder]
    ,[isShowMsg]
    ,[MsgTags]
    ,[MsgNewsIDs]
    ,[isShowAD]
    ,[ADKeyword]
    ,[isShowCommend]
    ,[Discount]
    ,[OrderID]
    ,[isCommend]
    ,[isBest]
    ,[isTop]
    ,[Enable]
    ,[InputTime]
    ,[ExpandURL]
    ,[Height]
    ,[Width]
    ,[MShowDetail]
    ,[ParsePage]
    ,[MParsePage]
    ,[Authority]
    ,[isFullScreen]
    ,[BannerPath]
    ,[BannerAlt]
    ,[BannerURL]
    ,[BannerHeight]
    ,[PageSize]
    ,[MsgProductIDs]
    ,[isShowDesc]
    ,[CustomFields01]
    ,[CustomFields02]
    ,[TempPath])
VALUES
    ('{0}'
    ,{1}
    ,'{3}'
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,0
    ,0
    ,''
    ,''
    ,0
    ,''
    ,0
    ,0
    ,50
    ,0
    ,0
    ,0
    ,1
    ,getdate()
    ,dbo.procGetPY('{5}',10)
    ,0
    ,0
    ,1
    ,''
    ,''
    ,''
    ,0
    ,''
    ,''
    ,''
    ,''
    ,20
    ,''
    ,0
    ,''
    ,''
    ,'{4}');
");


                    _ColumnSqlTemp.Add("marticlecolumn", @"
INSERT INTO [tbMArticleColumn]
    ([Title]
    ,[ParentID]
    ,[Directory]
    ,[PageTitle]
    ,[MetaKeyword]
    ,[MetaDescription]
    ,[TitleKeyword]
    ,[DefaultTag]
    ,[PhotoName]
    ,[PhotoPath]
    ,[ShowDetail]
    ,[ShortDesc]
    ,[URL]
    ,[OrderID]
    ,[Enable]
    ,[IsOpen]
    ,[InputTime]
    ,[ExpandURL]
    ,[Height]
    ,[Width]
    ,[MShowDetail]
    ,[ParsePage]
    ,[MParsePage]
    ,[isFullScreen]
    ,[BannerPath]
    ,[BannerAlt]
    ,[BannerURL]
    ,[BannerHeight]
    ,[PageSize]
    ,[MsgProductIDs]
    ,[isShowDesc]
    ,[CustomFields01]
    ,[CustomFields02]
    ,[isCommend]
    ,[isBest]
    ,[isTop]
    ,[Authority]
    ,[Icon]
    ,[isShowIntroduction]
    ,[ShowType]
    ,[TempPath])
VALUES
    ('{0}'
    ,{1}
    ,'{3}'
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,''
    ,0
    ,''
    ,''
    ,50
    ,1
    ,0
    ,getdate()
    ,dbo.procGetPY('{5}',10)
    ,0
    ,0
    ,1
    ,''
    ,''
    ,0
    ,''
    ,''
    ,''
    ,''
    ,20
    ,''
    ,0
    ,''
    ,''
    ,0
    ,0
    ,0
    ,''
    ,''
    ,0
    ,1
    ,'{4}');
");
                }
                return _ColumnSqlTemp;
            }
            set { _ColumnSqlTemp = value; }
        }

        private static Hashtable _InsertHashtable = null;
        public static Hashtable InsertHashtable
        {
            get
            {
                if (_InsertHashtable == null)
                {
                    _InsertHashtable = new Hashtable();

                    _InsertHashtable.Add("tbjobcolumn", @"INSERT INTO [tbJobColumn] ([Title],[PageTitle],[MetaKeyword],[MetaDescription],[PhotoName],[PhotoPath],[ShowDetail],[ShortDesc],[URL],[OrderID],[Enable],[InputTime],[ParentID]) VALUES('{0}','','','','','',0,'','',50,1,getdate(),0)");
                    _InsertHashtable.Add("tbadcolumn", "INSERT INTO [tbAdColumn]([ParentID],[Title],[ShortDesc],[OrderID],[Enable],[InputTime]) VALUES(1,'{0}','',50,1,getdate())");
                    _InsertHashtable.Add("tbvideocolumn", "INSERT INTO [tbVideoColumn]([ParentID],[Title],[ShortDesc],[OrderID],[Enable],[InputTime]) VALUES(1,'{0}','',50,1,getdate())");
                    _InsertHashtable.Add("tbfriendlinkcolumn", "INSERT INTO tbFriendLinkColumn ([ParentID],[Title],[ShortDesc],[OrderID],[Enable],[InputTime]) VALUES(1,'{0}','',50,1,getdate())");

                }
                return _InsertHashtable;
            }
        }
    }
}