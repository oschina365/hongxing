function AddApply(a) {
    var b = document.getElementById("TxtType").selectedIndex;
    var c = $tv("TxtUrl") || $tv("txtUrl") || $tv("TxtURL");
    var e = $tv("TxtName");
    var d = $tv("TxtPhotoPath");
    var h = $tv("TxtMsg");
    var k = $tv("TxtUserName");
    var f = $tv("TxtTel");
    var g = $tv("TxtEmail");
    var j = $tv("TxtQQ");
    if (c == "" || c == "http://") {
        $a("请输入网址！", "TxtUrl");
        return
    }
    if (e == "") {
        $a("请输入网站名称！", "TxtName");
        return
    }
    if (h.length > 400) {
        $a("网站简况不能大于400字！", "txtUsername");
        return
    }
    $.post("/ajax.ashx?action=apply&t=" + Math.random(), {
        Type: b,
        Url: c,
        Name: e,
        PhotoPath: d,
        Content: h,
        UserName: k,
        Phone: f,
        Email: g,
        QQ: j
    }, function (l) {
        if (gav(l, "state") == "1") {
            $a(gav(l, "msg"));
            emptyText('tbForm');
        } else {
            $a(gav(l, "msg"))
        }
    }
    )
}