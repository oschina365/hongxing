﻿<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.MobileBatchImg, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%= ItemName %></title>
    <link href="skins/base/editInterface.css" rel="stylesheet" type="text/css" />
    <link href="skins/base/news.css" rel="stylesheet" type="text/css"/>
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
<CurrentPosition:CurrentPosition runat="server" ID="cur"/>
<form id="form1" runat="server" onsubmit="top.refreshList=true;">
 <div class="add_cont pad300 j_recordCon_c f_cb" style="border-top:0;">
  <!-- 静态页面生成基本信息 -->
  
  <div class="cont1">
	<div class="f_cb">
		<label class="add_label f_fl">批量压缩图片</label>
		<div class="add_r f_fl">
			<div class="f_cb f_lht27">
                <div class="set_cbs" id="columns">
                    <span>
                        <%if (NSW.BLL.Admin.CheckPermission("products.aspx", NSW.BLL.Admin.AdminPermission.Permission)){ %><input id="cbx01" type="checkbox" checked="checked" value="5" /><label for="cbx01">产品中心</label><%} %>
                        <input id="cbx02" type="checkbox" checked="checked" value="4" /><label for="cbx02">资讯中心</label>
                        <input id="cbx03" type="checkbox" checked="checked" value="253" /><label for="cbx03">帮助中心</label>
                        <%if (NSW.BLL.Admin.CheckPermission("agents.aspx", NSW.BLL.Admin.AdminPermission.Permission)){ %><input id="cbx04" type="checkbox" checked="checked" value="277"/><label for="cbx04">招商加盟</label><%} %>
                        <%if (NSW.BLL.Admin.CheckPermission("projects.aspx", NSW.BLL.Admin.AdminPermission.Permission)){ %><input id="cbx05" type="checkbox" checked="checked" value="12"/><label for="cbx05">方案中心</label><%} %>
                    </span>
                </div>
			</div>			
	    </div>
	</div>
    
	<div class="f_cb f_mt25">
		<label class="add_label f_fl">各个栏目压缩规格</label>
		<div class="add_r f_fl">
            <!--产品列表页-->
            <%if (NSW.BLL.Admin.CheckPermission("products.aspx", NSW.BLL.Admin.AdminPermission.Permission)){ %>
            <div class="f_cb add_sv mb10">产品列表页：<span class="clear_bd span_max_w50"><asp:TextBox
                runat="server" ID="txtProductListW" CssClass="com_input clear_word" /><i class="clear_x"></i></span>X<span class="clear_bd span_max_w50"><asp:TextBox runat="server" ID="txtProductListH" CssClass="com_input clear_word" /><i class="clear_x"></i></span>
                <span class="ml10">产品详细图：</span><span class="clear_bd span_max_w50"><asp:TextBox
                    runat="server" ID="txtProductDetailW" CssClass="com_input clear_word" /><i class="clear_x"></i></span>X<span class="clear_bd span_max_w50"><asp:TextBox runat="server" ID="txtProductDetailH" CssClass="com_input clear_word" /><i class="clear_x"></i></span></div>
            <%} %>
            <!--资讯列表页-->
            <div class="f_cb add_sv mb10">资讯列表页：<span class="clear_bd span_max_w50"><asp:TextBox
                runat="server" ID="txtNewsListW" CssClass="com_input clear_word" /><i class="clear_x"></i></span>X<span class="clear_bd span_max_w50"><asp:TextBox runat="server" ID="txtNewsListH" CssClass="com_input clear_word" /><i class="clear_x"></i></span>
               </div>
            <!--帮助列表页-->
            <div class="f_cb add_sv mb10">帮助列表页：<span class="clear_bd span_max_w50"><asp:TextBox
                runat="server" ID="txtHelpListW" CssClass="com_input clear_word" /><i class="clear_x"></i></span>X<span class="clear_bd span_max_w50"><asp:TextBox runat="server" ID="txtHelpListH" CssClass="com_input clear_word" /><i class="clear_x"></i></span>
                </div>
            <%if (NSW.BLL.Admin.CheckPermission("agents.aspx", NSW.BLL.Admin.AdminPermission.Permission)){ %>
            <!--招商加盟列表页-->
            <div class="f_cb add_sv mb10">加盟列表页：<span class="clear_bd span_max_w50"><asp:TextBox
                runat="server" ID="txtAgentListW" CssClass="com_input clear_word" /><i class="clear_x"></i></span>X<span class="clear_bd span_max_w50"><asp:TextBox runat="server" ID="txtAgentListH" CssClass="com_input clear_word" /><i class="clear_x"></i></span>
                </div>
            <%} %>
            <%if (NSW.BLL.Admin.CheckPermission("projects.aspx", NSW.BLL.Admin.AdminPermission.Permission)){ %>
            <!--方案列表页-->
            <div class="f_cb add_sv mb10">方案列表页：<span class="clear_bd span_max_w50"><asp:TextBox
                runat="server" ID="txtProjectListW" CssClass="com_input clear_word" /><i class="clear_x"></i></span>X<span class="clear_bd span_max_w50"><asp:TextBox runat="server" ID="txtProjectListH" CssClass="com_input clear_word" /><i class="clear_x"></i></span>
                <span class="ml10">方案详细图：</span><span class="clear_bd span_max_w50"><asp:TextBox
                    runat="server" ID="txtProjectDetailW" CssClass="com_input clear_word" /><i class="clear_x"></i></span>X<span class="clear_bd span_max_w50"><asp:TextBox runat="server" ID="txtProjectDetailH" CssClass="com_input clear_word" /><i class="clear_x"></i></span></div>
            <%} %>
	    </div>
	</div>
	<div class="f_cb f_mt25">
		<label class="add_label f_fl">批量生成图片</label>
		<div class="add_r f_fl">
			<div class="f_cb add_sv">
                <span class="clear_bd s_selt f_fl pt43 f_mr15">
                    <asp:DropDownList ID="dropSelectCount" runat="server" CssClass="pass_faq">
                        <asp:ListItem Value="5">5条(响应特快)</asp:ListItem>
                        <asp:ListItem Selected="True" Value="10">10条(响应非常快)</asp:ListItem>
                        <asp:ListItem Value="20">20条(响应很快)</asp:ListItem>
                        <asp:ListItem Value="30">30条(响应快)</asp:ListItem>
                        <asp:ListItem Value="50">50条(响应慢)</asp:ListItem>
                        <asp:ListItem Value="100">100条(响应比较慢)</asp:ListItem>
                    </asp:DropDownList>
                    <i class="revise_sub"></i>
                </span>
			</div>
            <i class="i_shortdesc">批量生成图片的时候，分割成每次生成多少条，建议每次在10～100条数据，防止数据量大，生成失败！</i>		
	    </div>
	</div>
    
	<div class="f_cb f_mt25">
		<label class="add_label f_fl">当前进度</label>
		<div class="add_r f_fl">
			<div class="f_cb add_sv">
                <div class="probar_side" style=" width:80%;">
                    <span class="probar_bg" id="ProgressBar" style="width:0%;">&nbsp;</span>
                    <span class="percent" id="ProgressBarTxt">0%</span>
                </div>
			</div>
	    </div>
	</div>
    
	<div class="f_cb f_mt25">
		<label class="add_label f_fl">正在生成栏目</label>
		<div class="add_r f_fl">
			<div class="f_cb add_sv">
               <span align="left" id="laySummery">0条</span>
			</div>
	    </div>
	</div>

    <div class="f_cb f_mt25">
        <label class="add_label f_fl">&nbsp;</label>
		<div class="add_r f_fl">
			<span class="e_btn1 f_csp " id="shengcheng"><i class="suc_icon"></i>生 成</span>
            <span class="e_btn1 f_csp dn" id="zhanding"><i class="pause_icon"></i>生成中</span>
	    </div>
    </div>

  </div>
 </div>
