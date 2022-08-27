!function (window, undefined) {
    function isEmptyObject(a) {
        for (var b in a) return !1;
        return !0
    }

    function _isArray(a) {
        return a ? "[object Array]" === Object.prototype.toString.call(a) : !1
    }

    function _isFunction(a) {
        return a ? "[object Function]" === Object.prototype.toString.call(a) : !1
    }

    function _inArray(a, b) {
        for (var c = 0, d = b.length; d > c; c++) if (a === b[c]) return c;
        return -1
    }

    function _each(a, b) {
        var c, d, e;
        if (_isArray(a)) for (c = 0, d = a.length; d > c && b.call(a[c], c, a[c]) !== !1; c++) ; else for (e in a) if (a.hasOwnProperty(e) && b.call(a[e], e, a[e]) === !1) break
    }

    function _trim(a) {
        return a.replace(/(?:^[ \t\n\r]+)|(?:[ \t\n\r]+$)/g, "")
    }

    function _inString(a, b, c) {
        c = c === undefined ? "," : c;
        return (c + b + c).indexOf(c + a + c) >= 0
    }

    function _addUnit(a, b) {
        b = b || "px";
        return a && /^-?\d+(?:\.\d+)?$/.test(a) ? a + b : a
    }

    function _removeUnit(a) {
        var b;
        return a && (b = /(\d+)/.exec(a)) ? parseInt(b[1], 10) : 0
    }

    function _escape(a) {
        return a.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;")
    }

    function _unescape(a) {
        return a.replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&quot;/g, '"').replace(/&amp;/g, "&")
    }

    function _toCamel(a) {
        var b = a.split("-");
        a = "";
        _each(b, function (b, c) {
            a += b > 0 ? c.charAt(0).toUpperCase() + c.substr(1) : c
        });
        return a
    }

    function _toHex(a) {
        function b(a) {
            var b = parseInt(a, 10).toString(16).toUpperCase();
            return b.length > 1 ? b : "0" + b
        }

        return a.replace(/rgb\s*\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/gi, function (a, c, d, e) {
            return "#" + b(c) + b(d) + b(e)
        })
    }

    function _toMap(a, b) {
        b = b === undefined ? "," : b;
        var e, c = {}, d = _isArray(a) ? a : a.split(b);
        _each(d, function (a, b) {
            if (e = /^(\d+)\.\.(\d+)$/.exec(b)) for (var d = parseInt(e[1], 10); d <= parseInt(e[2], 10); d++) c[d.toString()] = !0; else c[b] = !0
        });
        return c
    }

    function _toArray(a, b) {
        return Array.prototype.slice.call(a, b || 0)
    }

    function _undef(a, b) {
        return a === undefined ? b : a
    }

    function _invalidUrl(a) {
        return !a || /[<>"]/.test(a)
    }

    function _addParam(a, b) {
        return a.indexOf("?") >= 0 ? a + "&" + b : a + "?" + b
    }

    function _extend(a, b, c) {
        var d, e;
        if (!c) {
            c = b;
            b = null
        }
        if (b) {
            e = function () {
            };
            e.prototype = b.prototype;
            d = new e;
            _each(c, function (a, b) {
                d[a] = b
            })
        } else d = c;
        d.constructor = a;
        a.prototype = d;
        a.parent = b ? b.prototype : null
    }

    function _json(text) {
        var match, cx;
        (match = /\{[\s\S]*\}|\[[\s\S]*\]/.exec(text)) && (text = match[0]);
        cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
        cx.lastIndex = 0;
        cx.test(text) && (text = text.replace(cx, function (a) {
            return "\\u" + ("0000" + a.charCodeAt(0).toString(16)).slice(-4)
        }));
        if (/^[\],:{}\s]*$/.test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, "@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, "]").replace(/(?:^|:|,)(?:\s*\[)+/g, ""))) return eval("(" + text + ")");
        throw "JSON parse error"
    }

    function _getBasePath() {
        var b, c, d, a = document.getElementsByTagName("script");
        for (c = 0, d = a.length; d > c; c++) {
            b = a[c].src || "";
            if (/kindeditor[\w\-\.]*\.js/.test(b)) return b.substring(0, b.lastIndexOf("/") + 1)
        }
        return ""
    }

    function _getRootPath() {
        return window.location.origin + ""
    }

    function _bindEvent(a, b, c) {
        a.addEventListener ? a.addEventListener(b, c, _useCapture) : a.attachEvent && a.attachEvent("on" + b, c)
    }

    function _SetElementStyle(a, b, c) {
        var d, e, f, g, h, i;
        b = b || a.attr();
        c = c || {};
        if (b = b["style"]) {
            d = {};
            e = a.name || "";
            b.replace(/((([^\:]+):([^;]+));?)/g, function (a, b, c, e, f) {
                d[e] = f;
                return a
            });
            f = isEmptyObject(d);
            if (!f) {
                g = "line-height";
                d[g] && d[g].length > 4 && delete d[g];
                g = "text-indent";
                if (_INLINE_TAG_MAP[e]) {
                    delete d[g];
                    g = "white-space";
                    delete d[g]
                }
                for (h in c) {
                    i = d[h];
                    i && 1 == c[h].call(null, i) && delete d[h]
                }
                isEmptyObject(d) ? a.attr("style", null) : a.css(d)
            }
        }
    }

    function _GetElementAttrCount(a, b, c, d) {
        var f, e = null;
        if (a && (e = a.attr())) {
            _SetElementStyle(a, e, c);
            f = isEmptyObject(a.attr()) ? 0 : 1;
            if (0 == f) {
                d = d || "div,p";
                f = K(d, a).length
            }
            return f
        }
        return 0
    }

    function _unbindEvent(a, b, c) {
        a.removeEventListener ? a.removeEventListener(b, c, _useCapture) : a.detachEvent && a.detachEvent("on" + b, c)
    }

    function KEvent(a, b) {
        this.init(a, b)
    }

    function _getId(a) {
        return a[_eventExpendo] || null
    }

    function _setId(a) {
        a[_eventExpendo] = ++_eventId;
        return _eventId
    }

    function _removeId(a) {
        try {
            delete a[_eventExpendo]
        } catch (b) {
            a.removeAttribute && a.removeAttribute(_eventExpendo)
        }
    }

    function _bind(a, b, c) {
        var d, e;
        if (b.indexOf(",") >= 0) _each(b.split(","), function () {
            _bind(a, this, c)
        }); else {
            d = _getId(a);
            d || (d = _setId(a));
            _eventData[d] === undefined && (_eventData[d] = {});
            e = _eventData[d][b];
            if (e && e.length > 0) _unbindEvent(a, b, e[0]); else {
                _eventData[d][b] = [];
                _eventData[d].el = a
            }
            e = _eventData[d][b];
            0 === e.length && (e[0] = function (b) {
                var c = b ? new KEvent(a, b) : undefined;
                _each(e, function (b, d) {
                    b > 0 && d && d.call(a, c)
                })
            });
            _inArray(c, e) < 0 && e.push(c);
            _bindEvent(a, b, e[0])
        }
    }

    function _unbind(a, b, c) {
        var d, e, f;
        if (b && b.indexOf(",") >= 0) _each(b.split(","), function () {
            _unbind(a, this, c)
        }); else {
            d = _getId(a);
            if (d) if (b !== undefined) {
                if (_eventData[d]) {
                    e = _eventData[d][b];
                    if (e && e.length > 0) {
                        if (c === undefined) {
                            _unbindEvent(a, b, e[0]);
                            delete _eventData[d][b]
                        } else {
                            _each(e, function (a, b) {
                                a > 0 && b === c && e.splice(a, 1)
                            });
                            if (1 == e.length) {
                                _unbindEvent(a, b, e[0]);
                                delete _eventData[d][b]
                            }
                        }
                        f = 0;
                        _each(_eventData[d], function () {
                            f++
                        });
                        if (2 > f) {
                            delete _eventData[d];
                            _removeId(a)
                        }
                    }
                }
            } else if (d in _eventData) {
                _each(_eventData[d], function (b, c) {
                    "el" != b && c.length > 0 && _unbindEvent(a, b, c[0])
                });
                delete _eventData[d];
                _removeId(a)
            }
        }
    }

    function _fire(a, b) {
        var c, d;
        if (b.indexOf(",") >= 0) _each(b.split(","), function () {
            _fire(a, this)
        }); else {
            c = _getId(a);
            if (c) {
                d = _eventData[c][b];
                _eventData[c] && d && d.length > 0 && d[0]()
            }
        }
    }

    function _ctrl(a, b, c) {
        b = /^\d{2,}$/.test(b) ? b : b.toUpperCase().charCodeAt(0);
        _bind(a, "keydown", function (d) {
            if (d.ctrlKey && d.which == b && !d.shiftKey && !d.altKey) {
                c.call(a);
                d.stop()
            }
        })
    }

    function _ready(a) {
        function c() {
            if (!b) {
                b = !0;
                a(KindEditor);
                _readyFinished = !0
            }
        }

        function d() {
            if (!b) {
                try {
                    document.documentElement.doScroll("left")
                } catch (a) {
                    setTimeout(d, 100);
                    return
                }
                c()
            }
        }

        function e() {
            "complete" === document.readyState && c()
        }

        var b, f;
        if (_readyFinished) a(KindEditor); else {
            b = !1;
            if (document.addEventListener) _bind(document, "DOMContentLoaded", c); else if (document.attachEvent) {
                _bind(document, "readystatechange", e);
                f = !1;
                try {
                    f = null == window.frameElement
                } catch (g) {
                }
                document.documentElement.doScroll && f && d()
            }
            _bind(window, "load", c)
        }
    }

    function _getCssList(a) {
        for (var d, e, f, b = {}, c = /\s*([\w\-]+)\s*:([^;]*)(;|$)/g; d = c.exec(a);) {
            e = _trim(d[1].toLowerCase()), f = _trim(_toHex(d[2]));
            b[e] = f
        }
        return b
    }

    function _getAttrList(a) {
        for (var d, e, f, b = {}, c = /\s+(?:([\w\-:]+)|(?:([\w\-:]+)=([^\s"'<>]+))|(?:([\w\-:"]+)="([^"]*)")|(?:([\w\-:"]+)='([^']*)'))(?=(?:\s|\/|>)+)/g; d = c.exec(a);) {
            e = (d[1] || d[2] || d[4] || d[6]).toLowerCase(), f = (d[2] ? d[3] : d[4] ? d[5] : d[7]) || "";
            b[e] = f
        }
        return b
    }

    function _addClassToTag(a, b) {
        a = /\s+class\s*=/.test(a) ? a.replace(/(\s+class=["']?)([^"']*)(["']?[\s>])/, function (a, c, d, e) {
            return (" " + d + " ").indexOf(" " + b + " ") < 0 ? "" === d ? c + b + e : c + d + " " + b + e : a
        }) : a.substr(0, a.length - 1) + ' class="' + b + '">';
        return a
    }

    function _formatCss(a) {
        var b = "";
        _each(_getCssList(a), function (a, c) {
            b += a + ":" + c + ";"
        });
        return b
    }

    function _formatUrl(a, b, c, d) {
        function g(a) {
            var d, e, f, b = a.split("/"), c = [];
            for (d = 0, e = b.length; e > d; d++) {
                f = b[d];
                ".." == f ? c.length > 0 && c.pop() : "" !== f && "." != f && c.push(f)
            }
            return "/" + c.join("/")
        }

        function h(b, c) {
            var e, g, i;
            if (a.substr(0, b.length) === b) {
                e = [];
                for (g = 0; c > g; g++) e.push("..");
                i = ".";
                e.length > 0 && (i += "/" + e.join("/"));
                "/" == d && (i += "/");
                return i + a.substr(b.length)
            }
            return (f = /^(.*)\//.exec(b)) ? h(f[1], ++c) : void 0
        }

        var e, f;
        b = _undef(b, "").toLowerCase();
        "data:" != a.substr(0, 5) && (a = a.replace(/([^:])\/\//g, "$1/"));
        if (_inArray(b, ["absolute", "relative", "domain"]) < 0) return a;
        c = c || location.protocol + "//" + location.host;
        if (d === undefined) {
            e = location.pathname.match(/^(\/.*)\//);
            d = e ? e[1] : ""
        }
        if (f = /^(\w+:\/\/[^\/]*)/.exec(a)) {
            if (f[1] !== c) return a
        } else if (/^\w+:/.test(a)) return a;
        /^\//.test(a) ? a = c + g(a.substr(1)) : /^\w+:\/\//.test(a) || (a = c + g(d + "/" + a));
        "relative" === b ? a = h(c + d, 0).substr(2) : "absolute" === b && a.substr(0, c.length) === c && (a = a.substr(c.length));
        return a
    }

    function _formatHtml(a, b, c, d, e) {
        var f, g, h, i, j, k, l;
        null == a && (a = "");
        a = a.replace(/textarea__/gi, "textarea");
        c = c || "";
        d = _undef(d, !1);
        e = _undef(e, "	");
        f = "xx-small,x-small,small,medium,large,x-large,xx-large".split(",");
        g = {};
        h = 0;
        a = a.replace(/(<script\s[^>]*>)([\s\S]*?)(<\/script>)/gi, function (a, b, c, d) {
            var f, e = c + "";
            if (e) {
                f = "{$script__" + h + "$}";
                g[f] = e;
                h++;
                return b + f + d
            }
            return a
        });
        a = a.replace(/(<(?:pre|pre\s[^>]*)>)([\s\S]*?)(<\/pre>)/gi, function (a, b, c, d) {
            return b + c.replace(/<(?:br|br\s[^>]*)>/gi, "\n") + d
        });
        a = a.replace(/<(?:br|br\s[^>]*)\s*\/?>\s*<\/p>/gi, "</p>");
        a = a.replace(/(<(?:p|p\s[^>]*)>)\s*(<\/p>)/gi, "$1<br />$2");
        a = a.replace(/(<(?:p|p\s[^>]*)>)\s*(<\/p>)/gi, "");
        a = a.replace(/\u200B/g, "");
        a = a.replace(/\u00A9/g, "&copy;");
        a = a.replace(/\u00AE/g, "&reg;");
        a = a.replace(/<[^>]+/g, function (a) {
            return a.replace(/\s+/g, " ")
        });
        i = {};
        if (b) {
            _each(b, function (a, b) {
                var d, e, c = a.split(",");
                for (d = 0, e = c.length; e > d; d++) i[c[d]] = _toMap(b)
            });
            i.script || (a = a.replace(/(<(?:script|script\s[^>]*)>)([\s\S]*?)(<\/script>)/gi, ""));
            i.style || (a = a.replace(/(<(?:style|style\s[^>]*)>)([\s\S]*?)(<\/style>)/gi, ""))
        }
        j = /(\s*)<(\/)?([\w\-:]+)((?:\s+|(?:\s+[\w\-:]+)|(?:\s+[\w\-:]+=[^\s"'<>]+)|(?:\s+[\w\-:"]+="[^"]*")|(?:\s+[\w\-:"]+='[^']*'))*)(\/)?>(\s*)/g;
        k = [];
        a = a.replace(j, function (a, g, h, j, l, m, n) {
            var v, w, x, y, z, o = a, p = g || "", q = h || "", r = j.toLowerCase(), s = l || "", t = m ? " " + m : "",
                u = n || "";
            if (b && !i[r]) return "";
            "" === t && _SINGLE_TAG_MAP[r] && (t = " /");
            if (_INLINE_TAG_MAP[r]) {
                p && (p = " ");
                u && (u = " ")
            }
            _PRE_TAG_MAP[r] && (q ? u = "\n" : p = "\n");
            d && "br" == r && (u = "\n");
            if (_BLOCK_TAG_MAP[r] && !_PRE_TAG_MAP[r]) if (d) {
                q && k.length > 0 && k[k.length - 1] === r ? k.pop() : k.push(r);
                p = "\n";
                u = "\n";
                for (v = 0, w = q ? k.length : k.length - 1; w > v; v++) {
                    p += e;
                    q || (u += e)
                }
                t ? k.pop() : q || (u += e)
            } else p = u = "";
            if (b && "" !== s) {
                x = _getAttrList(o);
                if ("font" === r) {
                    y = {}, z = "";
                    _each(x, function (a, b) {
                        if ("color" === a) {
                            y.color = b;
                            delete x[a]
                        }
                        if ("size" === a) {
                            y["font-size"] = f[parseInt(b, 10) - 1] || "";
                            delete x[a]
                        }
                        if ("face" === a) {
                            y["font-family"] = b;
                            delete x[a]
                        }
                        "style" === a && (z = b)
                    });
                    z && !/;$/.test(z) && (z += ";");
                    _each(y, function (a, b) {
                        if ("" !== b) {
                            /\s/.test(b) && (b = "'" + b + "'");
                            z += a + ":" + b + ";"
                        }
                    });
                    x.style = z
                }
                _each(x, function (a, d) {
                    var e, f;
                    _FILL_ATTR_MAP[a] && (x[a] = a);
                    _NO_REPLACE_ATTR_MAP[a] && (x[a] = d);
                    _inArray(a, ["src", "href"]) >= 0 && (x[a] = _formatUrl(d, c));
                    (b && "style" !== a && !i[r]["*"] && !i[r][a] || "body" === r && "contenteditable" === a || /^kindeditor_\d+$/.test(a)) && delete x[a];
                    if ("style" === a && "" !== d) {
                        e = _getCssList(d);
                        _each(e, function (a) {
                            !b || i[r].style || i[r]["." + a] || delete e[a]
                        });
                        f = "";
                        _each(e, function (a, b) {
                            f += a + ":" + b + ";"
                        });
                        x.style = f
                    }
                });
                s = "";
                _each(x, function (a, b) {
                    if ("style" !== a || "" !== b) if (_NO_REPLACE_ATTR_MAP[a]) if (d) {
                        var c = b.indexOf("|") > -1 || b.indexOf("'") > -1 ? '"' : "'";
                        s += " " + a + "=" + c + b.replace(/\|/g, "'").replace(/&quot;/g, '"') + c
                    } else {
                        b = b.replace(/'/g, "|").replace(/"/g, "&quot;");
                        s += " " + a + '="' + b + '"'
                    } else {
                        b = b.replace(/"/g, "&quot;");
                        s += " " + a + '="' + b + '"'
                    }
                })
            }
            "font" === r && (r = "span");
            return p + "<" + q + r + s + t + ">" + u
        });
        a = a.replace(/(<(?:pre|pre\s[^>]*)>)([\s\S]*?)(<\/pre>)/gi, function (a, b, c, d) {
            return b + c.replace(/\n/g, '<span id="__kindeditor_pre_newline__">\n') + d
        });
        a = a.replace(/\n\s*\n/g, "\n");
        a = a.replace(/<span id="__kindeditor_pre_newline__">\n/g, "\n");
        for (l in g) a = a.replace(l, g[l]);
        return _trim(a)
    }

    function _clearMsWord(a, b) {
        a = a.replace(/<meta[\s\S]*?>/gi, "").replace(/<![\s\S]*?>/gi, "").replace(/<style[^>]*>[\s\S]*?<\/style>/gi, "").replace(/<script[^>]*>[\s\S]*?<\/script>/gi, "").replace(/<w:[^>]+>[\s\S]*?<\/w:[^>]+>/gi, "").replace(/<o:[^>]+>[\s\S]*?<\/o:[^>]+>/gi, "").replace(/<xml>[\s\S]*?<\/xml>/gi, "").replace(/<(?:table|td)[^>]*>/gi, function (a) {
            return a.replace(/border-bottom:([#\w\s]+)/gi, "border:$1")
        });
        return _formatHtml(a, b)
    }

    function _mediaType(a) {
        return /\.(rm|rmvb)(\?|$)/i.test(a) ? "audio/x-pn-realaudio-plugin" : /\.(swf|flv)(\?|$)/i.test(a) ? /\.(flv)(\?|$)/i.test(a) ? "flv" : "application/x-shockwave-flash" : /\.(mp3)(\?|$)/i.test(a) ? "mp3" : /\.(mp4)(\?|$)/i.test(a) ? "mp4" : /\.(ogg)(\?|$)/i.test(a) ? "ogg" : "video/x-ms-asf-plugin"
    }

    function _mediaClass(a) {
        return /realaudio/i.test(a) ? "ke-rm" : /flash/i.test(a) ? "ke-flash" : "ke-media"
    }

    function _mediaAttrs(a) {
        return _getAttrList(unescape(a))
    }

    function _mediaEmbed(a) {
        var c, b = "";
        a.type || (a.type = _mediaType(a.src));
        if ("|mp3|mp4|ogg|flv|".indexOf(a.type) > -1) {
            if ("mp3" == a.type) {
                b = "<audio ";
                a.controls || (a.controls = "controls");
                _each(a, function (a, c) {
                    ("|width|height|".indexOf("|" + a + "|") < 0 || c) && (b += a + '="' + c + '" ')
                });
                b += ">您的浏览器不支持mp3</audio>"
            }
            if ("mp4" == a.type || "ogg" == a.type) {
                b = '<video controls="controls" ';
                _each(a, function (a, c) {
                    ("|width|height|".indexOf("|" + a + "|") < 0 || c) && "src" != a && (b += a + '="' + c + '" ')
                });
                b += ">";
                b += '<source src="' + a.src + '" type="video/' + a.type + '" />';
                b += "您的浏览器不支持video标签</video>"
            }
            if ("flv" == a.type) {
                c = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="{width}" height="{height}">    <param name="movie" value="/Images/flvplayer.swf" />    <param name="quality" value="high" />    <param name="wmode" value="transparent">    <param name="allowFullScreen" value="true" />    <param name="FlashVars" value="vcastr_file={src}&BufferTime=3" />    <embed src="/Images/flvplayer.swf" allowfullscreen="true" flashvars="vcastr_file={src}" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="{width}" height="{height}">        <param name="wmode" value="transparent">    </embed></object>';
                return c.replace(/{width}/gi, a.width || "400").replace(/{height}/gi, a.height || "200").replace(/{src}/gi, a.src || "")
            }
        } else {
            b = "<embed ";
            _each(a, function (a, c) {
                b += a + '="' + c + '" '
            });
            b += "/>"
        }
        return b
    }

    function _mediaImg(a, b) {
        var h, c = b.width, d = b.height, e = b.type || _mediaType(b.src), f = _mediaEmbed(b), g = "";
        if ("|mp3|mp4|ogg|flv|".indexOf(b.type) > -1) return _mediaEmbed(b);
        /\D/.test(c) ? g += "width:" + c + ";" : c > 0 && (g += "width:" + c + "px;");
        /\D/.test(d) ? g += "height:" + d + ";" : d > 0 && (g += "height:" + d + "px;");
        h = '<img class="' + _mediaClass(e) + '" src="' + a + '" ';
        "" !== g && (h += 'style="' + g + '" ');
        h += 'data-ke-tag="' + escape(f) + '" alt="" />';
        return h
    }

    function _tmpl(a, b) {
        var c = new Function("obj", "var p=[],print=function(){p.push.apply(p,arguments);};with(obj){p.push('" + a.replace(/[\r\t\n]/g, " ").split("<%").join("	").replace(/((^|%>)[^\t]*)'/g, "$1\r").replace(/\t=(.*?)%>/g, "',$1,'").split("	").join("');").split("%>").join("p.push('").split("\r").join("\\'") + "');}return p.join('');");
        return b ? c(b) : c
    }

    function _contains(a, b) {
        if (9 == a.nodeType && 9 != b.nodeType) return !0;
        for (; b = b.parentNode;) if (b == a) return !0;
        return !1
    }

    function _getAttr(a, b) {
        var c, d, e;
        b = b.toLowerCase();
        c = null;
        if (_GET_SET_ATTRIBUTE || "script" == a.nodeName.toLowerCase()) try {
            c = a.getAttribute(b, 2)
        } catch (f) {
            c = a.getAttribute(b, 1)
        } else {
            d = a.ownerDocument.createElement("div");
            d.appendChild(a.cloneNode(!1));
            e = _getAttrList(_unescape(d.innerHTML));
            b in e && (c = e[b])
        }
        "style" === b && null !== c && (c = _formatCss(c));
        return c
    }

    function _queryAll(a, b) {
        function e(a) {
            return "string" != typeof a ? a : a.replace(/([^\w\-])/g, "\\$1")
        }

        function f(a) {
            return a.replace(/\\/g, "")
        }

        function g(a, b) {
            return "*" === a || a.toLowerCase() === e(b.toLowerCase())
        }

        function h(a, b, c) {
            var d = [], e = c.ownerDocument || c, h = e.getElementById(f(a));
            h && g(b, h.nodeName) && _contains(c, h) && d.push(h);
            return d
        }

        function i(a, b, c) {
            var h, i, j, k, l, d = c.ownerDocument || c, e = [];
            if (c.getElementsByClassName) {
                h = c.getElementsByClassName(f(a));
                for (i = 0, j = h.length; j > i; i++) {
                    k = h[i];
                    g(b, k.nodeName) && e.push(k)
                }
            } else if (d.querySelectorAll) {
                h = d.querySelectorAll(("#document" !== c.nodeName ? c.nodeName + " " : "") + b + "." + a);
                for (i = 0, j = h.length; j > i; i++) {
                    k = h[i];
                    _contains(c, k) && e.push(k)
                }
            } else {
                h = c.getElementsByTagName(b);
                a = " " + a + " ";
                for (i = 0, j = h.length; j > i; i++) {
                    k = h[i];
                    if (1 == k.nodeType) {
                        l = k.className;
                        l && (" " + l + " ").indexOf(a) > -1 && e.push(k)
                    }
                }
            }
            return e
        }

        function j(a, b, c) {
            var i, j, k, d = [], e = c.ownerDocument || c, h = e.getElementsByName(f(a));
            for (j = 0, k = h.length; k > j; j++) {
                i = h[j];
                g(b, i.nodeName) && _contains(c, i) && null !== i.getAttribute("name") && d.push(i)
            }
            return d
        }

        function k(a, b, c, d) {
            var h, i, j, f = [], g = d.getElementsByTagName(c);
            for (i = 0, j = g.length; j > i; i++) {
                h = g[i];
                1 == h.nodeType && (null === b ? null !== _getAttr(h, a) && f.push(h) : b === e(_getAttr(h, a)) && f.push(h))
            }
            return f
        }

        function l(a, b) {
            var f, g, m, l, n, o, c = [], d = /^((?:\\.|[^.#\s\[<>])+)/.exec(a), e = d ? d[1] : "*";
            if (d = /#((?:[\w\-]|\\.)+)$/.exec(a)) c = h(d[1], e, b); else if (d = /\.((?:[\w\-]|\\.)+)$/.exec(a)) c = i(d[1], e, b); else if (d = /\[((?:[\w\-]|\\.)+)\]/.exec(a)) c = k(d[1].toLowerCase(), null, e, b); else if (d = /\[((?:[\w\-]|\\.)+)\s*=\s*['"]?((?:\\.|[^'"]+)+)['"]?\]/.exec(a)) {
                f = d[1].toLowerCase(), g = d[2];
                c = "id" === f ? h(g, e, b) : "class" === f ? i(g, e, b) : "name" === f ? j(g, e, b) : k(f, g, e, b)
            } else {
                l = b.getElementsByTagName(e);
                for (n = 0, o = l.length; o > n; n++) {
                    m = l[n];
                    1 == m.nodeType && c.push(m)
                }
            }
            return c
        }

        var d, n, m, o, p, r, s, t, u, v, w, x, y, A, B, q, c = a.split(",");
        if (c.length > 1) {
            d = [];
            _each(c, function () {
                _each(_queryAll(this, b), function () {
                    _inArray(this, d) < 0 && d.push(this)
                })
            });
            return d
        }
        b = b || document;
        m = [], o = /((?:\\.|[^\s>])+|[\s>])/g;
        for (; n = o.exec(a);) " " !== n[1] && m.push(n[1]);
        p = [];
        if (1 == m.length) return l(m[0], b);
        q = !1;
        for (w = 0, lenth = m.length; lenth > w; w++) {
            r = m[w];
            if (">" !== r) {
                if (w > 0) {
                    s = [];
                    for (x = 0, A = p.length; A > x; x++) {
                        u = p[x];
                        t = l(r, u);
                        for (y = 0, B = t.length; B > y; y++) {
                            v = t[y];
                            q ? u === v.parentNode && s.push(v) : s.push(v)
                        }
                    }
                    p = s
                } else p = l(r, b);
                if (0 === p.length) return []
            } else q = !0
        }
        return p
    }

    function _query(a, b) {
        var c = _queryAll(a, b);
        return c.length > 0 ? c[0] : null
    }

    function _get(a) {
        return K(a)[0]
    }

    function _getDoc(a) {
        return a ? a.ownerDocument || a.document || a : document
    }

    function _getWin(a) {
        if (!a) return window;
        var b = _getDoc(a);
        return b.parentWindow || b.defaultView
    }

    function _setHtml(a, b) {
        var c, d;
        if (1 == a.nodeType) {
            c = _getDoc(a);
            try {
                a.innerHTML = '<img id="__kindeditor_temp_tag__" width="0" height="0" style="display:none;" />' + b;
                d = c.getElementById("__kindeditor_temp_tag__");
                d.parentNode.removeChild(d)
            } catch (e) {
                K(a).empty();
                K("@" + b, c).each(function () {
                    a.appendChild(this)
                })
            }
        }
    }

    function _hasClass(a, b) {
        return _inString(b, a.className, " ")
    }

    function _setAttr(a, b, c) {
        _IE && 8 > _V && "class" == b.toLowerCase() && (b = "className");
        null !== c ? a.setAttribute(b, "" + c) : a.removeAttribute(b)
    }

    function _removeAttr(a, b) {
        _IE && 8 > _V && "class" == b.toLowerCase() && (b = "className");
        _setAttr(a, b, "");
        a.removeAttribute(b)
    }

    function _getNodeName(a) {
        return a && a.nodeName ? a.nodeName.toLowerCase() : ""
    }

    function _computedCss(a, b) {
        var g, d = _getWin(a), e = _toCamel(b), f = "";
        if (d.getComputedStyle) {
            g = d.getComputedStyle(a, null);
            f = g[e] || g.getPropertyValue(b) || a.style[e]
        } else a.currentStyle && (f = a.currentStyle[e] || a.style[e]);
        return f
    }

    function _hasVal(a) {
        return !!_VALUE_TAG_MAP[_getNodeName(a)]
    }

    function _docElement(a) {
        a = a || document;
        return (_QUIRKS ? a.body : a.documentElement) || a.body || a.documentElement
    }

    function _docHeight(a) {
        var b = _docElement(a);
        return Math.max(b.scrollHeight, b.clientHeight)
    }

    function _docWidth(a) {
        var b = _docElement(a);
        return Math.max(b.scrollWidth, b.clientWidth)
    }

    function _getXY(a) {
        var b, c;
        if (_IE || _NEWIE || _OPERA) {
            b = _docElement(a).scrollLeft;
            c = _docElement(a).scrollTop
        } else {
            b = _getWin(a).scrollX;
            c = _getWin(a).scrollY
        }
        return {x: b, y: c}
    }

    function _getScrollPos(a) {
        var b, c, d;
        a = a || document;
        if (_IE || _NEWIE || _OPERA) {
            d = _docElement(a) || a;
            b = d.scrollLeft || a.scrollLeft;
            c = d.scrollTop || a.scrollTop
        } else {
            b = _getWin(a).scrollX;
            c = _getWin(a).scrollY
        }
        return {x: b || 0, y: c || 0}
    }

    function KNode(a) {
        this.init(a)
    }

    function _updateCollapsed(a) {
        a.collapsed = a.startContainer === a.endContainer && a.startOffset === a.endOffset;
        return a
    }

    function _copyAndDelete(a, b, c) {
        function f(d, f, g) {
            var i, j, k, l, h = d.nodeValue.length;
            if (b) {
                j = d.cloneNode(!0);
                i = f > 0 ? j.splitText(f) : j;
                h > g && i.splitText(g - f)
            }
            if (c) {
                k = d;
                if (f > 0) {
                    k = d.splitText(f);
                    a.setStart(d, f)
                }
                if (h > g) {
                    l = k.splitText(g - f);
                    a.setEnd(l, 0)
                }
                e.push(k)
            }
            return i
        }

        function g() {
            var b, d, f;
            c && a.up().collapse(!0);
            for (b = 0, d = e.length; d > b; b++) {
                f = e[b];
                f.parentNode && f.parentNode.removeChild(f)
            }
        }

        function p(g, m) {
            for (var o, q, r, s, n = g.firstChild; n;) {
                q = new KRange(d).selectNode(n);
                i = q.compareBoundaryPoints(_START_TO_END, a);
                i >= 0 && 0 >= j && (j = q.compareBoundaryPoints(_START_TO_START, a));
                j >= 0 && 0 >= k && (k = q.compareBoundaryPoints(_END_TO_END, a));
                k >= 0 && 0 >= l && (l = q.compareBoundaryPoints(_END_TO_START, a));
                if (l >= 0) return !1;
                o = n.nextSibling;
                if (i > 0) if (1 == n.nodeType) if (j >= 0 && 0 >= k) {
                    b && m.appendChild(n.cloneNode(!0));
                    c && e.push(n)
                } else {
                    if (b) {
                        r = n.cloneNode(!1);
                        m.appendChild(r)
                    }
                    if (p(n, r) === !1) return !1
                } else if (3 == n.nodeType) {
                    s = n == h.startContainer ? f(n, h.startOffset, n.nodeValue.length) : n == h.endContainer ? f(n, 0, h.endOffset) : f(n, 0, n.nodeValue.length);
                    if (b) try {
                        m.appendChild(s)
                    } catch (t) {
                    }
                }
                n = o
            }
        }

        var o, q, r, s, d = a.doc, e = [], h = a.cloneRange().down(), i = -1, j = -1, k = -1, l = -1,
            m = a.commonAncestor(), n = d.createDocumentFragment();
        if (3 == m.nodeType) {
            o = f(m, a.startOffset, a.endOffset);
            b && n.appendChild(o);
            g();
            return b ? n : a
        }
        p(m, n);
        c && a.up().collapse(!0);
        for (q = 0, r = e.length; r > q; q++) {
            s = e[q];
            s.parentNode && s.parentNode.removeChild(s)
        }
        return b ? n : a
    }

    function _moveToElementText(a, b) {
        for (var d, c = b; c;) {
            d = K(c);
            if ("marquee" == d.name || "select" == d.name) return;
            c = c.parentNode
        }
        try {
            a.moveToElementText(b)
        } catch (e) {
        }
    }

    function _getStartEnd(a, b) {
        var e, f, g, h, i, j, k, l, m, o, n, p, q, r, c = a.parentElement().ownerDocument, d = a.duplicate();
        d.collapse(b);
        e = d.parentElement(), f = e.childNodes;
        if (0 === f.length) return {node: e.parentNode, offset: K(e).index()};
        g = c, h = 0, i = -1;
        j = a.duplicate();
        _moveToElementText(j, e);
        for (k = 0, l = f.length; l > k; k++) {
            m = f[k];
            i = j.compareEndPoints("StartToStart", d);
            if (0 === i) return {node: m.parentNode, offset: k};
            if (1 == m.nodeType) {
                n = a.duplicate(), p = K(m), q = m;
                if (p.isControl()) {
                    o = c.createElement("span");
                    p.after(o);
                    q = o;
                    h += p.text().replace(/\r\n|\n|\r/g, "").length
                }
                _moveToElementText(n, q);
                j.setEndPoint("StartToEnd", n);
                i > 0 ? h += n.text.replace(/\r\n|\n|\r/g, "").length : h = 0;
                o && K(o).remove()
            } else if (3 == m.nodeType) {
                j.moveStart("character", m.nodeValue.length);
                h += m.nodeValue.length
            }
            0 > i && (g = m)
        }
        if (0 > i && 1 == g.nodeType) return {node: e, offset: K(e.lastChild).index() + 1};
        if (i > 0) for (; g.nextSibling && 1 == g.nodeType;) g = g.nextSibling;
        j = a.duplicate();
        _moveToElementText(j, e);
        j.setEndPoint("StartToEnd", d);
        h -= j.text.replace(/\r\n|\n|\r/g, "").length;
        if (i > 0 && 3 == g.nodeType) {
            r = g.previousSibling;
            for (; r && 3 == r.nodeType;) {
                h -= r.nodeValue.length;
                r = r.previousSibling
            }
        }
        return {node: g, offset: h}
    }

    function _getEndRange(a, b) {
        var f, g, e, i, h, j, c = a.ownerDocument || a, d = c.body.createTextRange();
        if (c == a) {
            d.collapse(!0);
            return d
        }
        if (1 == a.nodeType && a.childNodes.length > 0) {
            e = a.childNodes;
            if (0 === b) {
                g = e[0];
                f = !0
            } else {
                g = e[b - 1];
                f = !1
            }
            if (!g) return d;
            if ("head" === K(g).name) {
                1 === b && (f = !0);
                2 === b && (f = !1);
                d.collapse(f);
                return d
            }
            if (1 == g.nodeType) {
                h = K(g);
                if (h.isControl()) {
                    i = c.createElement("span");
                    f ? h.before(i) : h.after(i);
                    g = i
                }
                _moveToElementText(d, g);
                d.collapse(f);
                i && K(i).remove();
                return d
            }
            a = g;
            b = f ? 0 : g.nodeValue.length
        }
        j = c.createElement("span");
        K(a).before(j);
        _moveToElementText(d, j);
        d.moveStart("character", b);
        K(j).remove();
        return d
    }

    function _toRange(a) {
        function d(a) {
            if ("tr" == K(a.node).name) {
                a.node = a.node.cells[a.offset];
                a.offset = 0
            }
        }

        var b, c, e, f, g;
        if (_IERANGE) {
            if (a.item) {
                b = _getDoc(a.item(0));
                c = new KRange(b);
                c.selectNode(a.item(0));
                return c
            }
            b = a.parentElement().ownerDocument;
            e = _getStartEnd(a, !0), f = _getStartEnd(a, !1);
            d(e);
            d(f);
            c = new KRange(b);
            c.setStart(e.node, e.offset);
            c.setEnd(f.node, f.offset);
            return c
        }
        g = a.startContainer;
        b = g.ownerDocument || g;
        c = new KRange(b);
        c.setStart(g, a.startOffset);
        c.setEnd(a.endContainer, a.endOffset);
        return c
    }

    function KRange(a) {
        this.init(a)
    }

    function _range(a) {
        return a.nodeName ? new KRange(a) : a.constructor === KRange ? a : _toRange(a)
    }

    function _GetElements(a, b) {
        var d, e, f, h, i, j, k, c = [];
        if (!a) return c;
        if ("range" in a) {
            d = a;
            e = d.doc, f = d.range;
            f.enlarge();
            h = e.createElement("span");
            i = e.createElement("span");
            f.cloneRange().collapse(!1).insertNode(i);
            f.cloneRange().collapse(!0).insertNode(h);
            j = f.commonAncestor();
            null == j && (j = d.doc.body);
            j = K(j);
            ("span" == j.name || "#text" == j.name) && (j = j.parent());
            k = !1;
            j.scan(function (a) {
                if (k) {
                    if (a == i) return !1;
                    var d = a.nodeNam;
                    k && "#text" !== d && (!b || b.indexOf(d) > -1) && c.push(K(a))
                } else if (a == h) {
                    c.push(K(a).parent());
                    k = !0
                }
            });
            K(h).remove();
            K(i).remove()
        } else a.length && a.scan(function (a) {
            var d = a.nodeNam;
            "#text" !== a.nodeName && (!b || b.indexOf(d) > -1) && c.push(K(a))
        });
        return c
    }

    function getFName(a) {
        return /^[\s\(]*function(?:\s+([\w$_][\w\d$_]*))?\(/.exec(a.toString())[1] || ""
    }

    function _nativeCommand(a, b, c, d, e) {
        a = a || this;
        var f = a.doc || a;
        try {
            if (sites_[b]) sites_[b].call(a, f, b, c); else {
                f.execCommand(b, !1, c);
                d && d()
            }
            sites_[b + "_end"] && sites_[b + "_end"].call(a, f, b, c);
            e && e()
        } catch (g) {
            console.log(g)
        }
    }

    function _nativeCommandValue(a, b) {
        var c = "";
        try {
            c = a.queryCommandValue(b)
        } catch (d) {
        }
        "string" != typeof c && (c = "");
        return c
    }

    function _getSel(a) {
        var b = _getWin(a);
        return _IERANGE ? a.selection : b.getSelection()
    }

    function _getRng(a) {
        var c, b = _getSel(a);
        try {
            c = b.rangeCount > 0 ? b.getRangeAt(0) : b.createRange()
        } catch (d) {
        }
        return !_IERANGE || c && (c.item || c.parentElement().ownerDocument === a) ? c : null
    }

    function _singleKeyMap(a) {
        var c, d, b = {};
        _each(a, function (a, e) {
            c = a.split(",");
            for (var f = 0, g = c.length; g > f; f++) {
                d = c[f];
                b[d] = e
            }
        });
        return b
    }

    function _hasAttrOrCss(a, b) {
        return _hasAttrOrCssByKey(a, b, "*") || _hasAttrOrCssByKey(a, b)
    }

    function _hasAttrOrCssByKey(a, b, c) {
        var d, e, f, g, h, i, j, k;
        c = c || a.name;
        if (1 !== a.type) return !1;
        d = _singleKeyMap(b);
        if (!d[c]) return !1;
        e = d[c].split(",");
        for (f = 0, g = e.length; g > f; f++) {
            h = e[f];
            if ("*" === h) return !0;
            i = /^(\.?)([^=]+)(?:=([^=]*))?$/.exec(h);
            j = i[1] ? "css" : "attr";
            h = i[2];
            k = i[3] || "";
            if ("" === k && "" !== a[j](h)) return !0;
            if ("" !== k && a[j](h) === k) return !0
        }
        return !1
    }

    function _removeAttrOrCss(a, b) {
        if (1 == a.type) {
            _removeAttrOrCssByKey(a, b, "*");
            _removeAttrOrCssByKey(a, b)
        }
    }

    function _removeAttrOrCssByKey(a, b, c) {
        var d, e, f, g, h, i, j;
        c = c || a.name;
        if (1 === a.type) {
            d = _singleKeyMap(b);
            if (d[c]) {
                e = d[c].split(","), f = !1;
                for (g = 0, h = e.length; h > g; g++) {
                    i = e[g];
                    if ("*" === i) {
                        f = !0;
                        break
                    }
                    j = /^(\.?)([^=]+)(?:=([^=]*))?$/.exec(i);
                    i = j[2];
                    if (j[1]) {
                        i = _toCamel(i);
                        a[0].style[i] && (a[0].style[i] = "")
                    } else a.removeAttr(i)
                }
                f && a.remove(!0)
            }
        }
    }

    function _getInnerNode(a) {
        for (var b = a; b.first();) b = b.first();
        return b
    }

    function _isEmptyNode(a) {
        return 1 != a.type || a.isSingle() ? !1 : "" === a.html().replace(/<[^>]+>/g, "")
    }

    function _mergeWrapper(a, b) {
        a = a.clone(!0);
        for (var c = _getInnerNode(a), d = a, e = !1; b;) {
            for (; d;) {
                if (d.name === b.name) {
                    _mergeAttrs(d, b.attr(), b.css());
                    e = !0
                }
                d = d.first()
            }
            e || c.append(b.clone(!1));
            e = !1;
            b = b.first()
        }
        return a
    }

    function _wrapNode(a, b) {
        var d, c, e;
        b = b.clone(!0);
        if (3 == a.type) {
            _getInnerNode(b).append(a.clone(!1));
            a.replaceWith(b);
            return b
        }
        c = a;
        for (; (d = a.first()) && 1 == d.children().length;) a = d;
        d = a.first();
        e = a.doc.createDocumentFragment();
        for (; d;) {
            e.appendChild(d[0]);
            d = d.next()
        }
        b = _mergeWrapper(c, b);
        e.firstChild && _getInnerNode(b).append(e);
        c.replaceWith(b);
        return b
    }

    function _mergeAttrs(a, b, c) {
        _each(b, function (b, c) {
            "style" !== b && a.attr(b, c)
        });
        _each(c, function (b, c) {
            a.css(b, c)
        })
    }

    function _inPreElement(a) {
        for (; a && "body" != a.name;) {
            if (_PRE_TAG_MAP[a.name] || "div" == a.name && a.hasClass("ke-script")) return !0;
            a = a.parent()
        }
        return !1
    }

    function KCmd(a) {
        this.init(a)
    }

    function _cmd(a) {
        if (a.nodeName) {
            var b = _getDoc(a);
            a = _range(b).selectNodeContents(b.body).collapse(!1)
        }
        return new KCmd(a)
    }

    function _drag(a) {
        var b = a.moveEl, c = a.moveFn, d = a.clickEl || b, e = a.beforeDrag,
            f = a.iframeFix === undefined ? !0 : a.iframeFix, g = [document];
        f && K("iframe").each(function () {
            var b, d, a = _formatUrl(this.src || "", "absolute");
            if (!/^https?:\/\//.test(a)) {
                try {
                    b = _iframeDoc(this)
                } catch (c) {
                }
                if (b) {
                    d = K(this).pos();
                    K(b).data("pos-x", d.x);
                    K(b).data("pos-y", d.y);
                    g.push(b)
                }
            }
        });
        d.mousedown(function (a) {
            function n(a) {
                var b, e, f;
                a.preventDefault();
                b = K(_getDoc(a.target));
                e = _round((b.data("pos-x") || 0) + a.pageX - l);
                f = _round((b.data("pos-y") || 0) + a.pageY - m);
                c.call(d, h, i, j, k, e, f)
            }

            function o(a) {
                a.preventDefault()
            }

            function p(a) {
                a.preventDefault();
                K(g).unbind("mousemove", n).unbind("mouseup", p).unbind("selectstart", o);
                f.releaseCapture && f.releaseCapture()
            }

            if (0 === a.button || 1 === a.button) {
                a.stopPropagation();
                var f = d.get(), h = _removeUnit(b.css("left")), i = _removeUnit(b.css("top")), j = b.width(),
                    k = b.height(), l = a.pageX, m = a.pageY;
                e && e();
                K(g).mousemove(n).mouseup(p).bind("selectstart", o);
                f.setCapture && f.setCapture()
            }
        })
    }

    function KWidget(a) {
        this.init(a)
    }

    function _widget(a) {
        return new KWidget(a)
    }

    function _iframeDoc(a) {
        a = _get(a);
        return a.contentDocument || a.contentWindow.document
    }

    function _getInitHtml(a, b, c, d, e) {
        var g,
            f = ["" === _direction ? "<html>" : '<html dir="' + _direction + '">', '<head><meta charset="utf-8" /><title></title>', "<style>", "html {margin:0;padding:0;}", "body {margin:0;padding:5px;}", 'body, td {font:12px/1.5 "sans serif",tahoma,verdana,helvetica;}', "body, p, div {word-wrap: break-word;}", "p {margin:5px 0;}", "table {border-collapse:collapse;}", "img {border:0;}", "noscript {display:none;}", "table.ke-zeroborder td {border:1px dotted #AAA;}", "img.ke-flash {", "	border:1px solid #AAA;", "	background-image:url(" + a + "common/flash.gif);", "	background-position:center center;", "	background-repeat:no-repeat;", "	width:100px;", "	height:100px;", "}", "img.ke-rm {", "	border:1px solid #AAA;", "	background-image:url(" + a + "common/rm.gif);", "	background-position:center center;", "	background-repeat:no-repeat;", "	width:100px;", "	height:100px;", "}", "img.ke-media {", "	border:1px solid #AAA;", "	background-image:url(" + a + "common/media.gif);", "	background-position:center center;", "	background-repeat:no-repeat;", "	width:100px;", "	height:100px;", "}", "img.ke-anchor {", "	border:1px dashed #666;", "	width:16px;", "	height:16px;", "}", ".ke-script, .ke-noscript, .ke-display-none {", "	display:none;", "	font-size:0;", "	width:0;", "	height:0;", "}", ".ke-pagebreak {", "clear:both; height:0; line-height:0; font-size:0;cursor: pointer;page-break-after: always;", "	border:4px dotted #AAA;", "	font-size:0;", "	height:2px;", "}", "</style>"];
        _isArray(c) || (c = [c]);
        _each(c, function (a, b) {
            b && f.push('<link href="' + b + '" rel="stylesheet" />')
        });
        if (e && e.loadstyles) {
            g = e.loadstyles.split(",");
            _each(g, function (a, b) {
                b && f.push('<link href="' + b + '" rel="stylesheet" />')
            })
        }
        d && f.push("<style>" + d + "</style>");
        f.push("</head><body " + (b ? 'class="' + b + '"' : "") + "></body></html>");
        return f.join("\n")
    }

    function _elementVal(a, b) {
        if (a.hasVal()) {
            if (b === undefined) {
                var c = a.val();
                c = c.replace(/(<(?:p|p\s[^>]*)>) *(<\/p>)/gi, "");
                return c
            }
            return a.val(b)
        }
        return a.html(b)
    }

    function KEdit(a) {
        this.init(a)
    }

    function ClickSetToolbar(a) {
        a.toolbar && a.cmd && _each("indent".split(","), function (b, c) {
            a.cmd.state(c) ? a.toolbar.select(c) : a.toolbar.unselect(c)
        })
    }

    function _edit(a) {
        return new KEdit(a)
    }

    function _selectToolbar(a, b) {
        var c = this, d = c.get(a);
        if (d) {
            if (d.hasClass("ke-disabled")) return;
            b(d)
        }
    }

    function KToolbar(a) {
        this.init(a)
    }

    function _toolbar(a) {
        return new KToolbar(a)
    }

    function KMenu(a) {
        this.init(a)
    }

    function _menu(a) {
        return new KMenu(a)
    }

    function KColorPicker(a) {
        this.init(a)
    }

    function _colorpicker(a) {
        return new KColorPicker(a)
    }

    function KUploadButton(a) {
        this.init(a)
    }

    function _uploadbutton(a) {
        return new KUploadButton(a)
    }

    function _createButton(a) {
        a = a || {};
        var b = a.name || "", c = K('<span class="ke-button-common ke-button-outer" title="' + b + '"></span>'),
            d = K('<input class="ke-button-common ke-button" type="button" value="' + b + '" />');
        a.click && d.click(a.click);
        c.append(d);
        return c
    }

    function KDialog(a) {
        this.init(a)
    }

    function _dialog(a) {
        return new KDialog(a)
    }

    function _tabs(a) {
        var g, b = _widget(a), c = b.remove, d = a.afterSelect, e = b.div, f = [];
        e.addClass("ke-tabs").bind("contextmenu,mousedown,mousemove", function (a) {
            a.preventDefault()
        });
        g = K('<ul class="ke-tabs-ul ke-clearfix"></ul>');
        e.append(g);
        b.add = function (a) {
            var b = K('<li class="ke-tabs-li">' + a.title + "</li>");
            a.style && b.attr("style", a.style);
            b.data("tab", a);
            f.push(b);
            g.append(b)
        };
        b.selectedIndex = 0;
        b.select = function (a) {
            b.selectedIndex = a;
            _each(f, function (c, d) {
                d.unbind();
                if (c === a) {
                    d.addClass("ke-tabs-li-selected");
                    K(d.data("tab").panel).show("")
                } else {
                    d.removeClass("ke-tabs-li-selected").removeClass("ke-tabs-li-on").mouseover(function () {
                        K(this).addClass("ke-tabs-li-on")
                    }).mouseout(function () {
                        K(this).removeClass("ke-tabs-li-on")
                    }).click(function () {
                        b.select(c)
                    });
                    K(d.data("tab").panel).hide()
                }
            });
            d && d.call(b, a)
        };
        b.remove = function () {
            _each(f, function () {
                this.remove()
            });
            g.remove();
            c.call(b)
        };
        return b
    }

    function _loadScript(a, b) {
        var c = document.getElementsByTagName("head")[0] || (_QUIRKS ? document.body : document.documentElement),
            d = document.createElement("script");
        c.appendChild(d);
        d.src = a;
        d.charset = "utf-8";
        d.onload = d.onreadystatechange = function () {
            if (!this.readyState || "loaded" === this.readyState) {
                b && b();
                d.onload = d.onreadystatechange = null;
                c.removeChild(d)
            }
        }
    }

    function _chopQuery(a) {
        var b = a.indexOf("?");
        return b > 0 ? a.substr(0, b) : a
    }

    function _loadStyle(a) {
        var f, g, b = document.getElementsByTagName("head")[0] || (_QUIRKS ? document.body : document.documentElement),
            c = document.createElement("link"), d = _chopQuery(_formatUrl(a, "absolute")),
            e = K('link[rel="stylesheet"]', b);
        for (f = 0, g = e.length; g > f; f++) if (_chopQuery(_formatUrl(e[f].href, "absolute")) === d) return;
        b.appendChild(c);
        c.href = a;
        c.rel = "stylesheet"
    }

    function _ajax(a, b, c, d, e) {
        var f, g;
        c = c || "GET";
        e = e || "json";
        f = window.XMLHttpRequest ? new window.XMLHttpRequest : new ActiveXObject("Microsoft.XMLHTTP");
        f.open(c, a, !0);
        f.onreadystatechange = function () {
            if (4 == f.readyState && 200 == f.status && b) {
                var a = _trim(f.responseText);
                "json" == e && (a = _json(a));
                b(a)
            }
        };
        if ("POST" == c) {
            g = [];
            _each(d, function (a, b) {
                g.push(encodeURIComponent(a) + "=" + encodeURIComponent(b))
            });
            try {
                f.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
            } catch (h) {
            }
            f.send(g.join("&"))
        } else f.send(null)
    }

    function _plugin(a, b) {
        if (a === undefined) return _plugins;
        if (!b) return _plugins[a];
        _plugins[a] = b;
        return void 0
    }

    function _parseLangKey(a) {
        var b, c = "core";
        if (b = /^(\w+)\.(\w+)$/.exec(a)) {
            c = b[1];
            a = b[2]
        }
        return {ns: c, key: a}
    }

    function _lang(a, b) {
        var c, d;
        b = b === undefined ? K.options.langType : b;
        if ("string" == typeof a) {
            if (!_language[b]) return "no language";
            c = a.length - 1;
            if ("." === a.substr(c)) return _language[b][a.substr(0, c)];
            d = _parseLangKey(a);
            return _language[b][d.ns][d.key]
        }
        _each(a, function (a, c) {
            var d = _parseLangKey(a);
            _language[b] || (_language[b] = {});
            _language[b][d.ns] || (_language[b][d.ns] = {});
            _language[b][d.ns][d.key] = c
        })
    }

    function _getImageFromRange(a, b) {
        var c, d, e;
        if (!a.collapsed) {
            a = a.cloneRange().up();
            c = a.startContainer, d = a.startOffset;
            if (_WEBKIT || a.isControl()) {
                e = K(c.childNodes[d]);
                if (e && "img" == e.name) return b(e) ? e : void 0
            }
        }
    }

    function _bindContextmenuEvent() {
        var a = this, b = a.edit.doc;
        K(b).contextmenu(function (b) {
            var c, d, e, f, g, h, i, j;
            a.menu && a.hideMenu();
            if (a.useContextmenu) {
                if (0 !== a._contextmenus.length) {
                    c = 0, d = [];
                    _each(a._contextmenus, function () {
                        if ("-" != this.title) {
                            if (this.cond && this.cond()) {
                                d.push(this);
                                this.width && this.width > c && (c = this.width)
                            }
                        } else d.push(this)
                    });
                    for (; d.length > 0 && "-" == d[0].title;) d.shift();
                    for (; d.length > 0 && "-" == d[d.length - 1].title;) d.pop();
                    e = null;
                    _each(d, function (a) {
                        "-" == this.title && "-" == e.title && delete d[a];
                        e = this
                    });
                    if (d.length > 0) {
                        b.preventDefault();
                        f = K(a.edit.iframe).pos(), g = _menu({
                            x: f.x + b.clientX,
                            y: f.y + b.clientY,
                            width: c,
                            css: {visibility: "hidden"},
                            shadowMode: a.shadowMode
                        });
                        _each(d, function () {
                            this.title && g.addItem(this)
                        });
                        h = _docElement(g.doc), i = g.div.height();
                        if (b.clientY + i >= h.clientHeight - 100) g.pos(g.x, _removeUnit(g.y) - i); else if (window.top != window.self) {
                            j = parseInt(g.div.css("top"));
                            isNaN(j) || j + i > h.clientHeight && g.pos(g.x, _removeUnit(g.y) - i)
                        }
                        g.div.css("visibility", "visible");
                        a.menu = g
                    }
                }
            } else b.preventDefault()
        })
    }

    function _bindNewlineEvent() {
        function f(a) {
            for (var b = K(a.commonAncestor()); b && (1 != b.type || b.isStyle());) b = b.parent();
            return b
        }

        var d, e, g, a = this, b = a.edit.doc, c = a.newlineTag;
        if (!(_IE && "br" !== c || _GECKO && 3 > _V && "p" !== c || _OPERA && 9 > _V)) {
            d = _toMap("h1,h2,h3,h4,h5,h6,pre,li"), e = _toMap("p,h1,h2,h3,h4,h5,h6,pre,li,blockquote");
            g = !1;
            K(b).keydown(function (h) {
                var i, j, k, l;
                if (!(13 != h.which || h.shiftKey || h.ctrlKey || h.altKey)) {
                    a.cmd.selection();
                    i = f(a.cmd.range) || {};
                    j = i.name || "";
                    if ("marquee" != j && "select" != j) if ("br" !== c || d[j]) {
                        g = !1;
                        k = j;
                        l = i;
                        for (; k && "body" != k && !_BLOCK_TAG_MAP[k];) {
                            l = l.parent();
                            k = l.name
                        }
                        if ("body" === k) {
                            K(l).scan(function (a) {
                                var b = a.nodeName;
                                b = b ? b.toLowerCase() : b;
                                if (b || !_BLOCK_TAG_MAP[b]) {
                                    g = !0;
                                    return !1
                                }
                            });
                            g && _nativeCommand(b, "formatblock", "<p>");
                            return !0
                        }
                        if (!e[j]) {
                            if (_GetElementAttrCount(i) > 0) return !0;
                            _nativeCommand(b, "formatblock", "<p>")
                        }
                    } else {
                        h.preventDefault();
                        a.insertHtml("<br />" + (_IE && 9 > _V ? "" : "​"))
                    }
                }
            });
            K(b).keyup(function (d) {
                var g, h, i, j;
                if (!(13 != d.which || d.shiftKey || d.ctrlKey || d.altKey) && "br" != c) if (_GECKO) {
                    g = a.cmd.commonAncestor("p");
                    h = a.cmd.commonAncestor("a");
                    if (h && "" == h.text()) {
                        h.remove(!0);
                        a.cmd.range.selectNodeContents(g[0]).collapse(!0);
                        a.cmd.select()
                    }
                } else {
                    a.cmd.selection();
                    i = f(a.cmd.range) || {};
                    j = i.name || "";
                    "marquee" != j && "select" != j && "body" != j && (e[j] || _nativeCommand(b, "formatblock", "<p>"))
                }
            })
        }
    }

    function _bindTabEvent() {
        var a = this, b = a.edit.doc;
        K(b).keydown(function (c) {
            if (9 == c.which) {
                c.preventDefault();
                if (a.afterTab) {
                    a.afterTab.call(a, c);
                    return
                }
                var d = a.cmd, e = d.range;
                e.shrink();
                if (e.collapsed && 1 == e.startContainer.nodeType) {
                    e.insertNode(K("@&nbsp;", b)[0]);
                    d.select()
                }
                a.insertHtml("&nbsp;&nbsp;&nbsp;&nbsp;")
            }
        })
    }

    function _bindFocusEvent() {
        var a = this;
        K(a.edit.textarea[0], a.edit.win).focus(function (b) {
            a.afterFocus && a.afterFocus.call(a, b)
        }).blur(function (b) {
            a.afterBlur && a.afterBlur.call(a, b)
        })
    }

    function _removeBookmarkTag(a) {
        return _trim(a.replace(/<span [^>]*id="?__kindeditor_bookmark_\w+_\d+__"?[^>]*><\/span>/gi, ""))
    }

    function _removeTempTag(a) {
        return a.replace(/<div[^>]+class="?__kindeditor_paste__"?[^>]*>[\s\S]*?<\/div>/gi, "").replace(/<span style="display:none;">[\s\S]*?<\/span>/gi, "").replace(/<(strong|b|u|em|span)><\/(strong|b|u|em|span)>/gi, "")
    }

    function _addBookmarkToStack(a, b) {
        if (0 !== a.length) {
            var c = a[a.length - 1];
            _removeBookmarkTag(b.html) !== _removeBookmarkTag(c.html) && a.push(b)
        } else a.push(b)
    }

    function _undoToRedo(a, b) {
        var f, g, h, c = this, d = c.edit, e = d.doc.body;
        if (0 === a.length) return c;
        if (d.designMode) {
            f = c.cmd.range;
            g = f.createBookmark(!0);
            g.html = e.innerHTML
        } else g = {html: e.innerHTML};
        _addBookmarkToStack(b, g);
        h = a.pop();
        _removeBookmarkTag(g.html) === _removeBookmarkTag(h.html) && a.length > 0 && (h = a.pop());
        if (d.designMode) {
            d.html(h.html);
            if (h.start) {
                f.moveToBookmark(h);
                c.select()
            }
        } else K(e).html(_removeBookmarkTag(h.html));
        return c
    }

    function KEditor(a) {
        function c(a, c) {
            KEditor.prototype[a] === undefined && (b[a] = c);
            b.options[a] = c
        }

        var d, b = this;
        b.options = {};
        _each(a, function (b) {
            c(b, a[b])
        });
        _each(K.options, function (a, d) {
            b[a] === undefined && c(a, d)
        });
        d = K(b.srcElement || "<textarea/>");
        b.width || (b.width = d[0].style.width || d.width());
        b.height || (b.height = d[0].style.height || d.height());
        c("width", _undef(b.width, b.minWidth));
        c("height", _undef(b.height, b.minHeight));
        c("width", _addUnit(b.width));
        c("height", _addUnit(b.height));
        _MOBILE && (!_IOS || 534 > _V) && (b.designMode = !1);
        b.srcElement = d;
        b.initContent = "";
        b.plugin = {};
        b.isCreated = !1;
        b._handlers = {};
        b._contextmenus = [];
        b._undoStack = [];
        b._redoStack = [];
        b._firstAddBookmark = !0;
        b.menu = b.contextmenu = null;
        b.dialogs = []
    }

    function _editor(a) {
        return new KEditor(a)
    }

    function _create(a, b) {
        function d(a) {
            _each(_plugins, function (b, c) {
                _isFunction(c) && c.call(a, KindEditor)
            });
            return a.create()
        }

        var c, e, f;
        b = b || {};
        b.basePath = _undef(b.basePath, K.basePath);
        b.themesPath = _undef(b.themesPath, b.basePath + "themes/");
        b.langPath = _undef(b.langPath, b.basePath + "lang/");
        b.pluginsPath = _undef(b.pluginsPath, b.basePath + "plugins/");
        if (_undef(b.loadStyleMode, K.options.loadStyleMode)) {
            c = _undef(b.themeType, K.options.themeType);
            _loadStyle(b.themesPath + "default/default.css");
            _loadStyle(b.themesPath + c + "/" + c + ".css")
        }
        e = K(a);
        if (e && 0 !== e.length) {
            if (e.length > 1) {
                e.each(function () {
                    _create(this, b)
                });
                return _instances[0]
            }
            b.srcElement = e[0];
            f = new KEditor(b);
            _instances.push(f);
            f.id = f.id || "kindeditor" + utils.uid();
            root[f.id] = f;
            if (_language[f.langType]) return d(f);
            _loadScript(f.langPath + f.langType + ".js?ver=" + encodeURIComponent(K.DEBUG ? _TIME : _VERSION), function () {
                d(f)
            });
            return f
        }
    }

    function _eachEditor(a, b) {
        K(a).each(function (a, c) {
            K.each(_instances, function (a, d) {
                if (d && d.srcElement[0] == c) {
                    b.call(d, a);
                    return !1
                }
            })
        })
    }

    function createTextarea() {
        this.init()
    }

    var _VERSION, _ua, _IE, _NEWIE, _GECKO, _WEBKIT, _OPERA, _MOBILE, _IOS, _QUIRKS, _IERANGE, _matches, _V, _TIME,
        uidCount, uidMagic, magic, root, utils, _round, K, _INLINE_TAG_MAP, _BLOCK_TAG_MAP, _SINGLE_TAG_MAP,
        _STYLE_TAG_MAP, _CONTROL_TAG_MAP, _PRE_TAG_MAP, _NOSPLIT_TAG_MAP, _AUTOCLOSE_TAG_MAP, _FILL_ATTR_MAP,
        _NO_REPLACE_ATTR_MAP, _VALUE_TAG_MAP, _BLOCK_TAG_MAP_, _NO_DELETE, _useCapture, _INPUT_KEY_MAP,
        _CURSORMOVE_KEY_MAP, _CHANGE_KEY_MAP, _ExcludeStyle, _EVENT_PROPS, _eventExpendo, _eventId, _eventData,
        _readyFinished, _getSetAttrDiv, _GET_SET_ATTRIBUTE, _K, _START_TO_START, _START_TO_END, _END_TO_END,
        _END_TO_START, _BOOKMARK_ID, SetTextAlign, sites_, html, _direction, _plugins, _language, _v;
    if (!window.KindEditor) {
        _VERSION = "4.1.10 (2013-11-23)", _ua = navigator.userAgent.toLowerCase(), _IE = _ua.indexOf("msie") > -1 && -1 == _ua.indexOf("opera"), _NEWIE = -1 == _ua.indexOf("msie") && _ua.indexOf("trident") > -1, _GECKO = _ua.indexOf("gecko") > -1 && -1 == _ua.indexOf("khtml"), _WEBKIT = _ua.indexOf("applewebkit") > -1, _OPERA = _ua.indexOf("opera") > -1, _MOBILE = _ua.indexOf("mobile") > -1, _IOS = /ipad|iphone|ipod/.test(_ua), _QUIRKS = "CSS1Compat" != document.compatMode, _IERANGE = !window.getSelection, _matches = /(?:msie|firefox|webkit|opera)[\/:\s](\d+)/.exec(_ua), _V = _matches ? _matches[1] : "0", _TIME = (new Date).getTime();
        uidCount = 0;
        uidMagic = "ID" + magic;
        magic = "$KINDEDITOR";
        root = window[magic] = {};
        utils = {
            each: function (a, b, c) {
                var d, e, f;
                if (null != a) if (a.length === +a.length) {
                    for (d = 0, e = a.length; e > d; d++) if (b.call(c, a[d], d, a) === !1) return !1
                } else for (f in a) if (a.hasOwnProperty(f) && b.call(c, a[f], f, a) === !1) return !1
            }, indexOf: function (a, b, c) {
                var d = -1;
                c = this.isNumber(c) ? c : 0;
                this.each(a, function (a, e) {
                    if (e >= c && a === b) {
                        d = e;
                        return !1
                    }
                });
                return d
            }, trimWhiteTextNode: function (a) {
                function b(b) {
                    for (var c; (c = a[b]) && 3 == c.nodeType && utils.isWhitespace(c);) a.removeChild(c)
                }

                b("firstChild");
                b("lastChild");
                return a
            }, isWhitespace: function (a) {
                var b = _IE && "6" == _V ? "﻿" : "​";
                return !new RegExp("[^ 	\n\r" + b + "]").test(a.nodeValue)
            }, isSameStyle: function (a, b) {
                var e, g, f, c = a.style.cssText.replace(/( ?; ?)/g, ";").replace(/( ?: ?)/g, ":"),
                    d = b.style.cssText.replace(/( ?; ?)/g, ";").replace(/( ?: ?)/g, ":");
                if (_OPERA) {
                    c = a.style;
                    d = b.style;
                    if (c.length != d.length) return !1;
                    for (e in c) if (!/^(\d+|csstext)$/i.test(e) && c[e] != d[e]) return !1;
                    return !0
                }
                if (!c || !d) return c == d;
                c = c.split(";");
                d = d.split(";");
                if (c.length != d.length) return !1;
                for (f = 0; g = c[f++];) if (-1 == this.indexOf(d, g)) return !1;
                return !0
            }, cssStyleToDomStyle: function () {
                var a = document.createElement("div").style,
                    b = {"float": a.cssFloat != undefined ? "cssFloat" : a.styleFloat != undefined ? "styleFloat" : "float"};
                return function (a) {
                    return b[a] || (b[a] = a.toLowerCase().replace(/-./g, function (a) {
                        return a.charAt(1).toUpperCase()
                    }))
                }
            }(), remove: function (a, b) {
                var d, c = a.parentNode;
                if (c) {
                    if (b && a.hasChildNodes()) for (; d = a.firstChild;) c.insertBefore(d, a);
                    c.removeChild(a)
                }
                return a
            }, removeNoStyle: function (a) {
                function f(a) {
                    for (var c, b = !1; a && "body" != a.name;) {
                        c = a.attr();
                        if (c["class"]) {
                            b = !0;
                            break
                        }
                        a = a.parent()
                    }
                    return b
                }

                var c, d, e;
                a = K(a);
                c = a.name;
                if ("a" === c) {
                    d = {color: ""};
                    for (e in d) d[e] = a.css(e);
                    a.attr("style", null);
                    a.css(d)
                } else a.attr("style", null);
                _NO_DELETE[a.name] || f(a) || a.remove(!0)
            }, uid: function (a) {
                return a ? a[uidMagic] || (a[uidMagic] = ++uidCount) : ++uidCount
            }, isWordDocument: function (a) {
                return /(class="?Mso|style="[^"]*\bmso\-|w:WordDocument|<(v|o):|lang=)/gi.test(a)
            }, transUnitToPx: function (a) {
                if (!/(pt|cm)/.test(a)) return a;
                var b;
                a.replace(/([\d.]+)(\w+)/, function (c, d, e) {
                    a = d;
                    b = e
                });
                switch (b) {
                    case "cm":
                        a = 25 * parseFloat(a);
                        break;
                    case "pt":
                        a = Math.round(96 * parseFloat(a) / 72)
                }
                return a + (a ? "px" : "")
            }, filterPasteWord: function (a) {
                return a.replace(/[\t\r\n]+/g, " ").replace(/<!--[\s\S]*?-->/gi, "").replace(/<v:shape [^>]*>[\s\S]*?.<\/v:shape>/gi, function (a) {
                    if (browser.opera) return "";
                    try {
                        if (/Bitmap/i.test(a)) return "";
                        var b = a.match(/width:([ \d.]*p[tx])/i)[1], c = a.match(/height:([ \d.]*p[tx])/i)[1],
                            d = a.match(/src=\s*"([^"]*)"/i)[1];
                        return '<img width="' + transUnit(b) + '" height="' + transUnit(c) + '" src="' + d + '" />'
                    } catch (e) {
                        return ""
                    }
                }).replace(/<\/?div[^>]*>/g, "").replace(/v:\w+=(["']?)[^'"]+\1/g, "").replace(/<(!|script[^>]*>.*?<\/script(?=[>\s])|\/?(\?xml(:\w+)?|xml|meta|link|style|\w+:\w+)(?=[\s\/>]))[^>]*>/gi, "").replace(/<p [^>]*class="?MsoHeading"?[^>]*>(.*?)<\/p>/gi, "<p><strong>$1</strong></p>").replace(/\s+(class|lang|align)\s*=\s*(['"]?)([\w-]+)\2/gi, function (a, b, c, d) {
                    return "class" == b && "MsoListParagraph" == d ? a : ""
                }).replace(/<(font|span)[^>]*>(\s*)<\/\1>/gi, function (a, b, c) {
                    return c.replace(/[\t\r\n ]+/g, " ")
                }).replace(/(<[a-z][^>]*)\sstyle=(["'])([^\2]*?)\2/gi, function (a, b, c, d) {
                    var h, g, i, j, k, e = [],
                        f = d.replace(/^\s+|\s+$/, "").replace(/&#39;/g, "'").replace(/&quot;/gi, "'").replace(/[\d.]+(cm|pt)/g, function (a) {
                            return utils.transUnitToPx(a)
                        }).split(/;\s*/g);
                    for (g = 0; h = f[g]; g++) {
                        k = h.split(":");
                        if (2 == k.length) {
                            i = k[0].toLowerCase();
                            j = k[1].toLowerCase();
                            if (/^(background)\w*/.test(i) && 0 == j.replace(/(initial|\s)/g, "").length || /^(margin)\w*/.test(i) && /^0\w+$/.test(j)) continue;
                            switch (i) {
                                case "mso-padding-alt":
                                case "mso-padding-top-alt":
                                case "mso-padding-right-alt":
                                case "mso-padding-bottom-alt":
                                case "mso-padding-left-alt":
                                case "mso-margin-alt":
                                case "mso-margin-top-alt":
                                case "mso-margin-right-alt":
                                case "mso-margin-bottom-alt":
                                case "mso-margin-left-alt":
                                case "mso-height":
                                case "mso-width":
                                case "mso-vertical-align-alt":
                                    /<table/.test(b) || (e[g] = i.replace(/^mso-|-alt$/g, "") + ":" + transUnit(j));
                                    continue;
                                case "horiz-align":
                                    e[g] = "text-align:" + j;
                                    continue;
                                case "vert-align":
                                    e[g] = "vertical-align:" + j;
                                    continue;
                                case "font-color":
                                case "mso-foreground":
                                    e[g] = "color:" + j;
                                    continue;
                                case "mso-background":
                                case "mso-highlight":
                                    e[g] = "background:" + j;
                                    continue;
                                case "mso-default-height":
                                    e[g] = "min-height:" + transUnit(j);
                                    continue;
                                case "mso-default-width":
                                    e[g] = "min-width:" + transUnit(j);
                                    continue;
                                case "mso-padding-between-alt":
                                    e[g] = "border-collapse:separate;border-spacing:" + transUnit(j);
                                    continue;
                                case "text-line-through":
                                    ("single" == j || "double" == j) && (e[g] = "text-decoration:line-through");
                                    continue;
                                case "mso-zero-height":
                                    "yes" == j && (e[g] = "display:none");
                                    continue;
                                case "margin":
                                    if (!/[1-9]/.test(j)) continue
                            }
                            if (/^(mso|column|font-emph|lang|layout|line-break|list-image|nav|panose|punct|row|ruby|sep|size|src|tab-|table-border|text-(?:decor|trans)|top-bar|version|vnd|word-break)/.test(i) || /text\-indent|padding|margin/.test(i) && /\-[\d.]+/.test(j)) continue;
                            e[g] = i + ":" + k[1]
                        }
                    }
                    return b + (e.length ? ' style="' + e.join(";").replace(/;{2,}/g, ";") + '"' : "")
                })
            }
        };
        utils.each(["String", "Function", "Array", "Number", "RegExp", "Object", "Date"], function (a) {
            utils["is" + a] = function (b) {
                return Object.prototype.toString.apply(b) == "[object " + a + "]"
            }
        });
        _round = Math.round;
        K = {
            DEBUG: !1,
            VERSION: _VERSION,
            IE: _IE,
            GECKO: _GECKO,
            WEBKIT: _WEBKIT,
            OPERA: _OPERA,
            V: _V,
            TIME: _TIME,
            each: _each,
            isArray: _isArray,
            isFunction: _isFunction,
            inArray: _inArray,
            inString: _inString,
            trim: _trim,
            addUnit: _addUnit,
            removeUnit: _removeUnit,
            escape: _escape,
            unescape: _unescape,
            toCamel: _toCamel,
            toHex: _toHex,
            toMap: _toMap,
            toArray: _toArray,
            undef: _undef,
            invalidUrl: _invalidUrl,
            addParam: _addParam,
            extend: _extend,
            json: _json
        };
        _INLINE_TAG_MAP = _toMap("a,abbr,acronym,b,basefont,bdo,big,br,button,cite,code,del,dfn,em,font,i,img,input,ins,kbd,label,map,q,s,samp,select,small,span,strike,strong,sub,sup,textarea,tt,u,var"), _BLOCK_TAG_MAP = _toMap("address,applet,blockquote,body,center,dd,dir,div,dl,dt,fieldset,form,frameset,h1,h2,h3,h4,h5,h6,head,hr,html,iframe,ins,isindex,li,map,menu,meta,noframes,noscript,object,ol,p,pre,script,style,table,tbody,td,tfoot,th,thead,title,tr,ul,audio,video"), _SINGLE_TAG_MAP = _toMap("area,base,basefont,br,col,frame,hr,img,input,isindex,link,meta,param,embed,source"), _STYLE_TAG_MAP = _toMap("b,basefont,big,del,em,font,i,s,small,span,strike,strong,sub,sup,u"), _CONTROL_TAG_MAP = _toMap("img,table,input,textarea,button"), _PRE_TAG_MAP = _toMap("pre,style,script"), _NOSPLIT_TAG_MAP = _toMap("html,head,body,td,tr,table,ol,ul,li"), _AUTOCLOSE_TAG_MAP = _toMap("colgroup,dd,dt,li,options,p,td,tfoot,th,thead,tr"), _FILL_ATTR_MAP = _toMap("checked,compact,declare,defer,disabled,ismap,multiple,nohref,noresize,noshade,nowrap,readonly,selected"), _NO_REPLACE_ATTR_MAP = _toMap("data-src,last,xz,tag"), _VALUE_TAG_MAP = _toMap("input,button,textarea,select"), _BLOCK_TAG_MAP_ = _toMap("address,applet,blockquote,center,dl,div,fieldset,form,frameset,h1,h2,h3,h4,h5,h6,head,ins,ul,map,menu,meta,object,ol,p,pre,table,td,tfoot,th,thead,tr,header,section,nav,footer,li"), _NO_DELETE = _toMap("a,input,button,select,b");
        K.rootPath = _getRootPath();
        K.basePath = _getBasePath();
        K.options = {
            designMode: !0,
            controlOuterHTML: !0,
            sourceCodemirror: !0,
            fullscreenMode: !1,
            filterMode: !1,
            wellFormatMode: !0,
            shadowMode: !0,
            loadStyleMode: !0,
            basePath: K.basePath,
            themesPath: K.basePath + "themes/",
            langPath: K.basePath + "lang/",
            pluginsPath: K.basePath + "plugins/",
            themeType: "default",
            langType: "zh_CN",
            urlType: "",
            newlineTag: "p",
            resizeType: 2,
            uploadJson: "Handler/upload_json.ashx",
            fileManagerJson: "Handler/file_manager_json.ashx",
            allowFileManager: !0,
            allowImageUpload: !0,
            allowPreviewEmoticons: !0,
            fillDescAfterUploadImage: !0,
            syncType: "form",
            pasteType: 2,
            dialogAlignType: "page",
            useContextmenu: !0,
            fullscreenShortcut: !1,
            bodyClass: "ke-content",
            indentChar: "	",
            cssPath: "/manager/NSWEditor/Css/reset.css",
            cssData: "",
            minWidth: 650,
            minHeight: 100,
            minChangeSize: 50,
            zIndex: 811213,
            items: ["source", "|", "undo", "redo", "|", "cut", "copy", "paste", "plainpaste", "wordpaste", "|", "justifyleft", "justifycenter", "justifyright", "justifyfull", "insertorderedlist", "insertunorderedlist", "indent", "subscript", "superscript", "clearhtml", "typesetting", "selectall", "fullscreen", "/", "formatblock", "fontname", "fontsize", "|", "forecolor", "hilitecolor", "bold", "italic", "underline", "strikethrough", "lineheight", "removeformat", "|", "multiimage", "flash", "media", "insertfile", "table", "hr", "emoticons", "baidumap", "pagebreak", "anchor", "link", "unlink", "|", "spechars", "|", "preview"],
            noDisableItems: ["source", "fullscreen"],
            colorTable: [["#000000", "#E56600", "#64451D", "#DFC5A4", "#FFE500", "#009900", "#006600", "#99BB00"], ["#337FE5", "#003399", "#4C33E5", "#9933E5", "#CC33E5", "#EE33EE", "#666666", "#6666ff"], ["#E53333", "#993300", "#333300", "#003300", "#003366", "#000080", "#333399", "#333333"], ["#800000", "#FF6600", "#808000", "#008080", "#0000FF", "#666699", "#CCFFFF", "#CCFFCC"], ["#FF0000", "#FF9900", "#99CC00", "#339966", "#33CCCC", "#3366FF", "#800080", "#99CCFF"], ["#FF00FF", "#FFCC00", "#FFFF00", "#00FF00", "#00FFFF", "#00CCFF", "#993366", "#CC99FF"], ["#FF99CC", "#FFCC99", "#FFFF99", "#808080", "#999999", "#C0C0C0", "#CCCCCC", "#FFFFFF"]],
            fontSizeTable: ["9px", "10px", "12px", "14px", "16px", "18px", "24px", "32px"],
            htmlTags: {
                font: ["color", "size", "face", ".background-color", "class"],
                span: ["style", "class", "id", "onclick"],
                div: ["class", "align", "style", "id", "data-src", "fn"],
                table: ["class", "border", "cellspacing", "cellpadding", "width", "height", "align", "style", "align", "bgcolor", "id", "frame", "rules", "summary"],
                "td,th": ["class", "align", "valign", "width", "height", "colspan", "rowspan", "bgcolor", "style", "id"],
                a: ["class", "href", "target", "name", "style", "title", "id", "onclick"],
                "img,section": ["src", "width", "height", "id", "border", "alt", "title", "align", "style", "class", "templocation", "sid", "columns", "cssname", "orderby", "sqlwhere", "columnname", "columnnameurl", "selectcount", "controltype", "datatype", "controid", "cwidth", "cheight", "oid", "/", "onclick"],
                hr: ["class", "/"],
                br: ["/"],
                "p,ol,ul,li,blockquote,h1,h2,h3,h4,h5,h6": ["align", "style", "class", "id", "onclick"],
                "strong,b,sub,sup,em,i,u,strike,tr": ["style", "class", "id"],
                dl: ["class", "style", "id"],
                dt: ["class", "style", "id"],
                dd: ["class", "style", "id"],
                ul: ["class", "style", "id", "data-src", "fn"],
                li: ["class", "style", "id"],
                iframe: ["src", "width", "height", "style", "frameborder", "data-ke-src", "class"],
                style: ["type", "oid"],
                script: ["src", "type", "oid"],
                object: ["codebase", "classid", "width", "height"],
                param: ["name", "value"],
                embed: ["src", "allowfullscreen", "loop", "style", "autostart", "flashvars", "quality", "pluginspage", "type", "width", "height", "wmode", "align", "allowscriptaccess"]
            },
            layout: '<div class="container"><div class="other container_top dn"></div><div class="tab container_top dn"></div><div class="reversals dn"></div><div class="toolbar"></div><div class="edit"></div><div class="position container_bottom"></div><div class="btns container_bottom dn"></div><div class="statusbar"></div></div>',
            SimpleMode: !1
        };
        _useCapture = !1;
        _INPUT_KEY_MAP = _toMap("8,9,13,32,46,48..57,59,61,65..90,106,109..111,188,190..192,219..222");
        _CURSORMOVE_KEY_MAP = _toMap("33..40");
        _CHANGE_KEY_MAP = {};
        _each(_INPUT_KEY_MAP, function (a, b) {
            _CHANGE_KEY_MAP[a] = b
        });
        _each(_CURSORMOVE_KEY_MAP, function (a, b) {
            _CHANGE_KEY_MAP[a] = b
        });
        _ExcludeStyle = {
            "line-height": "\\d+.\\d{3,}(px)?",
            outline: "none",
            "white-space": "normal",
            "text-decoration": "none",
            "letter-spacing": "normal",
            "word-spacing": "0px",
            "text-transform": "none",
            "background-color": "initial"
        };
        K.Exclude = {};
        K.Exclude.ExcludeCsssTag = {"*": _ExcludeStyle, span: {}, div: {}};
        _EVENT_PROPS = "altKey,attrChange,attrName,bubbles,button,cancelable,charCode,clientX,clientY,ctrlKey,currentTarget,data,detail,eventPhase,fromElement,handler,keyCode,metaKey,newValue,offsetX,offsetY,originalTarget,pageX,pageY,prevValue,relatedNode,relatedTarget,screenX,screenY,shiftKey,srcElement,target,toElement,view,wheelDelta,which".split(",");
        _extend(KEvent, {
            init: function (a, b) {
                var e, f, c = this, d = a.ownerDocument || a.document || a;
                c.event = b;
                _each(_EVENT_PROPS, function (a, d) {
                    c[d] = b[d]
                });
                c.target || (c.target = c.srcElement || d);
                3 === c.target.nodeType && (c.target = c.target.parentNode);
                !c.relatedTarget && c.fromElement && (c.relatedTarget = c.fromElement === c.target ? c.toElement : c.fromElement);
                if (null == c.pageX && null != c.clientX) {
                    e = d.documentElement, f = d.body;
                    c.pageX = c.clientX + (e && e.scrollLeft || f && f.scrollLeft || 0) - (e && e.clientLeft || f && f.clientLeft || 0);
                    c.pageY = c.clientY + (e && e.scrollTop || f && f.scrollTop || 0) - (e && e.clientTop || f && f.clientTop || 0)
                }
                !c.which && (c.charCode || 0 === c.charCode ? c.charCode : c.keyCode) && (c.which = c.charCode || c.keyCode);
                !c.metaKey && c.ctrlKey && (c.metaKey = c.ctrlKey);
                c.which || c.button === undefined || (c.which = 1 & c.button ? 1 : 2 & c.button ? 3 : 4 & c.button ? 2 : 0);
                switch (c.which) {
                    case 186:
                        c.which = 59;
                        break;
                    case 187:
                    case 107:
                    case 43:
                        c.which = 61;
                        break;
                    case 189:
                    case 45:
                        c.which = 109;
                        break;
                    case 42:
                        c.which = 106;
                        break;
                    case 47:
                        c.which = 111;
                        break;
                    case 78:
                        c.which = 110
                }
                c.which >= 96 && c.which <= 105 && (c.which -= 48)
            }, preventDefault: function () {
                var a = this.event;
                a.preventDefault ? a.preventDefault() : a.returnValue = !1
            }, stopPropagation: function () {
                var a = this.event;
                a.stopPropagation ? a.stopPropagation() : a.cancelBubble = !0
            }, stop: function () {
                this.preventDefault();
                this.stopPropagation()
            }
        });
        _eventExpendo = "kindeditor_" + _TIME, _eventId = 0, _eventData = {};
        _readyFinished = !1;
        _IE && (window.attachEvent ? window.attachEvent("onunload", function () {
            _each(_eventData, function (a, b) {
                b.el && _unbind(b.el)
            })
        }) : window.addEventListener && window.addEventListener("onunload", function () {
            _each(_eventData, function (a, b) {
                b.el && _unbind(b.el)
            })
        }));
        K.ctrl = _ctrl;
        K.ready = _ready;
        K.formatUrl = _formatUrl;
        K.formatHtml = _formatHtml;
        K.getCssList = _getCssList;
        K.getAttrList = _getAttrList;
        K.mediaType = _mediaType;
        K.mediaAttrs = _mediaAttrs;
        K.mediaEmbed = _mediaEmbed;
        K.mediaImg = _mediaImg;
        K.clearMsWord = _clearMsWord;
        K.tmpl = _tmpl;
        _getSetAttrDiv = document.createElement("div");
        _getSetAttrDiv.setAttribute("className", "t");
        _GET_SET_ATTRIBUTE = "t" !== _getSetAttrDiv.className;
        K.query = _query;
        K.queryAll = _queryAll;
        _extend(KNode, {
            init: function (a) {
                var c, d, e, b = this;
                a = _isArray(a) ? a : [a];
                c = 0;
                for (d = 0, e = a.length; e > d; d++) if (a[d]) {
                    b[d] = a[d].constructor === KNode ? a[d][0] : a[d];
                    c++
                }
                b.length = c;
                b.doc = _getDoc(b[0]);
                b.name = _getNodeName(b[0]);
                b.type = b.length > 0 ? b[0].nodeType : null;
                b.win = _getWin(b[0])
            }, each: function (a) {
                var c, b = this;
                for (c = 0; c < b.length; c++) if (a.call(b[c], c, b[c]) === !1) return b;
                return b
            }, bind: function (a, b) {
                this.each(function () {
                    _bind(this, a, b)
                });
                return this
            }, unbind: function (a, b) {
                this.each(function () {
                    _unbind(this, a, b)
                });
                return this
            }, fire: function (a) {
                if (this.length < 1) return this;
                _fire(this[0], a);
                return this
            }, hasAttr: function (a) {
                return this.length < 1 ? !1 : !!_getAttr(this[0], a)
            }, attr: function (a, b) {
                var c = this;
                if (a === undefined) return _getAttrList(c.outer());
                if ("object" == typeof a) {
                    _each(a, function (a, b) {
                        c.attr(a, b)
                    });
                    return c
                }
                if (b === undefined) {
                    b = c.length < 1 ? null : _getAttr(c[0], a);
                    return null === b ? "" : b
                }
                c.each(function () {
                    _setAttr(this, a, b)
                });
                return c
            }, removeAttr: function (a) {
                this.each(function () {
                    _removeAttr(this, a)
                });
                return this
            }, get: function (a) {
                return this.length < 1 ? null : this[a || 0]
            }, eq: function (a) {
                return this.length < 1 ? null : this[a] ? new KNode(this[a]) : null
            }, hasClass: function (a) {
                return this.length < 1 ? !1 : _hasClass(this[0], a)
            }, addClass: function (a) {
                this.each(function () {
                    _hasClass(this, a) || (this.className = _trim(this.className + " " + a))
                });
                return this
            }, removeClass: function (a) {
                this.each(function () {
                    _hasClass(this, a) && (this.className = _trim(this.className.replace(new RegExp("(^|\\s)" + a + "(\\s|$)"), " ")))
                });
                return this
            }, html: function (a) {
                var b = this;
                if (a === undefined) return b.length < 1 || 1 != b.type ? "" : _formatHtml(b[0].innerHTML);
                b.each(function () {
                    _setHtml(this, a)
                });
                return b
            }, text: function () {
                var a = this;
                return a.length < 1 ? "" : _IE ? a[0].innerText : a[0].textContent
            }, hasVal: function () {
                return this.length < 1 ? !1 : _hasVal(this[0])
            }, val: function (a) {
                var b = this;
                if (a === undefined) return b.length < 1 ? "" : b.hasVal() ? b[0].value : b.attr("value");
                b.each(function () {
                    _hasVal(this) ? this.value = a : _setAttr(this, "value", a)
                });
                return b
            }, css: function (a, b) {
                var c = this;
                if (a === undefined) return _getCssList(c.attr("style"));
                if ("object" == typeof a) {
                    _each(a, function (a, b) {
                        c.css(a, b)
                    });
                    return c
                }
                if (b === undefined) return c.length < 1 ? "" : c[0].style[_toCamel(a)] || _computedCss(c[0], a) || "";
                c.each(function () {
                    this.style[_toCamel(a)] = b
                });
                return c
            }, width: function (a) {
                var b = this;
                return a === undefined ? b.length < 1 ? 0 : b[0].offsetWidth : b.css("width", _addUnit(a))
            }, height: function (a) {
                var b = this;
                return a === undefined ? b.length < 1 ? 0 : b[0].offsetHeight : b.css("height", _addUnit(a))
            }, opacity: function (a) {
                this.each(function () {
                    this.style.opacity === undefined ? this.style.filter = 1 == a ? "" : "alpha(opacity=" + 100 * a + ")" : this.style.opacity = 1 == a ? "" : a
                });
                return this
            }, data: function (a, b) {
                var c = this;
                a = "kindeditor_data_" + a;
                if (b === undefined) return c.length < 1 ? null : c[0][a];
                this.each(function () {
                    this[a] = b
                });
                return c
            }, pos: function () {
                var e, f, a = this, b = a[0], c = 0, d = 0;
                if (b) if (b.getBoundingClientRect) {
                    e = b.getBoundingClientRect(), f = _getScrollPos(a.doc);
                    c = e.left + f.x;
                    d = e.top + f.y
                } else for (; b;) {
                    c += b.offsetLeft;
                    d += b.offsetTop;
                    b = b.offsetParent
                }
                return {x: _round(c), y: _round(d)}
            }, clone: function (a) {
                return this.length < 1 ? new KNode([]) : new KNode(this[0].cloneNode(a))
            }, append: function (a) {
                this.each(function () {
                    this.appendChild && this.appendChild(_get(a))
                });
                return this
            }, appendTo: function (a) {
                this.each(function () {
                    _get(a).appendChild(this)
                });
                return this
            }, before: function (a) {
                this.each(function () {
                    this.parentNode.insertBefore(_get(a), this)
                });
                return this
            }, after: function (a) {
                this.each(function () {
                    this.nextSibling ? this.parentNode.insertBefore(_get(a), this.nextSibling) : this.parentNode.appendChild(_get(a))
                });
                return this
            }, replaceWith: function (a) {
                var b = [];
                this.each(function (c, d) {
                    _unbind(d);
                    var e = _get(a);
                    d.parentNode.replaceChild(e, d);
                    b.push(e)
                });
                return K(b)
            }, empty: function () {
                var a = this;
                a.each(function (a, b) {
                    for (var d, c = b.firstChild; c;) {
                        if (!b.parentNode) return;
                        d = c.nextSibling;
                        c.parentNode.removeChild(c);
                        c = d
                    }
                });
                return a
            }, remove: function (a) {
                var b = this;
                b.each(function (c, d) {
                    var e, f;
                    if (d.parentNode) {
                        _unbind(d);
                        if (a) {
                            e = d.firstChild;
                            for (; e;) {
                                f = e.nextSibling;
                                d.parentNode.insertBefore(e, d);
                                e = f
                            }
                        }
                        d.parentNode.removeChild(d);
                        delete b[c]
                    }
                });
                b.length = 0;
                return b
            }, show: function (a) {
                var b = this;
                a === undefined && (a = b._originDisplay || "");
                return "none" != b.css("display") ? b : b.css("display", a)
            }, hide: function () {
                var a = this;
                if (a.length < 1) return a;
                a._originDisplay = a[0].style.display;
                return a.css("display", "none")
            }, outer: function () {
                var c, b, a = this;
                if (a.length < 1) return "";
                b = a.doc.createElement("div");
                b.appendChild(a[0].cloneNode(!0));
                c = _formatHtml(b.innerHTML);
                b = null;
                return c
            }, isSingle: function () {
                return !!_SINGLE_TAG_MAP[this.name]
            }, isInline: function () {
                return !!_INLINE_TAG_MAP[this.name]
            }, isBlock: function () {
                return !!_BLOCK_TAG_MAP[this.name]
            }, isStyle: function () {
                return !!_STYLE_TAG_MAP[this.name]
            }, isControl: function () {
                return !!_CONTROL_TAG_MAP[this.name]
            }, contains: function (a) {
                return this.length < 1 ? !1 : _contains(this[0], _get(a))
            }, parent: function () {
                if (this.length < 1) return null;
                var a = this[0].parentNode;
                return a ? new KNode(a) : null
            }, children: function () {
                if (this.length < 1) return new KNode([]);
                for (var a = [], b = this[0].firstChild; b;) {
                    (3 != b.nodeType || "" !== _trim(b.nodeValue)) && a.push(b);
                    b = b.nextSibling
                }
                return new KNode(a)
            }, first: function () {
                var a = this.children();
                return a.length > 0 ? a.eq(0) : null
            }, last: function () {
                var a = this.children();
                return a.length > 0 ? a.eq(a.length - 1) : null
            }, index: function () {
                if (this.length < 1) return -1;
                for (var a = -1, b = this[0]; b;) {
                    a++;
                    b = b.previousSibling
                }
                return a
            }, prev: function () {
                if (this.length < 1) return null;
                var a = this[0].previousSibling;
                return a ? new KNode(a) : null
            }, next: function () {
                if (this.length < 1) return null;
                var a = this[0].nextSibling;
                return a ? new KNode(a) : null
            }, scan: function (a, b) {
                function c(d) {
                    for (var f, e = b ? d.firstChild : d.lastChild; e;) {
                        f = b ? e.nextSibling : e.previousSibling;
                        if (a(e) === !1) return !1;
                        if (c(e) === !1) return !1;
                        e = f
                    }
                }

                if (!(this.length < 1)) {
                    b = b === undefined ? !0 : b;
                    c(this[0]);
                    return this
                }
            }
        });
        _each("blur,focus,focusin,focusout,load,resize,scroll,unload,click,dblclick,mousedown,mouseup,mousemove,mouseover,mouseout,mouseenter,mouseleave,change,select,submit,keydown,keypress,keyup,error,contextmenu".split(","), function (a, b) {
            KNode.prototype[b] = function (a) {
                return a ? this.bind(b, a) : this.fire(b)
            }
        });
        _K = K;
        K = function (a, b) {
            function c(a) {
                a[0] || (a = []);
                return new KNode(a)
            }

            var d, e, f, g, h, i, j;
            if (a !== undefined && null !== a) {
                if ("string" == typeof a) {
                    b && (b = _get(b));
                    d = a.length;
                    "@" === a.charAt(0) && (a = a.substr(1));
                    if (a.length !== d || /<.+>/.test(a)) {
                        e = b ? b.ownerDocument || b : document, f = e.createElement("div"), g = [];
                        f.innerHTML = '<img id="__kindeditor_temp_tag__" width="0" height="0" style="display:none;" />' + a;
                        for (h = 0, i = f.childNodes.length; i > h; h++) {
                            j = f.childNodes[h];
                            "__kindeditor_temp_tag__" != j.id && g.push(j)
                        }
                        return c(g)
                    }
                    return c(_queryAll(a, b))
                }
                if (a && a.constructor === KNode) return a;
                a.toArray && (a = a.toArray());
                return _isArray(a) ? c(a) : c(_toArray(arguments))
            }
        };
        _each(_K, function (a, b) {
            K[a] = b
        });
        K.NodeClass = KNode;
        window.KindEditor = K;
        _START_TO_START = 0, _START_TO_END = 1, _END_TO_END = 2, _END_TO_START = 3, _BOOKMARK_ID = 0;
        _extend(KRange, {
            init: function (a) {
                var b = this;
                b.startContainer = a;
                b.startOffset = 0;
                b.endContainer = a;
                b.endOffset = 0;
                b.collapsed = !0;
                b.doc = a
            }, commonAncestor: function () {
                function a(a) {
                    for (var b = []; a;) {
                        b.push(a);
                        a = a.parentNode
                    }
                    return b
                }

                for (var g, h, b = a(this.startContainer), c = a(this.endContainer), d = 0, e = b.length, f = c.length; ++d;) {
                    g = b[e - d];
                    h = c[f - d];
                    if (!g || !h || g !== h) break
                }
                return b[e - d + 1]
            }, setStart: function (a, b) {
                var c = this, d = c.doc;
                c.startContainer = a;
                c.startOffset = b;
                if (c.endContainer === d) {
                    c.endContainer = a;
                    c.endOffset = b
                }
                return _updateCollapsed(this)
            }, setEnd: function (a, b) {
                var c = this, d = c.doc;
                c.endContainer = a;
                c.endOffset = b;
                if (c.startContainer === d) {
                    c.startContainer = a;
                    c.startOffset = b
                }
                return _updateCollapsed(this)
            }, setStartBefore: function (a) {
                return this.setStart(a.parentNode || this.doc, K(a).index())
            }, setStartAfter: function (a) {
                return this.setStart(a.parentNode || this.doc, K(a).index() + 1)
            }, setEndBefore: function (a) {
                return this.setEnd(a.parentNode || this.doc, K(a).index())
            }, setEndAfter: function (a) {
                return this.setEnd(a.parentNode || this.doc, K(a).index() + 1)
            }, selectNode: function (a) {
                return this.setStartBefore(a).setEndAfter(a)
            }, selectNodeContents: function (a) {
                var c, b = K(a);
                if (3 == b.type || b.isSingle()) return this.selectNode(a);
                c = b.children();
                return c.length > 0 ? this.setStartBefore(c[0]).setEndAfter(c[c.length - 1]) : this.setStart(a, 0).setEnd(a, 0)
            }, collapse: function (a) {
                return a ? this.setEnd(this.startContainer, this.startOffset) : this.setStart(this.endContainer, this.endOffset)
            }, compareBoundaryPoints: function (a, b) {
                var e, f, g, h, i, j, k, l, c = this.get(), d = b.get();
                if (!_IERANGE) return c.compareBoundaryPoints(a, d);
                e = {};
                e[_START_TO_START] = "StartToStart";
                e[_START_TO_END] = "EndToStart";
                e[_END_TO_END] = "EndToEnd";
                e[_END_TO_START] = "StartToEnd";
                f = c.compareEndPoints(e[a], d);
                if (0 !== f) return f;
                if (a === _START_TO_START || a === _END_TO_START) {
                    g = this.startContainer;
                    j = this.startOffset
                }
                if (a === _START_TO_END || a === _END_TO_END) {
                    g = this.endContainer;
                    j = this.endOffset
                }
                if (a === _START_TO_START || a === _START_TO_END) {
                    h = b.startContainer;
                    k = b.startOffset
                }
                if (a === _END_TO_END || a === _END_TO_START) {
                    h = b.endContainer;
                    k = b.endOffset
                }
                if (g === h) {
                    l = j - k;
                    return l > 0 ? 1 : 0 > l ? -1 : 0
                }
                i = h;
                for (; i && i.parentNode !== g;) i = i.parentNode;
                if (i) return K(i).index() >= j ? -1 : 1;
                i = g;
                for (; i && i.parentNode !== h;) i = i.parentNode;
                if (i) return K(i).index() >= k ? 1 : -1;
                i = K(h).next();
                if (i && i.contains(g)) return 1;
                i = K(g).next();
                return i && i.contains(h) ? -1 : void 0
            }, cloneRange: function () {
                return new KRange(this.doc).setStart(this.startContainer, this.startOffset).setEnd(this.endContainer, this.endOffset)
            }, toString: function () {
                var a = this.get(), b = _IERANGE ? a.text : a.toString();
                return b.replace(/\r\n|\n|\r/g, "")
            }, cloneContents: function () {
                return _copyAndDelete(this, !0, !1)
            }, deleteContents: function () {
                return _copyAndDelete(this, !1, !0)
            }, extractContents: function () {
                return _copyAndDelete(this, !0, !0)
            }, insertNode: function (a) {
                var g, h, i, b = this, c = b.startContainer, d = b.startOffset, e = b.endContainer, f = b.endOffset,
                    j = 1;
                if ("#document-fragment" === a.nodeName.toLowerCase()) {
                    g = a.firstChild;
                    h = a.lastChild;
                    j = a.childNodes.length
                }
                if (1 == c.nodeType) {
                    i = c.childNodes[d];
                    if (i) {
                        c.insertBefore(a, i);
                        c === e && (f += j)
                    } else c.appendChild(a)
                } else if (3 == c.nodeType) if (0 === d) {
                    c.parentNode.insertBefore(a, c);
                    c.parentNode === e && (f += j)
                } else if (d >= c.nodeValue.length) c.nextSibling ? c.parentNode && c.parentNode.insertBefore && c.parentNode.insertBefore(a, c.nextSibling) : c.parentNode && c.parentNode.appendChild && c.parentNode.appendChild(a); else {
                    i = d > 0 ? c.splitText(d) : c;
                    c.parentNode.insertBefore(a, i);
                    if (c === e) {
                        e = i;
                        f -= d
                    }
                }
                g ? b.setStartBefore(g).setEndAfter(h) : b.selectNode(a);
                return b.compareBoundaryPoints(_END_TO_END, b.cloneRange().setEnd(e, f)) >= 1 ? b : b.setEnd(e, f)
            }, surroundContents: function (a) {
                a.appendChild(this.extractContents());
                return this.insertNode(a).selectNode(a)
            }, isControl: function () {
                var a = this, b = a.startContainer, c = a.startOffset, d = a.endContainer, e = a.endOffset;
                return 1 == b.nodeType && b === d && c + 1 === e && K(b.childNodes[c]).isControl()
            }, get: function (a) {
                var e, g, b = this, c = b.doc;
                if (!_IERANGE) {
                    e = c.createRange();
                    try {
                        e.setStart(b.startContainer, b.startOffset);
                        e.setEnd(b.endContainer, b.endOffset)
                    } catch (f) {
                    }
                    return e
                }
                if (a && b.isControl()) {
                    e = c.body.createControlRange();
                    e.addElement(b.startContainer.childNodes[b.startOffset]);
                    return e
                }
                g = b.cloneRange().down();
                e = c.body.createTextRange();
                e.setEndPoint("StartToStart", _getEndRange(g.startContainer, g.startOffset));
                e.setEndPoint("EndToStart", _getEndRange(g.endContainer, g.endOffset));
                return e
            }, html: function () {
                return K(this.cloneContents()).outer()
            }, down: function () {
                function b(b, c, d) {
                    var e, f, g, h, i;
                    if (1 == b.nodeType) {
                        e = K(b).children();
                        if (0 !== e.length) {
                            c > 0 && (f = e.eq(c - 1));
                            c < e.length && (g = e.eq(c));
                            if (f && 3 == f.type) {
                                h = f[0];
                                i = h.nodeValue.length
                            }
                            if (g && 3 == g.type) {
                                h = g[0];
                                i = 0
                            }
                            h && (d ? a.setStart(h, i) : a.setEnd(h, i))
                        }
                    }
                }

                var a = this;
                b(a.startContainer, a.startOffset, !0);
                b(a.endContainer, a.endOffset, !1);
                return a
            }, up: function () {
                function b(b, c, d) {
                    3 == b.nodeType && (0 === c ? d ? a.setStartBefore(b) : a.setEndBefore(b) : c == b.nodeValue.length && (d ? a.setStartAfter(b) : a.setEndAfter(b)))
                }

                var a = this;
                b(a.startContainer, a.startOffset, !0);
                b(a.endContainer, a.endOffset, !1);
                return a
            }, enlarge: function (a) {
                function c(c, d, e) {
                    var g, f = K(c);
                    if (!(3 == f.type || _NOSPLIT_TAG_MAP[f.name] || !a && f.isBlock())) if (0 === d) {
                        for (; !f.prev();) {
                            g = f.parent();
                            if (!g || _NOSPLIT_TAG_MAP[g.name] || !a && g.isBlock()) break;
                            f = g
                        }
                        e ? b.setStartBefore(f[0]) : b.setEndBefore(f[0])
                    } else if (d == f.children().length) {
                        for (; !f.next();) {
                            g = f.parent();
                            if (!g || _NOSPLIT_TAG_MAP[g.name] || !a && g.isBlock()) break;
                            f = g
                        }
                        e ? b.setStartAfter(f[0]) : b.setEndAfter(f[0])
                    }
                }

                var b = this;
                b.up();
                c(b.startContainer, b.startOffset, !0);
                c(b.endContainer, b.endOffset, !1);
                return b
            }, shrink: function () {
                for (var b, a = this, c = a.collapsed; 1 == a.startContainer.nodeType && (b = a.startContainer.childNodes[a.startOffset]) && 1 == b.nodeType && !K(b).isSingle();) a.setStart(b, 0);
                if (c) return a.collapse(c);
                for (; 1 == a.endContainer.nodeType && a.endOffset > 0 && (b = a.endContainer.childNodes[a.endOffset - 1]) && 1 == b.nodeType && !K(b).isSingle();) a.setEnd(b, b.childNodes.length);
                return a
            }, createBookmark: function (a) {
                var d, b = this, c = b.doc, e = K('<span style="display:none;"></span>', c)[0];
                e.id = "__kindeditor_bookmark_start_" + _BOOKMARK_ID++ + "__";
                if (!b.collapsed) {
                    d = e.cloneNode(!0);
                    d.id = "__kindeditor_bookmark_end_" + _BOOKMARK_ID++ + "__"
                }
                d && b.cloneRange().collapse(!1).insertNode(d).setEndBefore(d);
                b.insertNode(e).setStartAfter(e);
                return {start: a ? "#" + e.id : e, end: d ? a ? "#" + d.id : d : null}
            }, moveToBookmark: function (a) {
                var b = this, c = b.doc, d = K(a.start, c), e = a.end ? K(a.end, c) : null;
                if (!d || d.length < 1) return b;
                b.setStartBefore(d[0]);
                d.remove();
                if (e && e.length > 0) {
                    b.setEndBefore(e[0]);
                    e.remove()
                } else b.collapse(!0);
                return b
            }, dump: function () {
                console.log("--------------------");
                console.log(3 == this.startContainer.nodeType ? this.startContainer.nodeValue : this.startContainer, this.startOffset);
                console.log(3 == this.endContainer.nodeType ? this.endContainer.nodeValue : this.endContainer, this.endOffset)
            }
        });
        K.RangeClass = KRange;
        K.range = _range;
        K.START_TO_START = _START_TO_START;
        K.START_TO_END = _START_TO_END;
        K.END_TO_END = _END_TO_END;
        K.END_TO_START = _END_TO_START;
        K.KeyValues = {indent: "h1,h2,h3,h4,h5,h6,p,div"};
        SetTextAlign = function (a, b) {
            if (a) {
                a.css("text-indent", b ? null : "2em");
                if ("justify" === a.css("text-align")) try {
                    a.css("text-align", null);
                    a[0].removeAttribute("align")
                } catch (c) {
                    a[0].removeAttribute("align")
                }
            }
        };
        sites_ = {
            indent: function (a, b) {
                var f, h, i, j, d = this, e = {};
                e[K.KeyValues[b]] = "*";
                f = sites_.getindentStart.call(d, b);
                d.doc, d.range;
                if (f) {
                    h = _GetElements(d);
                    if (h.length) for (i = 0; i < h.length; i++) {
                        j = h[i];
                        j.css("text-indent") && j.css("text-indent", null)
                    }
                } else _nativeCommand(d, "justifyfull", null, null, function () {
                    var e, f, g, h, a = _GetElements(d);
                    if (a.length) {
                        K.KeyValues[b];
                        e = "text-align";
                        for (f = 0; f < a.length; f++) {
                            g = a[f];
                            h = g[h];
                            "justify" === g.css(e) && g.css(e, null).css("text-indent", "2em")
                        }
                    }
                });
                return d
            }, getindentStart: function (a) {
                var c, d, b = this;
                if (b.range.endOffset > 0) {
                    c = {};
                    c[K.KeyValues[a]] = ".text-indent=2em";
                    d = b.commonNode(c);
                    if (d) return !0
                }
                return !1
            }, justifycenter_end: function () {
                sites_.justifyfull_end_.call(this)
            }, justifyleft_end: function () {
                sites_.justifyfull_end_.call(this)
            }, justifyright_end: function () {
                sites_.justifyfull_end_.call(this)
            }, justifyfull_end: function () {
                sites_.justifyfull_end_.call(this)
            }, justifyfull_end_: function () {
                var e, f, g, h, a = this, b = _GetElements(a), c = null, d = null;
                for (e = 0; e < b.length; e++) {
                    f = b[e];
                    g = f.name;
                    if ("div,p".indexOf(g) > -1) {
                        h = f.attr("align") || f.css("text-align");
                        if (h) {
                            f.css("text-align", h);
                            "center" == h && f.css("text-indent", null)
                        }
                        if ("div" == g && !K("div,p", f).length && 0 == _GetElementAttrCount(f, null, {
                            "text-indent": function () {
                                return !0
                            }, "text-align": function () {
                                return !0
                            }
                        })) {
                            f.after("<p></p>");
                            c = f.next("p");
                            if (c && c.length) {
                                c.attr(f.attr()).html(f.html());
                                c.css("text-align", h);
                                c.css("line-height", null);
                                f.remove();
                                f = c;
                                null == d && (d = c)
                            }
                        }
                    }
                }
                if (c && c.length) {
                    a.range.setStartBefore(d[0]);
                    a.range.setEndAfter(c[0]);
                    a.select()
                }
                return a
            }
        };
        _extend(KCmd, {
            init: function (a) {
                var b = this, c = a.doc;
                b.doc = c;
                b.win = _getWin(c);
                b.sel = _getSel(c);
                b.range = a
            }, selection: function (a) {
                var b = this, c = b.doc, d = _getRng(c);
                b.sel = _getSel(c);
                if (d) {
                    b.range = _range(d);
                    "html" == K(b.range.startContainer).name && b.range.selectNodeContents(c.body).collapse(!1);
                    return b
                }
                a && b.range.selectNodeContents(c.body).collapse(!1);
                return b
            }, select: function (a) {
                var k, b, c, d, e, f, i, j, l, m, o, p;
                a = _undef(a, !0);
                b = this, c = b.sel, d = b.range.cloneRange().shrink(), e = d.startContainer, f = d.startOffset, i = (d.endContainer, d.endOffset, _getDoc(e)), j = b.win, l = !1;
                if (a && 1 == e.nodeType && d.collapsed) {
                    if (_IERANGE) {
                        m = K("<span>&nbsp;</span>", i);
                        d.insertNode(m[0]);
                        k = i.body.createTextRange();
                        try {
                            k.moveToElementText(m[0])
                        } catch (n) {
                        }
                        k.collapse(!1);
                        k.select();
                        m.remove();
                        j.focus();
                        return b
                    }
                    if (_WEBKIT) {
                        o = e.childNodes;
                        p = null;
                        if (K(e).isInline() || f > 0 && (p = K(o[f - 1])) && p["isInline"] && p.isInline() || o[f] && K(o[f]).isInline()) {
                            d.insertNode(i.createTextNode("​"));
                            l = !0
                        }
                    }
                }
                if (_IERANGE) try {
                    k = d.get(!0);
                    k.select()
                } catch (q) {
                } else {
                    l && d.collapse(!1);
                    k = d.get(!0);
                    if (c) {
                        c.removeAllRanges();
                        c.addRange(k)
                    }
                    i !== document && K(k.endContainer).pos()
                }
                j.focus();
                return b
            }, wrap: function (a) {
                var f, g, h, i, j, b = this, c = b.doc, d = b.range, e = K(a, c);
                if (d.collapsed) {
                    d.shrink();
                    d.insertNode(e[0]).selectNodeContents(e[0]);
                    return b
                }
                if (e.isBlock()) {
                    f = e.clone(!0), g = f;
                    for (; g.first();) g = g.first();
                    g.append(d.extractContents());
                    d.insertNode(f[0]).selectNode(f[0]);
                    return b
                }
                d.enlarge();
                h = d.createBookmark(), i = d.commonAncestor(), j = !1;
                K(i).scan(function (a) {
                    var b, c;
                    if (j || a != h.start) {
                        if (j) {
                            if (a == h.end) return !1;
                            b = K(a);
                            if (_inPreElement(b)) return;
                            if (3 == b.type && _trim(a.nodeValue).length > 0) {
                                for (; (c = b.parent()) && c.isStyle() && 1 == c.children().length;) b = c;
                                _wrapNode(b, e)
                            }
                        }
                    } else j = !0
                });
                d.moveToBookmark(h);
                return b
            }, split: function (a, b) {
                for (var j, k, l, m, n, o, p, q, c = this.range, d = c.doc, e = c.cloneRange().collapse(a), f = e.startContainer, g = e.startOffset, h = 3 == f.nodeType ? f.parentNode : f, i = !1; h && h.parentNode;) {
                    j = K(h);
                    if (b) {
                        if (!j.isStyle()) break;
                        if (!_hasAttrOrCss(j, b)) break
                    } else if (_NOSPLIT_TAG_MAP[j.name]) break;
                    i = !0;
                    h = h.parentNode
                }
                if (i) {
                    k = d.createElement("span");
                    c.cloneRange().collapse(!a).insertNode(k);
                    a ? e.setStartBefore(h.firstChild).setEnd(f, g) : e.setStart(f, g).setEndAfter(h.lastChild);
                    l = e.extractContents(), m = l.firstChild, n = l.lastChild;
                    if (a) {
                        e.insertNode(l);
                        c.setStartAfter(n).setEndBefore(k)
                    } else {
                        h.appendChild(l);
                        c.setStartBefore(k).setEndBefore(m)
                    }
                    o = k.parentNode;
                    if (o == c.endContainer) {
                        p = K(k).prev(), q = K(k).next();
                        p && q && 3 == p.type && 3 == q.type ? c.setEnd(p[0], p[0].nodeValue.length) : a || c.setEnd(c.endContainer, c.endOffset - 1)
                    }
                    o.removeChild(k)
                }
                return this
            }, remove: function (a) {
                var f, e, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, b = this, c = b.doc, d = b.range;
                d.enlarge();
                if (0 === d.startOffset) {
                    e = K(d.startContainer);
                    for (; (f = e.parent()) && f.isStyle() && 1 == f.children().length;) e = f;
                    d.setStart(e[0], 0);
                    e = K(d.startContainer);
                    e.isBlock() && _removeAttrOrCss(e, a);
                    g = e.parent();
                    g && g.isBlock() && _removeAttrOrCss(g, a)
                }
                if (d.collapsed) {
                    b.split(!0, a);
                    h = d.startContainer;
                    i = d.startOffset;
                    if (i > 0) {
                        j = K(h.childNodes[i - 1]);
                        if (j && _isEmptyNode(j)) {
                            j.remove();
                            d.setStart(h, i - 1)
                        }
                    }
                    k = K(h.childNodes[i]);
                    k && _isEmptyNode(k) && k.remove();
                    if (_isEmptyNode(h)) {
                        d.startBefore(h);
                        h.remove()
                    }
                    d.collapse(!0);
                    return b
                }
                b.split(!0, a);
                b.split(!1, a);
                l = c.createElement("span"), m = c.createElement("span");
                d.cloneRange().collapse(!1).insertNode(m);
                d.cloneRange().collapse(!0).insertNode(l);
                n = [], o = !1;
                K(d.commonAncestor()).scan(function (a) {
                    if (o || a != l) {
                        if (a == m) return !1;
                        o && n.push(a);
                        return void 0
                    }
                    o = !0
                });
                K(l).remove();
                K(m).remove();
                h = d.startContainer;
                i = d.startOffset;
                p = d.endContainer, q = d.endOffset;
                if (i > 0) {
                    r = K(h.childNodes[i - 1]);
                    if (r && _isEmptyNode(r)) {
                        r.remove();
                        d.setStart(h, i - 1);
                        h == p && d.setEnd(p, q - 1)
                    }
                    s = K(h.childNodes[i]);
                    if (s && _isEmptyNode(s)) {
                        s.remove();
                        h == p && d.setEnd(p, q - 1)
                    }
                }
                t = K(p.childNodes[d.endOffset]);
                t && _isEmptyNode(t) && t.remove();
                u = d.createBookmark(!0);
                _each(n, function (b, c) {
                    _removeAttrOrCss(K(c), a)
                });
                d.moveToBookmark(u);
                return b
            }, commonNode: function (a) {
                function f(b) {
                    for (var c = b, d = b; d;) {
                        if (_hasAttrOrCss(K(d), a)) return K(d);
                        d = d.parentNode
                    }
                    for (; c && (c = c.lastChild);) if (_hasAttrOrCss(K(c), a)) return K(c);
                    return null
                }

                var h, b = this.range, c = b.endContainer, d = b.endOffset,
                    e = 3 == c.nodeType || 0 === d ? c : c.childNodes[d - 1], g = f(e);
                if (g) return g;
                if (1 == e.nodeType || 3 == c.nodeType && 0 === d) {
                    h = K(e).prev();
                    if (h) return f(h)
                }
                return null
            }, commonAncestor_: function () {
                function i(a) {
                    for (; a;) {
                        if (1 == a.nodeType) {
                            var b = a.tagName.toLowerCase();
                            (_BLOCK_TAG_MAP_[b] || "body" != b && a.className) && h.push(a)
                        }
                        a = a.parentNode
                    }
                }

                var h, a = this.range, b = a.startContainer, c = a.startOffset, d = a.endContainer, e = a.endOffset,
                    f = 3 == b.nodeType || 0 === c ? b : b.childNodes[c - 1];
                3 == d.nodeType || 0 === e ? d : d.childNodes[e - 1];
                h = [];
                i(f);
                return 0 == h.length ? null : h
            }, commonAncestor: function (a) {
                function i(b) {
                    for (; b;) {
                        if (1 == b.nodeType && b.tagName.toLowerCase() === a) return b;
                        b = b.parentNode
                    }
                    return null
                }

                var b = this.range, c = b.startContainer, d = b.startOffset, e = b.endContainer, f = b.endOffset,
                    g = 3 == c.nodeType || 0 === d ? c : c.childNodes[d - 1],
                    h = 3 == e.nodeType || 0 === f ? e : e.childNodes[f - 1], j = i(g), k = i(h);
                return j && k && j === k ? K(j) : null
            }, state: function (a) {
                var c, d, e, b = !1;
                try {
                    c = "get" + a + "Start";
                    if (sites_[c]) b = sites_[c].call(this, a) || !1; else {
                        d = this, e = d.doc;
                        b = e.queryCommandState(a)
                    }
                } catch (f) {
                }
                return b
            }, val: function (a) {
                function e(a) {
                    return a.toLowerCase()
                }

                var g, f, b = this, c = b.doc;
                b.range;
                a = e(a);
                f = "";
                if ("fontfamily" === a || "fontname" === a) {
                    f = _nativeCommandValue(c, "fontname");
                    f = f.replace(/['"]/g, "");
                    return e(f)
                }
                if ("formatblock" === a) {
                    f = _nativeCommandValue(c, a);
                    if ("" === f) {
                        g = b.commonNode({"h1,h2,h3,h4,h5,h6,p,div,pre,address": "*"});
                        g && (f = g.name)
                    }
                    "Normal" === f && (f = "p");
                    return e(f)
                }
                if ("fontsize" === a) {
                    g = b.commonNode({"*": ".font-size"});
                    g && (f = g.css("font-size"));
                    return e(f)
                }
                if ("forecolor" === a) {
                    g = b.commonNode({"*": ".color"});
                    g && (f = g.css("color"));
                    f = _toHex(f);
                    "" === f && (f = "default");
                    return e(f)
                }
                if ("hilitecolor" === a) {
                    g = b.commonNode({"*": ".background-color"});
                    g && (f = g.css("background-color"));
                    f = _toHex(f);
                    "" === f && (f = "default");
                    return e(f)
                }
                return f
            }, toggle: function (a, b) {
                var c = this;
                c.commonNode(b) ? c.remove(b) : c.wrap(a);
                return c.select()
            }, bold: function () {
                return this.toggle("<b></b>", {span: ".font-weight=bold", strong: "*", b: "*"})
            }, italic: function () {
                return this.toggle("<em></em>", {span: ".font-style=italic", em: "*", i: "*"})
            }, underline: function () {
                return this.toggle("<u></u>", {span: ".text-decoration=underline", u: "*"})
            }, strikethrough: function () {
                return this.toggle("<s></s>", {span: ".text-decoration=line-through", s: "*"})
            }, forecolor: function (a) {
                return this.wrap('<span style="color:' + a + ';"></span>').select()
            }, hilitecolor: function (a) {
                return this.wrap('<span style="background-color:' + a + ';"></span>').select()
            }, fontsize: function (a) {
                return this.wrap('<span style="font-size:' + a + ';"></span>').select()
            }, fontname: function (a) {
                return this.fontfamily(a)
            }, fontfamily: function (a) {
                return this.wrap('<span style="font-family:' + a + ';"></span>').select()
            }, removeformat: function () {
                var a = {"*": ".font-weight,.font-style,.text-decoration,.color,.background-color,.font-size,.font-family,.text-indent"},
                    b = _STYLE_TAG_MAP;
                _each(b, function (b) {
                    a[b] = "*"
                });
                this.remove(a);
                return this.select()
            }, inserthtml: function (a, b) {
                function e(a, b) {
                    var d, e, f;
                    b = '<img id="__kindeditor_temp_tag__" width="0" height="0" style="display:none;" />' + b;
                    d = a.get();
                    d.item ? d.item(0).outerHTML = b : d.pasteHTML(b);
                    e = a.doc.getElementById("__kindeditor_temp_tag__");
                    e.parentNode.removeChild(e);
                    f = _toRange(d);
                    a.setEnd(f.endContainer, f.endOffset);
                    a.collapse(!1);
                    c.select(!1)
                }

                function f(a, b) {
                    var d = a.doc, e = d.createDocumentFragment();
                    K("@" + b, d).each(function () {
                        e.appendChild(this)
                    });
                    a.deleteContents();
                    a.insertNode(e);
                    a.collapse(!1);
                    c.select(!1)
                }

                var c = this, d = c.range;
                if ("" === a) return c;
                if (_IERANGE && b) {
                    try {
                        e(d, a)
                    } catch (g) {
                        f(d, a)
                    }
                    return c
                }
                f(d, a);
                return c
            }, hr: function () {
                return this.inserthtml("<hr />")
            }, print: function () {
                this.win.print();
                return this
            }, getimage: function (a, b, c, d, e, f, g, h, i) {
                b = _undef(b, "");
                i = _undef(i, !0);
                e = _undef(e, 0);
                var j = '<img src="' + _escape(a) + '" ';
                i && (j += 'data-ke-src="' + _escape(a) + '" ');
                c && "0" != c && (j += 'width="' + _escape(c) + '" ');
                d && "0" != d && (j += 'height="' + _escape(d) + '" ');
                b && (j += 'title="' + _escape(b) + '" ');
                f && (j += 'align="' + _escape(f) + '" ');
                g && (j += 'class="' + _escape(g) + '" ');
                j += 'alt="' + _escape(b) + '" ';
                j += "/>";
                h && (j = h.replace("{content}", j));
                return j
            }, insertimage: function (a, b, c, d, e, f, g, h) {
                return this.inserthtml(this.getimage(a, b, c, d, e, f, g, h))
            }, createlink: function (a, b, c, d) {
                function k(a, b, c, e) {
                    var g, f = K(a);
                    f.attr("href", b).attr("data-ke-src", b);
                    c && f.attr("title", c);
                    if (d) {
                        g = K.trim(f.text());
                        g != d && f.html(d)
                    }
                    e ? f.attr("target", e) : f.removeAttr("target")
                }

                var h, i, j, l, m, n, o, p, e = this, f = e.doc, g = e.range;
                e.select();
                h = e.commonNode({a: "*"});
                if (h && !g.isControl()) {
                    g.selectNode(h.get());
                    e.select()
                }
                !b && d && d != a && (b = d);
                i = '<a href="' + _escape(a) + '" data-ke-src="' + _escape(a) + '"';
                b && (i += ' title="' + _escape(b) + '"');
                c && (i += ' target="' + _escape(c) + '"');
                if (g.collapsed) {
                    i += d ? ">" + _escape(d) + "</a>" : ">" + _escape(a) + "</a>";
                    return e.inserthtml(i)
                }
                if (g.isControl()) {
                    j = K(g.startContainer.childNodes[g.startOffset]);
                    h = j.parent();
                    if ("a" == h.name) {
                        k(h, a, b, c);
                        g.selectNode(h[0])
                    } else {
                        i += "></a>";
                        j.after(K(i, f));
                        j.next().append(j);
                        g.selectNode(j[0])
                    }
                    return e.select()
                }
                l = g.startContainer, m = g.startOffset, n = g.endContainer, o = g.endOffset;
                if (1 == l.nodeType && l === n && m + 1 === o) {
                    p = l.childNodes[m];
                    if ("a" == p.nodeName.toLowerCase()) {
                        k(p, a, b, c);
                        return e
                    }
                }
                _nativeCommand(e, "createlink", "__kindeditor_temp_url__");
                K('a[href="__kindeditor_temp_url__"]', f).each(function () {
                    k(this, a, b, c)
                });
                return e
            }, unlink: function () {
                var d, e, a = this, c = (a.doc, a.range);
                a.select();
                if (c.collapsed) {
                    d = a.commonNode({a: "*"});
                    if (d) {
                        c.selectNode(d.get());
                        a.select()
                    }
                    _nativeCommand(a, "unlink", null);
                    if (_WEBKIT && "img" === K(c.startContainer).name) {
                        e = K(c.startContainer).parent();
                        "a" === e.name && e.remove(!0)
                    }
                } else _nativeCommand(a, "unlink", null);
                return a
            }
        });
        _each("formatblock,selectall,justifyleft,justifycenter,justifyright,justifyfull,insertorderedlist,insertunorderedlist,indent,subscript,superscript".split(","), function (a, b) {
            KCmd.prototype[b] = function (a) {
                var c = this;
                c.select();
                _nativeCommand(c, b, a);
                _IERANGE && _inArray(b, "justifyleft,justifycenter,indent,justifyright,justifyfull".split(",")) >= 0 && c.selection();
                (!_IERANGE || _inArray(b, "formatblock,selectall,insertorderedlist,insertunorderedlist".split(",")) >= 0) && c.selection();
                return c
            }
        });
        _each("cut,copy,paste".split(","), function (a, b) {
            KCmd.prototype[b] = function () {
                var a = this;
                if (!a.doc.queryCommandSupported(b)) throw "not supported";
                a.select();
                _nativeCommand(a, b, null);
                return a
            }
        });
        K.CmdClass = KCmd;
        K.cmd = _cmd;
        _extend(KWidget, {
            init: function (a) {
                var c, b = this;
                b.name = a.name || "";
                b.doc = a.doc || document;
                b.win = _getWin(b.doc);
                b.x = _addUnit(a.x);
                b.y = _addUnit(a.y);
                b.z = a.z;
                b.width = _addUnit(a.width);
                b.height = _addUnit(a.height);
                b.div = K('<div style="display:block;"></div>');
                b.options = a;
                b._alignEl = a.alignEl;
                b.width && b.div.css("width", b.width);
                b.height && b.div.css("height", b.height);
                b.z && b.div.css({position: "absolute", left: b.x, top: b.y, "z-index": b.z});
                !b.z || b.x !== undefined && b.y !== undefined || b.autoPos(b.width, b.height);
                a.cls && b.div.addClass(a.cls);
                a.shadowMode && b.div.addClass("ke-shadow");
                a.css && b.div.css(a.css);
                a.src ? K(a.src).replaceWith(b.div) : K(b.doc.body).append(b.div);
                a.html && b.div.html(a.html);
                if (a.autoScroll) if (_IE && 7 > _V || _QUIRKS) {
                    c = _getScrollPos();
                    K(b.win).bind("scroll", function () {
                        var d = _getScrollPos(), e = d.x - c.x, f = d.y - c.y;
                        b.pos(_removeUnit(b.x) + e, _removeUnit(b.y) + f, !1)
                    })
                } else {
                    b.div.css("position", "fixed");
                    "auto" === b.div.css("top") && b.div.css("top", b.y + "px")
                }
            }, pos: function (a, b, c) {
                var d = this;
                c = _undef(c, !0);
                if (null !== a) {
                    a = 0 > a ? 0 : _addUnit(a);
                    d.div.css("left", a);
                    c && (d.x = a)
                }
                if (null !== b) {
                    b = 0 > b ? 0 : _addUnit(b);
                    d.div.css("top", b);
                    c && (d.y = b)
                }
                return d
            }, autoPos: function (a, b) {
                var i, j, k, l, m, n, o, p, q, r, s, t, u, c = this, d = _removeUnit(a) || 0, e = _removeUnit(b) || 0,
                    f = _getScrollPos(), g = 0, h = 0;
                if (c._alignEl) {
                    i = K(c._alignEl), j = i.pos(), k = _round(i[0].clientWidth / 2 - d / 2), l = _round(i[0].clientHeight / 2 - e / 2);
                    g = 0 > k ? j.x : j.x + k;
                    h = 0 > l ? j.y : j.y + l
                } else {
                    m = _docElement(c.doc);
                    if (window.top === window.self) {
                        g = _round(f.x + (m.clientWidth - d) / 2);
                        h = _round(f.y + (m.clientHeight - e) / 2)
                    }
                }
                if (window.top !== window.self) {
                    m = _docElement(c.doc);
                    n = _docElement(window.top.document);
                    o = _getScrollPos(n).y;
                    p = _getScrollPos(m).x;
                    q = m.clientWidth;
                    r = n.clientHeight;
                    g = _round(p + (q - d) / 2);
                    s = $(n).find("#frmEditor");
                    t = 0;
                    if (s.length) t = s.offset().top; else {
                        u = window.self.location.href + "";
                        u = u.substr(u.lastIndexOf("/") + 1);
                        s = $(n).find("iframe[src*='" + u + "']");
                        s.length && (t = s.offset().top)
                    }
                    h = _round(o - t + (r - e) / 2)
                } else if (!(_IE && 7 > _V || _QUIRKS)) {
                    g -= f.x;
                    h -= f.y
                }
                return c.pos(g, h)
            }, remove: function () {
                var a = this;
                (_IE && 7 > _V || _QUIRKS) && K(a.win).unbind("scroll");
                a.div.remove();
                _each(a, function (b) {
                    a[b] = null
                });
                return this
            }, show: function () {
                this.div.show();
                return this
            }, hide: function () {
                this.div.hide();
                return this
            }, draggable: function (a) {
                var b = this;
                a = a || {};
                a.moveEl = b.div;
                a.moveFn = function (a, c, d, e, f, g) {
                    (a += f) < 0 && (a = 0);
                    (c += g) < 0 && (c = 0);
                    b.pos(a, c)
                };
                _drag(a);
                return b
            }
        });
        K.WidgetClass = KWidget;
        K.widget = _widget;
        _direction = "";
        (html = document.getElementsByTagName("html")) && (_direction = html[0].dir);
        _extend(KEdit, KWidget, {
            init: function (a) {
                function j() {
                    var i, j, k, h = _iframeDoc(b.iframe);
                    h.open();
                    g && (h.domain = document.domain);
                    i = {};
                    a.self && a.self.loadstyles && (i.loadstyles = a.self.loadstyles);
                    h.write(_getInitHtml(c, d, e, f, i));
                    h.close();
                    b.win = b.iframe[0].contentWindow;
                    b.doc = h;
                    j = _cmd(h);
                    if (b.doc.body) try {
                        k = b.srcElement.val();
                        k && (b.doc.body.innerHTML = k);
                        b.srcElement.val(b.doc.body.innerHTML)
                    } catch (l) {
                    }
                    b.afterChange(function () {
                        j.selection()
                    });
                    _WEBKIT && K(h).click(function (b) {
                        if ("img" === K(b.target).name) {
                            j.selection(!0);
                            j.range.selectNode(b.target);
                            j.select();
                            a.self && a.self.SetPosition()
                        }
                    });
                    if (_IE) {
                        b._mousedownHandler = function () {
                            var a = j.range.cloneRange();
                            a.shrink();
                            a.isControl() && b.blur()
                        };
                        K(document).mousedown(b._mousedownHandler);
                        K(h).keydown(function (a) {
                            if (8 == a.which) {
                                j.selection();
                                var b = j.range;
                                if (b.isControl()) {
                                    b.collapse(!0);
                                    K(b.startContainer.childNodes[b.startOffset]).remove();
                                    a.preventDefault()
                                }
                            }
                        })
                    }
                    b.cmd = j;
                    b.html(_elementVal(b.srcElement));
                    if (_IE) {
                        h.body.disabled = !0;
                        h.body.contentEditable = !0;
                        h.body.removeAttribute("disabled")
                    } else h.designMode = "on";
                    a.afterCreate && a.afterCreate.call(b)
                }

                var c, d, e, f, g, h, i, b = this;
                KEdit.parent.init.call(b, a);
                b.srcElement = K(a.srcElement);
                b.div.addClass("ke-edit");
                b.designMode = _undef(a.designMode, !0);
                b.beforeGetHtml = a.beforeGetHtml;
                b.beforeSetHtml = a.beforeSetHtml;
                b.afterSetHtml = a.afterSetHtml;
                c = _undef(a.themesPath, ""), d = a.bodyClass, e = a.cssPath, f = a.cssData, g = "res:" != location.protocol && location.host.replace(/:\d+/, "") !== document.domain, h = "document.open();" + (g ? 'document.domain="' + document.domain + '";' : "") + "document.close();", i = _IE ? ' src="javascript:void(function(){' + encodeURIComponent(h) + '}())"' : "";
                b.iframe = K('<iframe class="ke-edit-iframe" hidefocus="true" frameborder="0"' + i + "></iframe>").css("width", "100%");
                b.textarea = K('<textarea class="ke-edit-textarea" hidefocus="true"></textarea>').css("width", "100%");
                b.tabIndex = isNaN(parseInt(a.tabIndex, 10)) ? b.srcElement.attr("tabindex") : parseInt(a.tabIndex, 10);
                b.iframe.attr("tabindex", b.tabIndex);
                b.textarea.attr("tabindex", b.tabIndex);
                b.width && b.setWidth(b.width);
                b.height && b.setHeight(b.height);
                b.designMode ? b.textarea.hide() : b.iframe.hide();
                g && b.iframe.bind("load", function () {
                    b.iframe.unbind("load");
                    _IE ? j() : setTimeout(j, 0)
                });
                b.div.append(b.iframe);
                b.div.append(b.textarea);
                b.srcElement.hide();
                !g && j()
            }, setWidth: function (a) {
                var b = this;
                a = _addUnit(a);
                b.width = a;
                b.div.css("width", a);
                return b
            }, setHeight: function (a, b) {
                var c = this;
                a = _addUnit(a);
                c.height = a;
                c.div.css("height", a);
                c.iframe.css("height", a);
                (_IE && 8 > _V || _QUIRKS) && (a = _addUnit(_removeUnit(a) - 2));
                c.textarea.css("height", a);
                1 != b && window.top != window.self && window.top.SetHeight && window.top.SetHeight();
                return c
            }, remove: function () {
                var a = this, b = a.doc;
                K(b.body).unbind();
                K(b).unbind();
                K(a.win).unbind();
                a._mousedownHandler && K(document).unbind("mousedown", a._mousedownHandler);
                _elementVal(a.srcElement, a.html());
                a.srcElement.show();
                b.write("");
                a.iframe.unbind();
                a.textarea.unbind();
                KEdit.parent.remove.call(a)
            }, html: function (a, b, c) {
                var f, d = this, e = d.doc;
                if (d.designMode) {
                    f = e.body;
                    if (a === undefined) {
                        a = b ? "<!doctype html><html>" + f.parentNode.innerHTML + "</html>" : f.innerHTML;
                        d.beforeGetHtml && (a = d.beforeGetHtml(a));
                        _GECKO && "<br />" == a && (a = "");
                        return a
                    }
                    d.beforeSetHtml && (a = d.beforeSetHtml(a));
                    _IE && _V >= 9 && (a = a.replace(/(<.*?checked=")checked(".*>)/gi, "$1$2"));
                    K(f).html(a);
                    d.afterSetHtml && d.afterSetHtml();
                    return d
                }
                if (a === undefined) return d.textarea.val();
                d.textarea.val(a);
                0 !== c && d.CodeMirrorTextarea && d.CodeMirrorTextarea.val(a);
                return d
            }, design: function (a) {
                var c, d, b = this;
                if (a === undefined ? !b.designMode : a) {
                    if (!b.designMode) {
                        c = b.html();
                        b.designMode = !0;
                        b.html(c, null, 0);
                        b.textarea.hide();
                        b.iframe.show();
                        b.CodeMirrorTextarea && b.CodeMirrorTextarea.hide()
                    }
                } else if (b.designMode) {
                    if (K.options.sourceCodemirror && "undefined" != typeof CodeMirror && !b.CodeMirrorTextarea) {
                        d = $(b.textarea[0]);
                        b.CodeMirrorTextarea = K.CodemirrorTools.getCodemirror(d.parent(), function (a, c, d) {
                            if (d.isCodemirror) {
                                d.textarea.on("blur", function () {
                                    var a = b.CodeMirrorTextarea.val();
                                    b.html(a, null, 0)
                                });
                                a.find(".CodeMirror").css("height", a.height())
                            } else {
                                K.options.sourceCodemirror = !1;
                                setTimeout(function () {
                                    b.CodeMirrorTextarea = !1
                                }, 200)
                            }
                        }, d)
                    }
                    c = b.html();
                    b.designMode = !1;
                    b.html(c, null, 0);
                    b.CodeMirrorTextarea && b.CodeMirrorTextarea.val(c);
                    b.iframe.hide();
                    b.textarea.show();
                    if (b.CodeMirrorTextarea) {
                        b.textarea.hide();
                        b.CodeMirrorTextarea.show()
                    }
                }
                return b.focus()
            }, focus: function () {
                var a = this;
                a.designMode ? a.win.focus() : a.textarea[0].focus();
                return a
            }, blur: function () {
                var b, a = this;
                if (_IE) {
                    b = K('<input type="text" style="float:left;width:0;height:0;padding:0;margin:0;border:0;" value="" />', a.div);
                    a.div.append(b);
                    b[0].focus();
                    b.remove()
                } else a.designMode ? a.win.blur() : a.textarea[0].blur();
                return a
            }, afterChange: function (a) {
                function e(b) {
                    setTimeout(function () {
                        a(b)
                    }, 1)
                }

                var b = this, c = b.doc, d = c.body;
                K(c).keyup(function (c) {
                    var d, e, f, g, h, i, j, k, l, m, n, o, p, q, r;
                    if (!c.ctrlKey && !c.altKey && _CHANGE_KEY_MAP[c.which]) {
                        if (_WEBKIT && 8 == c.which) {
                            d = b.cmd;
                            d = d.selection();
                            e = d.range;
                            if (e.startOffset == e.endOffset) {
                                f = e.endContainer;
                                g = null;
                                if (f && "#text" == f.nodeName && (g = f.parentNode)) {
                                    h = g;
                                    i = "|BODY|P|DIV|H1|H2|H3|H4|H5|";
                                    for (; h && -1 == i.indexOf(h.nodeName);) {
                                        g = h;
                                        h = h.parentNode
                                    }
                                    if (h) {
                                        j = K("span", K(h));
                                        k = j.length;
                                        if (k) for (l = 0; k > l; l++) {
                                            m = K(j[l]);
                                            n = m.css("line-height");
                                            o = null;
                                            if (n && n.length > 4 && (o = n[n.length - 1]) && "%" !== o && "x" !== o) {
                                                p = K.Exclude.ExcludeCsssTag["*"];
                                                l = 1;
                                                p["line-height"] = n;
                                                for (q in p) {
                                                    r = p[q];
                                                    if (m.css(q) === r) {
                                                        m.css(q, null);
                                                        l++
                                                    }
                                                }
                                                p = K.Exclude.ExcludeCsssTag["span"];
                                                for (q in p) {
                                                    r = p[q];
                                                    if (m.css(q) === r) {
                                                        m.css(q, null);
                                                        l++
                                                    }
                                                }
                                                l > 0 && "" === m.attr("style") && m.remove(!0)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        a(c)
                    }
                });
                K(c).mouseup(a).contextmenu(a);
                K(b.win).blur(a);
                K(d).bind("paste", e);
                K(d).bind("cut", e);
                return b
            }
        });
        K.EditClass = KEdit;
        K.edit = _edit;
        K.iframeDoc = _iframeDoc;
        _extend(KToolbar, KWidget, {
            init: function (a) {
                function c(a) {
                    var b = K(a);
                    return b.hasClass("ke-outline") ? b : b.hasClass("ke-toolbar-icon") ? b.parent() : void 0
                }

                function d(a, b) {
                    var d = c(a.target);
                    if (d) {
                        if (d.hasClass("ke-disabled")) return;
                        if (d.hasClass("ke-selected")) return;
                        d[b]("ke-on")
                    }
                }

                var b = this;
                KToolbar.parent.init.call(b, a);
                b.disableMode = _undef(a.disableMode, !1);
                b.noDisableItemMap = _toMap(_undef(a.noDisableItems, []));
                b._itemMap = {};
                b.div.addClass("ke-toolbar").bind("contextmenu,mousedown,mousemove", function (a) {
                    a.preventDefault()
                }).attr("unselectable", "on");
                b.div.mouseover(function (a) {
                    d(a, "addClass")
                }).mouseout(function (a) {
                    d(a, "removeClass")
                }).click(function (a) {
                    var d = c(a.target);
                    if (d) {
                        if (d.hasClass("ke-disabled")) return;
                        b.options.click.call(this, a, d.attr("data-name"))
                    }
                })
            }, get: function (a) {
                return this._itemMap[a] ? this._itemMap[a] : this._itemMap[a] = K("span.ke-icon-" + a, this.div).parent()
            }, select: function (a) {
                _selectToolbar.call(this, a, function (a) {
                    a.addClass("ke-selected")
                });
                return self
            }, unselect: function (a) {
                _selectToolbar.call(this, a, function (a) {
                    a.removeClass("ke-selected").removeClass("ke-on")
                });
                return self
            }, enable: function (a) {
                var b = this, c = a.get ? a : b.get(a);
                if (c) {
                    c.removeClass("ke-disabled");
                    c.opacity(1)
                }
                return b
            }, disable: function (a) {
                var b = this, c = a.get ? a : b.get(a);
                if (c) {
                    c.removeClass("ke-selected").addClass("ke-disabled");
                    c.opacity(.5)
                }
                return b
            }, disableAll: function (a, b) {
                var c = this, d = c.noDisableItemMap;
                b && (d = _toMap(b));
                if (a === undefined ? !c.disableMode : a) {
                    K("span.ke-outline", c.div).each(function () {
                        var a = K(this), b = a[0].getAttribute("data-name", 2);
                        d[b] || c.disable(a)
                    });
                    c.disableMode = !0
                } else {
                    K("span.ke-outline", c.div).each(function () {
                        var a = K(this), b = a[0].getAttribute("data-name", 2);
                        d[b] || c.enable(a)
                    });
                    c.disableMode = !1
                }
                return c
            }
        });
        K.ToolbarClass = KToolbar;
        K.toolbar = _toolbar;
        _extend(KMenu, KWidget, {
            init: function (a) {
                var b = this;
                a.z = a.z || 811213;
                KMenu.parent.init.call(b, a);
                b.centerLineMode = _undef(a.centerLineMode, !0);
                b.div.addClass("ke-menu").bind("click,mousedown", function (a) {
                    a.stopPropagation()
                }).attr("unselectable", "on")
            }, addItem: function (a) {
                var c, d, e, f, g, h, b = this;
                if ("-" !== a.title) {
                    c = K('<div class="ke-menu-item" unselectable="on"></div>'), d = K('<div class="ke-inline-block ke-menu-item-left"></div>'), e = K('<div class="ke-inline-block ke-menu-item-right"></div>'), f = _addUnit(a.height), g = _undef(a.iconClass, "");
                    b.div.append(c);
                    if (f) {
                        c.css("height", f);
                        e.css("line-height", f)
                    }
                    if (b.centerLineMode) {
                        h = K('<div class="ke-inline-block ke-menu-item-center"></div>');
                        f && h.css("height", f)
                    }
                    c.mouseover(function () {
                        K(this).addClass("ke-menu-item-on");
                        h && h.addClass("ke-menu-item-center-on")
                    }).mouseout(function () {
                        K(this).removeClass("ke-menu-item-on");
                        h && h.removeClass("ke-menu-item-center-on")
                    }).click(function (b) {
                        a.click.call(K(this));
                        b.stopPropagation()
                    }).append(d);
                    h && c.append(h);
                    c.append(e);
                    a.checked && (g = "ke-icon-checked");
                    "" !== g && d.html('<span class="ke-inline-block ke-toolbar-icon ke-toolbar-icon-url ' + g + '"></span>');
                    e.html(a.title);
                    return b
                }
                b.div.append(K('<div class="ke-menu-separator"></div>'))
            }, remove: function () {
                var a = this;
                a.options.beforeRemove && a.options.beforeRemove.call(a);
                K(".ke-menu-item", a.div[0]).unbind();
                KMenu.parent.remove.call(a);
                return a
            }
        });
        K.MenuClass = KMenu;
        K.menu = _menu;
        _extend(KColorPicker, KWidget, {
            init: function (a) {
                var c, d, e, f, g, h, b = this;
                a.z = a.z || 811213;
                a.fn = a.fn || function () {
                };
                KColorPicker.parent.init.call(b, a);
                c = a.colors || [["#E53333", "#E56600", "#FF9900", "#64451D", "#DFC5A4", "#FFE500"], ["#009900", "#006600", "#99BB00", "#B8D100", "#60D978", "#00D5FF"], ["#337FE5", "#003399", "#4C33E5", "#9933E5", "#CC33E5", "#EE33EE"], ["#FFFFFF", "#CCCCCC", "#999999", "#666666", "#333333", "#000000"]];
                b.selectedColor = (a.selectedColor || "").toLowerCase();
                b._cells = [];
                b.div.addClass("ke-colorpicker").bind("click,mousedown", function (a) {
                    a.stopPropagation()
                }).attr("unselectable", "on");
                d = b.doc.createElement("table");
                b.div.append(d);
                d.className = "ke-colorpicker-table";
                d.cellPadding = 0;
                d.cellSpacing = 0;
                d.border = 0;
                e = d.insertRow(0), f = e.insertCell(0);
                f.colSpan = c[0].length;
                b._addAttr(f, "", "ke-colorpicker-cell-top");
                for (g = 0; g < c.length; g++) {
                    e = d.insertRow(g + 1);
                    for (h = 0; h < c[g].length; h++) {
                        f = e.insertCell(h);
                        b._addAttr(f, c[g][h], "ke-colorpicker-cell")
                    }
                }
                e = d.insertRow(g + 1);
                f = e.insertCell(0);
                f.setAttribute("colspan", c[0].length);
                a.fn(f)
            }, _addAttr: function (a, b, c) {
                var d = this;
                a = K(a).addClass(c);
                d.selectedColor === b.toLowerCase() && a.addClass("ke-colorpicker-cell-selected");
                a.attr("title", b || d.options.noColor);
                a.mouseover(function () {
                    K(this).addClass("ke-colorpicker-cell-on")
                });
                a.mouseout(function () {
                    K(this).removeClass("ke-colorpicker-cell-on")
                });
                a.click(function (a) {
                    a.stop();
                    d.options.click.call(K(this), b)
                });
                b ? a.append(K('<div class="ke-colorpicker-cell-color" unselectable="on"></div>').css("background-color", b)) : a.html(d.options.noColor);
                K(a).attr("unselectable", "on");
                d._cells.push(a)
            }, remove: function () {
                var a = this;
                _each(a._cells, function () {
                    this.unbind()
                });
                KColorPicker.parent.remove.call(a);
                return a
            }
        });
        K.ColorPickerClass = KColorPicker;
        K.colorpicker = _colorpicker;
        _extend(KUploadButton, {
            init: function (a) {
                var j, k, l, m, n, b = this, c = K(a.button), d = a.fieldName || "file", e = a.url || "", f = c.val(),
                    g = a.extraParams || {}, h = c[0].className || "",
                    i = a.target || "kindeditor_upload_iframe_" + (new Date).getTime();
                a.afterError = a.afterError || function (a) {
                    alert(a)
                };
                j = [];
                for (k in g) j.push('<input type="hidden" name="' + k + '" value="' + g[k] + '" />');
                l = ['<div class="ke-inline-block ' + h + '">', a.target ? "" : '<iframe name="' + i + '" style="display:none;"></iframe>', a.form ? '<div class="ke-upload-area">' : '<form class="ke-upload-area ke-form" method="post" enctype="multipart/form-data" target="' + i + '" action="' + e + '">', '<span class="ke-button-common">', j.join(""), '<input type="button" class="ke-button-common ke-button" value="' + f + '" />', "</span>", '<input type="file" class="ke-upload-file" name="' + d + '" tabindex="-1" />', a.form ? "</div>" : "</form>", "</div>"].join("");
                m = K(l, c.doc);
                c.hide();
                c.before(m);
                b.div = m;
                b.button = c;
                b.iframe = a.target ? K('iframe[name="' + i + '"]') : K("iframe", m);
                b.form = a.form ? K(a.form) : K("form", m);
                b.fileBox = K(".ke-upload-file", m);
                n = a.width || K(".ke-button-common", m).width();
                K(".ke-upload-area", m).width(n);
                b.options = a
            }, submit: function () {
                var a = this, b = a.iframe;
                b.bind("load", function () {
                    var c, g, d, e, f;
                    b.unbind();
                    c = document.createElement("form");
                    a.fileBox.before(c);
                    K(c).append(a.fileBox);
                    c.reset();
                    K(c).remove(!0);
                    d = K.iframeDoc(b), e = d.getElementsByTagName("pre")[0], f = "";
                    f = e ? e.innerHTML : d.body.innerHTML;
                    f = _unescape(f);
                    b[0].src = "javascript:false";
                    try {
                        g = K.json(f)
                    } catch (h) {
                        a.options.afterError.call(a, "<!doctype html><html>" + d.body.parentNode.innerHTML + "</html>")
                    }
                    g && a.options.afterUpload.call(a, g)
                });
                a.form[0].submit();
                return a
            }, remove: function () {
                var a = this;
                a.fileBox && a.fileBox.unbind();
                a.iframe.remove();
                a.div.remove();
                a.button.show();
                return a
            }
        });
        K.UploadButtonClass = KUploadButton;
        K.uploadbutton = _uploadbutton;
        _extend(KDialog, KWidget, {
            init: function (a) {
                var d, e, f, g, h, i, j, k, l, m, n, o, p, q, b = this, c = _undef(a.shadowMode, !0);
                a.z = a.z || 811213;
                a.shadowMode = !1;
                a.autoScroll = _undef(a.autoScroll, !0);
                KDialog.parent.init.call(b, a);
                d = a.title, e = K(a.body, b.doc), f = a.previewBtn, g = a.yesBtn, h = a.noBtn, i = a.closeBtn, j = a.showbefore || function () {
                };
                showMask = _undef(a.showMask, !0);
                b.div.addClass("ke-dialog").bind("click,mousedown", function (a) {
                    a.stopPropagation()
                });
                k = K('<div class="ke-dialog-content"></div>').appendTo(b.div);
                _IE && 7 > _V ? b.iframeMask = K('<iframe src="about:blank" class="ke-dialog-shadow"></iframe>').appendTo(b.div) : c && K('<div class="ke-dialog-shadow"></div>').appendTo(b.div);
                l = K('<div class="ke-dialog-header"></div>');
                k.append(l);
                l.html(d);
                b.closeIcon = K('<span class="ke-dialog-icon-close" title="' + i.name + '"></span>').click(i.click);
                l.append(b.closeIcon);
                b.draggable({clickEl: l, beforeDrag: a.beforeDrag});
                m = K('<div class="ke-dialog-body"></div>');
                k.append(m);
                m.append(e);
                n = K('<div class="ke-dialog-footer"></div>');
                (f || g || h) && k.append(n);
                _each([{btn: f, name: "preview"}, {btn: g, name: "yes"}, {btn: h, name: "no"}], function () {
                    if (this.btn) {
                        var a = _createButton(this.btn);
                        a.addClass("ke-dialog-" + this.name);
                        n.append(a)
                    }
                });
                b.height && m.height(_removeUnit(b.height) - l.height() - n.height());
                b.div.width(b.div.width());
                b.div.height(b.div.height());
                b.mask = null;
                if (showMask) {
                    o = _docElement(b.doc), p = Math.max(o.scrollWidth, o.clientWidth), q = Math.max(o.scrollHeight, o.clientHeight);
                    b.mask = _widget({x: 0, y: 0, z: b.z - 1, cls: "ke-dialog-mask", width: p, height: q})
                }
                b.autoPos(b.div.width(), b.div.height());
                b.footerDiv = n;
                b.bodyDiv = m;
                b.headerDiv = l;
                b.isLoading = !1;
                j(b)
            }, setMaskIndex: function (a) {
                var b = this;
                b.mask.div.css("z-index", a)
            }, showLoading: function (a) {
                a = _undef(a, "");
                var b = this, c = b.bodyDiv;
                b.loading = K('<div class="ke-dialog-loading"><div class="ke-inline-block ke-dialog-loading-content" style="margin-top:' + Math.round(c.height() / 3) + 'px;">' + a + "</div></div>").width(c.width()).height(c.height()).css("top", b.headerDiv.height() + "px");
                c.css("visibility", "hidden").after(b.loading);
                b.isLoading = !0;
                return b
            }, hideLoading: function () {
                this.loading && this.loading.remove();
                this.bodyDiv.css("visibility", "visible");
                this.isLoading = !1;
                return this
            }, remove: function () {
                var a = this;
                a.options.beforeRemove && a.options.beforeRemove.call(a);
                a.mask && a.mask.remove();
                a.iframeMask && a.iframeMask.remove();
                a.closeIcon.unbind();
                K("input", a.div).unbind();
                K("button", a.div).unbind();
                a.footerDiv.unbind();
                a.bodyDiv.unbind();
                a.headerDiv.unbind();
                K("iframe", a.div).each(function () {
                    K(this).remove()
                });
                KDialog.parent.remove.call(a);
                return a
            }
        });
        K.DialogClass = KDialog;
        K.dialog = _dialog;
        K.tabs = _tabs;
        K.loadScript = _loadScript;
        K.loadStyle = _loadStyle;
        K.ajax = _ajax;
        _plugins = {};
        _language = {};
        KEditor.prototype = {
            lang: function (a) {
                return _lang(a, this.langType)
            }, loadPlugin: function (a, b) {
                var c = this, d = this._pluginStatus;
                d || (d = this._pluginStatus = {});
                if (_plugins[a]) {
                    if (!_isFunction(_plugins[a])) {
                        setTimeout(function () {
                            c.loadPlugin(a, b)
                        }, 100);
                        return c
                    }
                    if (!d[a]) {
                        _plugins[a].call(c, KindEditor);
                        d[a] = "inited"
                    }
                    b && b.call(c);
                    return c
                }
                _plugins[a] = "loading";
                _loadScript(c.pluginsPath + a + "/" + a + ".js?ver=" + encodeURIComponent(K.DEBUG ? _TIME : _VERSION), function () {
                    setTimeout(function () {
                        _plugins[a] && c.loadPlugin(a, b)
                    }, 0)
                });
                return c
            }, handler: function (a, b) {
                var c = this;
                c._handlers[a] || (c._handlers[a] = []);
                if (_isFunction(b)) {
                    c._handlers[a].push(b);
                    return c
                }
                _each(c._handlers[a], function () {
                    b = this.call(c, b, a)
                });
                return b
            }, clickToolbar: function (a, b) {
                var c = this, d = "clickToolbar" + a;
                if (b === undefined) {
                    if (c._handlers[d]) return c.handler(d, a);
                    c.loadPlugin(a, function () {
                        c.handler(d)
                    });
                    return c
                }
                return c.handler(d, b)
            }, updateState: function () {
                var a = this;
                _each("justifyleft,justifycenter,justifyright,justifyfull,insertorderedlist,insertunorderedlist,subscript,superscript,bold,italic,underline,strikethrough".split(","), function (b, c) {
                    a.cmd.state(c) ? a.toolbar.select(c) : a.toolbar.unselect(c)
                });
                ClickSetToolbar(a);
                a.SetPosition(!1);
                return a
            }, addContextmenu: function (a) {
                this._contextmenus.push(a);
                return this
            }, afterCreate: function (a) {
                return this.handler("afterCreate", a)
            }, beforeRemove: function (a) {
                return this.handler("beforeRemove", a)
            }, beforeGetHtml: function (a) {
                return this.handler("beforeGetHtml", a)
            }, beforeSetHtml: function (a) {
                return this.handler("beforeSetHtml", a)
            }, afterSetHtml: function (a) {
                return this.handler("afterSetHtml", a)
            }, create: function () {
                function p() {
                    0 !== i.height() ? a.resize(c, d, !1) : setTimeout(p, 100)
                }

                var c, d, e, f, g, i, j, k, l, m, n, o, q, a = this, b = a.fullscreenMode;
                if (a.isCreated) return a;
                if (a.srcElement.data("kindeditor")) return a;
                a.srcElement.data("kindeditor", "true");
                _docElement().style.overflow = b ? "hidden" : "";
                c = b ? _docElement().clientWidth + "px" : a.width, d = b ? _docElement().clientHeight + "px" : a.height;
                (_IE && 8 > _V || _QUIRKS) && (d = _addUnit(_removeUnit(d) + 2));
                e = a.container = K(a.layout);
                b ? K(document.body).append(e) : a.srcElement.before(e);
                f = K(".toolbar", e), g = K(".edit", e), i = (a.position = K(".position", e), a.statusbar = K(".statusbar", e));
                e.removeClass("container").addClass("ke-container ke-container-" + a.themeType).css("width", c);
                a.tab = K(".tab", e);
                if (b) {
                    e.css({position: "absolute", left: 0, top: 0, "z-index": 9900});
                    _GECKO || (a._scrollPos = _getScrollPos());
                    window.scrollTo(0, 0);
                    K(document.body).css({height: "1px", overflow: "hidden"});
                    K(document.body.parentNode).css("overflow", "hidden");
                    a._fullscreenExecuted = !0
                } else {
                    if (a._fullscreenExecuted) {
                        K(document.body).css({height: "", overflow: ""});
                        K(document.body.parentNode).css("overflow", "")
                    }
                    a._scrollPos && window.scrollTo(a._scrollPos.x, a._scrollPos.y)
                }
                j = [];
                if (a.SimpleMode) {
                    a.items = ["source", "|", "cut", "indent", "selectall", "fullscreen", "|", "formatblock", "fontname", "fontsize", "|", "forecolor", "hilitecolor", "bold", "italic", "underline", "strikethrough", "removeformat", "|", "multiimage", "anchor", "link", "unlink"];
                    a.newlineTag = a.options.newlineTag = "br"
                } else {
                    k = !0;
                    "selectmodular" in window && (k = window["selectmodular"]);
                    "selectmodular" in window.top && (k = window.top["selectmodular"]);
                    if (k) {
                        l = 2;
                        if ("selectmodular" != a.items[l]) {
                            a.items.splice(1, 0, "|");
                            a.items.splice(2, 0, "selectmodular")
                        }
                    }
                }
                K.each(a.items, function (b, c) {
                    if ("|" == c) j.push('<span class="ke-inline-block ke-separator"></span>'); else if ("/" == c) j.push('<div class="ke-hr"></div>'); else {
                        j.push('<span class="ke-outline" data-name="' + c + '" title="' + a.lang(c) + '" unselectable="on">');
                        j.push('<span class="ke-toolbar-icon ke-toolbar-icon-url ke-icon-' + c + '" unselectable="on"></span></span>')
                    }
                });
                m = a.toolbar = _toolbar({
                    src: f,
                    html: j.join(""),
                    noDisableItems: a.noDisableItems,
                    click: function (b, c) {
                        b.stop();
                        if (a.menu) {
                            var d = a.menu.name;
                            a.hideMenu();
                            if (d === c) return
                        }
                        a.clickToolbar(c)
                    }
                });
                n = _removeUnit(d) - m.div.height();
                o = a.edit = _edit({
                    height: n > 0 && _removeUnit(d) > a.minHeight ? n : a.minHeight,
                    src: g,
                    self: a,
                    srcElement: a.srcElement,
                    designMode: a.designMode,
                    themesPath: a.themesPath,
                    bodyClass: a.bodyClass,
                    cssPath: a.cssPath,
                    cssData: a.cssData,
                    beforeGetHtml: function (b) {
                        b = a.beforeGetHtml(b);
                        b = _removeBookmarkTag(_removeTempTag(b));
                        return _formatHtml(b, a.filterMode ? a.htmlTags : null, a.urlType, a.wellFormatMode, a.indentChar)
                    },
                    beforeSetHtml: function (b) {
                        b = _formatHtml(b, a.filterMode ? a.htmlTags : null, "", !1);
                        return a.beforeSetHtml(b)
                    },
                    afterSetHtml: function () {
                        a.edit = o = this;
                        a.afterSetHtml()
                    },
                    afterCreate: function () {
                        a.edit = o = this;
                        a.cmd = o.cmd;
                        a._docMousedownFn = function () {
                            a.menu && a.hideMenu()
                        };
                        K(o.doc, document).mousedown(a._docMousedownFn);
                        _bindContextmenuEvent.call(a);
                        _bindNewlineEvent.call(a);
                        _bindTabEvent.call(a);
                        _bindFocusEvent.call(a);
                        o.afterChange(function () {
                            if (o.designMode) {
                                a.updateState();
                                a.addBookmark();
                                a.options.afterChange && a.options.afterChange.call(a)
                            }
                        });
                        o.textarea.keyup(function (b) {
                            b.ctrlKey || b.altKey || !_INPUT_KEY_MAP[b.which] || a.options.afterChange && a.options.afterChange.call(a)
                        });
                        a.readonlyMode && a.readonly();
                        a.isCreated = !0;
                        "" === a.initContent && (a.initContent = a.html());
                        if (a._undoStack.length > 0) {
                            var b = a._undoStack.pop();
                            if (b.start) {
                                a.html(b.html);
                                o.cmd.range.moveToBookmark(b);
                                a.select()
                            }
                        }
                        a.afterCreate();
                        a.options.afterCreate && a.options.afterCreate.call(a)
                    }
                });
                i.removeClass("statusbar").addClass("ke-statusbar").append('<span class="ke-inline-block ke-statusbar-center-icon"></span>').append('<span class="ke-inline-block ke-statusbar-right-icon"></span>');
                if (a._fullscreenResizeHandler) {
                    K(window).unbind("resize", a._fullscreenResizeHandler);
                    a._fullscreenResizeHandler = null
                }
                p();
                if (b) {
                    a._fullscreenResizeHandler = function () {
                        a.isCreated && a.resize(_docElement().clientWidth, _docElement().clientHeight, !1)
                    };
                    K(window).bind("resize", a._fullscreenResizeHandler);
                    m.select("fullscreen");
                    i.first().css("visibility", "hidden");
                    i.last().css("visibility", "hidden")
                } else {
                    _GECKO && K(window).bind("scroll", function () {
                        a._scrollPos = _getScrollPos()
                    });
                    a.resizeType > 0 ? _drag({
                        moveEl: e, clickEl: i, moveFn: function (b, c, d, e, f, g) {
                            e += g;
                            a.resize(null, e)
                        }
                    }) : i.first().css("visibility", "hidden");
                    2 === a.resizeType ? _drag({
                        moveEl: e, clickEl: i.last(), moveFn: function (b, c, d, e, f, g) {
                            d += f;
                            e += g;
                            a.resize(d, e)
                        }
                    }) : i.last().css("visibility", "hidden")
                }
                a.setFullscreenStyle(!0);
                a.SetPosition(!0);
                if (a.styles && a.styles.length) for (q = 0; q < a.styles.length; q++) a.addStyle(a.styles[q]);
                return a
            }, SelectByElement: function (a, b, c) {
                var g, h, d = this, e = d.cmd, f = e.range;
                if (null == a && arguments.length > 2) {
                    g = d.GetPositionElements(f);
                    b = b || 0;
                    if (b >= 0 && g.length > b) {
                        h = g[b];
                        if (h[0] === c) {
                            f.selectNode(h[1]);
                            e.select()
                        }
                    }
                }
                if (a) {
                    a = a.length ? a[0] : a;
                    f.selectNode(a);
                    e.select()
                }
            }, GetPositionElements: function (a) {
                var d, e, b = [], c = a.commonAncestor();
                if (c) {
                    d = c;
                    e = d.nodeName ? d.nodeName.toLowerCase() : d.nodeName;
                    for (; d && e && "#text" !== e && "body" !== e && utils.trimWhiteTextNode(d) && 1 == d.childNodes.length;) {
                        d = d.childNodes[0];
                        e = d.nodeName ? d.nodeName.toLowerCase() : d.nodeName
                    }
                    b = [];
                    for (; d && e && "body" !== e;) {
                        e && "#text" != e && "br" != e && b.push([e, d]);
                        d = d.parentNode;
                        e = d && d.nodeName ? d.nodeName.toLowerCase() : ""
                    }
                }
                b.length > 1 && b.reverse();
                return b
            }, SetPosition: function (a) {
                var g, h, i, j, k, l, b = this, c = b.cmd, d = c.range, e = b.position, f = b.position.loc;
                if (a === !0) {
                    e.html("元素路径：<span class='selBody'>body</span><span class='loc'></span>");
                    f = b.position.loc = K(".loc", e);
                    K(".selBody", e).click(function () {
                        b.SelectByElement(b.cmd.doc.body)
                    })
                } else if (d) {
                    if (a === !1) {
                        c.selection();
                        d = c.range
                    }
                    g = b.GetPositionElements(d);
                    h = "&gt;<span onclick=\"KindEditor.GetEditor('{0}').SelectByElement(null,{1},'{2}')\">{3}</span>";
                    i = "";
                    for (j = 0; j < g.length; j++) {
                        k = g[j];
                        i += h.replace("{0}", b.id).replace("{1}", j).replace("{2}", k[0]).replace("{3}", k[0])
                    }
                    l = f.html();
                    l != i && f.html(i)
                }
            }, remove: function () {
                var a = this;
                if (!a.isCreated) return a;
                a.beforeRemove();
                a.srcElement.data("kindeditor", "");
                a.menu && a.hideMenu();
                _each(a.dialogs, function () {
                    a.hideDialog()
                });
                K(document).unbind("mousedown", a._docMousedownFn);
                a.toolbar.remove();
                a.edit.remove();
                a.statusbar.last().unbind();
                a.statusbar.unbind();
                a.container.remove();
                a.container = a.toolbar = a.edit = a.menu = null;
                a.dialogs = [];
                a.isCreated = !1;
                return a
            }, resize: function (a, b, c) {
                var e, f, g, d = this;
                c = _undef(c, !0);
                if (a) {
                    if (!/%/.test(a)) {
                        a = _removeUnit(a);
                        a = a < d.minWidth ? d.minWidth : a
                    }
                    d.container.css("width", _addUnit(a));
                    c && (d.width = _addUnit(a))
                }
                if (b) {
                    b = _removeUnit(b);
                    e = $(d.edit.div[0]);
                    f = e.siblings("div:visible");
                    g = 0;
                    f.each(function () {
                        var a = $(this), b = a.css("position");
                        if ("static" === b || "relative" === b) {
                            g += a.outerHeight(!0);
                            a.attr("resize", "true")
                        }
                    });
                    editHeight = _removeUnit(b) - g - 2;
                    editHeight = editHeight < d.minHeight ? d.minHeight : editHeight;
                    d.edit.setHeight(editHeight);
                    c && (d.height = _addUnit(b))
                }
                return d
            }, select: function () {
                this.isCreated && this.cmd.select();
                return this
            }, html: function (a) {
                var b = this;
                if (a === undefined) return b.isCreated ? b.edit.html() : _elementVal(b.srcElement);
                b.isCreated ? b.edit.html(a) : _elementVal(b.srcElement, a);
                b.isCreated && b.cmd.selection();
                return b
            }, fullHtml: function () {
                return this.isCreated ? this.edit.html(undefined, !0) : ""
            }, text: function (a) {
                var b = this;
                return a === undefined ? _trim(b.html().replace(/<(?!img|embed).*?>/gi, "").replace(/&nbsp;/gi, " ")) : b.html(_escape(a, !0))
            }, isEmpty: function () {
                return "" === _trim(this.text().replace(/\r\n|\n|\r/, ""))
            }, isDirty: function () {
                return _trim(this.initContent.replace(/\r\n|\n|\r|t/g, "")) !== _trim(this.html().replace(/\r\n|\n|\r|t/g, ""))
            }, selectedHtml: function () {
                var a = this.isCreated ? this.cmd.range.html() : "";
                a = _removeBookmarkTag(_removeTempTag(a));
                return a
            }, count: function (a) {
                var b = this;
                a = (a || "html").toLowerCase();
                return "html" === a ? b.html().length : "text" === a ? b.text().replace(/<(?:img|embed).*?>/gi, "K").replace(/\r\n|\n|\r/g, "").length : 0
            }, mergeChild: function (a, b, c) {
                var e, f, g, h, i, j, l, k, d = this;
                a = a || K("p,div", d.cmd.doc.body);
                if (a && 0 != a.length) if (a.length > 1) for (e = 0; e < a.length; e++) this.mergeChild(a[e], b, c); else {
                    a = a.length ? a[0] : a;
                    f = K(b, a);
                    for (e = 0; g = f[e++];) {
                        h = g.nodeName.toLowerCase();
                        i = g.parentNode ? g.parentNode.nodeName : "";
                        if ("img" != h) {
                            if (i && "BODY" != g.parentNode.nodeName && "div" != i && "span" == h) {
                                if (a === g.parentNode) {
                                    utils.trimWhiteTextNode(a);
                                    if (1 == a.childNodes.length) {
                                        a.style.cssText = g.style.cssText + ";" + a.style.cssText;
                                        utils.remove(g, !0);
                                        continue
                                    }
                                }
                                g.style.cssText = a.style.cssText + ";" + g.style.cssText;
                                if (c) {
                                    j = c.style;
                                    if (j) {
                                        j = j.split(";");
                                        for (k = 0; l = j[k++];) g.style[utils.cssStyleToDomStyle(l.split(":")[0])] = l.split(":")[1]
                                    }
                                }
                                if (utils.isSameStyle(g, a)) {
                                    utils.removeNoStyle(g, !0);
                                    continue
                                }
                                this.mergeChild(g, b, c)
                            }
                        } else {
                            g = K(g);
                            g.css("text-align", null).css("line-height", null).css("font-size", null)
                        }
                    }
                }
            }, exec: function (a) {
                a = a.toLowerCase();
                var b = this, c = b.cmd, d = _inArray(a, "selectall,copy,paste,print".split(",")) < 0;
                d && b.addBookmark(!1);
                c[a].apply(c, _toArray(arguments, 1));
                if (d) {
                    b.updateState();
                    b.addBookmark(!1);
                    b.options.afterChange && b.options.afterChange.call(b)
                }
                return b
            }, insertHtml: function (a, b) {
                if (!this.isCreated) return this;
                a = this.beforeSetHtml(a);
                this.exec("inserthtml", a, b);
                return this
            }, appendHtml: function (a) {
                this.html(this.html() + a);
                if (this.isCreated) {
                    var b = this.cmd;
                    b.range.selectNodeContents(b.doc.body).collapse(!1);
                    b.select()
                }
                return this
            }, sync: function () {
                var c, d, e, f, a = this, b = a.edit;
                if (null != b) {
                    c = b.doc;
                    d = K(c.body).first();
                    e = [];
                    if ("p" === a.newlineTag) {
                        for (; d;) {
                            d.name && "img" == d.name && e.push(d);
                            d = d.next()
                        }
                        e.length > 0 && K.each(e, function (a, b) {
                            var d = null;
                            d = K("<p></p>", c);
                            b = K(b);
                            b.before(d);
                            d.append(b)
                        })
                    }
                }
                f = this.unhtml(this.html());
                _elementVal(this.srcElement, f);
                return this
            }, focus: function () {
                this.isCreated ? this.edit.focus() : this.srcElement[0].focus();
                return this
            }, blur: function () {
                this.isCreated ? this.edit.blur() : this.srcElement[0].blur();
                return this
            }, unhtml: function (a) {
                var b, c, d, e, g;
                if (!a) return "";
                b = K.Exclude.ExcludeCsssTag["*"];
                for (c in b) try {
                    d = b[c];
                    e = new RegExp(c + " ?: ?" + d + " ?;?", "gi");
                    a = a.replace(e, "")
                } catch (f) {
                    console.log(f)
                }
                a = a.replace(/(#\S+)\s*\(([^)]+)\)/g, function (a, b, c) {
                    var d = a || "", e = (c || "") + "";
                    return e.indexOf("&") > 0 ? b + "(" + e.replace(/&gt;/g, ">") + ")" : d
                });
                a = a.replace(/[¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·•¸¹º»¼½¾¿×÷ƒ•…′″‾⁄℘ℑℜ™ℵ←↑→↓↔↵⇐⇑⇒⇓⇔∀∂∃∅∇∈∉∋∏∑−∗√∝∞∠∧∨∩∪∫∴∼≅≈≠≡≤≥⊂⊃⊄⊆⊇⊕⊗⊥⋅◊♠♣♥♦ˆ˜–—‘’‚“”„†‡‰‹›€]/g, function (a) {
                    window.chars_ || (window.chars_ = {
                        "¡": "&iexcl;",
                        "¢": "&cent;",
                        "£": "&pound;",
                        "¤": "&curren;",
                        "¥": "&yen;",
                        "¦": "&brvbar;",
                        "§": "&sect;",
                        "¨": "&uml;",
                        "©": "&copy;",
                        "ª": "&ordf;",
                        "«": "&laquo;",
                        "¬": "&not;",
                        "­": "&shy;",
                        "®": "&reg;",
                        "¯": "&macr;",
                        "°": "&deg;",
                        "±": "&plusmn;",
                        "²": "&sup2;",
                        "³": "&sup3;",
                        "´": "&acute;",
                        "µ": "&micro;",
                        "¶": "&para;",
                        "·": "&middot;",
                        "¸": "&cedil;",
                        "¹": "&sup1;",
                        "º": "&ordm;",
                        "»": "&raquo;",
                        "¼": "&frac14;",
                        "½": "&frac12;",
                        "¾": "&frac34;",
                        "¿": "&iquest;",
                        "×": "&times;",
                        "÷": "&divide;",
                        "ƒ": "&fnof;",
                        "•": "&bull;",
                        "…": "&hellip;",
                        "′": "&prime;",
                        "″": "&Prime;",
                        "‾": "&oline;",
                        "⁄": "&frasl;",
                        "℘": "&weierp;",
                        "ℑ": "&image;",
                        "ℜ": "&real;",
                        "™": "&trade;",
                        "ℵ": "&alefsym;",
                        "←": "&larr;",
                        "↑": "&uarr;",
                        "→": "&rarr;",
                        "↓": "&darr;",
                        "↔": "&harr;",
                        "↵": "&crarr;",
                        "⇐": "&lArr;",
                        "⇑": "&uArr;",
                        "⇒": "&rArr;",
                        "⇓": "&dArr;",
                        "⇔": "&hArr;",
                        "∀": "&forall;",
                        "∂": "&part;",
                        "∃": "&exist;",
                        "∅": "&empty;",
                        "∇": "&nabla;",
                        "∈": "&isin;",
                        "∉": "&notin;",
                        "∋": "&ni;",
                        "∏": "&prod;",
                        "∑": "&sum;",
                        "−": "&minus;",
                        "∗": "&lowast;",
                        "√": "&radic;",
                        "∝": "&prop;",
                        "∞": "&infin;",
                        "∠": "&ang;",
                        "∧": "&and;",
                        "∨": "&or;",
                        "∩": "&cap;",
                        "∪": "&cup;",
                        "∫": "&int;",
                        "∴": "&there4;",
                        "∼": "&sim;",
                        "≅": "&cong;",
                        "≈": "&asymp;",
                        "≠": "&ne;",
                        "≡": "&equiv;",
                        "≤": "&le;",
                        "≥": "&ge;",
                        "⊂": "&sub;",
                        "⊃": "&sup;",
                        "⊄": "&nsub;",
                        "⊆": "&sube;",
                        "⊇": "&supe;",
                        "⊕": "&oplus;",
                        "⊗": "&otimes;",
                        "⊥": "&perp;",
                        "⋅": "&sdot;",
                        "◊": "&loz;",
                        "♠": "&spades;",
                        "♣": "&clubs;",
                        "♥": "&hearts;",
                        "♦": "&diams;",
                        "ˆ": "&circ;",
                        "˜": "&tilde;",
                        "–": "&ndash;",
                        "—": "&mdash;",
                        "‘": "&lsquo;",
                        "’": "&rsquo;",
                        "‚": "&sbquo;",
                        "“": "&ldquo;",
                        "”": "&rdquo;",
                        "„": "&bdquo;",
                        "†": "&dagger;",
                        "‡": "&Dagger;",
                        "‰": "&permil;",
                        "‹": "&lsaquo;",
                        "›": "&rsaquo;",
                        "€": "&euro;"
                    });
                    return window.chars_[a] || a
                });
                a = a.replace(/data-src="([^"]*)"/gi, function (a, b) {
                    var c = b || "", e = c.indexOf("|") > -1 || c.indexOf("'") > -1 ? '"' : "'";
                    return "data-src=" + e + c.replace(/&quot;/g, '"').replace(/\|/g, "'") + e
                });
                a = a.replace(/\$\{c2.siteserviceurl\}=""/gi, " ${c2.siteserviceurl}");
                a = a.replace(/noattr=""/gi, "");
                a = a.replace(/ +style=""/gi, "");
                try {
                    g = "(src=['\"])http[s]?://" + window.location.host;
                    e = new RegExp("(" + g.replace(/\\/, "\\").replace(/\//, "/") + ")", "ig");
                    a = a.replace(e, "$2")
                } catch (f) {
                    console.log(f)
                }
                return a
            }, addBookmark: function (a) {
                var f, b, c, d, e, g, h;
                a = _undef(a, !0);
                b = this, c = b.edit, d = c.doc.body, e = _removeTempTag(d.innerHTML);
                if (a && b._undoStack.length > 0) {
                    g = b._undoStack[b._undoStack.length - 1];
                    if (Math.abs(e.length - _removeBookmarkTag(g.html).length) < b.minChangeSize) return b
                }
                if (c.designMode && !b._firstAddBookmark) {
                    h = b.cmd.range;
                    f = h.createBookmark(!0);
                    f.html = _removeTempTag(d.innerHTML);
                    h.moveToBookmark(f)
                } else f = {html: e};
                b._firstAddBookmark = !1;
                _addBookmarkToStack(b._undoStack, f);
                return b
            }, removeStyle: function (a) {
                var d, e, b = this, c = b.edit;
                if (c) {
                    d = c.doc;
                    e = d.getElementsByTagName("head")[0];
                    $(e).find("link" + (a ? "" : "[add='true']")).remove()
                } else setTimeout(function () {
                    b.removeStyle(a)
                }, 500);
                this.styles = a ? [] : this.getStyles()
            }, styles: [], addStyle: function (a) {
                var b, c, d, e, f;
                if (a) {
                    b = this, c = b.edit;
                    if (c) {
                        d = c.doc;
                        e = d.getElementsByTagName("head")[0];
                        if (!e || $(e).find("link[href*='" + a + "']").length) return;
                        f = d.createElement("link");
                        a = a.toLowerCase();
                        f.setAttribute("rel", "stylesheet");
                        f.setAttribute("add", "true");
                        f.setAttribute("type", "text/css");
                        f.setAttribute("href", a);
                        f.charset = "utf-8";
                        e.appendChild(f)
                    } else setTimeout(function () {
                        b.addStyle(a)
                    }, 500)
                }
            }, getStyles: function () {
                var d, e, a = this, b = a.edit, c = [];
                if (b) {
                    d = b.doc;
                    e = d.getElementsByTagName("head")[0];
                    $(e).find("link[add='true']").each(function () {
                        c.push($(this).attr("href"))
                    })
                }
                return c
            }, addStyles: function (a, b) {
                var c, d;
                b && this.removeStyle();
                if (a) {
                    c = a.split(";");
                    for (d = 0; d < c.length; d++) this.addStyle(c[d]);
                    this.styles = this.getStyles()
                }
            }, undo: function () {
                return _undoToRedo.call(this, this._undoStack, this._redoStack)
            }, redo: function () {
                return _undoToRedo.call(this, this._redoStack, this._undoStack)
            }, setFullscreenStyle: function (a) {
                var e, f, g, h, i, j, k, l, m, n, b = window.top == window.self, c = $(this.container[0]),
                    d = c.find("div.btns");
                window.fullscreenMode = this.fullscreenMode;
                if (this.fullscreenMode) {
                    if (!b) {
                        e = c.find(".reversal");
                        "true" !== e.attr("reversal") && c.find(".reversals").append(e).show()
                    }
                    f = $("#addTags li");
                    if (f.length > 1) {
                        this.tab.removeClass("dn");
                        g = $(this.tab[0]);
                        h = f.parent().clone();
                        g.append(h);
                        h.find("li").each(function (a) {
                            var b = $(this);
                            b.attr("onclick", null).find("em,input").remove().end().click(function () {
                                f.eq(a).click();
                                b.addClass("cur").siblings().removeClass("cur")
                            }).find("i").css("top", "4px")
                        })
                    }
                    i = $("div.view_btn").find(".e_btn1,.e_btn2");
                    if (i.length) {
                        d.append(i.clone());
                        d.find(".e_btn1,.e_btn2").each(function (a) {
                            var b = $(this), c = b.find("input");
                            b = c.length ? c : b;
                            b.attr("onclick", null).click(function () {
                                c.length ? i.eq(a).find("input").click() : i.eq(a).click()
                            })
                        });
                        d.show()
                    }
                    if (a === !0 && this.edit) {
                        j = $(this.edit.div[0]);
                        k = j.siblings("div:visible");
                        l = 0;
                        m = j.height();
                        k.each(function () {
                            var a = $(this), c = a.css("position");
                            ("static" === c || "relative" === c) && ("true" === a.attr("resize") && b || (l += a.outerHeight(!0)))
                        });
                        if (!b) {
                            n = window.top.$("div.float_box").height();
                            m > n && (m = n)
                        }
                        m -= l;
                        j.height(m);
                        j.find("iframe").height(m - 5)
                    }
                } else {
                    this.tab.addClass("dn").html("");
                    d.hide()
                }
            }, fullscreen: function (a) {
                this.fullscreenMode = a === undefined ? !this.fullscreenMode : a;
                this.addBookmark(!1, "fullscreen");
                var b = this.remove().create();
                return b
            }, readonly: function (a) {
                a = _undef(a, !0);
                var b = this, c = b.edit, d = c.doc;
                b.designMode ? b.toolbar.disableAll(a, []) : _each(b.noDisableItems, function () {
                    b.toolbar[a ? "disable" : "enable"](this)
                });
                _IE ? d.body.contentEditable = !a : d.designMode = a ? "off" : "on";
                c.textarea[0].disabled = a
            }, createMenu: function (a) {
                var b = this, c = a.name, d = b.toolbar.get(c), e = d.pos();
                a.x = e.x;
                a.y = e.y + d.height();
                a.z = b.options.zIndex;
                a.shadowMode = _undef(a.shadowMode, b.shadowMode);
                if (a.selectedColor !== undefined) {
                    a.cls = "ke-colorpicker-" + b.themeType;
                    a.noColor = b.lang("noColor");
                    b.menu = _colorpicker(a)
                } else {
                    a.cls = "ke-menu-" + b.themeType;
                    a.centerLineMode = !1;
                    b.menu = _menu(a)
                }
                return b.menu
            }, hideMenu: function () {
                if (this.menu) {
                    this.menu.remove();
                    this.menu = null
                }
                return this
            }, hideContextmenu: function () {
                if (this.contextmenu) {
                    this.contextmenu.remove();
                    this.contextmenu = null
                }
                return this
            }, createDialog: function (a, b) {
                var e, f, g, c = this;
                a.name;
                a.z = c.options.zIndex;
                a.shadowMode = _undef(a.shadowMode, c.shadowMode);
                a.closeBtn = _undef(a.closeBtn, {
                    name: c.lang("close"), click: function () {
                        c.hideDialog();
                        _IE && c.cmd && c.cmd.select()
                    }
                });
                a.noBtn = _undef(a.noBtn, {
                    name: c.lang(a.yesBtn ? "no" : "close"), click: function () {
                        c.hideDialog();
                        _IE && c.cmd && c.cmd.select()
                    }
                });
                "page" != c.dialogAlignType && (a.alignEl = c.container);
                a.cls = "ke-dialog-" + c.themeType;
                if (c.dialogs.length > 0) {
                    e = c.dialogs[0], f = c.dialogs[c.dialogs.length - 1];
                    e.setMaskIndex(f.z + 2);
                    a.z = f.z + 3;
                    a.showMask = !1
                }
                b && (a = b(c, a));
                g = _dialog(a);
                c.dialogs.push(g);
                return g
            }, hideDialog: function () {
                var b, c, a = this;
                if (a.dialogs.length > 0) {
                    a.dialogs.pop().remove();
                    a.MultiimageElement = null
                }
                if (a.dialogs.length > 0) {
                    b = a.dialogs[0], c = a.dialogs[a.dialogs.length - 1];
                    b.setMaskIndex(c.z - 1)
                }
                return a
            }, errorDialog: function (a) {
                var b = this, c = b.createDialog({
                    width: 750,
                    title: b.lang("uploadError"),
                    body: '<div style="padding:10px 20px;"><iframe frameborder="0" style="width:708px;height:400px;"></iframe></div>'
                }), d = K("iframe", c.div), e = K.iframeDoc(d);
                e.open();
                e.write(a);
                e.close();
                K(e.body).css("background-color", "#FFF");
                d[0].contentWindow.focus();
                return b
            }
        };
        _instances = [];
        K.remove = function (a) {
            _eachEditor(a, function (a) {
                this.remove();
                _instances.splice(a, 1)
            })
        };
        K.sync = function (a) {
            _eachEditor(a, function () {
                this.sync()
            })
        };
        K.html = function (a, b) {
            _eachEditor(a, function () {
                this.html(b)
            })
        };
        K.insertHtml = function (a, b) {
            _eachEditor(a, function () {
                this.insertHtml(b)
            })
        };
        K.appendHtml = function (a, b) {
            _eachEditor(a, function () {
                this.appendHtml(b)
            })
        };
        _IE && 7 > _V && _nativeCommand(document, "BackgroundImageCache", !0);
        K.EditorClass = KEditor;
        K.editor = _editor;
        K.create = _create;
        K.instances = _instances;
        K.plugin = _plugin;
        K.lang = _lang;
        K.GetEditor = function (a) {
            console.log(a);
            return root[a]
        };
        _plugin("core", function (a) {
            var d, f, b = this,
                c = {undo: "Z", redo: "Y", bold: "B", italic: "I", underline: "U", print: "P", selectall: "A"};
            b.afterSetHtml(function () {
                b.options.afterChange && b.options.afterChange.call(b)
            });
            b.afterCreate(function () {
                var c, d, e;
                if ("form" == b.syncType) {
                    c = a(b.srcElement), d = !1;
                    for (; c = c.parent();) if ("form" == c.name) {
                        d = !0;
                        break
                    }
                    if (d) {
                        c.bind("submit", function () {
                            b.sync();
                            a(window).bind("unload", function () {
                                b.edit.textarea.remove()
                            })
                        });
                        e = a('[type="reset"]', c);
                        e.click(function () {
                            b.html(b.initContent);
                            b.cmd.selection()
                        });
                        b.beforeRemove(function () {
                            c.unbind();
                            e.unbind()
                        })
                    }
                }
            });
            b.clickToolbar("source", function () {
                if (b.edit.designMode) {
                    b.toolbar.disableAll(!0);
                    b.edit.design(!1);
                    b.toolbar.select("source")
                } else {
                    b.toolbar.disableAll(!1);
                    b.edit.design(!0);
                    b.toolbar.unselect("source");
                    _GECKO ? setTimeout(function () {
                        b.cmd.selection()
                    }, 0) : b.cmd.selection()
                }
                b.designMode = b.edit.designMode
            });
            b.afterCreate(function () {
                b.designMode || b.toolbar.disableAll(!0).select("source")
            });
            b.clickToolbar("fullscreen", function () {
                b.fullscreen()
            });
            if (b.fullscreenShortcut) {
                d = !1;
                b.afterCreate(function () {
                    a(b.edit.doc, b.edit.textarea).keyup(function (a) {
                        27 == a.which && setTimeout(function () {
                            b.fullscreen()
                        }, 0)
                    });
                    if (d) {
                        if (_IE && !b.designMode) return;
                        b.focus()
                    }
                    d || (d = !0)
                })
            }
            _each("undo,redo".split(","), function (a, d) {
                c[d] && b.afterCreate(function () {
                    _ctrl(this.edit.doc, c[d], function () {
                        b.clickToolbar(d)
                    })
                });
                b.clickToolbar(d, function () {
                    b[d]()
                })
            });
            f = 1;
            b.clickToolbar("multiimage", function () {
                var d, a = this;
                if (b.kindeditor_image) {
                    d = b.kindeditor_image.pop;
                    d && d.options && d.options.show && d.options.show.call(d)
                } else {
                    b._srcElement = $(b.srcElement[0]);
                    loadJs("/manager/js/common/editor.js", function () {
                        b.kindeditor_image = new kindeditor_image(b, jQuery.extend({}, b.options.ImgData || {}, {
                            Item: function (c) {
                                var d, e, g, h, i, j, k, l, m, n;
                                if (b.dialogs.length > 0 && b.MultiimageElement) {
                                    d = b.MultiimageElement.nodeName ? $(b.MultiimageElement) : b.MultiimageElement;
                                    e = d.val();
                                    g = b.cmd.getimage(c.url, c.title, null, null, null, c.align, "", "\r\n<p>{content}</p>", !1);
                                    if (e) {
                                        e += g;
                                        d.val(e)
                                    } else d.append(e)
                                } else {
                                    f += f;
                                    a.exec("insertimage", c.url, c.title, null, null, null, c.align, "imgindex_" + f, null);
                                    h = $("img.imgindex_" + f, a.cmd.doc);
                                    if (h.length) {
                                        i = null;
                                        h.removeClass("imgindex_" + f);
                                        h.attr("clsss") || h.attr("class", null);
                                        h.attr("style", null);
                                        if ("p" === b.newlineTag) {
                                            j = h.parents();
                                            j.each(function () {
                                                var a = (this.nodeName || "").toLowerCase();
                                                if (_BLOCK_TAG_MAP_[a]) {
                                                    i = $(this);
                                                    return !1
                                                }
                                            });
                                            if (i) {
                                                if (i.length) {
                                                    k = i[0].nodeName;
                                                    if ("P" == k) {
                                                        l = i.children();
                                                        m = 0;
                                                        n = 0;
                                                        l.each(function () {
                                                            var a = $(this)[0];
                                                            ("BR" == a.nodeName || "IMG" == a.nodeName) && m++;
                                                            "IMG" == a.nodeName && n++
                                                        });
                                                        if (n > 1 || m < l.length) {
                                                            i.after("<p></p>");
                                                            i = i.next();
                                                            i.append(h)
                                                        }
                                                    } else if ("DIV" == k && !i.attr("class") && !i.attr("id") && (i.attr("style") || "").length < 14) {
                                                        i.wrapInner("<p></p>");
                                                        i = i.find("p")
                                                    }
                                                }
                                            } else {
                                                h.wrap("<p></p>");
                                                i = h.parent()
                                            }
                                        }
                                        if (i && c.align) switch (c.align) {
                                            case "center":
                                                i.css("text-align", c.align).css("text-indent", null)
                                        }
                                        b.select()
                                    }
                                }
                            }
                        }))
                    })
                }
            });
            b.clickToolbar("insertfile", function () {
                if (b.kindeditor_files_insertfile) {
                    var a = b.kindeditor_files_insertfile.pop;
                    a.options.show.call(a)
                } else {
                    b._srcElement = $(b.srcElement[0]);
                    loadJs("/manager/js/common/editor.js", function () {
                        b.kindeditor_files_insertfile = new kindeditor_files(b, {
                            Item: function (a) {
                                var c = '<a class="ke-insertfile" href="' + a.url + '" data-ke-src="' + a.url + '" target="_blank">' + a.title + "</a>";
                                b.insertHtml(c)
                            }
                        })
                    })
                }
            });
            b.clickToolbar("flash", function () {
                if (b.kindeditor_files_flash) {
                    var c = b.kindeditor_files_flash.pop;
                    c.options.show.call(c)
                } else {
                    b._srcElement = $(b.srcElement[0]);
                    loadJs("/manager/js/common/editor.js", function () {
                        b.kindeditor_files_flash = new kindeditor_files(b, {
                            Item: function (c) {
                                var e, f, g, d = a.mediaImg(b.themesPath + "common/blank.gif", {
                                    src: c.url,
                                    type: a.mediaType(".swf"),
                                    width: 200,
                                    height: 200,
                                    quality: "high"
                                });
                                b.insertHtml(d);
                                e = b.cmd.commonNode({img: "*"});
                                if (e && e.length > 0) {
                                    f = e.parent();
                                    if ("body" == f.name) {
                                        e.after("<p></p>");
                                        g = e.next();
                                        g.append(e)
                                    }
                                }
                            }
                        })
                    })
                }
            });
            b.clickToolbar("media", function () {
                if (b.kindeditor_files_media) {
                    var c = b.kindeditor_files_media.pop;
                    c.options.show.call(c)
                } else {
                    b._srcElement = $(b.srcElement[0]);
                    loadJs("/manager/js/common/editor.js", function () {
                        b.kindeditor_files_media = new kindeditor_files(b, {
                            Item: function (c) {
                                var e, f, g, d = a.mediaImg(b.themesPath + "common/blank.gif", {
                                    src: c.url,
                                    type: a.mediaType(c.url),
                                    width: 200,
                                    height: 200,
                                    autostart: "false",
                                    loop: "true"
                                });
                                b.insertHtml(d);
                                e = b.cmd.commonNode({img: "*"});
                                if (e && e.length > 0) {
                                    f = e.parent();
                                    if ("body" == f.name) {
                                        e.after("<p></p>");
                                        g = e.next();
                                        g.append(e)
                                    }
                                }
                            }
                        })
                    })
                }
            });
            "news" == b.options.tempType && b.clickToolbar("selecttemps", function () {
                if (b.kindeditor_selecttemps) {
                    var a = b.kindeditor_selecttemps.pop;
                    a.options.show.call(a)
                } else {
                    b._srcElement = $(b.srcElement[0]);
                    loadJs("/manager/js/common/editor.js", function () {
                        b.kindeditor_selecttemps = new kindeditor_selecttemps(b, {
                            Item: function (a) {
                                var c = a;
                                $("div.mask_tips").hide();
                                _confirm("是否覆盖原来的数据？", function () {
                                    b.html(c.content)
                                })
                            }, types: b.options.tempType
                        })
                    })
                }
            });
            b.clickToolbar("selectmodular", function () {
                if (b.kindeditor_selectmodular) {
                    var a = b.kindeditor_selectmodular.pop;
                    a.options.show.call(a)
                } else {
                    b._srcElement = $(b.srcElement[0]);
                    loadJs("/manager/js/common/editor.js", function () {
                        b.kindeditor_selectmodular = new kindeditor_selecttemps(b, {
                            title: "常用模块",
                            types: "help",
                            Item: function (a) {
                                var c = a;
                                HidePop();
                                window.top.$ && window.top.$("div.mask_tips").hide();
                                c.Cover ? b.html(c.content) : b.insertHtml(c.content)
                            }
                        })
                    })
                }
            });
            b.clickToolbar("formatblock", function () {
                var a = b.lang("formatblock.formatBlock"), c = {h1: 28, h2: 24, h3: 18, H4: 14, p: 12},
                    d = b.cmd.val("formatblock"),
                    e = b.createMenu({name: "formatblock", width: "en" == b.langType ? 200 : 150});
                _each(a, function (a, f) {
                    var g = "font-size:" + c[a] + "px;";
                    "h" === a.charAt(0) && (g += "font-weight:bold;");
                    e.addItem({
                        title: '<span style="' + g + '" unselectable="on">' + f + "</span>",
                        height: c[a] + 12,
                        checked: d === a || d === f,
                        click: function () {
                            b.select().exec("formatblock", "<" + a + ">").hideMenu()
                        }
                    })
                })
            });
            b.clickToolbar("fontname", function () {
                var a = b.cmd.val("fontname"), c = b.createMenu({name: "fontname", width: 150});
                _each(b.lang("fontname.fontName"), function (d, e) {
                    c.addItem({
                        title: '<span style="font-family: ' + d + ';" unselectable="on">' + e + "</span>",
                        checked: a === d.toLowerCase() || a === e.toLowerCase(),
                        click: function () {
                            b.exec("fontname", d).hideMenu()
                        }
                    })
                })
            });
            b.clickToolbar("fontsize", function () {
                var a = b.cmd.val("fontsize"), c = b.createMenu({name: "fontsize", width: 150});
                _each(b.fontSizeTable, function (d, e) {
                    c.addItem({
                        title: '<span style="font-size:' + e + ';" unselectable="on">' + e + "</span>",
                        height: _removeUnit(e) + 12,
                        checked: a === e,
                        click: function () {
                            b.exec("fontsize", e).hideMenu()
                        }
                    })
                })
            });
            _each("forecolor,hilitecolor".split(","), function (c, d) {
                b.clickToolbar(d, function () {
                    b.createMenu({
                        name: d,
                        selectedColor: b.cmd.val(d) || "default",
                        colors: b.colorTable,
                        fn: function (c) {
                            a(c).html('<input type="button" value="选择更多颜色..." class="select_color" style="width:100%;"/>');
                            a(".select_color", c).click(function () {
                                var c = '<iframe src="NSWEditor/plugins/selecrclolor/selectColor.html" style="width:375px;height:228px;" frameborder="0"></iframe>',
                                    e = b.createDialog({
                                        width: 375,
                                        title: "颜色选择",
                                        body: c,
                                        yesBtn: {
                                            name: "确定", click: function () {
                                                var f = a("iframe", e.div), g = a.iframeDoc(f), h = a("#selcolor", g);
                                                h.val() && b.exec(d, h.val());
                                                b.hideDialog()
                                            }
                                        }
                                    });
                                a("div.ke-colorpicker").remove();
                                b.menu = null
                            })
                        },
                        click: function (a) {
                            b.exec(d, a).hideMenu()
                        }
                    })
                })
            });
            _each("cut,copy,paste".split(","), function (a, c) {
                b.clickToolbar(c, function () {
                    b.focus();
                    try {
                        b.exec(c, null)
                    } catch (a) {
                        alert(b.lang(c + "Error"))
                    }
                })
            });
            b.plugin.getSelectedControls = function () {
                return b.cmd.commonAncestor_()
            };
            b.plugin.getSelectedLink = function () {
                return b.cmd.commonAncestor("a")
            };
            b.plugin.getSelectedImage = function () {
                return _getImageFromRange(b.edit.cmd.range, function (a) {
                    return !/^ke-\w+$/i.test(a[0].className)
                })
            };
            b.plugin.getSelectedFlash = function () {
                return _getImageFromRange(b.edit.cmd.range, function (a) {
                    return "ke-flash" == a[0].className
                })
            };
            b.plugin.getSelectedMedia = function () {
                return _getImageFromRange(b.edit.cmd.range, function (a) {
                    return "ke-media" == a[0].className || "ke-rm" == a[0].className
                })
            };
            b.plugin.getSelectedAnchor = function () {
                return _getImageFromRange(b.edit.cmd.range, function (a) {
                    return "ke-anchor" == a[0].className
                })
            };
            b.plugin.getSelectedUsercontrol = function () {
                return _getImageFromRange(b.edit.cmd.range, function (a) {
                    return "usercontrol" === a[0].className
                })
            };
            _each("controls,link,image,flash,media,anchor".split(","), function (a, c) {
                var d = c.charAt(0).toUpperCase() + c.substr(1);
                _each("edit,delete".split(","), function (a, e) {
                    b.addContextmenu({
                        title: b.lang(e + d),
                        click: function () {
                            b.loadPlugin(c, function () {
                                b.plugin[c][e]();
                                b.hideMenu()
                            })
                        },
                        cond: b.plugin["getSelected" + d],
                        width: 150,
                        iconClass: "edit" == e ? "ke-icon-" + c : undefined
                    })
                });
                b.addContextmenu({title: "-"})
            });
            b.plugin.getSelectedSection = function () {
                return b.cmd.commonAncestor("section")
            };
            b.plugin.getSelectedTable = function () {
                return b.cmd.commonAncestor("table")
            };
            b.plugin.getSelectedRow = function () {
                return b.cmd.commonAncestor("tr")
            };
            b.plugin.getSelectedCell = function () {
                return b.cmd.commonAncestor("td")
            };
            _each("prop,cellprop,colinsertleft,colinsertright,rowinsertabove,rowinsertbelow,rowmerge,colmerge,rowsplit,colsplit,coldelete,rowdelete,insert,delete".split(","), function (a, c) {
                var d = _inArray(c, ["prop", "delete"]) < 0 ? b.plugin.getSelectedCell : b.plugin.getSelectedTable;
                b.addContextmenu({
                    title: b.lang("table" + c), click: function () {
                        b.loadPlugin("table", function () {
                            b.plugin.table[c]();
                            b.hideMenu()
                        })
                    }, cond: d, width: 170, iconClass: "ke-icon-table" + c
                })
            });
            b.addContextmenu({title: "-"});
            _each("selectall,justifyleft,justifycenter,justifyright,justifyfull,insertorderedlist,insertunorderedlist,indent,outdent,subscript,superscript,hr,print,bold,italic,underline,strikethrough,removeformat,unlink".split(","), function (a, d) {
                c[d] && b.afterCreate(function () {
                    _ctrl(this.edit.doc, c[d], function () {
                        b.cmd.selection();
                        b.clickToolbar(d)
                    })
                });
                b.clickToolbar(d, function () {
                    b.focus().exec(d, null)
                })
            });
            b.afterCreate(function () {
                function i() {
                    var c, h, i, j, k, l, m, n;
                    d.range.moveToBookmark(e);
                    d.select();
                    if (_WEBKIT) {
                        c = f[0];
                        h = c.previousSibling;
                        i = c.nextSibling;
                        if ((null == h || h && "#text" == h.nodeName) && (null == i || i && "#text" == i.nodeName)) {
                            j = a("span,a", f);
                            j.length > 0 && j.length == c.childNodes.length && j.each(function () {
                                var b = a(this);
                                switch (b.name) {
                                    case "span":
                                        b.remove(!0);
                                        break;
                                    case "a":
                                        b.attr("style", null)
                                }
                            })
                        }
                        a("div." + g, f).each(function () {
                            a(this).after("<br />").remove(!0)
                        });
                        a("span.Apple-style-span", f).remove(!0);
                        a("span.Apple-tab-span", f).remove(!0);
                        k = {
                            "white-space": "*", "line-height": function (a, b, c, d) {
                                return d.length > 5 ? !1 : !0
                            }
                        };
                        a("span[style],a[style]", f).each(function () {
                            var d, e, f, g, h, i, j, b = a(this), c = b.attr("style");
                            if (c) {
                                c = c.toLowerCase().replace(/\s*:\s*/gm, ":");
                                c = c.replace(/\s*;\s*/gm, ";");
                                d = c.split(";");
                                e = [];
                                f = null;
                                g = !0;
                                for (h = 0; h < d.length; h++) {
                                    i = d[h];
                                    if (i) {
                                        f = i.split(":");
                                        if (f && 2 == f.length) {
                                            g = !0;
                                            j = k[f[0]];
                                            "*" == j ? g = !1 : f[1] == j ? g = !1 : _isFunction(j) && (g = j(b, c, f[0], f[1]));
                                            g && e.push(f[0] + ":" + f[1])
                                        }
                                    }
                                }
                                if (0 == e.length) {
                                    "A" != b[0].nodeName ? b.remove(!0) : b.attr("style", null);
                                    return
                                }
                                b.attr("style", e.join(";"))
                            }
                        });
                        a("meta", f).remove()
                    }
                    l = f[0].innerHTML;
                    f.remove();
                    if ("" !== l) {
                        _WEBKIT && (l = l.replace(/(<br>)\1/gi, "$1"));
                        l = utils.isWordDocument(l) ? utils.filterPasteWord(l) : l;
                        try {
                            m = "(src=['\"])http[s]?://" + window.location.host;
                            n = new RegExp("(" + m.replace(/\\/, "\\").replace(/\//, "/") + ")", "ig");
                            l = l.replace(n, "$2")
                        } catch (c) {
                            console.log(c)
                        }
                        if (2 === b.pasteType) {
                            l = l.replace(/(<(?:p|p\s[^>]*)>) *(<\/p>)/gi, "");
                            if (/schemas-microsoft-com|worddocument|mso-\w+/i.test(l)) l = _clearMsWord(l, b.filterMode ? b.htmlTags : a.options.htmlTags); else {
                                l = _formatHtml(l, b.filterMode ? b.htmlTags : null);
                                l = b.beforeSetHtml(l)
                            }
                        }
                        if (1 === b.pasteType) {
                            l = l.replace(/&nbsp;/gi, " ");
                            l = l.replace(/\n\s*\n/g, "\n");
                            l = l.replace(/<br[^>]*>/gi, "\n");
                            l = l.replace(/<\/p><p[^>]*>/gi, "\n");
                            l = l.replace(/<[^>]+>/g, "");
                            l = l.replace(/ {2}/g, " &nbsp;");
                            l = l.replace(/\n\n+/, "\n");
                            "p" == b.newlineTag ? /\n/.test(l) && (l = l.replace(/^/, "<p>").replace(/$/, "<br /></p>").replace(/\n/g, "<br /></p><p>")) : l = l.replace(/\n/g, "<br />$&")
                        }
                        b.insertHtml(l, !0)
                    }
                }

                var d, e, f, c = b.edit.doc, g = "__kindeditor_paste__", h = !1;
                a(c.body).bind("paste", function (j) {
                    if (0 !== b.pasteType) {
                        if (!h) {
                            h = !0;
                            a("div." + g, c).remove();
                            d = b.cmd.selection();
                            e = d.range.createBookmark();
                            f = a('<div class="' + g + '"></div>', c).css({
                                position: "absolute",
                                width: "1px",
                                height: "1px",
                                overflow: "hidden",
                                left: "-1981px",
                                top: a(e.start).pos().y + "px",
                                "white-space": "nowrap"
                            });
                            a(c.body).append(f);
                            if (_IE) {
                                var k = d.range.get(!0);
                                k.moveToElementText(f[0]);
                                k.select();
                                k.execCommand("paste");
                                j.preventDefault()
                            } else {
                                d.range.selectNodeContents(f[0]);
                                d.select();
                                try {
                                    f[0].tabIndex = -1;
                                    f[0].focus()
                                } catch (j) {
                                }
                            }
                            setTimeout(function () {
                                i();
                                h = !1
                            }, 0)
                        }
                    } else j.stop()
                })
            });
            b.beforeGetHtml(function (a) {
                if (_IE && 8 >= _V) {
                    a = a.replace(/<div\s+[^>]*data-ke-input-tag="([^"]*)"[^>]*>([\s\S]*?)<\/div>/gi, function (a, b) {
                        return unescape(b)
                    });
                    a = a.replace(/(<input)((?:\s+[^>]*)?>)/gi, function (a, b, c) {
                        return /\s+type="[^"]+"/i.test(a) ? a : b + ' type="text"' + c
                    })
                }
                return a.replace(/(<(?:noscript|noscript\s[^>]*)>)([\s\S]*?)(<\/noscript>)/gi, function (a, b, c, d) {
                    return b + _unescape(c).replace(/\s+/g, " ") + d
                }).replace(/<img[^>]*class="?ke-(flash|rm|media)"?[^>]*>/gi, function (a) {
                    var b = _getAttrList(a), c = _getCssList(b.style || ""), d = _mediaAttrs(b["data-ke-tag"]),
                        e = _undef(c.width, ""), f = _undef(c.height, "");
                    /px/i.test(e) && (e = _removeUnit(e));
                    /px/i.test(f) && (f = _removeUnit(f));
                    d.width = _undef(b.width, e);
                    d.height = _undef(b.height, f);
                    return _mediaEmbed(d)
                }).replace(/<img[^>]*class="?ke-anchor"?[^>]*>/gi, function (a) {
                    var b = _getAttrList(a);
                    return '<a name="' + unescape(b["data-ke-name"]) + '"></a>'
                }).replace(/<div\s+[^>]*data-ke-script-attr="([^"]*)"[^>]*>([\s\S]*?)<\/div>/gi, function (a, b, c) {
                    return "<script" + unescape(b) + ">" + unescape(c) + "</script>"
                }).replace(/<div\s+[^>]*data-ke-noscript-attr="([^"]*)"[^>]*>([\s\S]*?)<\/div>/gi, function (a, b, c) {
                    return "<noscript" + unescape(b) + ">" + unescape(c) + "</noscript>"
                }).replace(/(<[^>]*)data-ke-src="([^"]*)"([^>]*>)/gi, function (a, b, c) {
                    a = a.replace(/(\s+(?:href|src)=")[^"]*(")/i, function (a, b, d) {
                        return b + _unescape(c) + d
                    });
                    a = a.replace(/\s+data-ke-src="[^"]*"/i, "");
                    return a
                }).replace(/(<[^>]+\s)data-ke-(on\w+="[^"]*"[^>]*>)/gi, function (a, b, c) {
                    return b + c
                })
            });
            b.beforeSetHtml(function (a) {
                _IE && 8 >= _V && (a = a.replace(/<input[^>]*>|<(select|button)[^>]*>[\s\S]*?<\/\1>/gi, function (a) {
                    var b = _getAttrList(a), c = _getCssList(b.style || "");
                    return "none" == c.display ? '<div class="ke-display-none" data-ke-input-tag="' + escape(a) + '"></div>' : a
                }));
                return a.replace(/<embed[^>]*type="([^"]+)"[^>]*>(?:<\/embed>)?/gi, function (a) {
                    var c = _getAttrList(a);
                    c.src = _undef(c.src, "");
                    c.width = _undef(c.width, 0);
                    c.height = _undef(c.height, 0);
                    return _mediaImg(b.themesPath + "common/blank.gif", c)
                }).replace(/<a[^>]*name="([^"]+)"[^>]*>(?:<\/a>)?/gi, function (a) {
                    var c = _getAttrList(a);
                    return c.href !== undefined ? a : '<img class="ke-anchor" src="' + b.themesPath + 'common/anchor.gif" data-ke-name="' + escape(c.name) + '" />'
                }).replace(/<script([^>]*)>([\s\S]*?)<\/script>/gi, function (a, b, c) {
                    return '<div class="ke-script" data-ke-script-attr="' + escape(b) + '">' + escape(c) + "</div>"
                }).replace(/<noscript([^>]*)>([\s\S]*?)<\/noscript>/gi, function (a, b, c) {
                    return '<div class="ke-noscript" data-ke-noscript-attr="' + escape(b) + '">' + escape(c) + "</div>"
                }).replace(/(<[^>]*)(href|src)="([^"]*)"([^>]*>)/gi, function (a, b, c, d, e) {
                    if (a.match(/\sdata-ke-src="[^"]*"/i)) return a;
                    a = b + c + '="' + d + '"' + ' data-ke-src="' + _escape(d) + '"' + e;
                    return a
                }).replace(/(<[^>]+\s)(on\w+="[^"]*"[^>]*>)/gi, function (a, b, c) {
                    return b + "data-ke-" + c
                }).replace(/\$\{c2.siteserviceurl\}=""/gi, function (a, b) {
                    return b + 'noattr=""'
                }).replace(/<table[^>]*\s+border="0"[^>]*>/gi, function (a) {
                    return a.indexOf("ke-zeroborder") >= 0 ? a : _addClassToTag(a, "ke-zeroborder")
                })
            })
        });
        _v = parseInt(_V);
        isNaN(_v) && (_v = 100);
        K.CodemirrorTools = {
            isIE: _IE && 9 > _v, isLoad: !1, init: function () {
                if (!K.CodemirrorTools.isIE) {
                    loadCss("/manager/NSWEditor/Codemirror/codemirror.css");
                    loadJs("/manager/NSWEditor/Codemirror/codemirror.js")
                }
            }, getCodemirror: function (a, b, c) {
                var d, e;
                a = $(a);
                if (!c) {
                    a.html("<textarea></textarea>");
                    c = a.find("textarea")
                }
                d = {};
                if ("undefined" != typeof CodeMirror) {
                    e = CodeMirror.fromTextArea(c[0], {
                        lineNumbers: !0,
                        mode: "text/html",
                        matchBrackets: !0,
                        autofocus: !0,
                        lineWrapping: !0,
                        extraKeys: {"Ctrl-Alt": "autocomplete"}
                    });
                    d = {
                        textarea: e, val: function (a) {
                            if (a == undefined) return e.getValue();
                            e.setValue(a);
                            setTimeout(function () {
                                e.refresh()
                            }, 100)
                        }, isCodemirror: !0, hide: function () {
                            var b = a.find(".CodeMirror"), c = b.data("h") || b.height();
                            c && b.data("h");
                            b.css("visibility", "hidden").css("height", "0")
                        }, show: function () {
                            var b = a.find(".CodeMirror"), c = b.data("h");
                            c || (c = b.parent().height());
                            b.css("visibility", "visible").css("height", c)
                        }
                    }
                } else d = {
                    textarea: c.focus(), val: function (a) {
                        if (a == undefined) return c.val();
                        c.val(a);
                        return void 0
                    }, isCodemirror: !1, hide: function () {
                        c.hide()
                    }, show: function () {
                        c.show()
                    }
                };
                b && b.call(self, a, c, d);
                return d
            }
        };
        K.CodemirrorTools.init()
    }
}(window);
window.console || (window.console = {});
console.log || (console.log = function () {
});
var _post = function (a, b, c) {
    $.post("Handler/OtherOperations.ashx?action=" + a + "&t=" + Math.random(), b, function (a) {
        c(a)
    }).error(function (a) {
        alert(a.statusText || "error")
    })
};