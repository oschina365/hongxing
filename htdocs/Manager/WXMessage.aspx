<%@ page language="C#" autoeventwireup="True" enableeventvalidation="false" inherits="NSW.Web.Manager.WXMessage, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register src="Inc/uc/XuanZe.ascx" tagname="XuanZe" tagprefix="XuanZe" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
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

    <div id="newsTemp" runat="server" visible="false">
        <dl class="{$class$}">
            <dt><a href="{$PageUrl$}" title="{$Title$}"><img src="{$Img$}" title="{$Title$}" alt="{$Title$}"/></a></dt>
            <dd>{$Title$}</dd>
        </dl>
    </div>
    
    <div id="newTemp" runat="server" visible="false">
        <dl class="onepicbox">
            <dt class="newstitle">{$Title$}</dt>
            <dt><a href="{$PageUrl$}" title="{$Title$}"><img src="{$Img$}" title="{$Title$}" alt="{$Title$}"/></a></dt>
            <dd>{$ShortDesc$}</dd>
        </dl>
    </div>

    <div id="clickTemp" runat="server" visible="false">
        
    </div>

    <div id="viewTemp" runat="server" visible="false">
        
    </div>

    <div id="textTemp" runat="server" visible="false">
        
    </div>

	<div class="add_cont pad300 j_recordCon_c f_cb">
	    <!-- 帮助基本信息 -->
        <div class="cont1">
			<div class="f_cb">
				<label class="add_label f_fl"><span class="f_pdl15">消息类型</span></label>
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
                window.EditPage = true;
                $(function () {
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
                            <input id="Text1" type="text" class="com_input clear_word" placeholder="请输入标题..." />
                            <i class="clear_x"></i>
				        </span>
                        <span class="f_db f_fl f_csp ml10">链接：</span>
                        <span class="clear_bd f_fl p_inp1 ml10" style="width:240px;">
                            <input id="Text2" type="text" class="com_input clear_word" placeholder="请输入链接..." />
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

            <div class="f_cb f_mt25 dn">
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
			    <div class="view_btn f_mt30" returnurl="close">
                    <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button CommandName="return" runat="server" Text="回复消息" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                    <span class="e_btn1 f_ml35 f_csp fl" runat="server" id="btnDel"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="del" runat="server" Text="删 除" onclick="btnSubmit_Click" /></span>
                </div>
            </div>
        </div>

        <div id="PrintContent" class="mainCon">
            <asp:Repeater runat="server" ID="rptMain" onitemdatabound="rptData_ItemDataBound"><ItemTemplate>
            <div class="mod_list">
                <div class="top_circle"></div>
                <div class="bottom_circle"></div>
                <div class="mod_box">
                    <span class="time"><%#DateTime.Parse(Eval("InputTime").ToString()).ToString("yyyy/MM/dd HH:mm:ss")%></span>
                    <div class="dialogue_lef clearfix">
                        <div class="photos">
                            <a href="WXMessage.aspx?followid=<%#Eval("UserName") %>&token=<%=NSW.WeiXin.WeiXinTools.GetUserSessionid() %>">
                                <p><img width="38" height="38" src="skins/blue/img/tx.gif"></p>
                                <p class="name">关注者<%#Eval("UserName") %></p>
                            </a>
                            <p class="name">(微信)</p>
                        </div>
                        <div class="rig">
                            <span class="message_box">
                                <div class="message_box_SA"><em></em><span></span></div>
                                <span class="message_box_body">
                                    <div class="picture_text">
                                        <div class="pic"><%#Eval("Message")%></div>
                                    </div>
                                </span>
                            </span>
                        </div> 
                        <div class="clear"></div>
                    </div>
                    <div class="dialogue_rig clearfix" runat="server" id="div">
                        <div class="photos">
                            <p><img src="skins/blue/img/noavatar_middle.jpg" width="50"></p>
                            <p class="name"><%#getUsername(Eval("UID").ToString()) %></p>
                        </div>
                        <div class="rig width_75">
                            <span class="message_box">
                                <div class="message_box_SA"><em></em><span></span></div>
                                <span class="message_box_body"><%#GetMsg(Eval("RMsgType"), Eval("RMessage"))%></span>
                            </span>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            </ItemTemplate></asp:Repeater>
            <table class="" width="100%" style="">
                <tr id="noItemYet" runat="server" visible="false">
                    <td class="noItemYet" colspan="99" style=" text-align:center; padding:20px;">
                        没有任何关键词信息
                    </td>
                </tr>
            </table>
            <div class="clear"></div>
            <div class="headPageNavi">
                <div style="float: right;" class="pageNavi" id="pagerBtm">
                    <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
                </div>
            </div>
        </div>
	</div>
</form>
</div>
<style>
.all{ color:#74a6bd; font-weight:bold;}
#PrintContent{ padding-top:20px;}
.Condition{ border:1px solid #dedede; margin-bottom:20px; font-family:"微软雅黑"; font-size:14px;}  
.Condition .tit{ height:40px; line-height:40px;}  
.Condition .tit label{ margin-right:10px; display:inline-block;}
.Condition .tit span.tl{ width:80px; display:inline-block; padding-left:20px;}
.Condition .tit .bt{}
.Condition .tit .bt input{ cursor:pointer;margin-left:30px;display:inline;}

.mod_list{ border-left:3px solid #F0F0F0; position:relative; padding:7px 0 0 30px;}
.mod_list .top_circle,.mod_list .bottom_circle{width:14px; height:14px; display:inline-block; _overflow:hidden; /*background:url(../images/circle.gif) no-repeat; */position:absolute; left:-9px; z-index:2}
.mod_list .top_circle{ top:0;}
.mod_list .bottom_circle{ bottom:-13px}
.mod_list .mod_box{ border-top:1px dotted #E1E1E1; position:relative; padding:25px 0 10px}
.mod_list .mod_box .time{ position:absolute; top:-10px; left:40%; display:inline-block; background-color:#fff; padding:0 10px; color:#888}
.mod_list .mod_box .photos .name{ line-height:20px; width:100%; overflow:hidden;word-wrap:break-word;}

.dialogue_lef{ width:100%;}
.photos{ width:100px;  float:left;}
.rig{ width:50%; float:left;}
.dialogue_rig .photos{ float:right;}
.dialogue_rig .rig{ float:right;}


.txt{ width:150px;}
.message_box_body{ width:180px;overflow:hidden;}
.dialogue_rig .message_box_body{float:right;padding-right:80px;}
.dialogue_rig .photos p{text-align:center;}
/*pic*/
.onepicbox{width:180px;overflow:hidden;}
.onepicbox .newstitle{width:180px;height:30px;line-height:30px;text-align:center;overflow:hidden;}
.onepicbox img{width:180px;height:100px;}
.onepicbox dd{height:30px;overflow:hidden;line-height:15px;}
/*more pic*/
.firstpic{width:180px;}
.firstpic .newstitle{width:180px;height:30px;line-height:30px;text-align:center;}
.firstpic img{width:180px;height:100px;}
.firstpic dd{height:30px;line-height:30px; text-align:center;overflow:hidden;}
.firstspic{ clear:both;}
.firstspic dt{ float:right;width:40px;height:30px;}
.firstspic dt img{width:40px;height:30px;}
.firstspic dd{float:left;width:130px;overflow:hidden;height:30px;line-height:30px;}
</style>
</body>
</html>
