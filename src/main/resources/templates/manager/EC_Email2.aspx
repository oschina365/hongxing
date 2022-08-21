<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.EC_Email2, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>邮件群发</title>
    <link href="skins/base/editInterface.css" rel="stylesheet" type="text/css"/>
    <link href="skins/default/list.css" rel="stylesheet" type="text/css"/>
<style>
    .f_mt25{ margin-top:10px;}
    .add_cont{ border:0;}
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
<form id="form1" runat="server">
<div class="col_main one_tab_1">
	<div class="add_cont j_recordCon_c f_cb">
	    <!-- 帮助基本信息 -->
        <div class="cont1">
			<div class="f_cb">
				<label class="add_label f_fl"><i class="red_point">*</i>邮件主题</label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txttitle" runat="server" CssClass="com_input clear_word" MaxLength="60"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl">简短描述</label>
				<div class="add_r f_fl">
					<div class="f_cb add_typeset" style=" width:98%%; padding:0;">
                        <NSW:UEditor runat="server" ID="txtEcContent" Height="400"/>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25">
                <label class="add_label f_fl">选择邮件</label>
				<div class="add_r f_fl">
                    <input id="hidEmailList" type="hidden" runat="server" />
                    <div style="height:212px; overflow:hidden;overflow-y:visible;width:98%;margin-left:5px;">
					<table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%" style="width:99%;">
        	            <thead>
                            <tr id="tabHeader" style=" height:20px; line-height:20px;">
                                <td style="padding-left:30px;">ID</td>
                                <td>用户名</td>
                                <td style="display:none">姓名</td>
                                <td  style="display:none">Email</td>
                                <td>移除</td>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater runat="server" ID="rptEC"><ItemTemplate>
                            <tr>
                                <td style="padding-left:30px;"><%# Container.ItemIndex + 1 %></td>
                                <td style="display:none"><%# Eval("UserEmail")%></td>
                                <td style="display:none"><%# Eval("UserEmail")%></td>
                                <td class="UserEmail"><%# Eval("UserEmail")%></td>
                                <td><img alt="IMG" src="/Skins/Default/Img/ico110.gif"/></td>
                            </tr>
                            </ItemTemplate></asp:Repeater>
                        </tbody>
                    </table></div>
				</div>
            </div> 
        </div>
        <!--其他信息 end-->

        <!--按钮-->
        <div class="f_cb f_mt25">
            <label class="add_label f_fl"><span class="f_pdl15"></span></label>
            <div class="add_r f_fl">
                <!-- 保存并返回 -->
			    <div class="view_btn" style=" margin-top:20px;">
                    <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button CommandName="return" runat="server" Text="确认并发送" onclick="btnSubmit_Click" OnClientClick="return _ValidateForm(this);" /></span>
                    <span class="e_btn2 f_ml35 f_csp"><i class="viewCancle_icon"></i>取 消</span>
                </div>
            </div>
        </div>
	</div>
</div>
</form>
<script type="text/javascript">
    $(function () {
        _ValidateForm = function () {
            var v = $tv("txttitle");
            if (v == "") {
                _alert("请填写邮件主题");
                return false;
            }
            return true;
        }
        $("#nsw_list_table tbody img").bind("click", function () {
            $(this).parent().parent().remove();
            GetEmailList();
        });
        function GetEmailList() {
            var em = "";
            $("#nsw_list_table").find("tbody tr").each(function () {
                if (em == "") {
                    em += $(this).find("td").eq(3).text();
                } else {
                    em += "$" + $(this).find("td").eq(3).text();
                }
            });
            $("#hidEmailList").val(em);
        }
        GetEmailList();
    })
</script>
</body>
</html>
