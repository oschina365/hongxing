if (typeof (window.loadjs_obj) == "undefined") {
    window.loadjs_obj = {};
}
window.loadjs_obj["/ajax.js"] = true;
var NSWGlobal = {
    state: "z_lowpoint",
    stateTrue: "启用",
    stateFalse: "禁用"
//    getStateInfo: function (bit, $src) {
//        if ($src) { 
//            
//        } else {
//            return bit ? NSWGlobal.stateFalse : NSWGlobal.stateTrue;
//        }
//    }
};
var AJAXACTION = "Handler/Ajax.ashx?t=" + Math.random() + "&action=";

/*状态改变的js 一般由 IsBest,IsTop,IsCommend,Enable,Delay,*/
$(function () {
    $("[ajaxbit]").click(function () {
        var $me = $(this);
        var data_ajax = $me.attr("data-ajax");
        if (data_ajax) {
            var info = eval("(" + data_ajax.toLowerCase() + ")");
            var bools = $me.hasClass(NSWGlobal.state);
            $.ajax({
                type: "POST",
                url: AJAXACTION + "ajaxbit",
                data: { fileColumn: info.field, enable: bools ? 0 : 1, typename: info.typename, OID: info.oid },
                cache: "false",
                //                dataType: "josn",
                success: function (msg) {
                    msg = eval("(" + msg + ")");
                    if (msg.state) {
                        $me.attr("title", msg.msg);
                        bools ? $me.removeClass(NSWGlobal.state) : $me.addClass(NSWGlobal.state);
                    } else {
                        _alert(msg.msg);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }
    });
});

var _PostAjax = function (action, data, CallbackFunction) {
    if (typeof (PageTitle) != "undefined") {
        data.pagetitle = PageTitle;
    }
    $.ajax({
        type: "POST",
        url: AJAXACTION + action,
        data: data,
        cache: "false",
        success: function (msg) {
            if (_isFunction(CallbackFunction)) {
                CallbackFunction.call(null, msg);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

        }
    });
}












