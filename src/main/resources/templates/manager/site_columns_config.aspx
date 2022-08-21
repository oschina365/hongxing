<%@ page language="C#" inherits="NSW.Web.Manager.site_columns_config, qwt" autoeventwireup="True" enableeventvalidation="false" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%= ItemName %></title>
    <link href="skins/base/news.css" rel="stylesheet" type="text/css" />
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
<form id="form2" runat="server" onsubmit="top.refreshList=true;">
<div class="col_main">
    <div class="add_tile_tab f_cb">
		<ul class="f_cb addtab_ul j_recordCon f_fl" style="width:100%">

			<%if (NSW.BLL.Admin.CheckPermission("users.aspx",NSW.BLL.Admin.AdminPermission.Permission)){ %>
            <li><span class="sp"><em class="zline1"></em><em class="zline2"></em>会员设置</span></li>
            <%} %>
            <li><span class="sp"><em class="zline1"></em><em class="zline2"></em>联系方式</span></li>
            <%if (NSW.BLL.Admin.CheckPermission("news.aspx",NSW.BLL.Admin.AdminPermission.Permission)){ %>
			<li><span class="sp"><em class="zline1"></em><em class="zline2"></em>资讯设置</span></li>
            <%} %>

            <%if (NSW.BLL.Admin.CheckPermission("helps.aspx",NSW.BLL.Admin.AdminPermission.Permission)){ %>
			<li><span class="sp"><em class="zline1"></em><em class="zline2"></em>帮助中心</span></li>
            <%} %>

            <%if (NSW.BLL.Admin.CheckPermission("products.aspx",NSW.BLL.Admin.AdminPermission.Permission)){ %>
			<li><span class="sp"><em class="zline1"></em><em class="zline2"></em>产品中心</span></li>
            <%} %>

            <%if (NSW.BLL.Admin.CheckPermission("projects.aspx",NSW.BLL.Admin.AdminPermission.Permission)){ %>
			<li><span class="sp"><em class="zline1"></em><em class="zline2"></em>方案中心</span></li>
            <%} %>

            <%if (NSW.BLL.Admin.CheckPermission("agents.aspx", NSW.BLL.Admin.AdminPermission.Permission)){ %>
			<li><span class="sp"><em class="zline1"></em><em class="zline2"></em>招商加盟</span></li>
            <%} %>

            <%if (NSW.BLL.Admin.CheckPermission("jobs.aspx", NSW.BLL.Admin.AdminPermission.Permission)){ %>
			<li><span class="sp"><em class="zline1"></em><em class="zline2"></em>招聘中心</span></li>
            <%} %>

		</ul>
        <script type="text/javascript">
            $(function () {
                $("ul.addtab_ul li").css("width",(100 / $("ul.addtab_ul li").length) + "%");
            })
        </script>
	</div>
	<div class="add_cont pad300 j_recordCon_c f_cb">

	    <!-- 会员设置 -->
        <%if (NSW.BLL.Admin.CheckPermission("users.aspx",NSW.BLL.Admin.AdminPermission.Permission)){ %>
        <div class="cont1 settab_lh18">
			<div class="f_cb">
				<label class="add_label f_fl"><span class="f_pdl15">可注册会员</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
					    <radio_control:radio_control runat="server" GroupName="signupable" ID="rdoMembershipSignabledYes" Text="是" />
                        <radio_control:radio_control runat="server" GroupName="signupable" ID="rdoMembershipSignabledNo" Text="否" />
                    </div>
				</div>
			</div>
                
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">新注册会员账号需要激活</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
                        <radio_control:radio_control runat="server" GroupName="activeuser" ID="rdoActiveUserYes" Text="是" />
                        <radio_control:radio_control runat="server" GroupName="activeuser" ID="rdoActiveUserNo" Text="否" />
                    </div>
                    <i class="i_shortdesc">新注册的会员是否需要通过系统发送的激活电子邮件进行激活</i>
				</div>
			</div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">会员头像文件大小</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtAvatarFileMaxLength" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
					</div>
                    <i class="i_shortdesc">允许上传头像图片文件的最大长度</i>
				</div>
            </div>

            <div class="f_cb f_mt25 dn">
                <label class="add_label f_fl"><span class="f_pdl15">收藏夹容量</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtMyAddressCapacity" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
                        <span class="text">条</span>
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25 dn">
                <label class="add_label f_fl"><span class="f_pdl15">收货人容量</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtFavoriteCapacity" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
                        <span class="text">条</span>
					</div>
                    <i class="i_shortdesc"></i>
				</div>
            </div>
        </div>
        <%} %>
        <!--会员设置 end-->

        <!--联系方式-->
        <div class="cont1 settab_lh18">
            
            <div class="f_cb">
                <label class="add_label f_fl"><span class="f_pdl15">左边联系方式</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_typeset bord_gray">
                        <asp:TextBox CssClass="text_area tx1" ID="txtLeftlx" runat="server" TextMode="MultiLine" Height="200"></asp:TextBox>
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">是否开启</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv f_lht27">
                        <radio_control:radio_control runat="server" ID="rdoEnablelxYes" Text="是" Checked="true" />
                        <radio_control:radio_control runat="server" ID="rdoEnablelxNo" Text="否" />
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">联系方式</span></label>
                <div class="add_r f_fl">
                     <div style=" width:95%;">
                        <NSW:UEditor runat="server" ID="txtLxfs" />
                    </div>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">备用编辑框</span></label>
                <div class="add_r f_fl">
                     <div style="width:95%;">
                        <NSW:UEditor runat="server" ID="txtExpressLane" />
                    </div>
				</div>
            </div>

        </div>
        <!--联系方式 end-->


        <!--资讯设置-->
        <%if (NSW.BLL.Admin.CheckPermission("news.aspx",NSW.BLL.Admin.AdminPermission.Permission)){ %>
        <div class="cont1 settab_lh18">
            <div class="f_cb">
                <div class="model_side model_list_normal ">
				    <div class="model_tit"><span class="model_type f_fl"><i></i>资讯中心模板</span></div>
				    <div class="model_box">
                        <iframe src="nvtemps.aspx?type=news&page=nvindextemps" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="nvtemps" name="nvtemps"></iframe>
                        <asp:HiddenField ID="hdnewsdiretorie" runat="server"/>
				    </div>
			    </div>
            </div>
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">资讯列表页默认大小</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtNewsPageSizeDefault" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
            </div>
        </div>
        <%} %>
        <!--资讯设置 end-->

        <!--帮助中心-->
        <%if (NSW.BLL.Admin.CheckPermission("helps.aspx",NSW.BLL.Admin.AdminPermission.Permission)){ %>
        <div class="cont1 settab_lh18">
            <div class="f_cb">
                <div class="model_side model_list_normal ">
				    <div class="model_tit"><span class="model_type f_fl"><i></i>帮助中心模板</span></div>
				    <div class="model_box">
                        <iframe src="nvtemps.aspx?type=help&page=nvindextemps" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="Iframe1" name="nvtemps"></iframe>
                        <asp:HiddenField ID="hdhelpdiretorie" runat="server"/>
				    </div>
			    </div>
            </div>
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">帮助列表页默认大小</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtHelpDefaultSize" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">帮助中心默认文案ID</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd" style="width:45px"><asp:textbox id="txtHelpDefaultID" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber"></asp:textbox><i class="clear_x"></i></span>
                        <div class="set_selects set_selects_w110" style=" display:inline-block;vertical-align:top; margin-left:10px;">
                            <asp:DropDownList ID="ddlHelpColumn" runat="server"></asp:DropDownList>
                            <asp:DropDownList ID="ddlHelpList" runat="server">
                                <asp:ListItem Value="" Text="请选择文章..."></asp:ListItem>
                            </asp:DropDownList>  
                        </div>
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">发送留言的邮件通知</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<radio_control:radio_control runat="server" GroupName="SendingLeavewordMailNotify" ID="rdoSendingLeavewordMailNotifyYes" Text="是" />
                        <radio_control:radio_control runat="server" GroupName="SendingLeavewordMailNotify" ID="rdoSendingLeavewordMailNotifyNo" Text="否" />
					</div>
                    <i class="i_shortdesc">当有用户提交了<a href="/help/leaveword.aspx" target="_blank">留言</a>后，发送一封邮件通知到指定电子邮箱地址。</i>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">接收留言通知的邮箱</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtReceivingLeavewordMailAddress" runat="server" CssClass="com_input clear_word" MaxLength="40" validtype="email_"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
            </div>

        </div>
        <%} %>
        <!--帮助中心 end-->

        <!--产品中心-->
        <%if (NSW.BLL.Admin.CheckPermission("products.aspx",NSW.BLL.Admin.AdminPermission.Permission)){ %>
		<div class="cont1 settab_lh18">
            <div class="f_cb">
                <div class="model_side model_list_normal ">
				    <div class="model_tit"><span class="model_type f_fl"><i></i>产品中心模板</span></div>
				    <div class="model_box">
                        <iframe src="nvtemps.aspx?type=product&page=nvindextemps" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="Iframe2" name="nvtemps"></iframe>
                        <asp:HiddenField ID="hdproductdiretorie" runat="server"/>
				    </div>
			    </div>
            </div>
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">产品缩略图大小</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						宽(单位px)：<span class="clear_bd span_max_w50"><asp:textbox id="_txt_Width" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" MaxLength="4"></asp:textbox><i class="clear_x"></i></span>
                         X <span class="clear_bd span_max_w50"><asp:textbox id="_txt_Height" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" MaxLength="4"></asp:textbox><i class="clear_x"></i></span>
                         <span class="ml10">高(单位px)</span>
					</div>
                    <i class="i_shortdesc">设置后将按此大小进行压缩</i>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">产品列表默认页大小</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtProductPageSizeDefault" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">发送订单邮件通知</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<radio_control:radio_control runat="server" GroupName="SendingOrderBuiltMailNotifyToAdmin" ID="rdoSendingOrderBuiltMailNotifyToAdminYes" Text="是" />
                        <radio_control:radio_control runat="server" GroupName="SendingOrderBuiltMailNotifyToAdmin" ID="rdoSendingOrderBuiltMailNotifyToAdminNo" Text="否" />
					</div>
                    <i class="i_shortdesc">当用户提交一个订单后，发送一封邮件通知到指定电子邮箱地址</i>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">接收订单生成通知的邮箱</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtReceivingOrderBuiltMailAddress" runat="server" CssClass="com_input clear_word" MaxLength="40"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">销售热线</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtSalesHotLine" runat="server" CssClass="com_input clear_word onlyNumber" reginput="telinfo" ></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
            </div>

        </div>
        <%} %>
        <!--产品中心 end-->

        <!--方案中心-->
        <%if (NSW.BLL.Admin.CheckPermission("projects.aspx",NSW.BLL.Admin.AdminPermission.Permission)){ %>
        <div class="cont1 settab_lh18">
            <div class="f_cb">
                <div class="model_side model_list_normal ">
				    <div class="model_tit"><span class="model_type f_fl"><i></i>方案中心模板</span></div>
				    <div class="model_box">
                        <iframe src="nvtemps.aspx?type=project&page=nvindextemps" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="Iframe3" name="nvtemps"></iframe>
                        <asp:HiddenField ID="hdprojectdiretorie" runat="server"/>
				    </div>
			    </div>
            </div>
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">方案服务缩略图大小</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						宽(单位px)：<span class="clear_bd span_max_w50"><asp:textbox id="txtPjWidth" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" MaxLength="4"></asp:textbox><i class="clear_x"></i></span>
                         X <span class="clear_bd span_max_w50"><asp:textbox id="txtPjHeight" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" MaxLength="4"></asp:textbox><i class="clear_x"></i></span>
                         <span class="ml10">高(单位px)</span>
					</div>
                    <i class="i_shortdesc">设置后将按此大小进行压缩</i>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">方案服务默认页大小</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtProjectPageSizeDefault" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">发送订单邮件通知</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<radio_control:radio_control runat="server" GroupName="SendingProjectOrderBuiltMailNotifyToAdmin" ID="rdoSendingProjectOrderBuiltMailNotifyToAdminYes" Text="是" />
                        <radio_control:radio_control runat="server" GroupName="SendingProjectOrderBuiltMailNotifyToAdmin" ID="rdoSendingProjectOrderBuiltMailNotifyToAdminNo" Text="否" />
					</div>
                    <i class="i_shortdesc">当用户提交一个订单后，发送一封邮件通知到指定电子邮箱地址</i>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">接收订单生成通知的邮箱</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtReceivingProjectOrderBuiltMailAddress" validtype="email_" runat="server" CssClass="com_input clear_word" MaxLength="40"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
            </div>

        </div>
        <%} %>
        <!--方案中心 end-->

         <!--招商加盟-->
        <%if (NSW.BLL.Admin.CheckPermission("agents.aspx",NSW.BLL.Admin.AdminPermission.Permission)){ %>
        <div class="cont1 settab_lh18">
            <div class="f_cb">
                <div class="model_side model_list_normal ">
				    <div class="model_tit"><span class="model_type f_fl"><i></i>招商加盟中心模板</span></div>
				    <div class="model_box">
                        <iframe src="nvtemps.aspx?type=agent&page=nvindextemps" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="Iframe4" name="nvtemps"></iframe>
                        <asp:HiddenField ID="hdagentdiretorie" runat="server"/>
				    </div>
			    </div>
            </div>
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">招商加盟列表页默认大小</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtAgentDefaultSize" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">招商加盟默认文案ID</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd" style="width:45px"><asp:textbox id="txtAgentDefaultID" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber"></asp:textbox><i class="clear_x"></i></span>
                        <div class="set_selects set_selects_w110" style=" display:inline-block;vertical-align:top; margin-left:10px;">
                            <asp:DropDownList ID="ddlAgentColumn" runat="server"></asp:DropDownList>
                            <asp:DropDownList ID="ddlAgentList" runat="server">
                                <asp:ListItem Value="" Text="请选择需要捆绑的招商加盟文案"></asp:ListItem>
                            </asp:DropDownList>  
                        </div>
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">招商加盟热线</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtAgencyHotLine" runat="server" CssClass="com_input clear_word onlyNumber" reginput="telinfo" ></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">招商加盟传真</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtAgencyFax" runat="server" CssClass="com_input clear_word onlyNumber" reginput="telinfo"  ></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">招商加盟申请表单下载</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<div class="f_fl f_csp upload_img Upload_Clik" types="doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2" input="hdAgentUpload" dir="file" id="agentUpload"><span><em class="load_small"></em>点击上传</span></div>
                        <asp:HiddenField runat="server" ID="hdAgentUpload" />
					</div>
				</div>
            </div>

        </div>
        <%} %>
        <!--方案中心 end-->

        <%if (NSW.BLL.Admin.CheckPermission("jobs.aspx",NSW.BLL.Admin.AdminPermission.Permission)){ %>
        <div class="cont1 settab_lh18">

            <div class="f_cb">
                <label class="add_label f_fl"><span class="f_pdl15">企业招聘默认页大小</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtJobPageSizeDefault" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">招聘信息默认是否展示</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<radio_control:radio_control runat="server" GroupName="ExtendJobInfo" ID="rdoExtendJobInfoYes" Text="是" />
                        <radio_control:radio_control runat="server" GroupName="ExtendJobInfo" ID="rdoExtendJobInfoNo" Text="否" />
					</div>
                    <i class="i_shortdesc">默认是否展开招聘信息的详细内容</i>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">人力资源部电话号码</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtHRPhoneNo" runat="server" CssClass="com_input clear_word onlyNumber" reginput="telinfo"  ></asp:TextBox><i class="clear_x"></i></span>
					</div>
                    <i class="i_shortdesc">用于显示在<a href="/job/" target="_blank">招聘频道</a>的电话号码</i>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">人力资源部电子邮箱地址</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtHREmailAddress" runat="server" CssClass="com_input clear_word" MaxLength="40"></asp:TextBox><i class="clear_x"></i></span>
					</div>
                    <i class="i_shortdesc">用于显示在<a href="/job" target="_blank">招聘频道</a>的电子邮件地址，接收求职者的简历</i>
				</div>
            </div>

        </div>
        <%} %>
        <!--按钮-->
        <div class="f_cb f_mt25">
            <label class="add_label f_fl"><span class="f_pdl15"></span></label>
            <div class="add_r f_fl">
                <!-- 保存并返回 -->
			    <div class="view_btn f_mt30">
                    <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                </div>
            </div>
        </div>

	</div>
