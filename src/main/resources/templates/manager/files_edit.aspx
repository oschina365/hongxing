<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.files_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<%--<div id="body">
<form id="form1" runat="server" onsubmit="top.refreshList=true">
<div class="loc"><a href="admin_welcome.aspx">后台首页</a> &raquo; <a href="javascript:;" onclick="parent.listView()"><%= ItemName %></a>  &raquo; <span class="last"><%= OID > 0 ? "更新" : "新建" %></span></div>
<table class="editorTb">
    <tr>
        <td class="hd" colspan="2"><%= ItemName %>（<%= OID > 0 ? "Object ID: " + OID : "新建对象" %>）</td>
    </tr>
    <tr>
        <td class="titl"><b>文件:</b></td>
        <td><asp:Literal ID="ltlPath" runat="server"></asp:Literal>
        <asp:FileUpload ID="fu1" CssClass="txt" runat="server" Width="300px" /></td>
    </tr>
    <%if (OID > 0)
      { %>
    <tr>
        <td class="titl"><b>原始文件名:</b></td>
        <td><asp:Literal ID="ltlSrcFilename" runat="server"></asp:Literal></td>
    </tr>
    <tr>
        <td class="titl"><b>扩展名:</b></td>
        <td><asp:Literal ID="ltlExt" runat="server"></asp:Literal></td>
    </tr>
    <tr>
        <td class="titl"><b>描述:</b></td>
        <td><asp:Literal runat="server" ID="ltlDesp"></asp:Literal></td>
    </tr>
    <tr>
        <td class="titl"><b>大小:</b></td>
        <td><asp:Literal runat="server" ID="ltlContentSize"></asp:Literal></td>
    </tr>
    <%}
      else
      { %>
    <tr>
        <td class="titl"><b>新文件名:</b></td>
        <td><asp:RadioButton GroupName="newfilename" onclick="newfilename_Changed(false)" ID="rdoDateTimeRandom" runat="server" Text="日期时间加随机字符" Checked="true" />
            <asp:RadioButton GroupName="newfilename" onclick="newfilename_Changed(false)" ID="rdoRandom" runat="server" Text="随机字符" />
            <asp:RadioButton GroupName="newfilename" onclick="newfilename_Changed(true)" ID="rdoCustom" runat="server" Text="自定义" /></td>
    </tr>
    <tr style="display:none" id="trNewFilename">
        <td class="titl"><b>新文件名:</b></td>
        <td><asp:TextBox ID="txtNewFilename" runat="server" CssClass="txt" MaxLength="50"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="titl"><b>描述:</b></td>
        <td><asp:TextBox runat="server" CssClass="txt" ID="txtDesp"></asp:TextBox></td>
    </tr>
  <%  } %>
    
    
    <tr>
        <td class="titl"><b>录入时间:</b></td>
        <td><asp:TextBox ID="txtInputTime" runat="server" CssClass="txt disable" Enabled="false"></asp:TextBox></td>
    </tr>
    <tr>
        <td><input name="button" type="reset" onclick="parent.listView()" value="返回" class="return" /><input name="button" type="reset" onclick="location=location.pathname" value="新建" class="new mL18" /><asp:Button ID="btnDel" runat="server" OnClick="btnSubmit_Click" OnClientClick="return confirm('确定删除对象？')" CommandName="del" Text="删除" CssClass="del mL18" CausesValidation="false" /></td>
        <td><asp:Button ID="btnSave" runat="server" CommandName="save" OnClick="btnSubmit_Click" Text="保存" CssClass="save" /><asp:Button ID="btnSaveReturn" runat="server" CommandName="return" OnClick="btnSubmit_Click" Text="保存并返回" CssClass="return mL18" /><input name="Submit" type="reset" value="重填" class="btn mL18" /></td>
    </tr>
</table>
</form></div>--%>
<div class="col_main one_tab_1">
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
					<label class="add_label f_fl"><span class="f_pdl15">附件</span></label>
                    <div class="add_r f_fl">
                        <asp:FileUpload ID="fu1" runat="server" style=" margin-left:5px;" /><br />
                        <span class="clear_bd f_fl p_inp1 mt10"><asp:TextBox ID="txtPath" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">所属分类</span></label>
					<div class="add_r f_fl set_selects">
						<asp:DropDownList id="ddlColumns" runat="server"></asp:DropDownList>	
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">简短描述</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_typeset bord_gray">
							<asp:TextBox ID="txtShortDesc" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
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
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="Button1" CommandName="return" runat="server" Text="保存并返回" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                        <span class="e_btn1 f_csp fl f_ml35"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="save" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                        <span class="e_btn1 f_ml35 f_csp fl" runat="server" id="btnDel"><i class="insert_icon"></i><asp:Button ID="Button3" CommandName="del" runat="server" Text="删 除" onclick="btnSubmit_Click" /></span>
                        <span class="e_btn2 f_ml35 f_csp fl"><i class="reset_icon"></i><input type="reset" value="重 填" /></span>
                    </div>
                </div>
            </div>
		</div>
    </form>
</div>
</body></html>
