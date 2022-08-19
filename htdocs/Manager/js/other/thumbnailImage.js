if (typeof (window.loadjs_obj) == "undefined") {
    window.loadjs_obj = {};
}
window.loadjs_obj["/thumbnailimage.js"] = true;
function SetThumbnailImage(src, options) {
    return this.init(src, options);
}
_extend(SetThumbnailImage, {
    options: {

},
init: function (src, options) {
    var me = this;
    src = me.src = $(src);
    op = me.options = jQuery.extend({}, me.options, options);
    op.width = op.width || src.children(":first").outerWidth(true);
    op.height = op.width || src.outerHeight(true);
    op.scrollWidth = op.scrollWidth || src.children().eq(0).outerWidth(true);
    op.show = op.show || 3;
    src.after('<div style="width:' + (op.width * op.show + 2) + 'px;height:' + (src.outerHeight(true) > 0 ? src.outerHeight(true) + "px" : "auto") + ';overflow:hidden;position: relative;"></div>');
    src.children().css("float", "left").css("overflow", "hidden");
    src.next("div").append(src);
    src.attr("style", "width:10000px;position:relative;left:0;top:0;");

    src = me.src = $(src);
    $(op.next).bind("click", function () {
        var left = parseInt(src.css("left"));
        left = isNaN(left) ? 0 : left;

        var lis = src.children().not(".no_li");
        var max = Math.ceil(lis.length / op.show);

        var _left = left > 0 ? left : -(left);
        _left = _left / (op.width * op.show) + 1;
        if (_left < max) {
            src.stop(true, true).animate({ "left": -_left * (op.width * op.show) }, 500);
        } else {
            src.stop(true, true).animate({ "left": 0 }, 500);
        }
        $(op.next).attr("isClick", "true");
        $(op.prev).attr("isClick", "false");
    })
    $(op.prev).bind("click", function () {
        var left = parseInt(src.css("left"));
        left = isNaN(left) ? 0 : left;

        if (left < 0) {
            src.stop(true, true).animate({ "left": left + (op.width * op.show) }, 500);
        } else {
            var lis = src.children().not(".no_li");
            var max = Math.ceil(lis.length / op.show) - 1;
            src.stop(true, true).animate({ "left": -max * (op.width * op.show) }, 500);
        }
        $(op.next).attr("isClick", "false");
        $(op.prev).attr("isClick", "true");
    })
    src.bind("_change_", function () {
        var lis = src.children().not(".no_li");
        var max = Math.ceil(lis.length / op.show) - 1;
        src.stop(true, true).animate({ "left": -(op.width * op.show * max) }, 500);
    })
}
});

$(function () {
    $(".ThumbnailImage").each(function () {
        var me = $(this);
        var data = me.attr("data-src") ? _Json(me.attr("data-src")) || {} : {};
        new SetThumbnailImage(me, data);
    })
})