var isWebUploader = window["IsWebUploader"] || window.top["IsWebUploader"];
if (typeof (isWebUploader) === "undefined") {
    isWebUploader = false
}
if (typeof (window.loadjs_obj) == "undefined") {
    window.loadjs_obj = {}
}
window.loadjs_obj["/manager/js/common/editor.js"] = true;
$(function () {
    loadJs("/manager/js/common/popup.js")
});

function newFunction(B, D, C) {
    if (B in window) {
        var A = window[B];
        if (A && _isFunction(A)) {
            return new A(D, C)
        }
    }
    return null
}

function _editor_(B, A) {
    return this.init(B, A)
}

_extend(_editor_, {
    options: {type: "", oid: -1, pid: -1}, dataTypes: {
        number: function (A) {
            return /^[1-9][0-9]*$/.test(A)
        }, number1: function (A) {
            return /^[1-9][0-9]*$/.test(A)
        }
    }, init: function (C, B) {
        var A = this;
        A.src = $(C);
        this.options = jQuery.extend({}, A.options, B)
    }, post: function (B) {
        var A = this;
        loadJs("/manager/js/other/ajax.js", function () {
            _PostAjax(A.options.action, B, function (C) {
                A.postCallback(C)
            })
        })
    }, postCallback: function (B) {
        var C = this;
        var A = _Json(B);
        if (A.error) {
            C.input.attr("defvalue", C.input.val());
            if (C.text) {
                C.text.text(C.input.val())
            }
            _alert("更新成功！", true)
        } else {
            _alert(A.msg);
            C.input.val(C.input.attr("defvalue"))
        }
    }
});

function input_editor(B, A) {
    return this.init(B, A)
}

_extend(input_editor, _editor_, {
    init: function (E, D) {
        var A = this;
        A.src = $(E);
        input_editor.parent.init.call(A, E, D);
        var B = A.options;
        var C = A.src.text();
        A.src.html('<i style="font-style:normal;"><i>');
        A.text = $(A.src).find("i").text(C);
        A.src.append('<input type="text" style="border:0;width:90%;height:' + A.src.height() + "px;line-height:" + A.src.height() + 'px;display:none;border:1px solid #ccc;" />');
        A.input = $(A.src).find("input").val(C).attr("defvalue", C).hide();
        A.src.bind("click", function () {
            A.input.data("editor", true);
            A.input.show().focus();
            A.text.hide()
        });
        A.input.bind("blur", function () {
            if (!A.input.data("editor")) {
                return
            }
            A.input.hide();
            var F = A.input.val();
            if (F != A.input.attr("defvalue")) {
                F = F.trim();
                if (A.formatValidation(F)) {
                    var G = {};
                    G.OID = B.oid;
                    G.value = F;
                    G.typename = B.type;
                    A.post(G)
                } else {
                    A.input.val(A.input.attr("defvalue"))
                }
            }
            A.text.show()
        })
    }, formatValidation: function (B) {
        var D = this;
        var C = D.options;
        if (C.dataType && D.dataTypes[C.dataType]) {
            var A = D.dataTypes[C.dataType];
            if (_isFunction(A)) {
                return A.call(D, B)
            }
        }
        return true
    }
});

function select_editor(B, A) {
    return this.init(B, A)
}

_extend(select_editor, _editor_, {
    init: function (E, C) {
        var A = this;
        A.src = $(E);
        select_editor.parent.init.call(A, E, C);
        var B = A.options;
        B.value = B.value || "";
        if (B.source) {
            var D = $(B.source);
            if (D.length) {
                A.src.append(D.clone());
                A.input = A.src.find("select");
                A.input.parent().show();
                if (A.input.children(":first").attr("oid")) {
                    A.input.children().each(function () {
                        $(this).attr("value", $(this).attr("oid"))
                    })
                }
                A.input.val(B.value);
                A.input.attr("defvalue", B.value);
                A.input.bind("change", function () {
                    if (A.input.val() == A.input.attr("defvalue")) {
                        return
                    }
                    _confirm("确定修改？", function () {
                        var F = {};
                        F.pid = A.input.val();
                        F.oid = B.oid;
                        F.typename = B.type;
                        A.post(F)
                    }, function () {
                        A.input.val(A.input.attr("defvalue"))
                    })
                })
            }
        }
    }
});

