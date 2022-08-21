<%@ page language="C#" autoeventwireup="True" enableeventvalidation="false" inherits="NSW.Web.Manager.selecttag, qwt" enableviewstate="true" maintainscrollpositiononpostback="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%= ItemName %></title>
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
<body style="width:700px;">
<div class="f_cb pro_fast_edit">
	<div class="add_tile_tab add_nobd f_cb">
		<ul class="f_cb addtab_ul addmark_ul j_recordCon f_fl">
			<li class="active li1"><em class="zline1"></em><em class="zline2"></em>列表</li>
			<li class="li6"><em class="zline1"></em><em class="zline2"></em><i class="addtab_mark">添加</i></li>
		</ul>						
	</div>
	<div class="j_recordCon_c f_cb">
	    <!-- 标签列表 -->
		<div class="mark_box cont_2">
			<div class="mark_cont1">
				<div class="mark_hide">
					<ul class="mark_list1 f_cb">
                        <%=GetHtml() %>
					</ul>
				</div>				
			</div>
			<div class="view_btn f_tac f_mt20">
<%--                <span class="e_btn1 f_csp queding"><i class="sure_icon"></i>保 存</span>
                <span class="e_btn2 f_ml35 f_csp quxiao"><i class="cancel_icon"></i>取 消</span>--%>
                <span class="e_btn2 f_csp quxiao"><i class="cancel_icon"></i>取 消</span>
            </div>
		</div>
	    <!-- 标签列表 end-->
						
	    <!-- 标签添加 -->
		<div class="mark_box f_dn cont_2">
            <form runat="server">
			    <div class="mark_cont1" style=" height:300PX;">
				    <div class="f_cb">
					    <label class="add_label f_fl"><i class="red_point">*</i>标签名称</label>
					    <div class="add_r f_fl">
						    <div class="f_cb add_sv">
							    <span class="clear_bd f_fl p_inp3 "><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="32" ID="txtTitle" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                                <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
						    </div>
					    </div>
				    </div>
										
				    <div class="f_cb f_mt25">
					    <label class="add_label f_fl"><span class="f_pdl15">标签所属栏目</span></label>
					    <div class="add_r f_fl">
						    <div class="f_cb add_sv">
							    <span class="clear_bd s_selt f_fl pt64 f_mr15">
                                    <asp:DropDownList ID="ddlColumnsSource" CssClass="pass_faq" runat="server"></asp:DropDownList>
								    <i class="revise_sub"></i>
							    </span>
						    </div>					
					    </div>
				    </div>

				    <div class="f_cb f_mt25 f_mb25">
					    <label class="add_label f_fl"><span class="f_pdl15">标签超链接</span></label>
					    <div class="add_r f_fl">
						    <div class="f_cb add_sv">
							    <span class="clear_bd f_fl p_inp3"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="300" ID="txtURL" validtype="url_" tipPosition="top" runat="server" temp="请在此填写标签的链接如：http://www.baidu.com 或 /sitemap.html"></asp:TextBox><i class="clear_x"></i></span>
						    </div>
						    <span class="inp_tips_gray f_lht27 f_db f_ib_"></span>
					    </div>
				    </div>
			    </div>
			    <div class="view_btn f_tac f_mt20">
                    <span class="e_btn1 f_csp"><i class="save_icon"></i><asp:Button ID="btnSave" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);"/></span>
                    <span class="e_btn2 f_ml35 f_csp quxiao"><i class="cancel_icon"></i>取 消</span>
                </div>
            </form>
		</div>
	</div>				
</div>
</body>
<script type="text/javascript">
    $(function () {
        var obj = parse_url(window.location.href);
        var popid = obj["popid"] || "__";
        var pop = window.top.$("#" + popid);
        var input = pop.data("input");

        $(window).bind("load", function () {
            if (pop.length) {
                pop.trigger("reset");
            }
        })
        $(".mark_list1 li").click(function () {
            var me = $(this);
            var oid = me.attr("oid");
            me.addClass("zon").siblings("li").removeClass("zon");
            $("div.mark_content[oid='" + oid + "']").show().siblings("div.mark_content").hide();
        }).eq(0).click();

        if (input) {
            $(".mk_ul em").bind("click", function () {
                var me = $(this);
                var text = me.text().trim();
                var value = input.val().trim();
                me.toggleClass("zon");
                var arr = value ? value.split(",") || [] : [];
                var index = jQuery.inArray(text, arr);
                var update = false;
                if (me.hasClass("zon")) {
                    if (index == -1) {
                        arr.push(text);
                        update = true;
                    }
                } else {
                    if (index > -1) {
                        arr.removeAtIndex(index);
                        update = true;
                    }
                }
                if (update) {
                    input.val(arr.join(",")).trigger("hasValue").trigger("keyup");
                }
            });
        }
    })
</script>
</html>
