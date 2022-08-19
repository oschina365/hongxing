KindEditor.plugin('section', function (K) {
    var self = this, name = 'section', lang = self.lang(name + '.');
    self.plugin.section = {
        "delete": function () {
            var section = self.plugin.section._parents("section");
            section.remove();
            self.addBookmark();
        },
        "_parents": function (tj) {//例子section,section.classname,.classname
            var section = self.plugin.getSelectedSection();
            var _section = null;
            var arr = tj.split('.');
            var tagName = arr[0];
            var cssName = arr.length > 0 ? arr[1] : '';
            var max = 5;
            while (max > 0) {
                if ((!tagName || (tagName && section[0].tagName.toLowerCase() == tagName)) && ((!cssName || (cssName && section.cssName.indexOf(cssName) > -1)))) {
                    _section = section;
                    section = section.parent();
                } else {
                    break;
                }
                max--;
            }
            return _section;
        }
    }
});