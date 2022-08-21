KindEditor.plugin('usercontrol', function (K) {
    var self = this, name = 'usercontrol', lang = self.lang(name + '.'),
    imgPath = self.pluginsPath + 'image/images/';
    var typeOptions = {};
    self.plugin.usercontrol = {
        edit: function () {
            var html = [
                '<div style="padding:10px 15px;">',
			            '<div class="tab1 usercontrol_tab">',
			                '<div class="ke-dialog-row">',
                                '<div class="fl">',
                                    '<img id="usercontrolSrc" src="/Skins/Default/Img/Email_ico_01.gif" width="180px" height="200px"/>',
                                '</div>',
                                '<div class="fr">',
                                    '<div class="ke-dialog-row-row">',
                                        '<label for="usercontrolColumnName">' + lang.columnname + '：</label>',
                                        '<input type="text" id="usercontrolColumnName" class="ke-input-text" name="ColumnName" value="">',
                                    '</div>',
                                    '<div class="ke-dialog-row-row">',
                                        '<label for="usercontrolColumnNameURL">' + lang.columnnameurl + '：</label>',
                                        '<input type="text" id="usercontrolColumnNameURL" class="ke-input-text" name="ColumnNameURL" value="">',
                                    '</div>',
                                    '<div class="ke-dialog-row-row">',
                                        '<label for="usercontrolColumns">' + lang.columns + '：</label>',
                                        '<select id="usercontrolColumns" name="Columns">',
                                            '<option value="news" selected="selected">资讯栏目</option>',
                                            '<option value="product">产品栏目</option>',
                                            '<option value="help">帮助栏目</option>',
                                            '<option value="project">方案栏目</option>',
                                            '<option value="agent">招商加盟栏目</option>',
                                        '</select>',
                                    '</div>',
                                    '<div class="ke-dialog-row-row">',
                                        '<label for="usercontrolSID">SID：</label>',
                                        '<select id="usercontrolSID" name="SID">',
                                            '<option value="">请选择分类....</option>',
                                        '</select>',
                                        '<img class="ke-refresh-btn" src="' + imgPath + 'refresh.png" width="16" height="16" alt="" style="cursor:pointer;margin-left: 5px;" title="重置标题和链接" />',
                                    '</div>',
                                    '<div class="ke-dialog-row-row">',
                                        '<label for="usercontrolCssName">' + lang.cssname + '：</label>',
                                        '<input type="text" id="usercontrolCssName" class="ke-input-text" name="CssName" value="" style="width:60px;">',
                                        '<label for="usercontrolSelectCount" style="width:40px; margin-left:10px;">' + lang.selectcount + '：</label>',
                                        '<input type="text" id="usercontrolSelectCount" class="ke-input-text" name="SelectCount" value="3" style="width:40px;">',
                                    '</div>',
                                    '<div class="ke-dialog-row-row">',
                                        '<label for="usercontrolWidth">' + lang.width + '：</label>',
                                        '<input type="text" id="usercontrolWidth" class="ke-input-text" name="Width" value="" style="width:60px;">',
                                        '<label for="usercontrolHeight" style="width:40px; margin-left:10px;">' + lang.height + '：</label>',
                                        '<input type="text" id="usercontrolHeight" class="ke-input-text" name="Height" value="" style="width:40px;">',
                                    '</div>',
                                    '<div class="ke-dialog-row-row"><i style="color:Red; line-height:30px; vertical-align:middle; padding-right:5px;">*</i>非专业人员，请勿随便修改下列条件</div>',
                                    '<div class="ke-dialog-row-row">',
                                        '<label for="usercontrolOrderBy">' + lang.orderby + '：</label>',
                                        '<input type="text" id="usercontrolOrderBy" class="ke-input-text" name="OrderBy" value="">',
                                    '</div>',
                                    '<div class="ke-dialog-row-row">',
                                        '<label for="usercontrolSqlWhere">' + lang.sqlwhere + '：</label>',
                                        '<input type="text" id="usercontrolSqlWhere" class="ke-input-text" name="SqlWhere" value="">',
                                    '</div>',
                                '</div>',
                                '<div class="clear"></div>',
                            '</div>',
			            '</div>',
			        '</div>',
                '</div>'
            ].join(''); //绘制弹出层编辑界面

            var dialog = self.createDialog({
                name: name,
                width: 600,
                height: 365,
                title: self.lang(name),
                body: html,
                yesBtn: {//定义点击确定事件
                    name: self.lang('yes'),
                    click: function (e) {
                        if (dialog.isLoading) {
                            return;
                        }
                        self.exec('insertusercontrol',
                            usercontrol,
                            usercontrol.attr("src"),
                            {
                                columnName: ColumnName.val(),
                                columnNameurl: ColumnNameURL.val(),
                                columns: Columns.val(),
                                sid: SID.val(),
                                cssname: CssName.val(),
                                selectcount: SelectCount.val(),
                                cwidth: Width.val(),
                                cheight: Height.val(),
                                orderby: OrderBy.val(),
                                sqlwhere: SqlWhere.val()
                            }
                        );
                        self.hideDialog();
                    }
                }
            }),
            div = dialog.div,
            ColumnName = K('[name="ColumnName"]', div),
            ColumnNameURL = K('[name="ColumnNameURL"]', div),
            Columns = K('[name="Columns"]', div),
            SID = K('[name="SID"]', div),
            CssName = K('[name="CssName"]', div),
            SelectCount = K('[name="SelectCount"]', div),
            Width = K('[name="Width"]', div),
            Height = K('[name="Height"]', div),
            OrderBy = K('[name="OrderBy"]', div),
            SqlWhere = K('[name="SqlWhere"]', div),
            refreshBtn = K('.ke-refresh-btn', div);

            var usercontrol = self.plugin.getSelectedUsercontrol();
            var isSidValue = false;
            Columns.unbind("change").bind("change", function () {
                var value = Columns.val();
                if (typeOptions[value]) {
                    SID.html(typeOptions[value]);
                    if (!isSidValue && usercontrol && usercontrol.length) {
                        isSidValue = true;
                        SID.val(usercontrol.attr("SID"));
                    }
                } else {
                    _post("getColumns", { columns: value }, function (data) {
                        SID.html(data);
                        typeOptions[value] = data;
                        if (!isSidValue && usercontrol && usercontrol.length) {
                            isSidValue = true;
                            SID.val(usercontrol.attr("SID"));
                        }
                    });
                }
            });
            SID.unbind("change").bind("change", function () {
                var value = SID.val();
                if (value !== "") {
                    var op = $('option:selected', SID[0]);
                    if (ColumnName.val() == "") {
                        ColumnName.val(op.attr("title"));
                    }
                    if (ColumnNameURL.val() == "") {
                        ColumnNameURL.val(op.attr("url"));
                    }
                }
            });
            refreshBtn.unbind("click").bind("click", function () {
                var op = $('option:selected', SID[0]);
                ColumnName.val(op.attr("title"));
                ColumnNameURL.val(op.attr("url"));
            });

            if (usercontrol && usercontrol.length) {
                var obj = {};
                obj.Src = usercontrol.attr("data-ke-src");
                obj.ColumnName = usercontrol.attr("ColumnName");
                obj.ColumnNameURL = usercontrol.attr("ColumnNameURL");
                //obj.Columns = usercontrol.attr("Columns");
                //obj.SID = usercontrol.attr("SID");
                obj.CssName = usercontrol.attr("CssName");
                obj.SelectCount = usercontrol.attr("SelectCount") || 3;
                obj.Width = usercontrol.attr("Width");
                obj.Height = usercontrol.attr("Height");
                obj.OrderBy = usercontrol.attr("OrderBy");
                obj.SqlWhere = usercontrol.attr("SqlWhere");
                for (var name in obj) {
                    var value = obj[name];
                    if (value) {
                        var input = K('[name="' + name + '"]', div);
                        input.val(value);
                    }
                }
                if (usercontrol.attr("datatype")) {
                    Columns.val(usercontrol.attr("datatype"));
                    Columns.attr("readonly", "readonly").attr("disabled", "disabled");
                } else {
                    if (usercontrol.attr("Columns")) {
                        Columns.val(usercontrol.attr("Columns"));
                    }
                }
                Columns.fire("change");
                $("#usercontrolSrc").attr("src", usercontrol.attr("src"));
            }

            ColumnName[0].focus();
        },
        'delete': function () {
            self.plugin.getSelectedUsercontrol().remove();
            // [IE] 删除图片后立即点击图片按钮出错
            self.addBookmark();
        }
    };
    self.clickToolbar(name, self.plugin.usercontrol.edit);
});
