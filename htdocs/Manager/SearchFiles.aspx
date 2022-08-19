<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.SearchFiles, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %></title>
    <link href="skins/base/attachment.css" rel="stylesheet" type="text/css"/>
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
#searchFiles .insertList{ padding-top:5px;}
#searchFiles .view_area{height:125px;}
#searchFiles .md_hide01{ height:auto;}
#searchFiles .md_hide_{ height:156px; overflow-y:auto;}
</style>
<form id="searchFiles" runat="server">
    <div class="photo_block">
		<!-- 选择相册 -->
		<div class="loadbar f_cb f_ml20 form_search">
            <label class="f_fl f_mr25">请选择目录</label>
			<span class="clear_bd f_fl cho_album">
				<asp:DropDownList ID="ddlColumnID" CssClass="pass_faq" runat="server"></asp:DropDownList>
				<i class="revise_sub"></i>
			</span>
			<label class="f_fl f_ml25 f_mr20">附件名称</label>
			<div class="search_so f_fl">
				<input class="so_text f_fl clear_word" name="kwd" type="text" />
                <input type="hidden" name="" value="[Title]|[SrcFilename]" name="field" />
				<input class="so_btn f_csp f_fl" type="button" onclick="SearchObjectByGet(this)" />
			</div>
		</div>
		<!-- 选择相册 end-->
	</div>
	<div class="acc_cont_x padlr20 f_cb insertList">
        <div class="md_hide_">
            <div class="f_mt20 md_hide md_hide01">
		        <ul class="annex_list clearfix">
                    <asp:Repeater ID="rptMain" runat="server"><ItemTemplate>
                    <li id="f_<%#Eval("ID") %>"><em class="e_word f_fl" fileid="<%#Eval("ID") %>" src="<%#Eval("Path") %>" title="<%#Eval("Title") %>"></em><span class="annex_numb"><%#(Container.ItemIndex+1).ToString().PadLeft(2, '0')%></span><span class="ann_tx"><%#Eval("Title") %></span></li>
                    </ItemTemplate></asp:Repeater>
                    <li style="width: 100%;text-align: center; height:125px; overflow:auto;line-height:125px; border:0; margin:0; padding:0; width:100%;" runat="server" visible="false" id="noImg">暂无附件...</li>
		        </ul>
	        </div>
        </div>
	    <!-- 预览图列表 -->
	    <div class="viewlist bord_gray f_mt20">
		    <div class="view_tips">预览插入的附件</div>
		    <div class="view_area">
			    <div class="insertList f_cb" id="insertList" style=" display:block;">
					<div class="md_prev f_fl f_csp" id="prev_01"><img src="skins/Img/leftjt.gif" /></div>
					<div class="md_hide ann_hide f_fl">
                        <div style="position:relative; width:2000px; overflow:hidden;" id="annex_list">
                            <div class='fl ul_warp'><ul class="annex_list clearfix"></ul></div>
                        </div>
					</div>
					<div class="md_next f_fl f_csp" id="next_01"><img src="skins/Img/rightjt.gif" /></div>
				</div>
		    </div>	
	    </div>
    </div>
    <span id="SetUpload_"></span>
</form>
</body>
<script type="text/javascript">
    $(function () {
        var prev_01 = $("#prev_01");
        var next_01 = $("#next_01");
        var src = $("#annex_list");
        var width = 568;
        next_01.bind("click", function () {
            var left = parseInt(src.css("left"));
            left = isNaN(left) ? 0 : left;
            var lis = src.children();
            var max = lis.length;

            var _left = left > 0 ? left : -(left);
            _left = _left / width + 1;

            if (_left < max) {
                src.stop(true, true).animate({ "left": -_left * (width) }, 500);
            } else {
                src.stop(true, true).animate({ "left": 0 }, 500);
            }
        })
        $(prev_01).bind("click", function () {
            var left = parseInt(src.css("left"));
            left = isNaN(left) ? 0 : left;

            if (left < 0) {
                src.stop(true, true).animate({ "left": left + (width) }, 500);
            } else {
                var lis = src.children();
                var max = lis.length - 1;
                src.stop(true, true).animate({ "left": -max * (width) }, 500);
            }
        })
        src.bind("_change_", function () {
            var lis = src.children();
            var max = lis.length;
            src.stop(true, true).animate({ "left": -(width * max) }, 500);
        })
    })
</script>
<script src="js/common/edit.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        var max = window.parent._MAX_ || 12;
        $("#max").text(max);
        var div = $("#annex_list");
        $(".md_hide_ li ").bind("click", function (event) {
            var me = $(this).find("em.e_word");
            if (me.hasClass("z_select")) {
                var _current = $("#n_f_" + me.attr("fileid"));
                if (_current.siblings().length == 0) { _current.parents(".ul_warp").remove(); } else { _current.remove(); }
                me.removeClass("z_select");
            } else {
                if (div.find("li").length > max - 1) {
                    _alert("附件限" + max + "个！", false);
                    return;
                } else {
                    me.addClass("z_select");
                    var li = me.parent("li").clone();
                    var ul = div.find("ul:last");
                    if (ul.length == 0) { div.append("<div class='fl ul_warp'><ul class='annex_list clearfix'></ul></div>"); ul = div.find("ul:last"); }
                    if (ul.find("li").length > 5) {
                        div.append("<div class='fl ul_warp'><ul class='annex_list clearfix'></ul></div>");
                        ul = div.find("ul:last");
                    }
                    ul.append(li);
                    li.attr("id", "n_" + li.attr("id"));
                    li.append('<em class="annex_dele"></em>')
                }
            }
            Reset();
        })
        function Reset() {
            div.find("span.annex_numb").each(function (i) {
                i++;
                i = i > 9 ? i : ('0' + i);
                $(this).text(i);
            })
        }
        $(document).on("click", "#annex_list em.annex_dele,#annex_list em.e_word", function () {
            var li = $(this).parents("li");
            $("#" + li.attr("id").replace("n_", "")).find("em.e_word").removeClass("z_select");
            if (li.siblings().length == 0) { li.parents(".ul_warp").remove(); } else { li.remove(); }
            Reset();
        })
        $(window.parent.document.body).find("#_count_").text("<%=Count %>");
    })
    window._clear_ = function () {
        $("#annex_list em.annex_dele").click();
    }
</script>
</html>
