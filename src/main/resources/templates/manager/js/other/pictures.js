var BatchOperation1 = function (msg, src) {
    var me = $(src);
    var length = SltedItemCnt();
    msg = msg || '确定删除选中项（共{count}项）？';
    if (!length) {
        _alert('未有选中项');
        return false;
    }

    if (confirm(msg.replace('{count}', length))) {
        var size = prompt("请输入压缩大小（kb）:", "600");
        while (size && !/^[1-9]\d*/.test(size)) {
            size = prompt("请输入压缩大小（kb）:", "600");
        }
        me.find("input").val(size);
        return true;
    }
    return false;
}
//上传按钮
var _SetUpload_ = function (options) {
    var def =
    {
        action: 'SaveHttpPostedFile',
        ajax: "handler/upload.ashx",
        buttonID: 'Upload_Img',
        fileName: 'imgFile',
        input: null, //设置保存文件路径
        dir: 'image',
        imgwarp: false,
        types: 'gif,jpg,jpeg,png,bmp', //上传类型
        iframeid: 'upload_iframe_',
        verification: function (fileName) {
            var me = this;
            var fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1);
            var types = ',' + me.options.types + ',';
            if (!fileExtension || types.indexOf(fileExtension) == -1) {
                _alert("请上传" + me.options.types + "类型的文件！");
                return false;
            }
            return true;
        },
        loadedSuccessfully: function () {
            var me = this;
            var offset = me.btn.offset();
            me.formFileUpload.css({ top: offset.top, left: offset.left, width: me.btn.outerWidth(), height: me.btn.outerHeight() });
            $(me.btn).hover(function () {
                var _me = $(this);
                var _offset = _me.offset();
                me.formFileUpload.css({ top: _offset.top, left: _offset.left }).show();
            })
        },
        showImg: function (data) { },
        uploadSuccess: function (data, isNoShow) {
            var me = this;
            if (!isNoShow) {
                _alert("上传成功！");
            }
            me.btn = $(me.btn);
            var url = data.url;
            if (url) {
                if (me.options.input) {
                    $j(me.options.input).val(url);
                }
                if (me.options.showImg) {
                    me.options.showImg.call(me, data);
                }
            }
        },
        afterUpload: function (data, isNoShow) {
            var me = this;
            if (data.error === 0) {
                me.options.uploadSuccess.call(me, data, isNoShow);
            } else {
                _alert(data.message ? data.message : "上传失败！");
            }
        },
        afterError: function (data) {
            _alert("上传失败，请稍后重试！\r\n" + data);
        },
        clear: function () {
            var me = this;
            var data = {};
            $(me.formFileUpload).find("[name!='" + me.options.fileName + "']").each(function () {
                data[$(this).attr("name")] = $(this).val();
            })
            me.formFileUpload[0].reset();
            for (var name in data) {
                $(me.formFileUpload).find("[name='" + name + "']").val(data[name]);
            }
        }
    };
    var me = this;
    me.options = options = jQuery.extend(def, options);
    me.options.ajax = me.options.action ? (me.options.ajax + (me.options.ajax.indexOf('?') > 0 ? '&' : '?') + 'action=' + me.options.action) : me.options.ajax;
    me.options.ajax = me.options.dir ? (me.options.ajax + (me.options.ajax.indexOf('?') > 0 ? '&' : '?') + 'dir=' + me.options.dir) : me.options.ajax;
    var html = [
        '<form action="' + me.options.ajax + '" id="' + me.options.buttonID + '_formFileUpload" method="post" enctype="multipart/form-data" target="' + me.options.iframeid + '" style="position:absolute;z-index:100;overflow:hidden;opacity:0;_filter:none;">',
            '<div style="position:relative">',
                '<input type="file" name="' + me.options.fileName + '" style="font-size:80px;position:absolute;right:0;top:0;opacity:0;_filter:alpha(opacity=0);height: 200px;line-height: 200px;cursor: pointer;" title="点击上传" />',
                '<input type="hidden" name="Watermark" value="false" />',
                (me.options.imgurl ? '<input type="hidden" name="ReplaceFile" value="' + me.options.imgurl + '"/>' : ''),
            '</div>',
            '<input type="hidden" name="dir" value="' + me.options.dir + '"/>',
        '</form>'].join('');

    me.btn = $j(me.options.buttonID);
    if (!me.btn.length) {
        _alert("不存在" + me.options.buttonID);
        return me;
    }
    var upload_iframe_html = '<iframe id="' + me.options.iframeid + '" name="upload_iframe_" style="display:none;"></iframe>';
    me._iframe = $j(options.iframeid);
    if (!me._iframe.length) {
        $(document.body).append(upload_iframe_html);
        me._iframe = $j(options.iframeid);
    }
    me.formFileUpload = $j(me.options.buttonID + "_formFileUpload");
    if (!me.formFileUpload.length) {
        $(document.body).append(html);
        me.formFileUpload = $j(me.options.buttonID + "_formFileUpload").hide();
    }

    me.formFileUpload.mouseout(function () {
        $(this).hide();
    })
    me.formFileUpload.find("input[name='imgFile']").unbind().bind("change", function () {
        var fileName = $(this).val();
        if (fileName) {
            if (me.options.types && options.types !== "*" && me.options.verification && me.options.verification.call(me, fileName) === false) {
                me.options.clear.call(me);
                return me;
            }
            me._iframe.bind('load', function () {
                me._iframe.unbind();
                var doc = window.frames[me.options.iframeid].document;
                var data = null;
                var str = doc.body.innerHTML;
                str = _unescape(str);
                me._iframe.attr("src", "javascript:false");
                try {
                    data = jQuery.parseJSON(str);
                } catch (e) {
                    me.options.afterError.call(me, '<!doctype html><html>' + doc.body.parentNode.innerHTML + '</html>');
                }
                if (data && data.error !== undefined) {
                    me.options.afterUpload.call(me, data, false);
                }
                me._iframe.attr("src", "");
                me.options.clear.call(me);
            });
            if (toggleWatermark) {
                if (confirm("是否添加水印")) {
                    $(me.formFileUpload).find("[name='Watermark']").val("true");
                    me.formFileUpload.submit();
                } else {
                    me.formFileUpload.submit();
                }
            } else {
                me.formFileUpload.submit();
            }
        }
    })
    if (me.options.input) {
        var value = $j(me.options.input).val();
        if (value) {
            me.options.uploadSuccess.call(me, { error: 0, url: value }, true);
        }
    }
    me.options.loadedSuccessfully.call(me);
    //return me;
}
$(function () {
    loadJs("js/common/edit.js", function () {
        $(document.body).append("<span id=\"SetUpload_\" />");
        var upload = new _SetUpload_({
            buttonID: "SetUpload_",
            action: "SavePictureHttpPostedFile",
            imgurl: '用于替换修改图片',
            loadedSuccessfully: function () {
                var me = this;
                $("i.v_edit").hover(function () {
                    var _me = $(this);
                    var _offset = _me.offset();
                    var img = _me.siblings("img");
                    var src = img.attr("src");
                    if (src) {
                        me.formFileUpload.css({ top: _offset.top, left: _offset.left, width: _me.outerWidth(), height: _me.outerHeight() }).show();
                        me.options.types = src.substr(src.lastIndexOf('.') + 1);
                        me.options.types = me.options.types.lastIndexOf('?') > 0 ? me.options.types.substr(0, me.options.types.lastIndexOf('?')) : me.options.types;
                        me.formFileUpload.find("input[name='ReplaceFile']").val(img.attr("oid"));
                        me._img = img;
                    }
                })
            },
            showImg: function (data) {
                var me = this;
                var url = data.url;
                if (me._img) {
                    $(me._img).attr("src", url + "?" + new Date().getTime());
                }
            }
        });
    });

    $("i.v_cat").bind("click", function (e) {
        var w = $(window).width();//-10;
        var me = $(this);
        var img = $(me).siblings("img");
        var oid = img.attr("oid");
        var src = img.attr("src").toLowerCase();
        if (src.length > 0 && src != "/js/grey.gif" || src[0] != "/") {
            var myWindow = window.open('jcrop.html?oid=' + oid , '图片裁切', 'width=' + w + ',height=600,left=2,top=10');
            return;
        }
        _alert("网络图片和不存在的图片无法裁切", 3000);
    });
})