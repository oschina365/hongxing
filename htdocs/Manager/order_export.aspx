<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.order_export, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register Assembly="OranChinaRegion" Namespace="Oran.WebControl" TagPrefix="chinaRegion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
	<title><%= ItemName %></title>
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
	
<CurrentPosition:CurrentPosition runat="server" ID="cur"/>
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
					<label class="add_label f_fl">订单状态</label>
					<div class="add_r f_fl">
						<div class="set_selects">
                            <asp:DropDownList ID="ddlOrderState" runat="server"></asp:DropDownList>
                        </div>
					</div>
				</div>
                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl">支付状态</label>
					<div class="add_r f_fl">
						<div class="set_selects">
                            <asp:DropDownList runat="server" ID="ddlPaymentState"></asp:DropDownList>
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
                        <span class="e_btn2 f_csp fl mr20" onclick="listView('orders.aspxx');"><i class="back_icon"></i>返 回</span>
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="Button1" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                    </div>
                </div>
            </div>
		</div>
    </form>
</div>

</body>
</html>
