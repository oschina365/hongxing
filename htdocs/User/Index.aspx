<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.User_Index, qwt" enableviewstate="false" enableviewstatemac="false" %>

<%@ Register TagPrefix="Announcement" TagName="Announcement" Src="~/UserControls/user/Announcement.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>会员中心首页</title>
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
    <!--Header:Start-->
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
    <!--Header:End-->
    <!--Content:Start-->
    <div class="content">
        <div class="left fl" style=" padding-left:0px; width:220px;" >
            <UserActions:UserActions runat="server" ID="uc_UserActions_1" />
        </div>
        <div class="right">
            <div class="u_right_main">
                <UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
                <div class="invitation_2" style="display:none">
                    <div>
                        邀请朋友（只接受单个电子邮箱地址）：</div>
                    <div>
                        <input type="text" onfocus="focusToRemoveText(this)" id="txtEmail" />
                        <input type="button" class="b17" value="发 送" onclick="sendInvitation(this)" />
                    </div>
                   <%-- <div>
                        <span class="fl">把你的朋友电子邮件填写完整，马上获取积分奖励。 </span><span class="fr"><a target="_blank"
                            href="/Helps/jifenzhidu.html">[查看推广奖励]</a></span>
                    </div>--%>
                    <div class="clear">
                    </div>
                </div>
               <div class="u_tg">
                    <dl class="userinfo">
                        <dt>
                            <img src="<%= Avatar %>" alt="<%= AvatarAltText %>" /></dt>
                        <dd class="d1">
                            <div style="line-height:30px;">
                                欢迎进入<%= NSW.OConfig.GlobalConfig.SiteName %>会员中心</div>
                            <div style="line-height:30px;">
                                <span> 您的上次登录时间是: <%=  NSW.OCookie.Mem.LastDateTime %></span></div>
                            <div style="line-height:30px;">
                                 <span>这是您第<%= NSW.OSession.Mem.User.UserLogins %>次登录</span> </div>
                        </dd>
                        <dd class="d2" style="display:none">
                            您拥有 <span class="sp_1">
                                <%= NSW.OSession.Mem.Wealth %></span> 点可消费积分，共累积积分
                            <%= NSW.OSession.Mem.User.CumulativePoint %>
                            点。<a href="pointlog.aspx">积分查询</a></dd>
                    </dl>
                    <div class="clear">
                    </div>
                </div>
                <h4 class="t03 mt10" runat="server" id="hNonpaymentOrders">
                    您尚有 {$order$} 个订单未付款，为了您及时收到货品，请及时付款，<a href="OrderList.aspx" class="u">点击我查看前往订单管理</a>。</h4>
                <h4 class="t03">
                    <span class="fr"><a href="UserProfile.aspx">修改</a></span>您的基本信息</h4>
                <table width="97%" class="u_idx_tab">
                    <tr>
                        <td width="45%">
                            姓名：<%= UserEnt.ChnName.Length > 0 ? UserEnt.ChnName : "-" %>
                        </td>
                          <td width="55%">
                            电子邮件：<%= UserEnt.UserEmail.Length > 0 ? UserEnt.UserEmail : "-"%>
                        </td>
                    </tr>
                   
                    <tr>
                        
                        <td>
                            会员等级：<%= NSW.BLL.Site.GetColumnNameByID(NSW.OCache.UserGroup, UserEnt.UserGroupID) %>
                        </td>
                         <td>
                            手机号码：
                            <%= UserEnt.MPhone.Length > 0 ? UserEnt.MPhone : "-"%>
                        </td>
                    </tr>
                    <tr>
                         <td>
                            省份城市：
                            <%= (UserEnt.Province + " " + UserEnt.City).Length > 0 ? (UserEnt.Province + " " + UserEnt.City) : "-"%>
                        </td>
                          <td>
                            邮政编码：<%= UserEnt.ZipCode.Length > 0 ? UserEnt.ZipCode : "-"%>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            详细地址：<%= UserEnt.Address.Length > 0 ? UserEnt.Address : "-"%>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
                
                
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <!--Content:End-->
    <!--Footer:Start-->
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
    <!--Footer:End-->
</body>
</html>
