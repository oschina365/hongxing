(function () {
    window.GetFroms = function (me, ID, randomId) {
        $.getJSON("/MyAjax.ashx?action=GettbForms&t" + Math.random(), {
            ID: ID
        }, function (data) {
            if (data.State == 1) {
                var fields = data.Fields;
                var ID = 'fm_' + data.OID + randomId;
                if ($(me).is("body")) {
                    if (data.Css) {
                        $(me).append($("<style>" + data.Css + "</style>"));
                    }
                    $(me).append('<form id="' + ID + '" class="fm fm_' + data.OID + '">' + data.Content + '</form>');
                } else {
                    $(me).after('<form id="' + ID + '" class="fm fm_' + data.OID + '">' + data.Content + '</form>');
                    if (data.Css) {
                        $(me).after($("<style>" + data.Css + "</style>"));
                    }
                }
                var form = $("#" + ID);
                form.data("data", data);
                SetForm(form, fields);
            }
        })
    }
    var SetForm = function (_form, fields) {
        var form = $(_form);

        for (var i in fields) {
            var OBJ = fields[i];
            var li = form.find(".warp_" + OBJ.ID);
            li.data("field", OBJ);
            if ('|text|textarea|'.indexOf(OBJ.Type) > 0) {
                var input = li.find("[name='" + OBJ.Type + "_" + OBJ.ID + "']");
                if (input.length) {
                    input.data("field", OBJ);
                    if (OBJ.InitialText) {
                        input.val(OBJ.InitialText);
                    }
                    if (OBJ.Length != 0) {
                        input.attr("maxlength", OBJ.Length).attr("tips", OBJ.Title);
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

        form.find("input[name='verifycode']").attr("tips", "验证码").data("field", {
            Css: "",
            ID: -1,
            InitialText: "",
            IsRequired: true,
            IsVerify: false,
            Length: 30,
            Regular: "",
            Title: "验证码",
            Type: "text"
        });

        form.find(".submit").bind("click", function () {
            var errMsg = "";
            var regular = "";
            var src = this;
            form.find("input[type='text'],textarea").each(function () {
                var me = $(this);
                var val = jQuery.trim(me.val());
                var msg = "";
                var OBJ = me.data("field");
                var tips = me.attr("tips");
                if (OBJ == null) {
                    errMsg = "<p>" + me.attr("name") + "设置错误，请检查设置或联系网站程序！</p>";
                    return false;
                }
                if (OBJ.IsRequired && (val.length == 0 || val == me.attr("defValue"))) {
                    msg = "<p>" + tips + "不能为空！</p>";
                }
                if (msg == "" && (val.length && val != me.attr("defValue")) && OBJ.IsVerify && OBJ.Regular) {
                    try {
                        OBJ.Regular = me.attr("regular") || OBJ.Regular;
                        var regular = eval(OBJ.Regular.replace(/\/\//g, "\/"));
                        if (!regular.test(val)) {
                            msg = "<p>" + tips + "格式错误！</p>";
                        }
                    } catch (e) {
                        msg = "<p>" + tips + " -> 字符串转正则错误，请联系程序检查正则！</p>";
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
            var ul = "/MyAjax.ashx?action=SubmitForm&t" + Math.random() + "&OID=" + form.data("data").OID;
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
                },
                success: function (data) {
                    data = jQuery.parseJSON(data);
                    if (data.State == 1) {
                        $a("提交成功", 1);
                        resetform(form);
                    } else {
                        $a(data.Message);
                    }
                    showProc(src, false);
                }
            });

        }); //.click();
        var resetform = function (form) {
            $(form).find("input[type='text'],textarea").each(function () {
                var me = $(this);
                me.val(me.attr("defvalue") || "");
            })
        }
        form.find(".reset").bind("click", function () {
            resetform(form);
        })
    }
})();