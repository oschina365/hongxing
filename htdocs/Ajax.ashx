<%@ WebHandler Language="C#" Class="NSW.Web.Ajax" %>

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
#endregion

#region 程序著作权以及用途
/**********************************************************************
 * 程序作者：李剑飞、戴颜青
 * 电子邮件：masterlijf@hotmail.com, likecode#qq.com
 * 公司名称：深圳市牛商网络股份有限公司        
 * 程序书写时间：2014-2-28
 * 程序实现目的：
 * 1. 前台程序AJAX服务端代码
 **********************************************************************/
#endregion;


namespace NSW.Web
{
    public class Ajax : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        #region ProcessRequest
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
                //初始化通用头部热门关键词信息
                case "initcommonheaderkeywords": InitCommonHeaderKeywords(); break;
                //自增点击率
                case "hits": Hits(); break;
                // 帮助中心满意度（帮助作用）反馈
                //case "helpuseful": HelpUseful(); break;
                //获得产品的简单介绍(横排预览)
                //case "showProductInfo": ShowProductInfo(); break;
                //获得产品的简单介绍(竖排预览)
                //case "showProductInfos": ShowProductInfos(); break;
                //产品对比车
                //case "addCompare": AddCompare(); break; 
                //移除某个对比车中的产品
                //case "delOneCompare": DelOneCompare(); break;  
                //移除所有对比车中的产品
                //case "delAllCompare": DelAllCompare(); break;
                //发表评论
                case "postcomment": PostComment(); break;
                //产品预定
                //case "postProductTips":PostProductTips();break;
                //产品预览中的愿望夹
                //case "showMyWish": ShowMyWish(); break;
                //产品预览保存到愿望夹
                //case "postProductWishs": PostProductWishs(); break;
                //读取置顶属性的属性值对应的图片
                //case "attrValuesPhotos": GetAttrValuesPhotos(); break;
                //添加产品到购物车
                case "addtocart": AddToCart(); break;
                //删除产品到购物车
                case "deltocart": DelToCart(); break;
                //清空购物车
                case "emptycart": EmptyCart(); break;
                //检查电子邮箱地址是否已注册
                case "checkemail": CheckEmail(); break;
                //检查用户名是否已注册
                case "checkusername": CheckUsername(); break;
                //注册会员
                case "register": Register(); break;
                //初始化通用头部信息
                case "initcommonheader": InitCommonHeader(); break;
                //取消订单
                case "cancelorder": CancelOrder(); break;
                //删除收藏夹分类
                //case "delfavfolumn": DelFavColumn(); break;
                //添加收藏
                //case "fav": AddFav(); break;
                //删除收藏
                //case "delfav": DelFav(); break;
                //删除愿望夹
                //case "delMyWishs": DelMyWishs(); break;
                //删除下载记录
                //case "delMyDownloads": DelMyDownloads(); break;
                //获取评论
                case "getcomment": GetComment(); break;
                //添加浏览历史
                case "addhistory": AddHistory(); break;
                //获取广告代码
                //case "getadd": GetAd(); break;
                //获取视频代码
                //case "getvideo": GetVideo(); break;
                //获取收货评语
                case "getendingremark": GetEndingRemark(); break;
                //获取订单公告
                case "getorderanns": GetOrderAnnouncement(); break;
                //获取浏览历史
                case "gethistory": GetHistory(); break;
                //获取对象点击率
                case "gethits": GetHits(); break;
                //获取相关文章
                case "getsmilararticle": GetSimilarArticle(); break;
                //获取最新发布的文章
                case "getlastarticle": GetLastArticle(); break;
                //删除浏览历史
                case "cleanhistory": CleanHistory(); break;
                //邮件订阅
                case "subscription": Subscription(); break;
                //会员反馈/意见
                case "userfeedback": UserFeedback(); break;
                //检查权限
                case "checkauthority": CheckAuthority(); break;
                //更新收藏夹分类
                case "changefavcolumn": ChangeFavColumn(); break;
                //更新收藏夹分类
                case "GetRecommentProductByHistory": GetRecommentProductByHistory(); break;
                //根据浏览历史推荐方案服务
                case "GetRecommentProjectByHistory": GetRecommentProjectByHistory(); break;
                //购买过某样产品的人还购物过的产品
                case "GetRelevantSales": GetRelevantSales(); break;
                //浏览过此产品的人还浏览过
                case "GetRelevantViewed": GetRelevantViewed(); break;
                //浏览过此下载信息的人还浏览过
                case "GetRelevantViewedDownload": GetRelevantViewedDownload(); break;
                //浏览过此方案服务的人还浏览过
                case "GetRelevantViewedProject": GetRelevantViewedProject(); break;
                //删除邀请函日志
                case "DelInitationlog": DelInitationlog(); break;
                //发送邀请注册函
                case "SendInvitation": SendInvitation(); break;
                //动态表单收集用户信息
                case "CollectionUserInfo": CollectionUserInfo(); break;
                //动态表单收集用户信息
                //case "Survey": Survey(); break;
                //获取报告分类
                case "GetReportCategories": GetReportCategories(); break;
                //获取留言分类
                case "GetLeavewordCategories": GetLeavewordCategories(); break;
                //发送报告
                case "SendReports": SendReports(); break;
                //发送留言
                case "SendLeaveword": SendLeaveword(); break;
                //直接付款
                case "DirectPay": DirectPay(); break;
                //采购
                case "submitorder": SubmitOrder(); break;
                //加盟商在线下单
                case "sendGetProductsByColumn": SendGetProductsByColumn(); break;
                //用户登录
                case "logincheck": LoginCheck(); break;

                #region ********************* 代理加盟 **************************
                //招商加盟满意度（帮助作用）反馈
                case "agenthelpuseful": AgentHelpUseful(); break;
                //加盟商意向定单
                case "agentorder": AgentOrder(); break;
                //删除代理商的定单
                case "delAgentOrder": DelAgentOrder(); break;
                //申请友情连接
                case "apply": AddApply(); break;
                #endregion
                    
                #region *********************下载中心 **************************
                //添加下载日志
                case "addDownload": AddDownload(); break;
                #endregion


