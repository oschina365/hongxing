<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.Orderlist, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>我的订单</title>
    <script type="text/javascript" src="/Component/My97DatePicker/WdatePicker.js"></script>
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
        <UserActions:UserActions runat="server" ID="uc_UserActions_1" />
        <div class="right">
            <div class="u_right_main">
                <UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
                <div class="order_top">
                    <div class="order_top_con">
                        <form runat="server" id="form1">
                        <ul>
                            <li><a href="orderlist.aspx?type=p" ordertype="p" <%= (OrderType == "p") ? " class='b'" : string.Empty %>>
                                产品订单</a></li>
                            <li style="display: none"><a href="orderlist.aspx?type=d" ordertype="d" <%= OrderType == "d" ? " class='b'" : string.Empty %>>
                                直接付款订单</a></li>
                        </ul>
                        <div class="clear">
                        </div>
                        <table>
                            <tr>
                                <td>
                                    订单号码：
                                </td>
                                <td>
                                    <input type="text" maxlength="15" id="txOrderNo" />
                                    <span class="red_x">可选</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    成交时间：
                                </td>
                                <td>
                                    <input id="txtStartDate" type="text" value="<%= StartDate.Length > 0 ? StartDate : DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd") %>"
                                        onclick="WdatePicker()" readonly="readonly" size="15" maxlength="16" />
                                    至
                                    <input id="txtEndDate" type="text" value="<%= GetEndDate() %>" onclick="WdatePicker()"
                                        readonly="readonly" size="15" maxlength="16" />
                                    (可选)
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    订单状态：
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddlOrderStates" AppendDataBoundItems="true">
                                        <asp:ListItem Value="">请选择...</asp:ListItem>
                                    </asp:DropDownList>
                                    <input type="button" class="b15" value="查 询" onclick="searchOrder()" />
                                </td>
                            </tr>
                        </table>
                        </form>
                    </div>
                </div>
                <asp:Repeater runat="server" ID="rpt">
                    <HeaderTemplate>
                        <table class="add_tab">
                            <tr>
                                <th>
                                    序号
                                </th>
                                <th>
                                    订单号码
                                </th>
                                <th>
                                    金额(￥)
                                </th>
                                <th>
                                    支付方式
                                </th>
                                <th>
                                    订单状态
                                </th>
                                <th>
                                    配送状态
                                </th>
                                <th>
                                    时间
                                </th>
                                <th>
                                    管理员回复
                                </th>
                                <th>
                                    操作
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%# ((PageIndex - 1) * PageSize) +  Container.ItemIndex + 1 %>
                            </td>
                            <td>
                                <a class="u" href="/paycenter/OrderDetail.aspx?no=<%# Eval("OrderNo") %>" target="_blank">
                                    <%# Eval("OrderNo") %>
                            </td>
                            <td class="tr">
                                <%# ((decimal)Eval("ActOrderAccount")).ToString("f2") %>
                            </td>
                            <td>
                                <%# Eval(PAYMENT_STATE_COLUMN_NAME)%>
                            </td>
                            <td name="orderstate">
                                <%# Eval(ORDER_STATE_COLUMN_NAME) %>
                            </td>
                            <td name="deliverystate">
                                <%# Eval(DELIVERY_STATE_COLUMN_NAME) %>
                            </td>
                            <td>
                                <%# ((DateTime)Eval("InputTime")).ToString("yy-MM-dd HH:mm") %>
                            </td>
                            <td style="color: red">
                                <%#Eval("AdminRemark").ToString().Length > 0 ? Eval("AdminRemark"):"暂无回复!"%>
                            </td>
                            <td class="pb5">
                                <div>
                                    <%# ((int)Eval("OrderState") == (int)NSW.OEnum.OrderState.待审核1) ? "<a href=\"javascript:void(0)\" class='u' onclick=\"if(confirm('取消订单操作不可撤消，您确定取消订单吗？'))cancelOrder(this,'"+ Eval("OrderNo") +"')\">取消订单</a>" : "" %></div>
                                <%# ((int)Eval("DeliveryState") != (int)NSW.OEnum.DeliveryState.已收货5) && ((int)Eval("DeliveryState") != (int)NSW.OEnum.DeliveryState.正在审核1) ? "<div><input type='button' class='cWhite b36' value='确认收货' onclick=\"window.open('/paycenter/EndingConfirm.aspx?no=" + Eval("OrderNo") + "')\" /></div>" : string.Empty%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table></FooterTemplate>
                </asp:Repeater>
                <asp:Repeater runat="server" ID="rptDirect">
                    <HeaderTemplate>
                        <table class="add_tab">
                            <tr>
                                <td>
                                    序号
                                </td>
                                <td>
                                    订单号码
                                </td>
                                <td>
                                    金额(￥)
                                </td>
                                <td>
                                    付款状态
                                </td>
                                <td>
                                    订单状态
                                </td>
                                <td>
                                    管理员回复
                                </td>
                                <td>
                                    时间
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%# ((PageIndex - 1) * PageSize) +  Container.ItemIndex + 1 %>
                            </td>
                            <td>
                                <a class="u" href="/paycenter/OrderDetailDirect.aspx?no=<%# Eval("OrderNo") %>" target="_blank">
                                    <%# Eval("OrderNo") %>
                            </td>
                            <td class="tr">
                                <%# ((decimal)Eval("ActOrderAccount")).ToString("f2") %>
                            </td>
                            <td>
                                <%# Eval(PAYMENT_STATE_COLUMN_NAME)%>
                            </td>
                            <td name="orderstate">
                                <%# Eval(ORDER_STATE_COLUMN_NAME) %>
                            </td>
                            <td name="orderstate" style="color:Red">
                                <%# Eval("AdminRemark")%>
                            </td>
                            <td>
                                <%# ((DateTime)Eval("InputTime")).ToString("yy-MM-dd HH:mm") %>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table></FooterTemplate>
                </asp:Repeater>
                <div runat="server" id="nodata" visible="false">
                    暂无订单</div>
                <OranPager:OranPager runat="server" ID="pagerMain" CssClass="apage" />
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
