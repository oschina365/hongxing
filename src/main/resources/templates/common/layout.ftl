<#include "public.ftl"/>
<#macro html title_="武汉办公家具-办公桌椅-红鑫办公室家具定制厂家-办公家具-办公家具厂" js_=[] css_=[]>
<!DOCTYPE html>
<html lang="zh" class="app">
    <head>
        <title>${title_!''}</title>
        <#include "head.ftl"/>
        <#list css_ as css>
            ${css}
        </#list>
    </head>
<body>
    <#nested />


    <#include "footer.ftl"/>
</body>

</html>
</#macro>
<#macro script_>
    <#nested />
</#macro>