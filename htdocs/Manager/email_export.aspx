<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.email_export, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register Assembly="OranChinaRegion" Namespace="Oran.WebControl" TagPrefix="chinaRegion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
	<title>邮件导出</title>
    <link href="skins/base/news.css" rel="stylesheet" type="text/css"/>
    <link href="skins/base/editInterface.css" rel="stylesheet" type="text/css" />
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
                    <li>请选择邮件资料导出的条件</li>
                    <li>导出的格式为CSV格式，只要你安装了Excel软件均可以打开。</li>
                    <li>导出会员资料后，您可以使用会员的有效信息如手机号码、电子邮件进行大面积宣传和客户售后服务。</li>
                </ul>
            </div>
	        <!-- 帮助基本信息 -->
            <div class="cont1">
				<div class="f_cb">
					<label class="add_label f_fl">订阅对象</label>
					<div class="add_r f_fl">
						<div class="set_radios">
                             <asp:RadioButtonList ID="radUser" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                  <asp:ListItem Value="0">游客</asp:ListItem>
                                  <asp:ListItem Value="1">会员</asp:ListItem>
                                  <asp:ListItem Value="-1" Selected="True" >不限</asp:ListItem>
                              </asp:RadioButtonList>
                              <style type="text/css">.nsw_check_box{ width:100px;}</style>
                        </div>
					</div>
				</div>
                
                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl">是否主动订阅</label>
					<div class="add_r f_fl">
						<div class="set_radios">
                             <asp:RadioButtonList ID="radUserColumn" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                  <asp:ListItem Value="1">主动订阅</asp:ListItem>
                                  <asp:ListItem Value="2">被动订阅</asp:ListItem>
                                  <asp:ListItem Value="0" Selected="True" >不限</asp:ListItem>
                          </asp:RadioButtonList>
                        </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">是否激活</label>
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

                <div class="f_cb f_mt25 dn">
                    <label class="add_label f_fl"><span class="f_pdl15">激活时间</span></label>
                    <div class="add_r f_fl c_fl">
                        <div class="f_cb controls_calendar">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtActiveStartDate" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						</div>
                        <span class="text">到</span>
                        <div class="f_cb controls_calendar">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtActiveEndDate" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						</div>
					</div>
                </div>

                <div class="f_cb f_mt25 dn">
                    <label class="add_label f_fl"><span class="f_pdl15">订阅时间</span></label>
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

                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl">是否退订</label>
					<div class="add_r f_fl">
						<div class="set_radios">
							<asp:RadioButtonList ID="radIsClose" runat="server" RepeatLayout="Flow" 
                              RepeatDirection="Horizontal">
                              <asp:ListItem Value="1">退订</asp:ListItem>
                              <asp:ListItem Value="0">正在订阅</asp:ListItem>
                              <asp:ListItem Value="-1" Selected="True" >不限</asp:ListItem>
                            </asp:RadioButtonList>
						</div>			
					</div>
				</div>

                <div class="f_cb f_mt25 dn">
                    <label class="add_label f_fl"><span class="f_pdl15">退订时间</span></label>
                    <div class="add_r f_fl c_fl">
                        <div class="f_cb controls_calendar">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtDisOrderFrom" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						</div>
                        <span class="text">到</span>
                        <div class="f_cb controls_calendar">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtDisOrderTo" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						</div>
					</div>
                </div>

                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl">退订原因</label>
					<div class="add_r f_fl">
						<div class="set_selects">
							<asp:DropDownList ID="ddlDisOrderReason" runat="server"></asp:DropDownList>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">导出以下会员信息</label>
					<div class="add_r f_fl">
						<div class="set_cbs">
							<asp:CheckBoxList ID="cblSelectFleids" runat="server" 
                              RepeatDirection="Horizontal" RepeatLayout="Flow">
                              <asp:ListItem Value="UserName">用户名</asp:ListItem>
                              <asp:ListItem Value="UserEmail">电子邮件</asp:ListItem>
                              <asp:ListItem Value="InputTime">订阅时间</asp:ListItem>
                              <asp:ListItem Value="UserIP">订阅IP地址</asp:ListItem>
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
                        <span class="e_btn2 f_csp fl mr20" onclick="listView('email.aspx');"><i class="back_icon"></i>返 回</span>
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="Button1" CommandName="return" runat="server" Text="导 出" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                    </div>
                </div>
            </div>
		</div>
    </form>
</div>

</body>


</html>
