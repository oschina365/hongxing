<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.Paycenter_QuickOrder, qwt" enableviewstate="true" enableviewstatemac="false" %>

<%@ Register TagPrefix="QuickOrderLoc" TagName="QuickOrderLoc" Src="~/UserControls/Cart/QuickOrderLoc.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>快速下单处理</title>
    <script language="javascript" type="text/javascript" src="/JS/QuickOrder.js"></script>
    <script language="javascript" type="text/javascript" src="/JS/PagerView.js"></script>
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
    <link href="../skins/default/QuickOrder.css" rel="stylesheet" type="text/css" />
    <form runat="server" id="aspnetForm">
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
    <div class="content">
        <div class="content_neir">
            <QuickOrderLoc:QuickOrderLoc ID="QuickOrderLoc" runat="server" />
            <div class="jind">
                <ul>
                    <li class="hong">
                        <img src="/skins/default/Img/QuickOrder/ico1.gif" />搜索合适产品</li>
                    <li id="QuickOrder2"></li>
                    <li id="QuickOrder3">
                        <img src="/skins/default/Img/QuickOrder/ico2.gif" />填写您的联系方式</li>
                    <li>
                        <img src="/skins/default/Img/QuickOrder/ico2.gif" />订单确认</li>
                    <li class="nones">
                        <img src="/skins/default/Img/QuickOrder/ico2.gif" />提交成功</li>
                </ul>
            </div>
            <div class="miaos">
                为了加快双方的沟通效率和我方备货和发货速度，请在下面的产品筛选窗口查找您所需要的产品，同时在右方设置好产品采购的数量及要求，提交表单后，我方将会第一时间派专员与您取得联系。</div>
            <div class="yib">
                <div class="tit">
                    <span>第一步：搜索合适产品</span></div>
                <div class="nr">
                    <ul class="list3">
                        <li><span class="shous">产品搜索:</span>
                            <select id="SelProductColumn" name="SelProductColumn" class="select">
                                <%= ProductColumnHtml%>
                            </select></li>
                        <li><span class="shous">关 键 字:</span><input id="txtProductKeword" name="txtProductKeword"
                            type="text" class="k2ggggg" /><span class="an1"><a href="javascript:void(0);" onclick="GetQuickOrder(this,0);"
                                style="cursor: hand;">搜索</a></span></li>
                        <div class="clear">
                        </div>
                        <input id="QuickCheckboxALL" name="QuickCheckboxALL" type="hidden" value="" />
                        <input id="ADDQuickCheckboxALL" name="ADDQuickCheckboxALL" type="hidden" value="" />
                        <input id="GetQuickCheckboxAL" name="GetQuickCheckboxAL" type="hidden" value="" />
                        <input id="ProductCount" name="ProductCount" type="hidden" value="" />
                        <input id="QuickCount" name="QuickCoumnt" type="hidden" value="" />
                    </ul>
                    <div class="xuanz">
                        <div class="tits">
                            <ul>
                                <li>选择</li>
                                <li>序号</li>
                                <li>产品名称</li>
                            </ul>
                            <span id="Getquickorderpagerspan" class="fr"></span>
                        </div>
                        <div class="nrs">
                            <ul id="QuickOrderData">
                                <div>
                                    <img src="/Images/nodata.GIF">暂无数据!</div>
                            </ul>
                            <div id="Getquickorderpager" class="yes">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="QuickOrderDIV" style="display: none;">
                <h5>
                    消息提示</h5>
                <div id="QuickOrderDIVPgs">
                </div>
            </div>
            <div class="tianj">
                <ul>
                    <li class="tian"><a href="javascript:void(0);" onclick="ADDQuickOrder(this,0);">添加</a></li>
                    <li class="shangc"><a href="javascript:void(0);" onclick="DelQuickOrderConfirm(this,0);">
                        删除</a></li>
                    <span id="spanjiantou2" style="display: none;">
                        <img src="../skins/default/Img/QuickOrder/jiantou2.gif" /></span> <span id="spanjiantou1"
                            class="upspan" style="display: none;">
                            <img src="../skins/default/Img/QuickOrder/jiantou.gif" /></span>
                </ul>
            </div>
            <div class="erb">
                <div id="erbTit" class="tit">
                    <span>第二步：填写采购数量要求</span></div>
                <div class="nr">
                    <h5>
                        请填写采购产品的数量和产品要求,询价可以在要求项里注明</h5>
                    <div class="lajx">
                        <a href="javascript:void(0);" onclick="RfertAddQuickOrdersConfirm();">清空采购清单</a></div>
                    <div class="quanx">
                        <input id="qQuickOrdersChecked" name="qQuickOrdersChecked" type="checkbox" onclick="QuickOrdersChecked(this);" /><label
                            for="qQuickOrdersChecked">
                            全选/反选</label></div>
                    <div class="xuanz">
                        <div class="tits">
                            <ul>
                                <li>选择</li>
                                <li>序号</li>
                                <li>产品名称</li>
                                <li class="shux">属性</li>
                                <li><span class="shul">数量</span></li>
                                <li><span class="yaoq">要求</span></li>
                            </ul>
                            <span id="addquickorderpagerspan" style="padding-left: 31px;"></span>
                        </div>
                        <div class="nrs">
                            <ul id="CKQuickOrderData">
                                <div>
                                    <img src="/Images/nodata.GIF">暂无数据!</div>
                            </ul>
                            <div id="addquickorderpager" class="yes">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sanb">
                <div id="sanbtit" class="tit">
                    <span>第三步：填写您的联系方式</span></div>
                <div class="nr">
                    <div class="list1">
                        <div class="bit">
                            <div class="tits">
                                <span>必填项</span></div>
                            <div class="nrs">
                                <ul>
                                    <li><span>联 系 人:</span><input id="txtContact" name="txtContact" type="text" onblur="OnContact();"
                                        value="<%=txtContact %>" class="k4" />*</li>
                                    <li><span>手机号码:</span><input id="txtPhonenumber" name="txtPhonenumber" type="text"
                                        value="<%=txtPhonenumber %>" class="k4" />*</li>
                                    <li><span>电子邮件:</span><input id="txtEmail" name="txtEmail" type="text" value="<%=txtEmail %>"
                                        class="k4" />*</li>
                                </ul>
                            </div>
                        </div>
                        <div class="xiangx">
                            如果您提供更加详尽的联系方式，我方将会安排更加专业的人员与你进行洽谈,<a id="aShowDivR" href="javascript:void(0);" onclick="ShowDivR(true);">马上填写更加详尽的联系方式&gt;&gt;</a></div>
                        <div class="yanz">
                            <div class="tits">
                                <span>验证码</span></div>
                            <div class="nrs">
                                <ul>
                                    <li>
                                        <asp:TextBox ID="txtVerCode" runat="server" onfocus="showVerifyCode()" CssClass="txtboxcs"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="error" SetFocusOnError="true" ID="RequiredFieldValidator3"
                                            runat="server" ErrorMessage="**" Display="Dynamic" ControlToValidate="txtVerCode"></asp:RequiredFieldValidator>
                                        <div style="display: inline;">
                                            <span id="spVerCode"></span><span id="spVerCodeMsg" class="hd"></span><a id="spChgVerCode"
                                                class="p hd" href="###" onclick="changeVerCode()">看不清？！</a></div>
                                        *</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div id="ShowDivRs" class="list2">
                        <div class="tits">
                            <span>以下联系方式为非必填项，填写完整后，我方将会安排合适人员与您进行洽谈</span></div>
                        <div class="nrs">
                            <ul>
                                <li><span>公司名称：</span><input id="txtCompanyName" name="txtCompanyName" type="text"
                                    value="<%=txtCompName %>" onblur="OnContact();" class="k8" />请填写您的公司名称</li>
                                <li class="szdqli"><span>所在地区：</span><chinaRegion:ChinaRegion runat="server" ID="region1" />
                                </li>
                                <li><span>街道地址：</span><input id="txtStreetaddress" name="txtStreetaddress" type="text"
                                    value="<%=txtAddress %>" class="k8" />请填写详细收货地址</li>
                                <li><span>邮政编码：</span><input id="txtZipcode" name="txtZipcode" type="text" maxlength="6"
                                    onkeyup="digiOnly(this)" value="<%=txtZipCode %>" class="kk2" />请填写6位邮政编码（如：518000）</li>
                                <li class="dhhmli"><span>电话号码：</span>
                                    <asp:TextBox ID="txtTel1" MaxLength="4" runat="server" CssClass="txtboxcs" Style="width: 40px;" onkeyup="digiOnly(this)"></asp:TextBox>
                                    <asp:TextBox ID="txtTel2" MaxLength="10" runat="server" CssClass="txtboxcs" Style="width: 80px;" onkeyup="digiOnly(this)"></asp:TextBox>
                                    <asp:TextBox ID="txtTel3" MaxLength="5" runat="server" CssClass="txtboxcs" Style="width: 40px;" onkeyup="digiOnly(this)"></asp:TextBox>
                                    固定电话(区号-电话号码-分机) </li>
                                <li><span>采购备注：</span><textarea id="txtPurchasingNotes" name="txtPurchasingNotes"
                                    cols="" rows="" class="kk6"><%=txtHobby %></textarea></li>
                            </ul>
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <a href="javascript:void(0);">
                        <img src="/skins/default/Img/QuickOrder/btn5.gif" class="an3" name="btnSubmit" onclick="QBtnSubmit();" /></a>
                    <a href="javascript:void(0);">
                        <img src="/skins/default/Img/QuickOrder/btn6.gif" class="an3" name="btnSubmit" onclick="emptyText('aspnetForm');RfertAddQuickOrders();" /></a>
                </div>
            </div>
        </div>
    </div>
    <div class="clear">
    </div>
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript" src="/JS/PagerView.js"></script>
<script type="text/javascript">

    GetQuickOrders(0);
    $.post("/QuickOrderAjax.ashx?action=GetGETquantitycokie&t=" + Math.random(), function (msg) {
        var GetAddCount = gav(msg, "count");
        BinGetQuickOrdersPager(GetAddCount);
    });

    GetAddQuickOrders(0);
    $.post("/QuickOrderAjax.ashx?action=Getaddquantitycokie&t=" + Math.random(), function (msg) {
        var GetAddCount = gav(msg, "count");
        BinAddQuickOrdersPager(GetAddCount);
    });

    var _Contact = $j("txtContact").val();

    var _txtPhonenumber = $j("txtPhonenumber").val();
    if (_Contact != "" || _txtPhonenumber != "") {
        $j("sanbtit").attr("class", "titbk");
    }
    OnContact();
</script>
