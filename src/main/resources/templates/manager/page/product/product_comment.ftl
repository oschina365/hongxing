<#include "/manager/common/manage_layout.ftl"/>
<@html title_="产品列表" css_=["/manager/skins/base/products.css","/manager/skins/base/dialog.css","/manager/skins/default/list.css"]
js_=["/manager/js/common/common.js","/manager/js/common/edit.js"]>
<body marginwidth="0" marginheight="0">
<div class="so_bread">
    <div class="nsw_bread_tit f_cb">

        <span class="nsw_add">当前位置：<a href="/manager/home.aspx" target="_parent">首页</a>&gt;<a href="#"><b>产品管理</b></a>&gt;<a href="product_comment.aspx">产品评论</a></span>
        <div class="advanced_so f_fr form_search">
            <span class="clear_bd s_selt f_fl pt43 f_mr15" style="width:110px;margin:0 5px 0 8px;">
                <select id="ddlFields" class="pass_faq" style=" width:125px;padding-left:5px;">
                    <option value="Content">评论内容</option>
                    <option value="FeedBack">管理员回复</option>
                </select>
                <i class="revise_sub"></i>
            </span>
            <div class="search_so f_fl">
                <input type="text" class="so_text clear_word f_fl" name="kwd">
                <input type="button" class="so_btn f_csp f_fl" onclick="SearchObjectByGet(this)">
            </div>
        </div>
    </div>
</div>
<div class="col_main">
    <form name="form1" method="post" action="product_comment.aspx" id="form1">
        <div>
            <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
            <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
            <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTE5NjcyODUzOWRkwVpjMowmZzTeqBw5W9PjuMN6oJM=">
        </div>

        <script type="text/javascript">
            //<![CDATA[
            var theForm = document.forms['form1'];
            if (!theForm) {
                theForm = document.form1;
            }
            function __doPostBack(eventTarget, eventArgument) {
                if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                    theForm.__EVENTTARGET.value = eventTarget;
                    theForm.__EVENTARGUMENT.value = eventArgument;
                    theForm.submit();
                }
            }
            //]]>
        </script>


        <div>

            <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="019353CC">
            <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWBAKvo+fcDQLM0/WHCALH26ulDgLAqZunAZoaYEsJz1J/KASXXIlRjXiW5qcI">
        </div>
        <!-- 列表区 开始 -->
        <div class="nsw_tools_bar f_cb top_nsw_tools_bar" style="background: rgb(255, 255, 255);">
            <ul class="nsw_check_btns f_fl">
                <li class="f_ml20">
                    <span class="sele_all"><input type="radio" class="dn"><em class="e_word"></em>全选</span>|
                    <span class="sele_inverse">反选</span>
                </li>
                <li class="f_ml20">
                    <span class="span_add" onclick="edit(event)">新建</span>|<a onclick="return BatchOperation();" id="lnkBtnDel" href="javascript:__doPostBack('lnkBtnDel','')"><span>删除</span></a>|<a onclick="return BatchOperation();" id="lnkBtnDisable" href="javascript:__doPostBack('lnkBtnDisable','')"><span>启用</span></a>|<a onclick="return BatchOperation();" id="lnkBtnEnable" href="javascript:__doPostBack('lnkBtnEnable','')"><span>禁用</span></a>|<span class="span_refresh">刷新</span>
                </li>
            </ul>
            <div class="nsw_pagination f_fr f_mr20 f_cb">
                <!--IndexNavigator Start
Developed by: Oran(LikeCode####gmail.com)
Version:v0.5(Apr. 19, 2015)--><!--IndexNavigator End-->
            </div>
        </div><table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
            <tbody><tr id="Tr1" class="">
                <th style="width:50px" class="p"><span class="cho"></span></th>

                <th axis="[Content]" style=" width:200px;">评论内容</th>
                <th style="width:70px" axis="[LastIP]">IP地址</th>
                <th style="width:200px" axis="[SubjectID]">产品名</th>
                <th axis="[FeedBack]" style=" width:200px;">管理员回复</th>
                <th style="width:50px" axis="[Enable]">可用</th>
                <th style="width:50px" axis="[OrderID]">排序</th>
                <th style="width:120px" axis="[InputTime]" class="tcenter">录入时间</th>
            </tr>

            <tr id="noItemYet" class="">
                <td class="noItemYet" style=" text-align:center;" colspan="12">没有任何项目</td>
            </tr>

            </tbody></table>
        <!-- 列表分页 开始 -->
        <div class="nsw_tools_bar f_cb">
            <ul class="nsw_check_btns f_fl">
                <li class="f_ml20">
                    <span class="sele_all"><input type="radio" class="dn"><em class="e_word"></em>全选</span>|
                    <span class="sele_inverse">反选</span>
                </li>
                <li class="f_ml20">
                    <span class="span_add" onclick="edit(event)">新建</span>|<a onclick="return BatchOperation();" id="lnkBtnDel" href="javascript:__doPostBack('lnkBtnDel','')"><span>删除</span></a>|<a onclick="return BatchOperation();" id="lnkBtnDisable" href="javascript:__doPostBack('lnkBtnDisable','')"><span>启用</span></a>|<a onclick="return BatchOperation();" id="lnkBtnEnable" href="javascript:__doPostBack('lnkBtnEnable','')"><span>禁用</span></a>|<span class="span_refresh">刷新</span>
                </li>
            </ul>
            <div class="nsw_pagination f_fr f_mr20 f_cb">
                <!--IndexNavigator Start
Developed by: Oran(LikeCode####gmail.com)
Version:v0.5(Apr. 19, 2015)--><!--IndexNavigator End-->
            </div>
        </div>
        <!-- 列表分页 结束 -->

        <script type="text/javascript">IsPostBack = false;</script></form>
</div>
</body>
</@html>