<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.QuickOrderConfirm, qwt" enableviewstate="true" enableviewstatemac="false" %>

<%@ Register TagPrefix="QuickOrderLoc" TagName="QuickOrderLoc" Src="~/UserControls/Cart/QuickOrderLoc.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>快速下单处理</title>
<link href="../skins/default/QuickOrder.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../JS/QuickOrder.js" ></script>
<script language="javascript" type="text/javascript" src="../JS/PagerView.js" ></script>

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
<body><form runat="server" id="aspnetForm">
<!--Header:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Header:end-->
<!--Content:Start-->

<!--主要内容开始-->
<div class="content">
	<div class="content_neir">
    	<div class="menu1">当前位置：<a href="#">首页</a>-><a href="#">产品中心</a>-><span><a href="#">快速下单</a></span></div>
        <div class="jind">
        	<ul>
        		<li class="hong"><img src="/skins/default/Img/QuickOrder/ico1.gif" />搜索合适产品</li>
            	<li class="hong"><img src="/skins/default/Img/QuickOrder/ico1.gif" />填写采购数量及要求</li>
           		<li class="hong"><img src="/skins/default/Img/QuickOrder/ico1.gif" />填写您的联系方式</li>
            	<li class="hong"><img src="/skins/default/Img/QuickOrder/ico1.gif" />订单确认</li>
           		<li class="nones"><img src="/skins/default/Img/QuickOrder/ico2.gif" />提交成功</li>
        	</ul>
        </div>
        
        <div class="miaos">为了加快双方的沟通效率和我方备货和发货速度，请在下面的产品筛选窗口查找您所需要的产品，同时在右方设置好产品采购的数量及要求，提交表单后，我方将会第一时间派专员与您取得联系。</div>
        
        <div class="sib">
        	<div class="tit"><span>第四步：订单确认</span></div>
            <div class="nr">
            	<ul>
                	<li><span>姓名：</span><%=Contact %></li>
                    <li><span>手机号码：</span><%=Phonenumber %></li>
                    <li><span>电子邮件：</span><%=Email %></li>
                    <li><span>公司名称：</span><%=CompanyName %></li>
                    <li><span>所在地区：</span><%= ParentRegion %>-<%=ChildRegion %></li>
                    <li><span>街道地址：</span><%= Streetaddress%></li>
                    <li><span>邮政编码：</span><%=Zipcode %></li>
                    <li><span>电话号码：</span><%=txtTel1 %>-<%=txtTel2%>-<%=txtTel3%></li>
                    <li><span>其他采购备注：</span><%=PurchasingNotes %></li>
                    <li><span>收货地址：</span><%=ParentRegion %>-<%=ChildRegion %>-<%=Streetaddress%></li>
                </ul>
            </div>
        </div>
        
        <div class="shangp">
        	<div class="tit"><h4>商品清单</h4><span><a href="/Paycenter/QuickOrder.aspx">返回修改&gt;&gt;</a></span></div>
            <div class="nr">
            	<div class="tits">
                	<ul>
                    	<li>序号</li>
                        <li>产品名称</li>
                        <li class="shux2">属性</li>
                        <li class="shul2">数量</li>
                        <li>要求</li>
                    </ul>
                </div>
                <div class="nrs">
                	<ul>
                	<asp:Repeater runat="server" ID="rpt">
                	<ItemTemplate>
                	    <li><span class="xuh"><%#Container.ItemIndex + 1 + PageSize * (PageIndex - 1)%></span>
                	    <span class="mingc"><%# Eval("Title") %></span>
                	    <span class="shux3"><%# GetAttrs(Eval("__attrs__").ToString())%></span>
                	    <span class="shul3"><%# Eval("__quickorderquantity__")%></span>
                	    <span class="yaoq2"><%# Eval("__requirements__")%></span></li>
                	</ItemTemplate>
                	</asp:Repeater>
                    	<div id="SelDelivery" runat="server" visible="false" ><img src="/Images/nodata.GIF" />暂无数据!</div>
                    </ul>
                </div>
                <div class="dingd"><a href="/Paycenter/QuickOrderSuccessful.aspx"><img name="" type="image" src="/skins/default/Img/QuickOrder/btn7.gif"  class="an4"/></a></div>
               
            </div>
            
        </div>
        
  </div>
  
  
<div class="clear"></div>
<!--主要内容结束-->

<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</form>


 
</body>
</html>