function delete_editor(B, A) {
    return this.init(B, A)
}

var MessageTools = {
    "product": "产品",
    "productcolumn": "产品分类",
    "project": "方案",
    "projectcolumn": "方案分类",
    "news": "资讯",
    "newscolumn": "资讯分类",
    "help": "帮助",
    "helpcolumn": "帮助分类",
    "agent": "加盟",
    "agentcolumn": "加盟分类",
    "productattributecolumn": "产品属性",
    "projectattributecolumn": "方案属性",
    "admin_systemmenu": "系统菜单",
    "marticlecolumn": "手机文章分类",
    "mproductcolumn": "手机产品分类"
};
_extend(delete_editor, _editor_, {
    init: function (D, C) {
        var A = this;
        A.src = $(D);
        select_editor.parent.init.call(A, D, C);
        var B = A.options;
        B.tips = B.tips || "确定删除";
        B.type = B.type || "-";
        A.src.bind("click", function () {
            _confirm(B.tips + MessageTools[B.type] + "？", function () {
                A.post(C)
            })
        })
    }, postCallback: function (B) {
        B = _Json(B);
        var A = this;
        if (B.error) {
            A.src.parents("tr").remove();
            _alert(B.msg, true)
        } else {
            _alert(B.msg)
        }
    }
});

function img_gallerywindow(B, A) {
    return this.init(B, A)
}

_extend(img_gallerywindow, _editor_, {
    init: function (D, C) {
        var A = this;
        A.src = $(D);
        select_editor.parent.init.call(A, D, C);
        var B = A.options;
        if (!B.init) {
            B.input = B.input ? $j(B.input) : null;
            A.src.unbind("click").bind("click", function () {
                _alert("正在加载插件，请稍后重试...")
            });
            loadJs("/manager/js/common/popup.js", function () {
                A.src.unbind("click").bind("click", function () {
                    A.Click()
                })
            });
            A.ShowImg();
            return A
        } else {
            return B.init.call(A)
        }
    }, Click: function () {
        var E = this;
        var A = E.options;
        if (!E.pop) {
            var C = E.src.attr("data-src") ? _Json(E.src.attr("data-src")) : {};
            var B = {updateCallback: E.UpdateCallback};
            B.src = !isWebUploader ? "/manage/GalleryWindow?a=a" : "/manage/Html5Gallery?a=a";
            if (A.max) {
                B.src += "&max=" + A.max
            }
            if (A.directory) {
                B.src += "&directory=" + A.directory
            }
            if (A.directory_) {
                B.src += "&directory_=" + A.directory_
            }
            if (A.columnid) {
                B.src += "&columnid=" + A.columnid
            }
            if (A.mark) {
                B.src += "&mark=" + A.mark
            }
            if (A.popcallback) {
                C.callback = A.popcallback
            }
            if (A.iframecallback) {
                B.callback = A.iframecallback
            }
            E.pop = GalleryWindow(C, B);
            E.pop.pop.data("_this", E);
            if (A.input) {
                var D = A.input;
                if (D.attr("width_")) {
                    E.pop.pop.attr("width_", D.attr("width_"));
                    E.pop.pop.attr("height_", D.attr("height_"));
                    E.pop.pop.attr("ratio", D.attr("ratio"))
                }
            }
            E.src.data("pop", E.pop.pop)
        } else {
            E.pop.pop.show()
        }
    }, ShowImg: function () {
        var F = this;
        var B = F.options;
        if (B.input) {
            var D = B.input.val();
            if (D != "") {
                var C = D.substr(D.lastIndexOf(".") + 1).toLowerCase();
                if (",ico,jpg,png,gif,bmp,jpeg,".indexOf(C) > 0) {
                    var A = null;
                    var E = null;
                    this.options.imgwarp = E = !B.imgwarp ? F.src.siblings(".insertimg_list_li") : B.imgwarp.jquery ? B.imgwarp : F.src.parent().find(B.imgwarp);
                    var A = E.show().find("img").show();
                    if (A.length) {
                        A.attr("src", D)
                    } else {
                        if (!E || !E.length) {
                            F.src.after('<div class="insertimg_list_li"><img src="' + D + '" height="' + F.src.outerHeight() + 'px" class="show_" /><i class="v_edit"></i><i class="v_del"></i><i class="v_cat"></i></div>');
                            this.options.imgwarp = E = F.src.siblings(".insertimg_list_li").show()
                        }
                        A = E.find("img").show();
                        E.find("i.v_edit").unbind("click").bind("click", function () {
                            F.src.click()
                        });
                        E.find("i.v_del").unbind("click").bind("click", function () {
                            A.hide().attr("src", "/js/grey.gif");
                            E.hide();
                            F.src.show();
                            B.input.val("").trigger("change_")
                        });
                        E.find("i.v_cat").unbind("click").bind("click", function () {
                            var J = A.attr("src");
                            if (J == "/js/grey.gif") {
                                _alert("该图片不能裁剪");
                                return
                            }
                            var H = B.input.attr("width_");
                            var I = B.input.attr("height_");
                            var G = {src: J};
                            if (H && I) {
                                G.w = H;
                                G.h = I
                            }
                            window.top.JcropImg && window.top.JcropImg(G, function (K) {
                                A.attr("src", K + (K.indexOf("?") > 0 ? "&" : "?") + "v=1");
                                B.input.val(K).trigger("change_")
                            })
                        })
                    }
                    if (A && A.length) {
                        E.show();
                        pictureEnlarge(A);
                        F.src.hide()
                    }
                }
            } else {
                F.src.show().siblings(".insertimg_list_li").hide()
            }
        }
    }, UpdateCallback: function (B) {
        var D = this;
        var G = D.pop.data("_this");
        var F = G.options;
        var I = B.data;
        var C = B.update;
        var A = 0;
        for (var E in I) {
            E = I[E];
            if (E.error == 0) {
                if (G.Item(E)) {
                    A++
                }
            }
        }
        if (A > 0 && G.warp) {
            G.warp.trigger("_change_")
        }
        if (C === "False") {
            G.pop.hide()
        } else {
            var H = D.iframe._clear_;
            if (H) {
                H();
                G.pop.hide()
            }
        }
        _alert("添加成功！", true)
    }, Item: function (B) {
        var A = this;
        if (A.options.input) {
            A.options.input.val(B.url).trigger("change_");
            A.ShowImg();
            return true
        }
        return false
    }
});

