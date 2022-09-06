/******************************************************************************
* filename: QuickOrder.js
* Ajax Modul Scripting 快速下单处理JS
* (C) 作者：吴少峰 2010年08月24日
* (C) 修改：蒋能龙 2011年04月28日
* (C) 修改：曹森 2011年09月22日
* (C) NSW(http://www.nsw88.com)
*******************************************************************************/
//快速下单查询


function ADDQuickOrder(src, page) {
    var _quickcheckboxall = "";
    var _Page = "";
    if (_quickcheckboxall.Lenght > 200) {
        var msgp = "<p>对不起选择产品数目不能超过200条数据！</p>";
        HQuickOrderDIV(msgp);
        return;
    }

    if ($j("ADDQuickCheckboxALL").val() != "" && $j("ADDQuickCheckboxALL").val() != null && $j("ADDQuickCheckboxALL").val() != undefined) {
        _quickcheckboxall = $tv("ADDQuickCheckboxALL");
    } else {
        _quickcheckboxall = $tv("QuickCheckboxALL");
        $j("ADDQuickCheckboxALL").val(_quickcheckboxall);
    }

    if (_quickcheckboxall == "") {
        var msgp = "<p>请选择产品!</p>";
        HQuickOrderDIV(msgp);
        return;
    }

    _Page = page;

    if (_Page == 0) {
        _Page = 1;
    }

    showProc(src);

    $.post("/QuickOrderAjax.ashx?action=addquickorder&t=" + Math.random(), {
        quickcheckboxall: _quickcheckboxall,
        page: _Page
    }, function (rsp) {
        var sMsg = gav(rsp, "msg");
        var count = gav(rsp, "count");
        $j("CKQuickOrderData").html(sMsg);
        $j("QuickCount").val(count);
        showProc(src, false);

        BinAddQuickOrdersPager(count);
        var msgp = "<p>订单产品数据增加成功!</p>";
        HQuickOrderDIV(msgp);
    });

    $j("erbTit").attr("class", "titbk");
    var QuickOrder2 = "<img src='/skins/default/Img/QuickOrder/ico1.gif' />填写采购数量及要求";
    $j("QuickOrder2").attr("class", "hong");
    $j("QuickOrder2").html(QuickOrder2);
    var Contact = $j("txtContact").val();

    if (Contact != "" || Contact != undefined) {
        var QuickOrder3 = "<img src='/skins/default/Img/QuickOrder/ico1.gif' />填写您的联系方式";
        $j("QuickOrder3").attr("class", "hong");
        $j("QuickOrder3").html(QuickOrder3);
    }

    $j("ADDQuickCheckboxALL").val("");
    $j("QuickCheckboxALL").val("");
    //改变左边选择状态
    $("input[name='checkQuickOrder']").each(function () {
        $(this).attr("checked", false);

    });
    var strquickid = _quickcheckboxall.split(",");
    if (strquickid.length > 0) {
        var lis = "";
        for (var i = 0; i < strquickid.length; i++) {
            lis = "QuickOrderli" + strquickid[i];
            $j(lis).attr("class", "");
        }
    }
}

/*快速下单显示产品的简介）*/
function showQuickOrderInfos(src, _oid) {

    var time1 = null;
    var time2 = null;
    var ID = null;
    var time = null;

    //鼠标移到图片上的事件
    $(src).hover(function () { time1 = new Date(); showTime(); }, function () { window.clearInterval(ID); });

    //js定时器
    function showTime() {
        ID = window.setInterval(function () {
            time2 = new Date();
            time = time2 - time1;

            //时间差，停留200毫秒时触发ajax请求
            if (time > 400) {
                if ($(src).parent().parent().next().attr("class") == "quickmesbook44") {
                    if ($(src).parent().parent().next().is(":visible")) {
                        return;
                    } else {
                        $(src).parent().parent().next().show();
                    }
                } else {
                    $.post("/QuickOrderAjax.ashx?action=quickOrderShowProductInfos&t=" + Math.random(), {
                        oid: _oid
                    }, function (msg) {
                        if ($(src).parent().parent().next().attr("class") == "quickmesbook44") {
                            return;
                        } else {
                            $(src).parent().parent().after(msg);
                            return;
                        }

                    });
                }
            }
        }, 450);
    }

}

