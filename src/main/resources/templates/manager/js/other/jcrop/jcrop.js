/*加载js*/
function _isFunction(val) {
    if (!val) {
        return false;
    }
    return Object.prototype.toString.call(val) === '[object Function]';
}

var _Json = function (src_data) {
    try {
        src_data = jQuery.parseJSON(src_data);
        if (src_data) {
            return src_data;
        }
    } catch (e) {
        try {
            src_data = eval("(" + src_data + ")");
            if (src_data) {
                return src_data;
            }
        } catch (e) {
            jQuery.error("src-data设置错误，请联系程序立即处理！");
        }
    }
    return null;
}

function $qs(paraNm) {
    var args = new Object();
    var query = location.search.substring(1);
    var pairs = query.split("&");
    for (var i = 0; i < pairs.length; ++i) {
        var pos = pairs[i].indexOf('=');
        if (!pos) continue;
        var paraNm2 = pairs[i].substring(0, pos);
        var vlu = pairs[i].substring(pos + 1);
        vlu = decodeURIComponent(vlu);
        args[paraNm2] = vlu;
    }
    return args[paraNm];
}

$(document).ready(function () {
    var jcrop_api;
    var aspectRatio = 0;
    //初始化
    var ar_lock = $("#ar_lock");
    function initJcrop() {
        if (jcrop_api) {
            jcrop_api.destroy();
        }
        jcrop_api = $.Jcrop("#xuwanting");
        ar_lock.attr("checked", "checked");
        jcrop_api.setOptions({
            onChange: showCoords,
            onSelect: showCoords,
            aspectRatio: ar_lock.attr("checked") ? aspectRatio : 0
        });
    }
    //设置参数
    function setOptions(obj) {
        jcrop_api.setOptions(obj || {});
        jcrop_api.focus();
    }
    var preview_box = $("#preview_box");
    var w = 0;
    var _w = 0;
    var h = 0;
    var width = preview_box.width();
    var josn = null;
    function showCoords(coords) {
        if (w > 0 && h > 0) {
            if (parseInt(coords.w) > 0) {
                //计算预览区域图片缩放的比例，通过计算显示区域的宽度(与高度)与剪裁的宽度(与高度)之比得到
                var rx = preview_box.width() / coords.w;
                var ry = preview_box.height() / coords.h;
                var aspectRatio = coords.w / coords.h;
                //通过比例值控制图片的样式与显示
                preview_box.height(width / aspectRatio);
                preview_box.find("img").css({
                    width: Math.round(rx * w) + "px", //预览图片宽度为计算比例值与原图片宽度的乘积
                    height: Math.round(rx * h) + "px", //预览图片高度为计算比例值与原图片高度的乘积
                    marginLeft: "-" + Math.round(rx * coords.x) + "px",
                    marginTop: "-" + Math.round(ry * coords.y) + "px"
                });
            }
        }
        $("#x1").val(coords.x);
        $("#y1").val(coords.y);
        $("#x2").val(coords.x2);
        $("#y2").val(coords.y2);
        $("#w").val(coords.w);
        $("#h").val(coords.h);
        josn = coords;
    }
    function loadImg(src) {
        if (!src || src[0] !== "/") {
            error("参数错误");
            return;
        }
        var img = new Image();
        img.src = src + "?" + new Date().getTime(); //"js/xuwanting.jpg?" + new Date().getTime();
        img.onload = function () {
            var me = $(this);
            _w = w = this.width;
            h = this.height;
            if (w > 200) {
                aspectRatio = w / h;
                xuwanting_warp.find("img").remove().end().append(me);
                preview_box.find("img").remove().end().append(me.clone());
                me.attr("id", "xuwanting");
                if (_w > 1000) {
                    _w = 1000;
                    me.width(_w);
                }
                xuwanting_warp.width(_w);
                initJcrop();
            } else {
                alert("图片过小");
                window.close();
            }
        }
        img.onerror = function () {
            alert("图片不存在");
            window.close();
        }
    }
    ar_lock.bind("click", function () {
        var me = $(this);
        setOptions({ aspectRatio: me.attr("checked") ? aspectRatio : 0 });
    });
    var error = function (msg) {
        alert(msg);
        window.close();
    }
    //图片
    var oid = $qs("oid");
    var josn_ = "";
    var xuwanting_warp = $("#xuwanting_warp");
    if (oid) {
        function getcropimg(oid, josn, fn) {
            _PostAjax("cropimg", josn || { oid: oid, fn: 'getcropimg' }, fn || function (msg) {
                var data = _Json(msg);
                if (data.error) {
                    loadImg(data.url);
                } else {
                    error("图片不存在");
                }
            });
        }

        getcropimg(oid);
        $("input[type='button']").bind("click", function () {
            var me = $(this);
            if (josn == null || josn.w == 0) {
                alert("请选中选区");
                return;
            }
            if (_w < w) {
                josn._w = _w;
            }
            josn.oid = oid;
            josn.save = me.hasClass("save");
            if (!me.attr("disabled")) {
                me.attr("disabled", "disabled");
                _PostAjax("cropimg", josn, function (msg) {
                    var data = _Json(msg);
                    if (data.error) {
                        alert(data.msg);
                    } else {
                        alert(data.msg);
                    }
                    me.attr("disabled", null);
                })
            } else {
                alert("正在处理中...");
            }
        }).filter(".clearSave").unbind("click").bind("click", function () {
            getcropimg(oid, { oid: oid, fn: "clearcropimg" }, function (msg) {
                var data = _Json(msg);
                if (data.error) {
                    loadImg(data.url);
                    alert("加载成功");
                } else {
                    error("参数错误");
                }
            });
        });
    } else if ((josn_ = $qs("josn"))) {
        var obj = _Json(josn_);
        if (obj && obj.index) {
            var CallJcropImg = function (index, arr) {
                var fn;
                var w = window.opener.top;
                if (w.JcropImg && w.JcropImg.fns && (fn = w.JcropImg.fns[index])) {
                    if (arr) {
                        if (!(arr instanceof Array)) {
                            arr = [arr];
                        }
                        fn.apply(null, arr);
                    }
                }
            }
            //CallJcropImg(obj.index);
            $(".clearSave,.save").remove();
            //console.log(obj);
            loadImg(obj.src);
            $("input[type='button']").bind("click", function () {
                var me = $(this);
                if (josn == null || josn.w == 0) {
                    alert("请选中选区");
                    return;
                }
                if (!me.attr("disabled")) {
                    me.attr("disabled", "disabled");
                    josn.src = obj.src;
                    josn.type = 1;
                    _PostAjax("cropimg", josn, function (msg) {
                        var data = _Json(msg);
                        if (data.error) {
                            CallJcropImg(obj.index, [data.msg]);
                            error("图片裁切成功！");
                        } else {
                            alert(data.msg);
                        }
                        me.attr("disabled", null);
                    })
                } else {
                    alert("正在处理中...");
                }
            });
            return;
        }
        error("参数错误");
        return;
    } else {
        error("参数错误");
    }
});