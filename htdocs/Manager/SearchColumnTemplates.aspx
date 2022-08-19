<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.SearchColumnTemplates, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%= ItemName %></title>
    <link href="skins/base/template.css" rel="stylesheet" type="text/css"/>
    <link href="skins/base/products.css" rel="stylesheet" type="text/css"/>
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
<style>
div.album_select{ margin-top:10px;}
div.viewlist{margin-top:10px;}
div.view_area{ height:165px;}
div.insertList{padding-top:18px;}
div.padlr20{ padding:0 10px 29px 12px;padding-bottom:0;}
</style>
<form id="form1" runat="server">
    <div class="photo_block">
		<!-- 选择相册 -->
		<div class="loadbar f_cb f_ml20 form_search">
            <label class="f_fl f_mr25">请选择分类</label>
			<span class="clear_bd f_fl cho_album">
				<asp:DropDownList ID="ddlColumnID" CssClass="pass_faq" runat="server"></asp:DropDownList>
				<i class="revise_sub"></i>
			</span>
			<label class="f_fl f_ml25 f_mr20">模版名称</label>
			<div class="search_so f_fl">
				<input class="so_text f_fl clear_word" name="kwd" type="text" />
				<input class="so_btn f_csp f_fl" type="button" onclick="SearchObjectByGet(this)" />
                <asp:HiddenField runat="server" ID="popid"/>
                <input type="hidden" name="page"/>
                <input type="hidden" name="type"/>
                <input type="hidden" name="types"/>
			</div>
		</div>
		<!-- 选择相册 end-->
	</div>
	<div class="acc_cont_x padlr20 f_cb" style="height:290px;">
        <div class="album_select f_mt20">
		    <ul class="f_cb">
                <asp:Repeater ID="rptMain" runat="server"><ItemTemplate>
			    <li tempid="<%#Eval("ID") %>" id="p_<%#Eval("ID") %>">
                    <i class="v_select"></i>
                    <i class="pro_view"></i>
                    <a href="javascript:;"><img src="<%#Eval("PhotoPath") %>" big="<%#Eval("PhotoName") %>" title="<%#Eval("Title") %>" /></a>
                    <p title="<%#Eval("Title") %>"><%#Eval("Title") %></p>
                    <p title="<%#Eval("URL") %>"><%#Eval("URL")%></p>
                </li>
                </ItemTemplate></asp:Repeater>
                <li style="width: 100%;text-align: center; line-height:125px; border:0;" id="noItemYet" runat="server" visible="false">暂无模版...</li>
		    </ul>
	    </div>
    </div>
    <!-- 列表分页 开始 -->
    <div class="nsw_tools_bar f_cb mt20" style=" margin-top:-10px;">
	    <div class="nsw_pagination f_fr f_mr20 f_cb">
            <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	    </div>
    </div>
    <!-- 预览图列表 end-->
    <div class="view_btn f_tac f_mt15 pl20">
        <span class="e_btn1 f_csp">
            <i class="insert_icon"></i>
            <input type="button" value="立即下载" onclick="_ValidateForm(this);"/>
            <asp:HiddenField runat="server" ID="hdSelectTemp"/>
        </span>
        <span class="e_btn2 f_ml35 f_csp"><i class="viewCancle_icon"></i>取 消</span>
    </div>
</form>
</body>
<script type="text/javascript">
    var AddTemp = function (src) {
        _alert("验证通过，正在努力下载解压中，请耐心等候....", true, null, 100000, false);
        $(src).attr("disabled", "disabled");
        loadJs("js/other/ajax.js", function () {
            _PostAjax("templateDownload", { type: '<%=Type %>',page:"<%=Pages %>", tempid: $tv("hdSelectTemp")}, function (data) {
                _alert("请求完成。", true, null, 50);
                data = _Json(data);
                if (data.error == 1) {
                    _alert("已解压完成...", true, null, 50);
                    __callback({datasrc:data.msg},"<%=QS("popid") %>",false);
                    HidePop();
                } else {
                    _alert(data.msg);
                }
                $(src).attr("disabled",false);
            })
        })
    }
    var _ValidateForm = function (src) {
        if (!$(".album_select li.zon").length) {
            _alert("请选择您要使用的模版！");
            return false;
        }
        if($(src).attr("disabled")=="disabled"){
            return false;
        }
        $(src).attr("disabled","disabled");
        loadJs("js/other/ajax.js", function () {
            _alert("正在验证中，请稍后....", true, null, 100000, false);
            $("#hdSelectTemp").val($(".album_select li.zon").attr("tempid"));
            _PostAjax("checkTemp", { type: '<%=Type %>',"page":"<%=Pages %>",tempid: $tv("hdSelectTemp") }, function (data) {
                _alert("请求完成。", true, null, 50);
                data = _Json(data);
                $(src).attr("disabled",false);
                if (data.error == 1) {
                    _confirm("模版已经存在，是否覆盖本地？", function () {
                        AddTemp(src);
                    });
                } else if (data.msg == "文件夹不存在") {
                    AddTemp(src);
                } else {
                    _alert(data.msg);
                }
            })
        })
        return true;
    }
    //点击图片展示效果
    var pictureEnlarge = function (src) {
        loadCss("skins/fancybox/jquery.fancybox.css", window.top.document);
        loadJs("js/easyui/jquery.fancybox.js", function () {
            window.top.$.fancybox.open(
                [
                    {
                        href: src,
                        title: ' '
                    }
                ], {
                    _autoWidth: true,
                    autoResize: false,
                    autoSize:false
                }
            );
        }, window.top.document);
    }
    $(function () {
        $(document).on("click",".album_select li",function(event){
            if (event.target.TagName && event.target.TagName==="I"){
                return;
            }
            $(this).addClass("zon").siblings("li").removeClass("zon");
        })
        $(".album_select i.pro_view").bind("click", function (event) {
            event.stopPropagation();
            var img = $(this).next("a").find("img");
            var big = img.attr("big");
            if (big || big.indexOf('nopic.jpg') > 0) {
                big = img.attr("src");
            }
            pictureEnlarge(big);
        });
    })
</script>
</html>
