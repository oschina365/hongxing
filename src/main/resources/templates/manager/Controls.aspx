<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.Controls, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
	<title></title>
<!-- hongxin.com.cn/Mobile Baidu tongji analytics -->
<script>
var _hmt = _hmt || [];
(function() {
var hm = document.createElement("script");
hm.src = "https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d";
var s = document.getElementsByTagName("script")[0];
s.parentNode.insertBefore(hm, s);
})();
</script>
</head>
<body>
<style type="text/css">
td{ line-height:1.5;}
b{ color:#666600;}
.selbt {	
	float:left;
	width:120px;
	margin:2px 0px 2px 3px;
	text-align:center;
}
.coolbg {
	border: 1px solid #dcdcdc;
	padding: 2px;
	padding-right: 5px;
	padding-left: 5px;
	background: #fff;
	cursor: pointer;
}
.coolbg a{ width:100%; display:block;}
.helpdiv {
	float: left;
	display: none;
	border: 1px dashed #f08300;
	background-color: #f6f6f6;
	width: 99%;
	padding: 5px;
}
textarea {
	background: #fff;
	border-width: 1px;
	border-style: solid;
	border-color: #707070 #CECECE #CECECE #707070;
	padding: 2px 4px;
	vertical-align: middle;
	line-height: 16px;
	overflow: auto;
}
</style>
<script type="text/javascript">
	var showdiv = function (id, src) {
		if (id) {
			$("div.help" + id).slideDown().siblings("div.helpdiv").slideUp();
		} else {
			$(src).parents("div.helpdiv").hide();
		}
	}
</script>
<script runat="server" type="text/C#">
	protected void GetCommonMethod() {
		NSW.OConfig2.AppWebConfigSet.GetAppWebConfig("velocitycontextset");
	}
</script>
<%System.Collections.Generic.List<NVTools.XMLControl> list = NVTools.XmlUtil.Deserialize<NVTools.XMLControl>();%>
<table width='98%'  border='0' cellpadding='3' cellspacing='1' bgcolor='#cfcfcf' align="center">
	<%if (list.Count > 0) {%>
	<tr  bgcolor="#f6f6f6">
		<td colspan='2' hieght="30" style="padding-left:10px;"><b>常用控件：</b></td>
	</tr>
	<tr bgcolor='#FFFFFF'>
		<td colspan='2'>
			<%foreach (NVTools.XMLControl control in list) {%>
			<div class="coolbg np selbt" title="<%=control.Title %>"><a href="javascript:;" onclick="showdiv('<%=control.ID %>');"><%=control.Title %></a></div>
			<%  }%>
		</td>
	</tr>
	<tr>
		<td colspan='2'  bgcolor='#FFFFFF' style="border-top:1px solid #fff;">
			<%foreach (NVTools.XMLControl control in list) {%>
			<div class="helpdiv help<%=control.ID %>" >
				<div style="float:right;"><a href="###" onclick="showdiv('',this)" title="隐藏标签说明">关闭</a></div>
				<b>控件名称：</b><%=control.Title %><br />
				<b>使用方法：</b><br />
				<textarea rows="5" cols="50" style="width:98%"><%=control.Code %></textarea><br />
			</div>
			<%}%>
		</td>
	</tr>
	<%}%>

	<%
		System.Data.DataTable dt = BlueCrystal.Data.DbSession.Default.FromSql("select * from tbnvcontrols where enable=1 order by orderid asc,inputtime asc").ToDataTable();
	%>
	<%if (dt.Rows.Count > 0)
	  {%>
	<tr  bgcolor="#f6f6f6">
		<td colspan='2' hieght="30" style="padding-left:10px;"><b>NVelocity控件库：</b></td>
	</tr>
	<tr bgcolor='#FFFFFF'>
		<td colspan='2'>
			<%foreach (System.Data.DataRow row in dt.Rows)
			  {%>
			<div class="coolbg np selbt" title="<%=row["Title"] %>"><a href="javascript:;" onclick="showdiv('nv<%=row["ID"] %>');"><%=row["Title"] %></a></div>
			<%  }%>
		</td>
	</tr>
	<tr>
		<td colspan='2'  bgcolor='#FFFFFF' style="border-top:1px solid #fff;">
			<%foreach (System.Data.DataRow row in dt.Rows)
			  {%>
			<div class="helpdiv helpnv<%=row["ID"] %>" >
				<div style="float:right;"><a href="###" onclick="showdiv('',this)" title="隐藏标签说明">关闭</a></div>
				<b>控件名称：</b><%=row["ID"] %><br />
				<b>使用方法：</b><br />
				<textarea rows="5" cols="50" style="width:98%">#nvcontrols("<%=row["Mark"] %>")</textarea><br />
			</div>
			<%  }%>
		</td>
	</tr>
	<%}%>

	<%
		Hashtable ht = NVEngine.NVTempHelp.VelocityContextSet;
		foreach (string key in ht.Keys) {
			object value = ht[key];
			Type type = value.GetType();
			//System.Reflection.PropertyInfo[] pis = type.GetProperties(System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static);
			//foreach (System.Reflection.PropertyInfo pi in pis) {
			//    Response.Write("$" + key +"." + pi.Name + "<br />");
			//}

            System.Reflection.MethodInfo[] mts = type.GetMethods(System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static);
			foreach (System.Reflection.MethodInfo mt in mts)
			{
                if (mt.Name.StartsWith("get_") || mt.Name.StartsWith("set_"))
                {
                    continue;
                }
				Response.Write("$" + key + "." + mt.Name + "(");
				System.Reflection.ParameterInfo[] pins = mt.GetParameters();
				int index = 0;
				foreach (System.Reflection.ParameterInfo pin in pins) {
					string pinType = pin.ParameterType.ToString();
					int last = pinType.LastIndexOf(".");
					if (last > 0) {
						pinType = pinType.Substring(last + 1);
					}
					Response.Write(pinType + " " + pin.Name + ",");
					if (index < pins.Length) {
						Response.Write(pinType + " " + pin.Name);
					}
					index++;
				}
				Response.Write(")<br />");
			}
		}    
	 %>
</table>
<!--
<div name="help111" id="channel" class="helpdiv" >
	<div style=" float:right;"><a href="###" onclick="showdiv('')" title="隐藏标签说明">关闭</a></div>
	<b>标签名称：</b>channel<br />
	<b>功能说明：</b>获取栏目列表标签<br />
	<b>使用实例：</b><br />
	<textarea rows="5" cols="50" style="width:98%">代码</textarea><br />
	<b>参数说明：</b><br />
	typeid = '0' 栏目ID<br />
	reid = '0' 上级栏目ID<br />
	row = '100' 调用栏目数<br />
	col = '1'  分多少列显示（默认为单列）<br />
	type = 'son' son表示下级栏目,self表示同级栏目,top顶级栏目<br />
	currentstyle = '' 应用样式<br />
</div>
-->
</body>
</html>
