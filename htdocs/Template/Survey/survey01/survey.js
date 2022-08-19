$(function () {
    $("ul.ulradiocheck li").hover(function () {
        $(this).css("background-color", "#efefef");
    }, function () {
        $(this).css("background-color", "");
    })
    $("div.div_question").click(function () {
        $(this).css("background-color", "#edfafe").siblings("div.div_question").css("background-color", "");
    })
})

var SetForm = function (_form, formObj) {
    var form = $(_form);
    var fields = formObj.Fields;
    for (var i in fields) {
        var OBJ = fields[i];
        var div_question = form.find("#field_" + OBJ.ID);
        div_question.data("field", OBJ);
        if ('|text|textarea|checkbox|'.indexOf(OBJ.Type) > 0) {
            var input = div_question.find(".q_" + OBJ.Type);
            if (input.length) {
                input.data("field", OBJ);
                if ("|text|textarea|".indexOf(OBJ.Type) > 0) {
                    if (OBJ.InitialText) {
                        input.val(OBJ.InitialText);
                    }
                    var maxlength = parseInt(input.attr("maxlength"));
                    input.attr("tips", OBJ.Title);
                    if (!isNaN(maxlength) && maxlength > 0) {
                        if ($.browser.msie && OBJ.Type == "textarea") {
                            input.bind("keyup", function () {
                                var me = $(this);
                                var maxlength = parseInt(me.attr("maxlength"), 10);
                                maxlength = isNaN(maxlength) ? 30 : maxlength;
                                var length = me.val().length;
                                if (length > maxlength) {
                                    me.val(this.value.substring(0, maxlength));
                                }
                            })
                        }
                    }
                }
            }
        }
    }

    form.find(".submitbutton").bind("click", function () {
        var errMsg = "";
        var src = this;
        form.find("input[type='text'],ul li:first-child input[type='checkbox'],textarea").each(function () {
            var me = $(this);
            var val = jQuery.trim(me.val());
            var msg = "";
            var OBJ = me.data("field");
            if (OBJ == null) {
                errMsg = "<p>OBJ不能为空，请检查设置或联系网站程序！</p>";
                return false;
            }
            var tips = me.attr("tips") || OBJ.Title;

            if ("|text|textarea|".indexOf(OBJ.Type) > 0) {
                if (OBJ.IsRequired && (val.length == 0 || val == me.attr("defValue"))) {
                    msg = "<p>" + tips + "不能为空！</p>";
                }
                if (msg == "" && (val.length && val != me.attr("defValue")) && OBJ.IsVerify && OBJ.Regular) {
                    try {
                        OBJ.Regular = OBJ.Regular;
                        var regular = eval(OBJ.Regular.replace(/\/\//g, "\/"));
                        if (!regular.test(val)) {
                            msg = "<p>" + tips + "格式错误！</p>";
                        }
                    } catch (e) {
                        msg = "<p>" + tips + " -> 字符串转正则错误，请联系程序检查正则！</p>";
                    }
                }
            } else {
                if (OBJ.IsRequired && me.parents("ul").find("input:checked").length == 0) {
                    msg = "<p>" + tips + "最少选择一项！</p>";
                }
            }
            if (msg != "") {
                errMsg += msg;
            }
        })
        if (errMsg != "") {
            $a(errMsg);
            return;
        }
        showProc(src);
        var ul = "/MyAjax.ashx?action=SubmitSurvey&t" + Math.random() + "&OID=" + formObj.OID;
        if ("MARK" in window) {
            ul += "&mark=" + window["MARK"];
        }
        if ("OBJ_ID" in window) {
            ul += "&obj_id=" + window["OBJ_ID"];
        }
        $.ajax({
            cache: false,
            type: "POST",
            url: ul,
            data: form.serialize(),
            async: false,
            error: function (request) {
                alert("连接失败，请稍后重试！");
                showProc(src, false);
            },
            success: function (data) {
                data = eval("(" + data + ")");
                if (data.State == 1) {
                    $a("您的表单已经提交成功，感谢您的配合！");
                    form.find("input[type='text'],textarea").each(function () {
                        var me = $(this);
                        me.val(me.attr("defvalue") || "");
                    })
                } else {
                    $a(data.Message);
                }
                showProc(src, false);
            }
        });
    });
    form.find(".reset").bind("click", function () {
        form.find("input[type='text'],textarea").each(function () {
            var me = $(this);
            me.val(me.attr("defvalue") || "");
        })
    })
}