function ThumbnailImage(B, A) {
    return this.init(B, A)
}

var ThumbnailImage_Index = 0;
_extend(ThumbnailImage, img_gallerywindow, {
    init: function (E, D) {
        var A = this;
        A.src = $(E);
        ThumbnailImage.parent.init.call(A, E, D);
        var B = A.options;
        var C = B.InputID || "thumbnail";
        if (C) {
            A.textarea = $("#" + C)
        }
        B.temp = B.temp || ['<li pictureid="{pictureid}">', '<a href="javascript:;"><img src="{src}" /><i class="pro_view"></i><i class="pro_del"></i></a>', '<input type="hidden" name="' + C + '_src" value="{src}"/>', "</li>"].join("");
        B.foreach = B.foreach || function (G) {
            var F = A.options.temp;
            G.title = G.title.replace(">", "").replace("'", "”").replace('"', "”").replace(",", "，");
            F = _allReplace(F, "{src}", G.url);
            F = _allReplace(F, "{title}", G.title);
            F = F.replace("{pictureid}", G.fileID);
            return F
        };
        A.warp = $(B.warp);
        A.Change(false);
        A.SetDraggable(A.warp.find("li"));
        loadCss("/manager/skins/fancybox/jquery.fancybox.css", window.top.document);
        if (typeof (isLoadShowImg) == "undefined") {
            isLoadShowImg = false
        }
        loadJs("/manager/js/easyui/jquery.fancybox.js", function () {
            isLoadShowImg = true
        })
    }, draggableClass: "draggable_", Change: function (A) {
        var F = this;
        if (typeof (A) == "undefined") {
            A = true
        }
        if (F.textarea && F.textarea.length && F.warp) {
            if (A) {
                var C = "";
                F.warp.find("li").not(".no_li").each(function () {
                    C += $(this).find("img").attr("src") + ","
                });
                F.textarea.val(C.trim(",").replace(/,/ig, "\r\n"))
            } else {
                if (F.warp.find("li").length == 0) {
                    var B = F.textarea.val().replace(/\r/ig, ",").replace(/\n/ig, ",").replace(/,[2]/ig, ",").split(",");
                    if (B && B.length) {
                        var E = "";
                        for (var D = 0; D < B.length; D++) {
                            if (B[D]) {
                                E += F.options.foreach.call(F, {url: B[D], title: "", fileID: ""})
                            }
                        }
                        if (E) {
                            F.warp.append(E);
                            F.SetDraggable(F.warp.find("li").not("." + F.draggableClass))
                        }
                    }
                }
            }
        }
    }, SetDraggable: function (A) {
        A = $(A);
        if (!A.length) {
            return
        }
        var B = this;
        Timeout(function () {
            loadJs("/manager/js/easyui/jquery.easyui.min.js", function () {
                var C = A.eq(0).width();
                var D = A.parent().parent().width();
                A.addClass(B.draggableClass).draggable({
                    proxy: function (F) {
                        var E = $(F).clone().addClass("no_li");
                        E = $(F).parent().append(E).find(".no_li");
                        return E
                    }, onBeforeDrag: function (E) {
                        if (E && E.target) {
                            var F = "|I|INPUT|TEXTAREA|";
                            target = $(E.target);
                            if (target.length > 0 && F.indexOf(target[0].tagName) > 0) {
                                return false
                            }
                        }
                    }, onStopDrag: function () {
                        $(this).draggable("options").cursor = "move"
                    }, revert: true, axis: "h", cursor: "pointer"
                }).find("i.pro_view").bind("click", function () {
                    ShowImg_($(this).parent().find("img"))
                }).end().find("i.pro_del").bind("click", function () {
                    $(this).parents("li").remove();
                    B.Change()
                });
                A.droppable({
                    onDrop: function (H, G) {
                        event.stopPropagation();
                        var F = $(this);
                        G = $(G);
                        F.after("<span class='becovered'></span>");
                        G.after("<span class='covered'></span>");
                        var E = F.next("span");
                        var I = G.next("span");
                        G.insertBefore(E);
                        E.remove();
                        F.insertBefore(I);
                        I.remove();
                        B.Change()
                    }
                })
            })
        })
    }, ShowImg: function () {
    }, Item: function (D) {
        var A = this;
        var C = D.fileID;
        if (!A.warp.children("[pictureid='" + C + "']").length) {
            var B = A.options.foreach.call(A, D);
            A.warp.append(B);
            A.Change();
            A.SetDraggable(A.warp.find("li").not("." + A.draggableClass));
            return true
        }
        return false
    }
});