function DelQuickOrderConfirm(src, page) {
    var _getquickcheckboxal = $tv("GetQuickCheckboxAL");

    if (_getquickcheckboxal == "") {
        sMsg = "请从采购清单里面选择你要删除的产品，可以批量选中后，统一删除。"
        $a(sMsg);
        return;
    }
    $.post("/QuickOrderAjax.ashx?action=delquickorderconfirm&t=" + Math.random(), {
        getquickcheckboxal: _getquickcheckboxal
    }, function (rsp) {
        var sMsgg = gav(rsp, "msg");
        sMsg = "您想从采购清单里面删除如下产品，清单如下："
        sMsg += "<br/>";
        sMsg += sMsgg;
        sMsg += "<br/>";
        sMsg += "请确认是否从采购清单里面删除以上的产品。";

        $confirm(sMsg, { title: "确定", toDo: function () {
            DelQuickOrder(src, page); hideConfirm();
        }
        }, { title: "关闭", toDo: function () {
            hideConfirm();
        }
        });
    });
    return;
}

//删除下单查询
function DelQuickOrder(src, page) {
    var _getquickcheckboxal = $tv("GetQuickCheckboxAL");

    var _Page = "";

    _Page = page;

    if (_Page == 0) {
        _Page = 1;
    }
    showProc(src);

    $.post("/QuickOrderAjax.ashx?action=delquickorder&t=" + Math.random(), {
        getquickcheckboxal: _getquickcheckboxal,
        page: _Page
    }, function (rsp) {
        var sMsg = gav(rsp, "msg");

        $j("CKQuickOrderData").html(sMsg);

        var count = gav(rsp, "count");
        $j("CKQuickOrderData").html(sMsg);
        $j("QuickCount").val(count);
        GetAddQuickOrders(0);
        BinAddQuickOrdersPager(count);
        showProc(src, false);
        var msgp = "<p>订单产品数据删除成功！</p>";
        HQuickOrderDIV(msgp);
        $j("GetQuickCheckboxAL").val("");
        $j("erbTit").attr("class", "titbk");
        var QuickOrder2 = "<img src='/skins/default/Img/QuickOrder/ico1.gif' />填写采购数量及要求";
        $j("QuickOrder2").attr("class", "hong");
        $j("QuickOrder2").html(QuickOrder2);
        $j("qQuickOrdersChecked").attr("checked", false);
    });


}


//快速下单查询
function GetQuickOrder(src, page) {
    var _selproductcolumn = $tv("SelProductColumn");
    var _productkeword = $tv("txtProductKeword");
    var _Page = page;

    //$j("QuickCheckboxALL").val("");

    if (_Page == 0) {
        _Page = 1;
    }
    showProc(src);

    $.post("/QuickOrderAjax.ashx?action=quickOrder&t=" + Math.random(), {
        selproductcolumn: _selproductcolumn,
        productkeword: _productkeword,
        page: _Page
    }, function (msg) {
        var sMsg = gav(msg, "msg");
        $.post("/QuickOrderAjax.ashx?action=GetGETquantitycokie&t=" + Math.random(), function (msg) {
            var GetAddCount = gav(msg, "count");
            BinGetQuickOrdersPager(GetAddCount);
        });
        $j("QuickOrderData").html(sMsg);
        showProc(src, false);
    });
}



