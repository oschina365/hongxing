﻿<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.manager.nvtemps, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%= ItemName %></title>
    <link href="skins/base/edit.css" rel="stylesheet" type="text/css" />
<!-- hongxin.com.cn/Mobile Baidu tongji analytics -->
<script>
var _hmt = _hmt || [];
(function() {
var hm = document.createElement("script");
hm.src = "https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d";
var s = document.getElementsByTagName("script")[0];
s.parentNode.insertBefore(hm, s);
})();
</script>
</head>
<body>
    <style>
    .model_box{ width:590px; padding:0; float:left;}
    .md_hide { margin: 0 10px; width:505px;height: 162px; overflow: hidden;}
    .md_prev, .md_next {width: 17px; height: 17px;margin-top: 52px;}
    </style>
    <form runat="server"><div class="model_box"> 
        <div id="prev_01" class="md_prev f_fl f_csp"><img src="skins/Img/leftjt.gif"></div>
        <div class="md_hide f_fl">
		    <ul id="ThumbnailImage" class="md_inner ul_level_c f_cb ThumbnailImage" data-src='{"width":"126","show":"4","prev":"#prev_01","next":"#next_01"}'>
                <asp:Repeater runat="server" ID="rpt"><ItemTemplate>
			    <li diretorie="<%#NVTools.NTools.GetKeyValuePairKey(Container,"diretorie")%>" styles="<%#NVTools.NTools.GetKeyValuePairKey(Container,"styles")%>" onclick="liClick(event,this);">
                    <i class="mdc_zon"></i>
                    <i class="v_set" title="全部使用该模板"></i>
                    <i class="v_set01" title="设置为默认模板"></i>
                    <i class="v_edit"></i>
                    <%#NVTools.NTools.GetKeyValuePairKey(Container,"diretorie")[0].Equals('v')?"<i class='v_del'></i>":""%>
                    <i class="pro_view"></i>
                    <a href="javascript:;"><img src="<%#NVTools.NTools.GetKeyValuePairKey(Container,"small")%>" onerror="this.src='js/iconfont-iconfontmoban.png'" big="<%#NVTools.NTools.GetKeyValuePairKey(Container,"big")%>" /></a>
                    <p><%#NVTools.NTools.GetKeyValuePairKey(Container,"title")%></p>
                </li>
                </ItemTemplate></asp:Repeater>
		    </ul>
        </div>
        <div id="next_01" class="md_next f_fl f_csp"><img src="skins/Img/rightjt.gif"></div>
	</div>
    <a id="getTemp" runat="server" visible="true" style=" height:80px;line-height:20px; border:1px solid #ccc; display:block; float:left; padding:20px 15px 0; margin-top:10px; margin-left:10px;">获取<br />更多<br />模版</a>
    </form>
