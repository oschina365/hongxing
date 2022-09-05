<#include "public.ftl"/>
<#macro html title_="武汉办公家具定制,办公室家具品牌,办公桌椅定制-红鑫家俱" js_=[] css_=[]>
<!DOCTYPE html>
<html lang="zh" class="app">
    <head>
        <title>${title_!''}</title>
        <#include "head.ftl"/>
        <#list css_ as css>
            <link key="index" href="${css}" rel="stylesheet" type="text/css">
        </#list>
    </head>
<body>
    <#include "header.ftl"/>
    <#nested />
    <#include "footer.ftl"/>
    <#list js_ as li>
        <script src="${li}"></script>
    </#list>
</body>

</html>
</#macro>
<#macro script_>
    <#nested />
</#macro>