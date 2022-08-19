<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.WXNews_lite, qwt" enableviewstate="false" enableeventvalidation="false" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%= ItemName %></title>
<%--    <style type="text/css">
        .hdong { border: solid 1px #9F9F9F; display: none; position: absolute; width: 300px; height: 190px; padding: 1px; z-index: 1000; margin-left: 40px; margin-top: 50px; }
        .hdong img { width: 300px; height: 190px; }
        .wx_pic{ width:140px;height:140px;}
        .addwx { margin-left:10px; color:#83D2F4; font-weight:bold;}
    </style>--%>
    <script type="text/javascript">
        //动态显示图片的预览
        function ShowFilesType(src) {
            $(".hdong").children().attr("src", $(src).parent().parent().prev().html());
            $(".hdong").show();
        }
        function HideFilesType(src) {
            $(".hdong").hide();
        }
    </script>
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
<%if (!string.IsNullOrEmpty(QS("popid")))
  { %>
<style type="text/css">
    body{ height:540px; overflow:hidden; overflow-y:auto;}
    #PrintContent{padding:0 10px;}
    .nsw_bread_tit{ height:40px;}
    .advanced_so{ padding-top:5px;}
    .nsw_check_btns{padding:5px 0;}
    table.nsw_pro_list th{ padding:10px 3px}
    table.nsw_pro_list td{padding:5px 2px;}
    table.nsw_pro_list td .text2
    {
    width:200px;
  word-break:break-all;
  display:-webkit-box;
  -webkit-line-clamp:3;
  -webkit-box-orient:vertical;
  overflow:hidden;;}
    table.nsw_pro_list td img{max-width:80px; max-height:80px;}
</style>
<%} %>
<form id="Form2" runat="server">
<div class="so_bread">
    <div class="nsw_bread_tit f_cb">
	    <div class="advanced_so f_fr form_search">
            <span class=" f_fl mr10 lh27">选择：</span>
            <span class="clear_bd s_selt f_fl mr10 w140">
                <asp:DropDownList runat="server" ID="checktype" class="pass_faq pl5">
                    <asp:ListItem Text="微信图文" Value="1" />
                    <asp:ListItem Text="站内信息" Value="2" />
                </asp:DropDownList>
                <i class="revise_sub"></i>
            </span>
            <asp:Button runat="server" OnClick="ddlColumns_SelectedIndexChanged" ID="btnColumn" Style="display: none;" CausesValidation="false" />
            <span class="clear_bd s_selt f_fl mr10 w140">
                <asp:DropDownList runat="server" ID="checktypeinfo" class="pass_faq pl5"></asp:DropDownList>
                <i class="revise_sub"></i>
            </span>
            <asp:HiddenField runat="server" ID="hdnchecktype" /><!--微信1 站内2-->
            <asp:HiddenField runat="server" ID="hdnchecktypeinfo" /><!--栏目-->
            <asp:HiddenField runat="server" ID="hdnnewsColumns" /><!--资讯-->
            <asp:HiddenField runat="server" ID="hdnproductColumns" /><!--产品-->
            <asp:HiddenField runat="server" ID="hdnagentColumns" /><!--招商-->
            <asp:HiddenField runat="server" ID="hdnprojectColumns" /><!--方案-->
            <asp:HiddenField runat="server" ID="hdnhelpColumns" /><!--帮助-->
            <span class="clear_bd s_selt f_fl mr10 w140">
                <asp:DropDownList runat="server" ID="checktypecolumn" class="pass_faq pl5"></asp:DropDownList>
                <i class="revise_sub"></i>
            </span>
            <asp:HiddenField runat="server" ID="hdnchecktypecolumn" /><!--资讯-->
		</div>
        <div class="clear"></div>
    </div>
</div>
<div class="col_main" id="PrintContent">
    <!-- 列表区 开始 -->
    <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
        <tr id="tabHeader">
            <th style="width:50px" class="p"><span class="cho"></span></th>
            <th style="width: 120px">
                标题
            </th>
            <th style="width: 80px">
                作者
            </th>
            <th style="width: 140px">
                图片
            </th>
            <th style="width: 200px">
                简介
            </th>
            <th style="width: 50px">
                封面
            </th>
            <th style="width: 50px">
                源地址
            </th>
            <th axis="[InputTime]" style="width: 110px">
                录入时间
            </th>
        </tr>
        <asp:Repeater ID="rptMain" runat="server">
            <ItemTemplate>
                <tr>
                    <td class="td1">
                        <div class="nsw_check_box">
                            <span class="ck_box">
                                <span class="dn">
                                    <input type="checkbox" name="chkItem" value="<%#Eval("ID") %>"/>
                                </span>
                            </span>
                        </div>
                    </td>
                    <td>
                        <a href="javascript:;" addt="edit(event,<%#Eval("ID") %>)"><%#Eval("Title")%></a>
                    </td>
                    <td>
                        <%#Eval("Author")%>
                    </td>
                    <td class="tac">
                        <img class="wx_pic" src="<%#Eval("photopath") %>" />
                    </td>
                    <td class="tac">
                        <div class="text2"><%#Eval("shortdesc") %></div>
                    </td>
                    <td class="tac"><div class="set_radios"><span><input type="radio" <%#NSW.ComUtls.ParseBool(Eval("IsCoverPic").ToString(),false)?"checked=\"checked\"":""%>/><label></label></span></div></td>
                    <td class="tac">
                        <a href="<%#Eval("baseurl")%>" target="_blank">查看</a>
                    </td>
                    <td class="tac">
                        <%# ( (DateTime)Eval("InputTime") ).ToString("yyyy-MM-dd HH:mm")%>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Repeater ID="rptx" runat="server">
            <ItemTemplate>
                <tr>
                    <td class="td1">
                        <div class="nsw_check_box">
                            <span class="ck_box">
                                <span class="dn">
                                    <input type="checkbox" name="chkItem" value="<%#Eval("ID") %>"/>
                                </span>
                            </span>
                        </div>
                    </td>
                    <td>
                        <a href="###" onclick="edit(event,<%#Eval("ID") %>)"><%#Eval("Title")%></a>
                    </td>
                    <td>
                                    
                    </td>
                    <td class="tac">
                        <img class="wx_pic" src="<%#  string.IsNullOrEmpty(Eval("MobilePath").ToString()) ? (string.IsNullOrEmpty(Eval("PhotoPath").ToString()) ? "" : "/Mobile" + Eval("PhotoPath") + "_" + Eval("Width") + "X" + Eval("Height") + ".jpg") : Eval("MobilePath").ToString()%>" />        
                    </td>
                    <td class="tac">
                        <div class="text2"><%#Eval("shortdesc") %></div>
                    </td>
                    <td class="tac"><div class="set_radios"><span><input type="radio" <%#string.IsNullOrEmpty((string.IsNullOrEmpty(Eval("MobilePath").ToString()) ? (string.IsNullOrEmpty(Eval("PhotoPath").ToString()) ? "" : "/Mobile" + Eval("PhotoPath") + "_" + Eval("Width") + "X" + Eval("Height") + ".jpg") : Eval("MobilePath")).ToString()) ?"checked=\"checked\"":""%>/><label></label></span></div></td>
                    <td class="tac">
                        <a href="<%#Eval("mobilepage")%>" target="_blank">查看</a>
                    </td>
                    <td class="tac">
                        <%# ( (DateTime)Eval("InputTime") ).ToString("yyyy-MM-dd HH:mm")%>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr id="noItemYet" runat="server" visible="false">
            <td class="noItemYet" colspan="99" style=" text-align:center;">
                没有任何内容
            </td>
        </tr>
    </table>
    <!-- 列表分页 开始 -->
    <div class="nsw_tools_bar f_cb">
	    <ul class="nsw_check_btns f_fl">
		    <li class="f_ml20">
                <span class="sele_all"><input type="radio" class="dn" /><em class="e_word"></em>全选</span>|
                <span class="sele_inverse">反选</span>|
                <span class="sele_add" onclick="addWeiXinList();">添加</span>
            </li>
		    <li class="f_ml20 tools">
                <asp:LinkButton ID="del" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click2"><span>删除</span></asp:LinkButton>|
                <span class="span_refresh">刷新</span>
            </li>
	    </ul>
	    <div class="nsw_pagination f_fr f_mr20 f_cb">
            <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	    </div>
    </div>
    <!-- 列表分页 结束 -->
</div>
</form>
<script type="text/javascript">
    var popid = '<%=QS("popid") %>';
    $(function () {
//        alert(__oran_qs("qstype"));
        if (!__oran_qs("qstype")) {
            //正常访问
            $(".wxselect").hide();
            $(".addwx").hide();
        } else {
            //ifram访问
            $(".tools").hide();
            //不让点击
            edit = function () { }
        }
    });
    //添加
    function addWeiXinList() {
        var data = {};
        data.types = $("#hdnchecktype").val(); //微信1 站内2
        data.typesinfo = $("#hdnchecktypeinfo").val(); //站内的类型
        var $chks = $("#PrintContent input[name='chkItem']:checked");
        var value = "";
        if ($chks.length) {
            $chks.each(function () {
                value += $(this).val() + ",";
            });
        }
        data.dataid = value;
        if (value == "") {
            _alert("请选择要添加的微信信息");
            return;
        } else {
            //回调
            __callback(data, popid, "True");
            $chks.parents("span.ck_box ").removeClass("z_select").find("input").attr("checked", false);
        }
    }
    //文章类型
    $("#checktype").change(function () {
        if ($(this).val() == "1") {//微信
            var types = $("#hdnchecktype").val();
            if (types == 2) {
                $("#hdnchecktype").val("1");
                $("#btnColumn").click();
            }
            $("#checktypeinfo,#checktypecolumn").parent().hide();
        } else {
            $("#checktypeinfo").parent().show();
        }
    }).trigger("change");

    //选择栏目
    $("#checktypeinfo").change(function () {
        var value = $(this).val();
        if (value != "") {
            $("#hdnchecktypeinfo").val(value);
            $("#checktypecolumn").html($("#hdn" + value + "Columns").val());
            $("#checktypecolumn").parent().show();
        }
    }); 

    //设置选择的栏目
    if ($("#hdnchecktypeinfo").val() != "") {
        var value = $("#hdnchecktypeinfo").val();
        $("#checktypeinfo option[value='" + value + "']").attr("selected", true);
        $("#checktypecolumn").html($("#hdn" + value + "Columns").val());
    }

    //设置选择的分类
    if ($("#hdnchecktypecolumn").val() != "") {
        $("#checktypecolumn option[value='" + $("#hdnchecktypecolumn").val() + "']").attr("selected", true);
    }
    //分类
    $("#checktypecolumn").change(function () {
        $("#hdnchecktype").val("2");
        $("#hdnchecktypecolumn").val($(this).val());
        $("#btnColumn").click();
    });

    function __oran_qs(paraNm) {
        var args = new Object();
        var query = location.search.substring(1);
        var pairs = query.split("&");
        for (var i = 0; i < pairs.length; ++i) {
            var pos = pairs[i].indexOf('=');
            if (!pos) continue;
            var paraNm2 = pairs[i].substring(0, pos);
            var vlu = pairs[i].substring(pos + 1);
            vlu = decodeURIComponent(vlu);
            args[paraNm2] = vlu;
        }
        return args[paraNm];
    }

</script>
</body>
</html>