function AddImg(B, A) {
    return this.init(B, A)
}

_extend(AddImg, img_gallerywindow, {
    init: function (C, B) {
        var A = this;
        A.src = $(C);
        B.iframecallback = function () {
            var D = this;
            if (D.iframe) {
                $(".tab_ul li:last", D.iframe.document.body).remove();
                D.options.show = D.options._show;
                D.options.show.call(D)
            }
        };
        B.popcallback = function () {
            var D = this;
            D.options._show = D.options.show;
            D.options.show = null
        };
        AddImg.parent.init.call(A, C, B)
    }, ShowImg: function () {
    }, Item: function (A) {
        return true
    }
});

function kindeditor_image(B, A) {
    return this.init(B, A || {})
}

_extend(kindeditor_image, img_gallerywindow, {
    init: function (D, C) {
        var A = this;
        C.init = function () {
            var E = this;
            if (!E.pop) {
                loadJs("/manager/js/common/popup.js", function () {
                    var G = E.options;
                    var F = {updateCallback: E.UpdateCallback};
                    F.src = !isWebUploader ? "GalleryWindow.aspx" : "Html5Gallery.aspx";
                    if (G.max) {
                        F.src += "?max=" + G.max
                    }
                    if (G.directory) {
                        F.src += (F.src.indexOf("?") > 0 ? "&" : "?") + "directory=" + G.directory
                    }
                    E.pop = GalleryWindow({}, F);
                    E.pop.pop.data("_this", E)
                })
            }
        };
        kindeditor_image.parent.init.call(A, D, C);
        var B = A.options
    }, ShowImg: function () {
    }, Item: function (A) {
        if (this.options.Item) {
            return this.options.Item.call(this, A)
        }
        return false
    }
});