</form>
<script type="text/javascript">
    $(function () {
        var checkOneLoad = true;
        var shengcheng = false;
        var objlaySummery = $("#laySummery");
        var ProgressBar = $("#ProgressBar");
        var ProgressBarTxt = $("#ProgressBarTxt");
        var other = "";
        function Generate(ids, selectcount) {
            if (!shengcheng) {
                return;
            }
            $.ajax({
                type: "get",
                url: "MobileBatchImg_exporting.aspx?ids=" + ids + "&SelectCount=" + selectcount + "&checkOneLoad=" + checkOneLoad + "&other=" + other,
                cache: "false",
                success: function (msg) {
                    var data = {};
                    try {
                        data = jQuery.parseJSON(msg) || { "State": "complete" };
                    } catch (e) {
                        alert("parseJSON Error:\r\n" + msg);
                    }
                    if (data.State == "generation") {
                        var html = "正在压缩" + data.Title + "中...";
                        html += "，已处理" + data.RecordSetDill + "条记录";
                        if (data.SuccessCount > 0) {
                            html += "，成功处理" + data.SuccessCount + "条记录";
                        }
                        if (data.ErrorCount > 0) {
                            html += "，但有" + data.ErrorCount + "张图片处理失败";
                        }
                        objlaySummery.html(html);
                        var processer = Math.round(data.RecordSetDill / data.RecordSetSum * 100) + "%";
                        ProgressBar.css("width", processer);
                        ProgressBarTxt.html(processer);

                        other = "false";
                        setTimeout(function () {
                            Generate(ids, selectcount);
                        }, 1000);
                    } else if (data.State == "complete") {
                        _alert("图片压缩完成！", true);
                        $("#shengcheng").css("display", "inline-block");
                        $("#zhanding").hide()
                        shengcheng = false;
                        checkOneLoad = true;
                        objlaySummery.html("图片压缩完成！");
                        ProgressBar.css("width", "0%").html("&nbsp;");
                        ProgressBarTxt.html("0%");
                    } else if (data.State == "nodata") {
                        _alert("没有可压缩文件！");
                        $("#shengcheng").css("display", "inline-block");
                        $("#zhanding").hide()
                        shengcheng = false;
                        checkOneLoad = true;
                        objlaySummery.html("0条");
                        ProgressBar.css("width", "0%").html("&nbsp;");
                        ProgressBarTxt.html("0%");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        $("#shengcheng").bind("click", function () {
            var cbs = $("#columns input:checked");
            if (cbs.length == 0) {
                _alert("请选择要压缩的栏目");
                return;
            }
            $("#shengcheng").hide()
            $("#zhanding").css("display", "inline-block");
            shengcheng = true;

            var values = [];
            cbs.each(function () {
                values.push($(this).val());
            })
            values = values.join(',');
            var SelectCount = $("#dropSelectCount").val();

            objlaySummery.html("正在批量压缩图片,请稍等......");
            if (other == "") {
                if ($("#txtProductListW").length) {
                    other += ",product_" + $("#txtProductListW").val() + "x" + $("#txtProductListH").val() + ";" + $("#txtProductDetailW").val() + "x" + $("#txtProductDetailH").val();
                }
                if ($("#txtNewsListW").length) {
                    other += ",news_" + $("#txtNewsListW").val() + "x" + $("#txtNewsListH").val();
                }
                if ($("#txtHelpListW").length) {
                    other += ",help_" + $("#txtHelpListW").val() + "x" + $("#txtHelpListH").val();
                }
                if ($("#txtAgentListW").length) {
                    other += ",agent_" + $("#txtAgentListW").val() + "x" + $("#txtAgentListH").val();
                }
                if ($("#txtProjectListW").length) {
                    other += ",project_" + $("#txtProjectListW").val() + "x" + $("#txtProjectListH").val() + ";" + $("#txtProjectDetailW").val() + "x" + $("#txtProjectDetailH").val();
                }
            }
            if (checkOneLoad) {
                ProgressBar.css("width", "0%").html("&nbsp;");
                ProgressBarTxt.html("0%");
            }
            Generate(values, SelectCount);

            checkOneLoad = false;
        })
        $("#zhanding").bind("click", function () {
            shengcheng = false;
            $("#shengcheng").css("display", "inline-block");
            $("#zhanding").hide()
        })
    })
</script>
</body>
</html>