//快速选中处理
function QuikcheckAll(cntrId, lisid) {
    //获取用户选取的产品值
    var chks = $j(cntrId).val();
    //两个临时变量
    var tmpck, tmpinpval = "";
    //获取用户增加时选中的产品ID进行比较如果用户本次选中的值已存在则提醒用户
    var _ADDQuickCheckboxALL = $tv("ADDQuickCheckboxALL");

    if ($j(cntrId).attr("checked")) {
        $j('spanjiantou1').attr("style", "display:block;");
        setTimeout("$j('spanjiantou1').css('display','none')", 3000);
        if (_ADDQuickCheckboxALL != null && _ADDQuickCheckboxALL != "" && _ADDQuickCheckboxALL != undefined) {
            //产品ID进行比较
            if (isQuickProductColumnID(_ADDQuickCheckboxALL, chks) == false) {
                $j(cntrId).attr("checked", false);
                $j(lisid).attr("class", "");
            }
            else {

                _ADDQuickCheckboxALL += "," + chks;
                $j("ADDQuickCheckboxALL").val(_ADDQuickCheckboxALL);
            }
        }
        else {
            tmpinpval = $j("QuickCheckboxALL").val();
            if (tmpinpval != undefined) {
                tmpck = tmpinpval + "," + chks + ",";
                $j("QuickCheckboxALL").val(tmpck.substring(0, tmpck.length - 1));

            }
            else {
                $j("QuickCheckboxALL").val(chks);
            }
        }
        $j(lisid).attr("class", "curs");
    }
    else {

        if (_ADDQuickCheckboxALL != null && _ADDQuickCheckboxALL != "" && _ADDQuickCheckboxALL != undefined) {
            //产品ID进行比较
            var addtemp = "";
            var tempalit = _ADDQuickCheckboxALL.split(",");
            for (var i = 0; i < tempalit.length; i++) {
                if (tempalit[i] != chks) {
                    addtemp += tempalit[i] + ",";
                }
            }
            $j("ADDQuickCheckboxALL").val(addtemp.substring(0, addtemp.length - 1));
        }

        tmpinpval = $j("QuickCheckboxALL").val();
        var alit = null;
        var tmpalitval = "";
        var tmpalitvalsssss = "";
        var tmpCheckboxALL = "";
        if (tmpinpval != undefined) {
            alit = tmpinpval.split(",");
            if (alit.length > 0) {
                for (var i = 0; i < alit.length; i++) {
                    if (alit[i] != chks) {
                        tmpalitvalsssss += alit[i] + ",";
                    }
                }
                tmpCheckboxALL = tmpalitvalsssss.substring(0, tmpalitvalsssss.length - 1)
                $j("QuickCheckboxALL").val(tmpCheckboxALL);
                $j(lisid).attr("class", "");
            }
        }
        else {
            $j("QuickCheckboxALL").val("");
            $j(lisid).attr("class", "");
        }
    }


}

//判断快速下单的产品去重复了！
function isQuickProductColumnIDs(alit, chks) {
    var alits = alit.split(",");
    var tmpval = "";
    for (var i = 0; i < alits.length; i++) {
        if (alits[i] != chks) {
            tmpval += alits[i] + ",";
        }
    }
    return tmpval;
}

//判断快速下单的产品ID是否重复了！
function isQuickProductColumnID(alit, chks) {
    var alits = alit.split(",");
    for (var i = 0; i < alits.length; i++) {
        if (alits[i] == chks) {
            $a("对不起，采购产品中已存在该采购信息!!");
            return false;
        }
    }
    return true;
}


//快速如果用户没有提交成功时用OCookie查询下单数据
function GetQuickOrders(page) {

    var _Page = page;

    if (_Page == 0) {
        _Page = 1;
    }

    $.post("/QuickOrderAjax.ashx?action=quickOrders&t=" + Math.random(), {
        page: _Page
    }, function (msg) {
        var sMsg = gav(msg, "msg");

        $j("QuickOrderData").html(sMsg);

    });
}

