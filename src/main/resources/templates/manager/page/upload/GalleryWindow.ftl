﻿<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
    <head>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>
            图库管理
        </title>
        <link href="/manager/skins/base/common.css" rel="stylesheet" type="text/css">
        <link href="/manager/skins/default/default.css" rel="stylesheet" type="text/css">
        <link href="/manager/skins/base/gallery.css" rel="stylesheet" type="text/css">
        <link href="/manager/js/other/webuploader/cur_webuploader.css" rel="stylesheet" type="text/css">
        <link href="/manager/js/other/webuploader/cur_style.css" rel="stylesheet" type="text/css">
        <!-- hongxin.com.cn/Mobile Baidu tongji analytics -->
        <script src="https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d"></script>
        <script>
            var _hmt = _hmt || [];
            (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>
        <script type="text/javascript" src="/manager/js/easyui/jquery.min.js"></script>
        <script type="text/javascript" src="/manager/js/common/common.js"></script>
        <script type="text/javascript" src="/manager/js/common/popup.js?v=1.1" charset="utf-8" state="complete"></script>
        <script type="text/javascript" src="/manager/js/other/ajax.js?v=1.1" charset="utf-8" state="complete"></script>
    </head>
    <body id="uploader" action="Handler/upload.ashx?action=SavePictureHttpPostedFile" marginwidth="0" marginheight="0">

        <div class="acce_tile_tab f_cb">
            <ul class="f_cb tab_ul f_fl">
                <li class="">
                    <em class="zline1"></em>
                    <em class="zline2"></em>本地上传
                </li>
                <li class="">
                    <em class="zline1"></em>图片库（<span id="_count_">12</span>）
                </li>
                <li class="zon">
                    <em class="zline1"></em>网络图片
                </li>
            </ul>
            <div class="pic_manage f_fr f_csp">
                <a href="pictures.aspx" target="_blank">图片管理</a>
            </div>
        </div>

        <!--本地上传-->
        <div class="acc_cont padlr20 bord_gray f_cb" style="display: none;">
            <div style=" overflow-y:auto; overflow-x:hidden; height:380px;">
                <!-- 选择相册 -->
                <form name="Form1" method="post" action="Html5Gallery.aspx?a=a&amp;max=1&amp;directory=Product&amp;mark=product&amp;popid=pop_PB1TOSQH1FS3PN4MFRUJJ3Q94_11243100" id="Form1">
                    <div>
                        <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE2MjU3Njk2MDhkZL+1EKGLzDtyV5HE4nK68V4vl5XG">
                    </div>

                    <div>

                        <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="EB2D7E6C">
                    </div>
                    <div class="loadbar f_cb f_mt30">
                        <label class="f_fl f_mr25">请选择相册</label>
                        <span class="clear_bd f_fl cho_album">
							<select name="ddlColumns" id="ddlColumns" class="pass_faq">
								<option value="1" directory="pictures">图库根目录</option>
								<option value="2" directory="product" selected="selected">├-产品图片</option>
								<option value="23" directory="gccp">　├-冠臣产品</option>
								<option value="24" directory="jc">　├-佳诚</option>
								<option value="25" directory="bs">　└-板式</option>
								<option value="3" directory="project">├-方案图片</option>
								<option value="4" directory="news">├-资讯图片</option>
								<option value="5" directory="agent">├-招商加盟图片</option>
								<option value="6" directory="help">├-帮助中心图片</option>
								<option value="19" directory="setting">├-网站配置</option>
								<option value="20" directory="others">├-广告</option>
								<option value="22" directory="qt">├-其他</option>
								<option value="26" directory="hbrz">└-环保认证</option>

							</select>
							<i class="revise_sub"></i>
						</span>
                        <span class="create_album f_ml10 f_fl" onclick="$('div.make_album_box').toggle();">创建相册</span>
                    </div>
                    <div class="make_album_box f_cb f_mt20">
                        <i class="tri2"></i>
                        <div class="f_cb"></div>
                        <label class="f_fl f_mr25 f_ml10">相册名称</label>
                        <span class="clear_bd f_fl">
							<input name="txtTitle" type="text" maxlength="32" id="txtTitle" class="com_input clear_word">
							<i class="clear_x"></i>
						</span>
                        <label class="f_fl f_mr20 f_ml15">上下级分类</label>
                        <span class="clear_bd fast_in f_fl f_ml2">
							<select name="ddlColumns01" id="ddlColumns01" class="pass_faq">
								<option value="1" directory="pictures">图库根目录</option>
								<option value="2" directory="product">├-产品图片</option>
								<option value="23" directory="gccp">　├-冠臣产品</option>
								<option value="24" directory="jc">　├-佳诚</option>
								<option value="25" directory="bs">　└-板式</option>
								<option value="3" directory="project">├-方案图片</option>
								<option value="4" directory="news">├-资讯图片</option>
								<option value="5" directory="agent">├-招商加盟图片</option>
								<option value="6" directory="help">├-帮助中心图片</option>
								<option value="19" directory="setting">├-网站配置</option>
								<option value="20" directory="others">├-广告</option>
								<option value="22" directory="qt">├-其他</option>
								<option value="26" directory="hbrz">└-环保认证</option>

							</select>
							<i class="revise_sub"></i>
						</span>
                        <span class="e_btn2 f_ml35 f_csp ">
							<i class="save2_icon"></i>
							<input type="submit" name="Button1" value="保 存" onclick="return _ValidateForm();" id="Button1" style=" height:28px; line-height:28px;">
						</span>
                    </div>

                    <script type="text/javascript">
                        IsPostBack = false;
                    </script>
                </form>
                <!-- 选择相册 end-->

                <!-- 选图片上传 -->
                <div class="change_load f_mt30 f_cb">
					<span class="file_btn f_fl webuploader-container" style=" position:relative;" id="filePicker">
						<div class="webuploader-pick">点击选择图片</div>
						<div id="rt_rt_1gbkk9sdp1jh0162gqeo1mn61sbd2" style="position: absolute; inset: 0px auto auto 17px; width: 72px; height: 27px; overflow: hidden;">
							<input type="file" name="file" class="webuploader-element-invisible" multiple="multiple" accept="image/*">
							<label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
						</div>
					</span>

                    <div class="f_cb f_fl f_ml55">
                        <em class="e_word f_fl f_mr20" onclick="$(this).toggleClass('z_select')"></em>
                        <span>添加水印</span>
                    </div>
                    <div class="add_mark f_ml55 f_fl f_csp popUp" data-src="{&quot;popup&quot;:&quot;Watermark&quot;}">设置图片水印</div>

                </div>
                <!-- 选图片上传 end-->

                <!-- 预览图列表 -->
                <div class="viewlist bord_gray f_mt30">
                    <div class="view_tips">预览插入的图片（缩略图限1张），先<font color="red">选择分类</font>后再点击上传</div>
                    <div class="view_area">
                        <div class="view_area dn">
                            <p class="f_tac color_orange" style="padding-top:95px;">暂时无图片，请选择上传！</p>
                        </div>
                        <div class="insertList f_cb" id="insertList" style=" display:block;">
                            <div class="md_prev f_fl f_csp" id="prev_01">
                                <img src="/manager/skins/Img/leftjt.gif">
                            </div>
                            <div class="md_hide f_fl" id="dndArea">
                                <div style="width:562px;height:auto;overflow:hidden;position: relative;">
                                    <ul class="f_cb ThumbnailImage filelist" data-src="{&quot;width&quot;:&quot;112&quot;,&quot;show&quot;:&quot;5&quot;,&quot;prev&quot;:&quot;#prev_01&quot;,&quot;next&quot;:&quot;#next_01&quot;}" style="width:10000px;position:relative;left:0;top:0;"></ul>
                                </div>
                            </div>
                            <div class="md_next f_fl f_csp" id="next_01">
                                <img src="/manager/skins/Img/rightjt.gif">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 预览图列表 end-->
            <div class="view_btn f_tac f_mt30" style=" position:relative;">
                <div class="statusBar">
                    <div class="progress" style=" display:none;">
                        <span class="text">0%</span>
                        <span class="percentage" style="width: 0%;"></span>
                    </div>
                    <div class="info">共0个（0B），已上传0个</div>
                </div>

                <span class="e_btn1 f_csp uploadBtn state-pedding" id="ups">
					<i class="insert_icon"></i>
					<em style=" font-style:normal;">确 定</em>
				</span>
                <span class="e_btn2 f_ml35 f_csp">
					<i class="viewCancle_icon"></i>取 消
				</span>
            </div>
        </div>

        <!--图片库-->
        <div class="acc_cont bord_gray" style="display: none;">
            <div style="height:400px;" class="iframes">
                <iframe src="/manage/SearchImages" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="searchImages" name="searchImages"></iframe>
                <div class="clear"></div>
            </div>
            <div class="view_btn f_tac mt10 padlr20">

				<span class="e_btn1 f_csp" id="lijicharu">
					<i class="insert_icon"></i>确 定
				</span>
                <span class="e_btn2 f_ml35 f_csp">
					<i class="viewCancle_icon"></i>取 消
				</span>
            </div>
        </div>

        <!--网络图片-->
        <div class="acc_cont padlr20 bord_gray f_cb" style="display: block;">
            <div style=" overflow-y:auto; overflow-x:hidden; height:380px;">
                <div class="loadbar f_cb f_mt30">
                    <label class="f_fl f_mr25">请选择相册</label>
                    <span class="clear_bd f_fl cho_album">
						<select class="pass_faq" id="xzxc">
							<option value="1" directory="pictures">图库根目录</option>
							<option value="2" directory="product" selected="selected">├-产品图片</option>
							<option value="23" directory="gccp">　├-冠臣产品</option>
							<option value="24" directory="jc">　├-佳诚</option>
							<option value="25" directory="bs">　└-板式</option>
							<option value="3" directory="project">├-方案图片</option>
							<option value="4" directory="news">├-资讯图片</option>
							<option value="5" directory="agent">├-招商加盟图片</option>
							<option value="6" directory="help">├-帮助中心图片</option>
							<option value="19" directory="setting">├-网站配置</option>
							<option value="20" directory="others">├-广告</option>
							<option value="22" directory="qt">├-其他</option>
							<option value="26" directory="hbrz">└-环保认证</option>
						</select>
						<i class="revise_sub"></i>
					</span>
                </div>
                <div class="loadbar f_cb f_mt30">
                    <label class="f_fl f_mr25">图片地址</label>
                    <span class="clear_bd f_fl p_inp1 cho_album">
						<input type="text" class="com_input clear_word pictureAddress">
						<i class="clear_x"></i>
					</span>
                    <label class="f_fl" style=" width:auto; margin:0 15px;">图片标题</label>
                    <span class="clear_bd f_fl p_inp1 cho_album">
						<input type="text" class="com_input clear_word pictureTitle">
						<i class="clear_x"></i>
					</span>
                    <span style="font-size:12px; cursor:pointer; margin:0 0 0 10px; background:#efefef; padding:4px 15px;" class="add">保 存</span>
                </div>

                <!-- 预览图列表 -->
                <div class="viewlist bord_gray f_mt30">
                    <div class="view_tips">网络的图片（缩略图限1张）</div>
                    <div class="view_area">
                        <div class="insertList f_cb" id="insertList02" style=" display:block;">
                            <div class="md_prev f_fl f_csp" id="prev_02">
                                <img src="/manager/skins/Img/leftjt.gif">
                            </div>
                            <div class="md_hide f_fl">
                                <div style="width:562px;height:auto;overflow:hidden;position: relative;">
                                    <ul class="insertimg_list f_cb ThumbnailImage" data-src="{&quot;width&quot;:&quot;112&quot;,&quot;show&quot;:&quot;5&quot;,&quot;prev&quot;:&quot;#prev_02&quot;,&quot;next&quot;:&quot;#next_02&quot;}" style="width:10000px;position:relative;left:0;top:0;"></ul>
                                </div>
                            </div>
                            <div class="md_next f_fl f_csp" id="next_02">
                                <img src="/manager/skins/Img/rightjt.gif">
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="view_btn f_tac mt10 padlr20">

				<span class="e_btn1 f_csp" id="shuru">
					<i class="insert_icon"></i>确 定
				</span>
                <span class="e_btn2 f_ml35 f_csp">
					<i class="viewCancle_icon"></i>取 消
				</span>
            </div>
        </div>

        <script type="text/javascript">
            window.directory_ = "";
            var popid = 'pop_PB1TOSQH1FS3PN4MFRUJJ3Q94_11243100';
            var host = window.location.host + "";
            var host_ = "http://" + host;
            var CheckSizeBool = true;
            var Ratio = "";
            var Width = "";
            var Height = "";
            window.PermissionID = "4IztuGHwDC4mssbXpx75IZYjUbTlE1Fd5pBC2ohPHCgJi9qy99t35/svHUcvWktHN9SDdA4tAuBqJKZRit5qVKDNtWIMAbvaHr7lYWw85qkWgSOxJ0MpeYLTy8n69E1b";
            window._MAX_ = 1;
            window.smallsize = 11 * 1024 * 1024;
        </script>
        <script src="/manager/js/other/webuploader/webuploader.min.js" type="text/javascript"></script>
        <script src="/manager/js/other/gallerywindow.js" type="text/javascript"></script>
        <script src="/manager/js/other/webuploader/cur_upload.js" type="text/javascript"></script>
        <script src="/manager/js/other/thumbnailImage.js" type="text/javascript"></script>

    </body>
    <script type="text/javascript">
        window._MAX_ = <%=Max %>;
        window.smallsize = "<%=NVEngine.Tools.NewTools.GetAppWebConfig("smallsize")%>";
        window.bigsize = "<%=NVEngine.Tools.NewTools.GetAppWebConfig("bigsize")%>";
        window.directory_ = "<%=QS("directory_") %>";
        var popid = '<%=QS("popid") %>';
        var host = window.location.host + "";
        var host_ = "http://"+window.location.host + "";
        var CheckSizeBool = <%=(!NSW.OConfig2.SMTP.GetConfig("CheckSize").Equals("false")).ToString().ToLower()%>;
        var Ratio = "";
        var Width = "";
        var Height = "";
        window.PermissionID = "<%=SessionID %>";
    </script>
    <script src="/manager/js/SWFUpload.js" type="text/javascript"></script>
    <script src="/manager/js/multiimage.js" type="text/javascript"></script>
    <script src="/manager/js/other/thumbnailImage.js" type="text/javascript"></script>
    <script src="/manager/js/other/gallerywindow.js" type="text/javascript"></script>
</html>