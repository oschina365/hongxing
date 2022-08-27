﻿if (typeof (IsDel) === 'undefined') {
    IsDel = true;
}
if (typeof (IsShrink) === 'undefined') {
    IsDel = false;
}
if (typeof (EditSort) === 'undefined') {
    EditSort = "";
}
loadJs("/manager/js/other/ajax.js", function () {
    var ManagerSideBar = function () { }
    ManagerSideBar.prototype = {
        constructor: ManagerSideBar,
        init: function () {
            this.Blur(); //失去焦点返回默认
            this.Edit(); //快速编辑
            this.Save(); //保存频道
            this.Add(); //添加
            this.Del(); //删除

            $(document).on("click", "span.channel_tits", function () {
                window.location = window.location.pathname + "?cid=" + $(this).parents("li").attr("oid") + "#div_1";
            });

        },
        EditBlur: function (par) {
            par = $(par);
            var num = par.find('.channel_num'),
				        belong = par.find('.channel_belong'),
				        tit = par.find('.channel_tits'),
				        len = par.find(".channel_belong").length;

            num.show();
            belong.show();
            tit.show();
            $('.channel_icn3').hide();
            par.find(".channel_wz").hide();
            par.removeClass("editing");
            if (len <= 0) {
                par.find('.channel_icn2').show();
            }
            par.find('.channel_icn1').show();
            par.find('.channel_wz').val(tit.text());
        },
        Blur: function () {	/*焦点失去  编辑状态返回默认状态*/
            var _h = this;
            $('#webChannel').on("blur", ".channel_wz", function (parm) {
                var me = this;
                var par = $(me).parents("li");
                var hd = setTimeout(function () { _h.EditBlur(par); }, 200); //让保存事件优先触发
                par.data("hd", hd);
            });
        },
        Edit: function () {	/*-网页所在频道---快捷编辑-*/
            $('#webChannel').on('click', '.channel_icn1', function (event) {
                var par = $(this).parents("li"),
			                num = par.find('.channel_num'),
			                belong = par.find('.channel_belong'),
			                tit = par.find('.channel_tits'),
			                tits = tit.text().trim().replace(/(\s*├*-*)(\S*)/ig, function ($0, $1, $2) {
			                    var v = $1;
			                    if (v) {
			                        tit.attr("pl", v);
			                    }
			                    return $2;
			                });


                par.find('.channel_wz').val(tits).show().focus();
                num.hide();
                belong.hide();
                tit.hide();
                $(this).hide();
                par.addClass("editing");
                par.find('.channel_icn2').hide();
                par.find('.channel_icn3').show();
            });
        },
        Save: function () {//保存频道
            var _h = this;
            $('#webChannel').on('click', '.channel_icn3', function (event) {

                var par = $(this).parents("li"),
			                len = par.find(".channel_belong").length,
			                cval = par.find('.channel_wz').val(),
			                num = par.find('.channel_num'),
			                belong = par.find('.channel_belong'),
			                tit = par.find('.channel_tits');

                var hd = par.data("hd");
                if (hd) {
                    clearTimeout(hd);
                }

                num.show();
                belong.show();
                var pl = par.find(".channel_tits").attr("pl") || " ";
                if (par.find(".channel_tits").text().replace(pl, "") != cval && cval != "") {
                    _PostAjax("RightColumn", {
                        pagetitle: PageTitle,
                        title: cval,
                        oid: par.attr("oid")
                    }, function (msg) {
                        var data = _Json(msg);
                        if (data.error) {
                            //保存成功
                            _alert(data.msg, true);
                            tit.text((tit.attr("pl") || "") + cval).show();
                        } else {
                            //添加失败
                            _alert(data.msg);
                            par.find('.channel_wz').val(tit.text());
                        }
                    })
                } else {
                    _h.EditBlur(par);
                }

                par.removeClass("editing");
                par.find('.channel_wz').hide();
                if (len <= 0) {
                    par.find('.channel_icn2').show();
                }
                par.find('.channel_icn1').show();
                par.find('.channel_icn3').hide();
            });
        },
        Temp: [
                    '<li>',
			        '    <input class="channel_wz f_fl" value="">',
			        '    <span class="channel_tits f_fl"></span>',
			        '    <span class="channel_num f_fl">(<em class="this_nums">0</em>)</span>',
			        '    <i class="channel_icn1"></i>',
			        (IsDel ? '    <i class="channel_icn2"></i>' : ""),
			        '    <i class="channel_icn3">保存</i>',
		            '</li>'
                ].join(''),
        Add: function () {
            var me = this;
            $("#webChannel").on("click", ".add_chel", function () {
                var par = $(this).parent(),
                            input = par.find("input.com_input"),
                            value = input.val().trim();
                if (value == "") {
                    _alert("请输入标题！");
                    return;
                }

                if (par.parent().find("input.channel_wz[value='" + value + "']").length) {
                    _alert("已存在相同名称的分类！");
                    return;
                }

                _PostAjax("RightColumn", {
                    pagetitle: PageTitle,
                    title: value
                }, function (msg) {
                    var data = _Json(msg);
                    if (data.error) {
                        //添加成功
                        _alert(data.msg, true, function () {
                            var ul = $("ul.channel_list");
                            var fli = ul.children(":first");

                            ul.append(me.Temp);
                            var li = ul.children(":last");
                            li.attr("oid", data.oid);

                            if (fli.length) {
                                var tit = fli.find('.channel_tits'),
			                            pl = tit.text().trim().replace(/(\s*├*-*)(\S*)/ig, function ($0, $1, $2) {
			                                return $1;
			                            });
                                pl = pl || "";
                                li.find(".channel_wz").val(value).end().find(".channel_tits").text(pl + value);
                            } else {
                                li.find(".channel_wz").val(value).end().find(".channel_tits").text(value);
                            }
                            input.val("");
                        });
                    } else {
                        _alert(data.msg);
                    }
                })
            })
        },
        Del: function () {
            $("#webChannel").on("click", ".channel_icn2", function () {
                var par = $(this).parents("li");

                _confirm("是否确定删除？", function () {
                    _PostAjax("RightColumn", {
                        oid: par.attr("oid"),
                        isdelete: true
                    }, function (msg) {
                        var data = _Json(msg);
                        if (data.error) {
                            _alert(data.msg, true, function () {
                                par.remove();
                            });
                        } else {
                            _alert(data.msg);
                        }
                    })
                })
            })
        }
    };
    new ManagerSideBar().init();

    //收缩
    if (IsShrink) {
        var cid = parse_url(window.location.href, "cid");
        $("#webChannel").find("li[pid='1']").each(function () {
            var me = $(this);
            var oid = me.attr("oid");
            var lis = me.siblings("li[pid='" + oid + "']").hide();
            if (lis.length > 0) {
                me.addClass("top topc").find(".channel_tits").css("color", "#f08300");
            }
            me.bind("click", function (e) {
                if (e.target.nodeName == "LI") {
                    if (me.hasClass("top")) {
                        me.removeClass("top");
                        lis.show();
                    } else {
                        me.addClass("top");
                        lis.hide();
                    }
                }
            });
        })/*.end().find("li.top:eq(0)").click()*/;
        if (cid) {
            var li = $("#webChannel").find("li[oid='" + cid + "']");
            if (li.length) {
                if (li.attr("pid") != "1") {
                    li = $("#webChannel").find("li[oid='" + li.attr("pid") + "']");
                }
                li.click();
            }
        }
    }

    //排序
    if (EditSort) {
        var btn = $("#webChannel .channel_tit").css("position", "relative").append('<span class="e_btn1 f_csp"><i class="insert_icon"></i>保 存</span>').end().find(".e_btn1").attr("style", "position: absolute;right: 5px;top: 5px;").hide();
        SetDraggableLi($("#webChannel").find("li"), "y", false, {
            init: function (lis) {
                lis.each(function () {
                    var me = $(this);
                    me.append("<div class='div_warp01 fl'></div>");
                    var div = me.find("div.div_warp01");
                    div.siblings().each(function () {
                        div.append($(this));
                    })
                    div.css("position", "relative").width(me.width()).height(me.height());
                    me.css("position", "static");
                });
            },
            proxy: function (source) {
                var li = $(source).clone(true).addClass("no_li");
                li = $(source).parent().append(li).find(".no_li");
                return li;
            },
            onBeforeDrag: function (e) {
                if (e && e.target) {
                    console.log(e.target.nodeName);
                    if (",LI,DIV,".indexOf(',' + e.target.nodeName + ',') == -1) {
                        return false;
                    }
                }
            },
            onDrop: function (event, source) {
                event.stopPropagation();

                var me = $(this);
                source = $(source);
                if (me.attr("pid") == source.attr("pid")) {
                    var oid = me.attr("oid");
                    var melis = $("#webChannel").find("li[pid='" + oid + "']");

                    oid = source.attr("oid");
                    var sourcelis = $("#webChannel").find("li[pid='" + oid + "']");

                    me.before("<span class='becovered'></span>");
                    var becovered = me.prev("span");
                    source.insertBefore(becovered);
                    sourcelis.insertBefore(becovered);
                    becovered.remove();

                    btn.show();
                }
            }
        });

        btn.bind("click", function () {
            var oids = [];
            var lis = $("#webChannel li[oid]");
            lis.each(function () {
                oids.push($(this).attr("oid"));
            })
            _PostAjax("RightColumn", {
                oids: oids.join(','),
                editsort: EditSort
            }, function (msg) {
                var data = _Json(msg);
                if (data.error) {
                    _alert(data.msg);
                } else {
                    _alert(data.msg);
                }
            })
        });
    }
});