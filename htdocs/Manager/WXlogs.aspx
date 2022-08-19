                                                                                <%--↓↓修改页面继承类↓↓--%>
<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.WXlogs, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
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
<form id="form1" runat="server">

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

<div id="clickTemp" runat="server" visible="false"></div>

<div id="viewTemp" runat="server" visible="false"></div>

<div id="textTemp" runat="server" visible="false"></div>

<div class="so_bread">
    <div class="nsw_bread_tit f_cb">
        <SpanCurrentPosition:SpanCurrentPosition ID="cur" runat="server"/>
    </div>
</div>
<div class="advan_posi design_posi form_search" style="display:block; height:auto; padding-bottom:20px;">
	<div class="f_cb lh27">
        <label class="com_name f_fl f_mr1 w80">公众号：</label>
        <span class="clear_bd s_selt f_fl mr10">
            <asp:DropDownList ID="ddlWxUser" runat="server" OnSelectedIndexChanged="initchange" class="pass_faq pl5"></asp:DropDownList>
            <i class="revise_sub"></i>
        </span>
    </div>
    <div class="f_cb mt10 lh27">
        <label class="com_name f_fl f_mr1 w80">互动筛选：</label>
        <span class="f_fl f_db e_radio e_radio2 radio">
            <b>全部</b>
            <span class="dn">
                <input type="radio" name="hdsx" id="hdsx_all" value="" runat="server" checked="true" />
            </span>
        </span>
        <span class="f_fl f_db e_radio e_radio2 radio">
            匹配回复内容
            <span class="dn">
                <input type="radio" name="hdsx" id="hdsx_1" value="1" runat="server" />
            </span>
        </span>
        <span class="f_fl f_db e_radio e_radio2 radio">
            未匹配回复内容
            <span class="dn">
                <input type="radio" name="hdsx" id="hdsx_0" value="0" runat="server" />
            </span>
        </span>
    </div>
    <div class="f_cb mt10 lh27">
        <label class="com_name f_fl f_mr1 w80">消息类型：</label>
        <span class="f_fl f_db e_radio e_radio2 radio">
            <b>全部</b>
            <span class="dn">
                <input type="radio" name="xxlx" id="xxlx_all" value="" runat="server" checked="true" />
            </span>
        </span>
        <span class="f_fl f_db e_radio e_radio2 radio">
            文字
            <span class="dn">
                <input type="radio" name="xxlx" id="xxlx_wz" value="text" runat="server" />
            </span>
        </span>
        <span class="f_fl f_db e_radio e_radio2 radio">
            图文
            <span class="dn">
                <input type="radio" name="xxlx" id="xxlx_tp" value="news" runat="server" />
            </span>
        </span>
        <span class="f_fl f_db e_radio e_radio2 radio">
            自定义菜单
            <span class="dn">
                <input type="radio" name="xxlx" id="xxlx_yy" value="view,click" runat="server" />
            </span>
        </span>
    </div>
    <div class="f_cb mt10 lh27">
        <label class="com_name f_fl f_mr1 w80">消息搜索：</label>
        <span class="clear_bd f_fl">
		    <input type="text" class="com_input clear_word" placeholder="请输入要搜索的关键词" runat="server" id="msg"/>
		    <i class="clear_x"></i>
	    </span>
    </div>
    <div class="f_cb mt10 lh27">
        <input type="submit" class="advan_so_btn ml10 f_fl" value="搜 索"  />
        <input type="button" value="刷 新" onclick="location.reload();" class="btn f_fl" style=" margin-top:0; margin-left:10px;" />
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript">
    $(function () {
        $("span.e_radio").unbind("click").bind("click", function () {
            $(this).addClass("z_select").siblings("span.e_radio").removeClass("z_select");
            $(this).find("input").attr("checked", true).parnets(".e_radio").siblings("span.e_radio").find("input").attr("checked", false);
        });
    })
</script>
<div id="PrintContent" class="mainCon">
    <div class="clear"></div>
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
</form>
</body></html>