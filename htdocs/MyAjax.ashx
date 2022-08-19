<%@ WebHandler Language="C#" Class="MyAjax" %>

using System;
using System.Web;
using Newtonsoft.Json;

public class MyAjax :  IHttpHandler, System.Web.SessionState.IRequiresSessionState{
    
    public void ProcessRequest (HttpContext context) {
        string action = context.Request.QueryString["action"];
        switch (action)
        {
            case "GettbForms": GettbForms(); break;
            case "SubmitForm": SubmitForm(); break;
            case "SubmitSurvey": SubmitSurvey(); break;
            default:
                WriteString("无效请求。");
                break;
        }
    }
    
    private static void GettbForms() {
        int oid = FormDBTools.ToInt(QS("ID"));
        FormDB.Entity.tbForms Forms = FormDB.Entity.tbForms.GetEntity(oid);
        string Content = string.Empty;

        System.Collections.Hashtable FieldsHash = new System.Collections.Hashtable();
        if (Forms.ID > 0)
        {
            System.Data.DataTable fields = FormDB.SQLHelp.GetDataTable(string.Format("SELECT [ID],[Title],[Type],[InitialText],[Length],[Css],[IsRequired],[IsVerify],[Regular],[Other],[Temp] FROM tbFields WHERE OID={0} AND IsEnable=1 ORDER BY OrderID ASC,InputTime ASC", oid));
            FormTemplateEntity formTemplate = FormTemplate.ReadFormTemplate(Forms.Temp);
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            Content = formTemplate.Content;
            string[] KeyValues = null, Values = null;
            
            if (fields.Rows.Count > 0)
            {
                string required = formTemplate.TypesTemp.ContainsKey("required") ? formTemplate.TypesTemp["required"].ToString() : "<i>*</i>";
                foreach (System.Data.DataRow row in fields.Rows)
                {
                    string temp = row["temp"].ToString();
                    string type = row["type"].ToString();
                    string other = row["other"].ToString().Trim('$');

                    string li_temp = string.Empty, list_temp = string.Empty;
                    if (!string.IsNullOrEmpty(temp))
                    {
                        System.Collections.Hashtable ht = FormTemplate.ReadLiTemplate(temp);
                        li_temp = ht["Temp"].ToString();
                        list_temp = ht.ContainsKey("List") ? ht["List"].ToString() : string.Empty;
                    }
                    else
                    {
                        if (formTemplate.TypesTemp.ContainsKey(type))
                        {
                            li_temp = formTemplate.TypesTemp[type].ToString();
                        }
                        if (formTemplate.ListTemp.ContainsKey(type))
                        {
                            list_temp = formTemplate.ListTemp[type].ToString();
                        }
                    }

                    if (HashListTag.Contains(type) && !string.IsNullOrEmpty(other) && (KeyValues = NSW.Utls.StringUtls.Split(other, "$$")) != null && KeyValues.Length > 0)
                    {
                        System.Text.StringBuilder list = new System.Text.StringBuilder();
                        foreach (string keyValue in KeyValues)
                        {
                            if (!string.IsNullOrEmpty(keyValue) && (Values = NSW.Utls.StringUtls.Split(keyValue, "||")) != null && Values.Length == 3)
                            {
                                list.Append(list_temp
                                   .Replace("{txt}", Values[0])
                                   .Replace("{val}", "{val}" + ("true".Equals(Values[2]) ? "\"" + (CheckedTag.Contains(type) ? " checked=\"checked" : " selected=\"selected") : ""))
                                   .Replace("{val}", Values[1].Replace("\"", "'"))
                               );
                            }
                        }
                        li_temp = li_temp.Replace("{list}", list.ToString());
                    }

                    sb.Append(li_temp
                        .Replace("{title}", row["title"].ToString())
                        .Replace("{id}", row["id"].ToString())
                        .Replace("{type}", type)
                        .Replace("{field_warp}", type + "_warp warp_" + row["id"].ToString())
                        .Replace("{name}", type + "_" + row["id"].ToString())
                        .Replace("{required}", (bool)row["IsRequired"]==true?required:string.Empty)
                    );
                    
                }
                fields.Columns.Remove("Other");
                fields.Columns.Remove("Temp");
                FieldsHash.Add("Fields", fields);
                FieldsHash.Add("State", 1);
                FieldsHash.Add("OID", Forms.ID);
                FieldsHash.Add("Css", Forms.Css);
                FieldsHash.Add("Message", "查询成功！");
            }
            if (Forms.IsVer && formTemplate.TypesTemp.ContainsKey("vcode"))
            {
                sb.Append(formTemplate.TypesTemp["vcode"]);
            }
            Content = Content.Replace("{content}", sb.ToString());
            FieldsHash.Add("Content", Content);
            WriteString(JsonConvert.SerializeObject(FieldsHash));
            return;
        }
        FieldsHash.Add("State",0);
        FieldsHash.Add("Message", "查询失败！");
        WriteString(JsonConvert.SerializeObject(FieldsHash));
    }
    public static void SubmitForm() {
        int oid = FormDBTools.ToInt(QS("OID"));
        FormDB.Entity.tbForms form = FormDB.Entity.tbForms.GetEntity(oid);
        string mark = QS("mark");
        System.Collections.Hashtable FieldsHash = new System.Collections.Hashtable();
        if (form.ID > 0)
        {
            HttpContext Context = HttpContext.Current;
            if (form.IsVer)
            {
                string ver = GF("verifycode");
                string verifyCode = HttpContext.Current.Session["verifyCode"].ToString();
                if (string.IsNullOrEmpty(verifyCode) || string.IsNullOrEmpty(ver) || !ver.ToLower().Equals(verifyCode.ToLower()))
                {
                    FieldsHash.Add("State", 0);
                    FieldsHash.Add("Message", "验证码有误或者已过期！");
                    WriteString(JsonConvert.SerializeObject(FieldsHash));
                    return;
                }
            }
            if (form.Times > 0) {
                bool isTimeout = !VerificationLastPost(form.Times);
                if (isTimeout) {
                    FieldsHash.Add("State", 0);
                    FieldsHash.Add("Message", NSW.ORes.Error.ToAvoidMaliceSubmittingPlsWaitAndResubmit);
                    WriteString(JsonConvert.SerializeObject(FieldsHash));
                    return;
                }
            }
            System.Collections.IEnumerator enumerator = Context.Request.Form.GetEnumerator();
            System.Text.StringBuilder other = new System.Text.StringBuilder("$$");
            System.Collections.Hashtable ht = new System.Collections.Hashtable();
            while (enumerator.MoveNext())
            {
                string key = enumerator.Current.ToString();
                string value = GF(key);
                if (key.Contains("text_") || key.Contains("textarea_") || key.Contains("radio_") || key.Contains("checkbox_") || key.Contains("select_"))
                {
                    string id = key.Substring(key.IndexOf('_', 4) + 1);
                    other.Append(id + "||" + value.Replace("|", "，").Replace("$", "，") + "$$");
                    ht.Add(id, value);
                }
            }
            FormDB.Entity.tbLeaveMessage leave = new FormDB.Entity.tbLeaveMessage();
            leave.UserID = NSW.OSession.Mem.ID;
            leave.InputTime = DateTime.Now;
            leave.IsEnable = !form.IsShow;
            leave.OID = oid;
            leave.Title = form.Title;
            leave.ManagerReply = "";
            leave.Other = other.ToString();
            leave.Mark = string.IsNullOrEmpty(mark) ? string.Empty : mark.ToLower();
            leave.OrderID = 50;
            leave.ProductID = FormDBTools.ToInt(QS("obj_id"), 0);
            leave.IP = IP;
            leave.Source = Context.Request.UrlReferrer == null ? "" : Context.Request.UrlReferrer.AbsoluteUri.ToString();
            int rowsAffected = -1;
            try
            {
                rowsAffected = leave.Save();
            }
            catch (Exception ex) {
                FieldsHash.Add("State", 0);
                FieldsHash.Add("Message", ex.Message);
                WriteString(JsonConvert.SerializeObject(FieldsHash));
            }
            if (rowsAffected < 1) {
                FieldsHash.Add("State", 0);
                FieldsHash.Add("Message", "保存失败，请稍后重试！");
                WriteString(JsonConvert.SerializeObject(FieldsHash));
                return;
            }
            if (form.Times > 0)
            {
                SetLastPost();
            }
            /*发送邮件*/
            if (form.IsEmailTOUser && !string.IsNullOrEmpty(form.EmailSurgery))
            {
                System.Data.DataTable dt = FormDB.SQLHelp.GetDataTable(string.Format("SELECT [ID],[Title],[Type],[InitialText],[Length],[Css],[IsRequired],[IsVerify],[Regular],[Other],[Temp] FROM tbFields WHERE OID={0} AND IsEnable=1 ORDER BY OrderID ASC,InputTime ASC", oid));
                string email = NSW.OConfig.GlobalConfig.ReceivingLeavewordMailAddress;
                if (dt.Rows.Count > 0)
                {
                    string body = form.EmailSurgery
                        .Replace("{$time$}", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"))
                        .Replace("{$site_domain$}", NSW.OConfig.Common.SiteDomain)
                        .Replace("{$service_tel$}", NSW.OConfig.GlobalConfig.FindPinServiceTel)
                        .Replace("{$site_name$}", NSW.OConfig.GlobalConfig.SiteName);
                    System.Text.StringBuilder _html = new System.Text.StringBuilder();
                    string temlp = "<br />{Title}：{Value}<br />";
                    string value, id,title;
                    foreach(System.Data.DataRow row in dt.Rows){
                        id = row["id"].ToString();
                        title = row["title"].ToString();
                        if (ht.ContainsKey(id))
                        {
                            value = ht[id].ToString();
                            _html.Append(temlp
                                .Replace("{Title}", title)
                                .Replace("{Value}", value)
                            );
                            title = title.ToLower();
                            if (title.Contains("邮箱") || title.Contains("邮件") || title.Contains("mail"))
                            {
                                email += ";" + value;
                            }
                        }
                    }
                    if (!string.IsNullOrEmpty(email))
                    {
                        body = body.Replace("{$Fields$}", _html.ToString());
                        NSW.ComUtls.SendMail(email, form.Title, body, true);
                        //bool isTG = FormDBTools.SendMail(email, form.Title, body);
                    }
                }
            }
            /*发送邮件 end*/

            FieldsHash.Add("State",1);
            FieldsHash.Add("Message", "提交成功！");
            WriteString(JsonConvert.SerializeObject(FieldsHash));
            return;
        }
        FieldsHash.Add("State", 0);
        FieldsHash.Add("Message", "表单不存在！");
        WriteString(JsonConvert.SerializeObject(FieldsHash));
        return;
    }
    private static void SubmitSurvey(){
        int oid = FormDBTools.ToInt(QS("OID"));
        FormDB.Entity.tbForms form = FormDB.Entity.tbForms.GetEntity(oid);
        string mark = QS("mark");
        System.Collections.Hashtable FieldsHash = new System.Collections.Hashtable();
        if (form.ID > 0)
        {
            HttpContext Context = HttpContext.Current;
            if (form.Times > 0) {
                bool isTimeout = !VerificationLastPost(form.Times);
                if (isTimeout) {
                    FieldsHash.Add("State", 0);
                    FieldsHash.Add("Message", NSW.ORes.Error.ToAvoidMaliceSubmittingPlsWaitAndResubmit);
                    WriteString(JsonConvert.SerializeObject(FieldsHash));
                    return;
                }
            }
            System.Collections.IEnumerator enumerator = Context.Request.Form.GetEnumerator();
            System.Text.StringBuilder other = new System.Text.StringBuilder("$$");
            while (enumerator.MoveNext())
            {
                string key = enumerator.Current.ToString();
                string value = GF(key);
                if (key.Contains("text_") || key.Contains("textarea_") || key.Contains("radio_") || key.Contains("checkbox_") || key.Contains("select_"))
                {
                    string id = key.Substring(key.IndexOf('_', 4) + 1);
                    other.Append(id + "||" + value.Replace("|", "，").Replace("$", "，") + "$$");
                }
            }
            FormDB.Entity.tbLeaveMessage leave = new FormDB.Entity.tbLeaveMessage();
            leave.UserID = NSW.OSession.Mem.ID;
            leave.InputTime = DateTime.Now;
            leave.IsEnable = !form.IsShow;
            leave.OID = oid;
            leave.Title = form.Title;
            leave.ManagerReply = "";
            leave.Other = other.ToString();
            leave.Mark = string.IsNullOrEmpty(mark) ? string.Empty : mark.ToLower();
            leave.OrderID = 50;
            leave.ProductID = FormDBTools.ToInt(QS("obj_id"), 0);
            leave.IP = IP;
            leave.Source = Context.Request.UrlReferrer == null ? "" : Context.Request.UrlReferrer.AbsoluteUri.ToString();
            int rowsAffected = -1;
            try
            {
                rowsAffected = leave.Save();
            }
            catch (Exception ex) {
                FieldsHash.Add("State", 0);
                FieldsHash.Add("Message", ex.Message);
                WriteString(JsonConvert.SerializeObject(FieldsHash));
            }
            if (rowsAffected < 1) {
                FieldsHash.Add("State", 0);
                FieldsHash.Add("Message", "保存失败，请稍后重试！");
                WriteString(JsonConvert.SerializeObject(FieldsHash));
                return;
            }
            if (form.Times > 0)
            {
                SetLastPost();
            }
            
            FieldsHash.Add("State",1);
            FieldsHash.Add("Message", "提交成功！");
            WriteString(JsonConvert.SerializeObject(FieldsHash));
            return;
        }
        FieldsHash.Add("State", 0);
        FieldsHash.Add("Message", "表单不存在！");
        WriteString(JsonConvert.SerializeObject(FieldsHash));
        return;
    }
    private static string HashListTag = "|radio|checkbox|select|";
    private static string CheckedTag = "|radio|checkbox|select|";
    
    public static bool VerificationLastPost(int Second) {
        System.Web.SessionState.HttpSessionState Session = HttpContext.Current.Session;
        if (Session["lastPost"] == null) {
            return true;
        }
        DateTime lastpost = (DateTime)Session["lastPost"];
        TimeSpan ts = DateTime.Now - lastpost;
        return ts.TotalSeconds > Second;
    }
    public static void SetLastPost() {
        HttpContext.Current.Session["lastPost"] = DateTime.Now;
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
        if (System.Text.RegularExpressions.Regex.IsMatch(val, StrRegex))
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
        if (System.Text.RegularExpressions.Regex.IsMatch(val, StrRegex))
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
    /// 从 URL 解析参数[Request.QueryString]，解析失败则返回 string.Empty
    /// </summary>
    /// <param name="paraName">参数名</param>
    /// <returns>参数值</returns>
    protected static string QS(string paraName)
    {
        string s = HttpContext.Current.Request.QueryString[paraName];
        s = string.IsNullOrEmpty(s) ? string.Empty : s;
        if (System.Text.RegularExpressions.Regex.IsMatch(s, StrRegex))
        {
            HttpContext.Current.Response.Write("您提交的参数不合法！");
            HttpContext.Current.Response.End();
            return "";
        }
        return s;
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
        if (System.Text.RegularExpressions.Regex.IsMatch(s, StrRegex))
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
    public bool IsReusable {
        get {
            return false;
        }
    }

}