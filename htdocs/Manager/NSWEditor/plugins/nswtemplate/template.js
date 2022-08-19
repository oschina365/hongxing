var J_TOP_DOC = $(top.document);
var J_TOP_BODY = $(top.document.body);
function showSBLWrapper() {
    var jO = J_TOP_DOC.find("#SLB-Wrapper");
    if (!jO.length) {
        var sHtml =
        '<div id="SLB-Wrapper">'
            + '<div id="SLB-Contenedor">'
            + '    <div id="SLB-Top"><a id="SLB-CloseButton" href="javascript:;" onclick="hideSBLWrapper()">&nbsp;</a></div>'
            + '    <div id="SLB-Contenido"><div class="gunDong"></div></div>'
            + '    <div class="SLB-bbnav" id="SLB-Bottom"></div>'
            + '</div>'
        + '</div>';
        J_TOP_BODY.append(sHtml);
        jO = J_TOP_DOC.find("#SLB-Wrapper");
    }
    jO.css("opacity", 1);
    top.window.showTopFullBg();
    top.window.setTopCM("SLB-Wrapper");
    return jO;
}

function showSBLWrapperImg(em, src) {
    var contenido = $(em).find("#SLB-Contenido");
    var width = contenido.width();
    var height = contenido.height();
    var image = new Image();
    image.onload = function () {
        contenido = contenido.find(".gunDong");
        contenido.css({ "width": width + 30, "height": height });
        var w = this.width;
        var bl = width / w;
        var p = 0;
        var flag = false;
        if (w > width) {
            this.width = width;
            this.height = this.height * bl;
            flag = true;
        } else {
            p = (width - w) / 2;
        }
        contenido.html(image);
        if (!flag) {
            $(em).find("#SLB-Contenido img").css("padding-left", p);
        }
    }
    image.src = src;
}