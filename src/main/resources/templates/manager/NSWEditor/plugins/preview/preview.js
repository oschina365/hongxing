/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/

KindEditor.plugin('preview', function (K) {
    var self = this, name = 'preview', undefined;
    self.clickToolbar(name, function () {
        var w = $(self.container[0]).width();
        var lang = self.lang(name + '.'),
			html = '<div style="padding:10px 10px;">' +
				'<iframe class="ke-textarea" frameborder="0" style="width:' + (w - 20) + 'px;height:400px;"></iframe>' +
				'</div>',
			dialog = self.createDialog({
			    name: name,
			    width: w,
			    title: self.lang(name),
			    body: html
			}),
			iframe = K('iframe', dialog.div),
			doc = K.iframeDoc(iframe);
        doc.open();
        var body = self.edit.doc.body;
        doc.write('<!doctype html><html>' + body.parentNode.innerHTML + '</html>')
        //doc.write(self.fullHtml());
        doc.close();
        K(doc.body).css('background-color', '#FFF');
        iframe[0].contentWindow.focus();
    });
});
