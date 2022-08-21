//格式划
KindEditor.plugin('typesetting', function (K) {
    var self = this, name = 'typesetting',
    blockMap = K.toMap('blockquote,center,div,h1,h2,h3,h4,h5,h6,p');

    function getFirstChild(knode) {
        var child = knode.first();
        while (child && child.first()) {
            child = child.first();
        }
        return child;
    }

    self.clickToolbar(name, function () {
        var dialog = K.dialog({
            width: 240,
            title: '温馨提示',
            body: '<div style="margin:10px;"><strong>对齐文本功能将取消之前你设置好的所有文本样式</strong></div>',
            closeBtn: {
                name: '关闭',
                click: function (e) {
                    dialog.remove();
                }
            },
            yesBtn: {
                name: '确定',
                click: function (e) {
                    //K.loadScript("/NSWEditor/NSWFckeditor.js", function () {
                    //ContentAlign('content', 1, self);

                    self.focus();
                    var doc = self.edit.doc,
			            range = self.cmd.range,
			            child = K(doc.body).first(), next,
			            nodeList = [], subList = [],
			            bookmark = range.createBookmark(true);
                    function RBR(child) {
                        if ((child.name == "div" && child.hasAttr("style") && child.hasAttr("class")) || child.name == "#text" || child.name == "body") {
                            var html = child.html();
                            if (html == "") {
                                if (child.name == "body") {
                                    return false;
                                }
                                return RBR(K(doc.body));
                            }
                            html = "<p style='text-indent:2em;'>" + html.replace(/(<br[^>]*\/>)/ig, "</p><p style='text-indent:2em;'>") + "</p>";
                            child.html(html);
                            return true;
                        }
                    }
                    if (RBR(child) === true) {

                    } else {
                        while (child) {
                            next = child.next();
                            var firstChild = getFirstChild(child);
                            if (child.html() == "<br />") {
                                next = child.next();
                                child.remove();
                            } else {
                                if (!firstChild || firstChild.name != 'img') {
                                    if (blockMap[child.name]) {
                                        child.html(child.html().replace(/^(\s|&nbsp;|　)+/ig, ''));
                                        //alert(child.html());
                                        child.css('text-indent', '2em');
                                    } else {
                                        subList.push(child);
                                    }
                                    if (!next || (blockMap[next.name] || blockMap[child.name] && !blockMap[next.name])) {
                                        if (subList.length > 0) {
                                            nodeList.push(subList);
                                        }
                                        subList = [];
                                    }
                                } else if (firstChild) {
                                    if (firstChild.name == "img") {
                                        var istrue = true;
                                        K(child).scan(function (node) {
                                            if (node.nodeName != "IMG" && node.nodeName != "#text") {
                                                istrue = false;
                                                return false;
                                            }
                                        });
                                        if (istrue) {
                                            child.css("text-indent", 0);
                                            child.css("text-align", "center");
                                        }
                                    }
                                }
                                child = next;
                            }
                        }
                        K.each(nodeList, function (i, subList) {
                            var wrapper = null;
                            wrapper = K('<p style="' + (subList[0].name == 'img' ? 'text-align:center' : 'text-indent:2em') + ';"></p>', doc);
                            subList[0].before(wrapper);
                            K.each(subList, function (i, knode) {
                                wrapper.append(knode);
                            });
                        });
                    }
                    self.addBookmark();
                    dialog.remove();
                }
            },
            noBtn: {
                name: '取消',
                click: function (e) {
                    dialog.remove();
                }
            }
        });
    });
});