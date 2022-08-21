<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.tbFields_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
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
<div class="col_main one_tab_1">
    <form id="form2" runat="server" onsubmit="top.refreshList=true;">
	    <div class="add_cont pad300 j_recordCon_c f_cb">
	        <!-- 帮助基本信息 -->
            <div class="cont1 settab_lh18">
				<div class="f_cb">
					<label class="add_label f_fl"><i class="red_point">*</i>字段名称</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>
                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl">字段类型</label>
					<div class="add_r f_fl" id="filType">
						<div class="f_cb add_sv set_radios">
							<asp:RadioButtonList ID="RadiotType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="text" Selected="True">文本框</asp:ListItem>
                                <asp:ListItem Value="textarea">多行文本</asp:ListItem>
                                <asp:ListItem Value="radio">单选框</asp:ListItem>
                                <asp:ListItem Value="checkbox">多选框</asp:ListItem>
                                <asp:ListItem Value="select">下拉框</asp:ListItem>
                            </asp:RadioButtonList>
						</div>			
					</div>
				</div>

                <div class="f_cb f_mt25 _text_">
                    <label class="add_label f_fl"><span class="f_pdl15">文本长度</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtLength" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" Text="30"></asp:TextBox><i class="clear_x"></i></span>
                        </div>
					</div>
                </div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">后台列表显示</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <radio_control:radio_control ID="rdoListShowYes" Checked="true" runat="server" Text="显示" />
                            <radio_control:radio_control ID="rdoListShowNo" runat="server" Text="不显示" />
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25 _text_ required">
					<label class="add_label f_fl">必填项</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <radio_control:radio_control ID="rdoRequiredYes" runat="server" Text="必填" />
                            <radio_control:radio_control ID="rdoRequiredNo" Checked="true" runat="server" Text="非必填" />
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25 _text_">
					<label class="add_label f_fl">开启验证内容是否合法</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <radio_control:radio_control ID="rdoVerifyYes" runat="server" Text="开启" onclick="$('#spanVerifyContents').show();" />
                            <radio_control:radio_control ID="rdoVerifyNo" Checked="true" runat="server" onclick="$('#spanVerifyContents').hide();" Text="关闭" />
                            <span id="spanVerifyContents">
                                <span class="clear_bd s_selt f_fl mr10 w160">
                                    <asp:DropDownList ID="ddlVerifyContents" runat="server" CssClass="pass_faq">
                                        <asp:ListItem Value="">请选择需要验证的内容</asp:ListItem>
                                        <asp:ListItem Value="/1(?:[38]\d|4[57]|5[01256789])\d{8}/">确保录入内容为手机号码</asp:ListItem>
                                        <asp:ListItem Value="/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/">确保录入内容为电子邮件</asp:ListItem>
                                        <asp:ListItem Value="/^\d*$/">确保录入内容为数字</asp:ListItem>
                                        <asp:ListItem Value="4">自定义正则表达式(程序员专用)</asp:ListItem>
                                    </asp:DropDownList>
                                    <i class="revise_sub"></i>
                                </span>
                                <script type="text/javascript">
                                    $(function () {
                                        $("#ddlVerifyContents").bind("change", function () {
                                            if ($(this).val() == "4") {
                                                $("#spanRegular").show();
                                            } else {
                                                $("#spanRegular").hide();
                                            }
                                        }).change();
                                    })
                                </script>
                                <span class="dn" id="spanRegular">
                                    <span class="f_fl text">自定义正则：</span>
                                    <span class="clear_bd f_fl p_inp1 span_max_w100">
                                        <asp:TextBox ID="TextRegular" runat="server" CssClass="com_input clear_word"></asp:TextBox>
                                        <i class="clear_x"></i>
                                    </span>
                                </span>
                            </span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25 _text_">
                    <label class="add_label f_fl"><span class="f_pdl15">录入框初始文本</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtInitialText" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
                        </div>
					</div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">说明文本</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtShortDesc" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
                        </div>
					</div>
                </div>

                <div class="f_cb f_mt25" id="div_xx">
                    <label class="add_label f_fl"><span class="f_pdl15">选项</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
                            <style>
                                .mainTab{ width:80%; border:1px solid #dcdcdc; padding:0; margin:0;}
                                .mainTab .notTr{line-height:35px;font-weight: bold;color: #3e4048;background: #f6f6f6; border-bottom:1px solid #d6d6d6; border-top:1px solid #d6d6d6;}
                                .mainTab th{ text-align:left; padding:0 5px;}
                                .mainTab td{border-top:1px dashed #dcdcdc; line-height:20px; padding:8px 5px}
                                .mainTab .bt{ padding-left:20px;}
                            </style>
                            <table class="mainTab">
                                <tbody>
                                    <tr class="notTr">
                                        <th style=" width:22%;" class="bt">标题</th>
                                        <th style=" width:22%;">默认值</th>
                                        <th style=" width:22%;">默认选项</th>
                                        <th style=" width:14%;">排序</th>
                                        <th style=" width:14%;">删除</th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <asp:HiddenField runat="server" ID="hdValue" />
                        <div class="f_cb add_sv mt10">
                            <span class="text_">选项名称：</span>
                            <span class="clear_bd p_inp1 span_max_w80">
                                <input class="com_input clear_word" id="txt_Title" />
                                <i class="clear_x"></i>
                            </span>
                            <span class="text_">选项值：</span>
                            <span class="clear_bd p_inp1 span_max_w80">
                                <input class="com_input clear_word" id="txt_Value" />
                                <i class="clear_x"></i>
                            </span>
                            <span class="text_">
                                <a href="javascript:;" class="aTj">+添加到选项</a>
                            </span>
                        </div>
                        <script type="text/javascript">
                            var SaveKeyValues = function (tab) {
                                tab = $(tab);
                                var value = "";
                                tab.find("tr:gt(0)").each(function () {
                                    var tr = $(this);
                                    var str = "$$";
                                    str += _allReplace(tr.find("td.bt").text().trim(), "[|$]", "，") + "||";
                                    str += _allReplace(tr.find("td.mrz").text().trim(), "[|$]", "，") + "||";
                                    str += tr.find("td.mrxx input:checked").length > 0;
                                    value += str;
                                })
                                value += "$$";
                                $("#hdValue").val(value);
                            }
                            var _ValidateForm = function (src) {
                                if (ValidateForm(src)) {
                                    if ($("#div_xx:visible").length) {
                                        var tab = $("table.mainTab tbody");
                                        if (tab.find("tr").length < 2) {
                                            _alert("请填写选项！");
                                            return false;
                                        }
                                        SaveKeyValues(tab);
                                    }
                                    return true;
                                }
                                return false;
                            }
                            $(function () {
                                var tab = $("table.mainTab tbody");
                                var temp = [
                                    '<tr>',
                                    '    <td class="bt">{text}</td>',
                                    '    <td class="mrz">{value}</td>',
                                    '    <td class="mrxx">',
                                    '        <input type="checkbox" value="1" name="moren">',
                                    '    </td>',
                                    '    <td class="px">',
                                    '        <a class="shang" href="javascript:;">↑</a>',
                                    '        <a style="margin:5px;" class="xia" href="javascript:;">↓</a>',
                                    '    </td>',
                                    '    <td class="sc">',
                                    '        <a href="javascript:;">×</a>',
                                    '    </td>',
                                    '</tr>'
                                ].join('');
                                $("a.aTj").click(function () {
                                    var title = $tv("txt_Title").trim();
                                    var value = $tv("txt_Value").trim();
                                    if (title == "") {
                                        _alert("请填写选项名称！");
                                        return false;
                                    }
                                    var isTrue = true;
                                    tab.find("td.bt").each(function () {
                                        if ($(this).text().trim() == title) {
                                            _alert("已存在相同选项！");
                                            isTrue = false;
                                            return false;
                                        }
                                    })
                                    if (isTrue) {
                                        tab.find("td.mrz").each(function () {
                                            if ($(this).text().trim() == value) {
                                                _alert("已存在相同值！");
                                                isTrue = false;
                                                return false;
                                            }
                                        })
                                    }
                                    if (isTrue) {
                                        tab.find("tr:last").after(temp.replace('{text}', title).replace('{value}', value));
                                        $tv("txt_Title", "");
                                        $tv("txt_Value", "");
                                    }
                                })
                                $(document).on("click", "td.mrxx input", function () {
                                    var me = $(this);
                                    if (type != "checkbox") {
                                        if (me.attr("checked")) {
                                            me.parents("tr").siblings("tr").find("td.mrxx input:checked").attr("checked", false);
                                        }
                                    }
                                })
                                $(document).on("click", "td.sc a", function () {
                                    var me = $(this);
                                    _confirm("确定删除该选项吗？", function () {
                                        me.parents("tr").remove();
                                    });
                                })
                                $(document).on("click", "td.px a", function () {
                                    var tr = $(this).parents("tr");
                                    if ($(this).hasClass("shang")) {
                                        var prev = tr.prev("tr");
                                        if (prev.length && !prev.hasClass("notTr")) {
                                            tr.insertBefore(prev);
                                        } else {
                                            _alert("已经是最顶上了！");
                                        }
                                    } else {
                                        var next = tr.next("tr");
                                        if (next.length) {
                                            next.insertBefore(tr);
                                        } else {
                                            _alert("已经是最后了！");
                                        }
                                    }
                                })
                                var Type = "";
                                $("input[name='RadiotType']").bind("ev_click", function () {
                                    var me = $(this);
                                    if (me.val() == "text" || me.val() == "textarea") {
                                        $("#div_xx").hide();
                                        $("div._text_").show();
                                    } else {
                                        $("#div_xx").show();
                                        $("div._text_").hide();
                                        if (me.val() == "checkbox") {
                                            $("div.required").show();
                                        }
                                    }
                                    Type = me.val();
                                }).filter(":checked").trigger("ev_click");

                                var value = $tv("hdValue").trim();
                                if (value.length) {
                                    var KeyValues = value.split('$$'), values;
                                    if (KeyValues) {
                                        for (var i = 0; i < KeyValues.length; i++) {
                                            var keyValue = KeyValues[i];
                                            if (keyValue) {
                                                values = keyValue.split('||');
                                                if (values && values.length == 3) {
                                                    tab.find("tr:last").after(temp.replace('{text}', values[0]).replace('{value}', values[1]));
                                                    if (values[2] == "true") {
                                                        tab.find("tr:last td.mrxx input").attr("checked", true);
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            })
                        </script>
                    </div>
                </div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">自定义模版</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_typeset bord_gray" style=" height:180px;">
						    <asp:TextBox ID="txtTemp" runat="server" CssClass="text_area tx1" TextMode="MultiLine" style=" line-height:14px;"></asp:TextBox>
					    </div>
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
            <!--其他信息 end-->

            <!--按钮-->
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15"></span></label>
                <div class="add_r f_fl">
                    <!-- 保存并返回 -->
			        <div class="view_btn f_mt30">
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="Button1" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return _ValidateForm(this);" /></span>
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
