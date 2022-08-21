if (typeof (window.loadjs_obj) == "undefined") {
    window.loadjs_obj = {};
}
window.loadjs_obj["/attr_edit.js"] = true;

var _ThumbnailImage_Index = 0;
var Tags = "|I|INPUT|EM";
var SetDraggable = function (lis) {
    lis = $(lis).not(".add_color");
    if (!lis.length) return;
    var me = this;
    Timeout(function () {
        loadJs("js/easyui/jquery.easyui.min.js", function () {
            lis.each(function () {
                _ThumbnailImage_Index++;
                var me = $(this);
                me.attr("index", _ThumbnailImage_Index);
            }).addClass(me.draggableClass).draggable({
                proxy: "clone",
                onBeforeDrag: function (e) {
                    if (e && e.target) {
                        target = $(e.target);
                        var tagName = target[0].tagName;
                        if (target.length > 0 && Tags.indexOf(tagName) > 0) {
                            return false;
                        }
                    }
                },
                onStopDrag: function () {
                    $(this).attr("style", "");
                },
                revert: true,
                cursor: 'pointer'
            });

            //可放置的容器
            lis.droppable({
                onDrop: function (e, source) {
                    var me = $(this);
                    var n = me.next(); //下一个
                    var p = me.prev(); //上一个
                    source = $(source);
                    if (source.attr("index") == n.attr("index")) {
                        source.insertBefore(me);
                    } else if (p.attr("index") == source.attr("index")) {
                        source.insertAfter(me);
                    } else {
                        me.insertAfter(source);
                        if (n.length) {
                            source.insertBefore(n);
                        } else if (p.length) {
                            source.insertAfter(p);
                        }
                    }
                }
            });
        })
    }, 300);
}

var _ValidateForm = function () {
    var txtTitle = $j("txtTitle");
    if (txtTitle.val().length == 0) {
        _alert("请输入属性名称！");
        return false;
    }
    $("input.item,input.itemID").attr("name", "item001");
    var div = $("div.sidebox:visible");
    if (div.length) {
        var inputs = div.find("input.item");
        var max = 0;
        var values = "#$$#";
        var cf = false;
        inputs.each(function () {
            var me = $(this);
            var value = me.val();
            var itemID = me.next("input.itemID");
            if (value != "" && value != "选项") {
                me.attr("name", "item");
                value = _allReplace(value, ",", "，");
                if (values.indexOf("#$$#" + value + "||") >= 0) {
                    _alert("存在重复的选项值！");
                    cf = true;
                    return false;
                }
                me.val(value);

                itemID.attr("name", "itemID");
                values += value + "||" + (itemID.val() || "-1") + "#$$#";
                max++;
            }
        })
        if (cf) {
            return false;
        }
        if (inputs.length == 0 || max == 0) {
            _alert("请填写选项！");
            return false;
        }
        $("#hdValue").val(values);
    }
    return true;
}

$(function () {
    var temp = "<li><span><input type='text' placeholder='填写选项' name='item' class='item' /><input type='hidden' name='itemID' class='itemID' value='-1' /><em class='del_color'></em></span></li>";
    var ul = $("ul.color_box");
    var add = ul.find(".add_color");

    var values = $("#hdValue").val().trim();
    if (values) {
        var keyvalues = values.split("#$$#"), keyvalue, li;
        if (keyvalues && keyvalues.length) {
            for (var i = 0; i < keyvalues.length; i++) {
                if (keyvalues[i] && (keyvalue = keyvalues[i].split("||")) && keyvalue.length == 2) {
                    add.before(temp);
                    li = add.prev();
                    li.find("input.item").val(keyvalue[0]).next("input.itemID").val(keyvalue[1]);
                }
            }
        }
        if (ul.children().length > 2) {
            ul.children().eq(0).remove();
        }
    }
    SetDraggable($(".color_box li"));
    $(".color_box").on("click", ".del_color", function () {
        var li = $(this).parents("li");
        if (li.find("input").val() != "-1") {
            _confirm("确定移除该属性值？", function () {
                li.remove();
            })
        } else {
            li.remove();
        }
    });
    add.bind("click", function () {
        $(this).before(temp);
        var li = add.prev();
        li.find("input.item").focus();
        SetDraggable(li);
    });
    var radios = $(".e_radio");
    radios.bind("click", function () {
        var index = radios.index($(this));
        if (index == 0 || index == 1) {
            $("div.sidebox").hide();
        } else {
            $("div.sidebox").show();
        }
    }).filter(".z_select").click();
})