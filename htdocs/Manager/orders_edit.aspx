<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.orders_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register Assembly="OranChinaRegion" Namespace="Oran.WebControl" TagPrefix="chinaRegion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %>（<%= OID > 0 ? "Object ID: " + OID : "新建对象" %>）</title>
    <link href="skins/base/news.css" rel="stylesheet" type="text/css"/>
    <link href="skins/default/list.css" rel="stylesheet" type="text/css"/>
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
    function DrawImage(ImgD, wcc, hcc, showcc) {
        var flag = false;
        var image = new Image();
        image.src = ImgD.src;
        if (image.width > 0 && image.height > 0) {
            flag = true;
            if (image.width / image.height >= wcc / hcc) {
                if (image.width > wcc) {
                    ImgD.width = wcc;
                    ImgD.height = (image.height * wcc) / image.width;
                } else {
                    ImgD.width = image.width;
                    ImgD.height = image.height;
                }
                // ImgD.alt=image.width+"x"+image.height; 
                if (showcc == 1) {
                    if (hcc > ImgD.height && wcc > ImgD.width) {
                        ImgD.style.padding = (hcc - ImgD.height) / 2 + "px 0 0 " + (wcc - image.width) / 2 + "px";
                    }
                    else if (hcc > ImgD.height) {
                        ImgD.style.padding = (hcc - ImgD.height) / 2 + "px 0 0 0";
                    }
                    else if (wcc > ImgD.width) {
                        ImgD.style.padding = "0 0 0 " + (wcc - ImgD.width) / 2 + "px";
                    }
                }
                // ImgD.style.padding-top=(185-image.height)/2+"px";
            }
            else {
                if (image.height > hcc) {
                    ImgD.height = hcc;
                    ImgD.width = (image.width * hcc) / image.height;
                } else {
                    ImgD.width = image.width;
                    ImgD.height = image.height;
                }
                //ImgD.alt=image.width+"x"+image.height; 
                if (showcc == 1) {
                    if (hcc > ImgD.height && wcc > ImgD.width) {
                        ImgD.style.padding = (hcc - ImgD.height) / 2 + "px 0 0 " + (wcc - ImgD.width) / 2 + "px";
                    }
                    else if (hcc > ImgD.height) {
                        ImgD.style.padding = (hcc - ImgD.height) / 2 + "px 0 0 0";
                    }
                    else if (wcc > ImgD.width) {
                        ImgD.style.padding = "0 0 0 " + (wcc - ImgD.width) / 2 + "px";
                    }
                }
            }
        }
    }
