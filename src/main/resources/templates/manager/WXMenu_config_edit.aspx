<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.WXMenu_config_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>

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
	    <div class="add_cont pad300 j_recordCon_c f_cb">
	        <!-- 帮助基本信息 -->
            <div class="cont1">
				<div class="f_cb">
					<label class="add_label f_fl"><i class="red_point">*</i>标题</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>
                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">所属栏目</span></label>
                    <div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <span class="clear_bd s_selt f_fl pt43 f_mr15">
                                <select id="ddlColumns" name="ddlColumns" class="pass_faq">
                                   <option value="0">一级目录</option>
                                    <asp:Repeater ID="rpt" runat="server">
                                        <ItemTemplate>
                                            <option value="<%#Eval("ID") %>" <%# Eval("ID").ToString()==SID?" style='display:none;'":"" %> <%#_ParentID==Eval("ID").ToString()?"selected=\"selected\"":"" %>><%#Eval("Title") %></option>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </select>
                            </span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">菜单类型</span></label>
                    <div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <span class="clear_bd s_selt f_fl pt43 f_mr15">
                                <asp:DropDownList ID="ddltype" runat="server" CssClass="pass_faq">
                                    <asp:ListItem Text="点击[Click]" Value="click"></asp:ListItem>
                                    <asp:ListItem Text="查看[View]" Value="view"></asp:ListItem>
                                </asp:DropDownList>
                            </span>
						</div>
					</div>
				</div>
                <script type="text/javascript">
                    $(function () {
                        $("#ddltype").change(function () {
                            if ($(this).val() == "click") {
                                $("#xclick").show(); $("#xview").hide();
                            } else {
                                $("#xview").show(); $("#xclick").hide();
                            }
                            window.top.SetHeight();
                        }).change();
                        var val = $("#txtKey").val();
                        if (val) {
                            $("#ddlclick").val(val);
                        }
                        $("#ddlclick").change(function () {
                            $("#txtKey").val($(this).val());
                        });
                    });
                </script>

                <div class="f_cb f_mt25" id="xclick">
					<label class="add_label f_fl"><span class="f_pdl15">菜单Key值[Click]</span></label>
					<div class="add_r f_fl">
                        <dl class="sv_checkbox f_fl" style=" height:auto;width:40%;">
                            <dt class="pr">
                                可选关键词精灵信息
                            </dt>
			                <dd style=" height:auto; width:100%;">
                                <asp:ListBox runat="server" ID="ddlclick"  SelectionMode="Single" class="pass_faq fl_select" Width="100%" Height="250px"></asp:ListBox>
			                </dd>
		                </dl>
						
                        <asp:TextBox ID="txtKey" runat="server" CssClass="txt" style="display:none;"></asp:TextBox>
					</div>
				</div>

                <div class="f_cb f_mt25" id="xview">
					<label class="add_label f_fl"><span class="f_pdl15">链接地址[View]</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtURL" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_ldb f_pdl15">排序</span></label>
					<div class="add_r f_fl">
						<div class="f_cb f_lht27">
                            <span class="clear_bd s_selt f_fl pt43 f_mr15 span_max_w50">
                                <asp:DropDownList runat="server" CssClass="pass_faq" ID="ddlRanking"></asp:DropDownList>
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
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                        <span class="e_btn1 f_ml35 f_csp fl" runat="server" id="btnDel"><i class="insert_icon"></i><asp:Button CommandName="del" runat="server" Text="删 除" onclick="btnSubmit_Click" /></span>
                    </div>
                </div>
            </div>
		</div>
    </form>
</div>
</body>
</html>
