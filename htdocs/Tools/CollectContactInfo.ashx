<%@ WebHandler Language="C#" Class="NSW.Web.Tools.CollectContactInfo" %>

using System;
using System.Web;
using NSW.Entities;
using BlueCrystal.Data;

namespace NSW.Web.Tools
{
    public class CollectContactInfo : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {
        private string FromUsername;
        private string FromSiteName;
        private string FromKeyName;
        private string FromUrl;
        private string CompName;
        private string Contact;
        private string Email;
        private string Phone;
        private string MPhone;
        private string QQ;
        private string MSN;
        private string IP;

        /// <summary>
        /// 查询参数
        /// </summary>
        /// <param name="paraName">参数名</param>
        /// <returns></returns>
        private static string QS(string paraName)
        {
            string rtnVal = HttpContext.Current.Request["FromUsername"];

            return rtnVal == null ? string.Empty : rtnVal;
        }

        /// <summary>
        /// 初始化参数
        /// </summary>
        private void InitParameters()
        {
            FromUsername = HttpUtility.HtmlEncode(QS("FromUsername"));
            FromSiteName = HttpUtility.HtmlEncode(QS("FromSiteName"));
            FromKeyName = HttpUtility.HtmlEncode(QS("FromKeyName"));

            object oTmp = HttpContext.Current.Request.UrlReferrer;
            if (oTmp == null)
            {
                FromUrl = string.Empty;
            }
            else
            {
                oTmp = oTmp.ToString();
            }

            CompName = HttpUtility.HtmlEncode(QS("CompName"));
            Contact = HttpUtility.HtmlEncode(QS("Contact"));
            Email = HttpUtility.HtmlEncode(QS("Email"));
            Phone = HttpUtility.HtmlEncode(QS("Phone"));
            MPhone = HttpUtility.HtmlEncode(QS("MPhone"));
            QQ = HttpUtility.HtmlEncode(QS("QQ"));
            MSN = HttpUtility.HtmlEncode(QS("MSN"));
            IP = ComUtls.HostAddress;
        }

        /// <summary>
        /// 保存记录
        /// </summary>
        /// <returns></returns>
        private int SaveObject()
        {
            tbSiteAnalysize OBJ = new tbSiteAnalysize();
            OBJ.CompName = CompName;
            OBJ.Contact = Contact;
            OBJ.Email = Email;
            OBJ.FromKeyName = FromKeyName;
            OBJ.FromSiteName = FromSiteName;
           // OBJ.FromUrl = FromUrl;
            //OBJ.FromUsername = FromUsername;
            //OBJ.InputTime = DateTime.Now;
            //OBJ.IP = string.Empty;// IP;
            //OBJ.MPhone = MPhone;
            //OBJ.MSN = MSN;
            //OBJ.Phone = Phone;
            //OBJ.QQ = QQ;
            //OBJ.ShortDesc = string.Empty;
            int rowsAffecetd = DbSession.Default.Save<tbSiteAnalysize>(OBJ);

            return rowsAffecetd;
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
                if (ComUtls.IsForbiddenIP(OConfig.GlobalConfig.ForbiddenIPs, ComUtls.HostAddress))
                {
                    WriteString(ORes.Error.TheIpIsForbidToSubmitData);
                    return false;
                }
            }


            if (Contain(checkingTypes, CheckingType.BlockToSubmitIPs))
            {
                if (ComUtls.IsForbiddenIP(OConfig.GlobalConfig.BlockToSubmitIPs, ComUtls.HostAddress))
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

            //if (Contain(checkingTypes, CheckingType.VerifyCode) && verCode != null)
            //{
            //    if (verCode.Length == 0)
            //    {
            //        WriteString(ORes.Error.VerifyCodeIsRequiredField);
            //        return false;
            //    }

            //    if (!CheckVerifyCode(verCode))
            //    {
            //        WriteString(ORes.Error.VerifyCodeIsInvalidPlsRefreshAndTryAgain);
            //        return false;
            //    }
            //}

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

        public void ProcessRequest(HttpContext context)
        {
            //不检查数据来源

            //安全检查 
            SecurityCheck(null, CheckingType.BlockToSubmitIPs, CheckingType.ForbiddenIP, CheckingType.GlobalSubmittingFrequency);

            //初始化参数
            InitParameters();

            WriteString(FromUrl);
            
            ////保存记录
            //int rowsAffected = SaveObject();

            ////更新最后一次提交数据的时间
            //OSession.Common.LastPost = DateTime.Now;

            ////回应
            //if (rowsAffected > 0)
            //{
            //    WriteString("1");
            //}
            //else
            //{
            //    WriteString("0");
            //}
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

    }
}