</script>
<CurrentPosition:CurrentPosition runat="server" ID="currentPosition"/>
<div class="col_main">
    <form id="form2" runat="server" onsubmit="top.refreshList=true;">
    <div class="add_tile_tab f_cb">
		<ul class="f_cb addtab_ul j_recordCon f_fl w50_">
			<li class="active li1"><span class="sp"><em class="zline1"></em><em class="zline2"></em><i class="red_point">*</i>基本属性</span></li>
            <li><span class="sp"><em class="zline1"></em><em class="zline2"></em>产品信息</span></li>
			<li class="li6"><span class="sp"><em class="zline1"></em><em class="zline2"></em>其它属性</span></li>
		</ul>
	</div>
    
	<div class="add_cont pad300 j_recordCon_c f_cb">
	    <!-- 帮助基本信息 -->
        <div class="cont1">
			<div class="f_cb">
				<label class="add_label f_fl"><i class="red_point">*</i>订单号</label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1">
                            <asp:TextBox ID="txtOrderNo" runat="server" CssClass="com_input clear_word"></asp:TextBox>
                            <i class="clear_x"></i>
                        </span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">会员</span></label>
				<div class="add_r f_fl">
					<asp:HiddenField ID="hdnUsername" runat="server" />
                    <asp:Literal runat="server" ID="ltlUsername"></asp:Literal>
				</div>
            </div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">实际产品金额</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtActGoodsAccount" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">实际配送费</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtActDeliveryFee" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">实际订单总额</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtActOrderAccount" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">实际税金</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtActTax" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">实际消耗积分</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtActConsumePoint" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">实际回馈积分</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtActReturnPoint" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">实际配送方式</span></label>
				<div class="add_r f_fl set_selects">
					<asp:DropDownList runat="server" ID="ddlActDeliveryMethod"></asp:DropDownList>
				</div>
			</div>
            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">实际支付方式</span></label>
				<div class="add_r f_fl set_selects">
					<asp:DropDownList runat="server" ID="ddlActPaymentMethod"></asp:DropDownList>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">订单状态</span></label>
				<div class="add_r f_fl set_selects">
					<asp:DropDownList runat="server" ID="ddlOrderState"></asp:DropDownList>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">配送状态</span></label>
				<div class="add_r f_fl set_selects">
					<asp:DropDownList runat="server" ID="ddlDeliveryState"></asp:DropDownList>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">支付状态</span></label>
				<div class="add_r f_fl set_selects">
					<asp:DropDownList runat="server" ID="ddlPaymentState"></asp:DropDownList>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">管理员备注</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_typeset bord_gray">
                        <asp:TextBox CssClass="text_area tx1" ID="txtAdminRemark" TextMode="MultiLine" runat="server"></asp:TextBox>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">产品金额</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtGoodsAccount" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">配送费</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtDeliveryFee" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">税金</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtTax" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">订单总额</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtOrderAccount" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">消耗积分</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtConsumePoint" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">回馈积分</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtReturnPoint" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">支付方式</span></label>
				<div class="add_r f_fl set_selects">
					<asp:DropDownList runat="server" ID="ddlPaymentMethod"></asp:DropDownList>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">配送方式</span></label>
				<div class="add_r f_fl set_selects">
					<asp:DropDownList runat="server" ID="ddlDeliveryMethod"></asp:DropDownList>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">联系人</span></label>
				<div class="add_r f_fl">
                    <div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtChnName" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">行政地区</span></label>
				<div class="add_r f_fl set_selects div_selects_max_w120">
					<chinaRegion:ChinaRegion runat="server" ID="regionAddr" />
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">地址</span></label>
				<div class="add_r f_fl">
                    <div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtAddr" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">邮编</span></label>
				<div class="add_r f_fl">
                    <div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtZipCode" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">电话号码</span></label>
				<div class="add_r f_fl">
                    <div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtPhone" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">手机号码</span></label>
				<div class="add_r f_fl">
                    <div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtMPhone" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">电子邮箱地址</span></label>
				<div class="add_r f_fl">
                    <div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtEmail" runat="server"></asp:TextBox><i class="clear_x"></i>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">其它</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_typeset bord_gray">
                        <asp:TextBox CssClass="text_area tx1" ID="txtUserRemark" TextMode="MultiLine" runat="server"></asp:TextBox>
					</div>
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">发票</span></label>
				<div class="add_r f_fl">
                    <div class="nsw_check_box">
                        <span class="ck_box mt5">
                            <asp:CheckBox runat="server" ID="chkNeedInvoice" CssClass="dn" />
                        </span>
                        <label>需要发票</label>
                    </div>
                    <span class="ml20">发标抬头：</span>
                    <span class="clear_bd p_inp1 span_max_w100"><asp:textbox id="txtInvoiceTitle" runat="server" CssClass="txt"></asp:textbox><i class="clear_x"></i></span>
				</div>
			</div>
        </div>
        <!--其他信息 end-->

        <div class="cont1">
            <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
                <tr id="tabHeader">
		            <th align="center" style="text-align:center">序号</th>
		            <th>产品名称</th>
                    <th>产品图片</th>
                    <th>产品价格</th>
	            </tr>
                <asp:Repeater runat="server" ID="rpt">
                    <ItemTemplate>
                        <%# GetProductInfos(Container.ItemIndex + 1, Eval("ProductID").ToString(), Eval("ProductName").ToString(), Eval("ProductPrice").ToString())%>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>

        <div class="cont1">

            <div class="f_cb">
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
