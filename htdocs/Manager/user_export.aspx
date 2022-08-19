<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.user_export, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register Assembly="OranChinaRegion" Namespace="Oran.WebControl" TagPrefix="chinaRegion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
	<title><%= ItemName %></title>
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
	    <div class="add_cont pad300 j_recordCon_c f_cb" style="padding-top:20px;">
            <div class="tips mB10">
                <h2>温馨提示</h2>
                <ul>
                    <li>请选择会员资料导出的条件。</li>
                    <li>导出的格式为CSV格式，只要你安装了Excel软件均可以打开。</li>
                    <li>导出会员资料后，您可以使用会员的有效信息如手机号码、电子邮件进行大面积宣传和客户售后服务。</li>
                </ul>
            </div>
	        <!-- 帮助基本信息 -->
            <div class="cont1">
				<div class="f_cb">
					<label class="add_label f_fl"><span class="f_pdl15">会员组</span></label>
					<div class="add_r f_fl">
						<div class="set_selects">
                            <asp:DropDownList ID="ddlUserGroup" runat="server"></asp:DropDownList>
                        </div>
					</div>
				</div>
                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">是否激活</span></label>
					<div class="add_r f_fl">
						<div class="set_radios">
							<asp:RadioButtonList ID="radIsActive" runat="server" RepeatLayout="Flow" 
                              RepeatDirection="Horizontal">
                              <asp:ListItem Value="1">激活</asp:ListItem>
                              <asp:ListItem Value="0">未激活</asp:ListItem>
                              <asp:ListItem Value="-1" Selected="True" >不限</asp:ListItem>
                            </asp:RadioButtonList>
						</div>			
					</div>
				</div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">注册时间</span></label>
                    <div class="add_r f_fl c_fl">
                        <div class="f_cb controls_calendar">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtRegisterStartDate" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						</div>
                        <span class="text">到</span>
                        <div class="f_cb controls_calendar">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtRegisterEndDate" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						</div>
					</div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">登录次数</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1  span_max_w50">
                                <asp:TextBox ID="txtLoginsFrom" runat="server" CssClass="com_input clear_word onlyNumber"></asp:TextBox>
                                <i class="clear_x"></i>
                            </span>
                            <span class="text">到</span>
                            <span class="clear_bd f_fl p_inp1  span_max_w50">
                                <asp:TextBox ID="txtLoginsTo" runat="server" CssClass="com_input clear_word onlyNumber"></asp:TextBox>
                                <i class="clear_x"></i>
                            </span>
                        </div>
					</div>
                </div>

                <div class="f_cb f_mt25 dn">
                    <label class="add_label f_fl"><span class="f_pdl15">最后一次登录时间</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb controls_calendar">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtLastLoginFrom" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						</div>
                        <span class="text">到</span>
                        <div class="f_cb controls_calendar">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtLastLoginTo" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						</div>
					</div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">年龄</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1 span_max_w50">
                                <asp:TextBox ID="txtAgeFrom" runat="server" CssClass="com_input clear_word onlyNumber"></asp:TextBox>
                                <i class="clear_x"></i>
                            </span>
                            <span class="text">到</span>
                            <span class="clear_bd f_fl p_inp1 span_max_w50">
                                <asp:TextBox ID="txtAgeTo" runat="server" CssClass="com_input clear_word onlyNumber inout_max5"></asp:TextBox>
                                <i class="clear_x"></i>
                            </span>
                        </div>
					</div>
                </div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">所属行业</span></label>
					<div class="add_r f_fl">
						<div class="set_selects">
                            <asp:DropDownList ID="ddlInductry" runat="server"></asp:DropDownList>
                        </div>
					</div>
				</div>

                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl"><span class="f_pdl15">当前职位</span></label>
					<div class="add_r f_fl">
						<div class="set_selects">
                            <asp:DropDownList ID="ddlJob" runat="server"></asp:DropDownList>
                        </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">省份城市</span></label>
					<div class="add_r f_fl">
						<div class="set_selects div_selects_max_w120">
                            <chinaRegion:ChinaRegion ID="region" runat="server" />
                        </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">导出以下信息</span></label>
					<div class="add_r f_fl">
						<div class="set_cbs">
                            <asp:CheckBoxList ID="cblSelectFleids" runat="server" 
                              RepeatDirection="Horizontal" RepeatLayout="Flow">
                              <asp:ListItem Value="UserName">用户名</asp:ListItem>
                              <asp:ListItem Value="ChnName">姓名</asp:ListItem>
                              <asp:ListItem Value="MPhone">手机号码</asp:ListItem>
                              <asp:ListItem Value="UserEmail">电子邮件</asp:ListItem>
                             <%-- <asp:ListItem Value="IndustryID">所在行业</asp:ListItem>
                              <asp:ListItem Value="JobID">当前职位</asp:ListItem>
                              <asp:ListItem Value="CompName">公司名称</asp:ListItem>--%>
                              <asp:ListItem Value="UserLogins">登录次数</asp:ListItem>
                              
                           <%--   <asp:ListItem Value="UserBirthday">出生年月</asp:ListItem>--%>
                              <asp:ListItem Value="Province">省份</asp:ListItem>
                              <asp:ListItem Value="City">城市</asp:ListItem>
                              <asp:ListItem Value="InputTime">注册时间</asp:ListItem>
                          </asp:CheckBoxList>
                        </div>
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
                        <span class="e_btn1 f_csp fl mr20"><i class="insert_icon"></i><asp:Button ID="Button1" CommandName="return" runat="server" Text="导 出" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                        <span class="e_btn2 f_csp fl" onclick="listView('users.aspx');"><i class="back_icon"></i>返 回</span>
                    </div>
                </div>
            </div>
		</div>
    </form>
</div>

</body>
</html>
