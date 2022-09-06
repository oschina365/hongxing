<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.Html5Files, qwt" enableviewstate="false" enableviewstatemac="false" %>

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %></title>
    <link href="skins/base/attachment.css" rel="stylesheet" type="text/css" />
    <link href="js/other/webuploader/cur_webuploader.css" rel="stylesheet" type="text/css" />
    <link href="js/other/webuploader/cur_style.css" rel="stylesheet" type="text/css" />
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
<body id="uploader" action="Handler/upload.ashx?action=SaveFilesHttpPostedFile">
    <div class="acce_tile_tab f_cb">
		<ul class="f_cb tab_ul f_fl">
			<li class="zon"><em class="zline1"></em><em class="zline2"></em>本地上传</li>
            <li><em class="zline1"></em>附件库（<span id="_count_">0</span>）</li>
            <li><em class="zline1"></em>网络附件</li>
		</ul>
		<div class="pic_manage f_fr f_csp"><a href="files.aspx" target="_blank">附件管理</a></div>
	</div>

	<div class="acc_cont padlr20 bord_gray f_cb">
		<div style="overflow-y:auto; overflow-x:hidden; height:380px;">
             <!-- 选择相册 -->
             <form id="Form1" runat="server">
			    <div class="loadbar f_cb f_mt30">
                    <label class="f_fl f_mr25">请选择目录</label>
				    <span class="clear_bd f_fl cho_album">
					    <asp:DropDownList ID="ddlColumns" CssClass="pass_faq" runat="server"></asp:DropDownList>
					    <i class="revise_sub"></i>
				    </span>
				    <span class="create_album f_ml10 f_fl" onclick="$('div.make_album_box').toggle();">创建目录</span>
			    </div>
			    <div class="make_album_box f_cb f_mt20">
			        <i class="tri2"></i>
				    <div class="f_cb"></div>
				    <label class="f_fl f_mr25 f_ml10">目录名称</label>
                    <span class="clear_bd f_fl">
                        <asp:TextBox runat="server" ID="txtTitle" CssClass="com_input clear_word" MaxLength="32"></asp:TextBox>
                        <i class="clear_x"></i>
                    </span>
                    <label class="f_fl f_mr20 f_ml15">上下级分类</label>
                        <span class="clear_bd fast_in f_fl f_ml2">
				        <asp:DropDownList ID="ddlColumns01" CssClass="pass_faq" runat="server"></asp:DropDownList>
				        <i class="revise_sub"></i>
				    </span>
				    <span class="e_btn2 f_ml35 f_csp "><i class="save2_icon"></i><asp:Button ID="Button1" runat="server" CommandName="SaveColumn" Text="保 存" OnClick="btnCreate_Click" OnClientClick="return ValidateForm();" style=" height:28px; line-height:28px;" /></span>
			    </div>
            </form>
			<!-- 选择相册 end-->

			<!-- 选图片上传 -->
			<div class="change_load f_mt30 f_cb">
				<span class="file_btn f_fl" style=" position:relative;" id="filePicker">
                    <i style="z-index:10; position:absolute;left:0; top:0; width:106px; height:27px;_filter:alpha(opacity=0);opacity:0; "><b></b></i>
                    <i style=" font-style:normal; position:absolute;left:0; top:0; width:106px; height:27px;">选择附件...</i>
                </span>
			</div>
			<!-- 选图片上传 end-->


			<!-- 预览图列表 -->
			<div class="viewlist bord_gray f_mt30">
				<div class="view_tips">预览插入的附件（上传前是灰色的，可任意修改名称）</div>
				<div class="view_area">
                    <div class="view_area dn">
						<p class="f_tac color_orange" style="padding-top:95px;">暂时无附件，请选择上传！</p>
					</div>
                    <div class="insertList f_cb" id="insertList" style=" display:block;">
						<div class="md_prev f_fl f_csp" id="prev_01"><img src="skins/css/leftjt.gif" /></div>
						<div class="md_hide ann_hide f_fl" id="dndArea">
                            <div style=" position:relative; width:2000px; overflow:hidden;" id="annex_list" class="filelist01">
                                <div class='fl ul_warp'><ul class="annex_list clearfix"></ul></div>
                            </div>
						</div>
						<div class="md_next f_fl f_csp" id="next_01"><img src="skins/css/rightjt.gif" /></div>
					</div>
				</div>	
			</div>
        </div>
		<!-- 预览图列表 end-->
        <div class="view_btn f_tac f_mt30" style="position:relative">
            <div class="statusBar">
                <div class="progress" style=" display:none;">
                    <span class="text">0%</span>
                    <span class="percentage"></span>
                </div>
                <div class="info"></div>
            </div>
            <span class="e_btn1 f_csp uploadBtn" id="ups"><i class="insert_icon"></i>确 定</span>
            <span class="e_btn2 f_ml35 f_csp"><i class="viewCancle_icon"></i>取 消</span>
        </div>
	</div>

	<div class="acc_cont bord_gray">
        <div style="height:400px;" class="iframes"></div>
        <div class="view_btn f_tac mt10 padlr20">
            <span class="e_btn1 f_csp" id="lijicharu"><i class="insert_icon"></i>确 定</span>
            <span class="e_btn2 f_ml35 f_csp"><i class="viewCancle_icon"></i>取 消</span>
        </div>
	</div>
    
    <!--网络图片-->
    <div class="acc_cont padlr20 bord_gray f_cb">
        <div style=" overflow-y:auto; overflow-x:hidden; height:380px;">
            <div class="loadbar f_cb f_mt30">
                <label class="f_fl f_mr25">请选择目录</label>
				<span class="clear_bd f_fl cho_album">
                    <select class="pass_faq" id="xzxc"></select>
					<i class="revise_sub"></i>
				</span>
			</div>
            <div class="loadbar f_cb f_mt30">
                <label class="f_fl f_mr25">目录地址</label>
                <span class="clear_bd f_fl p_inp1 cho_album">
                    <input type="text" class="com_input clear_word pictureAddress" /><i class="clear_x"></i>
                </span>
                <label class="f_fl" style=" width:auto; margin:0 15px;">目录标题</label>
                <span class="clear_bd f_fl p_inp1 cho_album">
                    <input type="text" class="com_input clear_word pictureTitle" /><i class="clear_x"></i>
                </span>
                <span style="font-size:12px; cursor:pointer; margin:0 0 0 10px; background:#efefef; padding:4px 15px;" class="add">保 存</span>
			</div>

            <!-- 预览图列表 -->
		    <div class="viewlist bord_gray f_mt30">
			    <div class="view_tips">网络附件（限<%=Max %>）</div>
			    <div class="view_area">
                    <div class="insertList f_cb" id="insertList02" style=" display:block;">
						<div class="md_prev f_fl f_csp" id="prev_02"><img src="skins/css/leftjt.gif" /></div>
						<div class="md_hide ann_hide f_fl">
                            <div style=" position:relative; width:2000px; overflow:hidden;" id="insertList02_warp">
                                <div class='fl ul_warp'><ul class="annex_list clearfix"></ul></div>
                            </div>
						</div>
						<div class="md_next f_fl f_csp" id="next_02"><img src="skins/css/rightjt.gif" /></div>
					</div>
			    </div>	
		    </div>

        </div>
        <div class="view_btn f_tac mt10 padlr20" style=" position:relative">
            <span class="f_csp f_mr35 dqfs" style="display:inline-block; margin-top:4px;"></span>
            <span class="e_btn1 f_csp" id="shuru"><i class="insert_icon"></i>确 定</span>
            <span class="e_btn2 f_ml35 f_csp"><i class="viewCancle_icon"></i>取 消</span>
        </div>
	</div>

</body>
<script type="text/javascript">
    window.file_types = "<%=string.IsNullOrEmpty(QS("types")) ? NSW.OConfig.Admin.AdminUploadFileTypes.Replace(".", "*.").Replace("|", ";") : QS("types")%>";
    window.directory_ = "<%=QS("directory_") %>";
    var popid = '<%=QS("popid") %>';
    window.PermissionID = "<%=SessionID %>";
    window._MAX_ = <%=Max %>;
    window.bigsize = <%=NVEngine.Tools.NewTools.GetAppWebConfig("bigsize")%> * 1024 * 1024;
</script>
<script src="js/other/webuploader/webuploader.min.js" type="text/javascript"></script>
<script src="js/other/fileswindow.js" type="text/javascript"></script>
<script src="js/other/webuploader/cur_upload.js" type="text/javascript"></script>
</html>