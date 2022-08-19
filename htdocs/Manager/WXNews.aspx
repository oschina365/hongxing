<%@ page language="C#" autoeventwireup="True" enableeventvalidation="false" inherits="NSW.Web.Manager.WXNews, qwt" enableviewstate="true" enableviewstatemac="false" %>

<%@ Register Src="Inc/uc/XuanZe.ascx" TagName="XuanZe" TagPrefix="XuanZe" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %>（<%= OID > 0 ? "Object ID: " + OID : "新建对象" %>）</title>
    <link href="skins/base/news.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
    .appmsg{ width:335px; float:left; overflow:hidden;}
    .add_r>div.appmsg,.add_r>div.media_edit_area{ margin:0;}
    .add_r .media_edit_area{ width:436px;}
    .add_label {
        width: 124px;
        padding-left: 18px;
        line-height: 27px;
    }
    .add_r {width: 84%;}
    .nsw_check_box.w80{ width:auto; margin-right:8px;}
    </style>
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
<script type="text/javascript">
    window.EditPage = true;
    window.Ueditor_Data = {
        afterBlur: function () {
            var div = $("div.appmsg_content div.current");
            if (div.length) {
                div.find("textarea").val(this.unhtml(this.html()));
            }
        }
    }
    $(function () {
        $("#edit_thumb").bind("change_", function () {
            var div = $("div.appmsg_content div.current");
            var val = $(this).val();
            if (div.length) {
                div.attr("edit_thumb", val).addClass("has_thumb").find("img.appmsg_thumb").attr("src", val);
            }
        })
        var content = $("#hdContent").val();
        if (content) {
            $("#hdContent").val("");
            var sigledata = content.split("$#$");
            var appmsgitem1 = $("#appmsgitem1");
            if (sigledata && sigledata.length) {
                appmsgitem1.attr("edit_title", sigledata[0]);
                appmsgitem1.attr("edit_author", sigledata[1]);
                var src = sigledata[2];
                if (src) {
                    $("#appmsgitem1 img").attr("src", src).show();
                    if (window._imgs_) {
                        window._imgs_.ShowImg();
                    }
                }
                appmsgitem1.attr("edit_thumb", src);
                appmsgitem1.attr("checkfrm", sigledata[3]);
                appmsgitem1.attr("editor_desc", sigledata[4]);
                appmsgitem1.find("textarea").val(sigledata[5]);
                appmsgitem1.attr("editor_url", sigledata[6]);
            }
        }
    })
