<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.video_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
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
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word" MaxLength="60"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>
                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><i class="red_point">*</i>视频关键词</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtKeyName" runat="server" CssClass="com_input clear_word" MaxLength="30"></asp:TextBox><i class="clear_x"></i></span>
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
					<label class="add_label f_fl"><span class="f_pdl15">显示模式</span></label>
					<div class="add_r f_fl set_selects">
						<asp:DropDownList id="ddlMode" runat="server">
                            <asp:ListItem Selected="True" Value="1">只显示促销图片</asp:ListItem>
                            <asp:ListItem Value="2">显示Flv视频源</asp:ListItem>
                            <asp:ListItem Value="3">显示自制作Flash视频</asp:ListItem>
                            <asp:ListItem Value="4">显示第三方视频提供商视频代码</asp:ListItem>
                            <asp:ListItem Value="5">显示标题和简短话术</asp:ListItem>
                        </asp:DropDownList>
					</div>
				</div>

                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl"><span class="f_pdl15">缩略图名称</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtPhotoName" runat="server" CssClass="com_input clear_word" MaxLength="30"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">缩略图</span></label>
                    <div class="add_r f_fl">
						<div class="f_fl f_csp upload_img Upload_Clik" input="hdThumbnail"><span><em class="load_small"></em>点击上传</span></div>
                        <asp:HiddenField runat="server" ID="hdThumbnail" />	
					</div>
                </div>


                <div class="f_cb f_mt25">
				    <label class="add_label f_fl"><span class="f_pdl15">宽度（px）</span></label>
				    <div class="add_r f_fl">
					    <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtWidth" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber"></asp:TextBox><i class="clear_x"></i></span>
					    </div>			
				    </div>
			    </div>
                <div class="f_cb f_mt25">
				    <label class="add_label f_fl"><span class="f_pdl15">高度（px）</span></label>
				    <div class="add_r f_fl">
					    <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtHeight" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber"></asp:TextBox><i class="clear_x"></i></span>
					    </div>			
				    </div>
			    </div>
                <div class="f_cb f_mt25">
				    <label class="add_label f_fl"><span class="f_pdl15">视频URL</span></label>
				    <div class="add_r f_fl">
					    <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtVideoURL" validtype="url_" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					    </div>			
				    </div>
			    </div>
                <div class="f_cb f_mt25">
				    <label class="add_label f_fl"><span class="f_pdl15">URL</span></label>
				    <div class="add_r f_fl">
					    <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtURL" validtype="url_" tipPosition="top" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					    </div>			
				    </div>
			    </div>
                <div class="f_cb f_mt25">
				    <label class="add_label f_fl"><span class="f_pdl15">视频代码</span></label>
				    <div class="add_r f_fl">
					    <div class="f_cb add_typeset bord_gray">
						    <asp:TextBox ID="txtVideoCode" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
					    </div>
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
                    </div>
                </div>
            </div>
		</div>
    </form>
</div>

</body>

</html>