</div>
</form>
<script type="text/javascript">
    //发送获取所有帮助列表通知
    var __AJAX_URL = "handler/ajax.ashx";
    //设置产品数据源
    function InitDropdownlist(sel, defaulttext, defaultvalue, arry) {
        //1\清除所有的数据源
        var len = sel.options.length;
        for (i = 0; i < len; i++) {
            sel.remove(0);
        }

        //2\设置一个默认值
        sel.add(new Option(defaulttext, defaultvalue));
        //2.5 如果结果值为空，返回
        if ($.trim(arry) == "") {
            return;
        }
        //3\制作数据源，键值对中间用$$分开，||作为键值对之间的分割符

        var ary = arry.split("||");
        len = ary.length;
        if (len) {
            for (i = 0; i < len; i++) {
                text_value = ary[i].split("$$");
                if (text_value.length == 2) {
                    text = text_value[1];
                    value = text_value[0];
                    sel.add(new Option(text, value));
                }
            }
        }
    }
    function sendGetAgentNotify(src) {
        var _agentColumn = $j("ddlAgentColumn").val();
        $.post(__AJAX_URL + "?action=SendGetAgentByColumn&t=" + Math.random(), {
            columnID: _agentColumn
        }, function (msg) {
            //创建下拉表单
            InitDropdownlist(document.getElementById("ddlAgentList"), "请选择需要捆绑的文档", "0", msg);
        });
    }
    function sendGetHelpNotify(src) {
        var _helpColumn = $j("ddlHelpColumn").val();
        $.post(__AJAX_URL + "?action=SendGetHelpByColumn&t=" + Math.random(), {
            columnID: _helpColumn
        }, function (msg) {
            //创建下拉表单
            InitDropdownlist(document.getElementById("ddlHelpList"), "请选择需要捆绑的文档", "0", msg);
        });
    }
    //保持选项卡状态
    $(function () {
        var lis = $(".addtab_ul li");
        $("form").attr("action_", $("form").attr("action"));
        lis.bind("click", function () {
            $("form").attr("action", $("form").attr("action_") + "#" + lis.index($(this)));
        })
        if (window.location.hash) {
            var index = parseInt((window.location.hash + "").replace('#', ''));
            if (!isNaN(index)) {
                lis.eq(index).click();
            }
        }
    })
</script>
</body>
</html>