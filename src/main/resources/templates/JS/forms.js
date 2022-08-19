function include_script(file, callback) {
    var fileObj = $("head > script[src='" + file + "']");
    if (fileObj.length) {
        return;
    }
    var _doc = document.getElementsByTagName('head')[0];
    var isIE = navigator.userAgent.toUpperCase().indexOf("MSIE") == -1 ? false : true;
    var _fileObj;
    _fileObj = document.createElement('script');
    _fileObj.setAttribute('type', 'text/javascript');
    _fileObj.setAttribute('src', file);
    _doc.appendChild(_fileObj);
    if (!isIE) {
        _fileObj.onload = function () {
            callback(file)
        }
    }
    else {
        _fileObj.onreadystatechange = function () {
            if (_fileObj.readyState == 'loaded' || _fileObj.readyState == 'complete') {
                callback(file);
            }
        }
    }
}
$(function () {
    include_script("/js/addForm.js", function (file) {
        var ids = [], i = 0, j;
        $("script[oid]").each(function () {
            if ($(this).attr("src").toLowerCase().indexOf("forms.js") > -1) {
                var oid = parseInt($(this).attr('oid'));
                var newId = oid;
                for (j = 0; j < i; j++) {
                    if (ids[j] == oid) {
                        newId += "01";
                        break;
                    }
                }
                ids[i] = oid;
                GetFroms(this, oid, newId);
                i++;
                $(this).attr("oid", null);
            }
        })
    })
})