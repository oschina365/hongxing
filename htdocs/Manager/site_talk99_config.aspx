<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.site_talk99_config, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%= ItemName %></title>
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
<div class="col_main ">
    <form id="form2" runat="server" onsubmit="top.refreshList=true;">
	    <div class="add_cont pad300 j_recordCon_c f_cb">
	        <!-- Talk99 -->
            <div class="cont1 settab_lh18">

                <div class="f_cb">
					<label class="add_label f_fl">是否启用Talk99</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <radio_control:radio_control runat="server" GroupName="editors" ID="rdoTalk99Yes" Text="是" />
                            <radio_control:radio_control runat="server" GroupName="editors" ID="rdoTalk99No" Text="否" />
                        </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">其他链接</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtOtherlinks" runat="server" CssClass="com_input clear_word" ></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
				    <label class="add_label f_fl"><span class="f_pdl15">Talk99ID</span></label>
				    <div class="add_r f_fl">
                       <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTalk99ID" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
						</div>
				    </div>
			    </div>

                <div class="f_cb f_mt25">
				    <label class="add_label f_fl"><span class="f_pdl15">探头ID</span></label>
				    <div class="add_r f_fl">
                       <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTalk99TanTouID" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
                            <span class="text"><a href="javascript:;" onclick="GetTalk99(this,true);">获取探头</a></span>
						</div>
				    </div>
			    </div>

                <div class="f_cb f_mt25">
				    <label class="add_label f_fl"><span class="f_pdl15">分组ID</span></label>
				    <div class="add_r f_fl">
                       <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTalk99GroupID" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">填写主要的一个分组ID。</i>
				    </div>
			    </div>

                <div class="f_cb f_mt25">
				    <label class="add_label f_fl"><span class="f_pdl15">客服ID</span></label>
				    <div class="add_r f_fl">
                       <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTalk99KefuID" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">填写主要的一个分组ID下面的客服ID</i>
				    </div>
			    </div>

                <div class="f_cb f_mt25 dn">
				    <label class="add_label f_fl"><span class="f_pdl15">Talk99免费电话信息</span></label>
				    <div class="add_r f_fl">
                       <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtCallPhone" runat="server" CssClass="com_input clear_word onlyNumber" reginput="telinfo" ></asp:TextBox><i class="clear_x"></i></span>
						</div>
				    </div>
			    </div>

                <div class="f_cb f_mt25">
				    <label class="add_label f_fl">
                        <span class="f_pdl15">获取Talk99<br />其他客服链接</span>
                        <span id="Related" onclick="Related();" style="display:block; border:1px solid #dcdcdc; width:100px; text-align:center; height:28px; line-height:28px; margin-top:5px; cursor:pointer;">
                            <i class="addtab_mark"></i>
                            添加其他客服
                        </span>
                    </label>
				    <div class="add_r f_fl" id="addRelated"></div>
			    </div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">Talk99图片上传</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_typeset bord_gray">
                            <asp:TextBox CssClass="text_area tx1" MaxLength="500" ID="txtImagePath" runat="server" TextMode="MultiLine"></asp:TextBox>
						</div>
                        <span id="gtimg" style="display:block; border:1px solid #dcdcdc; width:100px; text-align:center; height:28px; line-height:28px; margin-top:5px; margin-left:5px;">
                            <i class="addtab_mark"></i>
                            图片上传
                        </span>
					</div>
				</div>

            </div>
            <!--Talk99 end-->

            <!--按钮-->
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15"></span></label>
                <div class="add_r f_fl">
                    <!-- 保存并返回 -->
			        <div class="view_btn f_mt30">
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                    </div>
                </div>
            </div>
		</div>
    </form>
</div>
<script type="text/javascript">
    var _temp_ = [
        '<div class="f_cb add_sv mb10">',
		'   分组ID：<span class="clear_bd span_max_w50"><input type="text" class="com_input clear_word gid"/><i class="clear_x"></i></span>',
        '   <span class="ml10">客服ID：</span><span class="clear_bd span_max_w50"><input type="text" class="com_input clear_word sid"/><i class="clear_x"></i></span>',
        '   <a class="ml10" href="javascript:;" onclick="GetTalk99(this);">获取探头</a>',
    '</div>'
    ].join('');
    var Related = function () {
        $("#addRelated").append(_temp_);
        SetClearWord($("#addRelated div.f_cb:last").find("input.clear_word"));
    }
    var SetTalk99Value = function (value) {
        if (window.Talk99Pop_) {
            window.Talk99Pop_.setValue(value);
        } else {
            loadJs("js/common/popup.js", function () {
                window.Talk99Pop_ = GetTalk99Pop();
                window.Talk99Pop_.setValue(value);
            })
        }
    }
    var GetTalk99 = function (src, isSingle) {
        var iid = $tv("txtTalk99ID");
        var tid = $tv("txtTalk99TanTouID");
        if (isSingle) {
            if (iid == "" || tid == "") {
                _alert("Talk99ID，探头ID不能为空！", false);
            } else {
                SetTalk99Value("http://p.qiao.baidu.com/cps/chat?siteId=" + iid + "&f=" + tid);
            }
        } else {
            var div = $(src).parents("div.add_sv");
            var gid = $.trim(div.find(".gid").val());
            var sid = $.trim(div.find(".sid").val());
            if (gid == "" || sid == "" || iid == "" || tid == "") {
                _alert("Talk99ID，探头ID，分组ID，客服ID不能为空！", false);
            } else {
                SetTalk99Value("http://p.qiao.baidu.com/cps/chat?siteId=" + iid + "&f=" + tid + "&g=" + gid + "&n=" + sid);
            }
        }
    }

    $(function () {
        var imagePath = $("#txtImagePath");
        $("#gtimg").bind("click", function () {
            var me = $(this);
            if (!me.data("image")) {
                loadJs("js/common/editor.js", function () {
                    var _image = new kindeditor_image(this, {
                        Item: function (data) {
                            imagePath.val(imagePath.val() + data.url + "\r\n");
                            //self.exec('insertimage', data.url, data.title);
                        }
                    });
                    me.data("image", _image);
                });
            } else {
                var me = me.data("image").pop;
                me.show();
            }
        })
    })
</script>
</body>
</html>