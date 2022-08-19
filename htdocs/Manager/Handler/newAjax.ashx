<%@ WebHandler Language="C#" Class="newAjax" %>

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
using Newtonsoft.Json;
using System.Text.RegularExpressions;

#endregion

public class newAjax : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {

        //延时，用于客户端测试
        //System.Threading.Thread.Sleep(2000);

        //检查来源
        if (!NSW.ComUtls.CheckPostSource())
        {
            context.Response.Write(NSW.ORes.Error.SuspiciousOfPostingSourceAndBeIgnored);
            return;
        }
        if (!NSW.BLL.Admin.CheckPassport())
        {
            context.Response.Write("您尚未登录，不能操作！");
        }
        /****************************************
         * 加快方法调用响应速度，所有方法和属性尽量以静态的形式实现
         ***************************************/
        //操作
        string action = context.Request.QueryString["action"];
        switch (action)
        {
            case "getDetailed": GetDetailed(); break;
            default:
                WriteString("无效请求。");
                break;
        }
    }
    
    private static string ColumnTypes = "|news|agent|help|project|product|";
    private static string ColumnTypesShowTime = "|news|project|product|";
    private void GetDetailed()
    {
        string sid = ClearGF("sid");
        string title = ClearGF("title");
        string columntype = ClearGF("columntype").ToLower();
        NSW.Admin.Tools.MessageStatus message = new NSW.Admin.Tools.MessageStatus();
        if (string.IsNullOrEmpty(columntype) ||(!string.IsNullOrEmpty(sid)&&!NSW.ComUtls.CheckIDsFormat(sid)))
        {
            message.Data = "参数格式错误！";
            WriteJson(message);
            return;
        }
        if (string.IsNullOrEmpty(sid) && string.IsNullOrEmpty(title))
        {
            message.Data = "参数格式错误！";
            WriteJson(message);
            return;
        }
        string sql = "select ID,Title from vw_" + columntype + " where enable=1" + (ColumnTypesShowTime.Contains(columntype) ? " and showtime<getdate()" : string.Empty);
        if (!string.IsNullOrEmpty(sid)) {
            sql += " and sid like'" + sid + "%'";
        }
        if (!string.IsNullOrEmpty(title))
        {
            sql += " and title like'%" + title + "%'";
        }
        
        DataTable dt = DbSession.Default.FromSql(sql).ToDataTable();
        message.Data = dt;
        message.Status = 1;
        WriteJson(message);
        return;
        
    }
    #region ***常用对象***

    public void WriteJson(NSW.Admin.Tools.MessageStatus message){
        HttpContext context = HttpContext.Current;
        context.Response.AddHeader("Content-Type", "application/json; charset=UTF-8");
        context.Response.Write(JsonConvert.SerializeObject(message));
        context.Response.End();
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
            if (NSW.ComUtls.IsForbiddenIP(NSW.OConfig.GlobalConfig.ForbiddenIPs, IP))
            {
                WriteString(NSW.ORes.Error.TheIpIsForbidToSubmitData);
                return false;
            }
        }


        if (Contain(checkingTypes, CheckingType.BlockToSubmitIPs))
        {
            if (NSW.ComUtls.IsForbiddenIP(NSW.OConfig.GlobalConfig.BlockToSubmitIPs, IP))
            {
                WriteString(NSW.ORes.Error.TheIpIsForbidden);
                return false;
            }
        }

        if (Contain(checkingTypes, CheckingType.GlobalCommentabled))
        {
            if (!NSW.OConfig.GlobalConfig.Commentabled)
            {
                WriteString(NSW.ORes.Error.CommentIsClosedBySystem);
                return false;
            }
        }

        if (Contain(checkingTypes, CheckingType.GlobalSubmittingFrequency))
        {
            if (!NSW.BLL.OSecurity.CheckSubmitFrequency(NSW.OConfig.GlobalConfig.GlobalSubmitDataInterval))
            {
                WriteString(NSW.ORes.Error.ToAvoidMaliceSubmittingPlsWaitAndResubmit);
                return false;
            }
        }

        if (Contain(checkingTypes, CheckingType.VerifyCode) && verCode != null)
        {
            if (verCode.Length == 0)
            {
                WriteString(NSW.ORes.Error.VerifyCodeIsRequiredField);
                return false;
            }

            if (!CheckVerifyCode(verCode))
            {
                WriteString(NSW.ORes.Error.VerifyCodeIsInvalidPlsRefreshAndTryAgain);
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
            return NSW.ComUtls.HostAddress;
        }
    }

    /// <summary>
    /// 检查验证码
    /// </summary>
    /// <param name="verCode">源验证码</param>
    /// <returns>是否正确</returns>
    protected static bool CheckVerifyCode(string verCode)
    {
        return NSW.BLL.OSecurity.CheckVerifyCode(verCode);
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