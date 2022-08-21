<%@ WebHandler Language="C#" Class="NSW.Web.Manager.Handler.WAjax" %>

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
    public class WAjax : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {

            //延时，用于客户端测试
            //System.Threading.Thread.Sleep(2000);
            
            //检查来源
            if (!ComUtls.CheckPostSource())
            {
                context.Response.Write(ORes.Error.SuspiciousOfPostingSourceAndBeIgnored);
                return;
            }

            /****************************************
             * 加快方法调用响应速度，所有方法和属性尽量以静态的形式实现
             ***************************************/
            //操作
            string action = context.Request.QueryString["action"];
            switch (action)
            {
                //修改排序
                case "alertOrder": alertOrder(); break;
                //修改置顶字段
                case "enable_toggle": Enable_toggle(); break;
                    //获取分类图片大小
                case "getpicsize": GetColumnPicSize(); break;
                //修改分类信息
                case "alertColumn": alertColumn(); break;
                case "init_imgsize": initimgsize(); break;
                //case "checkemail": CheckEmail(); break;
                case "getpy":
             //       OutputPinYin();
                    OutputFirstLetter();
                    break;
                case "checkfile":
                    CheckFile();
                    break;
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
                //发送获取微信通知
                case "getwxnews":
                    GetWXNews();
                    break;   
                //发送获取微信通知
                case "getwxnewslite":
                    getwxnewslite();
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
                //大文件上传
                case "sendBigFile":
                    SendBigFile();
                    break;
                //生成会员的关键词（八爪图）
                case "SearchKeyWords": SearchKeyWords(); break;
                    //检查分类是否同名
                case "CheckColumnFile": CheckColumnFile(); break;
                //case "checkproductcolumnfile":
                //   // CheckProductColumnFile();
                //    CheckColumnFile();
                //    break;
                ////检查方案分类是否同名
                //case "checkprojectcolumnfile":
                //    //CheckProjectColumnFile();
                //    CheckColumnFile();
                //    break;
                ////检查新闻分类是否同名
                //case "checknewscolumnfile":
                //    //CheckNewsColumnFile();
                //    break;    
                default:
                    WriteString("无效请求。");
                    break;
            }
        }
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
                        info = "要上传的图片宽高为："+NSW.OConfig2.SMTP.P_img_width + "*" + NSW.OConfig2.SMTP.P_img_height;
                    }
                    break;
                case "project":
                    if (NSW.OConfig2.SMTP.ProjectImgWidth != 0 || NSW.OConfig2.SMTP.ProjectImgHeight != 0)
                    {
                        info = "要上传的图片宽高为：" + NSW.OConfig2.SMTP.ProjectImgWidth + "*" + NSW.OConfig2.SMTP.ProjectImgHeight;
                    }
                    break;
                    
            }
            if (c != null && (c.Width != 0 || c.Height != 0))
            {
                WriteString(string.Format("要上传的图片宽高为：{0}*{1}", c.Width, c.Height));
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
        private void Enable_toggle() {
            int oid = ComUtls.ParseInt(GF("OID"), 0);
            string fileColumn = GF("fileColumn");
            int enable = ComUtls.ParseInt(GF("enable"), 0);
            string typename = GF("typename");
            int result = 0;
            string error = "";
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
                                case "isindex":
                                    result = DbSession.Default.Update<tbNews>(tbNews._.Delay, enable, tbNews._.ID == oid);
                                    break;
                            }
                            break;
                        case "newscolumn":
                            result = DbSession.Default.Update<tbNewsColumn>(tbNewsColumn._.Enable, enable, tbNewsColumn._.ID == oid);
                            break;
                        case "agent":
                            result = DbSession.Default.Update<tbAgent>(tbAgent._.Enable, enable, tbAgent._.ID == oid);
                            break;
                        case "agentcolumn":
                            result = DbSession.Default.Update<tbAgentColumn>(tbAgentColumn._.Enable, enable, tbAgentColumn._.ID == oid);
                            break;
                        case "help":
                            result = DbSession.Default.Update<tbHelp>(tbHelp._.Enable, enable, tbHelp._.ID == oid);
                            break;
                        case "helpcolumn":
                            result = DbSession.Default.Update<tbHelpColumn>(tbHelpColumn._.Enable, enable, tbHelpColumn._.ID == oid);
                            break;
                        case "product":
                            switch (fileColumn)
                            {
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
                                case "isindex":
                                    result = DbSession.Default.Update<tbProduct>(tbProduct._.Delay, enable, tbProduct._.ID == oid);
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
                            MuneXML m = listAll.Find(delegate(MuneXML ml) { return ml.OID == oid.ToString(); });
                            m.Enable = enable;
                            XMLTool.SerObject(HttpContext.Current.Server.MapPath("/") + "/Config/Mune.xml", listAll);
                            result = 1;
                            break;
                    }
                }
                catch (Exception ex)
                {
                    error = ex.Message;
                }
                if (result > 0)
                {
                    WriteString("1");
                }
                else
                {
                    WriteString(error);
                }
            }
            else {
                WriteString("拉取记录出错！此记录是否已经被删除!");
            }
        }

        private void alertColumn()
        {
            //当前分类
            int oid = ComUtls.ParseInt(GF("oid"), 0);
            //所属分类
            int pid = ComUtls.ParseInt(GF("pid"), 0);
            int result = 0;
            string error="";
            string typename = GF("typename");
            if (pid > 0 && oid>0)
            {
                try
                {
                    switch (typename)
                    {
                        case "product":
                            result = DbSession.Default.Update<tbProduct>(tbProduct._.ColumnID, pid, tbProduct._.ID == oid);
                            break;
                        case "project":
                            result = DbSession.Default.Update<tbProject>(tbProject._.ColumnID, pid, tbProject._.ID == oid);
                            break;
                    }
                }
                catch (Exception e)
                {
                    error = e.Message;
                }
                WriteString(result > 0 ? "1" : error);
            }
            else
            {
                WriteString("拉取分类出错！请查看此分类是否已经被删除!");
            }
        }
        
        
        private void alertOrder() 
        {
            int oid = ComUtls.ParseInt(GF("OID"), 0);
            int Order = ComUtls.ParseInt(GF("OrderByNum"), 0);
            int result = 0;
            string typename = GF("typename");
            string error = "";
            if (oid > 0)
            {
                try
                {
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
                        case "menu":
                            List<MuneXML> listAll = XMLTool.Deserialize(HttpContext.Current.Server.MapPath("/") + "/Config/Mune.xml");
                            MuneXML m = listAll.Find(delegate(MuneXML ml) { return ml.OID == oid.ToString(); });
                            m.Order = Order;
                            XMLTool.SerObject(HttpContext.Current.Server.MapPath("/") + "/Config/Mune.xml", listAll);
                            result = 1;
                            break;

                    }
                }
                catch (Exception ex)
                {
                    error = ex.Message;
                }
                if (result > 0)
                {
                    WriteString("1");
                }
                else
                {
                    WriteString(error);
                }
            }
            else {
                WriteString("拉取记录出错！此记录是否已经被删除!");
            }
        }
        
        /// <summary>
        /// 检查指定文件名称是否存在，如果不存在，则返回false,否则返回true
        /// </summary>
        private void CheckNewsColumnFile()
        {
            //1\定义变量
            bool ReturnValue;

            //2\设置变量值
            ReturnValue = false;

            //3\检查文件是否存在，如果不存在，则返回false,否则返回true
            try
            {
                string input = HttpUtility.UrlDecode(GetUrlParams("params", ""));
                Field[] nfields = new Field[] { 
                    VW_NewsColumn._.ID              
                };
                WhereClip nwhere = (VW_NewsColumn._.ExpandURL == input);
                DataTable dt = DbSession.Default.From<VW_NewsColumn>().Select(nfields).Where(nwhere).ToDataTable();
                if (dt.Rows.Count > 0)
                    ReturnValue = true;
            }
            catch (Exception ee)
            {
                HttpContext.Current.Response.Write(ReturnValue);
            }
            //4\返回
            HttpContext.Current.Response.Write(ReturnValue.ToString().ToLower());
        }
        /// <summary>
        /// 检查指定文件名称是否存在，如果不存在，则返回false,否则返回true
        /// </summary>
        private void CheckProjectColumnFile()
        {
            //1\定义变量
            bool ReturnValue;

            //2\设置变量值
            ReturnValue = false;

            //3\检查文件是否存在，如果不存在，则返回false,否则返回true
            try
            {
                string input = HttpUtility.UrlDecode(GetUrlParams("params", ""));
                Field[] nfields = new Field[] { 
                    VW_ProjectColumn._.ID              
                };
                WhereClip nwhere = (VW_ProjectColumn._.ExpandURL == input);
                DataTable dt = DbSession.Default.From<VW_ProjectColumn>().Select(nfields).Where(nwhere).ToDataTable();
                if (dt.Rows.Count > 0)
                    ReturnValue = true;
            }
            catch (Exception ee)
            {
                HttpContext.Current.Response.Write(ReturnValue);
            }
            //4\返回
            HttpContext.Current.Response.Write(ReturnValue.ToString().ToLower());
        }
        /// <summary>
        /// 检查指定文件名称是否存在，如果不存在，则返回false,否则返回true
        /// </summary>
        private void CheckColumnFile()
        {
            //1\定义变量
            bool ReturnValue;

            //2\设置变量值
            ReturnValue = false;

            //3\检查文件是否存在，如果不存在，则返回false,否则返回true
            try
            {
                string input = HttpUtility.UrlDecode(GetUrlParams("params", ""));
                Field[] nfields = new Field[] { 
                    tbExpandURL._.ID              
                };
                WhereClip nwhere = (tbExpandURL._.ExpandURL == input);
                DataTable dt = DbSession.Default.From<tbExpandURL>().Select(nfields).Where(nwhere).ToDataTable();
                if (dt.Rows.Count > 0)
                    ReturnValue = true;
            }
            catch (Exception ee)
            {
                HttpContext.Current.Response.Write(ReturnValue);
            }
            //4\返回
            HttpContext.Current.Response.Write(ReturnValue.ToString().ToLower());
        }
        /// <summary>
        /// 检查指定文件名称是否存在，如果不存在，则返回false,否则返回true
        /// </summary>
        private void CheckProductColumnFile()
        {
            //1\定义变量
            bool ReturnValue;

            //2\设置变量值
            ReturnValue = false;

            //3\检查文件是否存在，如果不存在，则返回false,否则返回true
            try
            {
                string input = HttpUtility.UrlDecode(GetUrlParams("params", ""));
                Field[] nfields = new Field[] { 
                    VW_ProductColumn._.ID              
                };
                WhereClip nwhere = (VW_ProductColumn._.ExpandURL == input);
                DataTable dt = DbSession.Default.From<VW_ProductColumn>().Select(nfields).Where(nwhere).ToDataTable();
                if (dt.Rows.Count > 0)
                    ReturnValue = true;
            }
            catch (Exception ee)
            {
                HttpContext.Current.Response.Write(ReturnValue);
            }
            //4\返回
            HttpContext.Current.Response.Write(ReturnValue.ToString().ToLower());
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
        /// 大文件上传
        /// </summary>
        private static void SendBigFile()
        {
            int oid =ComUtls.ParseInt(GF("oid"),0);
            string url = GF("url");

            tbDownload OBJ = DbSession.Default.Get<tbDownload>(tbDownload._.ID == oid);
            OBJ.DownloadURL = url;
            int rowsAffected = DbSession.Default.Save<tbDownload>(OBJ);
            if (rowsAffected > 0)
            {
                //生成静态页面
                Tools.CreateHTML.CreateDownloadHtml(oid, OBJ.Title);
                WriteString("文件保存成功!");
            }
            else
            {
                WriteString("文件保存失败!");
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

            try
            {
                //3>检查文件是否存在，如果不存在，则返回错误信息
                if (NSW.Utls.IOUtls.CheckFileType(".aspx|.ascx|.html|.htm|.txt", FileName))
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
                    ResultString="修改的模板名称只能是html|htm|txt格式";

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
        /// 发送获取微信新闻
        /// </summary>
        private static void GetWXNews()
        {
            string _type = ClearGF("type");
            string sid = ClearGF("sid");
            if (string.IsNullOrEmpty(_type))
            {
                WriteString("");
                return;
            }
            NSW.Web.API.ColumnType type = (NSW.Web.API.ColumnType)Enum.Parse(typeof(NSW.Web.API.ColumnType), _type, true);
            DataTable DT = new DataTable();
            StringBuilder sb = new StringBuilder();
            DataTable dt = new DataTable();
            DT = MyTool.GetColumnTreeByColumnType(type);

            string template = "<option value=\"{0}\" img=\"{1}\" short=\"{2}\" url=\"{3}\" type=\"{5}\">{4}</option>";
            if (!string.IsNullOrEmpty(sid))
            {
                int width = 0, height = 0;
                DataRow[] rows = DT.Select("sid = '" + sid + "'");
                if (rows.Length > 0)
                {
                    width = ComUtls.ParseInt(rows[0]["width"].ToString(), 0);
                    height = ComUtls.ParseInt(rows[0]["height"].ToString(), 0);
                }
                dt = DbSession.Default.FromSql(string.Format("select title,id,shortdesc,photopath,pageurl,mpageurl,mobilepath from vw_{0} where enable=1 and sid like('%{1}%') order by orderid asc ,inputtime desc", type.ToString(), sid)).ToDataTable();
                foreach (DataRow item in dt.Rows)
                {
                    string title = item["title"].ToString();
                    string id = item["id"].ToString();
                    string shortdesc = item["shortdesc"].ToString();
                    string photopath = item["photopath"].ToString();
                    string pageurl = item["pageurl"].ToString();
                    string mpageurl = item["mpageurl"].ToString();
                    string mobilepath = item["mobilepath"].ToString();

                    if (string.IsNullOrEmpty(mobilepath))
                    {
                        if (!string.IsNullOrEmpty(photopath))
                        {
                            mobilepath = "/mobile" + photopath + "_" + width + "X" + height + ".jpg";
                        }
                        else
                        {
                            mobilepath = NSW.OConfig.GlobalConfig.Logo;
                        }
                    }
                    sb.AppendFormat(template, id, mobilepath, shortdesc, mpageurl, title, _type + "_" + sid + "_" + id);
                }
            }
            WriteString(sb.ToString());
            dt.Dispose();
            return;
        }
        
        /// <summary>
        /// 发送获取微信新闻
        /// </summary>
        private static void getwxnewslite()
        {

            string SIGLE_TEMPLATE = "{0}$#${1}$#${2}$#${3}$#$$shortdesc$$#${4}$#${5}";
            string TEMPLATE = "{0}$#${1}$#${2}$#${3}$#${4}$#${5}";
            
            string _type = ClearGF("types");//1 微信 别的 站内
            string typesinfo = ClearGF("typesinfo");//如果是站内,是类型
            string dataid = ClearGF("dataid");//id
            DataTable dt = new DataTable();
            StringBuilder sb = new StringBuilder();
            if (_type == "1" || _type == "") //微信里面的
            {
                string[] ids = dataid.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                dt = DbSession.Default.From<tbWeiXinNews>().Where(tbWeiXinNews._.ID.In(ids)).ToDataTable(8);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow item in dt.Rows)
                    {
                        string title = item["title"].ToString();
                        string author = item["author"].ToString();
                        string photopath = item["photopath"].ToString();
                        string shortdesc = item["shortdesc"].ToString();
                        string content = item["content"].ToString();
                        string iscoverpic = item["iscoverpic"].ToString();
                        string baseurl = item["baseurl"].ToString();
                        sb.AppendFormat(SIGLE_TEMPLATE.Replace("$shortdesc$", shortdesc), title, author, photopath, iscoverpic, content, baseurl);
                        sb.Append("$##||$");
                    }
                }
            }
            else
            {
                if (string.IsNullOrEmpty(dataid))
                {
                    WriteString("");
                    return;
                }
                else
                {
                    dataid = dataid.Remove(dataid.Length - 1);
                }

                NSW.Web.API.ColumnType type = (NSW.Web.API.ColumnType)Enum.Parse(typeof(NSW.Web.API.ColumnType), typesinfo, true);
                dt = DbSession.Default.FromSql(string.Format("select top 8 [id],[title],[width],[pageurl],[mobilepage],[photopath],[MobilePath],[height],[shortdesc],[inputtime],[content],[mcontent] from vw_{0} where {1} ", type.ToString(), string.Format(" enable=1 and id in({0}) ", dataid))).ToDataTable();

                int width = 0, height = 0;

                foreach (DataRow item in dt.Rows)
                {
                    string title = item["title"].ToString();
                    string id = item["id"].ToString();
                    string shortdesc = item["shortdesc"].ToString();
                    string photopath = item["photopath"].ToString();
                    string pageurl = item["pageurl"].ToString();
                    string mobilepage = item["mobilepage"].ToString();
                    string mobilepath = item["mobilepath"].ToString();
                    width = ComUtls.ParseInt(item["width"].ToString(), 0);
                    height = ComUtls.ParseInt(item["height"].ToString(), 0);

                    if (string.IsNullOrEmpty(mobilepath))
                    {
                        if (!string.IsNullOrEmpty(photopath))
                        {
                            mobilepath = "/mobile" + photopath + "_" + width + "X" + height + ".jpg";
                        }
                        else
                        {
                            mobilepath = NSW.OConfig.GlobalConfig.Logo;
                        }
                    }

                    string content = item["content"].ToString();
                    string mcontent = item["mcontent"].ToString();
                    if (string.IsNullOrEmpty(mcontent))
                    {
                        mcontent = NSW.Mobile.String.StringRegex(content);
                    }


                    //string iscoverpic = item["iscoverpic"].ToString();
                    pageurl = NSW.OConfig.Common.SiteDomain + (string.IsNullOrEmpty(mobilepage) ? pageurl : mobilepage);

                    sb.AppendFormat(SIGLE_TEMPLATE.Replace("$shortdesc$", shortdesc), title, "", mobilepath, "0", mcontent, pageurl);
                    sb.Append("$##||$");
                }
            }
            WriteString(string.IsNullOrEmpty(sb.ToString()) ? "" : sb.Remove(sb.Length - 6, 6).ToString());
            dt.Dispose();
            return;
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

        /// <summary>
        /// 检查指定文件名称是否存在，如果不存在，则返回false,否则返回true
        /// </summary>
        /// <returns></returns>
        private void CheckFile()
        {
            //1\定义变量
            bool ReturnValue;

            //2\设置变量值
            ReturnValue = false;
            string input = HttpUtility.UrlDecode(GetUrlParams("params", ""));
            string columntype = HttpUtility.UrlDecode(GetUrlParams("columntype", ""));
            int columnid = ComUtls.ParseInt(HttpUtility.UrlDecode(GetUrlParams("columnid", "0")),0);

            //3\检查文件是否存在，如果不存在，则返回false,否则返回true
            if (columntype == "")//加盟的 没有文件夹，就默认
            {
                if (NSW.Utls.IOUtls.IsExist(NSW.Utls.IOUtls.GetMapPath(input), NSW.Utls.IOUtls.FsoMethod.File))
                {
                    ReturnValue = true;
                }
                if (input.IndexOf("_1.html") > -1)
                {
                    input = StringUtls.SubmitString(input, "/agents/", "_1.html");
                }
                else
                {
                    input = StringUtls.SubmitString(input, "/agents/", ".html");
                }
            }
            else {
                DataTable dt = new DataTable();
                string directory = "";
                switch (columntype)
                {
                    case "news":
                        dt = DbSession.Default.From<VW_NewsColumn>().Where(VW_NewsColumn._.Enable == 1 && VW_NewsColumn._.ID == columnid).ToDataTable(1);
                        directory = GetDirectoryInfo(dt, null, NSW.OConfig.Common.NewsHtmlTargetPath);
                        break;
                    case "help":
                        dt = DbSession.Default.From<VW_HelpColumn>().Where(VW_HelpColumn._.Enable == 1 && VW_HelpColumn._.ID == columnid).ToDataTable(1);
                        directory = GetDirectoryInfo(dt,null,NSW.OConfig.Common.HelpHtmlTargetPath);
                        break;
                    case "product":
                        dt = DbSession.Default.From<VW_ProductColumn>().Where(VW_ProductColumn._.Enable == 1 && VW_ProductColumn._.ID == columnid).ToDataTable(1);
                        directory = GetDirectoryInfo(dt,null, NSW.OConfig.Common.ProductHtmlTargetPath);
                        break;
                    case "project":
                        dt = DbSession.Default.From<VW_ProjectColumn>().Where(VW_ProjectColumn._.Enable == 1 && VW_ProjectColumn._.ID == columnid).ToDataTable(1);
                        directory = GetDirectoryInfo(dt,null, NSW.OConfig.Common.ProjectHtmlTargetPath);
                        break;
                    default :
                        directory = columntype;
                        break;
                }
                if (directory != "")
                {
                    if (NSW.Utls.IOUtls.IsExist(NSW.Utls.IOUtls.GetMapPath(directory + input), NSW.Utls.IOUtls.FsoMethod.File))
                    {
                        ReturnValue = true;
                    }
                }
                
            }

            if (input.IndexOf("_1.html") > -1)
            {
                input = input.Substring(0, input.IndexOf("_1.html"));
            }
            else
            {
                input = input.Substring(0, input.IndexOf(".html"));
            }
            //3.检查是否和扩展链接冲突
            if (DbSession.Default.Get<tbExpandURL>(tbExpandURL._.ExpandURL == input) != null && NSW.OConfig.Common.ReWriteUrlExt == ".html")
            { ReturnValue = true; }
            //4\返回
            HttpContext.Current.Response.Write(ReturnValue.ToString().ToLower());

        }

        private string NullEmpty(string input, string defaultString)
        {
            return string.IsNullOrEmpty(input) ? defaultString : input;
        }

        private string GetDirectoryInfo(DataTable dt,string filed, string defaultString)
        {
            if (string.IsNullOrEmpty(filed)) { filed = "directory"; }
            if (dt.Rows.Count > 0)
            { 
                string _tmp = dt.Rows[0][filed].ToString();
                return string.IsNullOrEmpty(_tmp) ? defaultString : _tmp;
            }
            return defaultString;
        }
        
        #region 获取汉字拼音的首字母
        
        private void OutputFirstLetter() 
        {
            string result = "";
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "text/plain";
            //1、读取参数
            string input = HttpUtility.UrlDecode(GetUrlParams("params", ""));
            //2、校验参数
            if (string.IsNullOrEmpty(input))
            {
                HttpContext.Current.Response.Write("error");
                return;
            }
            byte[] _cBs = System.Text.Encoding.Default.GetBytes(input);

            if(_cBs.Length<2)
                result=input;

           byte ucHigh, ucLow;
           int  nCode;

           string strFirstLetter = string.Empty;

            for (int i = 0; i < _cBs.Length; i++)
           {

                if (_cBs[i] < 0x80)
                {
                    strFirstLetter += Encoding.Default.GetString(_cBs, i, 1);
                    continue;
               }

                ucHigh = (byte)_cBs[i];
               ucLow = (byte)_cBs[i + 1];
                if ( ucHigh < 0xa1 || ucLow < 0xa1)
                    continue;
                else
                // Treat code by section-position as an int type parameter,
                // so make following change to nCode.
                   nCode = (ucHigh - 0xa0) * 100 + ucLow - 0xa0;

                string str = FirstLetter(nCode);
                
                strFirstLetter += str != string.Empty ? str : Encoding.Default.GetString(_cBs, i, 2);
                i++;
            }
            result = strFirstLetter;
            //3\过滤非法字符
            Regex reg = new Regex(@"[^0-9A-Za-z_]");
            result = reg.Replace(result, "").ToLower();
            //KeyValuePair<string, string> state, outpot;
            //DbSession.Default.f
            
            //WriteXml(new  List<KeyValuePair<string,string>>
            HttpContext.Current.Response.Write(result);
        }
        public  string FirstLetter(int nCode)
        {
            string strLetter = string.Empty;

            if (nCode >= 1601 && nCode < 1637) strLetter = "A";
            if (nCode >= 1637 && nCode < 1833) strLetter = "B";
            if (nCode >= 1833 && nCode < 2078) strLetter = "C";
            if (nCode >= 2078 && nCode < 2274) strLetter = "D";
            if (nCode >= 2274 && nCode < 2302) strLetter = "E";
            if (nCode >= 2302 && nCode < 2433) strLetter = "F";
            if (nCode >= 2433 && nCode < 2594) strLetter = "G";
            if (nCode >= 2594 && nCode < 2787) strLetter = "H";
            if (nCode >= 2787 && nCode < 3106) strLetter = "J";
            if (nCode >= 3106 && nCode < 3212) strLetter = "K";
            if (nCode >= 3212 && nCode < 3472) strLetter = "L";
            if (nCode >= 3472 && nCode < 3635) strLetter = "M";
            if (nCode >= 3635 && nCode < 3722) strLetter = "N";
            if (nCode >= 3722 && nCode < 3730) strLetter = "O";
            if (nCode >= 3730 && nCode < 3858) strLetter = "P";
            if (nCode >= 3858 && nCode < 4027) strLetter = "Q";
            if (nCode >= 4027 && nCode < 4086) strLetter = "R";
            if (nCode >= 4086 && nCode < 4390) strLetter = "S";
            if (nCode >= 4390 && nCode < 4558) strLetter = "T";
            if (nCode >= 4558 && nCode < 4684) strLetter = "W";
            if (nCode >= 4684 && nCode < 4925) strLetter = "X";
            if (nCode >= 4925 && nCode < 5249) strLetter = "Y";
            if (nCode >= 5249 && nCode < 5590) strLetter = "Z";
            if (nCode == 5958) strLetter = "Z";
            if (nCode >= 5601 && nCode < 8794 && nCode != 5958) 
            {
                string CodeData = "cjwgnspgcenegyPBtwxzdxykygtpjnmjqmbsgzscyjsyyfpggbzgydywjkgaljswkbjqhyjwpdzlsgmr"
+ "ybywwccgznkydgttngjeyekzydcjnmcylqlypyqbqrpzslwbdgkjfyxjwcltbncxjjjjcxdtqsqzycdxxhgckbphffss"
+ "pybgmxjbbyglbhlssmzmpjhsojnghdzcdklgjhsgqzhxqgkezzwymcscjnyetxadzpmdssmzjjqjyzcjjfwqjbdzbjgd"
+ "nzcbwhgxhqkmwfbpbqdtjjzkqhylcgxfptyjyyzpsjlfchmqshgmmxsxjpkdcmbbqbefsjwhwwgckpylqbgldlcctnma"
+ "eddksjngkcsgxlhzaybdbtsdkdylhgymylcxpycjndqjwxqxfyyfjlEJBzrwccqhqcsbzkymgplbmcrqcflnymyqmsqt"
+ "rbcjthztqfrxchxmcjcjlxqgjmshzkbswxemdlckfsydsglycjjssjnqbjctyhbftdcyjdgwyghqfrxwckqkxebpdjpx"
+ "jqsrmebwgjlbjslyysmdxlclqkxlhtjrjjmbjhxhwywcbhtrxxglhjhfbmgykldyxzpplggpmtcbbajjzyljtyanjgbj"
+ "flqgdzyqcaxbkclecjsznslyzhlxlzcghbxzhznytdsbcjkdlzayffydlabbgqszkggldndnyskjshdlxxbcghxyggdj"
+ "mmzngmmccgwzszxsjbznmlzdthcqydbdllscddnlkjyhjsycjlkohqasdhnhcsgaehdaashtcplcpqybsdmpjlpcjaql"
+ "cdhjjasprchngjnlhlyyqyhwzpnccgwwmzffjQQqqxxaclbhkdjxdgmmydjxzllsygxgkjrywzwyclzmcsjzldbndcfc"
+ "xyhlschycjqppqagmnyxpfrkssbjlyxyjjglnscmhcwwmnzjjlhmhchsyppttxrycsxbyhcsmxjsxnbwgpxxtaybgajc"
+ "xlypdccwqocwkccsbnhcpdyznbcyytyckskybsqkkytqqxfcwchcwkelcqbsqyjqcclmthsywhmktlkjlychwheqjhtj"
+ "hppqpqscfymmcmgbmhglgsllysdllljpchmjhwljcyhzjxhdxjlhxrswlwzjcbxmhzqxsdzpmgfcsglsdymjshxpjxom"
+ "yqknmyblrthbcftpmgyxlchlhlzylxgsssscclsldclepbhshxyyfhbmgdfycnjqwlqhjjcywjztejjdhfblqxtqkwhd"
+ "chqxagtlxljxmsljhdzkzjecxjcjnmbbjcsfywkbjzghysdcpqyrsljpclpwxsdwejbjcbcnaytmgmbapclyqbclzxcb"
+ "nmsggfnzjjbzsfqyndxhpcqkzczwalsbccjxpozgwkybsgxfcfcdkhjbstlqfsgdslqwzkxtmhsbgzhjcrglyjbpmljs"
+ "xlcjqqhzmjczydjwbmjklddpmjegxyhylxhlqyqhkycwcjmyhxnatjhyccxzpcqlbzwwwtwbqcmlbmynjcccxbbsnzzl"
+ "jpljxyztzlgcldcklyrzzgqtgjhhgjljaxfgfjzslcfdqzlclgjdjcsnclljpjqdcclcjxmyzftsxgcgsbrzxjqqcczh"
+ "gyjdjqqlzxjyldlbcyamcstylbdjbyregklzdzhldszchznwczcllwjqjjjkdgjcolbbzppglghtgzcygezmycnqcycy"
+ "hbhgxkamtxyxnbskyzzgjzlqjdfcjxdygjqjjpmgwgjjjpkjsbgbmmcjssclpqpdxcdyykypcjddyygywchjrtgcnyql"
+ "dkljczzgzccjgdyksgpzmdlcphnjafyzdjcnmwescsglbtzcgmsdllyxqsxsbljsbbsgghfjlwpmzjnlyywdqshzxtyy"
+ "whmcyhywdbxbtlmswyyfsbjcbdxxlhjhfpsxzqhfzmqcztqcxzxrdkdjhnnyzqqfnqdmmgnydxmjgdhcdycbffallztd"
+ "ltfkmxqzdngeqdbdczjdxbzgsqqddjcmbkxffxmkdmcsychzcmljdjynhprsjmkmpcklgdbqtfzswtfgglyplljzhgjj"
+ "gypzltcsmcnbtjbhfkdhbyzgkpbbymtdlsxsbnpdkleycjnycdykzddhqgsdzsctarlltkzlgecllkjljjaqnbdggghf"
+ "jtzqjsecshalqfmmgjnlyjbbtmlycxdcjpldlpcqdhsycbzsckbzmsljflhrbjsnbrgjhxpdgdjybzgdlgcsezgxlblg"
+ "yxtwmabchecmwyjyzlljjshlgndjlslygkdzpzxjyyzlpcxszfgwyydlyhcljscmbjhblyjlycblydpdqysxktbytdkd"
+ "xjypcnrjmfdjgklccjbctbjddbblblcdqrppxjcglzcshltoljnmdddlngkaqakgjgyhheznmshrphqqjchgmfprxcjg"
+ "dychghlyrzqlcngjnzsqdkqjymszswlcfqjqxgbggxmdjwlmcrnfkkfsyyljbmqammmycctbshcptxxzzsmphfshmclm"
+ "ldjfyqxsdyjdjjzzhqpdszglssjbckbxyqzjsGPSxjzqznqtbdkwxjkhhgflbcsmdldgdzdblzkycqnncsybzbfglzzx"
+ "swmsccmqnjqsbdqsjtxxmbldxcclzshzcxrqjgjylxzfjphymzqqydfqjjlcznzjcdgzygcdxmzysctlkphtxhtlbjxj"
+ "lxscdqccbbqjfqzfsltjbtkqbsxjjljchczdbzjdczjccprnlqcgpfczlclcxzdmxmphgsgzgszzqjxlwtjpfsyaslcj"
+ "btckwcwmytcsjjljcqlwzmalbxyfbpnlschtgjwejjxxglljstgshjqlzfkcgnndszfdeqfhbsaqdgylbxmmygszldyd"
+ "jmjjrgbjgkgdhgkblgkbdmbylxwcxyttybkmrjjzxqjbhlmhmjjzmqasldcyxyqdlqcafywyxqhz";
                String _gbcode = nCode.ToString();
                int pos = (Convert.ToInt16(_gbcode.Substring(0, 2)) - 56) * 94 + Convert.ToInt16(_gbcode.Substring(_gbcode.Length - 2, 2));
                strLetter=CodeData.Substring(pos - 1, 1);
            }
            //if (strLetter == string.Empty) 
            //{
            //    string str="";
            //    OutputPinYin(strLetter, out str);
            //    strLetter = str;
            //}
            //    System.Windows.Forms.MessageBox.Show(String.Format("信息：/n{0}为非常用字符编码,不能为您解析相应匹配首字母！",nCode));
            return strLetter;
        }
        #endregion
        
        #region 汉字转拼音
        private System.Collections.Hashtable ht;
        private string g(int num)
        {
            if (num < -20319 || num > -10247)
                return "";
            while (!ht.ContainsKey(num))
                num--;
            return ht[num].ToString();
        }
       
        /// <summary>
        /// 把汉字转换为全拼输入
        /// </summary>
        /// <param name="hz">录入的汉字，类型：字符串</param>
        /// <returns>经过转换的拼音全拼字符串</returns>
        private void OutputPinYin()
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "text/plain";
            //1、读取参数
            string input = HttpUtility.UrlDecode(GetUrlParams("params", ""));
            //2、校验参数
            if (string.IsNullOrEmpty(input))
            {
                HttpContext.Current.Response.Write("error");
                return;
            }
            //1、获取汉字表
            if (HttpContext.Current.Cache["HanZiTable"] == null)
            {
                GetHanZiTable();
            }
            ht = (System.Collections.Hashtable)HttpContext.Current.Cache["HanZiTable"];

            //2、开始翻译
            byte[] b = System.Text.Encoding.Default.GetBytes(input);
            int p;
            StringBuilder ret = new StringBuilder();
            for (int i = 0; i < b.Length; i++)
            {
                p = (int)b[i];
                if (p > 160)
                {
                    p = p * 256 + b[++i] - 65536;
                    ret.Append(g(p));
                }
                else
                {
                    ret.Append((char)p);
                }
            }
            string result = ret.ToString();
            //3\过滤非法字符
            Regex reg = new Regex(@"[^0-9A-Za-z_]");
            result = reg.Replace(result, "");
            HttpContext.Current.Response.Write(result);
        }
        /// <summary>
        /// 把汉字表存放到Cache里面
        /// </summary>
        private void GetHanZiTable()
        {
            ht = new System.Collections.Hashtable();
            ht.Add(-20319, "a");
            ht.Add(-20317, "ai");
            ht.Add(-20304, "an");
            ht.Add(-20295, "ang");
            ht.Add(-20292, "ao");
            ht.Add(-20283, "ba");
            ht.Add(-20265, "bai");
            ht.Add(-20257, "ban");
            ht.Add(-20242, "bang");
            ht.Add(-20230, "bao");
            ht.Add(-20051, "bei");
            ht.Add(-20036, "ben");
            ht.Add(-20032, "beng");
            ht.Add(-20026, "bi");
            ht.Add(-20002, "bian");
            ht.Add(-19990, "biao");
            ht.Add(-19986, "bie");
            ht.Add(-19982, "bin");
            ht.Add(-19976, "bing");
            ht.Add(-19805, "bo");
            ht.Add(-19784, "bu");
            ht.Add(-19775, "ca");
            ht.Add(-19774, "cai");
            ht.Add(-19763, "can");
            ht.Add(-19756, "cang");
            ht.Add(-19751, "cao");
            ht.Add(-19746, "ce");
            ht.Add(-19741, "ceng");
            ht.Add(-19739, "cha");
            ht.Add(-19728, "chai");
            ht.Add(-19725, "chan");
            ht.Add(-19715, "chang");
            ht.Add(-19540, "chao");
            ht.Add(-19531, "che");
            ht.Add(-19525, "chen");
            ht.Add(-19515, "cheng");
            ht.Add(-19500, "chi");
            ht.Add(-19484, "chong");
            ht.Add(-19479, "chou");
            ht.Add(-19467, "chu");
            ht.Add(-19289, "chuai");
            ht.Add(-19288, "chuan");
            ht.Add(-19281, "chuang");
            ht.Add(-19275, "chui");
            ht.Add(-19270, "chun");
            ht.Add(-19263, "chuo");
            ht.Add(-19261, "ci");
            ht.Add(-19249, "cong");
            ht.Add(-19243, "cou");
            ht.Add(-19242, "cu");
            ht.Add(-19238, "cuan");
            ht.Add(-19235, "cui");
            ht.Add(-19227, "cun");
            ht.Add(-19224, "cuo");
            ht.Add(-19218, "da");
            ht.Add(-19212, "dai");
            ht.Add(-19038, "dan");
            ht.Add(-19023, "dang");
            ht.Add(-19018, "dao");
            ht.Add(-19006, "de");
            ht.Add(-19003, "deng");
            ht.Add(-18996, "di");
            ht.Add(-18977, "dian");
            ht.Add(-18961, "diao");
            ht.Add(-18952, "die");
            ht.Add(-18783, "ding");
            ht.Add(-18774, "diu");
            ht.Add(-18773, "dong");
            ht.Add(-18763, "dou");
            ht.Add(-18756, "du");
            ht.Add(-18741, "duan");
            ht.Add(-18735, "dui");
            ht.Add(-18731, "dun");
            ht.Add(-18722, "duo");
            ht.Add(-18710, "e");
            ht.Add(-18697, "en");
            ht.Add(-18696, "er");
            ht.Add(-18526, "fa");
            ht.Add(-18518, "fan");
            ht.Add(-18501, "fang");
            ht.Add(-18490, "fei");
            ht.Add(-18478, "fen");
            ht.Add(-18463, "feng");
            ht.Add(-18448, "fo");
            ht.Add(-18447, "fou");
            ht.Add(-18446, "fu");
            ht.Add(-18239, "ga");
            ht.Add(-18237, "gai");
            ht.Add(-18231, "gan");
            ht.Add(-18220, "gang");
            ht.Add(-18211, "gao");
            ht.Add(-18201, "ge");
            ht.Add(-18184, "gei");
            ht.Add(-18183, "gen");
            ht.Add(-18181, "geng");
            ht.Add(-18012, "gong");
            ht.Add(-17997, "gou");
            ht.Add(-17988, "gu");
            ht.Add(-17970, "gua");
            ht.Add(-17964, "guai");
            ht.Add(-17961, "guan");
            ht.Add(-17950, "guang");
            ht.Add(-17947, "gui");
            ht.Add(-17931, "gun");
            ht.Add(-17928, "guo");
            ht.Add(-17922, "ha");
            ht.Add(-17759, "hai");
            ht.Add(-17752, "han");
            ht.Add(-17733, "hang");
            ht.Add(-17730, "hao");
            ht.Add(-17721, "he");
            ht.Add(-17703, "hei");
            ht.Add(-17701, "hen");
            ht.Add(-17697, "heng");
            ht.Add(-17692, "hong");
            ht.Add(-17683, "hou");
            ht.Add(-17676, "hu");
            ht.Add(-17496, "hua");
            ht.Add(-17487, "huai");
            ht.Add(-17482, "huan");
            ht.Add(-17468, "huang");
            ht.Add(-17454, "hui");
            ht.Add(-17433, "hun");
            ht.Add(-17427, "huo");
            ht.Add(-17417, "ji");
            ht.Add(-17202, "jia");
            ht.Add(-17185, "jian");
            ht.Add(-16983, "jiang");
            ht.Add(-16970, "jiao");
            ht.Add(-16942, "jie");
            ht.Add(-16915, "jin");
            ht.Add(-16733, "jing");
            ht.Add(-16708, "jiong");
            ht.Add(-16706, "jiu");
            ht.Add(-16689, "ju");
            ht.Add(-16664, "juan");
            ht.Add(-16657, "jue");
            ht.Add(-16647, "jun");
            ht.Add(-16474, "ka");
            ht.Add(-16470, "kai");
            ht.Add(-16465, "kan");
            ht.Add(-16459, "kang");
            ht.Add(-16452, "kao");
            ht.Add(-16448, "ke");
            ht.Add(-16433, "ken");
            ht.Add(-16429, "keng");
            ht.Add(-16427, "kong");
            ht.Add(-16423, "kou");
            ht.Add(-16419, "ku");
            ht.Add(-16412, "kua");
            ht.Add(-16407, "kuai");
            ht.Add(-16403, "kuan");
            ht.Add(-16401, "kuang");
            ht.Add(-16393, "kui");
            ht.Add(-16220, "kun");
            ht.Add(-16216, "kuo");
            ht.Add(-16212, "la");
            ht.Add(-16205, "lai");
            ht.Add(-16202, "lan");
            ht.Add(-16187, "lang");
            ht.Add(-16180, "lao");
            ht.Add(-16171, "le");
            ht.Add(-16169, "lei");
            ht.Add(-16158, "leng");
            ht.Add(-16155, "li");
            ht.Add(-15959, "lia");
            ht.Add(-15958, "lian");
            ht.Add(-15944, "liang");
            ht.Add(-15933, "liao");
            ht.Add(-15920, "lie");
            ht.Add(-15915, "lin");
            ht.Add(-15903, "ling");
            ht.Add(-15889, "liu");
            ht.Add(-15878, "long");
            ht.Add(-15707, "lou");
            ht.Add(-15701, "lu");
            ht.Add(-15681, "lv");
            ht.Add(-15667, "luan");
            ht.Add(-15661, "lue");
            ht.Add(-15659, "lun");
            ht.Add(-15652, "luo");
            ht.Add(-15640, "ma");
            ht.Add(-15631, "mai");
            ht.Add(-15625, "man");
            ht.Add(-15454, "mang");
            ht.Add(-15448, "mao");
            ht.Add(-15436, "me");
            ht.Add(-15435, "mei");
            ht.Add(-15419, "men");
            ht.Add(-15416, "meng");
            ht.Add(-15408, "mi");
            ht.Add(-15394, "mian");
            ht.Add(-15385, "miao");
            ht.Add(-15377, "mie");
            ht.Add(-15375, "min");
            ht.Add(-15369, "ming");
            ht.Add(-15363, "miu");
            ht.Add(-15362, "mo");
            ht.Add(-15183, "mou");
            ht.Add(-15180, "mu");
            ht.Add(-15165, "na");
            ht.Add(-15158, "nai");
            ht.Add(-15153, "nan");
            ht.Add(-15150, "nang");
            ht.Add(-15149, "nao");
            ht.Add(-15144, "ne");
            ht.Add(-15143, "nei");
            ht.Add(-15141, "nen");
            ht.Add(-15140, "neng");
            ht.Add(-15139, "ni");
            ht.Add(-15128, "nian");
            ht.Add(-15121, "niang");
            ht.Add(-15119, "niao");
            ht.Add(-15117, "nie");
            ht.Add(-15110, "nin");
            ht.Add(-15109, "ning");
            ht.Add(-14941, "niu");
            ht.Add(-14937, "nong");
            ht.Add(-14933, "nu");
            ht.Add(-14930, "nv");
            ht.Add(-14929, "nuan");
            ht.Add(-14928, "nue");
            ht.Add(-14926, "nuo");
            ht.Add(-14922, "o");
            ht.Add(-14921, "ou");
            ht.Add(-14914, "pa");
            ht.Add(-14908, "pai");
            ht.Add(-14902, "pan");
            ht.Add(-14894, "pang");
            ht.Add(-14889, "pao");
            ht.Add(-14882, "pei");
            ht.Add(-14873, "pen");
            ht.Add(-14871, "peng");
            ht.Add(-14857, "pi");
            ht.Add(-14678, "pian");
            ht.Add(-14674, "piao");
            ht.Add(-14670, "pie");
            ht.Add(-14668, "pin");
            ht.Add(-14663, "ping");
            ht.Add(-14654, "po");
            ht.Add(-14645, "pu");
            ht.Add(-14630, "qi");
            ht.Add(-14594, "qia");
            ht.Add(-14429, "qian");
            ht.Add(-14407, "qiang");
            ht.Add(-14399, "qiao");
            ht.Add(-14384, "qie");
            ht.Add(-14379, "qin");
            ht.Add(-14368, "qing");
            ht.Add(-14355, "qiong");
            ht.Add(-14353, "qiu");
            ht.Add(-14345, "qu");
            ht.Add(-14170, "quan");
            ht.Add(-14159, "que");
            ht.Add(-14151, "qun");
            ht.Add(-14149, "ran");
            ht.Add(-14145, "rang");
            ht.Add(-14140, "rao");
            ht.Add(-14137, "re");
            ht.Add(-14135, "ren");
            ht.Add(-14125, "reng");
            ht.Add(-14123, "ri");
            ht.Add(-14122, "rong");
            ht.Add(-14112, "rou");
            ht.Add(-14109, "ru");
            ht.Add(-14099, "ruan");
            ht.Add(-14097, "rui");
            ht.Add(-14094, "run");
            ht.Add(-14092, "ruo");
            ht.Add(-14090, "sa");
            ht.Add(-14087, "sai");
            ht.Add(-14083, "san");
            ht.Add(-13917, "sang");
            ht.Add(-13914, "sao");
            ht.Add(-13910, "se");
            ht.Add(-13907, "sen");
            ht.Add(-13906, "seng");
            ht.Add(-13905, "sha");
            ht.Add(-13896, "shai");
            ht.Add(-13894, "shan");
            ht.Add(-13878, "shang");
            ht.Add(-13870, "shao");
            ht.Add(-13859, "she");
            ht.Add(-13847, "shen");
            ht.Add(-13831, "sheng");
            ht.Add(-13658, "shi");
            ht.Add(-13611, "shou");
            ht.Add(-13601, "shu");
            ht.Add(-13406, "shua");
            ht.Add(-13404, "shuai");
            ht.Add(-13400, "shuan");
            ht.Add(-13398, "shuang");
            ht.Add(-13395, "shui");
            ht.Add(-13391, "shun");
            ht.Add(-13387, "shuo");
            ht.Add(-13383, "si");
            ht.Add(-13367, "song");
            ht.Add(-13359, "sou");
            ht.Add(-13356, "su");
            ht.Add(-13343, "suan");
            ht.Add(-13340, "sui");
            ht.Add(-13329, "sun");
            ht.Add(-13326, "suo");
            ht.Add(-13318, "ta");
            ht.Add(-13147, "tai");
            ht.Add(-13138, "tan");
            ht.Add(-13120, "tang");
            ht.Add(-13107, "tao");
            ht.Add(-13096, "te");
            ht.Add(-13095, "teng");
            ht.Add(-13091, "ti");
            ht.Add(-13076, "tian");
            ht.Add(-13068, "tiao");
            ht.Add(-13063, "tie");
            ht.Add(-13060, "ting");
            ht.Add(-12888, "tong");
            ht.Add(-12875, "tou");
            ht.Add(-12871, "tu");
            ht.Add(-12860, "tuan");
            ht.Add(-12858, "tui");
            ht.Add(-12852, "tun");
            ht.Add(-12849, "tuo");
            ht.Add(-12838, "wa");
            ht.Add(-12831, "wai");
            ht.Add(-12829, "wan");
            ht.Add(-12812, "wang");
            ht.Add(-12802, "wei");
            ht.Add(-12607, "wen");
            ht.Add(-12597, "weng");
            ht.Add(-12594, "wo");
            ht.Add(-12585, "wu");
            ht.Add(-12556, "xi");
            ht.Add(-12359, "xia");
            ht.Add(-12346, "xian");
            ht.Add(-12320, "xiang");
            ht.Add(-12300, "xiao");
            ht.Add(-12120, "xie");
            ht.Add(-12099, "xin");
            ht.Add(-12089, "xing");
            ht.Add(-12074, "xiong");
            ht.Add(-12067, "xiu");
            ht.Add(-12058, "xu");
            ht.Add(-12039, "xuan");
            ht.Add(-11867, "xue");
            ht.Add(-11861, "xun");
            ht.Add(-11847, "ya");
            ht.Add(-11831, "yan");
            ht.Add(-11798, "yang");
            ht.Add(-11781, "yao");
            ht.Add(-11604, "ye");
            ht.Add(-11589, "yi");
            ht.Add(-11536, "yin");
            ht.Add(-11358, "ying");
            ht.Add(-11340, "yo");
            ht.Add(-11339, "yong");
            ht.Add(-11324, "you");
            ht.Add(-11303, "yu");
            ht.Add(-11097, "yuan");
            ht.Add(-11077, "yue");
            ht.Add(-11067, "yun");
            ht.Add(-11055, "za");
            ht.Add(-11052, "zai");
            ht.Add(-11045, "zan");
            ht.Add(-11041, "zang");
            ht.Add(-11038, "zao");
            ht.Add(-11024, "ze");
            ht.Add(-11020, "zei");
            ht.Add(-11019, "zen");
            ht.Add(-11018, "zeng");
            ht.Add(-11014, "zha");
            ht.Add(-10838, "zhai");
            ht.Add(-10832, "zhan");
            ht.Add(-10815, "zhang");
            ht.Add(-10800, "zhao");
            ht.Add(-10790, "zhe");
            ht.Add(-10780, "zhen");
            ht.Add(-10764, "zheng");
            ht.Add(-10587, "zhi");
            ht.Add(-10544, "zhong");
            ht.Add(-10533, "zhou");
            ht.Add(-10519, "zhu");
            ht.Add(-10331, "zhua");
            ht.Add(-10329, "zhuai");
            ht.Add(-10328, "zhuan");
            ht.Add(-10322, "zhuang");
            ht.Add(-10315, "zhui");
            ht.Add(-10309, "zhun");
            ht.Add(-10307, "zhuo");
            ht.Add(-10296, "zi");
            ht.Add(-10281, "zong");
            ht.Add(-10274, "zou");
            ht.Add(-10270, "zu");
            ht.Add(-10262, "zuan");
            ht.Add(-10260, "zui");
            ht.Add(-10256, "zun");
            ht.Add(-10254, "zuo");
            ht.Add(-10247, "zz");
            HttpContext.Current.Cache["HanZiTable"] = ht;
        }
        #endregion

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

        /// <summary>
        /// 获取表单值Request.Form，获取失败则返回 string.Empty
        /// </summary>
        /// <param name="paraName">参数名</param>
        /// <returns>参数值</returns>
        private static string GF(string paraName)
        {
            string val = HttpContext.Current.Request.Form[paraName];
            return val == null ? string.Empty : val.Trim();
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
    }
}