/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2011 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @site http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
*******************************************************************************/

KindEditor.plugin('controls', function (K) {
    var self = this, name = 'controls';

    self.plugin[name + "Dialog"] = function (options) {
        var lang = self.lang(name + '.'),
			html = ['<div style="padding:10px 20px;">',
				'<div class="ke-dialog-row">',
				'<select class="ke-code-type">',
				'</select><span class="ke-button-common ke-button-outer ke-dialog-yes getimgs" style="margin:0;float:right;"><input class="ke-button-common ke-button" type="button" value="选择图片" /></span>',
				'</div>',
				'<div style="width:708px;height:260px;" class="ke-textarea-warp"></div>',
				'</div>'].join(''),
                nodes = self.plugin.getSelectedControls(),
			dialog = self.createDialog({
			    name: name,
			    width: 750,
			    title: self.lang(name),
			    body: html,
			    showMask: false,
			    yesBtn: {
			        name: '确认',
			        click: function (e) {
			            var code = textarea.val();
			            var val = parseInt(select.val());
			            var node = null;
			            if (isNaN(val) || val < 0 || val >= nodes.length || !(node = nodes[val])) {
			                setTimeout(function () {
			                    alert("信息有错误！");
			                    self.hideDialog().focus();
			                }, 0);
			                return;
			            } else {
			                if (code == "") {
			                    if (confirm("确定删除该元素？")) {
			                        $(node).remove();
			                    }
			                } else {
			                    code = self.edit.beforeSetHtml(code);
			                    if (self.options.controlOuterHTML) {
			                        $(node).prop("outerHTML", code);
			                    } else {
			                        $(node).html(code);
			                    }
			                }
			            }
			            self.hideDialog().focus();
			        }
			    }
			}),
			textarea = K('textarea', dialog.div),
            getimgs = K('.getimgs', dialog.div),
            textarea_warp = K(".ke-textarea-warp", dialog.div),
            select = K('select', dialog.div);

        var textarea = K.CodemirrorTools.getCodemirror(textarea_warp[0], function (warp, textarea, obj) {
            if (!obj.isCodemirror) {
                $(textarea).addClass("ke-textarea").attr("style", 'width:708px;height:260px;font: 12px/1.5 \'Consolas\', \'Monaco\', \'Bitstream Vera Sans Mono\', \'Courier New\', Courier, monospace;color:#000;');
            } else {
                warp.find(".CodeMirror").css("height", parseInt(warp.height() - 2)).parent().css("border", "1px solid #ccc");
            }
        });
        nodes = nodes || [];
        if (nodes.length == 0) {
            setTimeout(function () {
                alert("信息有错误！");
                self.hideDialog().focus();
            }, 0);
        }

        var htmls = [];
        select = $(select[0]);
        var max = 0;
        var c = "";
        for (var i = nodes.length - 1; i > -1; i--) {
            var node = nodes[i];
            var name = node.nodeName.toLowerCase();
            if (node.className) {
                name += "（" + node.className + "）";
            }
            if (max > 0) {
                name = c + "├-" + name;
            }
            htmls.push("<option value='" + i + "'>" + name + "</option>");
            max++;
            c += "　";
        }
        select.append(htmls.join(""));

        $(getimgs[0]).bind("click", function () {
            self.clickToolbar("multiimage");
        });

        select.bind("change", function () {
            var val = parseInt($(this).val());
            var node = null;
            if (isNaN(val) || val < 0 || val >= nodes.length || !(node = nodes[val])) {
                setTimeout(function () {
                    alert("信息有错误！");
                    self.hideDialog().focus();
                }, 0);
            } else {
                var html = self.options.controlOuterHTML ? $(node).prop("outerHTML") : $(node).html();
                textarea.val(self.edit.beforeGetHtml(html));
            }
        }).val(0).change();

        self.MultiimageElement = textarea;
    }

    self.plugin[name] = {
        edit: function () {
            self.plugin[name + "Dialog"]();
        }
    }
});