//快速如果用户没有提交成功时用OCookie查询下单数据
function GetAddQuickOrders(page) {

    var _Page = page;

    if (_Page == 0) {
        _Page = 1;
    }

    $.post("/QuickOrderAjax.ashx?action=addquickOrders&t=" + Math.random(), {
        page: _Page
    }, function (rsp) {
        var sMsg = gav(rsp, "msg");
        var _CheckboxALL = gav(rsp, "CheckboxALL");
        $j("ADDQuickCheckboxALL").val(_CheckboxALL);
        var count = gav(rsp, "count");
        if (count == 0) {
            $j("erbTit").attr("class", "tit");
            var QuickOrder2 = "<img src='/skins/default/Img/QuickOrder/ico2.gif' />填写采购数量及要求";
            $j("QuickOrder2").attr("class", "");
            $j("QuickOrder2").html(QuickOrder2);
            $j("sanbtit").attr("class", "tit");
            var QuickOrder3 = "<img src='/skins/default/Img/QuickOrder/ico2.gif' />填写您的联系方式";
            $j("QuickOrder3").attr("class", "");
            $j("QuickOrder3").html(QuickOrder3);
        }
        else {
            $j("CKQuickOrderData").html(sMsg);
            $j("QuickCount").val(count);

            $j("erbTit").attr("class", "titbk");
            var QuickOrder2 = "<img src='/skins/default/Img/QuickOrder/ico1.gif' />填写采购数量及要求";
            $j("QuickOrder2").attr("class", "hong");
            $j("QuickOrder2").html(QuickOrder2);
            var Contact = $j("txtContact").val();
            if (Contact == "" || Contact == undefined) {
                var QuickOrder3 = "<img src='/skins/default/Img/QuickOrder/ico2.gif' />填写您的联系方式";
                $j("QuickOrder3").attr("class", "");
                $j("QuickOrder3").html(QuickOrder3);
            }
        }
    });
}

//全选反选处理
function QuickOrdersChecked(src) {
    if (src.checked) {
        $j('spanjiantou2').attr("style", "display:block;");
        setTimeout("$j('spanjiantou2').css('display','none')", 3000);
        $(this).attr("checked", false);
        checkboxall();
    } else {
        $(this).attr("checked", true);
        rcheckboxall();
    }
}

function checkboxall() {
    var val = "";
    $("input[id='qQuickOrdersChecked']").each(function () {
        $(this).attr("checked", true);
        val += $(this).val() + ",";
    });
    val = val.replace("on,", "");
    if (val.lastIndexOf(",") != -1) {
        val = val.substring(0, val.length - 1);
    }
    $j("GetQuickCheckboxAL").val(val);
}

function rcheckboxall() {
    $("input[id='qQuickOrdersChecked']").each(function () {
        $(this).attr("checked", false);
    });
    $j("GetQuickCheckboxAL").val("");
}

//单个选择处理
function singleCk(src, val) {
    var tmpval = $j("GetQuickCheckboxAL").val();
    if (src.checked) {
        $j('spanjiantou2').attr("style", "display:block;");
        setTimeout("$j('spanjiantou2').css('display','none')", 3000);
        if (tmpval == undefined) {
            tmpval = val;
        }
        else {
            if (tmpval.length > 0) {
                if (tmpval.lastIndexOf(val) == -1) {
                    tmpval = tmpval + "," + val;
                }
            }
        }
    }
    else {
        if (tmpval.length > 0) {
            var sg = val + ",";
            tmpval = tmpval + ",";
            tmpval = tmpval.replace(sg, "");
            if (tmpval.lastIndexOf(",") != -1) {
                tmpval = tmpval.substring(0, tmpval.length - 1);
            }
        }
    }
    $j("GetQuickCheckboxAL").val(tmpval);
}


function QuickOrdersDLLChecked(cntrId, lisid) {
    //获取用户选取的产品值
    var chks = $j(cntrId).val();
    //两个临时变量
    var tmpck, tmpinpval = "";
    var _GetQuickCheckboxAL = "";

}


function RfertAddQuickOrdersConfirm(page) {
    sMsg = "请确定是否全部删除采购清单里面的全部产品，"
    sMsg += "删除后将不能恢复操作！";

    $confirm(sMsg, { title: "确定",
        toDo: function () {
            RfertAddQuickOrders(page); hideConfirm();
        }
    }, { title: "关闭",
        toDo: function () {
            hideConfirm();
        }
    });
    return;
}

