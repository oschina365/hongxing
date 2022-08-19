<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Job.Job_Index, qwt" enableviewstate="false" enableviewstatemac="false" %>

<%@ Register TagPrefix="Columns" TagName="Columns" Src="~/UserControls/Job/Columns.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>z深圳市牛商网络有限公司</title>
    <meta name="keywords" content="深圳市牛商网络有限公司" />
    <meta name="description" content="深圳市牛商网络有限公司" />
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
    <!--Header:Start-->
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
    <!--Header:End-->
    <!--Content:Start-->
    <div class="topadcs">
        <%=NSW.Web.API.SysCommon.GetAdCodeByKeyNameM("job_index", "product_index")%>
    </div>
    <div class="content">
        <Columns:Columns runat="server" ID="uc_Columns_1" />
        <div class="right">
            <div class="righttop">
            </div>
            <ucLocL:ucLocL runat="server" ID="ucLocR_1" />
            <h4 class="rtit">
                招聘信息列表</h4>
            <div class="right_main">
                <div class="job_top">
                    <span>请把您电子简历Word文档发送到我们的电子邮件：<%= NSW.OConfig.GlobalConfig.HREmailAddress %>，或者直接与我们的人力资源部取得联系。</span>
                    <div>
                        我们的直线电话是：<b><%= NSW.OConfig.GlobalConfig.HRPhoneNo %></b></div>
                </div>
                <div class="ljob">
                </div>
                <asp:Repeater runat="server" ID="rpt">
                    <ItemTemplate>
                        <div class="job_con">
                            <h4<%# ShowDetail ? string.Empty : " style='background:url("+SkinPath+"img/ico14.gif) no-repeat 0 5px;'" %>><a href="javascript:void(0)" onclick="toggleJobDetail(this,'<%= SkinPath %>')" class="corange"><%# Eval("Title") %></a></h4>
				<div<%# ShowDetail ? string.Empty : " style='display:none;'" %>>
				    <table class="job_con_tab">
					    <tr>
						    <td width="25%">招聘岗位：<%# Eval("Title") %></td>
						    <td width="20%">招聘人数：<%# Eval("Needs") %></td>
						    <td width="55%">性别要求：<%# Eval("Gender") %></td>
					    </tr>
					    <tr>
						    <td>学历要求：<%# Eval("Educational")%></td>
						    <td>工作地点：<%# Eval("Area") %></td>
						    <td>薪资待遇：<%# Eval("Salary") %></td>
					    </tr>
				    </table>
				    <dl>
					    <dt><b>岗位职责:</b></dt>
					    <dd><%# NSW.ComUtls.ShiftEnterToBr( Eval("JobDescription").ToString()) %></dd>
				    </dl>
				    <dl>
					    <dt><b>能力要求:</b></dt>
					    <dd><%#NSW.ComUtls.ShiftEnterToBr(  Eval("Requirements").ToString()) %></dd>
				    </dl>
                        </div>
                        </div></ItemTemplate>
                </asp:Repeater>
                <div runat="server" id="nodata" visible="false">
                    暂无数据</div>
                <div class="job_bot">
                    <OranPager:OranPager runat="server" ID="pagerMain" CssClass="apage" />
                </div>
            </div>
            <div class="rightbot">
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <!--Content:End-->
    <!--Footer:Start-->
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
    <!--Footer:End-->
</body>
</html>