</script>
<CurrentPosition:CurrentPosition runat="server" ID="currentPosition"/>
<link href="Skins/wechat.css" rel="stylesheet" type="text/css" />
<div class="col_main">
    <form id="form2" runat="server" onsubmit="return saveWXGroup();top.refreshList=true;">
	    <div class="add_cont pad300 j_recordCon_c f_cb">
	        <!-- 帮助基本信息 -->
            <div class="cont1">
				<div class="f_cb">
					<label class="add_label f_fl"><i class="red_point">*</i>群发公众号</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd s_selt f_fl pt43 f_mr15">
                                <asp:DropDownList ID="ddlColumnID" OnSelectedIndexChanged="initchange" AutoPostBack="true" runat="server"  CssClass="pass_faq">
                                    <asp:ListItem Value="1" Selected="True">文本</asp:ListItem>
                                    <asp:ListItem Value="2">图文</asp:ListItem>
                                </asp:DropDownList>
								<i class="revise_sub"></i>
							</span>
						</div>
					</div>
				</div>
                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><i class="red_point">*</i>群发消息名称</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">给所群发的消息起个名字，方便自己区分和查找。</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">
                        <i class="red_point">*</i>群发消息内容<br />
                        <span id="Related" style="display:block; border:1px solid #dcdcdc; width:100px; text-align:center; height:28px; line-height:28px; margin-top:5px; cursor:pointer;">
                            <i class="addtab_mark"></i>
                            添加已有内容
                        </span>
                    </label>
					<div class="add_r f_fl">
                        <div class="appmsg multi editing">
                            <div class="appmsg_content">
                                <div class="appmsg_itemmain appmsg_item" id="appmsgitem1">
                                    <div class="appmsg_info">
                                        <div class="appmsg_date"></div>
                                    </div>
                                    <div class="cover_appmsg_item">
                                        <h4 class="appmsg_title">
                                            <a href="javascript:;">标题</a>
                                        </h4>
                                        <div class="appmsg_thumb_wrp">
                                            <img class="appmsg_thumb" src="" />
                                            <i class="appmsg_thumb default">封面图片</i>
                                        </div>
                                        <div class="appmsg_edit_mask">
                                            <a class="icon18_common edit_gray js_edit" href="javascript:;">编辑</a>
                                        </div>
                                        <div class="arrow_in"></div>
                                        <textarea></textarea>
                                    </div>
                                </div>
                                <a href="javascript:;" id="appmsgadd" class="appmsg_add"><i>+</i> </a>
                            </div>
                        </div>
                        <div class="media_edit_area" id="iframe_found">
                            <div class="inner">
                                <div class="appmsg_edit_item">
                                    <label for="" class="frm_label">标题</label>
                                    <span class="frm_input_box">
                                        <span class="clear_bd">
                                            <input type="text" class="txt frm_input js_title com_input clear_word" id="edit_title" />
                                            <i class="clear_x"></i>
                                        </span>
                                    </span>
                                </div>
                                <div class="appmsg_edit_item">
                                    <label for="" class="frm_label">
                                        <strong class="title">作者</strong>
                                        <p class="itips l">（选填）</p>
                                    </label>
                                    <span class="frm_input_box">
                                        <span class="clear_bd">
                                            <input type="text" class="txt frm_input js_author com_input clear_word" id="edit_author" />
                                            <i class="clear_x"></i>
                                        </span>
                                    </span>
                                </div>
                                <div class="appmsg_edit_item">
                                    <label for="" class="frm_label">
                                        <strong class="title">封面</strong>
                                        <p class="js_cover_tip itips">（大图片建议尺寸：900像素 * 500像素 jpg或png格式 <em style="display:none;">文件大小不能超过1M</em>）</p>
                                        <p class="js_cover_tip itips othertip" style="display:none;">（小图片建议尺寸：200像素 * 200像素 jpg或png格式 <em style="display:none;">文件大小不能超过64KB</em>）</p>
                                    </label>
                                    <div class="btns">
                                        <div class="f_fl f_csp upload_img"><span><em class="load_small"></em>点击上传</span></div>
                                        <input id="edit_thumb" type="hidden" value="" />
                                        <p class="frm_tips">
                                            <p class="clear"></p>
                                            <p class="nsw_check_box mt10">
                                                <span class="ck_box mt5">
                                                    <input type="checkbox" class="frm_checkbox dn" id="checkfrm" onclick="editorFRMClik(this);" />
                                                </span>
                                                <label class="ck_text">封面图片显示在正文中</label>
                                            </p>
                                        </p>
                                        <script type="text/javascript">
                                            $(function () {
                                                var btn = $("div.upload_img");
                                                btn.bind("click", function () {
                                                    _alert("正在加载插件，请稍后重试...");
                                                })
                                                var related = $("#Related");
                                                related.bind("click", function () {
                                                    _alert("正在加载插件，请稍后重试...");
                                                })
                                                loadJs("js/common/editor.js", function () {
                                                    btn.unbind("click");
                                                    related.unbind("click");
                                                    window._imgs_ = new img_gallerywindow($("div.upload_img"), {
                                                        input: "edit_thumb",
                                                        directory: "qt",
                                                        max: 1
                                                    });
                                                    window.WXNews_ = new WXNews($("div.upload_img"), {
                                                        UpdateCallback: function (data) {
                                                            initSelectValue(data.data);
                                                            var me = this;
                                                            me.hide();
                                                        }
                                                    });
                                                    related.bind("click", function () {
                                                        window.WXNews_.show();
                                                    })
                                                })
                                            })
                                        </script>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="js_desc_area appmsg_edit_item dn" style="display:none;">
                                    <label for="" class="frm_label"><strong class="title">摘要</strong><p class="itips l">（选填）</p></label>
                                    <div class="frm_textarea_box">
                                        <div class="f_cb add_typeset bord_gray">
						                    <textarea name="txtVideoCode" rows="2" cols="20" id="editor_desc" class="js_desc frm_textarea text_area tx1"></textarea>
					                    </div>
                                    </div>
                                </div>
                                <div class="js_desc_area dn appmsg_edit_item">
                                    <label for="" class="frm_label">正文</label>
                                    <NSW:UEditor ID="Ueditor" runat="server" Width="500" SimpleMode="true" />
                                </div>
                                <div class="js_url_area dn appmsg_edit_item">
                                    <label for="" class="frm_label">
                                        <strong class="title">原文链接</strong><p class="itips l">（选填）</p>
                                    </label>
                                    <span class="frm_input_box">
                                        <span class="clear_bd">
                                            <input type="text" class="txt frm_input js_url com_input clear_word" id="editor_url" />
                                            <i class="clear_x"></i>
                                        </span>
                                    </span>
                                </div>
                                <div class="js_url_area dn appmsg_edit_item" id="appmsg_view">
                                    <input type="button" value="点击查看左侧预览" class="appmsg_view" id="appmsg_views" />
                                </div>
                            </div>
                            <p class="clear"></p>
                        </div>
                        <p class="clear"></p>
					</div>
				</div>

                <%--
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">选择用户组</span></label>
                    <div class="add_r f_fl">
                        <dl class="sv_checkbox f_fl" style=" height:auto;width:40%;">
                            <dt class="pr">
                                用户组
                            </dt>
			                <dd style=" height:auto; width:100%;">
                                <asp:ListBox runat="server" ID="listgroup"  SelectionMode="Multiple" class="pass_faq fl_select" Width="100%" Height="250px"></asp:ListBox>
                                <textarea id="hdnAllContent" name="hdnAllContent" style="display: none;"></textarea>
			                </dd>
		                </dl>
                        <div class="nsw_check_box" style=" margin-top:120px;">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="checkall" onclick='if(this.checked){$("#listgroup option").attr("selected", true);}else{$("#listgroup option").attr("selected", false);}' CssClass="dn" />
                            </span>
                            <label class="ck_text">全部发送</label>
                        </div>
					</div>
				</div>
                --%>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">选择用户组</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
                            <div class="set_cbs" style=" display:inline-block;">
                                <asp:CheckBoxList runat="server" ID="cblGroups" RepeatDirection="Horizontal" RepeatLayout="Flow" />
                            </div>
                            <div class="nsw_check_box w80 bx0 dn">
                                <span class="ck_box mt5">
                                    <asp:CheckBox runat="server" ID="checkall" CssClass="dn" />
                                </span>
                                <label class="ck_text">全部发送</label>
                            </div>
					    </div>
                        <asp:HiddenField runat="server" ID="hdContent" />
                        <textarea id="hdnAllContent" name="hdnAllContent" style="display: none;"></textarea>
					</div>
				</div>

                <div class="f_cb f_mt25 dn">
                    <label class="add_label f_fl"><span class="f_pdl15">录入时间</span></label>
				    <div class="add_r f_fl">
                        <div class="f_cb controls_calendar">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtInputTime" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
					    </div>
				    </div>
                </div>

            </div>

            <!--按钮-->
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15"></span></label>
                <div class="add_r f_fl">
                    <!-- 保存并返回 -->
			        <div class="view_btn f_mt30" returnurl="close">
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                    </div>
                </div>
            </div>
		</div>
    </form>
</div>
<script src="Inc/JS/wechat.js" type="text/javascript"></script>
</body>
</html>