//清空快速如果用户没有提交成功时用OCookie查询下单数据
function RfertAddQuickOrders(page) {
    $.post("/QuickOrderAjax.ashx?action=rfertaddquickorders", function (msg) {
        var sMsg = gav(msg, "msg");

        $j("CKQuickOrderData").html(sMsg);
        var msgp = "<p>采购清单已清空!!</p>";
        HQuickOrderDIV(msgp);
        $j("erbTit").attr("class", "titbk");
        var QuickOrder2 = "<img src='/skins/default/Img/QuickOrder/ico1.gif' />填写采购数量及要求";
        $j("QuickOrder2").attr("class", "hong");
        $j("QuickOrder2").html(QuickOrder2);
        $j("ADDQuickCheckboxALL").val("");

        $.post("/QuickOrderAjax.ashx?action=Getaddquantitycokie&t=" + Math.random(), function (msg) {
            var GetAddCount = gav(msg, "count");
            BinAddQuickOrdersPager(GetAddCount);
        });
    });
}

function OrderQuantity(src, _pid) {
    var newVal = $j(src).val();
    if (!/^\d+$/.test(newVal)) {
        $a("数量必须是一个整数。");
        return;
    }
    if (parseInt(newVal) == 0) {
        $a("数量必须大于0，若要删商品，请点操作中的‘删除’。");
        return;
    }

    $.post("/QuickOrderAjax.ashx?action=orderquantity&t=" + Math.random(), {
        pid: _pid,
        quti: newVal
    }, function (rsp) {
        if (gav(rsp, "state") == "1") {
            var msgp = "<p>数量修改成功!!!!</p>";
            HQuickOrderDIV(msgp);
        }

    });
}

function OrderDemand(src, _pid) {
    var newVal = $j(src).val();
    $.post("/QuickOrderAjax.ashx?action=orderdemand&t=" + Math.random(), {
        pid: _pid,
        atts: newVal
    }, function (rsp) {
        if (gav(rsp, "state") == "1") {
            var msgp = "<p>内容修改成功!!!!</p>";
            HQuickOrderDIV(msgp);
        }
    });
}

function BinAddQuickOrdersPager(count) {
    var _QuickCoumnt = count;
    var pagerG, pager;
    if (_QuickCoumnt == "" || _QuickCoumnt == undefined) {
        _QuickCoumnt = 10;
    }
    pager = new PagerView('addquickorderpager');
    pager.itemCount = _QuickCoumnt;
    pager.size = 10;
    pager.render();

    pagerG = new PagerViewG('addquickorderpagerspan');
    pagerG.itemCount = _QuickCoumnt;
    pagerG.size = 10;
    pagerG.render();

    pager.onclick = function (index) {
        // 从服务器端获取数据.
        GetAddQuickOrders(index);
        pagerG.index = index;
        pagerG.render();
    };

    pagerG.onclick = function (index) {
        // 从服务器端获取数据.
        GetAddQuickOrders(index);
        pager.index = index;
        pager.render();
    };
}


function BinGetQuickOrdersPager(count) {
    var _QuickCoumnt = count;
    var pagerG, pager;
    if (_QuickCoumnt == "" || _QuickCoumnt == undefined) {
        _QuickCoumnt = 10;
    }
    pager = new PagerView('Getquickorderpager');
    pager.itemCount = _QuickCoumnt;
    pager.size = 10;
    pager.render();

    pagerG = new PagerViewG('Getquickorderpagerspan');
    pagerG.itemCount = _QuickCoumnt;
    pagerG.size = 10;
    pagerG.render();

    pager.onclick = function (index) {
        // 从服务器端获取数据.
        GetQuickOrders(index);
        pagerG.index = index;
        pagerG.render();
    };

    pagerG.onclick = function (index) {
        // 从服务器端获取数据.
        GetQuickOrders(index);

        pager.index = index;
        pager.render();
    };
}

function OnContact() {
    $j("sanbtit").attr("class", "titbk");
    var QuickOrder3 = "<img src='/skins/default/Img/QuickOrder/ico1.gif' />填写您的联系方式";
    $j("QuickOrder3").attr("class", "hong");
    $j("QuickOrder3").html(QuickOrder3);
}


//显示隐藏用户信息详细层
function ShowDivR(bools) {
    if (bools) {
        $j("ShowDivRs").attr("style", "display:block;");
        $j("aShowDivR").attr("onclick", "ShowDivR(false);");

    } else {
        $j("ShowDivRs").attr("style", "display:none;");
        $j("aShowDivR").attr("onclick", "ShowDivR(true);");
    }
}


