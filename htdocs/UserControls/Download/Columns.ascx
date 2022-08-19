<%@ control language="C#" autoeventwireup="true" inherits="NSW.Web.UserControls.Download.UserControls_Download_Columns, qwt" enableviewstate="false" %>
<div class="fenlei2">
    <div class="sub_tit1">
        <h4>
            下载中心分类</h4>
    </div>
    <div class="nrs">
        <ul class="ul_a">
            <%= _sbSlider.ToString() %>
        </ul>
        
    </div>
    
</div>
<script type="text/javascript">
    productSelectCurrentPosition("<%= SID %>");
</script>
