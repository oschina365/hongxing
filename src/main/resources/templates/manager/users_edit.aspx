<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.users_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register Assembly="OranChinaRegion" Namespace="Oran.WebControl" TagPrefix="chinaRegion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %>（<%= OID > 0 ? "Object ID: " + OID : "新建对象" %>）</title>
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

<CurrentPosition:CurrentPosition runat="server" ID="currentPosition"/>
<div class="col_main">
    <form id="form2" runat="server" onsubmit="top.refreshList=true;">
    <div class="add_tile_tab f_cb">
		<ul class="f_cb addtab_ul j_recordCon f_fl w25_">
			<li class="active li1"><span class="sp"><em class="zline1"></em><em class="zline2"></em><i class="red_point">*</i>基本属性</span></li>
			<li class="li6"><span class="sp"><em class="zline1"></em><em class="zline2"></em>其它属性</span></li>
		</ul>						
	</div>
    
	<div class="add_cont pad300 j_recordCon_c f_cb">
	    <!-- 帮助基本信息 -->
        <div class="cont1">
			<div class="f_cb">
				<label class="add_label f_fl"><i class="red_point">*</i>用户名</label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1">
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="com_input clear_word"></asp:TextBox>
                            <i class="clear_x"></i>
                            <asp:HiddenField runat="server" ID="hdnUsername" />
                        </span>
					</div>
                    <i class="i_shortdesc">请勿随意修改</i>
				</div>
			</div>
                
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">电子邮箱地址</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1">
                            <asp:TextBox ID="txtUserEmail" validtype="email_" runat="server" CssClass="com_input clear_word" MaxLength="60"></asp:TextBox>
                            <i class="clear_x"></i>
                            <asp:HiddenField runat="server" ID="hdnEmail" />
                        </span>
					</div>
                    <i class="i_shortdesc">请勿随意修改</i>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">密码</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1">
                            <asp:TextBox ID="txtUserPassword" runat="server" CssClass="com_input clear_word" MaxLength="60"></asp:TextBox>
                            <i class="clear_x"></i>
                            <asp:HiddenField runat="server" ID="hdnPassword" />
                        </span>
					</div>
                    <i class="i_shortdesc">请勿随意修改，不输人密码是不会去修改密码</i>
				</div>
			</div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">会员组</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
                        <span class="clear_bd s_selt f_fl pt43 f_mr15">
                            <asp:DropDownList runat="server" CssClass="pass_faq" ID="ddlGroups"></asp:DropDownList>
                            <i class="revise_sub"></i>
                        </span>
					</div>			
				</div>
            </div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">中文姓名</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1">
                            <asp:TextBox ID="txtChnName" runat="server" CssClass="com_input clear_word" MaxLength="60"></asp:TextBox>
                            <i class="clear_x"></i>
                        </span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">是否激活</span></label>
				<div class="add_r f_fl">
					<div class="nsw_check_box fl mr10">
                        <span class="ck_box mt5">
                            <asp:CheckBox runat="server" ID="chkActive" CssClass="dn" onclick="if(this.checked){$('#txtActiveDateWarp').show();}else{$('#txtActiveDateWarp').hide();}" />
                        </span>
                    </div>
                    <div class="f_cb controls_calendar fl dn" id="txtActiveDateWarp">
                        <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtActiveDate" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
					</div>
				</div>
			</div>

        </div>
        <!--其他信息 end-->

        <div class="dn">

            <div class="f_cb dn">
				<label class="add_label f_fl"><span class="f_pdl15">找回密码提示问题</span></label>
				<div class="add_r f_fl">
                    <asp:HiddenField runat="server" ID="hdnSecQus" />
                    <input type="button" value="修改" class="btn" onclick="$(this).next().css('visibility','visible');ddlSecQus_Changed($g('ddlSecQus'), '<%= txtSecQus.ClientID %>');" />
					<span class="clear_bd s_selt f_fl pt43 f_mr15" style="visibility:hidden;">
                        <select runat="server" class="pass_faq" id="ddlSecQus" onchange="ddlSecQus_Changed(this,'<%= txtSecQus.ClientID %>')">
                            <option value="我的宠物叫什么名字？">我的宠物叫什么名字？</option>
                            <option value="我向住地方是哪里？">我向住地方是哪里？</option>
                            <option value="我的初恋情人生日？">我的初恋情人生日？</option>
                            <option value="我喜欢吃什么菜？">我喜欢吃什么菜？</option>
                            <option value="我常爱做什么梦？">我常爱做什么梦？</option>
                            <option value="">自写问题...</option>
                        </select>
                        <i class="revise_sub"></i>
                    </span>
                    <asp:TextBox ID="txtSecQus" runat="server" MaxLength="128" Style="display: none"></asp:TextBox>
				</div>
			</div>

                <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">介绍人用户名</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1">
                            <asp:TextBox ID="txtCUsername" runat="server" CssClass="com_input clear_word"></asp:TextBox>
                            <i class="clear_x"></i>
                        </span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">找回密码答案</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
                        <asp:HiddenField runat="server" ID="hdnAsr" />
                        <input type="button" value="修改" class="btn" onclick="$(this).next().css('visibility','visible');" />
						<span class="clear_bd f_fl p_inp1" style="visibility:hidden;">
                            <asp:TextBox ID="txtSecAsr" runat="server" CssClass="com_input clear_word"></asp:TextBox>
                            <i class="clear_x"></i>
                        </span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">性别</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd s_selt f_fl pt43 f_mr15">
                        <asp:DropDownList id="ddlSex" runat="server" CssClass="pass_faq">
                            <asp:ListItem Value="1">男</asp:ListItem>
                            <asp:ListItem Value="0">女</asp:ListItem>
                            <asp:ListItem Value="-1">保密</asp:ListItem>
                        </asp:DropDownList>
                        <i class="revise_sub"></i>
                    </span>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">生日</span></label>
				<div class="add_r f_fl">
					<div class="f_cb controls_calendar">
                        <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtBirth" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">积分</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtUserWealth" runat="server"></asp:TextBox>
                        <i class="clear_x"></i>
					</span>	
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">公司名</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtCompName" runat="server"></asp:TextBox>
                        <i class="clear_x"></i>
					</span>	
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">行业</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd s_selt f_fl pt43 f_mr15">
                        <asp:DropDownList id="ddlIndustries" runat="server" CssClass="pass_faq"></asp:DropDownList>
                        <i class="revise_sub"></i>
                    </span>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">职位</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd s_selt f_fl pt43 f_mr15">
                        <asp:DropDownList id="ddlPositions" runat="server" CssClass="pass_faq"></asp:DropDownList>
                        <i class="revise_sub"></i>
                    </span>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">学历</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd s_selt f_fl pt43 f_mr15">
                        <asp:DropDownList id="ddlEdu" runat="server" CssClass="pass_faq"></asp:DropDownList>
                        <i class="revise_sub"></i>
                    </span>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">电话号码</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" validtype="tel" ID="txtPhone" runat="server"></asp:TextBox>
                        <i class="clear_x"></i>
					</span>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">传真</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtFax" validtype="fax" runat="server"></asp:TextBox>
                        <i class="clear_x"></i>
					</span>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">兴趣爱好</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_typeset bord_gray">
                        <asp:TextBox CssClass="text_area tx1" ID="txtHobby" TextMode="MultiLine" runat="server"></asp:TextBox>
					</div>
				</div>
			</div>

        </div>

        <div class="cont1">
            <div class="f_cb">
				<label class="add_label f_fl"><span class="f_pdl15">手机号码</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word onlyNumber" reginput="telinfo" ID="txtMPhone" validtype="mphone" runat="server"></asp:TextBox>
                        <i class="clear_x"></i>
					</span>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">邮编</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word onlyNumber" ID="txtZipCode" validtype="number" runat="server"></asp:TextBox>
                        <i class="clear_x"></i>
					</span>	
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">行政地区</span></label>
				<div class="add_r f_fl">
                    <div class="set_selects">
						<chinaRegion:ChinaRegion runat="server" ID="regionAddr" />
                    </div>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">地址</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtAddr" runat="server"></asp:TextBox>
                        <i class="clear_x"></i>
					</span>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">头像</span></label>
				<div class="add_r f_fl">
					<div class="f_fl f_csp upload_img Upload_Clik" input="imgAvatar" directory="qt"><span><em class="load_small"></em>点击上传</span></div>
                    <asp:HiddenField runat="server" ID="imgAvatar" />	
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">登录次数</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word onlyNumber span_max_w50" ID="txtUserLogins" validtype="number" runat="server"></asp:TextBox>
                        <i class="clear_x"></i>
					</span>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">最后登录时间</span></label>
				<div class="add_r f_fl">
					<div class="f_cb controls_calendar">
                        <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" ID="txtLastLogin" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">最后登录的IP</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtLastIP" runat="server"></asp:TextBox>
                        <i class="clear_x"></i>
					</span>
				</div>
			</div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">排序</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
                        <span class="clear_bd s_selt f_fl pt43 f_mr15" style="width:50px;">
                            <asp:DropDownList runat="server" CssClass="pass_faq" Width="50" ID="ddlRanking"></asp:DropDownList>
                            <i class="revise_sub"></i>
                        </span>
					</div>			
				</div>
            </div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">是否可用</span></label>
				<div class="add_r f_fl">
					<div class="nsw_check_box">
                        <span class="ck_box mt5">
                            <asp:CheckBox runat="server" ID="chkEnable" Checked="true" CssClass="dn" />
                        </span>
                    </div>
				</div>
			</div>

            <div class="f_cb f_mt25">
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
			    <div class="view_btn f_mt30">
                    <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="Button1" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                    <span class="e_btn1 f_ml35 f_csp fl" runat="server" id="btnDel"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="del" runat="server" Text="删 除" onclick="btnSubmit_Click" /></span>
                </div>
            </div>
        </div>
	</div>
     </form>
</div>
</body>
<style>
    div.set_selects span.s_selt{ width:110px;}
</style>
</html>