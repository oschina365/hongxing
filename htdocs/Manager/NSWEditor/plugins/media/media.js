/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/
var MediaTemp = ''
			+ '<object codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="{width}" height="{height}" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">'
			 +'       <param name="quality" value="high" />'
			 +'       <param name="allowFullScreen" value="true" />'
			 +'       <param name="wmode" value="transparent" />'
			 +'       <param name="movie" value="/images/flvplayer.swf">'
			 + '      <param name="FlashVars" value="vcastr_file=vcastr_file={vcastr_file}&IsAutoPlay={IsAutoPlay}&IsContinue=0">'
			 + '      <embed src="/images//flvplayer.swf" flashvars="vcastr_file={vcastr_file}&IsAutoPlay={IsAutoPlay}&IsContinue=0" width="{width}" height="{height}" pluginspage=" http://www.macromedia.com/go/getflashplayer" quality="high" allowfullscreen="true" type="application/x-shockwave-flash">'
			 +'           <param name="wmode" value="transparent" />'
			 + '      </embed>'
			+'</object>';
KindEditor.plugin('media', function (K) {
    var self = this, name = 'media', lang = self.lang(name + '.'),
		allowMediaUpload = K.undef(self.allowMediaUpload, true),
		allowFileManager = K.undef(self.allowFileManager, false),
		formatUploadUrl = K.undef(self.formatUploadUrl, true),
		extraParams = K.undef(self.extraFileUploadParams, {}),
		filePostName = K.undef(self.filePostName, 'imgFile');
    self.plugin.media = {
        edit: function () {
            var html = [
				'<div style="padding:20px;">',
            //url
				'<div class="ke-dialog-row">',
				'<label for="keUrl" style="width:60px;">' + lang.url + '</label>',
				'<input class="ke-input-text" type="text" id="keUrl" name="url" value="" style="width:160px;" /> &nbsp;',
				'<span class="ke-button-common ke-button-outer">',
				'<input type="button" class="ke-button-common ke-button" name="viewServer" value="' + lang.viewServer + '" />',
				'</span>',
				'</div>',
            //width
				'<div class="ke-dialog-row">',
				'<label for="keWidth" style="width:60px;">' + lang.width + '</label>',
				'<input type="text" id="keWidth" class="ke-input-text ke-input-number" name="width" value="550" maxlength="4" />',
				'</div>',
            //height
				'<div class="ke-dialog-row">',
				'<label for="keHeight" style="width:60px;">' + lang.height + '</label>',
				'<input type="text" id="keHeight" class="ke-input-text ke-input-number" name="height" value="400" maxlength="4" />',
				'</div>',
            //autostart
				'<div class="ke-dialog-row">',
				'<label for="keAutostart">' + lang.autostart + '</label>',
				'<input type="checkbox" id="keAutostart" name="autostart" value="" /> ',
				'</div>',
				'</div>'
			].join('');
            var dialog = self.createDialog({
                name: name,
                width: 380,
                height: 230,
                title: self.lang(name),
                body: html,
                yesBtn: {
                    name: self.lang('yes'),
                    click: function (e) {
                        var url = K.trim(urlBox.val()),
							width = widthBox.val(),
							height = heightBox.val();
                        if (url == 'http://' || K.invalidUrl(url)) {
                            alert(self.lang('invalidUrl'));
                            urlBox[0].focus();
                            return;
                        }
                        if (!/^\d*$/.test(width)) {
                            alert(self.lang('invalidWidth'));
                            widthBox[0].focus();
                            return;
                        }
                        if (!/^\d*$/.test(height)) {
                            alert(self.lang('invalidHeight'));
                            heightBox[0].focus();
                            return;
                        }
                        //2015-03-30修改视频代码
                        var html = K.mediaImg(self.themesPath + 'common/blank.gif', {
                            src: url,
                            type: K.mediaType(url),
                            width: width,
                            height: height,
                            autostart: autostartBox[0].checked ? 'true' : 'false',
                            loop: 'true'
                        });
                        //var html = MediaTemp.replace(/{width}/ig, width).replace(/{height}/ig, height).replace(/{IsAutoPlay}/ig, autostartBox[0].checked ? '1' : '0').replace(/{vcastr_file}/ig, url);
                        //alert(html);
                        self.insertHtml(html).hideDialog().focus();
                    }
                }
            }),
			div = dialog.div,
			urlBox = K('[name="url"]', div),
			viewServerBtn = K('[name="viewServer"]', div),
			widthBox = K('[name="width"]', div),
			heightBox = K('[name="height"]', div),
			autostartBox = K('[name="autostart"]', div);
            urlBox.val('http://');

            if (allowFileManager) {
                viewServerBtn.click(function (e) {
                    self.loadPlugin('filemanager', function () {
                        self.plugin.filemanagerDialog({
                            viewType: 'LIST',
                            dirName: 'media',
                            clickFn: function (url, title) {
                                if (self.dialogs.length > 1) {
                                    K('[name="url"]', div).val(url);
                                    if (self.afterSelectFile) {
                                        self.afterSelectFile.call(self, url);
                                    }
                                    self.hideDialog();
                                }
                            }
                        });
                    });
                });
            } else {
                viewServerBtn.hide();
            }

            var img = self.plugin.getSelectedMedia();
            if (img) {
                var attrs = K.mediaAttrs(img.attr('data-ke-tag'));
                urlBox.val(attrs.src);
                widthBox.val(K.removeUnit(img.css('width')) || attrs.width || 0);
                heightBox.val(K.removeUnit(img.css('height')) || attrs.height || 0);
                autostartBox[0].checked = (attrs.autostart === 'true');
            }
            urlBox[0].focus();
            urlBox[0].select();
        },
        'delete': function () {
            self.plugin.getSelectedMedia().remove();
            // [IE] 删除图片后立即点击图片按钮出错
            self.addBookmark();
        }
    };
    self.clickToolbar(name, self.plugin.media.edit);
});
