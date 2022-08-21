<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.MobileConfig, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%= ItemName %></title>
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
<script type="text/javascript" src="Inc/JS/Mobile.js"></script>
<CurrentPosition:CurrentPosition runat="server" ID="cur"/>
<form id="form2" runat="server" onsubmit="top.refreshList=true;">
 <div class="add_cont pad300 j_recordCon_c f_cb">

	        <!-- 手机配置 基本信息 -->
            <div class="cont1">
				<div class="f_cb">
					<label class="add_label f_fl">手机网站域名</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word " ID="txtMSiteDomain" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">手机网站Logo</label>
                    <div class="add_r f_fl">
                        <div class="colum_onload f_csp f_fl Upload_Clik" input="ImgUploadMLogo" id="ThumbnailUpload" directory_="/Mobile/UploadFiles/Common/" directory="Setting">
                            <i class="colum_icon"></i>
                            <p class="f_tac f_lht27">点击上传</p>
                        </div>
                        <asp:HiddenField runat="server" ID="ImgUploadMLogo" />	
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl">手机网站底部二维码</label>
                    <div class="add_r f_fl">
                        <div class="colum_onload f_csp f_fl Upload_Clik" input="ImgUploadMCode" id="ThumbnailUpload1" directory_="/Mobile/UploadFiles/Common/" directory="Setting">
                            <i class="colum_icon"></i>
                            <p class="f_tac f_lht27">点击上传</p>
                        </div>
                        <asp:HiddenField runat="server" ID="ImgUploadMCode" />
					</div>
				</div>
                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl">商品导航子导航显示模式</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <radio_control:radio_control ID="rdobtnFont" runat="server" onclick="mobileNavModelSelect()" GroupName="MobileNavModel" Text="纯文本" />
                            <radio_control:radio_control ID="rdobtnFontImg" runat="server" onclick="mobileNavModelSelect()" GroupName="MobileNavModel" Text="图标+标题"/>
						</div>			
					</div>
				</div>
                
                <div class="f_cb f_mt25"  id="MobileNavCountRow">
					<label class="add_label f_fl">商品导航子导航显示列数</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <radio_control:radio_control ID="rdobtnCol1" runat="server" onclick="mobileProSanJi()" GroupName="MobileNavCount" Text="1列" />
                            <radio_control:radio_control ID="rdobtnCol2" runat="server" onclick="mobileProSanJi()" GroupName="MobileNavCount" Text="2列"/>
                            <radio_control:radio_control ID="rdobtnCol3" runat="server" onclick="mobileProSanJi()" GroupName="MobileNavCount" Text="3列"/>
						</div>			
					</div>
				</div>
                
                <div class="f_cb f_mt25"  id="Sanji">
					<label class="add_label f_fl">是否显示商品导航三级子导航</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <radio_control:radio_control ID="rdobtnSanjiYes" runat="server" GroupName="MobileNavSanJi" Text="是" />
                            <radio_control:radio_control ID="rdobtnSanjiNo" runat="server" GroupName="MobileNavSanJi" Text="否"/>
						</div>			
					</div>
				</div>

                <div class="f_cb f_mt25"  id="Tr5">
					<label class="add_label f_fl">资讯导航子导航显示列数</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <radio_control:radio_control ID="rdobtnNewsCol1" runat="server" GroupName="MobileNewsNavCount" Text="1列" />
                            <radio_control:radio_control ID="rdobtnNewsCol2" runat="server" GroupName="MobileNewsNavCount" Text="2列"/>
                            <radio_control:radio_control ID="rdobtnNewsCol3" runat="server" GroupName="MobileNewsNavCount" Text="3列"/>
						</div>			
					</div>
				</div>

                <div class="f_cb f_mt25"  id="Tr7">
					<label class="add_label f_fl">手机网站图片清晰度</label>
					<div class="add_r f_fl">
				        <div class="f_cb add_sv">
                            <span class="clear_bd s_selt f_fl pt43 f_mr15" style=" width:120px;">
                                <asp:DropDownList ID="rdoImageFlag" CssClass="pass_faq" runat="server" Width="120">
                                    <asp:ListItem Value="2" Selected="True">高清[非常耗流量]</asp:ListItem>
                                    <asp:ListItem Value="1">标清[耗流量]</asp:ListItem>
                                    <asp:ListItem Value="0">普通[访问流畅]</asp:ListItem>
                                </asp:DropDownList>
                                <i class="revise_sub"></i>

                            </span>
						</div>			
					</div>
				</div>
                
				<div class="f_cb f_mt25">
					<label class="add_label f_fl">企业微信二维码</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word " ID="txtweixin" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>
                
				<div class="f_cb f_mt25">
					<label class="add_label f_fl">新浪企业微博</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word " ID="txtweibo" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>
                
				<div class="f_cb f_mt25">
					<label class="add_label f_fl">腾讯企业微博</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word " ID="txtqqweibo" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>

				<div class="f_cb f_mt25 dn">
					<label class="add_label f_fl">传真</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word " ID="txtFax" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>

				<div class="f_cb f_mt25">
					<label class="add_label f_fl">网站备案</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word " ID="txtRecords" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>

				<div class="f_cb f_mt25">
					<label class="add_label f_fl">控制业务员ID</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word " ID="txtControlSalesManID" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>

				<div class="f_cb f_mt25">
					<label class="add_label f_fl">地址</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word " ID="txtAddress" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>

				<div class="f_cb f_mt25">
					<label class="add_label f_fl">公司地图的经纬度</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							 经度：<span class="clear_bd span_max_w100 f_mr10"><asp:TextBox runat="server" ID="txtlng" CssClass="com_input clear_word gid"/><i class="clear_x"></i></span>纬度：<span class="clear_bd span_max_w100 f_mr10"><asp:TextBox runat="server" ID="txtlat" CssClass="com_input clear_word gid"/><i class="clear_x"></i></span>
						</div>	
                        <i class="i_shortdesc">若填写了经纬度，那么公司地图读取填写的经纬度来生成地图。否则，读取上面填写的地址转换成经纬度来生成地图。<br/>强烈建议填写公司经纬度，这样公司地图信息十分精准，否则根据地址定位在Android下会出现偏移情况。</i>
					</div>
				</div>

				<div class="f_cb f_mt25">
					<label class="add_label f_fl">默认短信号码</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word " ID="txtMessage" runat="server"></asp:TextBox><i class="clear_x"></i></span>	
						</div>			
					</div>
				</div>

				<div class="f_cb f_mt25">
					<label class="add_label f_fl">是否开启手机网站特有配置</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <span class="clear_bd s_selt f_fl pt43 f_mr15" style=" width:100px;">
                            <asp:DropDownList ID="drpUseMobile" runat="server" style="width:100px" CssClass="pass_faq">
                                <asp:ListItem Value="true">是</asp:ListItem>
                                <asp:ListItem Value="false">否</asp:ListItem>
                            </asp:DropDownList>
                            </span>
						</div>	
                        <i class="i_shortdesc">若开启，则产品分类，资讯分类显示手机网站每个分类的展示方式，同时产品、资讯、帮助、招商加盟管理页显示手机静态页查看地址，若关闭，则以上都不显示</i>		
					</div>
				</div>


            </div>
            
        <!--按钮-->
        <div class="f_cb f_mt25">
            <label class="add_label f_fl"><span class="f_pdl15"></span></label>
            <div class="add_r f_fl">
                <!-- 保存并返回 -->
			    <div class="view_btn f_mt30">
                    <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="save" runat="server" Text="保 存" onclick="btnSubmit_Click" /></span>
                </div>
            </div>
        </div>
    </div>
    </form>

</body>
</html>