</body>
<%if(string.IsNullOrEmpty(Title)){ %>
<style type="text/css">
.ul_level_c li i.v_set,.ul_level_c li:hover i.v_set,.ul_level_c li i.v_set01,.ul_level_c li:hover i.v_set01{ display:none;}
</style>
<%} %>
<script src="js/other/thumbnailImage.js" type="text/javascript"></script>
<script type="text/javascript">
var defselect = <%=(!QS("defselect").Equals("false")).ToString().ToLower()%>;
var diretorieID = "<%=NVEngine.Tools.NewTools.GetNotNullOrEmpty(QS("input"), "hd" + Type + "diretorie")%>";
var cancel = <%=(QS("cancel").Equals("true")).ToString().ToLower()%>;
var addstyle = <%=(!NVEngine.Tools.NewTools.GetAppWebConfig("EditorAddStyle").Equals("false")).ToString().ToLower()%>;
var columnid = "<%=QS("columnid") %>";
//点击图片展示效果
var pictureEnlarge = function (src) {
    loadCss("skins/fancybox/jquery.fancybox.css", window.top.document);
    loadJs("js/easyui/jquery.fancybox.js", function () {
        window.top.$.fancybox.open(
            [
                {
                    href: src,
                    title: ' '
                }
            ], {
                _autoWidth: true,
                autoResize: false,
                autoSize: false
            }
        );
    }, window.top.document);
}
var Title = "<%=Title %>";
var DelTemp = function (src) {
    _alert("正在删除中..", true, null, 100000, false);
    loadJs("js/other/ajax.js", function () {
        _PostAjax("delTemp", { type: '<%=Type %>', page: "<%=Pages %>", diretorie: $(src).attr("diretorie") }, function (data) {
            data = _Json(data);
            if (data.error == 1) {
                _alert("删除成功", true, null, 50);
                $(src).remove();
            } else {
                _alert(data.msg);
            }
        })
    })
}
var hdDiretorie = null;
var editoratts = {
    "hdnewsdiretorie":"txtContent",
    "hdhelpdiretorie":"txtContent",
    "hdagentdiretorie":"txtContent",
    "hdproductdiretorie":"txtContent",
    "hdprojectdiretorie":"txtContent"
};
var liClick = function (event, src) {
    event = event || window.event;
    if (event && event.target && event.target.tagName == "I") {
        return;
    }
    src = $(src);
    src.addClass("z_select").siblings().removeClass("z_select");
    var diretorie = src.attr("diretorie");
    if (hdDiretorie) {
        hdDiretorie.value = diretorie;
        if(addstyle && src.attr("styles")){
            var me = $(hdDiretorie);
            var styles = src.attr("styles");
            var editoratt = me.attr("editor") || editoratts[me.attr("id")];
            if(editoratt){
                var max = 2;
                var editor = window.parent.$("#" + editoratt);
                var it = setInterval(function(){
                    if(editor.length || max < 0){
                        clearInterval(it),editor && (editor = editor.data("editor")) && editor.addStyles(styles,true);
                        return;
                    }
                    editor = window.parent.$("#" + editoratt)
                    max--;
                },200);
            }
        }
    }
}
window.SelectDiretorie = function(diretorie){
    if(hdDiretorie){
        if(diretorie){
            $("#ThumbnailImage li[diretorie$='" + diretorie + "']").click();
        }else{
            return hdDiretorie.value;
        }
    }
    return "no";
}
$(function () {
    hdDiretorie = window.parent.document.getElementById(diretorieID);
    if (hdDiretorie == null && !cancel) {
        hdDiretorie = window.parent.document.getElementById("hdDiretorie");
    }
    var Next = function (index, max) {
        if (index > max) {
            $("#next_01").click();
            index = index - max;
            Next(index, max);
        }
    }
    if (hdDiretorie) {
        var diretorie = hdDiretorie.value;
        var lis = $("#ThumbnailImage li");
        if (diretorie) {
            var li = $("#ThumbnailImage li[diretorie$='" + diretorie + "']").click();
            var index = lis.index(li);
            if (index > 0) {
                index = index + 1;
                Next(index, 4);
            }
        } else if(defselect){
            lis.eq(0).addClass("z_select");
        }

        //可以取消选中，清除input保存的值
        if(cancel){
            $(document).on("click", "i.mdc_zon", function (e) {
                e.stopPropagation();
                var me = $(this).parents("li");
                if(me.hasClass("z_select")){
                    me.removeClass("z_select");
                    hdDiretorie.value = "";
                }
            })
        }
    }
    var temp = [
    '<li diretorie="{0}" style="float:left; overflow: hidden;"  onclick="liClick(event,this);" class="haveDel">',
    '    <i class="mdc_zon"></i>',
    '    <i class="v_set" title="全部使用该模板"></i>',
    '    <i class="v_set01" title="设置为默认模板"></i>',
    '    <i class="v_edit"></i>',
    '    <i class="v_del"></i>',
    '    <i class="pro_view"></i>',
    '    <a href="javascript:;"><img src="{2}" big="{3}" /></a>',
    '    <p>{1}</p>',
    '</li>'
    ].join('');

    $("#getTemp").bind("click", function () {
        var me = $(this);
        if (!me.data("pop")) {
            loadJs("js/common/popup.js", function () {
                var templates = SearchTemplates({}, {
                    src: "SearchColumnTemplates.aspx?type=<%=Type %>&page=<%=Pages %>",
                    updateCallback: function (data) {
                        if (data && data.data && data.data.datasrc) {
                            _alert("下载成功！", true);
                            var datasrc = data.data.datasrc;
                            var arr = datasrc.split('||');
                            if (arr && arr.length == 4) {
                                var html = temp;
                                for (var i = 0; i < arr.length; i++) {
                                    html = html.replace('{' + i + '}', arr[i]);
                                }
                                $("#ThumbnailImage").append(html).trigger("_change_");
                                templates.hide();

                                var li = $("#ThumbnailImage").find("li:last");
                                var lis = $("#ThumbnailImage").find("li[diretorie='" + li.attr("diretorie") + "']");
                                if (lis.length > 1) {
                                    lis.eq(0).remove();
                                }
                            }
                        }
                    }
                });
                me.data("pop", templates);
            });
        } else {
            me.data("pop").show();
        }
    })

    $(document).on("click", "i.pro_view", function (e) {
        e.stopPropagation();
        var big = $(this).parent().find("img").attr("big");
        pictureEnlarge(big);
    })

    $(document).on("click", "i.v_set01", function (e) {
        e.stopPropagation();
        var src = $(this).parents("li");
        var text = src.find("p").text();
        if (confirm("确实将“" + text + "”模板设置为" + Title + "默认模板？")) {
            _alert("正在处理中，请耐心等候...", true, null, 100000, false);
            loadJs("js/other/ajax.js", function () {
                _PostAjax("SetTemp", { type: '<%=Type %>', page: "<%=Pages %>", diretorie: src.attr("diretorie"), operation: "setDefault" }, function (data) {
                    data = _Json(data);
                    if (data.error == 1) {
                        _alert("设置成功！", true, null, 50);
                    } else {
                        _alert(data.msg);
                    }
                })
            })
        }
    })

    $(document).on("click", "i.v_set", function (e) {
        e.stopPropagation();
        var src = $(this).parents("li");
        var text = src.find("p").text();
        var msg = "确实将所有" + Title + "的模板设置为“" + text + "”模板，设置后之前选了其他模板的也将会全部设置为该模板。";
        if(columnid){
            msg = "确实将该分类下面的" + Title + "的模板设置为“" + text + "”模板，设置后该分类下之前选了其他模板的也将会全部设置为该模板。";
        }
        if (confirm(msg)) {
            _alert("正在处理中，请耐心等候...", true, null, 100000, false);
            loadJs("js/other/ajax.js", function () {
                _PostAjax("SetTemp", { type: '<%=Type %>', page: "<%=Pages %>", diretorie: src.attr("diretorie"), operation: "setTemp",columnid:columnid}, function (data) {
                    data = _Json(data);
                    if (data.error == 1) {
                        _alert("设置成功！", true, null, 50);
                    } else {
                        _alert(data.msg);
                    }
                })
            })
        }
    })

    $(document).on("click", "i.v_del", function (e) {
        e.stopPropagation();
        var me = $(this);
        _confirm("确定删除？删除后使用了该模板的其他界面将会默认为第一个模板！", function () {
            DelTemp(me.parents("li"));
        });
    })

    $(document).on("click", "i.v_edit", function (e) {
        e.stopPropagation();
        var li = $(this).parent();
        var obj = { type: '<%=Type%>', path: '<%=Pages %>', src: li.children("a").children("img").attr("src"), 'diretorie': li.attr("diretorie"), title: li.children("p").text().trim() };
        OpenBlank("template_edit.aspx", obj);
    })

    $(".ul_level_c li i.v_del").parents("li").addClass("haveDel");
})
</script>
</html>
