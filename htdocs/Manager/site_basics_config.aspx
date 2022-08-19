<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.site_basics_config, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%= ItemName %></title>
    <link href="skins/base/news.css" rel="stylesheet" type="text/css" />
    <link href="skins/base/setting.css" rel="stylesheet" type="text/css" />
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
<CurrentPosition:CurrentPosition runat="server" ID="currentPosition"/>
<div class="col_main one_tab_1">
    <form id="form2" runat="server" onsubmit="top.refreshList=true;">
	    <div class="add_cont pad300 j_recordCon_c f_cb">
	        <!-- 帮助基本信息 -->
            <div class="cont1 settab_lh18">
				<div class="f_cb">
					<label class="add_label f_fl">网站名称</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="ttSiteName" runat="server" CssClass="com_input clear_word" ></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>
                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl">关闭网站</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <radio_control:radio_control runat="server" GroupName="closed" ID="rdoClosedYes" Text="是" />
                            <radio_control:radio_control runat="server" GroupName="closed" ID="rdoClosedNo" Text="否" />
                        </div>
                        <i class="i_shortdesc">网站前台是否可访问，当关闭网站后，访问前台将转到消息提示页面</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
				    <label class="add_label f_fl"><span class="f_pdl15">网站关闭公告</span></label>
				    <div class="add_r f_fl">
                        <div class="f_cb add_typeset bord_gray">
						    <asp:TextBox ID="txtInfoForClosing" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
					    </div>
                        <i class="i_shortdesc">当网站关闭后提示的消息</i>
				    </div>
			    </div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">是否启用邮件订阅</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <radio_control:radio_control runat="server" ID="rdoEnableMailSubscriptionYes" Text="是" />
                            <radio_control:radio_control runat="server" ID="rdoEnableMailSubscriptionNo" Text="否" />
                        </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">允许评论</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <radio_control:radio_control runat="server" ID="rdoCommentableYes" Text="是" />
                            <radio_control:radio_control runat="server" ID="rdoCommentableNo" Text="否" />
                        </div>
                        <i class="i_shortdesc">是否允许游客或会员对已开放评论的产品或资讯发表评论。</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">是否审核评论</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <radio_control:radio_control runat="server" ID="rdoCheckCommentYes" Text="是" />
                            <radio_control:radio_control runat="server" ID="rdoCheckCommentNo" Text="否" />
                        </div>
                        <i class="i_shortdesc">对游客或会员发表的评论是否需屏蔽不显示，再经管理员手动审核通过后以予显示。</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">底部友情链接显示数目</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtFriendLinkCount" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">关键词查询个数</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtKeyWordSelectCount" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">通用消息框默认延时时长</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtCommonMessageDefaultDelay" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
                            <span class="text">秒</span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
				    <label class="add_label f_fl"><span class="f_pdl15">邮件退订原因</span></label>
				    <div class="add_r f_fl">
                        <div class="f_cb add_typeset bord_gray">
						    <asp:TextBox ID="txtCancelSubscriptionReason" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
					    </div>
                        <i class="i_shortdesc">每个原因一行</i>
				    </div>
			    </div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">显示在线客服浮动</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <radio_control:radio_control runat="server" GroupName="ShowIM" ID="rdoShowIMYes" Text="是" />
                            <radio_control:radio_control runat="server" GroupName="ShowIM" ID="rdoShowIMNo" Text="否" />
                        </div>
                        <i class="i_shortdesc">主要指网站首页和各个栏目首页等。</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">显示详细页面在线客服</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <radio_control:radio_control runat="server" GroupName="ShowIMDetail" ID="rdoShowIMDetailYes" Text="是" />
                            <radio_control:radio_control runat="server" GroupName="ShowIMDetail" ID="rdoShowIMDetailNo" Text="否" />
                        </div>
                        <i class="i_shortdesc">主要指网站产品，新闻和帮助等详细页面</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">在线客服位置</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <radio_control:radio_control runat="server" GroupName="position" ID="rdoimright" Text="右边" />
                            <radio_control:radio_control runat="server" GroupName="position" ID="rdoimleft" Text="左边" />
                        </div>
                        <i class="i_shortdesc">在线客服是显示在左边还是右边(默认右边)</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">在线客服顶部高度</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtImTopOffset" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">在线客服顶部离网页上方的高度(像素)</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">网站Logo</label>
					<div class="add_r f_fl">
						<div class="f_fl f_csp upload_img Upload_Clik" dir="others" input="hdLogo" id="logoUpload" directory="Setting"><span><em class="load_small"></em>点击上传</span></div>
                        <asp:HiddenField runat="server" ID="hdLogo" />
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">网站底部Logo</label>
					<div class="add_r f_fl">
						<div class="f_fl f_csp upload_img Upload_Clik" dir="others" input="hdBottomLog" directory="Setting"><span><em class="load_small"></em>点击上传</span></div>
                        <asp:HiddenField runat="server" ID="hdBottomLog" />
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">网站底部二维码</label>
					<div class="add_r f_fl">
						<div class="f_fl f_csp upload_img Upload_Clik" dir="others" input="hdBottomCode" directory="Setting"><span><em class="load_small"></em>点击上传</span></div>
                        <asp:HiddenField runat="server" ID="hdBottomCode" />
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">网站Icon</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="webicon_bd f_fl"></span>
				            <div class="con_upload_btn f_ml20 f_csp f_fl Upload_Clik" types="ico" input="hdIcon" imgurl="/favicon.ico" imgwarp="span.webicon_bd" id="iconUpload">点击上传</div>
                            <asp:HiddenField runat="server" ID="hdIcon" />
                        </div>
                        <p class="contact_tips mt10">一般ico图标尺寸选择16*16或者32*32,或通过ftp上传到根目录下，替换原来的favicon.ico 就实现了效果</p>
					</div>
				</div>
            </div>
            <!--其他信息 end-->

            <!--按钮-->
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15"></span></label>
                <div class="add_r f_fl">
                    <!-- 保存并返回 -->
			        <div class="view_btn f_mt30">
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                    </div>
                </div>
            </div>
		</div>
    </form>
</div>

</body>
</html>