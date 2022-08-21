/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/

KindEditor.plugin('filemanager', function (K) {
    var self = this, name = 'filemanager',
		fileManagerJson = K.undef(self.fileManagerJson, self.basePath + 'php/file_manager_json.php'),
		imgPath = self.pluginsPath + name + '/images/',
		lang = self.lang(name + '.');

    function makeFileTitle(filename, filesize, datetime) {
        return filename + ' (' + Math.ceil(filesize / 1024) + 'KB, ' + datetime + ')';
    }
    function bindTitle(el, data) {
        if (data.is_dir) {
            el.attr('title', data.filename);
        } else {
            el.attr('title', makeFileTitle(data.filename, data.filesize, data.datetime));
        }
    }
    self.plugin.filemanagerDialog = function (options) {
        clickFn = options.clickFn;
        if (options.dirName === "image") {
            if (!self.kindeditor_image_) {
                self._srcElement = $(self.srcElement[0]);
                loadJs("js/common/editor.js", function () {
                    self.kindeditor_image_ = new kindeditor_image(self, {
                        max: 1,
                        Item: function (data) {
                            clickFn.call(this, data.url, data.title); //单击图片
                        }
                    });
                });
            } else {
                var me = self.kindeditor_image_.pop;
                me.options.show.call(me);
            }
        } else {
            if (!self.kindeditor_files_) {
                self._srcElement = $(self.srcElement[0]);
                loadJs("js/common/editor.js", function () {
                    self.kindeditor_files_ = new kindeditor_files(self, {
                        max: 1,
                        Item: function (data) {
                            clickFn.call(this, data.url, data.title); //单击图片
                        }
                    });
                });
            } else {
                var me = self.kindeditor_files_.pop;
                me.options.show.call(me);
            }
        }
    }
});
