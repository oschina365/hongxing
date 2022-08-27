if (typeof (window.loadjs_obj) == "undefined") {
    window.loadjs_obj = {};
}
window.loadjs_obj["/manager/js/common/selectrelevant.js"] = true;
var SaveData = {};
//相关分类操作
function RelevantColumn(src) {
    return this.init(src);
}
_extend(RelevantColumn, {
    init: function (src) {
        var me = this;
        src = $(src);
        var div = src.parents("div.add_r");
        if (div.data("elements")) {
            return div.data("elements");
        }
        var elements = {};
        elements.div = div;
        elements.leftSelect = div.find("select.fl_select"); //已经添加的
        elements.rightSelect = div.find("select.fr_select"); //待添加的
        elements.input = elements.leftSelect.next("input"); //保存值的

        elements.add = div.find("span.sv_add").bind("click", function () {
            me.addRelevantColumn();
        });

        elements.del = div.find("span.sv_dele").bind("click", function () {
            me.delRelevantColumn();
        });
        elements.up = div.find(".pro_up").bind("click", function () {
            me.Sort(true);
        })
        elements.down = div.find(".pro_down").bind("click", function () {
            me.Sort(false);
        })

        var value = elements.input.val();
        if (value) {
            var arr = value.split(',');
            if (arr && arr.length > 0) {
                for (var i = 0; i < arr.length; i++) {
                    if (arr[i]) {
                        elements.leftSelect.append(elements.rightSelect.children("[value='" + arr[i] + "']"));
                    }
                }
            }
        }
        me.elements = elements;
        div.data("elements", elements);
    },
    Sort: function (up) {
        var me = this;

        var options = me.elements.leftSelect.children(":selected");
        if (!options.length) {
            _alert("请选择要排序的选项！");
            return;
        }
        var el = up ? options.eq(0).prev() : options.eq(options.length - 1).next();
        if (!el.length) {
            _alert("已经是" + (up ? "第一个" : "最后一个") + "了！");
            return;
        }
        var me_, next, prev;
        if (up) {
            for (var i = 0; i < options.length; i++) {
                me_ = options.eq(i);
                prev = me_.prev();
                if (prev.length) {
                    prev.insertAfter(me_);
                }
            }
        } else {
            for (var i = options.length - 1; i > -1; i--) {
                me_ = options.eq(i);
                next = me_.next();
                if (next.length) {
                    next.insertBefore(me_);
                }
            }
        }
        me.setHdInputValues();
    },
    addRelevantColumn: function () {
        var isUpdate = false;
        var me = this;
        me.elements.rightSelect.children(":selected").each(function () {
            var me_ = $(this);
            if (!me.elements.leftSelect.children("[value='" + me_.val() + "']").length) {
                me.elements.leftSelect.append(me_)
                isUpdate = true;
            }
        });
        if (isUpdate) {
            me.setHdInputValues();
        }
    },
    delRelevantColumn: function () {
        var me = this;
        var options = me.elements.leftSelect.children(":selected");
        if (options.length) {
            _confirm("确定删除？", function () {
                me.elements.rightSelect.append(options);
                //me.elements.leftSelect.children(":selected").remove();
                me.setHdInputValues();
            })
        }
    },
    setHdInputValues: function () {
        var _value = '';
        var me = this;
        me.elements.leftSelect.children().each(function () {
            var value = $(this).val();
            if (value) {
                _value = _value + value + ",";
            }
        })
        me.elements.input.val(_value);
    }
})

function RelevantDetailed(src) {
    return this.init(src);
}

_extend(RelevantDetailed, RelevantColumn, {
    init: function (src) {
        var me = this;

        src = $(src);
        var div = src.parents("div.add_r");
        if (div.data("elements")) {
            return div.data("elements");
        }
        var elements = {};
        elements.div = div;
        elements.leftSelect = div.find("select.left_select"); //已经添加的
        elements.rightSelect = div.find("select.right_select"); //待添加的
        elements.input = elements.leftSelect.next("input"); //保存值的
        elements.selectcolumns = div.find("select.selectColumn"); //分类
        elements.soinput = div.find("input.so_text"); //搜索框
        elements.sobtn = div.find("input.so_btn"); //搜索按钮

        elements.add = div.find("span.sv_add").bind("click", function () {
            me.addRelevantColumn();
        });

        elements.del = div.find("span.sv_dele").bind("click", function () {
            me.delRelevantColumn();
        });
        elements.up = div.find(".pro_up").bind("click", function () {
            me.Sort(true);
        })
        elements.down = div.find(".pro_down").bind("click", function () {
            me.Sort(false);
        })

        elements.selectcolumns.bind("change", function () {
            me.SelectRelevant(this);
        })

        elements.sobtn.bind("click", function () {
            me.SelectRelevant(elements.soinput);
        })

        me.elements = elements;
    },
    SelectRelevant: function (src) {
        var me = this;

        src = $(src);
        if (src.val() == "" && src.length && src[0].tagName === "SELECT") {
            return;
        }

        var inValue = me.elements.soinput.val();
        var selectValue = me.elements.selectcolumns.val();
        var columntype = me.elements.selectcolumns.attr("columntype");

        inValue = inValue.indexOf("请输入") > -1 ? "" : inValue;

        if (selectValue == "" && inValue == "") {
            return;
        }
        var key = hashCode(selectValue + "_" + columntype + "_" + inValue);
        if (SaveData[key]) {
            me.SelectRelevantCallback(SaveData[key]);
            return;
        }

        var data = { sid: selectValue, title: inValue, columntype: columntype };
        _getJSONNewAjax({ ajax: "getDetailed",
            data: data,
            callback: function (message) {
                SaveData[key] = message;
                me.SelectRelevantCallback(message);
                return;
            }
        });
    },
    SelectRelevantCallback: function (message) {
        var me = this;
        if (message.Status == 1) {
            var html = '', da;
            if (message.Data.length) {
                for (var i = 0; i < message.Data.length; i++) {
                    da = message.Data[i];
                    if (da) {
                        //alert(da);
                        html += '<option value="' + da["ID"] + '">' + da["Title"] + '</option>';
                    }
                }
            }
            me.elements.rightSelect.html(html);
        } else {
            _alert(message.Data);
        }
    }
});