function _fileswindow(B, A) {
    return this.init(B, A)
}

_extend(_fileswindow, _editor_, {
    init: function (D, C) {
        var A = this;
        A.src = $(D);
        _fileswindow.parent.init.call(A, D, C);
        var B = A.options;
        if (!B.init) {
            B.input = B.input ? $j(B.input) : null;
            A.src.unbind("click").bind("click", function () {
                _alert("正在加载插件，请稍后重试...")
            });
            loadJs("/manager/js/common/popup.js", function () {
                A.src.unbind("click").bind("click", function () {
                    if (!A.pop) {
                        var F = A.src.attr("data-src") ? _Json(A.src.attr("data-src")) : {};
                        var E = {updateCallback: A.UpdateCallback};
                        E.src = !isWebUploader ? "FilesWindow.aspx" : "Html5Files.aspx";
                        if (B.max) {
                            E.src += "?max=" + B.max
                        }
                        if (B.directory) {
                            E.src += (E.src.indexOf("?") > 0 ? "&" : "?") + "directory=" + B.directory
                        }
                        if (B.popcallback) {
                            F.callback = B.popcallback
                        }
                        if (B.iframecallback) {
                            E.callback = B.iframecallback
                        }
                        A.pop = FilesWindow(F, E);
                        A.pop.pop.data("_this", A);
                        A.pop.pop.show()
                    } else {
                        A.pop.pop.show()
                    }
                });
                return A
            });
            A.ShowImg()
        } else {
            return B.init.call(A)
        }
    }, ShowImg: function () {
    }, UpdateCallback: function (B) {
        var D = this;
        var H = D.pop.data("_this");
        var F = H.options;
        var J = B.data;
        var C = B.update;
        var A = 0;
        for (var E in J) {
            E = J[E];
            if (E.error == 0) {
                if (H.Item(E)) {
                    A++
                }
            }
        }
        if (A > 0 && H.warp) {
            H.warp.trigger("_change_")
        }
        var I = D.iframe._clear_;
        try {
            if (I) {
                I()
            }
        } catch (G) {
            alert(G.Message)
        }
        H.pop.hide();
        _alert("添加成功！", true)
    }, Item: function (B) {
        var A = this;
        if (A.options.input) {
            A.options.input.val(B.url);
            A.ShowImg();
            return true
        }
        return false
    }
});

function SingleAttachment(B, A) {
    return this.init(B, A || {})
}

_extend(SingleAttachment, _fileswindow, {
    init: function (C, B) {
        var A = this;
        A.src = $(C);
        B.max = 1;
        SingleAttachment.parent.init.call(A, C, B)
    }, ShowImg: function () {
        var B = this;
        var A = "";
        if (B.options.input && (A = $(B.options.input).val())) {
            B.src = $(B.src);
            if (B.src.next("a.a_upd").length) {
                B.src.next("a.a_upd").attr("href", A)
            } else {
                B.src.after('<a class="a_upd" target="_blank" href="' + A + '" style="display: inline-block; padding: 0px 10px; border: 1px solid #dcdcdc;margin-left: 10px;line-height:' + B.src.height() + 'px">立即下载</a>')
            }
        }
    }, Item: function (B) {
        var A = this;
        if (A.options.input) {
            A.options.input.val(B.url);
            A.ShowImg();
            return true
        }
        return true
    }
});

function AddFiles(B, A) {
    return this.init(B, A)
}

