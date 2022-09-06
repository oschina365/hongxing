<%@ WebHandler Language="C#" Class="NSW.Web.MAjax" %>

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
using System.Text.RegularExpressions;
using System.Net;
using System.IO;
#endregion

#region 程序著作权以及用途
/**********************************************************************
 * 程序作者：王军
 * 电子邮件：masterlijf@hotmail.com, 475736732@qq.com
 * 公司名称：深圳市牛商网络有限公司
 * 程序书写时间：2011-7-26
 * 程序实现目的：
 * 1. 前台程序AJAX服务端代码
 **********************************************************************/
#endregion;


namespace NSW.Web
{
    public class MAjax : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            //操作
            string action = context.Request.QueryString["action"];

            //检查来源
            if (!ComUtls.CheckPostSource())
            {
                context.Response.Write(ORes.Error.SuspiciousOfPostingSourceAndBeIgnored);
                return;
            }

            /****************************************
             * 加快方法调用响应速度，所有方法和属性尽量以静态的形式实现
             ***************************************/

            switch (action)
            {
                //方法(例子)
                //case "quickOrder": QuickOrder(); break;
                case "PostComment": PostComment();
                    break;
                case "submitorder": SubmitOrder();
                    break;
                case "GetCommentById": GetCommentById();
                    break;
                case "UpdateUserData": UpdateUserData();
                    break;
                case "UpdateUserPwd": UpdateUserPwd();
                    break;
                //后台一键生成手机网站：根据盈利模式获取相对应的首页表现形式
                case "CheckAgentApply": CheckAgentApply(); break;
                //后台一键生成手机网站：根据盈利模式获取相对应的首页表现形式
                case "GetIndexModelList": GetIndexModelList(); break;
                //后台一键生成手机网站：根据盈利模式获取相对应的首页皮肤样式
                case "GetIndexSkinsList": GetIndexSkinsList(); break;
                //后台一键生成手机网站：设置手机网站的盈利模式、首页表现形式、皮肤样式 
                case "SetSiteModelAndSkin": SetSiteModelAndSkin(); break;
                //详细页分页功能----获取余下全文
                case "GetContentQW": GetContentQW(); break;
                case "CheckFaq": CheckFaq(); break;
                case "GetFaqById": GetFaqById(); break;
                //设置首页主导航菜单项----获取菜单列表-根据ID去获取单条数据，ID为0则获取列表数据
                case "GetMobileMenuList": GetMobileMenuList(); break;
                //设置首页主导航菜单项----保存设置的首页主导航菜单项
                case "SaveMobileMenu": SaveMobileMenu(); break;
                //设置首页主导航菜单项----根据Id删除菜单项
                case "DelMenu": DelMenu(); break;
                //后台选择在线客服控件----获取客服控件列表
                case "GetIMList": GetIMList(); break;
                //后台选择在线客服控件----设置用户选择的客服控件
                case "SetSelectIM": SetSelectIM(); break;
                case "GetLoadHtml": GetLoadHtml(); break;
                //将PC的详细内容转化成图文并茂的手机端详细内容
                case "PCToMobileImg": PCToMobileImg(); break;
                //产品二套详细页----根据产品ID请求产品详细内容
                case "GetContentByProductId": GetContentByProductId(); break;
                //产品二套详细页----根据产品ID请求产品的评论总数
                case "GetCommentCountByProId": GetCommentCountByProId(); break;
                //产品二套详细页----根据产品ID请求产品的评论列表
                case "GetCommentByProIdToDeatil": GetCommentByProIdToDeatil(); break;
                //判断地址栏后的电话是否是有效的业务员电话
                case "CheckSalesmanPhone": CheckSalesmanPhone(); break;
                //得到方案的评论数
                case "GetProjectNum": GetProjectNum(); break;
                //忘记密码后修改密码
                case "UpdatePwd": UpdatePwd(); break;
                //微网页的浏览次数的修改
                case "UpdateWeiPageHits": UpdateWeiPageHits(); break;
                default:
                    WriteString("无效请求。");
                    break;
            }
        }


        #region 相应post请求的方法


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
            //string tmp = HttpContext.Current.Request[paramName];
            //if (string.IsNullOrEmpty(tmp))
            //    return defaultValue;
            //return tmp.Replace("'", "''");
            return QS(paramName, defaultValue);
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

        protected static string ClearGF(string paraName)
        {
            return HttpUtility.HtmlEncode(GF(paraName).Trim());
        }

        /// <summary>
        /// 输出状态值与消息
        /// </summary>
        /// <param name="state">状态值</param>
        /// <param name="msg">消息</param>
        protected static void WriteState(int state, string msg)
        {
            KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", state.ToString());
            KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", msg);
            WriteXml(node, node2);

        }

        /// <summary>
        /// 获取格式化的错误消息字符串
        /// </summary>
        /// <param name="lstErr">错误消息列表</param>
        /// <returns></returns>
        protected static string GetError(List<string> lstErr)
        {
            if (lstErr.Count == 0)
            {
                return string.Empty;
            }

            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < lstErr.Count; i++)
            {
                if (i != 0)
                {
                    sb.Append("$$");
                }

                sb.Append(lstErr[i]);
            }

            return sb.ToString();
        }


        /// <summary>
        /// 根据ID 获取相应的评论列表
        /// </summary>
        private static void GetCommentById()
        {
            string type = GF("type");
            string subjectId = GF("oid");
            int top = ComUtls.ParseInt(GF("top"), 3);
            string columnId;
            StringBuilder sbRsp = new StringBuilder();
            sbRsp.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");

            switch (type)
            {
                case "news":
                    columnId = "2";
                    break;

                case "project":
                    columnId = "3";
                    break;

                case "download":
                    columnId = "4";
                    break;

                default:
                    columnId = "1";
                    break;
            }

            string SqlWhere = string.Format("[ColumnID]={0} AND [SubjectID]={1} AND [Enable]=1", columnId, subjectId);
            string OrderBy = "[ID] DESC, [OrderID] ASC";


            WhereClip NWhere = new WhereClip(SqlWhere);
            OrderByClip NOrder = new OrderByClip(OrderBy);

            Field[] nfield = new Field[] { 
                tbComment._.ID,
                tbComment._.Content,
                tbComment._.InputTime,            
                tbComment._.UserName,
                tbComment._.FeedBack
            };

            DataTable dt = DbSession.Default.From<tbComment>().Select(nfield).Where(NWhere).OrderBy(NOrder).ToDataTable(top);

            DataTable dCount = DbSession.Default.From<tbComment>().Select(nfield).Where(NWhere).OrderBy(NOrder).ToDataTable();
            sbRsp.Append("<comments>");
            sbRsp.AppendFormat("<count>{0}</count>", dCount.Rows.Count);

            foreach (DataRow row in dt.Rows)
            {
                string content = row[tbComment._.Content.Name].ToString();
                string inputTime = ComUtls.FormatDateTime((DateTime)row[tbComment._.InputTime.Name]);
                string username = row[tbComment._.UserName.Name].ToString();
                string feedback = row[tbComment._.FeedBack.Name].ToString() == "" ? "暂无回复" : row[tbComment._.FeedBack.Name].ToString();

                sbRsp.AppendFormat("<comment>");
                sbRsp.AppendFormat("<content>{0}</content>", content);
                sbRsp.AppendFormat("<inputTime>{0}</inputTime>", inputTime);
                sbRsp.AppendFormat("<username>{0}</username>", username);
                sbRsp.AppendFormat("<feedback>{0}</feedback>", feedback);
                sbRsp.AppendFormat("</comment>");
            }
            sbRsp.Append("</comments>");

            dt.Dispose();
            WriteXml(sbRsp.ToString());
        }

        /// <summary>
        /// 根据ID 获取招商加盟的加盟申请
        /// </summary>
        private static void GetFaqById()
        {
            string subjectId = GF("oid");
            int top = ComUtls.ParseInt(GF("top"), 3);
            StringBuilder sbRsp = new StringBuilder();
            sbRsp.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");

            string SqlWhere = string.Format(" [ColumnID]={0} AND [Enable]=1", subjectId);
            string OrderBy = "[InputTime] DESC, [OrderID] ASC";


            WhereClip NWhere = new WhereClip(SqlWhere);
            OrderByClip NOrder = new OrderByClip(OrderBy);

            Field[] nfield = new Field[] { 
                tbAgentApply._.ID,
                tbAgentApply._.ShortDesc,
                tbAgentApply._.InputTime,            
                tbAgentApply._.Username
            };

            DataTable dt = DbSession.Default.From<tbAgentApply>().Select(nfield).Where(NWhere).OrderBy(NOrder).ToDataTable(top);

            DataTable dCount = DbSession.Default.From<tbAgentApply>().Select(nfield).Where(NWhere).OrderBy(NOrder).ToDataTable();
            sbRsp.Append("<comments>");
            sbRsp.AppendFormat("<count>{0}</count>", dCount.Rows.Count);

            foreach (DataRow row in dt.Rows)
            {
                string content = row[tbAgentApply._.ShortDesc.Name].ToString();
                string inputTime = ComUtls.FormatDateTime((DateTime)row[tbAgentApply._.InputTime.Name]);
                string username = row[tbAgentApply._.Username.Name].ToString();
                string feedback = "暂无回复";

                sbRsp.AppendFormat("<comment>");
                sbRsp.AppendFormat("<content>{0}</content>", content);
                sbRsp.AppendFormat("<inputTime>{0}</inputTime>", inputTime);
                sbRsp.AppendFormat("<username>{0}</username>", username);
                sbRsp.AppendFormat("<feedback>{0}</feedback>", feedback);
                sbRsp.AppendFormat("</comment>");
            }
            sbRsp.Append("</comments>");

            dt.Dispose();
            WriteXml(sbRsp.ToString());
        }


        /// <summary>
        /// 提交订单
        /// </summary>
        private static void SubmitOrder()
        {
            KeyValuePair<string, string> node1;
            KeyValuePair<string, string> node2;
            //1获取参数
            int oid = ComUtls.ParseInt(GF("oid"), -1);
            string UserName = GF("UserName");
            string Phone = GF("Phone");
            string OrderInfo = GF("OrderInfo");
            //获取订单号
            string orderSnPrefix = "P";
            string orderSn = BLL.Order.GetOrderSn(orderSnPrefix);
            //开始进行订单创建事务
            DbTran dbTran = DbSession.Default.BeginTran();
            try
            {
                //4 填充实体
                DateTime nowTime = DateTime.Now;
                tbOrder orderObj = new tbOrder();
                orderObj.ActConsumePoint = 0;
                orderObj.ActDeliveryFee = 0;
                orderObj.ActDeliveryMethod = 0;
                orderObj.ActGoodsAccount = 0;
                orderObj.ActOrderAccount = 0;
                orderObj.ActPayMethod = 0;
                orderObj.ActReturnPoint = 0;
                orderObj.ConsumePoint = 0;
                orderObj.DeliveryFee = 0;
                orderObj.DeliveryState = (int)OEnum.DeliveryState.正在审核1;
                orderObj.Enable = true;
                orderObj.EndingColumn = -1;
                orderObj.EndingRemark = string.Empty;
                orderObj.GoodsAccount = 0;
                orderObj.InputTime = nowTime;
                orderObj.isLock = false;
                orderObj.OrderAccount = 0;
                orderObj.OrderNo = orderSn;
                orderObj.OrderState = (int)OEnum.OrderState.待审核1;
                orderObj.PayMethod = 0;
                orderObj.PayState = (int)OEnum.PaymentState.未付款2;
                orderObj.ReturnPoint = 0;
                orderObj.UserName = OSession.Mem.Username;

                //收货人信息
                orderObj.UserRemark = OrderInfo;
                orderObj.ZipCode = string.Empty;
                orderObj.Province = string.Empty;
                orderObj.Phone = Phone;
                orderObj.ChnName = UserName;
                orderObj.Address = "";
                orderObj.City = string.Empty;
                orderObj.Email = "";
                orderObj.InvoiceTitle = string.Empty;
                orderObj.MPhone = Phone;
                orderObj.NeedInvoice = false;

                //其它
                orderObj.AdminRemark = string.Empty;
                orderObj.DomainName = string.Empty;
                orderObj.EKN = string.Empty;
                orderObj.ESN = string.Empty;
                orderObj.EUN = string.Empty;
                orderObj.ActTaxAccount = 0;
                orderObj.TaxAccount = 0;

                //优惠券
                orderObj.CardNo = string.Empty;
                int rowsAfffected = dbTran.Save<tbOrder>(orderObj);

                if (rowsAfffected == -1)
                {
                    //ShowMsgBox("", NSW.OEnum.Common.MessageType.Information);
                    //return;
                    throw new Exception("订单保存失败，请稍候重试。");
                }

                //保存订单产品信息
                VW_Product objProd = DbSession.Default.Get<VW_Product>(VW_Product._.ID == oid);

                if (objProd == null)
                {
                    throw new Exception("产品不存在。");
                }

                //获取相关参数
                int pid = objProd.ID;
                string title = objProd.Title;
                decimal price = 0;
                decimal closingPrice = 0;
                //填充实体
                tbOrderDetail orderDetailObj = new tbOrderDetail();
                orderDetailObj.Enable = true;
                orderDetailObj.InputTime = nowTime;
                orderDetailObj.Num = 0;
                orderDetailObj.OrderID = orderSn;
                orderDetailObj.PriceSum = 0;
                orderDetailObj.ProductID = pid;
                if (title != null && title.Length > 25)
                {
                    title = title.Substring(0, 25);
                }
                orderDetailObj.ProductName = title;
                orderDetailObj.ProductPrice = price;
                orderDetailObj.ShortDesc = OrderInfo;
                orderDetailObj.UserPrice = closingPrice;
                orderDetailObj.PackageIDs = string.Empty;
                orderDetailObj.PackagePrices = string.Empty;
                int rowsAf = dbTran.Save<tbOrderDetail>(orderDetailObj);

                if (rowsAf == 1)
                {
                    throw new Exception("订单产品详细保存失败，请稍候重试。");
                }

                //提交事务
                dbTran.Commit();

                node1 = new KeyValuePair<string, string>("state", "1");
                node2 = new KeyValuePair<string, string>("msg", "您的采购意向提交成功，我们的相关工作人员会尽快与您取得联系。");
            }
            catch (Exception ex)
            {
                dbTran.Rollback();

                node1 = new KeyValuePair<string, string>("state", "0");
                node2 = new KeyValuePair<string, string>("msg", ex.Message);
            }
            finally
            {
                dbTran.Close();
            }

            WriteXml(node1, node2);
        }

        /// <summary>
        /// 发表评论
        /// </summary>
        private static void PostComment()
        {
            //1> 获取参数
            int oid = ComUtls.ParseInt(GF("oid"), -1);

            string mark = GF("mark");
            int columnId =ComUtls.ParseInt(mark,0);

            //switch (mark)
            //{
            //    case "news":
            //        columnId = 2;
            //        break;

            //    case "project":
            //        columnId = 3;
            //        break;

            //    case "download":
            //        columnId = 4;
            //        break;

            //    default:
            //        columnId = 1;
            //        break;

            //}
            int integral = ComUtls.ParseInt(GF("integral"), 0);
            string content = StringUtls.RemoveTag(GF("content"));
            //string verCode = GF("verCode");
            string username;
            int uid;

            if (BLL.Mem.CheckPassport())
            {
                username = BLL.Mem.GetUsername();
                uid = OSession.Mem.ID;
            }
            else
            {
                username = "游客";
                uid = 0;
            }

            //2> 检查参数    
            //SecurityCheck(verCode, CheckingType.BlockToSubmitIPs,
            //    CheckingType.ForbiddenIP,
            //    CheckingType.GlobalCommentabled,
            //    CheckingType.GlobalSubmittingFrequency,
            //    CheckingType.VerifyCode);

            if (oid < 1)
            {
                WriteString(ORes.Error.ObjectIDDoesNotExistOrIncorrect);
                return;
            }

            //if (columnId != 1
            //    || columnId != 2)
            //{
            //    KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
            //    KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "评论分类ID未知" + columnId);
            //    WriteXml(node, node2);
            //    return;
            //}

            if (integral < 0
                || integral > 5)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "评分数不合理");
                WriteXml(node, node2);
                return;
            }

            //if (StringUtls.GetStringLength(content) > 280)
            //{
            //    KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
            //    KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "内容太长，请概括重新发表。");
            //    WriteXml(node, node2);
            //    return;
            //}

            //3> 保存到数据库
            tbComment nobj = new tbComment();
            nobj.Content = BLL.Site.ReplaceBadWord(content);
            nobj.ColumnID = columnId;
            nobj.Enable = false;
            nobj.InputTime = DateTime.Now;
            nobj.Integral = integral;
            nobj.isCommend = false;
            nobj.LastIP = IP;
            nobj.OrderID = 50;
            nobj.SubjectID = oid;
            nobj.UserID = uid;
            nobj.UserName = username;
            nobj.PointPosted = false;
            nobj.FeedBack = "";

            int rowsAffected = DbSession.Default.Save<tbComment>(nobj);

            //4> 回应消息
            if (rowsAffected >= 0)
            {
                OSession.Common.LastPost = DateTime.Now;

                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", OConfig.GlobalConfig.CheckComment ? "2" : "1");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "提交成功，感谢您的参与。"
                    + (OConfig.GlobalConfig.CheckComment ? "您评论待管理员审核后才能显示出来。" : string.Empty));

                if (OConfig.GlobalConfig.CheckComment)
                {
                    WriteXml(node, node2);
                }
                else
                {
                    //奖励积分
                    if (username.Length > 0
                        && OConfig.GlobalConfig.PointPostingProductComment > 0)
                    {
                        BLL.Mem.AwardPostingProductCommentPoint(username);
                    }

                    //更新当前最新的评论次数
                    int num = DbSession.Default.From<tbComment>().Select(tbComment._.ID).Where(tbComment._.ColumnID == columnId && tbComment._.SubjectID == oid).Count();

                    //KeyValuePair<string, string> node3 = new KeyValuePair<string, string>("time", ComUtls.FormatDateTime(nobj.InputTime));
                    //KeyValuePair<string, string> node4 = new KeyValuePair<string, string>("comment", nobj.Content);
                    //KeyValuePair<string, string> node5 = new KeyValuePair<string, string>("ip", ComUtls.CutIp(nobj.LastIP, 2));
                    //KeyValuePair<string, string> node6 = new KeyValuePair<string, string>("username", nobj.UserName);
                    //KeyValuePair<string, string> node7 = new KeyValuePair<string, string>("feedback", nobj.FeedBack);
                    //KeyValuePair<string, string> node8 = new KeyValuePair<string, string>("num", num.ToString());
                    //WriteXml(node, node2, node3, node4, node5, node6, node7, node8);
                    WriteXml(node, node2);
                }

                return;
            }
            else
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "提交失败，请稍候重试。");
                WriteXml(node, node2);
            }
        }

        /// <summary>
        /// 更新用户资料
        /// </summary>
        private static void UpdateUserData()
        {
            int id = 0;
            if (BLL.Mem.CheckPassport())
            {
                id = OSession.Mem.ID;
                string userName = StringUtls.RemoveTag(GF("UserName"));
                string phone = GF("Phone");
                string email = GF("Email");
                string address = GF("Address");
                //6、更新数据库相应数据
                int result = DbSession.Default.Update<tbUser>(new Field[] { tbUser._.ChnName, tbUser._.MPhone, tbUser._.UserEmail, tbUser._.Address }, new object[] { userName, phone, email, address }, tbUser._.ID == id);
                if (result >= 0)
                {
                    KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                    KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "修改成功！");
                    WriteXml(node, node2);
                }
                else
                {
                    KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "-1");
                    KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "提交失败，请稍候重试！");
                    WriteXml(node, node2);
                }
            }
            else
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "请重新登录！");
                WriteXml(node, node2);
            }
        }


        public static void DelMenu()
        {
            int Id = ComUtls.ParseInt(GF("Id"), 0);
            //返回的XML
            StringBuilder sbRsp = new StringBuilder();
            sbRsp.Append("<Infos>");
            if (Id != 0)
            {
                try
                {
                    //1.定义读取对象
                    XmlDocument xmlDoc = new XmlDocument();
                    //2.读取文件
                    xmlDoc.Load(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "\\Mobile\\Config\\Menu.xml");
                    XmlNode xmlNode = xmlDoc.SelectSingleNode("Menus");
                    //3.获得Menu列表
                    XmlNodeList xnl = xmlNode.SelectNodes("Menu");
                    foreach (XmlNode xn in xnl)
                    {
                        foreach (XmlNode item in xn.ChildNodes)
                        {
                            if (item.Name == "Id")
                            {
                                if (Convert.ToInt32(item.InnerText) == Id)
                                {
                                    xmlNode.RemoveChild(xn);
                                }
                            }
                        }
                    }
                    xmlDoc.Save(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "\\Mobile\\Config\\Menu.xml");
                    sbRsp.Append("<Result>删除菜单成功!</Result>");
                }
                catch (Exception ex)
                {
                    sbRsp.Append("<Result>操作数据的时候出现错误，请重试或者联系管理员</Result>");
                }
            }
            else
            {
                sbRsp.Append("<Result>读取数据出现错误，请重试或者联系管理员</Result>");
            }
            sbRsp.Append("</Infos>");
            WriteXml(sbRsp.ToString());
        }

        /// <summary>
        /// 保存设置的首页主导航菜单项
        /// </summary>
        public static void SaveMobileMenu()
        {
            string action = GF("Action");
            //返回的XML
            StringBuilder sbRsp = new StringBuilder();
            sbRsp.Append("<Infos>");
            //1.定义读取对象
            XmlDocument xmlDoc = new XmlDocument();
            //2.读取文件
            xmlDoc.Load(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "\\Mobile\\Config\\Menu.xml");
            XmlNode xmlNode = xmlDoc.SelectSingleNode("Menus");
            //3.获得Menu列表
            XmlNodeList xnl = xmlNode.SelectNodes("Menu");
            string title = GF("Title");
            string Img = GF("Img");
            string Url = GF("Url");
            string OrderId = GF("OrderId");
            if (action == "Add")
            {
                try
                {
                    int Id = 0;
                    List<int> emp = new List<int>();
                    foreach (XmlNode xn in xnl)
                    {
                        foreach (XmlNode item in xn.ChildNodes)
                        {
                            if (item.Name == "Id")
                            {
                                emp.Add(Convert.ToInt32(item.InnerText));
                            }
                        }
                    }
                    foreach (int i in emp)
                    {
                        if (i > Id)
                        {
                            Id = i;
                        }
                    }
                    Id = Id + 1;


                    XmlNode xe1 = xmlDoc.CreateElement("Menu");//创建一个<Menu>节点

                    XmlNode xeId = xmlDoc.CreateElement("Id");
                    xeId.InnerText = Id.ToString();
                    xe1.AppendChild(xeId);//添加到<Menu>节点中

                    XmlNode xeTitle = xmlDoc.CreateElement("Title");
                    xeTitle.InnerText = title;
                    xe1.AppendChild(xeTitle);//添加到<Menu>节点中

                    XmlNode xeUrl = xmlDoc.CreateElement("Url");
                    xeUrl.InnerText = Url;
                    xe1.AppendChild(xeUrl);//添加到<Menu>节点中

                    XmlNode xeImg = xmlDoc.CreateElement("Img");
                    xeImg.InnerText = Img;
                    xe1.AppendChild(xeImg);//添加到<Menu>节点中

                    XmlNode xeOrderID = xmlDoc.CreateElement("OrderID");
                    xeOrderID.InnerText = OrderId;
                    xe1.AppendChild(xeOrderID);//添加到<Menu>节点中
                    xmlNode.AppendChild(xe1);
                    sbRsp.Append("<Success>数据保存成功！</Success>");
                }
                catch (Exception ex)
                {
                    sbRsp.Append("<Error>保存数据出现错误，请重试</Error>");
                }
            }
            else if (action == "Edit")
            {
                int Id = ComUtls.ParseInt(GF("Id"), 0);
                if (Id > 0)
                {
                    foreach (XmlNode xn in xnl)
                    {
                        if (ComUtls.ParseInt(xn.SelectSingleNode("Id").InnerText, 0) == Id)
                        {
                            try
                            {
                                foreach (XmlNode item in xn.ChildNodes)
                                {
                                    if (item.Name == "Title")
                                    {
                                        item.InnerText = title;
                                    }
                                    if (item.Name == "Url")
                                    {
                                        item.InnerText = Url;
                                    }
                                    if (item.Name == "Img")
                                    {
                                        item.InnerText = Img;
                                    }
                                    if (item.Name == "OrderID")
                                    {
                                        item.InnerText = OrderId;
                                    }
                                }
                                sbRsp.Append("<Success>数据保存成功！</Success>");
                            }
                            catch (Exception)
                            {
                                sbRsp.Append("<Error>保存数据出现错误，请重试</Error>");
                            }
                        }
                    }
                }
                else
                {
                    sbRsp.Append("<Error>保存数据出现错误，请重试</Error>");
                }
            }
            xmlDoc.Save(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "\\Mobile\\Config\\Menu.xml");
            sbRsp.Append("</Infos>");
            WriteXml(sbRsp.ToString());
        }


        /// <summary>
        /// 设置首页主导航菜单项
        /// </summary>
        public static void GetMobileMenuList()
        {
            //1.定义读取对象
            XmlDocument xmlDoc = new XmlDocument();
            int id = ComUtls.ParseInt(GF("Id"), 0);
            //2.读取文件
            xmlDoc.Load(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "\\Mobile\\Config\\Menu.xml");
            XmlNode xmlNode = xmlDoc.SelectSingleNode("Menus");
            XmlNodeList xnl = xmlNode.SelectNodes("Menu");
            //返回的XML
            StringBuilder sbRsp = new StringBuilder();
            sbRsp.Append("<Menus>");
            try
            {
                //拼接菜单总数
                sbRsp.AppendFormat("<Count>{0}</Count>", xmlNode.SelectSingleNode("Count").InnerText);
                foreach (XmlNode xn in xnl)
                {
                    if (id > 0)
                    {
                        if (ComUtls.ParseInt(xn.SelectSingleNode("Id").InnerText, 0) == id)
                        {
                            sbRsp.Append("<Menu>");

                            foreach (XmlNode item in xn.ChildNodes)
                            {

                                if (item.Name == "Id")
                                {
                                    sbRsp.AppendFormat("<Id>{0}</Id>", item.InnerText);
                                }
                                if (item.Name == "Title")
                                {
                                    sbRsp.AppendFormat("<Title>{0}</Title>", item.InnerText);
                                }
                                if (item.Name == "Url")
                                {
                                    sbRsp.AppendFormat("<Url>{0}</Url>", item.InnerText);
                                }
                                if (item.Name == "Img")
                                {
                                    sbRsp.AppendFormat("<Img>{0}</Img>", item.InnerText);
                                }
                                if (item.Name == "OrderID")
                                {
                                    sbRsp.AppendFormat("<OrderID>{0}</OrderID>", item.InnerText);
                                }


                            }
                            sbRsp.Append("</Menu>");
                        }
                    }
                    else
                    {
                        sbRsp.Append("<Menu>");
                        foreach (XmlNode item in xn.ChildNodes)
                        {
                            if (item.Name == "Id")
                            {
                                sbRsp.AppendFormat("<Id>{0}</Id>", item.InnerText);
                            }
                            if (item.Name == "Title")
                            {
                                sbRsp.AppendFormat("<Title>{0}</Title>", item.InnerText);
                            }
                            if (item.Name == "Url")
                            {
                                sbRsp.AppendFormat("<Url>{0}</Url>", item.InnerText);
                            }
                            if (item.Name == "Img")
                            {
                                sbRsp.AppendFormat("<Img>{0}</Img>", item.InnerText);
                            }
                            if (item.Name == "OrderID")
                            {
                                sbRsp.AppendFormat("<OrderID>{0}</OrderID>", item.InnerText);
                            }
                        }
                        sbRsp.Append("</Menu>");
                    }
                }
            }
            catch (Exception ex)
            {
                sbRsp.AppendFormat("<Error>{0}</Error>", "抱歉，发生未知错误，请重试");
            }
            sbRsp.Append("</Menus>");
            WriteXml(sbRsp.ToString());
        }


        /// <summary>
        /// 详细页分页功能 ---获取余下全文
        /// 
        /// </summary>
        public static void GetContentQW()
        {
            //获取当前页码
            int curr = ComUtls.ParseInt(GF("curr"), 1);
            //获取当前文章或者产品的ID
            int OId = ComUtls.ParseInt(GF("OId"), 0);
            //获取要查询的类型
            string getType = GF("getType");
            getType = string.IsNullOrEmpty(getType) ? "Product" : getType;


            KeyValuePair<string, string> node, node2;


            //要查询的表明
            StringBuilder content = new StringBuilder();
            if (OId != 0)
            {
                //根据OId获取数据
                switch (getType)
                {
                    case "Product":
                        VW_Product tbpro = DbSession.Default.From<VW_Product>().Select(VW_Product._.MContent, VW_Product._.Content).Where(VW_Product._.ID == OId).ToFirst();
                        if (string.IsNullOrEmpty(tbpro.MContent))
                        {
                            content.Append(NSW.Mobile.String.StringRegex(tbpro.Content));
                        }
                        else {
                            content.Append(tbpro.MContent);
                        }
                        break;
                    case "News":
                        VW_News tbnews = DbSession.Default.From<VW_News>().Select(VW_News._.MContent, VW_News._.Content).Where(VW_News._.ID == OId).ToFirst();
                        if (string.IsNullOrEmpty(tbnews.MContent))
                        {
                            content.Append(NSW.Mobile.String.StringRegex(tbnews.Content));
                        }
                        else
                        {
                            content.Append(tbnews.MContent);
                        }
                        break;
                    case "Help":
                        VW_Help tbhelp = DbSession.Default.From<VW_Help>().Select(VW_Help._.MContent, VW_Help._.Content).Where(VW_Help._.ID == OId).ToFirst();
                        if (string.IsNullOrEmpty(tbhelp.MContent))
                        {
                            content.Append(NSW.Mobile.String.StringRegex(tbhelp.Content));
                        }
                        else
                        {
                            content.Append(tbhelp.MContent);
                        }
                        break;
                    case "Project":
                        VW_Project tbproject = DbSession.Default.From<VW_Project>().Select(VW_Project._.MContent, VW_Project._.Content).Where(VW_Project._.ID == OId).ToFirst();
                        if (string.IsNullOrEmpty(tbproject.MContent))
                        {
                            content.Append(NSW.Mobile.String.StringRegex(tbproject.Content));
                        }
                        else
                        {
                            content.Append(tbproject.MContent);
                        }
                        break;
                    default:
                        VW_Product tbp = DbSession.Default.From<VW_Product>().Select(VW_Product._.MContent, VW_Product._.Content).Where(VW_Product._.ID == OId).ToFirst();
                        if (string.IsNullOrEmpty(tbp.MContent))
                        {
                            content.Append(NSW.Mobile.String.StringRegex(tbp.Content));
                        }
                        else
                        {
                            content.Append(tbp.MContent);
                        }
                        break;
                }
                
                node = new KeyValuePair<string, string>("state", "1");
                node2 = new KeyValuePair<string, string>("Content", content.ToString());

            }
            else
            {
                node = new KeyValuePair<string, string>("state", "0");
                node2 = new KeyValuePair<string, string>("Content", "抱歉，参数错误，请重试");

            }
            WriteXml(node, node2);
        }



        /// <summary>
        /// 后台一键生成手机网站页面功能
        /// 设置手机网站的盈利模式和首页表现形式和首页皮肤
        /// </summary>
        public static void SetSiteModelAndSkin()
        {
            //string WType = GF("WType");
            //string WModel = GF("WModel");
            //string WSkin = GF("WSkin");
            //StringBuilder sbRsp = new StringBuilder();
            //sbRsp.Append("<Infos>");
            //if (string.IsNullOrEmpty(WType) || string.IsNullOrEmpty(WModel) || string.IsNullOrEmpty(WSkin))
            //{
            //    sbRsp.Append("<Error>数据提交有误，请重试！</Error>");
            //}
            //else
            //{
            //    NSW.Mobile.MobileConfig.MWebType = WType;
            //    NSW.Mobile.MobileConfig.MWebModel = WModel;
            //    NSW.Mobile.MobileConfig.MWebSkins = WSkin;

            //    if (File.Exists(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "Mobile\\index.html"))
            //    {
            //        File.Delete(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "Mobile\\index.html");
            //    }
            //    string path = "/mobile/Template/" + WType + "/Model/Index/" + WModel + ".aspx";
            //    if (NSW.Web.Mobile.CreateMobile.CreateMobileIndex(path, "/Mobile"))
            //    {
            //        sbRsp.AppendFormat("<Success>{0}</Success>", "您的手机网站已经生成成功！");
            //        sbRsp.AppendFormat("<ToIndex>{0}</ToIndex>", "/mobile/Index.aspx");
            //    }
            //    else
            //    {
            //        sbRsp.Append("<Error>数据提交有误，请重试！</Error>");
            //    }
            //}
            //sbRsp.Append("</Infos>");
            //WriteXml(sbRsp.ToString());
        }

        /// <summary>
        /// 后台一键生成手机网站页面功能
        /// 根据盈利模式获取相对应的首页皮肤 样式
        /// </summary>
        public static void GetIndexSkinsList()
        {
            //获取网站的盈利模式类型
            string wType = GF("WType");
            if (string.IsNullOrEmpty(wType))
            {
                WriteXml("<Error>暂无数据！</Error>");
            }
            //获得首页模板列表
            string GetDir = "/mobile/Template/" + wType.ToString() + "/skins/";
            //获取文件夹名称列表
            List<string> SkinsList = NSW.Web.Mobile.CreateMobile.GetDirByName(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "Mobile\\Template\\" + wType.ToString() + "\\Skins\\", "", false);
            StringBuilder sbRsp = new StringBuilder();
            sbRsp.Append("<Skins>");
            try
            {
                if (SkinsList.Count > 0)
                {
                    for (int i = 0; i < SkinsList.Count; i++)
                    {
                        sbRsp.AppendFormat("<Skin>");
                        sbRsp.AppendFormat("<SkinsName>{0}</SkinsName>", SkinsList[i].ToString().ToLower());
                        sbRsp.AppendFormat("</Skin>");
                    }
                }
            }
            catch (Exception e)
            {
                sbRsp.AppendFormat("<Error>{0}</Error>", e.Message.ToString());
            }
            sbRsp.Append("</Skins>");
            WriteXml(sbRsp.ToString());
        }

        /// <summary>
        /// 后台一键生成手机网站页面功能
        /// 根据盈利模式获取相对应的首页表现形式
        /// </summary>
        public static void GetIndexModelList()
        {
            string wType = GF("WType").Trim();

            if (string.IsNullOrEmpty(wType))
            {
                WriteXml("<Error>暂无数据！</Error>");
            }

            //获得首页模板列表
            string GetDir = "/mobile/Template/" + wType.ToString() + "/Model/Index/";
            List<string> IndexModellist = NSW.Web.Mobile.CreateMobile.GetDirByName(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "Mobile\\Template\\" + wType.ToString() + "\\Model\\Index\\", "*.aspx", false);
            //获得首页模板略缩图列表
            List<string> IndexImglist = NSW.Web.Mobile.CreateMobile.GetDirByName(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "Mobile\\Template\\" + wType.ToString() + "\\Model\\Index\\", "*.jpg", false);
            //获得首页模板Html静态页面
            List<string> IndexHtmllist = NSW.Web.Mobile.CreateMobile.GetDirByName(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "Mobile\\Template\\" + wType.ToString() + "\\Model\\Index\\", "*.html", false);

            StringBuilder sbRsp = new StringBuilder();
            sbRsp.Append("<Models>");
            try
            {
                if (IndexModellist.Count > 0)
                {
                    for (int i = 0; i < IndexModellist.Count; i++)
                    {
                        sbRsp.AppendFormat("<Model>");
                        sbRsp.AppendFormat("<WebType>{0}</WebType>", wType);
                        sbRsp.AppendFormat("<ModelName>{0}</ModelName>", IndexModellist[i].Substring(0, IndexModellist[i].LastIndexOf('.') == -1 ? IndexModellist[i].Length : IndexModellist[i].LastIndexOf('.')));
                        if (IndexHtmllist.Count > 0 && IndexHtmllist.Count >= i + 1)
                        {
                            sbRsp.AppendFormat("<HtmlPath>{0}</HtmlPath>", GetDir + IndexHtmllist[i]);
                        }
                        if (IndexImglist.Count > 0 && IndexImglist.Count >= i + 1)
                        {
                            sbRsp.AppendFormat("<ImgPath>{0}</ImgPath>", GetDir + IndexImglist[i]);
                        }
                        sbRsp.AppendFormat("</Model>");
                    }
                }
            }
            catch (Exception e)
            {
                sbRsp.AppendFormat("<Error>{0}</Error>", e.Message.ToString());
            }
            sbRsp.Append("</Models>");
            WriteXml(sbRsp.ToString());
        }


        /// <summary>
        ///后台可选择在线客服控件---- 获取客服控件列表
        /// </summary>
        public static void GetIMList()
        {
            StringBuilder sbRsp = new StringBuilder();
            sbRsp.Append("<Models>");
            sbRsp.AppendFormat("<SelectIM>{0}</SelectIM>", NSW.Mobile.MobileConfig.MSelectIM);
            try
            {
                //获得客服控件
                List<string> IndexModellist = NSW.Web.Mobile.CreateMobile.GetDirByName(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "Mobile\\UserControls\\IM\\", "*.ascx", false);
                //获得首页模板略缩图列表
                List<string> IndexImglist = NSW.Web.Mobile.CreateMobile.GetDirByName(System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "Mobile\\UserControls\\IM\\", "*.jpg", false);
                if (IndexModellist.Count > 0)
                {
                    for (int i = 0; i < IndexModellist.Count; i++)
                    {
                        sbRsp.AppendFormat("<Model>");
                        sbRsp.AppendFormat("<IM>{0}</IM>", IndexModellist[i].Substring(0, IndexModellist[i].LastIndexOf('.') == -1 ? IndexModellist[i].Length : IndexModellist[i].LastIndexOf('.')));
                        sbRsp.AppendFormat("<IMImg>{0}</IMImg>", IndexImglist[i]);
                        sbRsp.AppendFormat("</Model>");
                    }
                }
            }
            catch (Exception e)
            {
                sbRsp.AppendFormat("<Error>{0}</Error>", e.Message.ToString());
            }
            sbRsp.Append("</Models>");
            WriteXml(sbRsp.ToString());
        }

        /// <summary>
        /// 根据路径读取页面的HTML代码
        /// </summary>
        /// <returns></returns>
        public static string ReadPageStr(string ModelPath)
        {
            Encoding ed = Encoding.GetEncoding("utf-8"); //创建一个字符串编码
            StreamReader sr = null; //读取流
            string str = string.Empty; //空字符串
            WebRequest wr = WebRequest.Create(HttpContext.Current.Server.MapPath(ModelPath)); //向指定的URI发送请求
            WebResponse ws = wr.GetResponse(); //通过WebRequest的GetResponse()方法来创建实例（响应WebRequest的请求）

            Stream sm = ws.GetResponseStream(); //从WebResponse的GetResponseStream()方法中创建文本流实例
            try
            {

                sr = new StreamReader(sm, ed); //以指定的编码方式加载文本流;
                str = sr.ReadToEnd(); //将文本流从头到尾所有字符串赋值给字符串变量
            }
            catch (Exception)
            {
                str = "";
            }
            finally
            {
                sr.Close();
                sm.Close();
            }
            return str;
        }
        /// <summary>
        /// 根据路径写入页面的HTML代码
        /// </summary>
        /// <returns></returns>
        public static void WritePageStr(string str, string ModelPath)
        {
            Encoding ed = Encoding.GetEncoding("utf-8"); //创建一个字符串编码
            FileStream fs = new FileStream(ModelPath, FileMode.Create);
            StreamWriter sw = new StreamWriter(fs);
            try
            {
                //开始写入
                sw.Write(str);
                //清空缓冲区
                sw.Flush();
            }
            catch (Exception)
            {
                str = "";
            }
            finally
            {
                //关闭流
                sw.Close();
                fs.Close();
            }
        }

        private static readonly string DefaultUserAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)";
        /// <summary>  
        /// 创建GET方式的HTTP请求  
        /// </summary>  
        /// <param name="url">请求的URL</param>  
        /// <param name="timeout">请求的超时时间</param>  
        /// <param name="userAgent">请求的客户端浏览器信息，可以为空</param>  
        /// <param name="cookies">随同HTTP请求发送的Cookie信息，如果不需要身份验证可以为空</param>  
        /// <returns></returns>  
        public static HttpWebResponse CreateGetHttpResponse(string url, int? timeout, string userAgent, CookieCollection cookies)
        {
            if (string.IsNullOrEmpty(url))
            {
                throw new ArgumentNullException("url");
            }
            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
            request.Method = "GET";
            request.UserAgent = DefaultUserAgent;
            if (!string.IsNullOrEmpty(userAgent))
            {
                request.UserAgent = userAgent;
            }
            if (timeout.HasValue)
            {
                request.Timeout = timeout.Value;
            }
            if (cookies != null)
            {
                request.CookieContainer = new CookieContainer();
                request.CookieContainer.Add(cookies);
            }
            return request.GetResponse() as HttpWebResponse;
        }
        /// <summary>
        /// ///后台可选择在线客服控件---- 保存用户选择的在线客服控件
        /// </summary>
        public static void SetSelectIM()
        {
            string SelectIM = GF("WType");
            StringBuilder sbRsp = new StringBuilder();
            sbRsp.Append("<Models>");
            try
            {
                //先保存客户选择的在线客服控件到配置文件
                NSW.Mobile.MobileConfig.MSelectIM = SelectIM;
                //读取底部控件,将替换符替换成客服控件
                String str = ReadPageStr("/mobile/UserControls/IM/Kefu.aspx");
                if (!string.IsNullOrEmpty(str))
                {
                    //读取Kefu.aspx页面里面的内容     生成控件注册码和控件调用码
                    str = str.Replace("{$RegisterStr$}",
                        string.Format("{0} Register Src=\"~/mobile/UserControls/IM/{1}.ascx\" TagPrefix=\"BottomHelp\" TagName=\"{1}\" {2}", "<%@", SelectIM, "%>"))
                        .Replace("{$KefuStr$}",
                        string.Format("<BottomHelp:{0} runat=\"server\" ID=\"{0}\" />", SelectIM))
                        .Replace(string.Format("{0} Page Language=\"C#\" AutoEventWireup=\"true\" CodeFile=\"Kefu.aspx.cs\" Inherits=\"Mobile_UserControls_IM_Kefu\" {1}", "<%@", "%>"), string.Format("{0} Page Language=\"C#\" AutoEventWireup=\"true\" CodeFile=\"IM.aspx.cs\" Inherits=\"Mobile_UserControls_IM_IM\" {1}", "<%@", "%>"));
                    //将控件注册码和调用码写入到IM.aspx里面
                    WritePageStr(str, System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "Mobile\\UserControls\\IM\\IM.aspx");
                    //将控件注册码和调用码加入到Header.ascx里面
                    string Footer = ReadPageStr("/mobile/UserControls/Common/Footer.ascx");
                    if (Footer.Contains("<!--KefuStart-->"))
                    {


                        WritePageStr(Regex.Replace(Footer, "<!--KefuStart-->.*<!--KefuEnd-->", "<!--KefuStart--><MobileKefu:" + SelectIM + " runat=\"server\" ID=\"" + SelectIM + "\" /><!--KefuEnd-->", RegexOptions.IgnoreCase), System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "Mobile\\UserControls\\Common\\Footer.ascx");
                    }
                    else
                    {
                        Footer = Footer + "<!--KefuStart--> <MobileKefu:" + SelectIM + " runat=\"server\" ID=\"" + SelectIM + "\" /><!--KefuEnd--> ";
                        WritePageStr(Footer, System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "Mobile\\UserControls\\Common\\Footer.ascx");
                    }
                    sbRsp.Append("<KefuStart>" + Footer.Contains("<!--KefuStart-->").ToString() + "</KefuStart>");

                    sbRsp.Append("<Footer><![CDATA[" + Footer + "]]></Footer>");

                }
                else
                {
                    sbRsp.Append("<Error>操作有误，请重试！</Error>");
                }
                sbRsp.Append("<Success>保存成功</Success>");
            }
            catch (Exception ex)
            {
                sbRsp.Append("<Error>" + ex.Message + "</Error>");
            }
            sbRsp.Append("</Models>");
            WriteXml(sbRsp.ToString());
        }


        /// <summary>
        /// 修改用户密码
        /// </summary>
        private static void UpdateUserPwd()
        {
            string pwd = GF("Pwd");
            string newPwd = GF("NewPwd");
            if (BLL.Mem.CheckPassport())
            {
                string pinMd5 = StringUtls.MD5(pwd).ToLower();
                if (OSession.Mem.Pin.ToLower() != pinMd5)
                {
                    KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                    KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "原密码错误,请重试！");
                    WriteXml(node, node2);
                }
                else
                {
                    int id = OSession.Mem.ID;
                    //6、更新数据库相应数据
                    int result = DbSession.Default.Update<tbUser>(new Field[] { tbUser._.UserPassword }, new object[] { StringUtls.MD5(newPwd) }, tbUser._.ID == id);
                    if (result >= 0)
                    {
                        KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                        KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "修改成功！");
                        WriteXml(node, node2);
                    }
                    else
                    {
                        KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "-1");
                        KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "修改失败，请稍候重试！");
                        WriteXml(node, node2);
                    }
                }
            }
            else
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "2");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "请重新登录！");
                WriteXml(node, node2);
            }
        }

        /// <summary>
        /// 首页 在线申请加盟
        /// </summary>
        public static void CheckAgentApply()
        {
            string name = GF("Name");
            string content = GF("Content");
            string phone = GF("Phone");
            int rowsAffected = -1; //表示是否提交成功，0为失败  1为成功

            string IP = ComUtls.HostAddress;   //获取IP地址
            //2.获取用户是否登录
            bool isLogin = BLL.Mem.CheckPassport();

            //3 填充实体
            DateTime nowTime = DateTime.Now;
            tbAgentApply nobj = new tbAgentApply();

            nobj.InputTime = nowTime;
            if (isLogin)
            {
                tbUser objUser = OSession.Mem.User;
                nobj.ChnName = objUser.ChnName;
                nobj.Email = objUser.UserEmail;
                nobj.Username = objUser.UserName;
            }
            else
            {
                nobj.Username = name;
                nobj.ChnName = name;
            }
            nobj.MPhone = phone;
            nobj.Phone = phone;
            nobj.Enable = true;
            nobj.InputTime = nowTime;
            nobj.UserIP = IP;
            nobj.OrderID = 50;
            nobj.ShortDesc = content;
            //预留字段
            nobj.SubSite = string.Empty;
            //5 保存数据库
            rowsAffected = DbSession.Default.Save<tbAgentApply>(nobj);
            if (rowsAffected >= 0)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "提交成功！");
                WriteXml(node, node2);
            }
            else
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "提交失败！");
                WriteXml(node, node2);
            }
        }

        /// <summary>
        /// 在线咨询/反馈/加盟申请
        /// </summary>
        public static void CheckFaq()
        {
            int postType = ComUtls.ParseInt(GF("PostType"), 1);
            string content = GF("Content");
            string phone = GF("Phone");
            int columnId =ComUtls.ParseInt(GF("ColumnId"),0);
            int rowsAffected = -1; //表示是否提交成功，0为失败  1为成功
            //判断提交类型     1为咨询和反馈，2为加盟
            if (postType == 1)
            {
                //2.获取用户是否登录
                bool isLogin = BLL.Mem.CheckPassport();

                //3 填充实体

                tbLeaveword nobj = new tbLeaveword();
                if (content.Length > 12)
                {
                    nobj.Title = content.Substring(0, 12) + "...";
                }
                else
                {
                    nobj.Title = content;
                }
                if (isLogin)
                {
                    tbUser objUser = OSession.Mem.User;
                    nobj.Contact = objUser.UserName;
                    nobj.Email = objUser.UserEmail;
                }
                else
                {
                    nobj.Contact = "游客";
                }
                nobj.IP = IP;
                nobj.MobileNo = phone;
                nobj.Content = content;
                nobj.OrderID = 50;
                nobj.Enable = true;
                nobj.InputTime = DateTime.Now;

                //5 保存数据库
                rowsAffected = DbSession.Default.Save<tbLeaveword>(nobj);
            }
            else
            {
                //2.获取用户是否登录
                bool isLogin = BLL.Mem.CheckPassport();

                //3 填充实体
                DateTime nowTime = DateTime.Now;
                tbAgentApply nobj = new tbAgentApply();

                nobj.InputTime = nowTime;
                if (isLogin)
                {
                    tbUser objUser = OSession.Mem.User;
                    nobj.ChnName = objUser.UserName;
                    nobj.Email = objUser.UserEmail;
                    nobj.Username = objUser.UserName;
                }
                nobj.MPhone = phone;
                nobj.Phone = phone;
                nobj.Enable = false;
                nobj.InputTime = nowTime;
                nobj.UserIP = IP;
                nobj.OrderID = 50;
                nobj.ShortDesc = content;
                nobj.ColumnID = columnId;
                //预留字段
                nobj.SubSite = string.Empty;
                //5 保存数据库
                rowsAffected = DbSession.Default.Save<tbAgentApply>(nobj);
            }
            KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", rowsAffected.ToString());
            WriteXml(node);
        }

        //产品二套详细页----根据产品ID请求产品的评论列表
        public static void GetCommentByProIdToDeatil()
        {
            int proId = ComUtls.ParseInt(GF("ProId"), 0);
            int Curr = ComUtls.ParseInt(GF("Curr"), 0);
            int Top = ComUtls.ParseInt(GF("Top"), 0);
            StringBuilder sbRsp = new StringBuilder();
            string SqlWhere = string.Format("[ColumnID]={0} AND [SubjectID]={1} AND [Enable]=1", 1, proId);
            string OrderBy = "[ID] DESC, [OrderID] ASC, [InputTime] DESC";
            
            int pageCount = -1;
            DataTable dt = MQuery.GetBatch("tbComment", "ID", "ID,Content,InputTime,UserName,FeedBack", OrderBy, SqlWhere, Top, Curr, ref pageCount);
            sbRsp.Append("<Infos>");
            //if (Curr >= 1 && Curr < pageCount)
            //{
                sbRsp.Append("<comments>");
                sbRsp.AppendFormat("<Count>{0}</Count>", pageCount);
                foreach (DataRow item in dt.Rows)
                {
                    string content = item[tbComment._.Content.Name].ToString();
                    string inputTime = ComUtls.FormatDateTime((DateTime)item[tbComment._.InputTime.Name]);
                    string username = item[tbComment._.UserName.Name].ToString();
                    string feedback = item[tbComment._.FeedBack.Name].ToString() == "" ? "暂无回复" : item[tbComment._.FeedBack.Name].ToString();
                    sbRsp.AppendFormat("<comment>");
                    sbRsp.AppendFormat("<content>{0}</content>", content);
                    sbRsp.AppendFormat("<inputTime>{0}</inputTime>", inputTime);
                    sbRsp.AppendFormat("<username>{0}</username>", username);
                    sbRsp.AppendFormat("<feedback>{0}</feedback>", feedback);
                    sbRsp.AppendFormat("</comment>");
                }
                sbRsp.Append("</comments>");
           // }
            dt.Dispose();
            sbRsp.Append("</Infos>");
            WriteXml(sbRsp.ToString());
        }

        //产品二套详细页----根据产品ID请求产品的评论总数
        public static void GetCommentCountByProId()
        {
            int proId = ComUtls.ParseInt(GF("ProId"), 0);
            //返回的XML
            StringBuilder sbRsp = new StringBuilder();
            sbRsp.Append("<Infos>");
            if (proId != 0)
            {
                string SqlWhere = string.Format("[ColumnID]={0} AND [SubjectID]={1} AND [Enable]=1", 1, proId);
                string OrderBy = "[ID] DESC, [OrderID] ASC";


                WhereClip NWhere = new WhereClip(SqlWhere);
                OrderByClip NOrder = new OrderByClip(OrderBy);

                Field[] nfield = new Field[] { 
                tbComment._.ID,
                tbComment._.Content,
                tbComment._.InputTime,            
                tbComment._.UserName,
                tbComment._.FeedBack
            };

                DataTable dCount = DbSession.Default.From<tbComment>().Select(nfield).Where(NWhere).OrderBy(NOrder).ToDataTable();
                sbRsp.AppendFormat("<count>{0}</count>", dCount.Rows.Count);
            }
            else
            {
                sbRsp.Append("<Error>抱歉，参数错误，请重试</Error>");
            }
            sbRsp.Append("</Infos>");
            WriteXml(sbRsp.ToString());
        }

        //产品二套详细页----根据产品ID请求产品详细内容
        public static void GetContentByProductId()
        {
            int proId = ComUtls.ParseInt(GF("ProId"), 0);
            int CurrPage = ComUtls.ParseInt(GF("currPage"), 1);

            //返回的XML
            StringBuilder sbRsp = new StringBuilder();
            sbRsp.Append("<Infos>");
            if (proId != 0)
            {
                VW_Product product = DbSession.Default.Get<VW_Product>(VW_Product._.ID == proId);
                string mobileContent = string.Empty;
                if (product != null)
                {

                    if (!string.IsNullOrEmpty(product.MContent))
                    {
                        mobileContent = product.MContent;
                    }
                    else
                    {
                        mobileContent = NSW.Mobile.String.StringRegex(product.Content);
                    }
                    List<string> pList = NSW.Web.Mobile.CreateMobile.SplitToP(mobileContent);
                    //获得总页数
                    sbRsp.Append("<CurrPage>" + CurrPage + "</CurrPage>");
                    sbRsp.Append("<PageCount>" + pList.Count + "</PageCount>");
                    for (int i = 0; i < pList.Count; i++)
                    {
                        if (i == CurrPage - 1)
                        {
                            mobileContent = pList[i];
                        }
                    }
                }
                //sbRsp.Append("<Content><![CDATA[" + mobileContent.ToString() + "]]></Content>");
                sbRsp.Append("<Content>" + mobileContent.ToString() + "</Content>");
            }
            else
            {
                sbRsp.Append("<Error>抱歉，参数错误，请重试</Error>");
            }
            sbRsp.Append("</Infos>");
            WriteXml(sbRsp.ToString());
        }
        /// <summary>
        /// 将PC端的详细内容转化成图文并茂版的手机端详细内容
        /// </summary>
        public static void PCToMobileImg()
        {
            int OID = ComUtls.ParseInt(GF("OID"), 0);
            string TableName = GF("TableName");
            string Action = GF("Action");
            string ContentStr = string.Empty;
            //返回的XML
            StringBuilder sbRsp = new StringBuilder();
            sbRsp.Append("<Infos>");

            //要查询的表明
            StringBuilder mobileContent = new StringBuilder();
            if (OID>0)
            {
                if (string.IsNullOrEmpty(TableName))
                {
                    sbRsp.Append("<Error>抱歉，参数错误，请重试</Error>");
                }
                else
                {
                    TableName = TableName.ToLower();
                    switch (TableName)
                    {
                        case "tbproduct":
                            tbProduct product =DbSession.Default.Get<tbProduct>(OID);
                            ContentStr = product.Content;
                            break;
                        case "tbnews":
                            tbNews news = DbSession.Default.Get<tbNews>(OID);
                            ContentStr = news.Content;
                            break;
                        case "tbhelp":
                            tbHelp help = DbSession.Default.Get<tbHelp>(OID);
                            ContentStr = help.Content;
                            break;
                        case "tbagent":
                            tbAgent agent = DbSession.Default.Get<tbAgent>(OID);
                            ContentStr = agent.Content;
                            break;
                        case "tbproject":
                            tbProject project = DbSession.Default.Get<tbProject>(OID);
                            ContentStr = project.Content;
                            break;
                        default:
                            ContentStr = "";
                            break;
                    }
                    if (Action == "ToImg")
                    {
                        mobileContent.Append(NSW.Mobile.String.StringRegex(ContentStr));
                    }
                    else if (Action == "ToFont")
                    {
                        mobileContent.Append(NSW.Mobile.String.StringRegexHTML(ContentStr));
                    }
                    sbRsp.Append("<Content><![CDATA[" + mobileContent.ToString() + "]]></Content>");
                    mobileContent.Remove(0, mobileContent.Length);
                }
            }
            else
            {
                sbRsp.Append("<Error>抱歉，参数错误，请重试</Error>");
            }
            sbRsp.Append("</Infos>");
            WriteXml(sbRsp.ToString());
        }
        

        /// <summary>
        /// 判断地址栏后的电话是否是有效的业务员电话
        /// </summary>
        public static void CheckSalesmanPhone()
        {
            string phone = GF("Phone");
            string userGroupID = NSW.Mobile.MobileConfig.ControlSalesManId;
            tbUser obj = DbSession.Default.Get<tbUser>(tbUser._.MPhone == phone && tbUser._.Enable == true && tbUser._.UserGroupID == userGroupID);
            if (obj != null)
            {
                KeyValuePair<string, string> pair1 = new KeyValuePair<string, string>("result", "1"),
                    pair2 = new KeyValuePair<string, string>("tel", NSW.OConfig.GlobalConfig.FindPinServiceTel);
                WriteXml(pair1, pair2);
            }
            else
            {
                KeyValuePair<string, string> pair1 = new KeyValuePair<string, string>("result", "0"),
                    pair2 = new KeyValuePair<string, string>("tel", NSW.OConfig.GlobalConfig.FindPinServiceTel);

                WriteXml(pair1, pair2);
            }
        }

        /// <summary>
        /// 得到方案的评论数
        /// </summary>
        public static void GetProjectNum()
        {
            int id = ComUtls.ParseInt(GF("ID"), 0);
            string SqlWhere = string.Format("[ColumnID]={0} AND [SubjectID]={1} AND [Enable]=1", 3, id);
            WhereClip NWhere = new WhereClip(SqlWhere);
            Field[] nfield = new Field[] { 
                tbComment._.ID
            };
            DataTable dt = DbSession.Default.From<tbComment>().Select(nfield).Where(NWhere).ToDataTable();
            if (dt != null && dt.Rows.Count > 0)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("count", dt.Rows.Count.ToString());
                WriteXml(node);
            }
            else
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("count", "0");
                WriteXml(node);
            }
        }

        public static void UpdatePwd()
        {
            //解析参数
            string code = GF("Code");
            string pwd = GF("Pwd");
            string msg;
            int state;
            if (!string.IsNullOrEmpty(code))
            {
                string inputStr = StringUtls.Encryption.Decrypt(code, true);
                string username = ComUtls.QueryString(inputStr, "username");
                string email = ComUtls.QueryString(inputStr, "email");
                string srcKey = ComUtls.QueryString(inputStr, "key");

                //检查校验串
                string key = BLL.OSecurity.GetNormalKey(email.ToLower() + username.ToLower());

                if (srcKey != key)    //错误检验串
                {
                    msg = "校验串错误。";
                    state = 0;
                }
                else      //正确校验串
                {
                    //修改密码
                    string newPwd = pwd.Trim();
                    string newPwdMd5 = StringUtls.MD5(newPwd);
                    Field[] NField = new Field[] { 
                    tbUser._.UserPassword
                };
                    object[] NValues = new object[] { 
                    newPwdMd5
                };
                    WhereClip NWhere = (tbUser._.UserEmail == email
                        && tbUser._.UserName == username);

                    // 更新数据库
                    int rowsAffected = DbSession.Default.Update<tbUser>(NField, NValues, NWhere);
                    if (rowsAffected > 0)
                    {
                        msg = "密码修改成功";
                        state = 1;
                    }
                    else
                    {
                        msg = "密码修改失败";
                        state = 0;
                    }
                }
            }
            else
            {
                msg = "校验串错误";
                state = 0;
            }
            KeyValuePair<string, string> pair1 = new KeyValuePair<string, string>("state",state.ToString());
            KeyValuePair<string, string> pair2 = new KeyValuePair<string, string>("msg",msg);
            WriteXml(pair1, pair2);
        }

        /// <summary>
        /// 修改微网页的浏览次数
        /// </summary>
        public static void UpdateWeiPageHits()
        {
            int id = ComUtls.ParseInt(GF("Oid"), 1);
            string sql=string.Format("update tbWeiPage set Hits=Hits+1 where id={0}",id);
            int result=DbSession.Default.Excute(sql);
            KeyValuePair<string, string> pair1 = new KeyValuePair<string, string>("state", result.ToString());
            WriteXml(pair1);
        }

        /// <summary>
        /// 得到分屏加载内容
        /// </summary>
        public static void GetLoadHtml()
        {
            int pageId = ComUtls.ParseInt(GF("pageId"), 0);
            XmlDocument xmlDoc = new XmlDocument();
            string xmlPath = System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "\\Mobile\\Config\\load.xml";
            xmlDoc.Load(xmlPath);
            XmlNode root = xmlDoc.SelectSingleNode("html");
            bool b = true;
            foreach (XmlNode node in root.ChildNodes)
            {
                int id = ComUtls.ParseInt(node.ChildNodes[0].InnerText, 0);
                if (id > pageId)
                {
                    KeyValuePair<string, string> pair1 = new KeyValuePair<string, string>("id", node.ChildNodes[0].InnerText);
                    KeyValuePair<string, string> pair2 = new KeyValuePair<string, string>("content", HttpContext.Current.Server.HtmlDecode(node.ChildNodes[1].InnerText));
                    WriteXml(pair1, pair2);
                    b = false;
                    break;
                }
            }
            if (b)
            {
                KeyValuePair<string, string> pair1 = new KeyValuePair<string, string>("id", "");
                KeyValuePair<string, string> pair2 = new KeyValuePair<string, string>("content", "");
                WriteXml(pair1, pair2);
            }
        }
        #endregion
    }
}