                //首页申请加盟
                case "IndexAddAgent": IndexAddAgent(); break;
                //首页提交留言
                case "IndexSendLeaveword": IndexSendLeaveword(); break;  
                case "isshowim": IsShowIm(); break;
                //分站信息
                case "subsiteinfo": SubSiteInfo(); break;
                case "subsiteinfos": SubSiteInfos(); break;
                //最新产品
                case "getnewproduct": getnewproduct(); break;
                //在线客服状态 详细页
                case "imstate": ImState(); break;
                //新闻上一篇下一篇
                case "articlegduo": ArticleGduo(); break;  
                default:
                    WriteString("无效请求。");
                    break;
            }
        } 
	#endregion

        /// <summary>
        /// 添加下载日志
        /// </summary>
        private static void AddDownload()
        {
            //1 获取参数
            int oid = ComUtls.ParseInt(GF("oid"), -1);
            KeyValuePair<string, string> node;
            KeyValuePair<string, string> node2;

            
            VW_Download OBJ = DbSession.Default.Get<VW_Download>(VW_Download._.ID == oid);

            if (OBJ==null)
            {
                node = new KeyValuePair<string, string>("state", "0");
                node2 = new KeyValuePair<string, string>("msg", "此记录不存在!");
                WriteXml(node, node2);
                return;
            }
            
            //判断文件下载人的权限范围，为空表示不限制任何人下载
            if (OBJ.Authority == "")
            {
                node = new KeyValuePair<string, string>("state", "1");
                node2 = new KeyValuePair<string, string>("msg", "此文件可以所有人下载！");
                WriteXml(node, node2);
                return;
            }
            else//需要是会员
            {
                //判断是否登录
                if (!BLL.Mem.CheckPassport())
                {
                    node = new KeyValuePair<string, string>("state", "0");
                    node2 = new KeyValuePair<string, string>("msg", "您尚未登录或者还不是会员，不能下载此资源。<br />请<a href='/user/login.aspx' target='_blank' class='u'>登录</a>或<a target='_blank' href='register.aspx' class='u'>注册</a>。");
                    WriteXml(node, node2);
                    return;
                }
                
                //判断是会员，也是否享有会员间的区别权限
                if(BLL.Mem.CheckAuthority(OBJ.Authority)==false)
                {
                    node = new KeyValuePair<string, string>("state", "0");
                    node2 = new KeyValuePair<string, string>("msg", "对不起，您没有下载此资源的权限！");
                    WriteXml(node, node2);
                    return;
                } 
                else
                {
                    //检查是否有下过此资源的历史记录
                    VW_DownloadLog VW_DL = DbSession.Default.Get<VW_DownloadLog>(VW_DownloadLog._.DownloadID == oid&&VW_DownloadLog._.UserID==OSession.Mem.ID);
                    if(VW_DL!=null)
                    {
                        node = new KeyValuePair<string, string>("state", "1");
                        node2 = new KeyValuePair<string, string>("msg", "此资源可以再次下载！");
                        WriteXml(node, node2);
                        return;
                    }
                    
                    //检查下载文件的积分是否够用
                    if (OSession.Mem.Wealth < OBJ.Point)
                    {
                        node = new KeyValuePair<string, string>("state", "0");
                        node2 = new KeyValuePair<string, string>("msg", "对不起，您的积分不够，当前资源下载需要" + OBJ.Point.ToString() + "分!");
                        WriteXml(node, node2);
                        return;
                    }
                    
                    //初始化下载资源对象
                    tbDownloadLog DownloadLog = new tbDownloadLog();
                    DownloadLog.DownloadID = oid;
                    DownloadLog.DownloadURL = "";
                    DownloadLog.Enable = false;
                    DownloadLog.InputTime = DateTime.Now;
                    DownloadLog.UserID = OSession.Mem.ID;
                    DownloadLog.OrderID = 50;
                    
                    //插入记录
                    int rowsAffected = DbSession.Default.Save<tbDownloadLog>(DownloadLog);
                    if (rowsAffected > 0)
                    {
                        //如果插入成功，消耗积分和反馈积分给用户
                        int mark = OSession.Mem.Wealth + OBJ.ReturnPoint - OBJ.Point;
                        string cmdText = string.Format("UPDATE tbUser SET UserWealth={0} WHERE [ID]={1}", mark, OSession.Mem.ID);
                        rowsAffected = DbSession.Default.Excute(cmdText);                
                        
                        node = new KeyValuePair<string, string>("state", "1");
                        node2 = new KeyValuePair<string, string>("msg", "插入下载记录成功！");
                        WriteXml(node, node2);
                        return;
                    }
                    else
                    {
                        node = new KeyValuePair<string, string>("state", "0");
                        node2 = new KeyValuePair<string, string>("msg", "下载出现异常，请稍后再试！");
                        WriteXml(node, node2);
                        return;
                    }
                }
            }
        }

        
        
        
        /// <summary>
        /// 浏览过此方案服务的人还浏览过
        /// </summary>
        private static void GetRelevantViewedProject()
        {
            //1 获取参数
            int srcProdId = ComUtls.ParseInt(GF("oid"), -1);

            //2 从DB获取数据            
            Field[] nfields = new Field[]{
                VW_Project._.Title,
                VW_Project._.PhotoPath,
                VW_Project._.PageURL,
                VW_Project._.ID,
                VW_Project._.ShortDesc
            };
            DataTable dt = BLL.Project.GetRelevantViewed(srcProdId, nfields, 3);

            if (dt.Rows.Count == 0)
            {
                return;
            }

            //3 根据模板生成HTML代码
            string template = "<$Foreach$><dl>"
                                + "<dt><a href=\"{$PageURL$}\" target='_blank' title=\"{$Title$}\"><img src=\"{$PhotoPath$}\" alt=\"{$Title$}\"  title=\"{$Title$}\"/></a></dt>"
                                + "<dd class='t1'><a href=\"{$PageURL$}\" target='_blank' title=\"{$Title$}\">{$Title$}</a></dd>"
                                + "<dd class=\"d1\">{$ShortDesc$}</dd>"
                                + "</dl><$EndForeach$>";

            //4 回应
            WriteString(BLL.Template.ProcessTemplate(template, dt));
        }
        
        /// <summary>
        /// 用户登录
        /// </summary>
        private static void LoginCheck()
        {

            string username = GF("username").Trim();
            string pin = GF("password").Trim();
            KeyValuePair<string, string> node;
            KeyValuePair<string, string> node2;
            OEnum.Mem.LogingInResult result = BLL.Mem.Login(username, pin, DateTime.Now, IP);

            switch (result)
            {
                case NSW.OEnum.Mem.LogingInResult.Disabled:
                    node = new KeyValuePair<string, string>("state", "0");
                    node2 = new KeyValuePair<string, string>("msg", "此用户未激活，请激活帐户再登陆");
                    WriteXml(node, node2);
                    break;

                case NSW.OEnum.Mem.LogingInResult.Falied:
                    node = new KeyValuePair<string, string>("state", "0");
                    node2 = new KeyValuePair<string, string>("msg", "登陆失败，请稍后再试");
                    WriteXml(node, node2);
                    break;

                case NSW.OEnum.Mem.LogingInResult.IncorrectPin:
                    node = new KeyValuePair<string, string>("state", "0");
                    node2 = new KeyValuePair<string, string>("msg", "用户名或密码错误，请检查后再试");
                    WriteXml(node, node2);
                    break;
                case NSW.OEnum.Mem.LogingInResult.NonVerified:
                    node = new KeyValuePair<string, string>("state", "0");
                    node2 = new KeyValuePair<string, string>("msg", "新记录有激活帐户，检查您的电子邮件和激活您的帐户");
                    WriteXml(node, node2);
                    break;
                case NSW.OEnum.Mem.LogingInResult.NonVerifiedEmail:
                    node = new KeyValuePair<string, string>("state", "0");
                    node2 = new KeyValuePair<string, string>("msg", "此邮箱已被注册用户所使用");
                    WriteXml(node, node2);
                    break;
                case NSW.OEnum.Mem.LogingInResult.Successful:
                    node = new KeyValuePair<string, string>("state", "1");
                    node2 = new KeyValuePair<string, string>("msg", "欢迎您，登陆成功");
                    WriteXml(node, node2);
                    break;
                case NSW.OEnum.Mem.LogingInResult.UserNotExists:
                    node = new KeyValuePair<string, string>("state", "0");
                    node2 = new KeyValuePair<string, string>("msg", "此用户不存在，请仔细检查");
                    WriteXml(node, node2);
                    break;
                default:
                    break;
            }

        }

        
        /// <summaty>
        /// 初始化通用头部热门关键词信息
        /// </summaty>
        private static void InitCommonHeaderKeywords()
        {
            string rspkeywords = "";
            string sid = "";
            string s = GF("s").Trim();
            switch (s)
            {
                case "news": sid = "8"; break;
                case "help": sid = "9"; break;
                case "agent": sid = "10"; break;
                case "product": sid = "7"; break;
                default:
                    sid = "6";
                    break;
            }
            //关键词
            WhereClip nwhere = (VW_Keyword._.Enable == true && VW_Keyword._.ColumnID == sid);
            OrderByClip norder = (VW_Keyword._.OrderID.Asc && VW_Keyword._.ID.Asc);
            Field[] nfield = new Field[] { 
                VW_Keyword._.URL,
                VW_Keyword._.Title
            };
            DataTable dt = DbSession.Default.From<VW_Keyword>().Where(nwhere).OrderBy(norder).Select(nfield).ToDataTable(5);
            string template = "<$Foreach$><a href='{$URL$}' target='_parent' title=\"{$Title$}\">{$Title$}</a><$EndForeach$>";
            //string template = "<$Foreach$><a href='{$URL$}' target='_parent' title=\"{$Title$}\">{$Title$}</a>|<$EndForeach$>";
            rspkeywords = BLL.Template.ProcessTemplate(template, dt);
            //关键词
            //rspkeywords = rspkeywords.Substring(0, rspkeywords.Length - 1);
            WriteString(rspkeywords);

        }
        
        ///<summnry>
        ///填加一个友情连接
        ///</summary>
        private static void AddApply()
        {
            string Type = GF("Type");
            string Url = GF("Url");
            string Name = GF("Name");
            string PhotoPath = GF("PhotoPath");
            string Content = GF("Content");
            string UserName = GF("UserName");
            string Phone = GF("Phone");
            string Email = GF("Email");
            string QQ = GF("QQ");

            tbApply Obj = new tbApply();
            Obj.Type = int.Parse(Type);
            Obj.Url = Url;
            Obj.Name = Name;
            Obj.PhotoPath = PhotoPath;
            Obj.Content = Content;
            Obj.UserName = UserName;
            Obj.Phone = Phone;
            Obj.Email = Email;
            Obj.QQ = QQ;
            Obj.State = 0;
            Obj.InputTime = DateTime.Now;

            int rowsAffected = DbSession.Default.Save<tbApply>(Obj);
            if (rowsAffected > 0)
            {
                KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("state", "1");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "申请友情链提交接成功，请等待管理员的回复！");
                WriteXml(node1, node2);
            }
            else
            {
                KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "申请友情链提交失败，请稍后再试！");
                WriteXml(node1, node2);
            }
        }

        /// <summary>
        /// 处理产品的对比车(产品是不同类别)
        /// </summary>
        private static void AddCompare()
        {
            string ids = GF("ids");
            string flag = GF("flag");

            string cookie = OCookie.Mem.ProductCompare;
            string [] arrcookie = cookie.Split(',');
            string newcookie = string.Empty;

            if (cookie == "")
            {
                newcookie = ids;
            }
            else
            {
                    //添加
                    if (flag == "true")
                    {
                        bool res = false;
                        foreach (string obj in arrcookie)
                        {
                            if (obj == ids)
                            {
                                res = true;
                            }
                            else
                            {
                                if (newcookie == "")
                                {
                                    newcookie += obj;
                                }
                                else
                                {
                                    newcookie += "," + obj;
                                }
                            }
                            
                        }

                        if (res ==true)
                        {
                            newcookie = newcookie+","+ids;
                        }
                        else
                        {
                            newcookie = cookie + "," + ids;
                        }
                       
                    }
                    else//删除
                    {
                        
                        foreach (string obj in arrcookie)
                        {
                            if (obj != ids)
                            {
                                if(newcookie=="")
                                {
                                    newcookie += obj;
                                }
                                else
                                {
                                    newcookie +="," +obj;
                                }
                                
                            }
                        }
                    }
            }

            OCookie.Mem.ProductCompare = newcookie;

            KeyValuePair<string, string> node3 = new KeyValuePair<string, string>("state", "1");
            KeyValuePair<string, string> node4 = new KeyValuePair<string, string>("newcookie", newcookie);
            WriteXml(node3, node4);

        }
        
        /// <summary>
        /// 移除产品的对比车中的某个产品(产品是不同类别)
        /// </summary>
        private static void DelOneCompare()
        {
            string ids = GF("ids");

            string cookie = OCookie.Mem.ProductCompare;
            string[] arrcookie = cookie.Split(',');
            string newcookie = string.Empty;

            if (cookie == "")
            {
                newcookie = "";
            }
            else
            {
                foreach (string obj in arrcookie)
                {
                    if (obj != ids)
                    {
                        if (newcookie == "")
                        {
                            newcookie += obj;
                        }
                        else
                        {
                            newcookie += "," + obj;
                        }

                    }
                }
            }
            OCookie.Mem.ProductCompare = newcookie;

            if (newcookie=="")
            {
                KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("newcookie", "不存在产品记录");
                WriteXml(node1, node2);
            }
            else
            {
                KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("state", "1");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("newcookie", "移除成功");
                WriteXml(node1, node2);
            }

            
        }


        /// <summary>
        /// 移除产品的对比车中的所有产品(产品是不同类别)
        /// </summary>
        private static void DelAllCompare()
        {
            OCookie.Mem.ProductCompare = null;
            KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("state", "1");
            KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("newcookie", "移除成功");
            WriteXml(node1, node2);

        }
        
        
        /// <summary>
        /// 删除代理商的定单
        /// </summary>
        private static void DelAgentOrder()
        {
            if (!BLL.Mem.CheckPassport())
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "您尚登录会员，不可使用定单管理功能。<br />请<a href='/user/login.aspx' target='_blank' class='u'>登录</a>或<a target='_blank' href='register.aspx' class='u'>注册</a>。");
                WriteXml(node, node2);
                return;
            }

            //1 获取参数
            string ids = GF("ids");


            if (ids.IndexOf("on") != -1 && ids.Split(',').Length == 1)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "没有订单记录，无需删除。");
                WriteXml(node, node2);
                return;
            }
            else
            {
                ids = ids.Replace("on,","");
            }

            //2 检查参数
            if (!ComUtls.CheckIDsFormat(ids))
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "参数错误:ids");
                WriteXml(node, node2);
                return;
            }

            //3 查询数据库
            WhereClip nwhere = (tbAgentOrder._.ID.In(ids.Split(','))
                && tbAgentOrder._.UserID == OSession.Mem.ID);
            int rowsAffected = DbSession.Default.Delete<tbAgentOrder>(nwhere);

            //4 回应
            if (rowsAffected > 0)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", string.Format("删除加盟商定单成功，共 {0} 条记录被删除。", rowsAffected));
                WriteXml(node, node2);
                return;
            }
            else
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "删除加盟商定单失败，请稍候重试。");
                WriteXml(node, node2);
                return;
            }
        }

        /// <summary>
        /// 加盟在线下单
        /// </summary>
        private static void AgentOrder()
        {
            //1> 获取参数
            KeyValuePair<string, string> node1;
            KeyValuePair<string, string> node2;
            string name = GF("s_name");
            string title = GF("s_title");
            string tel = GF("s_tel");
            string email = GF("s_email");
            string content = GF("s_content");
            string address = GF("s_address");
            string enddate = GF("s_enddate");
            string s_IDList = GF("s_IDList");
            

            bool isLogin = BLL.Mem.CheckPassport();
            tbUser objUser = OSession.Mem.User;
            if (objUser.UserGroupID != 5)
            {
                node1 = new KeyValuePair<string, string>("state", "0");
                node2 = new KeyValuePair<string, string>("msg", "对不起，您不是代理商，无权在此下定单。");
                WriteXml(node1, node2);
                return;
            }

            tbAgentOrder ObjUserOrder = new tbAgentOrder();
            ObjUserOrder.UserID = objUser.ID;
            ObjUserOrder.ProductList = s_IDList;
            ObjUserOrder.Title = title;
            ObjUserOrder.Name = name;
            ObjUserOrder.Phone = tel;
            ObjUserOrder.Address = address;
            ObjUserOrder.Email = email;
            ObjUserOrder.FeedBack = "";
            ObjUserOrder.EndDate = Convert.ToDateTime(enddate);
            ObjUserOrder.InputTime = DateTime.Now;
            ObjUserOrder.Content = content;
            ObjUserOrder.PostState = 0;
            ObjUserOrder.ReceiveState = 0;

            //保存到数据库
            int rowsAffected = DbSession.Default.Save<tbAgentOrder>(ObjUserOrder);

            //显示提示
            if (rowsAffected > 0)
            {
                node1 = new KeyValuePair<string, string>("state", "1");
                node2 = new KeyValuePair<string, string>("msg", "定单提交成功，我们会尽快与您联系，谢谢！");
                WriteXml(node1, node2);
            }
            else
            {
                node1 = new KeyValuePair<string, string>("state", "0");
                node2 = new KeyValuePair<string, string>("msg", "定单提交失败，请重试！");
                WriteXml(node1, node2);
                // WriteString("0");
            }

        }
        
          /// <summary>
        /// 发送获取资讯列表通知
        /// </summary>
        private static void SendGetProductsByColumn()
        {
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
                nwhere = (VW_Product._.sid.Like(ColumnID + "%") && VW_Product._.Title.Like("%" + SearchText + "%")
                    && VW_Product._.Enable == true);
            }
            else
            {
                nwhere = (VW_Product._.sid.Like(ColumnID + "%")
                    && VW_Product._.Enable == true);
            }
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
        
        

        private static void SubmitOrder()
        {
            KeyValuePair<string, string> node1;
            KeyValuePair<string, string> node2;

            //1 获取参数
            int oid = ComUtls.ParseInt(GF("oid"), -1);
            string contact = HttpUtility.HtmlEncode(GF("contact").Trim());
            string compName = HttpUtility.HtmlEncode(GF("compName").Trim());
            string tel = HttpUtility.HtmlEncode(GF("tel").Trim());
            string mobile = HttpUtility.HtmlEncode(GF("mobile").Trim());
            string email = HttpUtility.HtmlEncode(GF("email").Trim());
            string addr = HttpUtility.HtmlEncode(GF("addr").Trim());
            string content = HttpUtility.HtmlEncode(GF("content").Trim());
            string validate = HttpUtility.HtmlEncode(GF("vali").Trim());

            //2> 检查参数  
            if (!CheckVerifyCode(validate))
            {
                WriteState(0, "验证码错误!");
            }
            //3 安全检查
            SecurityCheck(null, CheckingType.BlockToSubmitIPs, CheckingType.ForbiddenIP, CheckingType.GlobalSubmittingFrequency);

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
                orderObj.UserRemark = "公司名：" + compName + "；\r\n采购意向描述：" + content;
                orderObj.ZipCode = string.Empty;
                orderObj.Province = string.Empty;
                orderObj.Phone = tel;
                orderObj.ChnName = contact;
                orderObj.Address = addr;
                orderObj.City = string.Empty;
                orderObj.Email = email;
                orderObj.InvoiceTitle = string.Empty;
                orderObj.MPhone = mobile;
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

                if (rowsAfffected < 1)
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
                orderDetailObj.ProductName = title;
                orderDetailObj.ProductPrice = price;
                orderDetailObj.ShortDesc = string.Empty;
                orderDetailObj.UserPrice = closingPrice;
                orderDetailObj.PackageIDs = string.Empty;
                orderDetailObj.PackagePrices = string.Empty;
                int rowsAf = dbTran.Save<tbOrderDetail>(orderDetailObj);

                if (rowsAf < 1)
                {
                    throw new Exception("订单产品详细保存失败，请稍候重试。");
                }

                //提交事务
                dbTran.Commit();
                bool res = false; ;
                if (OConfig.GlobalConfig.SendingOrderBuiltMailNotifyToAdmin==true)
                {
                    res=ComUtls.SendMail(OConfig.GlobalConfig.ReceivingOrderBuiltMailAddress, contact + "在您的网站上提交了一份意向订单，请及时处理", contact + "在您的网站上提交了一份意向订单，请及时处理,具体信息为：联系人：" + contact + "<br>公司名称：" + compName + "<br>联系电话：" + tel + "<br>手机号码：" + mobile + "<br>邮箱:" + email + "<br>联系地址：" + addr + "<br>简要描述：" + content, true);
                }

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

            WriteXml(node1, node2 );
        }
        
        
        /// <summary>
        /// 产品详细页面套餐中的产品价格
        /// </summary>
        private static void GetTaoCanPrice()
        {
            string IDList = GF("IDList");
            string[] arr = IDList.Split(',');

            decimal OldPrice = 0;
            decimal NowPrice = 0;

            for (int i = 0; i < arr.Length;i++ )
            {
                VW_Product Product = DbSession.Default.Get<VW_Product>(VW_Product._.ID == int.Parse(arr[i]));
                //不存在冗于字段则返回
                if (Product.CustomerFields == "")
                {

                    if (BLL.Mem.CheckPassport())
                    {
                        OldPrice += Product.UserPrice;
                        NowPrice += Product.UserPrice;
                    }
                    else
                    {
                        OldPrice += Product.Price;
                        NowPrice += Product.Price;
                    }
                }
                else
                {
                    BLL.KV kvv = new NSW.BLL.KV("$$", "||", Product.CustomerFields);
                    //10、套装销售产品
                    //1>设置好是否显示套装勾选框
                    Boolean EnableCombos = ComUtls.ParseBool(kvv.GetValue("EnablePackage"), false);

                    if (EnableCombos == true)
                    {
                        OldPrice += Product.Price;
                        NowPrice += ComUtls.ParseDecimal(kvv.GetValue("PackagePrice"), 0);
                    }
                    else
                    {
                        if (BLL.Mem.CheckPassport())
                        {
                            OldPrice += Product.UserPrice;
                            NowPrice += Product.UserPrice;
                        }
                        else
                        {
                            OldPrice += Product.Price;
                            NowPrice += Product.Price;
                        }
                    }

                }
            }

            KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("OldPrice", OldPrice.ToString());
            KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("NowPrice", NowPrice.ToString());
            WriteXml(node1, node2);
            
            
        }
        
        
        
         /// <summary>
        /// 产品愿望夹(产品列表页面的预览功能)
        /// </summary>
        private static void PostProductWishs()
        {
            string attr = GF("attr");
            int num = ComUtls.ParseInt(GF("num"), 1);
            int oid = int.Parse(GF("oid"));

            if(!BLL.Mem.CheckPassport())
            {
                WriteState(0, "添加失败，您还没有登陆，请登陆后再试。");
            }

            VW_Product Product = DbSession.Default.Get<VW_Product>(VW_Product._.ID == oid);

            if (Product==null)
            {
                WriteState(0, "无效请求，数据不存在。");
            }
            
            tbMyWish Obj = new tbMyWish();
            Obj.Attr = attr;
            Obj.Num = num;
            Obj.PhotoPath = Product.PhotoPath;
            Obj.ProductID = oid;
            Obj.Title = Product.Title;
            Obj.Url = Product.PageURL;
            Obj.UserID = OSession.Mem.ID;
            Obj.Enable = false;
            Obj.InputTime = DateTime.Now;

            int row = DbSession.Default.Save<tbMyWish>(Obj);
            if (row > 0)
            {
                WriteState(1, "愿望夹收藏成功，请注意查看。");
            }
            else
            {
                WriteState(0, "添加失败，请稍后重试。");
            }
        }
               
        
        /// <summary>
        /// 产品愿望夹(产品列表页面的预览功能)
        /// </summary>
        private static void ShowMyWish()
        {
            StringBuilder sbRtnVal = new StringBuilder();
            int ID = int.Parse(GF("oid"));
            VW_Product Obj = DbSession.Default.Get<VW_Product>(VW_Product._.ID == ID);
            if(Obj==null)
            {
                WriteState(0, "不存在该产品！"); 
            }
            sbRtnVal.Append("<h1><a href='javascript:void(0)' onclick=\"$(this).parent().parent().fadeOut(80);hideFullBg('div_nsw_wishs_bg')\"><img src=\"/skins/default/Img/ico9_close.gif\" /></a>我的愿望夹</h1>");
            sbRtnVal.Append("<h4>添加到您的愿望夹</h4>");
            sbRtnVal.Append("<div class=\"tit\">" + Obj.Title+ "</div>");
            sbRtnVal.Append("<dl class=\"dl_p\"><dt><a target='_blank' href='" + Obj.PageURL + "'><img src='" + Obj.PhotoPath + "' alt='" + Obj.Title + "' title='" + Obj.Title+ "'></a></dt><dd>");
            sbRtnVal.Append(Obj.ShortDesc);
            sbRtnVal.Append("</dd></dl>");
            sbRtnVal.Append("<div class=\"mes6_lt\">");
            DataTable dt = DbSession.Default.From<tbProductAttribute>().Select(tbProductAttribute._.KeyNameID).Where(tbProductAttribute._.ProductID == ID).ToDataTable();
            if (dt.Rows.Count > 0)
            {
                //获得所有的置顶属性
                foreach (DataRow ObjRow in dt.Rows)
                {

                    //获得单独的一个属性对象
                    int KeyNameID = int.Parse(ObjRow["KeyNameID"].ToString());
                    tbProductAttributeColumn AttrCln = DbSession.Default.Get<tbProductAttributeColumn>(tbProductAttributeColumn._.ID == KeyNameID);

                    //是否存在这个属性对象
                    if (AttrCln == null)
                    {
                        continue;
                    }

                    //是否是置顶属性
                    if (!Obj.isTop)
                    {
                        continue;
                    }

                    //是否存在属性值
                    if (AttrCln.ValueList.Trim() == "")
                    {
                        continue;
                    }
                    //如果存在，开始追加属性输出（属性名）
                    sbRtnVal.Append("<dl class=\"dl_rt\"><dt>" + AttrCln.Title + ":</dt><dd>");

                    if (AttrCln.ValueList.IndexOf(",") != -1)
                    {
                        //不止一个置顶属性
                        string[] str = AttrCln.ValueList.Split(',');
                        if (str.Length > 0)
                        {
                            foreach (string s in str)
                            {
                                int AttValID = int.Parse(s);
                                //获得这个置顶属性的对象，得到对应的图片
                                tbProductAttributeValue tbAttValues = DbSession.Default.Get<tbProductAttributeValue>(tbProductAttributeValue._.ID == AttValID);
                                if (tbAttValues.SmallPhotoPath != "")
                                {
                                    //如果是图片的形式存在，则输出图片
                                    sbRtnVal.Append("<a href='javascript:void(0)' onclick=\"checkWishSize(this)\" title='" + AttrCln.Title + ":" + tbAttValues.Title + "'><img src='" + tbAttValues.SmallPhotoPath + "' /></a>");
                                }
                                else
                                {
                                    //如果是文字的显示存在，则输出文字
                                    sbRtnVal.Append("<a href='javascript:void(0)' onclick=\"checkWishSize(this)\" title='" + AttrCln.Title + ":" + tbAttValues.Title + "'>" + tbAttValues.Title + "</a>");
                                }
                            }
                        }

                    }
                    else
                    {
                        //只有一个置顶属性
                        int AttValID = int.Parse(AttrCln.ValueList);
                        //获得这个置顶属性的对象，得到对应的图片
                        tbProductAttributeValue tbAttValues = DbSession.Default.Get<tbProductAttributeValue>(tbProductAttributeValue._.ID == AttValID);
                        if (tbAttValues.SmallPhotoPath != "")
                        {
                            //如果是图片的形式存在，则输出图片
                            sbRtnVal.Append("<a href='javascript:void(0)' onclick=\"checkWishSize(this)\"  title='" + AttrCln.Title + ":" + tbAttValues.Title + "'><img src='" + tbAttValues.SmallPhotoPath + "' /></a>");
                        }
                        else
                        {
                            //如果是文字的显示存在，则输出文字
                            sbRtnVal.Append("<a href='javascript:void(0)' onclick=\"checkWishSize(this)\" title='" + AttrCln.Title + ":" + tbAttValues.Title + "'>" + tbAttValues.Title + "</a>");
                        }
                    }

                    sbRtnVal.Append("</dd></dl>");
                }
            }
            sbRtnVal.Append("<div class=\"clear\" ></div><span style='display:none'>期望数量: <input name=\"txtNum\" style='width:60px' id=\"txtNum\" type=\"text\" value='1' onkeyup=\"value=value.replace(/[^\\d]/g,'')\" /><input id='txtHide' name='txtHide' type='hidden' value='" + ID + "' /></span><div class=\"clear\"></div>");
            sbRtnVal.Append("<div class='mkattrs'><b>已选择：</b><span name=\"txtAttr\" id=\"txtAttr\"></span></div>");
            sbRtnVal.Append("<div><input type=\"button\" class=\"b63\" value=\"保存到愿望夹\" onclick=\"submitProductWishs('txtHide','txtAttr','txtNum')\" /> <input type=\"button\" class=\"b64\" value=\"取  消\" onclick=\"$(this).parent().parent().parent().fadeOut(80);hideFullBg('div_nsw_wishs_bg')\" /></div>");
            sbRtnVal.Append("</div>");

            WriteString(sbRtnVal.ToString());
        }
        
        /// <summary>
        /// 产品预定(产品列表页面的预览功能)
        /// </summary>
        private static void PostProductTips()
        {
            string email = GF("email");
            string content = GF("content");
            int state = int.Parse(GF("state"));
            int oid = int.Parse(GF("oid"));
            tbProductBooking Obj = new tbProductBooking();
            Obj.ProductID = oid;
            Obj.ShortDesc = content;
            Obj.State = state;
            Obj.UserEmail = email;
            Obj.OrderID = 50;
            Obj.InputTime = DateTime.Now;
            int row = DbSession.Default.Save<tbProductBooking>(Obj);
            if (row > 0)
            {
                WriteState(1, "产品预定成功，我们会及时的把该产品的最新信息发送给您。");
            }
            else
            {
                WriteState(0, "预定失败，请稍后重试。"); 
            }
        }
        
        
        
        
         /// <summary>
        /// 获得产品的简单介绍(产品列表页面的预览功能)
        /// </summary>
        private static void ShowProductInfo()
        {
            StringBuilder sbRtnVal = new StringBuilder();
            int ID = int.Parse(GF("oid"));
            int Index = int.Parse(GF("index"));
            VW_Product Obj = DbSession.Default.Get<VW_Product>(VW_Product._.ID == ID);
            if (Obj == null)
            {
                return;
            }
            int n=0;
            n = Index % 4;
            if(n==0)
            {
                n = 4;
            }
            if (n > 2)
            {
                sbRtnVal.Append("<div class=\"mesbook40\"><div class=\"con\"><img src=\"/skins/default/Img/PLeft.gif\" class=\"jian\" />");
            }
            else
            {
                sbRtnVal.Append("<div class=\"mesbook4\"><div class=\"con\"><img src=\"/skins/default/Img/PRight.gif\" class=\"jian\" />");
            }
            
            sbRtnVal.Append("<h4><a href='"+Obj.PageURL+"' >" + Obj.Title+ "</a></h4>");
            sbRtnVal.Append("<div class=\"cont\">"+Obj.ShortDesc+"</div>");
           // sbRtnVal.Append("<div class=\"jieshao\">产品库存、发货状况信息xxxxxxxxxxxxxxxxxxxxxxxxxxxx</div>");
            DataTable dt = DbSession.Default.From<tbProductAttribute>().Select(tbProductAttribute._.KeyNameID).Where(tbProductAttribute._.ProductID == ID).ToDataTable();
            if(dt.Rows.Count>0)
            {
                foreach (DataRow ObjRow in dt.Rows)
                {

                    //获得单独的一个属性对象
                    int KeyNameID = int.Parse(ObjRow["KeyNameID"].ToString());
                    tbProductAttributeColumn AttrCln = DbSession.Default.Get<tbProductAttributeColumn>(tbProductAttributeColumn._.ID == KeyNameID);

                    //是否存在这个属性对象
                    if (AttrCln == null)
                    {
                        continue;
                    }

                    //是否是置顶属性
                    if (!Obj.isTop)
                    {
                        continue;
                    }

                    //是否存在属性值
                    if (AttrCln.ValueList.Trim() == "")
                    {
                        continue;
                    }
                    //如果存在，开始追加属性输出（属性名）
                    sbRtnVal.Append("<dl class=\"dl_lt\"><dt>" + AttrCln.Title+ ":</dt><dd>");
                    
                    if (AttrCln.ValueList.IndexOf(",") != -1)
                    {
                        //不止一个置顶属性
                        string[] str = AttrCln.ValueList.Split(',');
                        if (str.Length > 0)
                        {
                            foreach (string s in str)
                            {
                                int AttValID = int.Parse(s);
                                //获得这个置顶属性的对象，得到对应的图片
                                tbProductAttributeValue tbAttValues = DbSession.Default.Get<tbProductAttributeValue>(tbProductAttributeValue._.ID == AttValID);
                                if (tbAttValues == null)
                                {
                                    continue;
                                }
                                if (tbAttValues.SmallPhotoPath != "")
                                {
                                    //如果是图片的形式存在，则输出图片
                                    sbRtnVal.Append("<a href='javascript:void(0)'><img src='" + tbAttValues.SmallPhotoPath + "' alt='" + tbAttValues.Title + "' /></a>");
                                }
                                else
                                {
                                    //如果是文字的显示存在，则输出文字
                                    sbRtnVal.Append("<a href='javascript:void(0)'>" + tbAttValues.Title + "</a>");
                                }
                            }
                        }

                    }
                    else
                    {
                        //只有一个置顶属性
                        int AttValID = int.Parse(AttrCln.ValueList);
                        //获得这个置顶属性的对象，得到对应的图片
                        tbProductAttributeValue tbAttValues = DbSession.Default.Get<tbProductAttributeValue>(tbProductAttributeValue._.ID == AttValID);
                        if (tbAttValues==null)
                        {
                            continue;
                        }
                        if (tbAttValues.SmallPhotoPath != "")
                        {
                            //如果是图片的形式存在，则输出图片
                            sbRtnVal.Append("<a href='javascript:void(0)'><img src='" + tbAttValues.SmallPhotoPath + "' alt='" + tbAttValues.Title + "' /></a>");
                        }
                        else
                        {
                            //如果是文字的显示存在，则输出文字
                            sbRtnVal.Append("<a href='javascript:void(0)'>" + tbAttValues.Title + "</a>");
                        }
                    }

                    sbRtnVal.Append("</dd></dl>");
                }
            }
            sbRtnVal.Append("<div class=\"clear\"></div>");
            sbRtnVal.Append("<div class=\"mes_btn\"><input type=\"button\" class=\"b55\" onclick=\"mailProduct('product'," + ID + ")\" value=\"推荐给朋友\" /><input type=\"button\" class=\"b56\" onclick=\"showFav(this,'" + Obj.Title + "','" + Obj .PageURL+ "')\" value=\"添加收藏\" /><input type=\"button\" class=\"b57\" value=\"加到愿望夹\" onclick=\"showMyWish(" + Obj.ID + ")\" /></div>");
            sbRtnVal.Append("  <div class=\"tc\"><input type=\"button\" class=\"b59\" value=\"立即采购\"  onclick=\"javascript:window.open('" + Obj.PageURL + "#caigou')\" /><input type=\"button\" class=\"b60\" value=\"查看商品详情\" onclick=\"javascript:window.open('" + Obj.PageURL + "')\" /></div>");
            sbRtnVal.Append("</div></div>");
            WriteString(sbRtnVal.ToString());
        }


        /// <summary>
        /// 获得产品的简单介绍(产品列表页面的预览功能)
        /// </summary>
        private static void ShowProductInfos()
        {
            StringBuilder sbRtnVal = new StringBuilder();
            int ID = int.Parse(GF("oid"));
            VW_Product Obj = DbSession.Default.Get<VW_Product>(VW_Product._.ID == ID);
            if (Obj == null)
            {
                return;
            }

            sbRtnVal.Append("<div class=\"mesbook44\"><div class=\"con\"><img src=\"/skins/default/Img/PRight.gif\" class=\"jian\" />");

            sbRtnVal.Append("<h4><a href='" + Obj.PageURL + "' >" + Obj.Title + "</a></h4>");
            sbRtnVal.Append("<div class=\"cont\">" + Obj.ShortDesc + "</div>");
         //  sbRtnVal.Append("<div class=\"jieshao\">产品库存、发货状况信息xxxxxxxxxxxxxxxxxxxxxxxxxxxx</div>");
            DataTable dt = DbSession.Default.From<tbProductAttribute>().Select(tbProductAttribute._.KeyNameID).Where(tbProductAttribute._.ProductID == ID).ToDataTable();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow ObjRow in dt.Rows)
                {

                    //获得单独的一个属性对象
                    int KeyNameID = int.Parse(ObjRow["KeyNameID"].ToString());
                    tbProductAttributeColumn AttrCln = DbSession.Default.Get<tbProductAttributeColumn>(tbProductAttributeColumn._.ID == KeyNameID);

                    //是否存在这个属性对象
                    if (AttrCln == null)
                    {
                        continue;
                    }

                    //是否是置顶属性
                    if (!Obj.isTop)
                    {
                        continue;
                    }

                    //是否存在属性值
                    if (AttrCln.ValueList.Trim() == "")
                    {
                        continue;
                    }
                    //如果存在，开始追加属性输出（属性名）
                    sbRtnVal.Append("<dl class=\"dl_lt\"><dt>" + AttrCln.Title + ":</dt><dd>");

                    if (AttrCln.ValueList.IndexOf(",") != -1)
                    {
                        //不止一个置顶属性
                        string[] str = AttrCln.ValueList.Split(',');
                        if (str.Length > 0)
                        {
                            foreach (string s in str)
                            {
                                int AttValID = int.Parse(s);
                                //获得这个置顶属性的对象，得到对应的图片
                                tbProductAttributeValue tbAttValues = DbSession.Default.Get<tbProductAttributeValue>(tbProductAttributeValue._.ID == AttValID);
                                if (tbAttValues == null)
                                {
                                    continue;
                                }
                                if (tbAttValues.SmallPhotoPath != "")
                                {
                                    //如果是图片的形式存在，则输出图片
                                    sbRtnVal.Append("<a href='javascript:void(0)'><img src='" + tbAttValues.SmallPhotoPath + "' alt='" + tbAttValues.Title + "' /></a>");
                                }
                                else
                                {
                                    //如果是文字的显示存在，则输出文字
                                    sbRtnVal.Append("<a href='javascript:void(0)'>" + tbAttValues.Title + "</a>");
                                }
                            }
                        }

                    }
                    else
                    {
                        //只有一个置顶属性
                        int AttValID = int.Parse(AttrCln.ValueList);
                        //获得这个置顶属性的对象，得到对应的图片
                        tbProductAttributeValue tbAttValues = DbSession.Default.Get<tbProductAttributeValue>(tbProductAttributeValue._.ID == AttValID);
                        if (tbAttValues == null)
                        {
                            continue;
                        }
                        if (tbAttValues.SmallPhotoPath != "")
                        {
                            //如果是图片的形式存在，则输出图片
                            sbRtnVal.Append("<a href='javascript:void(0)'><img src='" + tbAttValues.SmallPhotoPath + "' alt='" + tbAttValues.Title + "' /></a>");
                        }
                        else
                        {
                            //如果是文字的显示存在，则输出文字
                            sbRtnVal.Append("<a href='javascript:void(0)'>" + tbAttValues.Title + "</a>");
                        }
                    }

                    sbRtnVal.Append("</dd></dl>");
                }
            }
            sbRtnVal.Append("<div class=\"clear\"></div>");
            sbRtnVal.Append("<div class=\"mes_btn\"><input type=\"button\" class=\"b55\" onclick=\"mailProduct('product'," + ID + ")\" value=\"推荐给朋友\" /><input type=\"button\" class=\"b56\" onclick=\"showFav(this,'" + Obj.Title + "','" + Obj.PageURL + "')\" value=\"添加收藏\" /><input type=\"button\" class=\"b57\" value=\"加到愿望夹\" onclick=\"showMyWish(" + Obj.ID + ")\" /></div>");
            sbRtnVal.Append("  <div class=\"tc\"><input type=\"button\" class=\"b59\" value=\"立即采购\"  onclick=\"javascript:window.open('" + Obj.PageURL + "#caigou')\" /><input type=\"button\" class=\"b60\" value=\"查看商品详情\" onclick=\"javascript:window.open('" + Obj.PageURL + "')\" /></div>");
            sbRtnVal.Append("</div></div>");
            WriteString(sbRtnVal.ToString());
        }
        

        /// <summary>
        /// 获得置顶属性值的图片
        /// </summary>
        private static void  GetAttrValuesPhotos()
        {
            StringBuilder sbRtnVal = new StringBuilder();
            int ID =int.Parse(GF("oid"));
            tbProductExtendAttribute Obj = DbSession.Default.Get<tbProductExtendAttribute>(tbProductExtendAttribute._.AttributeValueID == ID);
            if (Obj == null)
            {
                return;
            }
            if (Obj.PhotoPath != "")
            {
                string[] str = ComUtls.SplitByEnter(Obj.PhotoPath);
                for (int i = 0; i < str.Length; i++)
                {
                    sbRtnVal.Append("<a rev=" + str[i] + " rel=\"zoom1\" href=" + str[i] + " style=\"outline-color: -moz-use-text-color; outline-style: none; outline-width: 0pt;\"><img rev='/tools/photo.aspx?p=" + str[i] + "&amp;t=0&amp;w=60&amp;h=60' rel=\"zoom1\" class=\"blackborder\"  src='/tools/photo.aspx?p=" + str[i] + "&amp;t=0&amp;w=60&amp;h=60'/></a>");
                }

            }
            WriteString(sbRtnVal.ToString());
            //WriteState(1,sbRtnVal.ToString());
        }
        
        
        
        
        /// <summary>
        /// 直接付款
        /// </summary>
        private static void DirectPay()
        {
            //获取参数
            string payer = ClearGF("payer");
            string email = ClearGF("email");
            string tel = ClearGF("tel");
            string mobile = ClearGF("mobile");
            string salesMan = ClearGF("salesMan");
            decimal dMoney = ComUtls.ParseDecimal(GF("_money"), -1);
            string sUse = ClearGF("_use");
            string payment = ClearGF("payment");

            //判断参数
            List<string> lstErr = new List<string>();

            if (payer.Length == 0)
            {
                lstErr.Add("付款人不可为空");
            }

            if (email.Length == 0)
            {
                lstErr.Add("电子邮箱地址不可为空");
            }
            else if (!ComUtls.CheckEmail(email))
            {
                lstErr.Add("电子邮箱地址格式错误");
            }

            if (dMoney <= 0)
            {
                lstErr.Add("付款金额必须为数字且大于0");
            }

            if (sUse.Length == 0)
            {
                lstErr.Add("款项用途不可为空");
            }

            if (payment.Length == 0)
            {
                lstErr.Add("请选择付款方式");
            }

            //如果有错误，则返回错误，中止操作
            if (lstErr.Count > 0)
            {
                WriteState(0, GetError(lstErr));
                return;
            }

            //写入cookie
            OCookie.Cart.DirectPayInfo.DMoney = dMoney;
            OCookie.Cart.DirectPayInfo.Mobile = mobile;
            OCookie.Cart.DirectPayInfo.Payee = (salesMan.Length > 0 ? salesMan : OConfig.GlobalConfig.SiteName);
            OCookie.Cart.DirectPayInfo.Payer = payer;
            OCookie.Cart.DirectPayInfo.SUse = sUse;
            OCookie.Cart.DirectPayInfo.Tel = tel;
            OCookie.Cart.DirectPayInfo.Email = email;

            //填充已选择的支付方式信息
            tbPayMethod nobjPaymentMethod;

            if (payer == "alipay")
            {
                nobjPaymentMethod = BLL.Order.GetAlipayPaymentMethod();
            }
            else
            {
                nobjPaymentMethod = BLL.Order.Get99BillPaymentMethod();
            }

            OCookie.Cart.DirectPayInfo.PaymentMethodIcon = nobjPaymentMethod.PhotoPath;
            OCookie.Cart.DirectPayInfo.PaymentMethodID = nobjPaymentMethod.ID;
            OCookie.Cart.DirectPayInfo.PaymentMethodTitle = nobjPaymentMethod.Title;

            //回应
            WriteState(1, "提交直接付款成功，现将转到付款操作。");
        }

        /// <summary>
        /// 发送留言
        /// </summary>
        private static void SendLeaveword()
        {
            // 获取参数
            string title = ClearGF("title");
            // string compName = ClearGF("compName");
            string cat = ClearGF("cat");
            string contact = ClearGF("contact");
            string email = ClearGF("email");
            string shortDesc = ClearGF("shortDesc");
            string tel = ClearGF("tel");
            string mobile = ClearGF("mobile");

            string verificationCode = ClearGF("verificationCode");
            //2> 检查参数    
            if (!CheckVerifyCode(verificationCode))
            {
                WriteState(0, "验证码错误!");
            }
            //安全检查
            SecurityCheck(null, CheckingType.BlockToSubmitIPs, CheckingType.ForbiddenIP, CheckingType.GlobalSubmittingFrequency);


            //保存记录
            tbLeaveword nobj = new tbLeaveword();
            nobj.Category = cat;
            nobj.Contact = contact;
            nobj.Content = shortDesc;
            nobj.Email = email;
            nobj.Enable = false;
            nobj.InputTime = DateTime.Now;
            nobj.IP = IP;
            nobj.MobileNo = mobile;
            nobj.OrderID = 50;
            nobj.TelNo = tel;
            nobj.Title = title;
            int rowsAffected = DbSession.Default.Save<tbLeaveword>(nobj);

            //回应
            if (rowsAffected > 0)
            {
                //更新最后提交时间
                OSession.Common.LastPost = DateTime.Now;

                //发送邮件通知致管理员
                if (OConfig.GlobalConfig.SendingReportsMailNotifyToAdmin)
                {
                    BLL.Help.SendLeavewordMailNotify(nobj);
                }

                WriteState(1, "感谢您的留言，我们有您的支持将做的美好。");
            }
            else
            {
                WriteState(0, "对不起，提交失败，请稍候重试。");
            }
        }

        /// <summary>
        /// 发送错误报告
        /// </summary>
        private static void SendReports()
        {
            // 获取参数
            string title = ClearGF("title");
            string url = ClearGF("url");
            string cat = ClearGF("cat");
            string contact = ClearGF("contact");
            string email = ClearGF("email");
            string shortDesc = ClearGF("shortDesc");

            //安全检查
            SecurityCheck(null, CheckingType.BlockToSubmitIPs, CheckingType.ForbiddenIP, CheckingType.GlobalSubmittingFrequency);

            //保存记录
            tbBugReport nobj = new tbBugReport();
            nobj.BugReportColumnName = cat;
            nobj.BugReportContact = contact;
            nobj.BugReportDill = false;
            nobj.BugReportDillName = string.Empty;
            nobj.BugReportDillRemark = string.Empty;
            nobj.BugReportShortDesc = shortDesc;
            nobj.BugReportURL = url;
            nobj.BugReportUserEmail = email;
            nobj.BugReportWebsiteURL = url;
            nobj.InputTime = DateTime.Now;
            nobj.IP = IP;
            nobj.Title = title;
            //冗余字段
            nobj.BugReportCompName = string.Empty;
            nobj.BugReportMphone = string.Empty;
            nobj.BugReportMSN = string.Empty;
            nobj.BugReportPhone = string.Empty;
            nobj.BugReportQQ = string.Empty;
            nobj.Enable = true;
            int rowsAffected = DbSession.Default.Save<tbBugReport>(nobj);

            //回应
            if (rowsAffected > 0)
            {
                //更新最后提交时间
                OSession.Common.LastPost = DateTime.Now;
                //发送邮件通知致管理员
                if (OConfig.GlobalConfig.SendingReportsMailNotifyToAdmin)
                {
                    BLL.Site.SendReportsToAdmin(nobj);
                }

                WriteState(1, "感谢您的报告，我们有您的支持将做的美好。");
            }
            else
            {
                WriteState(0, "对不起，提交失败，请稍候重试。");
            }
        }

        /// <summary>
        /// 获取留言分类
        /// </summary>
        private static void GetLeavewordCategories()
        {
            WriteString(OConfig.GlobalConfig.LeavewordCategories);
        }

        /// <summary>
        /// 获取报告分类
        /// </summary>
        private static void GetReportCategories()
        {
            WriteString(OConfig.GlobalConfig.ReportCategories);
        }

        /// <summary>
        /// 投票
        /// </summary>
        private static void Survey()
        {
            //获取参数
            int subjectID = ComUtls.ParseInt(GF("_SUR_SubjectID"), -1);
            string checkedItems = GF("_CheckedItems");
            HttpCookie cookie = OCookie.UserCookie.SurveySubject;
            string[] arrCheckedItm = StringUtls.Split(checkedItems, ",");

            //检查参数
            if (subjectID < 1 || !ComUtls.CheckIDsFormat(checkedItems))
            {
                WriteState(0, "参数非法。");
                return;
            }

            //检查该浏览器是参与同主题投票（COOKIE保存主题ID）
            if (BLL.Survey.HasHistoryInCookie(subjectID))
            {
                WriteState(0, "感谢您的参与与关注。");
                return;
            }

            //从DB读取主题
            WhereClip nwhere = (tbSurvey._.ID == subjectID
                && OConst.Survey.WhereEnabled);
            tbSurvey surveyObj = DbSession.Default.Get<tbSurvey>(nwhere);

            //如果主题不存在、或禁用，回应消息
            if (surveyObj == null)
            {
                WriteState(0, "无效投票主题。");
                return;
            }

            //检查已选择项与主题投票模式是否相符（单选/复选）
            if (surveyObj.SelectionMode == 1 && arrCheckedItm.Length > 1)
            {
                WriteState(0, "无效投票模式。");
                return;
            }

            //检查已选择的投票项是否合法
            if (!BLL.Survey.IsLegalSurvey(arrCheckedItm, subjectID))
            {
                WriteState(0, "无效投票项。");
                return;
            }

            string s = "";
            //提交投票
            bool tmpB = BLL.Survey.SubmitSurvey(arrCheckedItm, subjectID, ref s);

            //回应消息
            if (tmpB)
            {
                WriteState(1, "投票提交成功，感谢您的参与。");
            }
            else
            {
                WriteState(0, "对不起，投票提交失败，请稍候重试或联系网站管理员。" + s);
            }
        }

        /// <summary>
        /// 收集用户信息
        /// </summary>
        private static void CollectionUserInfo()
        {
            //获取参数
            string fromUsername = ClearGF("FromUsername");
            string fromSiteName = ClearGF("FromSiteName");
            string fromUrl = ClearGF("FromUrl");
            string fromTitle = ClearGF("FromTitle");
            string fromKeyName = ClearGF("FromKeyName");
            //
            string compName = ClearGF("CompName");
            string contact = ClearGF("Contact");
            string email = ClearGF("Email");
            string phone = ClearGF("Phone");
            string mPhone = ClearGF("MPhone");
            string QQ = ClearGF("QQ");
            string MSN = ClearGF("MSN");

            //安全检查
            SecurityCheck(null, CheckingType.BlockToSubmitIPs, CheckingType.ForbiddenIP, CheckingType.GlobalSubmittingFrequency);

            //保存记录到DB
            tbSiteAnalysize nobj = new tbSiteAnalysize();
            nobj.CompName = compName;
            nobj.Contact = contact;
            nobj.Email = email;
            nobj.FromKeyName = fromKeyName;
            nobj.FromSiteName = fromSiteName;
            nobj.FromUrl = fromUrl;
            nobj.FromTitle = fromTitle;
            nobj.FromUsername = fromUsername;
            nobj.InputTime = DateTime.Now;
            nobj.IP = IP;
            nobj.MPhone = mPhone;
            nobj.MSN = MSN;
            nobj.Phone = phone;
            nobj.QQ = QQ;
            nobj.ShortDesc = string.Empty;
            int rowsAffected = DbSession.Default.Save<tbSiteAnalysize>(nobj);

            //保存成功后更新最后提交时间
            if (rowsAffected > 0)
            {
                OSession.Common.LastPost = DateTime.Now;
                WriteString("1");
            }
            else
            {
                WriteString("0");
            }
        }

        #region ********************* 代理加盟 **************************

        /// <summary>
        /// 招商加盟满意度（帮助作用）反馈
        /// </summary>
        private static void AgentHelpUseful()
        {
            KeyValuePair<string, string> key1 = new KeyValuePair<string, string>();
            KeyValuePair<string, string> key2 = new KeyValuePair<string, string>();

            //1> 获取参数
            string notion = GF("notion").ToLower();
            int oid = ComUtls.ParseInt(GF("oid"), -1);

            //2> 判断参数

            if (oid < 1)
            {
                return;
            }

            if (notion != "1"
                && notion != "2"
                && notion != "3")
            {
                return;
            }

            //3> 检查提交频率是否可疑
            if (!BLL.OSecurity.CheckInterval(OSession.Common.LastPost, 15))
            {
                key1 = new KeyValuePair<string, string>("state", "0");
                key2 = new KeyValuePair<string, string>("msg", "满意度看法提交过于频繁，提交无效，感谢您的参与。");
                WriteXml(key1, key2);
                return;
            }

            //4> 增加满意度
            string fieldName;
            switch (notion)
            {
                case "1": fieldName = "AgentComplete"; break;
                case "2": fieldName = "AgentSome"; break;
                default: fieldName = "AgentLess";
                    break;
            }

            //事务处理
            DbTran tran = DbSession.Default.BeginTran();
            int rowsAffected = -1;
            int logRowsAffected = -1;

            try
            {
                string cmdText = string.Format("UPDATE {0} SET {1}={1}+1 WHERE [ID]={2}",
               ORes.OTableName.tbAgent, fieldName, oid);
                rowsAffected = tran.Excute(cmdText);

                tbAgentSurvery objAgentSurvery = new tbAgentSurvery();
                objAgentSurvery.AgentComplete = (notion == "1");
                objAgentSurvery.AgentID = oid;
                objAgentSurvery.AgentLess = (notion == "3");
                objAgentSurvery.AgentSome = (notion == "2");
                objAgentSurvery.InputTime = DateTime.Now;
                objAgentSurvery.UserIP = IP;
                objAgentSurvery.UserName = OSession.Mem.Username;
                logRowsAffected = tran.Save<tbAgentSurvery>(objAgentSurvery);

                tran.Commit();
            }
            catch
            {
                tran.Rollback();
            }
            finally
            {
                tran.Close();
            }

            //5> 回应消息
            if (rowsAffected > 0)
            {
                OSession.Common.LastPost = DateTime.Now;
                key1 = new KeyValuePair<string, string>("state", "1");
                key2 = new KeyValuePair<string, string>("msg", "提交成功，感谢您的参与。");
                WriteXml(key1, key2);
            }
            else
            {
                OSession.Common.LastPost = DateTime.Now;
                key1 = new KeyValuePair<string, string>("state", "0");
                key2 = new KeyValuePair<string, string>("msg", "提交失败，请稍候重试。");
                WriteXml(key1, key2);
            }
        }
        #endregion

        /// <summary>
        /// 发送邀请注册函（只接受单个电子邮箱地址）
        /// </summary>
        private static void SendInvitation()
        {
            //获取参数
            string email = GF("_email");

            //参数检查
            if (!ComUtls.CheckEmail(email))
            {
                return;
            }

            //安全检查
            SecurityCheck(null, CheckingType.BlockToSubmitIPs, CheckingType.ForbiddenIP, CheckingType.GlobalSubmittingFrequency);

            //发送邀请函
            string rename = (OSession.Mem.User.ChnName.Length > 0 ? OSession.Mem.User.ChnName : OSession.Mem.Username);
            string body = string.Format("我是{0}，我成为{1}网站会员之后，觉得他们提供的服务还不错，我觉得你不妨也试试。",
                rename, OConfig.GlobalConfig.SiteName);
            int successfullySendTimes = BLL.Mem.SendInitationRegisterMail(email, body);

            //回应
            if (successfullySendTimes > 0)
            {
                //更新最后提交的时间
                OSession.Common.LastPost = DateTime.Now;

                string msg = string.Format("恭喜您，系统已经发送了 {0} 份邀请函，同时请电话通知对方接收电子邮件，"
                        + "或者短信通知对方接收电子邮件进行下一步注册，感谢您对{1}网站的支持！"
                        + "$$<a href='/user/InviteUser.aspx'>继续发送邀请</a>"
                        + "||<a href='/user/InviteUserList.aspx'>我的邀请函列表</a>",
                        successfullySendTimes, OConfig.GlobalConfig.SiteName);
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", msg);
                WriteXml(node, node2);
            }
            else
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "未发送任何邀请函");
                WriteXml(node, node2);
            }


        }

        /// <summary>
        /// 删除邀请函日志
        /// </summary>
        private static void DelInitationlog()
        {
            if (!BLL.Mem.CheckPassport())
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "您尚未注册会员，不可使用产品收藏夹功能。<br />请<a href='/user/login.aspx' target='_blank' class='u'>登录</a>或<a target='_blank' href='register.aspx' class='u'>注册</a>。");
                WriteXml(node, node2);
                return;
            }

            //1 获取参数
            string ids = GF("ids");
            string[] s_id = ids.Split(',');

            //3 查询数据库
            int rowsAffected = 0;
            for (int i = 1; i < s_id.Length; i++)
            {
                if (ComUtls.ParseInt(s_id[i], -1) != -1)
                {
                    WhereClip nwhere = (tbInviteLog._.ID == s_id[i] && tbInviteLog._.Username == OSession.Mem.ID);
                    rowsAffected = DbSession.Default.Delete<tbInviteLog>(nwhere);
                }
            }


            //4 回应
            if (rowsAffected > 0)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", string.Format("删除邀请函成功，共 {0} 条记录被删除。", rowsAffected));
                WriteXml(node, node2);
                return;
            }
            else
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "删除邀请函失败，请稍候重试。");
                WriteXml(node, node2);
                return;
            }
        }

        /// <summary>
        /// 浏览过此产品的人还浏览过
        /// </summary>
        public static void GetRelevantViewed()
        {
            if (!OSwitch.RelevantProduct
                || !OConfig.GlobalConfig.Product.EnableRelevantProduct)
            {
                WriteString(string.Empty);
                return;
            }

            //1 获取参数
            int srcProdId = ComUtls.ParseInt(GF("oid"), -1);

            //2 从DB获取数据            
            Field[] nfields = new Field[]{
                VW_Product._.Title,
                VW_Product._.ShortDesc,
                VW_Product._.PhotoPath,
                VW_Product._.PageURL,
                VW_Product._.ID
            };
            DataTable dt = BLL.Product.GetRelevantViewed(srcProdId, nfields, 3);

            if (dt.Rows.Count == 0)
            {
                return;
            }

            //3 根据模板生成HTML代码
            string template = "<$Foreach$><dl>"
                                + "<dt><a href=\"" + SiteDomain + "{$PageURL$}\" target='_blank' title=\"{$Title$}\"><img src=\"" + SiteDomain + "{$PhotoPath$}\" alt=\"{$Title$}\" title=\"{$Title$}\" /></a></dt>"
                                + "<dd class='t1'><a href=\""+SiteDomain+"{$PageURL$}\" target='_blank' title=\"{$Title$}\">{$Title$}</a></dd>"
                                + "<dd class=\"d1\">{$ShortDesc$}</dd>"
                                + "</dl><$EndForeach$>";

            //4 回应
            WriteString(BLL.Template.ProcessTemplate(template, dt));
        }


        /// <summary>
        /// 浏览过此下载信息的人还浏览过
        /// </summary>
        public static void GetRelevantViewedDownload()
        {
            //1 获取参数
            int srcProdId = ComUtls.ParseInt(GF("oid"), -1);

            //2 从DB获取数据            
            Field[] nfields = new Field[]{
                VW_Download._.Title,
                VW_Download._.ShortDesc,
                VW_Download._.PhotoPath,
                VW_Download._.PageURL,
                VW_Download._.ID
            };
            DataTable dt = BLL.Download.GetRelevantViewed(srcProdId, nfields, 3);

            if (dt.Rows.Count == 0)
            {
                return;
            }

            //3 根据模板生成HTML代码
            string template = "<$Foreach$><dl>"
                                + "<dt><a href=\"" + SiteDomain + "{$PageURL$}\" target='_blank' title=\"{$Title$}\"><img src=\"" + SiteDomain + "{$PhotoPath$}\" alt=\"{$Title$}\" title=\"{$Title$}\"/></a></dt>"
                                + "<dd ><a href=\"" + SiteDomain + "{$PageURL$}\"  target='_blank' title=\"{$Title$}\">{$Title$}</a> <span>{$ShortDesc$}</span></dd>"
                                + "</dl><$EndForeach$>";

            //4 回应
            WriteString(BLL.Template.ProcessTemplate(template, dt));
        }

        /// <summary>
        /// 购买过某样产品的人还购物过的产品
        /// </summary>
        public static void GetRelevantSales()
        {
            if (!OSwitch.RelevantProduct
                || !OConfig.GlobalConfig.Product.EnableRelevantProduct)
            {
                WriteString(string.Empty);
                return;
            }

            //1 获取参数
            int srcProdId = ComUtls.ParseInt(GF("oid"), -1);

            //2 从DB获取数据            
            Field[] nfields = new Field[]{
                VW_Product._.Title,
                VW_Product._.ShortDesc,
                VW_Product._.PhotoPath,
                VW_Product._.PageURL,
                VW_Product._.ID
            };
            DataTable dt = BLL.Product.GetRelevantSales(srcProdId, nfields, 3);

            if (dt.Rows.Count == 0)
            {
                return;
            }

            //3 根据模板生成HTML代码
            string template = "<$Foreach$><dl>"
                                + "<dt><a href=\"" + SiteDomain + "{$PageURL$}\" target='_blank' title=\"{$Title$}\"><img src=\"" + SiteDomain + "{$PhotoPath$}\" alt=\"{$Title$}\" title=\"{$Title$}\"/></a></dt>"
                                + "<dd class='dt1'><a href=\"" + SiteDomain + "{$PageURL$}\" target='_blank' title=\"{$Title$}\">{$Title$}</a></dd>"
                                + "<dd class=\"d1\">{$ShortDesc$}</dd>"
                                + "</dl><$EndForeach$>";

            //4 回应
            WriteString(BLL.Template.ProcessTemplate(template, dt));
        }

        /// <summary>
        /// 根据浏览历史推荐产品
        /// </summary>
        public static void GetRecommentProductByHistory()
        {
            if (!OSwitch.RelevantProduct
                || !OConfig.GlobalConfig.Product.EnableRelevantProduct)
            {
                WriteString(string.Empty);
                return;
            }
            System.Collections.Specialized.HybridDictionary hd = new System.Collections.Specialized.HybridDictionary();
            hd.Add("Sql", "select top 6 columnid,sid,title,photopath,pageurl from vw_product order by newid()");

            string values = NVEngine.Directive.UserControlDirective.LoadUserControl("/UserControls/Product/Commend.ascx", hd, false);
            WriteString(values);
        }
        /// <summary>
        /// 更新收藏夹分类
        /// </summary>
        private static void ChangeFavColumn()
        {
            //1 获取参数
            string ids = GF("ids");
            int targetId = ComUtls.ParseInt(GF("targetId"), 1);

            //2 检查参数
            if (!ComUtls.CheckIDsFormat(ids))
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "参数错误:ids");
                WriteXml(node, node2);
                return;
            }

            //3 更新数据库
            WhereClip nwhere = (tbMyfavorite._.ID.In(ids.Split(','))
                && tbMyfavorite._.UserID == OSession.Mem.ID);
            Field[] nfields = { 
                                tbMyfavorite._.ColumnID
                              };
            object[] nvals = { 
                             targetId
                             };

            int rowsAffected = DbSession.Default.Update<tbMyfavorite>(nfields, nvals, nwhere);

            //4 回应
            if (rowsAffected > 0)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "更新成功。");
                WriteXml(node, node2);
                return;
            }

        }

        /// <summary>
        /// 检查权限
        /// </summary>
        private static void CheckAuthority()
        {
            //1 获取参数
            string authorityIds = GF("authIDs");

            //2 检查会员是否具体所需权限
            bool authorized = BLL.Mem.CheckAuthority(authorityIds);

            //3 回应
            WriteString(authorized ? "1" : "0");
        }

        /// <summary>
        /// 会员反馈/意见
        /// </summary>
        private static void UserFeedback()
        {
            KeyValuePair<string, string> node1;
            KeyValuePair<string, string> node2;
            bool isLogin = BLL.Mem.CheckPassport();
            tbUser objUser = OSession.Mem.User;

            //1 获取参数
            string title = HttpUtility.HtmlEncode(GF("title").Trim());
            string shortDesc = HttpUtility.HtmlEncode(GF("shortDesc").Trim());

            //2 检查参数
            if (title.Length == 0 || shortDesc.Length == 0)
            {
                node1 = new KeyValuePair<string, string>("state", "0");
                node2 = new KeyValuePair<string, string>("msg", "内容或标题不可为空。");
                WriteXml(node1, node2);
                return;
            }

            //3 安全检查
            SecurityCheck(null, CheckingType.BlockToSubmitIPs, CheckingType.ForbiddenIP, CheckingType.GlobalSubmittingFrequency);

            //4 填充实体
            DateTime nowTime = DateTime.Now;
            tbFeedback nobj = new tbFeedback();
            nobj.Answer = string.Empty;
            nobj.AnswerTime = nowTime;
            nobj.ChnName = objUser.ChnName;
            nobj.Email = objUser.UserEmail;
            nobj.Enable = true;
            nobj.InputTime = nowTime;
            nobj.IP = IP;
            nobj.MPhone = objUser.MPhone;
            nobj.OrderID = 50;
            nobj.Phone = objUser.Phone;
            nobj.ShortDesc = shortDesc;
            //预留字段
            nobj.SubSite = string.Empty;
            nobj.Title = title;
            nobj.UserID = objUser.ID;
            nobj.Username = objUser.UserName;

            //5 保存数据库
            int rowsAffected = DbSession.Default.Save<tbFeedback>(nobj);

            //6 回应，设置最后提交时间
            if (rowsAffected > 0)
            {
                OSession.Common.LastPost = nowTime;

                node1 = new KeyValuePair<string, string>("state", "1");
                node2 = new KeyValuePair<string, string>("msg", "非常感谢您在百忙中给我们提出意见和建议，有您的支持，是我们成长的动力，感谢您对我们网站的支持！。");
                WriteXml(node1, node2);
            }
            else
            {
                node1 = new KeyValuePair<string, string>("state", "0");
                node2 = new KeyValuePair<string, string>("msg", "对不起，提交失败，请稍候重试。");
                WriteXml(node1, node2);
            }
        }

        /// <summary>
        /// 邮件订阅
        /// </summary>
        private static void Subscription()
        {
            KeyValuePair<string, string> node1;
            KeyValuePair<string, string> node2;

            //1 获取参数  
            string email = GF("email");

            //2 检查参数
            if (!ComUtls.CheckEmail(email))
            {
                node1 = new KeyValuePair<string, string>("state", "0");
                node2 = new KeyValuePair<string, string>("msg", "电子邮箱地址格式错误。");
                WriteXml(node1, node2);
                return;
            }

            //3 订阅
            OEnum.Common.MailSubscriptionResult result = BLL.Site.MailSubscription(email, OSession.Mem.Username, OSession.Mem.ID);

            switch (result)
            {
                case NSW.OEnum.Common.MailSubscriptionResult.Failed:
                    node1 = new KeyValuePair<string, string>("state", "0");
                    node2 = new KeyValuePair<string, string>("msg", string.Format("由于系统原因，您的电子邮件 {0} 订阅失败，请及时联系我们的管理员，感谢您的支持！", email));
                    break;

                case NSW.OEnum.Common.MailSubscriptionResult.Inactive:
                    node1 = new KeyValuePair<string, string>("state", "1");
                    node2 = new KeyValuePair<string, string>("msg", string.Format("恭喜您，您的电子邮件已经递交成功，为了确保您能够准确收到我们的电"
                    + "子杂志，我们网站已经发送了一封确认邮件到您的邮箱 {0}，请您及时查收,感谢您的支持！", email));
                    break;

                case NSW.OEnum.Common.MailSubscriptionResult.MailExists:
                    node1 = new KeyValuePair<string, string>("state", "1");
                    node2 = new KeyValuePair<string, string>("msg", string.Format("恭喜您，您的电子邮件已经递交成功，为了确保您能够准确收到我们的电"
                    + "子杂志，我们网站已经发送了一封确认邮件到您的邮箱 {0}，请您及时查收,感谢您的支持！", email));
                    break;

                case NSW.OEnum.Common.MailSubscriptionResult.Subscripted:
                    node1 = new KeyValuePair<string, string>("state", "0");
                    node2 = new KeyValuePair<string, string>("msg", string.Format("您的电子邮件 {0} 以前已经递交过了订阅申请，请您不要重复递交，感谢您的支持！", email));
                    break;



                default:
                    node1 = new KeyValuePair<string, string>("state", "1");
                    node2 = new KeyValuePair<string, string>("msg", string.Format("恭喜您，您的电子邮件已经递交成功，为了确保您能够准确收到我们的电"
                    + "子杂志，我们网站已经发送了一封确认邮件到您的邮箱 {0}，请您及时查收,感谢您的支持！", email));
                    break;
            } // end switch

            //4 回应
            WriteXml(node1, node2);
        }

        /// <summary>
        /// 删除浏览历史
        /// </summary>
        private static void CleanHistory()
        {
            string mark = GF("mark");

            switch (mark.ToLower())
            {
                case "news":
                    ComUtls.RemoveCookie(OHistory.COOKIE_KEY_PRODUCT);
                    break;

                case "project":
                    OHistory.Project.Clear();
                    break;


                case "download":
                    OHistory.Download.Clear();
                    break;
                 
                default:
                    OHistory.Product.Clear();
                    break;
            }

        }

        /// <summary>
        /// 获取最新发布的文章 
        /// </summary>
        private static void GetLastArticle()
        {
            string rsp;

            //1 获取参数

            //2 从数据库读取数据
            WhereClip nwhere = (VW_News._.Enable == true
                && VW_News._.ShowTime < DateTime.Now);
            OrderByClip norder = (VW_News._.ShowTime.Desc);
            Field[] nfield = new Field[] { 
                VW_News._.ID,
                VW_News._.PageURL,
                VW_News._.Title,
                VW_News._.ShowTime
            };
            DataTable dt = DbSession.Default.From<VW_News>().Where(nwhere).OrderBy(norder).Select(nfield).ToDataTable(10);

            //3 生成内容
            string template = "<$Foreach$><li><a href='" + SiteDomain + "{$PageUrl$}' target='_blank' title=\"{$Title$}\">{$Title$}</a></li><$EndForeach$>";
            rsp = BLL.Template.ProcessTemplate(template, dt);

            //4 回应
            WriteString(rsp);
        }


        /// <summary>
        /// 获取相关文章 
        /// </summary>
        private static void GetSimilarArticle()
        {
            string rsp;

            //1 获取参数
            string sid = GF("sid");

            //2 从数据库读取数据
            WhereClip nwhere = (VW_News._.sid == sid
                && VW_News._.Enable == true
                && VW_News._.ShowTime < DateTime.Now);
            OrderByClip norder = (VW_News._.ShowTime.Desc);
            Field[] nfield = new Field[] { 
                VW_News._.ID,
                VW_News._.PageURL,
                VW_News._.Title,
                VW_News._.ShowTime
            };
            DataTable dt = DbSession.Default.From<VW_News>().Where(nwhere).OrderBy(norder).Select(nfield).ToDataTable(10);

            //3 生成内容
            string template = "<$Foreach$><li><a href='" + SiteDomain + "{$PageUrl$}' target='_blank' title=\"{$Title$}\">{$Title$}</a></li><$EndForeach$>";
            rsp = BLL.Template.ProcessTemplate(template, dt);

            //4 回应
            WriteString(rsp);
        }

        /// <summary>
        /// 获取对象点击率
        /// </summary>
        private static void GetHits()
        {
            string tabName;
            int hits = -1;
            //1 获取参数
            string mark = GF("mark");
            int oid = ComUtls.ParseInt(GF("oid"), -1);

            //2 获取表名
            switch (mark.ToLower())
            {
                case "help": tabName = ORes.OTableName.tbHelp; break;
                case "news": tabName = ORes.OTableName.tbNews; break;
                case "project": tabName = ORes.OTableName.tbProject; break;
                case "download": tabName = ORes.OTableName.tbDownload; break;
                #region ********************* 代理加盟 **************************
                case "agent": tabName = ORes.OTableName.tbAgent; break;
                #endregion
                default: tabName = ORes.OTableName.tbProduct; break;
            } // end switch

            //3 从数据库读取点击率
            string cmdText = string.Format("SELECT [Hits] FROM {0} WHERE [ID]={1}", tabName, oid);
            object o = DbSession.Default.FromSql(cmdText).ToScalar();
            if (o != null)
            {
                hits = (int)o;
            }

            //4 回应
            WriteString(hits.ToString());
        }


        /// <summary>
        /// 根据浏览历史推荐方案服务
        /// </summary>
        public static void GetRecommentProjectByHistory()
        {
            System.Collections.Specialized.HybridDictionary hd = new System.Collections.Specialized.HybridDictionary();
            hd.Add("Sql", "select top 6 columnid,sid,title,photopath,pageurl from vw_project order by newid()");

            string values = NVEngine.Directive.UserControlDirective.LoadUserControl("/UserControls/Project/Commend.ascx", hd, false);
            WriteString(values);
        }

        /// <summary>
        /// 获取浏览历史
        /// </summary>
        private static void GetHistory()
        {
            //1 获取参数
            string mark = GF("mark");

            WhereClip nwhere;
            //  OrderByClip norder;
            Field[] nfields;
            string[] arrID;
            string template;
            string rsp;
            DataTable dt;

            //2 进行不同的对象处理
            switch (mark.ToLower())
            {
                case "news":
                    //获取浏览历史ID
                    arrID = OHistory.GetIDArray(mark);
                    //从数据库读取
                    nwhere = (VW_News._.ID.In(OHistory.GetIDArray(mark)));
                    nfields = new BlueCrystal.Data.Field[] { 
                            VW_News._.ID,
                            VW_News._.PageURL,
                            VW_News._.Title
                        };
                    dt = DbSession.Default.From<VW_News>().Where(nwhere).Select(nfields).ToDataTable(10);

                    template = "<$Foreach$><li><a href='" + SiteDomain + "{$PageUrl$}' target='_blank' title=\"{$Title$}\">{$Title$}</a></li><$EndForeach$>";
                    rsp = BLL.Template.ProcessTemplate(template, dt);

                    break;

                case "project":
                    nfields = new BlueCrystal.Data.Field[] { 
                            VW_ProjectViewedHistory._.ID,
                            VW_ProjectViewedHistory._.PageTitle,
                            VW_ProjectViewedHistory._.PageURL,
                            VW_ProjectViewedHistory._.PhotoPath,
                            VW_ProjectViewedHistory._.Title
                        };
                    dt = OHistory.Project.GetHistory(nfields);

                    template = "<div id='divHistory'><h4 class='t05'><a href='javascript:void(0)' onclick=\"cleanHistory('project','" + OHistory.COOKIE_KEY_PROJECT + "')\" class='clr'>清除</a>最近浏览过的方案</h4>"
                            + "<div class='t05_con' id='divHistoryItems'>"
                                + "<$Foreach$><dl class='t05_con_dl'>"
                                    + "<dt><a href='{$PageUrl$}' target='_blank' title=\"{$Title$}\"><img src='{$PhotoPath$}' alt='{$Title$}'  title=\"{$Title$}\"/></a></dt>"
                                    + "<dd><a href='{$PageUrl$}' target='_blank'  title=\"{$Title$}\">{$Title$}</a></dd>"
                                + "</dl><$EndForeach$>"
                                + "<div class='clear'></div>"
                            + "</div></div>";

                    // 回应
                    rsp = BLL.Template.ProcessTemplate(template, dt);
                    break;


                //下载中心
                case "download":
                    nfields = new BlueCrystal.Data.Field[] { 
                            VW_DownloadViewedHistory._.ID,
                            VW_DownloadViewedHistory._.PageTitle,
                            VW_DownloadViewedHistory._.PageURL,
                            VW_DownloadViewedHistory._.PhotoPath,
                            VW_DownloadViewedHistory._.Title
                        };
                    dt = OHistory.Download.GetHistory(nfields);

                    template = "<$Foreach$><dl>"
                                    + "<dt><a href='" + SiteDomain + "{$PageUrl$}' target='_blank' title=\"{$Title$}\"><img src='"+SiteDomain+"{$PhotoPath$}' alt='{$Title$}'  title=\"{$Title$}\"/></a></dt>"
                                    + "<dd><a href='" + SiteDomain + "{$PageUrl$}' target='_blank' title=\"{$Title$}\" >{$Title$}</a></dd>"
                                + "</dl><$EndForeach$>";
           

                    // 回应
                    rsp = BLL.Template.ProcessTemplate(template, dt);
                    break;


                default:
                    try
                    {
                        nfields = new BlueCrystal.Data.Field[] { 
                            VW_ProductViewedHistory._.ID,
                            VW_ProductViewedHistory._.PageTitle,
                            VW_ProductViewedHistory._.PageURL,
                            VW_ProductViewedHistory._.UserPrice,
                            VW_ProductViewedHistory._.PhotoPath,
                            VW_ProductViewedHistory._.Title
                        };
                        dt = OHistory.Product.GetHistory(nfields);

                        rsp = "";
                        string title = "";
                        int count = 0;
                        if (dt.Rows.Count > 3)
                        {
                            count = 3;
                        }
                        else
                        {
                            count = dt.Rows.Count;
                        }
                        rsp += "<div class=\"divHistory\"><div class='tit'><a >浏览记录</a></div><div class=\"t05_con\"  id='divHistoryItems'>";
                        for (int i = 0; i < count; i++)
                        {
                            rsp += "<dl class=\"pd_t05_con_dl\">" +
                                   "<dt><a href='" + NSW.OConfig.Common.SiteDomain + dt.Rows[i]["pageurl"].ToString() + "' title=\"" + dt.Rows[i]["title"].ToString() + "\" ><img src='" + NSW.OConfig.Common.SiteDomain + dt.Rows[i]["photopath"].ToString() + "' alt='" + dt.Rows[i]["pageurl"].ToString() + "'  title=\"" + dt.Rows[i]["title"].ToString() + "\" /></a></dt>" +
                                   "<dd><a href='" + NSW.OConfig.Common.SiteDomain + dt.Rows[i]["pageurl"].ToString() + "' title=\"" + dt.Rows[i]["title"].ToString() + "\"  >" + dt.Rows[i]["title"].ToString() + "</a></dd>" +
                                   "</dl>";
                        }
                        rsp += "</div><div class=\"clear\"></div></div>";
                    }
                    catch { rsp = ""; }
                    break;
            }

            
            //    // 产品
            //    default:
            //        ////获取浏览历史ID
            //        //arrID = OHistory.GetIDArray("product");
            //        ////从数据库读取
            //        //nwhere = (VW_ProductViewedHistory._.ID.In(OHistory.GetIDArray("product")));
            //        nfields = new BlueCrystal.Data.Field[] { 
            //                VW_ProductViewedHistory._.ID,
            //                VW_ProductViewedHistory._.PageTitle,
            //                VW_ProductViewedHistory._.PageURL,
            //                VW_ProductViewedHistory._.UserPrice,
            //                VW_ProductViewedHistory._.PhotoPath,
            //                VW_ProductViewedHistory._.Title
            //            };
            //        dt = OHistory.Product.GetHistory(nfields);

            //        template = "<div id='divHistory'><h4 class='t05'><a href='javascript:void(0)' onclick=\"cleanHistory('product','" + OHistory.COOKIE_KEY_PRODUCT + "')\" class='clr'>清除</a>最近浏览过的产品</h4>"
            //                + "<div class='t05_con' id='divHistoryItems'>"
            //                    + "<$Foreach$><dl class='t05_con_dl'>"
            //                        + "<dt><a href='{$PageUrl$}' target='_blank'><img src='{$PhotoPath$}' alt='{$Title$}' /></a></dt>"
            //                        + "<dd><a href='{$PageUrl$}' target='_blank' >{$Title$}</a></dd>"
            //                    + "</dl><$EndForeach$>"
            //                    + "<div class='clear'></div>"
            //                + "</div></div>";

            //        // 回应
            //        rsp = BLL.Template.ProcessTemplate(template, dt);

            //        break;
            //}

            WriteString(rsp);
        }

        /// <summary>
        /// 获取收货评语
        /// </summary>
        private static void GetEndingRemark()
        {
            string rtnVal;
            string rename = "EndingRemark_2";
            DataTable dt = BLL.Order.GetEndingRemark(10);
            dt.Columns.Add(new DataColumn(rename, typeof(string)));

            //订单状态
            foreach (DataRow row in dt.Rows)
            {
                string remark = row[tbOrder._.EndingRemark.Name].ToString();
                row[rename] = StringUtls.Ellipsis(remark, 23);
            }

            string template = "<h4 class='t05'><img src=\"{$SkinPath$}Img/ico15.gif\" alt=\"收缩\" class=\"p\" onclick=\"contractExtend(this,'{$SkinPath$}')\" title=\"单击收缩\" />客户反馈</h4>"
                            + "<div class='t05_con'>"
                            + "<ul class='t05_ul' id='ulOrderRemark'>"
                                + "<$Foreach$><li title='{$EndingRemark$}'>{$EndingRemark_2$}<$EndForeach$>"
                            + "</ul>"
                        + "</div>"
                        + "<script type='text/javascript'>"
                            + "new Marquee('ulOrderRemark', 0, 1, 175, 84, 20, 1000, 1000, 22);"
                        + "</script>";
            template = template.Replace("{$SkinPath$}", OConfig.Common.Skin);
            rtnVal = BLL.Template.ProcessTemplate(template, dt);
            WriteString(rtnVal);
        }

        /// <summary>
        /// 获取订单公告
        /// </summary>
        private static void GetOrderAnnouncement()
        {
            string rtnVal;
            DataTable dt = BLL.Order.GetOrderAnnouncement(10);
            string template = "<h4 class='t05'><img src=\"{$SkinPath$}Img/ico15.gif\" alt=\"收缩\" class=\"p\" onclick=\"contractExtend(this,'{$SkinPath$}')\" title=\"单击收缩\" />订单公告</h4>"
                            + "<div class='t05_con'>"
                            + "<ul class='t05_ul' id='ulOrderAnns'>"
                                + "<$Foreach$><li style='margin-left:-5px;'>订单 <span>{$OrderNo$}</span> {$OrderState_2$}</li><$EndForeach$>"
                            + "</ul>"
                        + "</div>"
                        + "<script type='text/javascript'>"
                            + "new Marquee('ulOrderAnns', 0, 1, 195, 84, 20, 1000, 1000, 22);"
                        + "</script>";
            template = template.Replace("{$SkinPath$}", OConfig.Common.Skin);
            rtnVal = BLL.Template.ProcessTemplate(template, dt);
            WriteString(rtnVal);
        }

        /// <summary>
        /// 获取视频代码
        /// </summary>
        private static void GetVideo()
        {
            //1 获取视频关键词
            string videoKey = GF("videoKey");

            //4 回应
            WriteString(BLL.Site.GetVideoCodeByKeyName(videoKey));
        }

        /// <summary>
        /// 获取广告代码
        /// </summary>
        private static void GetAd()
        {
            StringBuilder rsp = new StringBuilder();

            //1 获取参数
            string keyName = GF("keyname");

            //2 查询数据库
            WhereClip nwhere = (VW_Ad._.KeyName == keyName
                            && VW_Ad._.isShow == true);
            VW_Ad nobj = DbSession.Default.Get<VW_Ad>(nwhere);

            if (nobj == null)
            {
                WriteString(string.Empty);
                return;
            }

            //3 广告类型
            switch (nobj.Photo)
            {
                //3.1 图片
                case 1:
                    if (nobj.URL.Length > 0)
                    {
                        rsp.AppendFormat("<a href='{0}'>", nobj.URL);
                    }

                    rsp.AppendFormat("<img src='{0}'", nobj.PhotoPath);

                    if (nobj.Width > 0 || nobj.Height > 0)
                    {
                        rsp.Append(" style='");

                        if (nobj.Height > 0)
                        {
                            rsp.AppendFormat("height:{0}px;", nobj.Height);
                        }

                        if (nobj.Width > 0)
                        {
                            rsp.AppendFormat("width:{0}px;", nobj.Width);
                        }

                        rsp.Append("'");
                    }

                    rsp.Append(" />");

                    if (nobj.URL.Length > 0)
                    {
                        rsp.Append("</a>");
                    }

                    break;

                //3.2 FLASH 
                case 2:
                    if (nobj.URL.Length > 0)
                    {
                        rsp.AppendFormat("<a href='{0}'>", nobj.URL);
                    }

                    rsp.Append("<object");

                    if (nobj.Width > 0 || nobj.Height > 0)
                    {
                        if (nobj.Height > 0)
                        {
                            rsp.AppendFormat(" height='{0}'", nobj.Height);
                        }

                        if (nobj.Width > 0)
                        {
                            rsp.AppendFormat(" width='{0}'", nobj.Width);
                        }
                    }

                    rsp.AppendFormat("><param name='movie' value='{0}'></param><param name='allowFullScreen' value='true'></param>"
                        + "<param name='allowscriptaccess' value='always'></param>"
                        + "<embed src='{0}' type='application/x-shockwave-flash' allowscriptaccess='always' allowfullscreen='true'");

                    if (nobj.Width > 0 || nobj.Height > 0)
                    {
                        if (nobj.Height > 0)
                        {
                            rsp.AppendFormat(" height='{0}'", nobj.Height);
                        }

                        if (nobj.Width > 0)
                        {
                            rsp.AppendFormat(" width='{0}'", nobj.Width);
                        }
                    }

                    rsp.Append("></embed></object>");

                    if (nobj.URL.Length > 0)
                    {
                        rsp.Append("</a>");
                    }

                    break;

                //3.3 代码  
                default:
                    rsp.Append(nobj.JS);
                    break;
            }

            //4 回应
            WriteString(rsp.ToString());
        }

        /// <summary>
        /// 添加浏览历史
        /// </summary>
        private static void AddHistory()
        {
            //1 获取参数
            string mark = QS("mark");
            int oid = ComUtls.ParseInt(QS("oid"), -1);
            string objType;

            //2 检查参数
            if (oid < 1)
            {
                return;
            }

            switch (mark.ToLower())
            {
                case "news": objType = "news"; break;

                case "project":
                    objType = "project";
                    OHistory.Project.Add(oid);
                    break;

                case "download":
                    objType = "download";
                    OHistory.Download.Add(oid);
                    break;

                //产品浏览历史
                default:
                    OHistory.Product.Add(oid);
                    return;
            }

            //添加到历史对象
            OHistory.Add(oid, objType);
        }


        /// <summary>
        /// 获取评论
        /// </summary>
        private static void GetComment()
        {
            string mark = GF("mark");
            string subjectId = GF("oid");
            string columnId;
            StringBuilder sbRsp = new StringBuilder();
            sbRsp.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");

            switch (mark.ToLower())
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

            string sqlWhere = string.Format("[ColumnID]={0} AND [SubjectID]={1} AND [Enable]=1", columnId, subjectId);
            string sqlOrder = "[InputTime] DESC, [OrderID] ASC";
            string tabName = ORes.OTableName.tbComment;
            int pageSize = 5;
            int pageIndex = 1;
            int recordTotal = -1;
            string pk = "[ID]";
            string fields = ComUtls.GetFields(false,
                tbComment._.ID,
                tbComment._.Content,
                tbComment._.InputTime,
                tbComment._.Integral,
                tbComment._.LastIP,
                tbComment._.UserName,
                tbComment._.FeedBack,
                tbComment._.Title);
            DataTable dt = MQuery.GetBatch(tabName, pk, fields, sqlOrder, sqlWhere, pageSize, pageIndex, ref recordTotal);

            sbRsp.Append("<comments>");
            sbRsp.AppendFormat("<count>{0}</count>", recordTotal);

            foreach (DataRow row in dt.Rows)
            {
                string content = row[tbComment._.Content.Name].ToString();
                string inputTime = ComUtls.FormatDateTime((DateTime)row[tbComment._.InputTime.Name]);
                string integral = row[tbComment._.Integral.Name].ToString();
                string ip = ComUtls.CutIp(row[tbComment._.LastIP.Name].ToString(), 2);
                string username = row[tbComment._.UserName.Name].ToString();
                string title = row[tbComment._.Title.Name].ToString();
                string feedback = row[tbComment._.FeedBack.Name].ToString() == "" ? "暂无回复" : row[tbComment._.FeedBack.Name].ToString();

                sbRsp.AppendFormat("<comment>");
                sbRsp.AppendFormat("<content>{0}</content>", content);
                sbRsp.AppendFormat("<inputTime>{0}</inputTime>", inputTime);
                sbRsp.AppendFormat("<integral>{0}</integral>", integral);
                sbRsp.AppendFormat("<ip>{0}</ip>", ip);
                sbRsp.AppendFormat("<username>{0}</username>", username);
                sbRsp.AppendFormat("<title>{0}</title>", title);
                sbRsp.AppendFormat("<feedback>{0}</feedback>", feedback);
                sbRsp.AppendFormat("</comment>");
            }
            sbRsp.Append("</comments>");

            WriteXml(sbRsp.ToString());
        }

        /// <summary>
        /// 删除收藏
        /// </summary>
        private static void DelFav()
        {
            if (!BLL.Mem.CheckPassport())
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "您尚未注册会员，不可使用产品收藏夹功能。<br />请<a href='/user/login.aspx' target='_blank' class='u'>登录</a>或<a target='_blank' href='register.aspx' class='u'>注册</a>。");
                WriteXml(node, node2);
                return;
            }

            //1 获取参数
            string ids = GF("ids");
            string[] s_id = ids.Split(',');

            //3 查询数据库
            int rowsAffected = 0;
            for (int i = 1; i < s_id.Length; i++)
            {

                WhereClip nwhere = (tbMyfavorite._.ID == s_id[i] && tbMyfavorite._.UserID == OSession.Mem.ID);
                rowsAffected = DbSession.Default.Delete<tbMyfavorite>(nwhere);
            }
            //4 回应
            if (rowsAffected > 0)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", string.Format("删除收藏成功，共 {0} 条记录被删除。", rowsAffected));
                WriteXml(node, node2);
                return;
            }
            else
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "删除收藏失败，请稍候重试。");
                WriteXml(node, node2);
                return;
            }
        }


        /// <summary>
        /// 删除下载中心记录
        /// </summary>
        private static void DelMyDownloads()
        {
            if (!BLL.Mem.CheckPassport())
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "您尚未注册会员，不可使用产品愿望夹功能。<br />请<a href='/user/login.aspx' target='_blank' class='u'>登录</a>或<a target='_blank' href='register.aspx' class='u'>注册</a>。");
                WriteXml(node, node2);
                return;
            }

            //1 获取参数
            string ids = GF("ids");

            //2 检查参数
            if (!ComUtls.CheckIDsFormat(ids))
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "参数错误:ids");
                WriteXml(node, node2);
                return;
            }

            //3 查询数据库
            WhereClip nwhere = (tbDownloadLog._.ID.In(ids.Split(','))
                && tbDownloadLog._.UserID == OSession.Mem.ID);
            int rowsAffected = DbSession.Default.Delete<tbDownloadLog>(nwhere);

            //4 回应
            if (rowsAffected > 0)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", string.Format("删除下载记录成功，共 {0} 条记录被删除。", rowsAffected));
                WriteXml(node, node2);
                return;
            }
            else
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "删除下载记录失败，请稍候重试。");
                WriteXml(node, node2);
                return;
            }
        }
        

        /// <summary>
        /// 删除愿望夹
        /// </summary>
        private static void DelMyWishs()
        {
            if (!BLL.Mem.CheckPassport())
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "您尚未注册会员，不可使用产品愿望夹功能。<br />请<a href='/user/login.aspx' target='_blank' class='u'>登录</a>或<a target='_blank' href='register.aspx' class='u'>注册</a>。");
                WriteXml(node, node2);
                return;
            }

            //1 获取参数
            string ids = GF("ids");

            //2 检查参数
            if (!ComUtls.CheckIDsFormat(ids))
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "参数错误:ids");
                WriteXml(node, node2);
                return;
            }

            //3 查询数据库
            WhereClip nwhere = (tbMyWish._.ID.In(ids.Split(','))
                && tbMyWish._.UserID == OSession.Mem.ID);
            int rowsAffected = DbSession.Default.Delete<tbMyWish>(nwhere);

            //4 回应
            if (rowsAffected > 0)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", string.Format("删除收藏成功，共 {0} 条记录被删除。", rowsAffected));
                WriteXml(node, node2);
                return;
            }
            else
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "删除收藏失败，请稍候重试。");
                WriteXml(node, node2);
                return;
            }
        }
        

        /// <summary>
        /// 添加收藏
        /// </summary>
        private static void AddFav()
        {
            if (!BLL.Mem.CheckPassport())
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "您尚未注册会员，不可使用收藏夹功能。<br />请<a href='/user/login.aspx' target='_blank' class='u'>登录</a>或<a target='_blank' href='/user/register.aspx' class='u'>注册</a>。");
                WriteXml(node, node2);
                return;
            }

            string url = HttpUtility.HtmlEncode(GF("url")).ToLower();
            string title = HttpUtility.HtmlEncode(GF("ptitle"));
            int columnId = ComUtls.ParseInt(GF("column_id"), 1);

            int uid = OSession.Mem.ID;
            int favCapability = OConfig.GlobalConfig.FavoriteCapacity;
            WhereClip whereClip = (tbMyfavorite._.UserID == OSession.Mem.ID);
            if (DbSession.Default.Count<tbMyfavorite>(whereClip) >= favCapability)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg",
                    string.Format("您的收藏夹（{0}）已满，不可继续增加，请删除现有收藏项目再添加新收藏项目。"
                    + "<br /><a href='/user/MyFavorites.aspx' class='u'><img src='{1}img/fav_2.gif' alt='收藏' /> 查看收藏夹</a>",
                    favCapability, OConfig.Common.Skin));
                WriteXml(node, node2);
                return;
            }

            whereClip = (tbMyfavorite._.UserID == uid
                && tbMyfavorite._.URL == url);
            if (DbSession.Default.Exists<tbMyfavorite>(whereClip))
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg",
                    string.Format("该收藏已在您的收藏夹中存在。<br />"
                    + "<a href='/user/MyFavorites.aspx' class='u'><img src='{0}img/fav_2.gif' alt='收藏' /> 查看收藏夹</a>", OConfig.Common.Skin));
                WriteXml(node, node2);
                return;
            }

            tbMyfavorite OBJ = new tbMyfavorite();
            OBJ.ColumnID = columnId;
            OBJ.Enable = true;
            OBJ.InputTime = DateTime.Now;
            OBJ.PhotoPath = string.Empty;
            OBJ.Title = title;
            OBJ.UserID = uid;
            OBJ.URL = url;
            if (DbSession.Default.Save<tbMyfavorite>(OBJ) > 0)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg",
                    string.Format("收藏成功。"
                    + "<br /><a href='/user/MyFavorites.aspx' class='u'><img src='{0}img/fav_2.gif' alt='收藏' /> 查看收藏夹</a>",
                    OConfig.Common.Skin));
                WriteXml(node, node2);
                return;
            }
            else
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "收藏失败，请稍候再试。");
                WriteXml(node, node2);
            }
        }


        /// <summary>
        /// 删除收藏夹分类
        /// </summary>
        private static void DelFavColumn()
        {
            int oid = ComUtls.ParseInt(GF("oid"), -1);
            KeyValuePair<string, string> node;

            //1 检查ID
            if (oid < 1)
            {
                node = new KeyValuePair<string, string>("state", "0");
                WriteXml(node);
                return;
            }

            //2 删除
            WhereClip nwhere = (tbMyFavoritesColumn._.ID == oid
                && tbMyFavoritesColumn._.UserName == OSession.Mem.Username);
            int rowsAffected = DbSession.Default.Delete<tbMyFavoritesColumn>(nwhere);

            //更新用户缓存
            OCache.UserCache.FavoriteColumns = null;

            //3 回应 
            node = new KeyValuePair<string, string>("state", rowsAffected > 0 ? "1" : "0");
            WriteXml(node);
        }

        /// <summary>
        /// 取消订单
        /// </summary>
        private static void CancelOrder()
        {
            string orderNo = GF("no");
            WhereClip nwhere = (tbOrder._.OrderNo == orderNo
                && tbOrder._.UserName == OSession.Mem.Username
                && tbOrder._.isLock == false
                && tbOrder._.OrderState == (int)OEnum.OrderState.待审核1);
            Field[] nfields = new Field[] { 
                tbOrder._.OrderState
            };
            object[] nvals = new object[] { 
                 (int)OEnum.OrderState.已取消6
            };
            int rowsAffected = DbSession.Default.Update<tbOrder>(nfields, nvals, nwhere);

            if (rowsAffected > 0)
            {
                KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("state", "1");
                WriteXml(node1);
            }
            else
            {
                KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("state", "0");
                WriteXml(node1);
            }
        }

        /// <summary>
        /// 初始化通用头部信息
        /// </summary>
        private static void InitCommonHeader()
        {
            string username = BLL.Mem.GetUsername();
            int cartGoodsCount = NSW.Cart.ProductCount;
            bool ShowIM = NSW.OConfig.GlobalConfig.ShowIM;//是否显示在线客服
            KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("username", username);
            KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("prod_count", cartGoodsCount.ToString());
            KeyValuePair<string, string> node3 = new KeyValuePair<string, string>("showIM", ShowIM.ToString());
            WriteXml(node1, node2, node3);
        }

        /// <summary>
        /// 获取头部热门关键词
        /// </summary>
        /// <returns></returns>
        private static string GetHeaderKeywords()
        {
            StringBuilder sbRtnVal = new StringBuilder();
            DataTable dt = OCache.HeaderKeywords;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i != 0)
                {
                    sbRtnVal.Append("||");
                }

                string word = dt.Rows[i][tbKeyword._.Title.Name].ToString();
                string url = dt.Rows[i][tbKeyword._.URL.Name].ToString();
                sbRtnVal.AppendFormat("{0}$${1}", word, url);
            }

            return sbRtnVal.ToString();
        }

        #region *** 会员注册 ***

        /// <summary>
        /// 检查用户名是否已注册
        /// 回应：string
        ///     * 1 - 成功
        ///     * 0 - 失败
        /// </summary>
        private static void CheckUsername()
        {
            string s = GF("username").Trim();
            if (s.Length == 0)
            {
                WriteString("0");
            }

            //if (Regex.Match(s, @"/[^\u4E00-\u9FA5]/g").Success)
            //{
            //    WriteString("2");
            ////    //WriteString("用户名格式错误。中文用户名必须为 2 到 16位。");
            //    return;
            //}
            //else
            //{
            //    WriteString("3");
            //////    //WriteString("用户名格式错误。中文用户名必须为 2 到 16位。");
            //    return;
            //}
            if (DbSession.Default.Exists<tbUser>(tbUser._.UserName == s))
            {
                WriteString("1");
            }
            else
            {
                WriteString("0");
            }
        }


        /// <summary>
        /// 检查电子邮箱地址是否已注册
        /// 回应：string
        ///     * 1 - 成功
        ///     * 0 - 失败
        /// </summary>
        private static void CheckEmail()
        {
            string email = GF("email").Trim();

            if (email.Length == 0)
            {
                WriteString("0");
            }

            if (!ComUtls.CheckEmail(email)) {
                WriteString("0");
            }

            if (DbSession.Default.Exists<tbUser>(tbUser._.UserEmail == email))
            {
                WriteString("1");
            }
            else
            {
                WriteString("0");
            }
        }

        private static string APIRegister(string UserName, string email, string question, string answer, string password,
            string chnName, string province, string city, string birthday, string mphone, string address, string qq, string msn, string sex)
        {
            //系统整合API,同步论坛和博客会员等其他站点[不管对方数据库放在那里，不管对方站点的域名是什么]
            //李剑飞负责编写       
            NSW.Web.API.SyncUser syncUser = new NSW.Web.API.SyncUser();
            string CAPI_Key = "";
            //1>检查系统是否开启API整合，如果已经开启，则进行全站一点用户信息修改
            if (!syncUser.API_Enable)
            {
                return "-1";
            }

            //2>设置整合需要录入的参数，主要是修改XML文件[令牌]
            syncUser.prepareXML(true);
            CAPI_Key = NSW.Web.API.SyncUser.ShortMD5(UserName + syncUser.API_Key);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conAction).ToString(), "reguser");
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conUsername).ToString(), UserName);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conEmail).ToString(), email);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conQuestion).ToString(), question.Length > 0 ? question : "br");
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conAnswer).ToString(), answer.Length > 0 ? answer : StringUtls.Random(5, StringUtls.RandomStringMode.Letter));
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conPassword).ToString(), password);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conTruename).ToString(), chnName);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conProvince).ToString(), province);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conCity).ToString(), city);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conBirthday).ToString(), birthday);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conTelephone).ToString(), mphone);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conAddress).ToString(), address);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conQQ).ToString(), qq);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conMsn).ToString(), msn);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conGender).ToString(), sex);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conSex).ToString(), sex);
            syncUser.setNodeText(syncUser.sPE_Items.GetKey(syncUser.conSyskey).ToString(), CAPI_Key);

            //3>发送XML同步注册令牌,命令所有syncUser.API_Urls里面包含的子站点进行同步注册                
            syncUser.SendPost();

            //4>如果出现用户信息修改错误,则返回错误信息,保证全站用户信息注册成功,只有syncUser.API_Urls里面包含的子站点全部用户信息注册成功，才算是用户信息注册成功
            if (syncUser.FindError)
            {
                string s = string.Empty;

                for (int i = 0; i < syncUser.errorInfor.Count; i++)
                {
                    s += syncUser.errorInfor[i].ToString();
                }


                s = Gb2312ToUtf8(s);

                //  WriteState(1, s);

                return s;
            }

            return "1";

            //-----------------------------------------------------------------

        }

        private static string Gb2312ToUtf8(string str)
        {
            byte[] getBt = Encoding.GetEncoding("GB2312").GetBytes(str);
            getBt = System.Text.Encoding.Convert(Encoding.GetEncoding("GB2312"), Encoding.UTF8, getBt);
            return Encoding.GetEncoding("utf-8").GetString(getBt);
        }

        /// <summary>
        /// 会员注册
        /// </summary>
        private static void Register()
        {
            if (ComUtls.IsForbiddenIP(OConfig.GlobalConfig.BlockToSubmitIPs, IP))
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", ORes.Error.TheIpIsForbidToSubmitData);
                WriteXml(node, node2);
                return;
            }

            if (!BLL.OSecurity.CheckInterval(OSession.Common.LastPost, OConfig.GlobalConfig.GlobalSubmitDataInterval))
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", ORes.Error.ToAvoidMaliceSubmittingPlsWaitAndResubmit);
                WriteXml(node, node2);
                return;
            }

            string username = GF("_username");
            string pin = GF("_pin");
            string email = GF("_email");
            string verCode = GF("_verCode");

            string usergroupid = GF("usergroupid");

            DateTime now = DateTime.Now;
            string secQus = GF("_secQus");
            string secAsr = GF("_secAsr");
            string realName = HttpUtility.HtmlEncode(GF("_realName"));
            int sex = ComUtls.ParseInt(GF("_sex"), -1);
            string birth = ComUtls.ParseDateTime(GF("_birth"), now).ToString("yyyy-MM-dd");

            int edu = ComUtls.ParseInt(GF("_edu"), -1);
            string compName = HttpUtility.HtmlEncode(GF("_compName"));
            int industry = ComUtls.ParseInt(GF("_industry"), -1);
            int position = ComUtls.ParseInt(GF("_position"), -1);

            string mobile = GF("_mobile");
            string tel = GF("_tel");
            string fax = GF("_fax");
            string province = HttpUtility.HtmlEncode(GF("_province"));
            string city = HttpUtility.HtmlEncode(GF("_city"));

            string zipCode = GF("_zipCode");
            string addr = HttpUtility.HtmlEncode(GF("_addr"));
            string hobby = HttpUtility.HtmlEncode(GF("_hobby"));

           

            string code = GF("_code");

            WhereClip whereClip = null;

            ////检查用户名
            //if (username.Length == 0)
            //{
            //    WriteString("用户名不可为空。");
            //    return;
            //}
            //if (!Regex.Match(username, @"^\w{6,20}$").Success)
            //{
            //    WriteString("用户名格式错误。");
            //    return;
            //}

            //whereClip = (tbUser._.UserName == username);
            //if (DbSession.Default.Exists<tbUser>(whereClip))
            //{
            //    KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
            //    KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", string.Format("对不起，用户名 {0} 已存在，请更换其它用户名。", username));
            //    WriteXml(node, node2);
            //    return;
            //}

            //检查电子邮箱地址
            if (email.Length == 0)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "E-Mail 不可为空。");
                WriteXml(node, node2);
                return;
            }

            if (!ComUtls.CheckEmail(email))
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "E-Mail 格式错误。");
                WriteXml(node, node2);
                return;
            }

            whereClip = (tbUser._.UserEmail == email);
            if (DbSession.Default.Exists<tbUser>(whereClip))
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", string.Format("对不起，邮箱地址 {0} 已存在，请更换其它邮箱地址。", email));
                WriteXml(node, node2);
                return;
            }

            //检查密码
            if (!Regex.Match(pin, @"^.{6,16}$").Success)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "密码格式错误，密码格式必须为 6 到 16 位任意英文字符。");
                WriteXml(node, node2);
                return;
            }

            //check mobile no., tel. no.
            if (mobile.Length > 0 && !Regex.Match(mobile, @"^\d{11,13}$").Success)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "手机号码格式错误，手机号码格式必须为 11 到 13 位纯数字。");
                WriteXml(node, node2);
                return;
            }
            if (tel.Length > 0 && !Regex.Match(tel, @"^\d{3,4}-\d{7,8}(-\d{1,5})?$").Success)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "电话号码格式错误，电话号码格式形如 0755-888888-123（分机号可选）。");
                WriteXml(node, node2);
                return;
            }
            if (fax.Length > 0 && !Regex.Match(fax, @"^\d{3,4}-\d{7,8}(-\d{1,5})?$").Success)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "传真号码格式错误，传真号码格式形如 0755-888888-123（分机号可选）。");
                WriteXml(node, node2);
                return;
            }

            if (!CheckVerifyCode(verCode))
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", ORes.Error.VerifyCodeIsInvalidPlsRefreshAndTryAgain);
                WriteXml(node, node2);
                return;
            }

            tbUser OBJ = new tbUser();
            OBJ.Active = true;
            OBJ.ActiveDate = now;
            OBJ.Address = addr;
            OBJ.Answer = (secQus.Length > 0 && secAsr.Length > 0) ? StringUtls.MD5(secAsr) : string.Empty;
            OBJ.ChnName = realName;
            OBJ.City = city;
            OBJ.CompName = compName;
            OBJ.Enable = !OConfig.GlobalConfig.NeedActiveMembership;
            OBJ.Fax = fax;
            //行业ID，后期修改
            OBJ.IndustryID = industry;
            //职位ID，后期修改
            OBJ.JobID = position;
            OBJ.InputTime = now;
            OBJ.LastIP = string.Empty;
            OBJ.LastLogin = now;
            OBJ.Lock = false;
            OBJ.MPhone = mobile;
            OBJ.OrderID = 50;
            OBJ.Phone = tel;
            OBJ.Province = province;
            OBJ.Question = (secQus.Length > 0 && secAsr.Length > 0) ? secQus : string.Empty;
            OBJ.shortDesc = string.Empty;
            OBJ.UserBirthday = birth;
            OBJ.UserEmail = email;
            OBJ.UserFace = string.Empty;
            OBJ.UserLogins = 0;
            OBJ.UserMsg = string.Empty;
            OBJ.UserName = username;
            OBJ.UserPassword = StringUtls.MD5(pin);
            OBJ.UserPower = 0;
            OBJ.UserSex = sex;
            OBJ.UserWealth = 0;
            OBJ.ZipCode = zipCode;
            OBJ.Hobby = hobby;
            OBJ.EduID = edu;

            OBJ.UserGroupID = Convert.ToInt32(usergroupid.ToString());
                

            //丰富内容
            OBJ.UserCP = 0;
            OBJ.UserEP = 0;
            OBJ.IMMsn = string.Empty;
            OBJ.IMQQ = string.Empty;
            OBJ.HomeName = string.Empty;
            OBJ.ESN = string.Empty;
            OBJ.EUN = string.Empty;
            OBJ.EKN = string.Empty;
            OBJ.DomainName = "";
            OBJ.CustomeFields = string.Empty;

            //积分
            OBJ.PointLoginIncreasingTime = DateTime.Now;
            OBJ.CumulativePoint = 0;

            //获取推荐人用户名
            tbInviteLog nobjInviteLog = null;
            if (code.Length > 0)
            {
                nobjInviteLog = BLL.Mem.InviteConfirm(code);

                if (nobjInviteLog != null
                    && !nobjInviteLog.isClose)
                {
                    OBJ.CUserName = nobjInviteLog.Username;
                }
            }
            else
            {
                OBJ.CUserName = string.Empty;
            }



            //同步注册
            string apiResult = APIRegister(username, email, secQus, secAsr, pin, OBJ.ChnName, OBJ.Province, OBJ.City, birth, OBJ.MPhone, OBJ.Address, OBJ.IMQQ, OBJ.IMMsn, OBJ.UserSex.ToString());

            //同步注册状态
            //1 成功
            //-1 未启用API同步注册
            //其它 有错误，则显示错误消息，注册中止
            if (apiResult != "1" && apiResult != "-1")
            {
                WriteState(0, apiResult);
                return;
            }

            //继续网站注册操作
            OEnum.RegisterResult result = BLL.Mem.Register(OBJ, pin, secAsr, nobjInviteLog);

            //操作结果
            switch (result)
            {
                case NSW.OEnum.RegisterResult.Failed:
                    {
                        KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                        KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "对不起，注册失败，请稍候重试。");
                        WriteXml(node, node2);
                    }
                    break;

                case NSW.OEnum.RegisterResult.NeedActivity:
                    {
                        //同步注册
                        APIRegister(username, email, secQus, secAsr, pin, OBJ.ChnName, OBJ.Province, OBJ.City, birth, OBJ.MPhone, OBJ.Address, OBJ.IMQQ, OBJ.IMMsn, OBJ.UserSex.ToString());

                        //记录最后提交数据的时间
                        OSession.Common.LastPost = DateTime.Now;

                        //获取账号数字ID
                        int uid = BLL.Mem.GetUIDByUsername(username);

                        //更新邀请注册记录
                        if (nobjInviteLog != null)
                        {
                            nobjInviteLog.InvitedUsername = username;
                            nobjInviteLog.RegisterUserEmail = OBJ.UserEmail;
                            nobjInviteLog.isClose = true;
                            nobjInviteLog.ActiveTime = OBJ.InputTime;
                            nobjInviteLog.isActive = false;
                            DbSession.Default.Save<tbInviteLog>(nobjInviteLog);
                        }

                        ComUtls.SendMail(email, "恭喜您！您的帐号已经注册成功！", OConfig.GlobalConfig.EC.EcRegContent, true, 5);
                        
                        KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                        KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("uid", uid.ToString());
                        KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("username", username);
                        KeyValuePair<string, string> node3 = new KeyValuePair<string, string>("email", email);
                        KeyValuePair<string, string> node4 = new KeyValuePair<string, string>("msg",
                            "<div>恭喜您！您的帐号已经注册成功！您的网站通行证是：<span class=\"b\" id=\"spNotifyUsername\"></span></div>"
                            + "<div>同时系统已经把您注册的帐号发送到您的电子邮件[<span id=\"spNotifyEmail\" class=\"b\"></span>]</div>"
                            + "<div class=\"zc_zy\">请注意查收并激活您的账号。</div>"
                            + "<div>"
                            + "<input type=\"button\" class=\"b17\" value=\"登录\" onclick=\"location.href='/user/login.aspx'\" />"
                            + "<input type=\"button\" class=\"b18\" value=\"返回首页\" onclick=\"location.href='/'\" />"
                            + "</div>");
                        WriteXml(node, node1, node2, node3, node4);
                    }
                    break;

                case NSW.OEnum.RegisterResult.Successful:
                    {


                        //记录最后提交数据的时间
                        OSession.Common.LastPost = DateTime.Now;

                        //注册成功后登录帐号
                        OEnum.Mem.LogingInResult loginResult = BLL.Mem.Login(username, pin, now, IP);

                        //获取账号数字ID
                        int uid = BLL.Mem.GetUIDByUsername(username);

                        //奖励推荐人积分
                        if (nobjInviteLog != null)
                        {
                            BLL.Mem.AwardPreminumPoint(nobjInviteLog);
                        }

                        //新注册用户积分奖励
                        int cPoint = OConfig.GlobalConfig.PointRegister;
                        if (cPoint > 0)
                        {
                            BLL.Mem.AwardPoint(username, cPoint, NSW.OEnum.PointChangingColumn.Award, "新注册用户积分奖励");
                        }

                        KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                        KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("uid", uid.ToString());
                        KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("username", username);
                        KeyValuePair<string, string> node3 = new KeyValuePair<string, string>("email", email);
                        KeyValuePair<string, string> node4 = new KeyValuePair<string, string>("msg",
                             "<div>恭喜您！您的帐号已经注册成功！您的网站通行证是：<span class=\"b\" id=\"spNotifyUsername\"></span></div>"
                            + "<div>同时系统已经把您注册的帐号发送到您的电子邮件[<span id=\"spNotifyEmail\" class=\"b\"></span>]</div>"
                            + "<div class=\"zc_zy\">请注意查收，您的账号已登录。</div>"
                            + "<div>"
                            + "<input type=\"button\" class=\"b17\" value=\"会员中心\" onclick=\"location.href='/user'\" />"
                            + "<input type=\"button\" class=\"b18\" value=\"返回首页\" onclick=\"location.href='/'\" />"
                            + "</div>");
                        WriteXml(node, node1, node2, node3, node4);
                    }
                    break;
            }
        }

        #endregion

        /// <summary>
        /// 清空购物车
        /// 回应：string
        ///     * 1 - 成功
        ///     * 0 - 失败
        /// </summary>
        private static void EmptyCart()
        {
            NSW.Cart.EmptyCart();
            WriteString("1");
        }

        /// <summary>
        /// 添加产品到购物车
        /// 回应：XML对象
        /// </summary>
        private static void AddToCart()
        {
            //0> 实例化购物车
            Cart cart = new Cart();
            //1> 获取参数
            int pid = ComUtls.ParseInt(GF("pid"), -1);
            int quti = ComUtls.ParseInt(GF("quti"), -1);
            int tmpquti = quti;
            string atts = ClearGF("atts");
            string pidlist = GF("pidlist");

            ////添加商品，如果购物车有此商品，则累加
            //DataTable tmpdt = null;
            //System.Data.DataView tmpdetaildv = null;
            //CartProductDetail NCartProdDetail = new CartProductDetail();
            //tmpdt = NCartProdDetail.ProductDataTable;
            //if (tmpdt.Rows.Count > 0)
            //{
            //    tmpdt.DefaultView.RowFilter = "[ID] =" + pid;
            //    tmpdetaildv = tmpdt.DefaultView;
            //    if (tmpdetaildv.Count > 0)
            //    {
            //        quti = int.Parse(tmpdetaildv[0]["__quantity__"].ToString()) + quti;
            //    }
            //}

            //2>检查是否是限时抢购产品
            DataTable dtt = DbSession.Default.From<VW_ProductLimitBuying>().Select(VW_ProductLimitBuying._.Stock, VW_ProductLimitBuying._.ProductID).Where(VW_ProductLimitBuying._.Enable == true && VW_ProductLimitBuying._.FromTime < DateTime.Now && VW_ProductLimitBuying._.ToTime > DateTime.Now && VW_ProductLimitBuying._.ProductID == pid).OrderBy(VW_ProductLimitBuying._.OrderID.Asc && VW_ProductLimitBuying._.InputTime.Desc).ToDataTable();
            if (dtt.Rows.Count > 0)
            {
                if (dtt.Rows[0]["Stock"].ToString() == "0")
                {
                    KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("state", "0");
                    KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "抱歉，该产品已经下架，如果想要买到物美价廉的产品，请经常关注本网站，感谢您的支持！");
                    WriteXml(node1, node2);
                    return;
                }
            }
            string[] arr = pidlist.Split(',');
            if (arr.Length > 1)
            {
                pidlist = "";
                bool res = false;
                for (int i = 0; i < arr.Length; i++)
                {
                    if (i > 0)
                    {
                        if (res == true)
                        {
                            pidlist += "," + arr[i];
                        }
                        else
                        {
                            pidlist = arr[i];
                        }

                        res = true;
                    }
                }
            }
            else
            {
                pidlist = "";
            }


            //3> 判断产品ID
            if (pid <= 0)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("msg", "产品ID不正确。");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("count", NSW.Cart.ProductCount.ToString());
                WriteXml(node, node1, node2);
                return;
            }

            //4> 查询产品是否存在
            WhereClip whereClip = (VW_Product._.ID == pid
                                && VW_Product._.Enable == true);
            VW_Product prodObj = DbSession.Default.Get<VW_Product>(whereClip);

            if (prodObj == null)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("msg", "产品不存在。");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("count", NSW.Cart.ProductCount.ToString());
                WriteXml(node, node1, node2);
                return;
            }

            //如果数量小于1则从购物车删除产品
            if (quti < 1)
            {
                cart.Delete(pid, atts);
                cart.BulidCart();
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
                KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("msg", string.Format("{0} 已从购物车移除。", prodObj.Title));
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("count", NSW.Cart.ProductCount.ToString());
                WriteXml(node, node1, node2);
                return;
            }

            // 如果数量 > 0 则添加该产品到购物车
            //int salePromotionColumnId = OConfig.GlobalConfig.Product.SalesPromotionProductColumnID;
            ////是否属于加码销售的产品
            ////如果是加码销售的产品，则要检查购物车里是否已经存在加码销售的产品，将存在的删除，因为一次购物只能购买一个加码销售的产品
            //if (prodObj.ColumnID == salePromotionColumnId)
            //{
            CartProduct prod = new CartProduct(pid, quti, atts, pidlist);
            cart.Add(prod);
            cart.BulidCart();

            KeyValuePair<string, string> _node = new KeyValuePair<string, string>("state", "1");

            KeyValuePair<string, string> _node1 = new KeyValuePair<string, string>("msg",
               string.Format("<p>已添加 {0} 件 {2} 到购物车，目前购物车共有{1}件此商品。</p><p><a href='/paycenter/cart.aspx' class='u'>点击我立即去付款</a></p>" + pidlist, tmpquti, quti, prodObj.Title));

            KeyValuePair<string, string> _node2 = new KeyValuePair<string, string>("quantity", quti.ToString());
            KeyValuePair<string, string> _node3 = new KeyValuePair<string, string>("count", NSW.Cart.ProductCount.ToString());
            WriteXml(_node, _node1, _node2, _node3);

            //// 查询数据库,查询商品
            //Field ClosingPriceField = VW_Product._.Price;
            //WhereClip NWhere = (VW_Product._.Enable == true
            //         && VW_Product._.ShowTime < DateTime.Now
            //         && VW_Product._.ID.In(cart.ProductIDs.Split(',')));
            //OrderByClip NOrder = (VW_Product._.Price.Asc);
            //Field[] NField = new Field[]{ 
            //                VW_Product._.ID,
            //                VW_Product._.ColumnID,
            //                VW_Product._.Price
            //        };
            //NSW.CartProductDetail cartProdDetail = new CartProductDetail(NWhere, NOrder, NField, ClosingPriceField);
            //DataTable dt = cartProdDetail.ProductDataTable;

            //foreach (DataRow row in dt.Rows)
            //{
            //    int columnId = (int)row[VW_Product._.ColumnID.Name];
            //    int prodId = (int)row[VW_Product._.ID.Name];
            //    //获取单个产品购物车信息
            //    CartProduct prodTemp = new CartProduct();
            //    NSW.Cart.GetCartProductByProductID(cart.CartProductList, prodId, ref prodTemp);

            //    //如果是加码销售的产品
            //    if (columnId == salePromotionColumnId)
            //    {
            //        cart.Add(prodId, 0, atts);
            //        break;
            //    } // end if
            //} // end foreach
            //  } // end if
        }

        /// <summary>
        /// 删除购物车产品
        /// </summary>
        private static void DelToCart()
        {
            ////2> 获取参数
            //int pid = ComUtls.ParseInt(GF("pid"), -1);
            //string atts = GF("atts");
            //NSW.OSite.Cart.Cart.delcart(pid, atts);
            //KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "1");
            //KeyValuePair<string, string> node1 = new KeyValuePair<string, string>("msg", string.Format("{0} 已从购物车移除。", "您选择的产品"));
            //KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("count", NSW.OSite.Cart.Cart.countCart().ToString());
            //WriteXml(node, node1, node2);
        }

        /// <summary>
        /// 发表评论
        /// </summary>
        private static void PostComment()
        {
            //1> 获取参数
            int oid = ComUtls.ParseInt(GF("oid"), -1);
            
            string mark=GF("mark");
            int columnId = 0;

            switch (mark.ToLower())
            {
                case "product":
                    columnId = 1;
                    break;
                    
                case "news":
                    columnId = 2;
                    break;

                case "project":
                    columnId = 3;
                    break;

                case "agent":
                    columnId = 4;
                    break;
                    
                case "help":
                    columnId = 5;
                    break;
                    
                case "download":
                    columnId = 6;
                    break; 
                default:
                    columnId = 1;
                    break;
                
            }
            int integral = ComUtls.ParseInt(GF("integral"), 0);
            string content = StringUtls.RemoveTag(GF("content"));
            string verCode = GF("verCode");
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
            SecurityCheck(verCode, CheckingType.BlockToSubmitIPs,
                CheckingType.ForbiddenIP,
                CheckingType.GlobalCommentabled,
                CheckingType.GlobalSubmittingFrequency,
                CheckingType.VerifyCode);

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

            if (StringUtls.GetStringLength(content) > 1000)
            {
                KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", "内容太长，请概括重新发表。");
                WriteXml(node, node2);
                return;
            }

            //3> 保存到数据库
            tbComment nobj = new tbComment();
            nobj.Content = BLL.Site.ReplaceBadWord(content);
            nobj.ColumnID = columnId;
            nobj.Enable = !OConfig.GlobalConfig.CheckComment;
            nobj.InputTime = DateTime.Now;
            nobj.Integral = integral;
            nobj.isCommend = false;
            nobj.LastIP = IP;
            nobj.OrderID = 50;
            nobj.SubjectID = oid;
            nobj.UserID = uid;
            nobj.UserName = username;
            nobj.PointPosted = !OConfig.GlobalConfig.CheckComment;
            nobj.FeedBack = "";

            int rowsAffected = DbSession.Default.Save<tbComment>(nobj);

            //4> 回应消息
            if (rowsAffected > 0)
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

                    KeyValuePair<string, string> node3 = new KeyValuePair<string, string>("time", ComUtls.FormatDateTime(nobj.InputTime));
                    KeyValuePair<string, string> node4 = new KeyValuePair<string, string>("comment", nobj.Content);
                    KeyValuePair<string, string> node5 = new KeyValuePair<string, string>("ip", ComUtls.CutIp(nobj.LastIP, 2));
                    KeyValuePair<string, string> node6 = new KeyValuePair<string, string>("username", nobj.UserName);
                    KeyValuePair<string, string> node7 = new KeyValuePair<string, string>("feedback", nobj.FeedBack);
                    KeyValuePair<string, string> node8 = new KeyValuePair<string, string>("num", num.ToString());
                    WriteXml(node, node2, node3, node4, node5, node6, node7, node8);
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
        /// 帮助中心满意度（帮助作用）反馈
        /// </summary>
        private static void HelpUseful()
        {
            KeyValuePair<string, string> key1 = new KeyValuePair<string, string>();
            KeyValuePair<string, string> key2 = new KeyValuePair<string, string>();

            //1> 获取参数
            string notion = GF("notion").ToLower();
            int oid = ComUtls.ParseInt(GF("oid"), -1);

            //2> 判断参数

            if (oid < 1)
            {
                return;
            }

            if (notion != "1"
                && notion != "2"
                && notion != "3")
            {
                return;
            }

            //3> 检查提交频率是否可疑
            if (!BLL.OSecurity.CheckInterval(OSession.Common.LastPost, 15))
            {
                key1 = new KeyValuePair<string, string>("state", "0");
                key2 = new KeyValuePair<string, string>("msg", "满意度看法提交过于频繁，提交无效，感谢您的参与。");
                WriteXml(key1, key2);
                return;
            }

            //4> 增加满意度
            string fieldName;
            switch (notion)
            {
                case "1": fieldName = "HelpComplete"; break;
                case "2": fieldName = "HelpSome"; break;
                default: fieldName = "HelpLess";
                    break;
            }

            //事务处理
            DbTran tran = DbSession.Default.BeginTran();
            int rowsAffected = -1;
            int logRowsAffected = -1;

            try
            {
                string cmdText = string.Format("UPDATE {0} SET {1}={1}+1 WHERE [ID]={2}",
               ORes.OTableName.tbHelp, fieldName, oid);
                rowsAffected = tran.Excute(cmdText);

                tbHelpSurvery objHelpSurvery = new tbHelpSurvery();
                objHelpSurvery.HelpComplete = (notion == "1");
                objHelpSurvery.HelpID = oid;
                objHelpSurvery.HelpLess = (notion == "3");
                objHelpSurvery.HelpSome = (notion == "2");
                objHelpSurvery.InputTime = DateTime.Now;
                objHelpSurvery.UserIP = IP;
                objHelpSurvery.UserName = OSession.Mem.Username;
                logRowsAffected = tran.Save<tbHelpSurvery>(objHelpSurvery);

                tran.Commit();
            }
            catch
            {
                tran.Rollback();
            }
            finally
            {
                tran.Close();
            }

            //5> 回应消息
            if (rowsAffected > 0)
            {
                OSession.Common.LastPost = DateTime.Now;
                key1 = new KeyValuePair<string, string>("state", "1");
                key2 = new KeyValuePair<string, string>("msg", "提交成功，感谢您的参与。");
                WriteXml(key1, key2);
            }
            else
            {
                OSession.Common.LastPost = DateTime.Now;
                key1 = new KeyValuePair<string, string>("state", "0");
                key2 = new KeyValuePair<string, string>("msg", "提交失败，请稍候重试。");
                WriteXml(key1, key2);
            }
        }

        /// <summary>
        /// 自增点击率
        /// </summary>
        private static void Hits()
        {
            string tabNameMark = GF("mark").ToLower();
            int oid = ComUtls.ParseInt(GF("oid"), -1);
            string tabName;

            if (oid < 1)
            {
                WriteString(ORes.Error.ObjectIDDoesNotExistOrIncorrect);
                return;
            }

            switch (tabNameMark.ToLower())
            {
                case "help": tabName = ORes.OTableName.tbHelp; break;
                case "news": tabName = ORes.OTableName.tbNews; break;
                case "project": tabName = ORes.OTableName.tbProject; break;
                case "download": tabName = ORes.OTableName.tbDownload; break; 
                #region ********************* 代理加盟 **************************
                case "agent": tabName = ORes.OTableName.tbAgent; break;
                #endregion
                case "weipage": tabName = "[tbweipage]"; break;

                default: tabName = ORes.OTableName.tbProduct; break;
            } // end switch
            BLL.Site.IncreaseHits(oid, tabName);
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
        private const string StrRegex = @"^\+/v(8|9)|\b(and|or)\b.{1,6}?(=|>|<|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)";
        /// <summary>
        /// 获取表单值Request.Form，获取失败则返回 string.Empty
        /// </summary>
        /// <param name="paraName">参数名</param>
        /// <returns>参数值</returns>
        private static string GF(string paraName)
        {
            string val = HttpContext.Current.Request.Form[paraName];
            if (val == null) { return ""; }
            if (Regex.IsMatch(val, StrRegex))
            {
                HttpContext.Current.Response.Write("您提交的参数不合法！");
                HttpContext.Current.Response.End();
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
            if (val == null) { return ""; }
            if (Regex.IsMatch(val, StrRegex))
            {
                HttpContext.Current.Response.Write("您提交的参数不合法！");
                HttpContext.Current.Response.End();
                return "";
            }
            else
            {
                return val == null ? defaultVal : val.Trim();
            }
            
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
        /// 网站名称
        /// </summary>
        protected static string SiteName
        {
            get {
                return NSW.OConfig.GlobalConfig.SiteName;
            }
        }
        /// <summary>
        /// 网站域名
        /// </summary>
        protected static string SiteDomain
        {
            get {
                return NSW.OConfig.Common.SiteDomain;
            }
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
            if (Regex.IsMatch(s, StrRegex))
            {
                HttpContext.Current.Response.Write("您提交的参数不合法！");
                HttpContext.Current.Response.End();
                return "";
            }
            else
            {
                return s == null ? string.Empty : s;
            }
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
            if (Regex.IsMatch(s, StrRegex))
            {
                HttpContext.Current.Response.Write("您提交的参数不合法！");
                HttpContext.Current.Response.End();
                return "";
            }
            else
            {
                return s == null ? defaultVal : s;
            }
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


        #endregion
        private static void IsShowIm()
        {
            //是否显示在线客服
            KeyValuePair<string, string> isshowim = new KeyValuePair<string, string>("isshowim", NSW.OConfig.GlobalConfig.ShowIMDetail.ToString());
            //位置
            KeyValuePair<string, string> imposition = new KeyValuePair<string, string>("imposition", NSW.OConfig2.SMTP.ImPosition ? "right" : "left");
            //高度
            KeyValuePair<string, string> topoffset = new KeyValuePair<string, string>("topoffset", NSW.OConfig2.SMTP.ImTopOffSet.ToString());
            //电话
            KeyValuePair<string, string> line = new KeyValuePair<string, string>("line", NSW.OConfig.GlobalConfig.FindPinServiceTel);
            WriteXml(isshowim, imposition, topoffset, line);
        }

        /// <summary>
        /// 首页申请加盟
        /// </summary>
        private static void IndexAddAgent()
        {
            // 获取参数
            string contact = ClearGF("contact");
            string mobileno = ClearGF("mobileno");
            string addrr = ClearGF("addrr");
            string email = ClearGF("email");
            string content = ClearGF("content");
            string city = ClearGF("city");
            string province = ClearGF("province");
            string verCode = GF("verCode");

            //2> 检查参数    
            if (!CheckVerifyCode(verCode))
            {
                WriteState(0, "验证码错误!");
            }

            //安全检查
            SecurityCheck(null, CheckingType.BlockToSubmitIPs, CheckingType.ForbiddenIP, CheckingType.GlobalSubmittingFrequency);

            //保存记录

            //填充实体
            tbAgentApply nobj = new tbAgentApply();
            nobj.Address = addrr;
            nobj.ChnName = contact;
            nobj.City = city;
            nobj.Email = email;
            nobj.Enable = true;
            nobj.IMMsn = string.Empty;
            nobj.IMQQ = string.Empty;
            nobj.InputTime = DateTime.Now;
            nobj.OrderID = 50;
            nobj.Province = province;
            nobj.SubSite = string.Empty;
            nobj.UserIP = IP;
            nobj.Username = OSession.Mem.Username;
            //保存到数据库
            int rowsAffected = DbSession.Default.Save<tbAgentApply>(nobj);

            //显示提示
            if (rowsAffected > 0)
            {
                //bool mailSent = SendAgencyApplicationMailNotify(nobj);
                string msg = "<li>提交了代理申请成功，我们会尽快安排工作人员与您取得联系。</li>";

                //if (mailSent)
                //{
                //    msg += string.Format("<li>系统已发送一封邮件通知到您的邮箱上[{0}]，请注意查收。</li>", nobj.Email);
                //}

                //ShowMsgPage("代理加盟", "/agent", msg, NSW.OEnum.Common.MessageType.Successful);
                //更新最后提交数据的时间
                OSession.Common.LastPost = DateTime.Now;
                WriteState(1, msg);
            }
            else
            {
                WriteState(0, "对不起，提交失败，请稍候重试。");
            }
        }


        /// <summary>
        /// 获取分站的详细信息
        /// </summary>
        protected static void SubSiteInfos()
        {
            string template1 = "<a href=\"{0}\" title=\"{1}\" target=\"_blank\">{1}</a>";
            string url = ClearGF("domain").ToLower();
            DataTable dt = DbSession.Default.From<tbSubsiteInfo>().Where(tbSubsiteInfo._.Enable == 1).OrderBy(tbSubsiteInfo._.OrderID.Asc && tbSubsiteInfo._.InputTime.Desc).ToDataTable();
            if (dt.Rows.Count > 0)
            {
                KeyValuePair<string, string> info = new KeyValuePair<string, string>();
                StringBuilder _sbs = new StringBuilder();
                foreach (DataRow item in dt.Rows)
                {
                    string title = item["title"].ToString();
                    string Domain = item["Domain"].ToString().ToLower();
                    _sbs.AppendFormat(template1, Domain.StartsWith("http://") ? Domain : "http://" + Domain, title);
                }
                info = new KeyValuePair<string, string>("siteinfo", _sbs.ToString());

                DataRow[] current = dt.Select("[Domain]='" + url+"'");

                if (current.Length > 0)
                {
                    string _phone = string.IsNullOrEmpty(current[0]["MPhone"].ToString()) ? current[0]["Phone"].ToString() : current[0]["MPhone"].ToString();
                    _phone = string.IsNullOrEmpty(_phone) ? OConfig.GlobalConfig.FindPinServiceTel : _phone;
                    string _addr = current[0]["Address"].ToString();
                    string _mail = current[0]["Email"].ToString();
                    string _fax = current[0]["Fax"].ToString();
                    string _companyname = current[0]["CompName"].ToString();
                    string _chnname = current[0]["ChnName"].ToString();
                    string _title = current[0]["Title"].ToString();
                    string _domain = current[0]["Domain"].ToString();
                    string _shortdesc = current[0]["ShortDesc"].ToString();
                    KeyValuePair<string, string> k = new KeyValuePair<string, string>("state", "1");
                    KeyValuePair<string, string> kvp = new KeyValuePair<string, string>("phone", _phone);
                    KeyValuePair<string, string> kva = new KeyValuePair<string, string>("address", _addr);
                    KeyValuePair<string, string> kvm = new KeyValuePair<string, string>("mail", _mail);
                    KeyValuePair<string, string> kvf = new KeyValuePair<string, string>("fax", _fax);
                    KeyValuePair<string, string> kvc = new KeyValuePair<string, string>("company", _companyname);
                    KeyValuePair<string, string> kvn = new KeyValuePair<string, string>("name", _chnname);
                    KeyValuePair<string, string> kvt = new KeyValuePair<string, string>("title", _title);
                    KeyValuePair<string, string> kvd = new KeyValuePair<string, string>("domain", _domain);
                    KeyValuePair<string, string> kvs = new KeyValuePair<string, string>("shortdesc", _shortdesc);
                    if (!string.IsNullOrEmpty(info.Key))
                    {
                        WriteXml(k, kvp, kva, kvm, kvf, kvc, kvn, kvt, kvd, kvs, info);
                    }
                    else
                    {
                        WriteXml(k, kvp, kva, kvm, kvf, kvc, kvn, kvt, kvd, kvs);
                    }
                }
                else
                {
                    KeyValuePair<string, string> k = new KeyValuePair<string, string>("state", "0");
                    KeyValuePair<string, string> kvp = new KeyValuePair<string, string>("phone", OConfig.GlobalConfig.FindPinServiceTel);
                    KeyValuePair<string, string> kadd = new KeyValuePair<string, string>("address", SiteName);
                    //KeyValuePair<string, string> kvm = new KeyValuePair<string, string>("mail", "xhlh@xhlh.com.cn");
                    if (!string.IsNullOrEmpty(info.Key))
                    {
                        WriteXml(k, kvp, kadd, info);
                    }
                    else
                    {
                        WriteXml(k, kvp, kadd);
                    }
                }
            }
            else {
                WriteXml("none");
            }
        }

        /// <summary>
        /// 获取分站信息
        /// </summary>
        protected static void SubSiteInfo()
        {
            // 获取参数
            //string template = "<ul>";
            string template1 = "<a href=\"{0}\" title=\"{1}\" target=\"_blank\">{1}</a>";
            //string template2 = "<li><a href=\"{0}\" title=\"{1}\" target=\"_blank\">{1}</a></li>";
            DataTable dt = DbSession.Default.From<tbSubsiteInfo>().OrderBy(tbSubsiteInfo._.OrderID.Asc && tbSubsiteInfo._.InputTime.Desc).ToDataTable();
            if (dt.Rows.Count > 0)
            {
                StringBuilder _sbs = new StringBuilder();
                //_sbs.Append(template);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string title = dt.Rows[i]["title"].ToString();
                    string Domain = dt.Rows[i]["Domain"].ToString();
                    _sbs.AppendFormat(template1, Domain.StartsWith("http://") ? Domain : "http://" + Domain, title);
                }
                WriteString(_sbs.ToString());
            }
            else
            {
                WriteString("none");
            }
        }
        /// <summary>
        /// 获取热线
        /// </summary>
        protected static void HotLine()
        {
            // 获取参数
            string url = ClearGF("domain").ToLower();
            if (url == "nsw88.com" || url == "www.nsw88.com")
            {

                WriteString(NSW.OConfig.GlobalConfig.FindPinServiceTel);
                return;
            }
            DataTable dt = DbSession.Default.From<tbSubsiteInfo>().Where(tbSubsiteInfo._.Domain == url.ToString() && tbSubsiteInfo._.Enable == true).ToDataTable();
            if (dt.Rows.Count > 0)
            {
                StringBuilder _sbs = new StringBuilder();
                _sbs.Append(dt.Rows[0]["MPhone"].ToString().Length > 0 ? (dt.Rows[0]["MPhone"].ToString()) : NSW.OConfig.GlobalConfig.FindPinServiceTel);
                WriteString(_sbs.ToString());
            }
            else
            {
                WriteString(NSW.OConfig.GlobalConfig.FindPinServiceTel);

            }
        }

        /// <summary>
        /// 获取新闻详细页面的最新产品
        /// 默认读取
        /// </summary>
        protected static void getnewproduct()
        {
            StringBuilder _sbs = new StringBuilder();
            string template = "<h5><a href=\"{0}\" title=\"{1}\" target=\"_blank\">{1}</a></h5>"
                            + "<dl>"
                            + "<dt><a href=\"{0}\" title=\"{1}\" target=\"_blank\"><img src=\"{2}\" title=\"{1}\" alt=\"{1}\" /></a></dt>"
                            + "<dd>{3}</ul></dd>"
                            + "<div class=\"clear\"></div></dl>";
            string sitedomain = NSW.OConfig.Common.SiteDomain;
            DataTable dt = DbSession.Default.From<VW_Product>()
                .Where(VW_Product._.Enable == 1 && VW_Product._.ShowTime < DateTime.Now)
                .OrderBy(VW_Product._.OrderID.Asc && VW_Product._.InputTime.Desc)
                .Select(VW_Product._.Title, VW_Product._.PageURL, VW_Product._.PhotoPath, VW_Product._.ShortDesc, VW_Product._.ID, VW_Product._.Attribute)
                .ToDataTable(8);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string title = dt.Rows[i]["title"].ToString();
                string img = dt.Rows[i]["Photopath"].ToString();
                string desc = dt.Rows[i]["ShortDesc"].ToString();
                string attr = dt.Rows[i]["Attribute"].ToString();
                string url = dt.Rows[i]["PageURL"].ToString();
                int id = int.Parse(dt.Rows[i]["ID"].ToString());
                _sbs.AppendFormat(template, sitedomain + url, title, sitedomain + img, string.IsNullOrEmpty(desc) ? GetAttributeValues(id) : desc);

            }
            WriteString(_sbs.ToString());
        }
        /// <summary>
        /// 读取产品属性
        /// </summary>
        /// <param name="modelid"></param>
        /// <returns></returns>
        protected static string GetAttributeValues(int modelid)
        {
            StringBuilder _sbs = new StringBuilder();
            _sbs.Append("<ul>");
            _sbs.Append(NSW.Web.API.SysCommon.GetProductAttribute(modelid));
            _sbs.Append("</ul>");
            return _sbs.ToString();
        }
        /// <summary>
        /// 获取详细页在线客服状态
        /// </summary>
        protected static void ImState()
        {
            string _tmp = NSW.OConfig2.SMTP.ImPosition ? "right" : "left";//在线客服是在左还是在右
            //string t = string.Format("{imCom:{0},imTop:{1},imLine:{2},imPosition:{3},imShow:{4},imInfo:{5}}", NSW.OConfig.GlobalConfig.SiteName, NSW.OConfig2.SMTP.ImTopOffSet.ToString(), NSW.OConfig.GlobalConfig.FindPinServiceTel, _tmp, NSW.OConfig.GlobalConfig.ShowIMDetail.ToString().ToLower(), NSW.Web.Tools.kefu.IMString);
            //WriteString(t);
            string t = "{imCom:{0},imTop:{1},imLine:{2},imPosition:{3},imShow:{4},imData:{5}}".Replace("{0}", "\"" + NSW.OConfig.GlobalConfig.SiteName + "\"").Replace("{1}", NSW.OConfig2.SMTP.ImTopOffSet.ToString()).Replace("{2}", "\"" + NSW.OConfig.GlobalConfig.FindPinServiceTel + "\"").Replace("{3}", "\"" + _tmp + "\"").Replace("{4}", NSW.OConfig.GlobalConfig.ShowIMDetail.ToString().ToLower()).Replace("{5}", "\"" + NSW.Web.Tools.kefu.IMString + "\"");
            WriteString(t);
        }
        /// <summary>
        /// 获取新闻详细页上一篇下一篇信息
        /// </summary>
        protected static void ArticleGduo()
        {
            string oid = QS("oid");
            string sid = QS("sid");
            Field[] f = new Field[]{
            VW_News._.Title,VW_News._.PageURL
            };
            string result = @"<span>下一篇：<a href=""{$nextUrl$}"" title=""{$nextTitle$}"">{$nextTitle$}</a></span>上一篇：<a href=""{$backUrl$}"" title=""{$backTilte$}""> {$backTilte$}</a>";
            DataTable dt = DbSession.Default.From<VW_News>()
                .Select(f).Where(VW_News._.Enable == 1 && VW_News._.ID < oid && VW_News._.sid.Like(sid + "%")).OrderBy(VW_News._.ID.Desc).ToDataTable(1);
            if (dt.Rows.Count > 0)
            {
                result = result.Replace("{$backUrl$}", SiteDomain + dt.Rows[0]["pageurl"].ToString()).Replace("{$backTilte$}", dt.Rows[0]["Title"].ToString());
            }
            else {
                result = result.Replace("{$backUrl$}", "javascript:;").Replace("{$backTilte$}", "已经是第一篇了");
            }
            dt = DbSession.Default.From<VW_News>()
                .Select(f).Where(VW_News._.Enable == 1 && VW_News._.ID > oid && VW_News._.sid.Like(sid + "%")).OrderBy(VW_News._.ID.Asc).ToDataTable(1);
            if (dt.Rows.Count > 0)
            {
                result = result.Replace("{$nextUrl$}", SiteDomain + dt.Rows[0]["pageurl"].ToString()).Replace("{$nextTitle$}", dt.Rows[0]["Title"].ToString());
            }
            else
            {
                result = result.Replace("{$nextUrl$}", "javascript:;").Replace("{$nextTitle$}", "已经是最后一篇了");
            }
            dt.Dispose();
            WriteString(result);
        }

        /// <summary>
        /// 发送留言
        /// </summary>
        private static void IndexSendLeaveword()
        {
            // 获取参数
            string title = ClearGF("title");
            // string compName = ClearGF("compName");
            string cat = ClearGF("cat");
            string contact = ClearGF("contact");
            string email = ClearGF("email");
            string addrr = ClearGF("addrr");
            string shortDesc = ClearGF("shortDesc");
            string tel = ClearGF("tel");
            string mobile = ClearGF("mobile");

            string verificationCode = ClearGF("vercode");
            //2> 检查参数    
            if (!CheckVerifyCode(verificationCode))
            {
                WriteState(0, "验证码错误!");
            }
            //安全检查
            SecurityCheck(null, CheckingType.BlockToSubmitIPs, CheckingType.ForbiddenIP, CheckingType.GlobalSubmittingFrequency);


            //保存记录
            tbLeaveword nobj = new tbLeaveword();
            nobj.Category = cat;
            nobj.Contact = contact;
            nobj.Content = "地址：" + addrr + "\r\n 备注：" + shortDesc;
            nobj.Email = email;
            nobj.Enable = false;
            nobj.InputTime = DateTime.Now;
            nobj.IP = IP;
            nobj.MobileNo = mobile;
            nobj.OrderID = 50;
            nobj.TelNo = tel;
            nobj.Title = title;
            int rowsAffected = DbSession.Default.Save<tbLeaveword>(nobj);

            //回应
            if (rowsAffected > 0)
            {
                
                string msg = "<p>感谢您填写联系留言信息表。我们会尽快给您联系的。</p>";
                //更新最后提交时间
                OSession.Common.LastPost = DateTime.Now;
                WriteState(1, msg);
            }
            else
            {
                WriteState(0, "对不起，提交失败，请稍候重试。");
            }
        }
               
    }
}