_extend(AddFiles, _fileswindow, {
    init: function (C, B) {
        var A = this;
        A.src = $(C);
        B.iframecallback = function () {
            var D = this;
            if (D.iframe) {
                $(".tab_ul li:last", D.iframe.document.body).remove();
                D.options.show = D.options._show;
                D.pop.show().css("visibility", "visible");
                D.options.show.call(D)
            }
        };
        B.popcallback = function () {
            var D = this;
            D.options._show = D.options.show;
            D.options.show = function () {
                var E = this;
                E.pop.show().css("visibility", "hidden")
            }
        };
        AddFiles.parent.init.call(A, C, B)
    }, ShowImg: function () {
    }, Item: function (A) {
        return true
    }
});

function kindeditor_files(B, A) {
    return this.init(B, A || {})
}

_extend(kindeditor_files, _fileswindow, {
    init: function (D, C) {
        var A = this;
        C.init = function () {
            var E = this;
            if (!E.pop) {
                loadJs("/manager/js/common/popup.js", function () {
                    var G = E.options;
                    var F = {updateCallback: E.UpdateCallback};
                    F.src = !isWebUploader ? "FilesWindow.aspx" : "Html5Files.aspx";
                    if (G.max) {
                        F.src += "?max=" + G.max
                    }
                    if (G.directory) {
                        F.src += (F.src.indexOf("?") > 0 ? "&" : "?") + "directory=" + G.directory
                    }
                    if (G.types) {
                        F.src += (F.src.indexOf("?") > 0 ? "&" : "?") + "types=" + encodeURIComponent(G.types)
                    }
                    E.pop = FilesWindow({}, F);
                    E.pop.pop.data("_this", E)
                })
            }
        };
        kindeditor_files.parent.init.call(A, D, C);
        var B = A.options
    }, ShowImg: function () {
    }, Item: function (A) {
        if (this.options.Item) {
            return this.options.Item.call(this, A)
        }
        return false
    }
});

function kindeditor_selecttemps(B, A) {
    return this.init(B, A || {})
}

_extend(kindeditor_selecttemps, _editor_, {
    init: function (D, C) {
        var A = this;
        kindeditor_selecttemps.parent.init.call(A, D, C);
        var B = A.options;
        if (!A.pop) {
            loadJs("/manager/js/common/popup.js", function () {
                var F = A.options;
                var E = A.iframes || {};
                E.updateCallback = A.UpdateCallback;
                E.src = E.src || "/manage/SearchTemplates";
                if (F.max) {
                    E.src += "?max=" + F.max
                }
                if (F.types) {
                    E.src += (E.src.indexOf("?") > 0 ? "&" : "?") + "types=" + F.types
                }
                if (F.directory) {
                    E.src += (E.src.indexOf("?") > 0 ? "&" : "?") + "directory=" + F.directory
                }
                A.pop = SearchTemplates(F, E);
                A.pop.pop.data("_this", A)
            })
        }
    }, UpdateCallback: function (B) {
        var A = this;
        var G = A.pop.data("_this");
        var D = G.options;
        var E = B.data;
        var C = B.update;
        var F = 0;
        if (G.Item(E)) {
            F++
        }
        if (F > 0 && G.warp) {
            G.warp.trigger("_change_")
        }
        if (!C) {
            G.pop.hide()
        }
    }, ShowImg: function () {
    }, Item: function (A) {
        if (this.options.Item) {
            return this.options.Item.call(this, A)
        }
        return false
    }
});

function WXNews(B, A) {
    return this.init(B, A || {})
}

_extend(WXNews, {
    init: function (C, B) {
        this.options = jQuery.extend({}, B);
        var A = this;
        if (!A.pop) {
            loadJs("/manager/js/common/popup.js", function () {
                var E = A.options;
                var D = A.iframes || E.iframes || {};
                D.updateCallback = A.UpdateCallback || E.UpdateCallback;
                D.src = D.src || "WXNews_lite.aspx?qstype=1";
                A.pop = NewPopUp(E, D);
                A.pop.pop.data("_this", A);
                A.pop.hide()
            })
        }
    }, show: function () {
        var A = this;
        if (A.pop) {
            A.pop.pop.show()
        }
    }, hide: function () {
        var A = this;
        if (A.pop) {
            A.pop.hide()
        }
    }
});