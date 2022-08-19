/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/

KindEditor.plugin('pagebreak', function (K) {
    var self = this;
    var name = 'pagebreak';
    var pagebreakHtml = K.undef(self.pagebreakHtml, '<hr class="ke-pagebreak" />');

    self.clickToolbar(name, function () {
        var cmd = self.cmd, range = cmd.range;
        self.focus();
        var tail = self.newlineTag == 'br' || K.WEBKIT ? '' : '<span id="__kindeditor_tail_tag__"></span>';
        var ancestor = K(range.commonAncestor());
        var cg = true;
        if (ancestor.name == "body") {
            self.insertHtml(pagebreakHtml + tail);
        } else {
            var p = ancestor;
            var cur = p;
            while (p.name != "body") {
                cur = p;
                p = cur.parent();
            }
            if (p.name == "body") {
                cur.after(pagebreakHtml + tail);
                var next = $(cur[0]).next();
                if (next.length > 0) {
                    var rtop = next[0].offsetTop;
                    var body = cmd.doc.body;
                    var stop = cmd.doc.body.scrollTop;
                    var clientHeight = body.clientHeight;
                    var max = clientHeight + stop;
                    var ctop = rtop - clientHeight + 20;
                    if (ctop > stop) {
                        //console.log("rtop=" + rtop + ",stop=" + stop + ",clientHeight=" + clientHeight);
                        body.scrollTop = ctop;
                    }
                }
            } else {
                cg = false;
                alert("插入分页错误");
            }
        }
        if (cg) {
            if (tail !== '') {
                var p = K('#__kindeditor_tail_tag__', self.edit.doc);
                range.selectNodeContents(p[0]);
                p.removeAttr('id');
                cmd.select();
            }
        }
    });
});
