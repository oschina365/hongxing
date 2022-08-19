/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/

KindEditor.plugin('link', function (K) {
    var self = this, name = 'link';
    self.plugin.link = {
        edit: function () {
            var lang = self.lang(name + '.'),
				html = '<div style="padding:20px;">' +
            //url
					'<div class="ke-dialog-row">' +
					'<label for="keUrl" style="width:60px;">' + lang.url + '</label>' +
					'<input class="ke-input-text" type="text" id="keUrl" name="url" value="" style="width:260px;" /></div>' +

            //内容
					'<div class="ke-dialog-row" id="keTextWarp">' +
					'<label for="keUrl" style="width:60px;">内容</label>' +
					'<input class="ke-input-text" type="text" id="keText" name="text" value="" style="width:260px;" /></div>' +

            //title
					'<div class="ke-dialog-row">' +
					'<label for="keUrl" style="width:60px;">' + lang.title + '</label>' +
					'<input class="ke-input-text" type="text" id="keTitle" name="title" value="" style="width:260px;" /></div>' +
            //type
					'<div class="ke-dialog-row"">' +
					'<label for="keType" style="width:60px;">' + lang.linkType + '</label>' +
					'<select id="keType" name="type"></select>' +
					'</div>' +
					'</div>',
				dialog = self.createDialog({
				    name: name,
				    width: 450,
				    title: self.lang(name),
				    body: html,
				    yesBtn: {
				        name: self.lang('yes'),
				        click: function (e) {
				            var url = K.trim(urlBox.val());
				            var title = K.trim(titleBox.val());
				            var text = K.trim(textBox.val());
				            if (url == 'http://' || K.invalidUrl(url)) {
				                alert(self.lang('invalidUrl'));
				                urlBox[0].focus();
				                return;
				            }
				            self.exec('createlink', url, title, typeBox.val(), text).hideDialog().focus();
				        }
				    }
				}),
				div = dialog.div,
                textWarp = K("#keTextWarp", div).hide(),
                textBox = K('input[name="text"]', div),
				urlBox = K('input[name="url"]', div),
                titleBox = K('input[name="title"]', div),
				typeBox = K('select[name="type"]', div);
            urlBox.val('http://');
            titleBox.val('');
            textBox.val('');
            typeBox[0].options[0] = new Option(lang.newWindow, '_blank');
            typeBox[0].options[1] = new Option(lang.selfWindow, '');
            self.cmd.selection();
            var text = "";
            var iscollapsed = false;
            var a = self.plugin.getSelectedLink();
            if (a) {
                self.cmd.range.selectNode(a[0]);
                self.cmd.select();
                urlBox.val(a.attr('data-ke-src'));
                titleBox.val(a.attr("title"));
                typeBox.val(a.attr('target'));
                text = K.trim(a.text());
                var childrens = a.children();
                if (childrens.length > 0) {
                    var keys = "|#text|br|";
                    childrens.each(function (i, src) {
                        var name = src.nodeName.toLowerCase();
                        if (keys.indexOf("|" + name + "|") < 0) {
                            text = "";
                            return false;
                        }
                    })
                }
                if (text) {
                    textWarp.show();
                    textBox.val(text);
                    if (text == a.attr("title")) titleBox.val("");
                }
            } else {
                var range = self.cmd.range;
                if ((iscollapsed = range.collapsed)) {
                    textWarp.show();
                }
            }
            urlBox[0].focus();
            urlBox[0].select();
        },
        'delete': function () {
            self.exec('unlink', null);
        }
    };
    self.clickToolbar(name, self.plugin.link.edit);
});
