//验证和提示
var ValidationAndTips = {
    "qq": ["QQ号码", "/^\d{5,10}$/"],
    "tel": ["电话", function (value) {
        return /((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/.test(value);
    } ],
    "email": ["邮箱", "/^([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$/"],
    "verificationCode": ["验证码"],
    "companyName": ["公司名称"],
    "name": ["姓名"],
    "contact": ["联系人"],
    "shortdesc": ["意向描述"],
    "vali":["验证码"],
    "mphone": ["手机", "/^1[3-9]\\d{9}$/"],
    "fax": ["传真号码"],
    "shortdesc": ["备注"],
    "interests": ["兴趣爱好"]
}
var Validation = function (form, action, submitFn, resetFn, data) {
    var form = $(form);
    data = data || {};
    submitFn = submitFn || function (msg, reset, form) {
        if (jQuery.type(msg) === "string") {
            if ((msg.indexOf("成功") > -1 || msg.indexOf("恭喜您") > -1 || msg.indexOf("感谢您") > -1) && msg.indexOf("失败") == -1 && msg.indexOf("请稍候重试") == -1) {
                $a(sMsg, 1);
                if (reset) {
                    reset();
                }
            } else {
                $a(sMsg);
            }
        } else {
            var sta = gav(msg, "state");
            var sMsg = gav(msg, "msg");
            if (sta == "1") {
                $a(sMsg, 1);
                if (reset) {
                    reset();
                }
            } else {
                $a(sMsg);
            }
        }
    }
    form.find(".submit").click(function () {
        var inputs = form.find("input[type='text'],textarea");
        var errMessg = "";
        var _this = $(this);
        inputs.each(function () {
            var me = $(this);
            var name = me.attr("rname") || me.attr("name");
            if (name && name in ValidationAndTips) {
                var arr = ValidationAndTips[name];
                var title = me.attr("tips") || arr[0];
                var err = "";
                var value = me.val();
                var isdefvalue = value == me.attr("defvalue");
                var toname = me.attr("toname") || name;
                if (isdefvalue) {
                    value = "";
                }
                if (me.attr("required")) {
                    if (value.length == 0) {
                        value = '';
                        err += "<p>" + title + "不能为空！</p>";
                    }
                }
                var regular = me.attr("regular") || arr[1];
                if (err.length == 0 && (regular && regular != "false") && value.length > 0) {
                    if (jQuery.isFunction(regular)) {
                        if (!regular(value)) {
                            err += "<p>" + title + "格式错误！</p>";
                        }
                    } else {
                        try {
                            regular = eval("(" + regular + ")");
                            if (!regular) {
                                errMessg = "<p>" + title + "正则格式错误，请联系技术支持立即处理！</p>";
                            } else {
                                if (!(regular.test(value))) {
                                    err += "<p>" + title + "格式错误！</p>";
                                }
                            }
                        } catch (error) {
                            errMessg = "<p>" + title + "正则格式错误，请联系技术支持立即处理！</p>";
                            return;
                        }
                    }
                }

                var _fn = me.attr("fn");
                if (_fn && _fn in window && jQuery.isFunction((_fn = window(_fn)))) {
                    var ret = _fn.call(me);
                    if (ret && jQuery.type(ret) == "string") {
                        err += "<p>" + title + ret + "</p>";
                    }
                }
                if (err.length > 0) {
                    errMessg += err;
                } else {
                    data[toname] = value;
                }
            }
        })
        if (errMessg != "") {
            $a("错误提示:\r\n" + errMessg);
            return;
        }
        $.post("/ajax.ashx?action=" + action + "&t=" + Math.random(), data, function (msg) {
            if (jQuery.isFunction(submitFn)) {
                showProc(_this);
                submitFn(msg, reset, form);
                showProc(_this, false);
            }
        });
    });
    reset = function () {
        form.find("input[type='text'],textarea").each(function () {
            var me = $(this);
            me.val(me.attr("defvalue") || "");
        })
        if (jQuery.isFunction(resetFn)) {
            resetFn(form);
        }
    }
    form.find(".reset").click(function () {
        reset();
    })
    form.find("input[name='vali']").one("click", function () {
        $(this).siblings("img:first").click();
    })
}