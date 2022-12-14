<%@ page language="C#" autoeventwireup="True" enableeventvalidation="false" inherits="NSW.Web.Manager.WXKeyword_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register src="Inc/uc/XuanZe.ascx" tagname="XuanZe" tagprefix="XuanZe" %>

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
					<label class="add_label f_fl"><i class="red_point">*</i>关键词精灵自定义标题</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">只是用于标记,方便以后查找</i>
					</div>
				</div>
                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">回复类型</span></label>
                    <div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd s_selt f_fl pt43 f_mr15">
                                <asp:DropDownList id="ddlMode" runat="server"  CssClass="pass_faq">
                                    <asp:ListItem Value="1" Selected="True">文本</asp:ListItem>
                                    <asp:ListItem Value="2">图文</asp:ListItem>
                                </asp:DropDownList>
								<i class="revise_sub"></i>
							</span>
						</div>
					</div>
				</div>
                <script type="text/javascript">
                    $(function () {
                        $("#createurl").click(function () {
                            var sitedomain = "<%=NSW.OConfig.Common.SiteDomain %>";
                            $(this).next("span").find("input:text").val(sitedomain + "/weixin.aspx?qc=" + $.trim($("#txtBaseID").val())).trigger("hasValue");
                        });

                        $("#ddlMode").change(function () {
                            var val = $(this).val();
                            if (val == "1") {
                                $("#text").show();
                                $("#zhannei").hide();
                            } else {
                                $("#text").hide();
                                $("#zhannei").show();
                            }
                            window.top.SetHeight();
                        }).change();
                    })
                </script>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">关键词</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtkeys" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
                            <div class="nsw_check_box lh27 ml10">
                                <span class="ck_box mt5">
                                    <asp:CheckBox runat="server" ID="isglobal" Checked="true" CssClass="dn" />
                                </span>
                                <label style=" display:inline-block; padding-left:5px; vertical-align: top;  position:relative; margin-top:-1px;">是否模糊查询</label>
                            </div>
						</div>
                        <i class="i_shortdesc">多个关键词用竖线【|】分开。注：英文的标点符号</i>
					</div>
				</div>

                <div class="f_cb f_mt25" id="text">
					<label class="add_label f_fl"><span class="f_pdl15">回复内容</span></label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
                            <div class="f_cb add_typeset bord_gray">
                                <asp:TextBox CssClass="text_area tx1" TextMode="MultiLine" runat="server" ID="txtContent" Rows="2" ></asp:TextBox>
                            </div>
                        </div>
                        <div class="lh27 mt10">
                            <span class="f_db f_fl f_csp">标题：</span>
                            <span class="clear_bd f_fl p_inp1 ml10" style="width:100px;">
                                <input id="xtitle" type="text" class="com_input clear_word" placeholder="请输入标题..." />
                                <i class="clear_x"></i>
				            </span>
                            <span class="f_db f_fl f_csp ml10">链接：</span>
                            <span class="clear_bd f_fl p_inp1 ml10" style="width:240px;">
                                <input id="xhref" type="text" class="com_input clear_word" placeholder="请输入链接..." />
                                <i class="clear_x"></i>
				            </span>
                            <div class="msg_btn f_fl f_csp ml10" onclick="addTo('#txtContent');">添加链接</div>
                        </div>
                        <script type="text/javascript">
                            function addTo(el) {
                                el = $(el);
                                var baseContent = el.val();
                                var title = $tv("xtitle");
                                var xhref = $tv("xhref");
                                if (title == "" || xhref == "") {
                                    _alert("标题或者链接不能为空！");
                                    return;
                                }
                                baseContent += '<a href="' + xhref + '">' + title + '</a>';
                                el.val(baseContent).trigger("hasValue");
                                $("#xtitle").val("").trigger("hasValue");
                                $("#xhref").val("").trigger("hasValue");
                            }
                        </script>
					</div>
				</div>

                <div class="f_cb f_mt25" id="zhannei">
					<label class="add_label f_fl"><span class="f_pdl15">站内选择</span></label>
					<div class="add_r f_fl">
                        <XuanZe:XuanZe runat="server" ID="XZ" />
                        <i class="i_shortdesc">可选择10篇</i>
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
                    <label class="add_label f_fl"><span class="f_pdl15">触发次数</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox CssClass="com_input clear_word onlyNumber" MaxLength="6" ID="txtHits" validtype="number" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="pd010 f_lht27 f_fl">次</em>
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
</html>

