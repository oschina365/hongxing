<#include "public.ftl"/>
<#macro html title_="武汉办公家具-办公桌椅-红鑫办公室家具定制厂家-办公家具-办公家具厂" js_=[] css_=[]>
<!DOCTYPE html>
<html lang="zh" class="app">
<body>
    <#nested />
    <#include "footer.ftl"/>
    <#list js_ as li>
    <script src="<@res u_=li/>"></script>
    </#list>
</body>
</html>
</#macro>
<#macro script_>
    <#nested />
</#macro>