//快速订单下一步处理
function QBtnSubmit() {
    var s_Contact = $tv("txtContact");
    var s_Phonenumber = $tv("txtPhonenumber");
    var s_Email = $tv("txtEmail");
    var s_VerCode = $tv("txtVerCode");
    var s_CompanyName = $tv("txtCompanyName");
    //省份
    var s_ddlPrtRegions = $j("region1_ddlPrtRegions").find("option:selected").text();
    //市区
    var s_ddlChdRegions = $j("region1_ddlChdRegions").find("option:selected").text();
    //省份
    var s_ddlPrtRegionsval = $tv("region1_ddlPrtRegions");
    //市区
    var s_ddlChdRegionsval = $tv("region1_ddlChdRegions");
    
    
    
    
    
    var s_Streetaddress = $tv("txtStreetaddress");
    var s_Zipcode = $tv("txtZipcode");
    var s_tTel1 = $tv("txtTel1");
    var s_tTel2 = $tv("txtTel2");
    var s_tTel3 = $tv("txtTel3");
    var s_PurchasingNotes = $tv("txtPurchasingNotes");
    
    
    var reg=/^\s*$/;      
  if(reg.test(s_Contact)) {
        $a("对不起，联系人不能为空！");
        return;
    } 
    
    if(reg.test(s_Phonenumber)) {
        $a("对不起，手机号码不能为空！");
        return;
    }
    var partten = /^1[3,5]\d{9}$/;
     if (!partten.test(s_Phonenumber)) {
        $a("对不起，手机号码格式错误！");
        return;
    } 
    
    
     var ptn = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
    if (reg.test(s_Email)) {
     $a("对不起，电子邮件不能为空！");
        return;   
    }
    if (!ptn.test(s_Email)) {
     $a("对不起，电子邮件格式错误！");
        return;
        
    } 
    
    
    


    $.post("/QuickOrderAjax.ashx?action=qbtnsubmit&t=" + Math.random(), {
        _Contact: s_Contact,
        _Phonenumber: s_Phonenumber,
        _Email: s_Email,
        _CompanyName: s_CompanyName,
        _VerCode: s_VerCode,
        _ddlPrtRegions: s_ddlPrtRegions,
        _ddlChdRegions: s_ddlChdRegions,
        _ddlPrtRegionsval: s_ddlPrtRegionsval,
        _ddlChdRegionsval: s_ddlChdRegionsval,
        _Streetaddress: s_Streetaddress,
        _Zipcode: s_Zipcode,
        _tTel1: s_tTel1,
        _tTel2: s_tTel2,
        _tTel3: s_tTel3,
        _PurchasingNotes: s_PurchasingNotes
    }, function (msg) {
        var smsgs = "";
        if (gav(msg, "state") == "-3") {
            smsgs = gav(msg, "msg");
            $a(smsgs);
            return;
        }
        if (gav(msg, "state") == "-2") {
            smsgs = gav(msg, "msg");
            $a(smsgs);
            return;
        }

        if (gav(msg, "state") == "0") {
            window.location.href = "/Paycenter/QuickOrderConfirm.aspx";
            return;
        }
    });

}


function HQuickOrderDIV(msg) {
    $j('QuickOrderDIV').attr("style", "display:block;");

    $j('QuickOrderDIVPgs').html(msg);
    setTimeout("$j('QuickOrderDIV').css('display','none')", 3000);
}

//隐藏产品快速下单预览的层
function hideQuickOrderProductInfo(src) {

    if ($(src).parent().parent().next().attr("class") == "quickmesbook4s" || $(src).parent().parent().next().attr("class") == "quickmesbook40" || $(src).parent().parent().next().attr("class") == "quickmesbook44") {
        // $(src).parent().parent().next().hide();
        $(src).parent().parent().next().mouseover(function() {
            $(src).parent().parent().next().show();
            return;
        });

        $(src).parent().parent().next().mouseout(function() {
            $(src).parent().parent().next().hide();
            return;
        });
        $(src).parent().parent().next().hide();
    }
}
