<#macro html title_="武汉红鑫家俱有限公司网站后台" js_=[] css_=[]>
    <!DOCTYPE html>
    <html lang="zh" class="app">
    <#include "manage_head.ftl"/>

    <body>
    <#include "manage_header.ftl"/>
    <!-- wrap -->
    <div class="wrap">
        <div class="content f_cb">
            <#include "manage_leftbar.ftl"/>
            <!-- right box -->
            <div class="float_box">
                <#nested />
            </div>
        </div>
    </div>
    <#include "manage_footer.ftl"/>
    </body>
    <#list js_ as li>
        <script src="${li}"></script>
    </#list>

    <script type="text/javascript">
        function getPageFilename(path) {
            path = path || window.location.pathname;
            var filename = path;
            var pos = -1;
            if ((pos = path.lastIndexOf('/') + 1) > 0) {
                filename = path.substr(pos, path.length);
            }
            if ((pos = filename.indexOf('?')) > 0) {
                filename = filename.substr(0, pos);
            }
            return filename;
        }

        $(function () {
            $(".table_class1 a").click(function (event) {

                SaveURL();
            })
            $(".wel_revise").bind("click", function () {
                var admin_btn = $(this).parents("div.bord_gray").find("div.admin_btn");
                admin_btn.toggle();
            })
            $("a[href='#']").attr("href", "javascript:;");
            $("a[href='admin_logout.aspx']").attr("target", "_self");
            var frmeditor = $("#frmEditor");
            $(".menu_item a[href*='_edit']").click(function (event) {
                SaveURL($(this).attr("href").toLowerCase().replace("_edit", ''));
            })
            var content = $("div.content");
            $("#widthscreen").bind("click", function () {
                if (content.hasClass("w_98")) {
                    $(this).text("宽屏");
                    content.removeClass("w_98");
                    $.cookie("w_98", "false", {expires: 7, path: window.location.pathname});
                    window.top.SetHeight();
                } else {
                    $(this).text("窄屏");
                    content.addClass("w_98");
                    $.cookie("w_98", "true", {expires: 7, path: window.location.pathname});
                    window.top.SetHeight();
                }
            })
            if ($.cookie("w_98") === "true") {
                $("#widthscreen").click();
            }

            $(".menu h3").click(function () {
                $(this).next().slideDown().parents("div.menu").siblings("div.menu").find("ul").slideUp("slow");
            })

            //选中
            var as = $("div.menu li a");
            var lis = as.parent("li");
            var _select = function (a, li) {
                    if (a.length) {
                        $("#menuBar ul:visible").hide();
                        a.parent("li").addClass("selected").parent("ul").show().siblings("ul").hide();
                    }
                }
                as
        .
            bind("click", function () {
                var a = $(this);
                a.attr("_load_", "true");
                _select(a, lis.filter(".selected").removeClass("selected"));
            })
            $("#frmEditor").bind("load", function () {
                var url = getPageFilename(window.top.frames["frmEditor"].location + "").toLowerCase();
                var a = as.filter("[href$='" + url + "']");
                if (a.attr("_load_") == "true") {
                    a.attr("_load_", "false");
                    return;
                }
                var li = lis.filter(".selected").removeClass("selected");
                if (a.length) {
                    _select(a, li);
                } else if (url.indexOf('_edit.aspx') > 0) {
                    url = url.replace('_edit', '');
                    if (_OBJ_[url]) {
                        url = _OBJ_[url];
                    }
                    a = as.filter("[href$='" + url + "']");
                    _select(a, li);
                } else {
                    a = as.filter("[href*='" + url + "']");
                    _select(a, li);
                }
            })
        })
    </script>
    </html>
</#macro>
<#macro script_>
    <#nested />
</#macro>