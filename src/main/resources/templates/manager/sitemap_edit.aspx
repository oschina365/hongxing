<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.SiteMaps_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
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
    <div class="add_tile_tab f_cb">
		<ul class="f_cb addtab_ul j_recordCon f_fl w25_">
			<li class="active li1"><span class="sp"><em class="zline1"></em><em class="zline2"></em><i class="red_point">*</i>基本属性</span></li>
			<li class="li6"><span class="sp"><em class="zline1"></em><em class="zline2"></em>公共属性</span></li>
		</ul>
	</div>
    <form id="form2" runat="server" onsubmit="top.refreshList=true;">
	    <div class="add_cont pad300 j_recordCon_c f_cb">
	        <!-- 帮助基本信息 -->
            <div class="cont1">
				<div class="f_cb">
					<label class="add_label f_fl"><i class="red_point">*</i>标题名称</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>
                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">所属分类</span></label>
					<div class="add_r f_fl set_selects">
						<asp:DropDownList id="ddlColumns" runat="server"></asp:DropDownList>	
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">标题超链接地址</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtURL" validtype="url_" tipPosition="top" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>
                <% if (NSW.Mobile.MobileConfig.MEnableMobile == "true")
               { %>
               <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">手标题超链接地址</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtMURL" validtype="url_" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>
                <% } %>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">优先权比值</span></label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv set_selects">
						    <asp:DropDownList id="ddlPriority" runat="server">
                                <asp:ListItem>0.0</asp:ListItem>
                                <asp:ListItem>0.1</asp:ListItem>
                                <asp:ListItem>0.2</asp:ListItem>
                                <asp:ListItem>0.3</asp:ListItem>
                                <asp:ListItem>0.4</asp:ListItem>
                                <asp:ListItem>0.5</asp:ListItem>
                                <asp:ListItem>0.6</asp:ListItem>
                                <asp:ListItem>0.7</asp:ListItem>
                                <asp:ListItem>0.8</asp:ListItem>
                                <asp:ListItem>0.9</asp:ListItem>
                                <asp:ListItem>1.0</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <i class="i_shortdesc">(Google地图的一个很重要参数，Google会根据这个设置判定您的超链接有多重要，数字越大，则Google认为该地图超链接越重要，但是不要全部都设置为非常重要，遵循2/8定律，设置20%比较重要的超链接权重，80%不是很重要或者不重要的权重。)</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">更新频率</span></label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv set_selects">
						    <asp:DropDownList id="ddlChangeFreq" runat="server">
                                <asp:ListItem Value="always">页面总是在更新</asp:ListItem>
                                <asp:ListItem Value="hourly">每小时更新一次</asp:ListItem>
                                <asp:ListItem Value="daily">每天更新一次</asp:ListItem>
                                <asp:ListItem Value="weekly">每星期更新一次</asp:ListItem>
                                <asp:ListItem Selected="True" Value="monthly">每月更新一次</asp:ListItem>
                                <asp:ListItem Value="yearly">每年更新一次</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <i class="i_shortdesc">(Google地图将会根据这个参数，判断您的网站是否经常更新，如果设置经常更新，则Google将会认为您的网站经常修改，Google将会经常到您的网站找到当前页面进行重新收录，如果您设置该页面不是经常修改，则Google认为您的网站不是经常修改的网站，Google将不会光顾您的网站收录并更新记录。)</i>
					</div>
				</div>

            </div>
            <!--其他信息 end-->

            <div class="cont1 f_dn">

                <div class="f_cb">
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
                        <span class="e_btn2 f_ml35 f_csp fl"><i class="reset_icon"></i><input type="reset" value="重 填" /></span>
                    </div>
                </div>
            </div>
		</div>
    </form>
</div>

</body>
</html>
