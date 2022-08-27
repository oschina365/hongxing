<#include "/manager/common/manage_layout.ftl"/>
<@html title_="产品列表" css_=["/manager/skins/base/news.css","/manager/skins/base/dialog.css","/manager/skins/default/list.css"]
js_=["/manager/js/common/common.js","/manager/js/common/edit.js"]>
<body marginwidth="0" marginheight="0">

<div class="nsw_bread_tit">
    <span class="nsw_add">当前位置：<a href="/manager/home.aspx" target="_parent">后台首页</a>&gt;<a href="#"><b>资讯管理</b></a>&gt;<a href="news_edit.aspx">文章录入</a></span>

</div>
<div class="col_main">
    <div class="add_tile_tab f_cb">
        <ul class="f_cb addtab_ul j_recordCon f_fl">
            <li class="active li1 thistab"><span class="sp"><em class="zline1"></em><em class="zline2"></em><i class="red_point">*</i>资讯基本信息</span></li>
            <li><span class="sp"><em class="zline1"></em><em class="zline2"></em>SEO搜索引擎设置</span></li>
            <li><span class="sp"><em class="zline1"></em><em class="zline2"></em>其他信息（非必填项）</span></li>
            <li class="li6"><span class="sp"><em class="zline1"></em><em class="zline2"></em>相关产品及资讯</span></li>
        </ul>
    </div>
    <form name="form1" method="post" action="news_edit.aspx" id="form1" onsubmit="top.refreshList=true;">
        <div>
            <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTIwMTE3NzA3ODkPZBYCAgUPZBYMAgIPEGQPFgxmAgECAgIDAgQCBQIGAgcCCAIJAgoCCxYMEAUP6LWE6K6v5qC555uu5b2VBQExZxAFEOKUnC3mlrDpl7votYTorq8FAjExZxAFE+OAgOKUnC3mlrDpl7vliqjmgIEFAjEzZxAFE+OAgOKUnC3lrrblhbfluLjor4YFAjE0ZxAFE+OAgOKUlC3ku6PnkIblk4HniYwFAjIxZxAFEOKUlC3miJDlip/moYjkvosFAjEyZxAFGeOAgOKUnC3mlL/lupzmnLrlhbPmoYjkvosFAjE1ZxAFFuOAgOOAgOKUlC3miJDlip/moYjkvosFAjIzZxAFGeOAgOKUnC3lhazlj7jkvIHkuJrmoYjkvosFAjE2ZxAFGeOAgOKUnC3ljLvnlpfmlZnogrLmoYjkvosFAjE3ZxAFGeOAgOKUnC3ph5Hono3pk7booYzmoYjkvosFAjE4ZxAFGeOAgOKUlC3nu4/lhbjmiJDlip/moYjkvosFAjE5Z2RkAiMPEA8WBh4NRGF0YVRleHRGaWVsZAUFVGl0bGUeDkRhdGFWYWx1ZUZpZWxkBQJJRB4LXyFEYXRhQm91bmRnZBAVAwlWSVDnlKjmiLcM5pmu6YCa55So5oi3CeS4muWKoee7hBUDATQBMwE2FCsDA2dnZ2RkAiQPEA8WAh8CZ2QQFcgBATABMQEyATMBNAE1ATYBNwE4ATkCMTACMTECMTICMTMCMTQCMTUCMTYCMTcCMTgCMTkCMjACMjECMjICMjMCMjQCMjUCMjYCMjcCMjgCMjkCMzACMzECMzICMzMCMzQCMzUCMzYCMzcCMzgCMzkCNDACNDECNDICNDMCNDQCNDUCNDYCNDcCNDgCNDkCNTACNTECNTICNTMCNTQCNTUCNTYCNTcCNTgCNTkCNjACNjECNjICNjMCNjQCNjUCNjYCNjcCNjgCNjkCNzACNzECNzICNzMCNzQCNzUCNzYCNzcCNzgCNzkCODACODECODICODMCODQCODUCODYCODcCODgCODkCOTACOTECOTICOTMCOTQCOTUCOTYCOTcCOTgCOTkDMTAwAzEwMQMxMDIDMTAzAzEwNAMxMDUDMTA2AzEwNwMxMDgDMTA5AzExMAMxMTEDMTEyAzExMwMxMTQDMTE1AzExNgMxMTcDMTE4AzExOQMxMjADMTIxAzEyMgMxMjMDMTI0AzEyNQMxMjYDMTI3AzEyOAMxMjkDMTMwAzEzMQMxMzIDMTMzAzEzNAMxMzUDMTM2AzEzNwMxMzgDMTM5AzE0MAMxNDEDMTQyAzE0MwMxNDQDMTQ1AzE0NgMxNDcDMTQ4AzE0OQMxNTADMTUxAzE1MgMxNTMDMTU0AzE1NQMxNTYDMTU3AzE1OAMxNTkDMTYwAzE2MQMxNjIDMTYzAzE2NAMxNjUDMTY2AzE2NwMxNjgDMTY5AzE3MAMxNzEDMTcyAzE3MwMxNzQDMTc1AzE3NgMxNzcDMTc4AzE3OQMxODADMTgxAzE4MgMxODMDMTg0AzE4NQMxODYDMTg3AzE4OAMxODkDMTkwAzE5MQMxOTIDMTkzAzE5NAMxOTUDMTk2AzE5NwMxOTgDMTk5FcgBATABMQEyATMBNAE1ATYBNwE4ATkCMTACMTECMTICMTMCMTQCMTUCMTYCMTcCMTgCMTkCMjACMjECMjICMjMCMjQCMjUCMjYCMjcCMjgCMjkCMzACMzECMzICMzMCMzQCMzUCMzYCMzcCMzgCMzkCNDACNDECNDICNDMCNDQCNDUCNDYCNDcCNDgCNDkCNTACNTECNTICNTMCNTQCNTUCNTYCNTcCNTgCNTkCNjACNjECNjICNjMCNjQCNjUCNjYCNjcCNjgCNjkCNzACNzECNzICNzMCNzQCNzUCNzYCNzcCNzgCNzkCODACODECODICODMCODQCODUCODYCODcCODgCODkCOTACOTECOTICOTMCOTQCOTUCOTYCOTcCOTgCOTkDMTAwAzEwMQMxMDIDMTAzAzEwNAMxMDUDMTA2AzEwNwMxMDgDMTA5AzExMAMxMTEDMTEyAzExMwMxMTQDMTE1AzExNgMxMTcDMTE4AzExOQMxMjADMTIxAzEyMgMxMjMDMTI0AzEyNQMxMjYDMTI3AzEyOAMxMjkDMTMwAzEzMQMxMzIDMTMzAzEzNAMxMzUDMTM2AzEzNwMxMzgDMTM5AzE0MAMxNDEDMTQyAzE0MwMxNDQDMTQ1AzE0NgMxNDcDMTQ4AzE0OQMxNTADMTUxAzE1MgMxNTMDMTU0AzE1NQMxNTYDMTU3AzE1OAMxNTkDMTYwAzE2MQMxNjIDMTYzAzE2NAMxNjUDMTY2AzE2NwMxNjgDMTY5AzE3MAMxNzEDMTcyAzE3MwMxNzQDMTc1AzE3NgMxNzcDMTc4AzE3OQMxODADMTgxAzE4MgMxODMDMTg0AzE4NQMxODYDMTg3AzE4OAMxODkDMTkwAzE5MQMxOTIDMTkzAzE5NAMxOTUDMTk2AzE5NwMxOTgDMTk5FCsDyAFnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2RkAiwPD2QWAh4IcmVhZG9ubHkFCHJlYWRvbmx5ZAItDw9kFgIfAwUIcmVhZG9ubHlkAjEPFgIeB1Zpc2libGVoZBgBBR5fX0NvbnRyb2xzUmVxdWlyZVBvc3RCYWNrS2V5X18WEQUYcmFkaW9VcmxObyRoZFJhZGlvQnV0dG9uBRlyYWRpb1VybFllcyRoZFJhZGlvQnV0dG9uBRlyYWRpb1VybFllcyRoZFJhZGlvQnV0dG9uBQhpc1RvbmdidQURY2J4S2V5d29yZENvbnRhaW4FD2Noa0lzRnVsbFNjcmVlbgUOY2JsQXV0aG9yaXR5JDAFDmNibEF1dGhvcml0eSQxBQ5jYmxBdXRob3JpdHkkMgUOY2JsQXV0aG9yaXR5JDIFCmNoa0lzRGVsYXkFDGNoa0lzQ29tbWVuZAUJY2hrSXNCZXN0BQhjaGtJc1RvcAUacmRvRW5hYmxlWWVzJGhkUmFkaW9CdXR0b24FGXJkb0VuYWJsZU5vJGhkUmFkaW9CdXR0b24FGXJkb0VuYWJsZU5vJGhkUmFkaW9CdXR0b24ctKxoQ7ib5ietp28+KIAc5q+8jQ==">
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

        <div class="add_cont pad300 j_recordCon_c f_cb">

            <!-- 资讯基本信息 -->
            <div class="cont1 tab_cat_cont" tab_index="0" style="display: block;">
                <div class="f_cb">
                    <label class="add_label f_fl"><i class="red_point">*</i>资讯标题名称</label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
                            <span class="clear_bd f_fl p_inp1"><input name="txtTitle" type="text" maxlength="150" id="txtTitle" class="com_input clear_word EnterWords CreatePY validatebox-text validatebox-invalid" data-src="{&quot;pyid&quot;:&quot;txtFileName&quot;,&quot;type&quot;:&quot;news&quot;}" _required="true" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/150字符</em>
                            <div class="msg_btn f_fl f_csp">添加短标题</div>
                            <div class="msg_content f_dn pt44 f_fl"><span class="pd010 f_lht27 f_fl">短标题名称</span>
                                <input name="txtShortTitle" type="text" maxlength="15" id="txtShortTitle" class="com_input clear_word e_input pt32 f_fl EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
                                <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/15字符</em></div>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">所属分类</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
							<span class="clear_bd s_selt f_fl pt43 click_op f_mr15">
                                <select name="ddlColumnsSource" id="ddlColumnsSource" class="pass_faq">
	<option value="1" sid="0001">资讯根目录</option>
	<option value="11" sid="0001,0011">├-新闻资讯</option>
	<option value="13" sid="0001,0011,0013">　├-新闻动态</option>
	<option value="14" sid="0001,0011,0014">　├-家具常识</option>
	<option value="21" sid="0001,0011,0021">　└-代理品牌</option>
	<option value="12" sid="0001,0012">└-成功案例</option>
	<option value="15" sid="0001,0012,0015">　├-政府机关案例</option>
	<option value="23" sid="0001,0012,0015,0023">　　└-成功案例</option>
	<option value="16" sid="0001,0012,0016">　├-公司企业案例</option>
	<option value="17" sid="0001,0012,0017">　├-医疗教育案例</option>
	<option value="18" sid="0001,0012,0018">　├-金融银行案例</option>
	<option value="19" sid="0001,0012,0019">　└-经典成功案例</option>

</select>
								<i class="revise_sub"></i>
							</span>
                            <div class="msg_add column_dialog f_fl f_csp popUp" data-src="{&quot;popup&quot;:&quot;QuicklyAddColumn&quot;}">添加分类</div>
                            <input type="submit" name="btnColumn" value="" id="btnColumn" class="dn">
                        </div>
                    </div>
                </div>

                <div class="RelevantColumn">

                    <div class="f_cb f_mt25 mt40">
                        <label class="add_label f_fl"><span class="f_pdl15">相关分类</span></label>
                        <div class="add_r f_fl">
                            <dl class="sv_checkbox f_fl">
                                <dt>请选择分类</dt>
                                <dd>
                                    <select name="RelevantColumn$ddlSelectColumn" id="RelevantColumn_ddlSelectColumn" class="pass_faq fr_select" multiple="multiple" size="5">
                                        <option value="1" parentid="0">根栏目</option>
                                        <option value="11" parentid="1">├-新闻资讯</option>
                                        <option value="13" parentid="11">　├-新闻动态</option>
                                        <option value="14" parentid="11">　├-家具常识</option>
                                        <option value="21" parentid="11">　└-代理品牌</option>
                                        <option value="12" parentid="1">└-成功案例</option>
                                        <option value="15" parentid="12">　├-政府机关案例</option>
                                        <option value="23" parentid="15">　　└-成功案例</option>
                                        <option value="16" parentid="12">　├-公司企业案例</option>
                                        <option value="17" parentid="12">　├-医疗教育案例</option>
                                        <option value="18" parentid="12">　├-金融银行案例</option>
                                        <option value="19" parentid="12">　└-经典成功案例</option>

                                    </select>
                                </dd>
                            </dl>
                            <div class="sv_check_btn f_fl"><span class="sv_add">添 加</span><span class="sv_dele">删 除</span></div>
                            <dl class="sv_checkbox f_fl">
                                <dt class="pr"><a href="###" class="pro_up"></a><a href="###" class="pro_down"></a>已选分类</dt>
                                <dd>
                                    <select multiple="multiple" size="5" class="pass_faq fl_select"></select>
                                    <input type="hidden" name="RelevantColumn$hdSelectColumnValue" id="RelevantColumn_hdSelectColumnValue">
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <script type="text/javascript">
                        $(function () {
                            Timeout(function () {
                                loadJs("js/other/selectRelevant.js", function () {
                                    var id = "RelevantColumn_hdSelectColumnValue";
                                    var me = $("#" + id);
                                    new RelevantColumn(me);
                                });
                            });
                        })
                    </script>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">缩略图</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
                            <div class="colum_onload f_csp f_fl Upload_Clik" input="hdThumbnail" id="ThumbnailUpload" directory="News">
                                <i class="colum_icon"></i>
                                <p class="f_tac f_lht27">点击上传</p>
                            </div>
                            <input type="hidden" name="hdThumbnail" id="hdThumbnail" width_="" height_="" ratio="">
                        </div>
                        <i class="i_shortdesc"></i>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">关联标签</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
                            <span class="clear_bd f_fl p_inp1"><input name="txtTag" type="text" maxlength="100" id="txtTag" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em><div class="selt_mark_btn f_fl f_csp popUp" data-src="{&quot;popup&quot;:&quot;SelectTagPopUp&quot;,&quot;input&quot;:&quot;txtTag&quot;}">选择标签</div>
                        </div>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">简介录入</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_typeset bord_gray">
                            <textarea name="txtShortDesc" rows="2" cols="20" id="txtShortDesc" class="text_area tx1"></textarea>
                            <div class="add_short_tit add_typeset_tit f_cb"><span class="f_fl f_underline">自动排版</span></div>
                        </div>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl">
                        <span class="f_pdl15">详情内容录入</span>
                        <br>
                    </label>
                    <div class="add_r f_fl">
                        <textarea id="contents" name="content" style="width: 800px; height: 400px; visibility: hidden; display: none;" id="txtContent"></textarea>
                    </div>
                </div>
            </div>
            <!-- 资讯基本信息 end-->

            <!--SEO-->
            <div class="cont1 seo_settab f_dn tab_cat_cont" tab_index="1" style="display: none;">
                <div class="f_cb">
                    <label class="add_label f_fl"><i class="red_point">*</i>静态页名称</label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
                            <span class="clear_bd f_fl p_inp1" style=""><input name="txtFileName" type="text" maxlength="64" id="txtFileName" class="com_input clear_word EnterWords validatebox-text validatebox-invalid" _required="true" triggerkeyup="triggerkeyup" _defvalue="" style=""><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
                            <input type="hidden" name="hidFileName" id="hidFileName">
                            <div class="msg_btn f_fl f_csp GetPY">手动更新</div>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25 dn">
                    <label class="add_label f_fl"><span class="f_ldb f_pdl15">网页核心关键字</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
                            <span class="clear_bd f_fl p_inp1"><input name="txtTitleKeyword" type="text" maxlength="64" id="txtTitleKeyword" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_ldb f_pdl15">网页标题<br><span>(Title)</span></span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
                            <span class="clear_bd f_fl p_inp1"><input name="txtPageTitle" type="text" maxlength="64" id="txtPageTitle" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
                            <a href="http://www.nsw88.com/Article/zxwzseotitle_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange f_lht27">不知道怎么填写？</a>
                            <a href="javascript:;" class="f_ml10 f_ib f_underline color_orange f_lht27  select_key_words" data-src="{&quot;popup&quot;:&quot;SelectKeywordPopUp&quot;,&quot;input&quot;:&quot;txtPageTitle&quot;,&quot;append&quot;:&quot;true&quot;}">提取关键词</a></div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_ldb f_pdl15">网页关键词<br><span>(Keywords)</span></span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
                            <span class="clear_bd f_fl p_inp1"><input name="txtMetaKeyword" type="text" maxlength="100" id="txtMetaKeyword" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>
                            <a href="http://www.nsw88.com/Article/wenzhangyemianseoshe_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange f_lht27">不知道怎么填写？</a>
                            <a href="javascript:;" class="f_ml10 f_ib f_underline color_orange f_lht27  select_key_words" data-src="{&quot;popup&quot;:&quot;SelectKeywordPopUp&quot;,&quot;input&quot;:&quot;txtMetaKeyword&quot;,&quot;append&quot;:&quot;true&quot;}">提取关键词</a></div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_ldb f_pdl15">网页描述<br><span>(Description)</span></span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb seo_area">
                            <textarea name="txtMetaDescription" rows="2" cols="20" id="txtMetaDescription" class="seo_descript EnterWords_Decreasing" _maxlength="250" temp="你还可以输<span class='color_orange'>{surplus_length}</span>个字符" triggerkeyup="triggerkeyup" _defvalue=""></textarea>
                            <div class="f_cb f_mt5 f_lht27 f_tar"><span class="inp_tips_gray f_ib"></span></div>
                        </div>
                        <div class="f_cb f_mt5 f_lht27"><div class="f_fl f_mr10 f_ib_">你还可以输<span class="color_orange">250</span>个字符</div><a href="http://www.nsw88.com/Article/wenzhangluruseoshezh_1.html" target="_blank" class="f_fl f_ml10 f_ib f_underline color_orange f_mr20">不知道怎么填写？</a><a href="javascript:;" class="f_ml10 f_ib f_underline color_orange f_lht27  select_key_words" data-src="{&quot;popup&quot;:&quot;SelectKeywordPopUp&quot;,&quot;input&quot;:&quot;txtMetaDescription&quot;,&quot;append&quot;:&quot;true&quot;}">提取关键词</a></div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">启用站内互链</span></label>
                    <div class="add_r f_fl">
                        <div class="nsw_check_box">
                            <span class="ck_box mt5 z_select">
                                <span class="dn"><input id="cbxKeywordContain" type="checkbox" name="cbxKeywordContain" checked="checked" onclick="if(this.checked){$('#KeywordSet').show();}else{$('#KeywordSet').hide();};"></span>
                            </span>
                            <label class="ck_text">启用</label>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25 dn" id="KeywordSet" style="display: block;">
                    <label class="add_label f_fl"><span class="f_pdl15">站内互链设置</span></label>
                    <div class="add_r f_fl">
                        <span class="f_lht27 f_fl">关键词重复次数：</span>
                        <span class="clear_bd s_selt f_fl pt43 f_mr15" style="width:50px;">
                            <select name="dropKeywordRepeat" id="dropKeywordRepeat" class="pass_faq" style="width:60px;">
	<option selected="selected" value="1">1次</option>
	<option value="2">2次</option>
	<option value="3">3次</option>
	<option value="4">4次</option>
	<option value="5">5次</option>
	<option value="6">6次</option>

</select>
                            <i class="revise_sub"></i>
                        </span>
                        <span class="f_lht27 f_fl">最多允许替换：</span>
                        <span class="clear_bd s_selt f_fl pt43 f_mr15" style="width:50px;">
                            <select name="dropKeywordMax" id="dropKeywordMax" class="pass_faq" style="width:60px;">
	<option value="1">1</option>
	<option value="2">2</option>
	<option selected="selected" value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>

</select>
                            <i class="revise_sub"></i>
                        </span>
                    </div>
                </div>
            </div>
            <!--SEO  end-->

            <!--其他信息-->
            <div class="cont1 else_info f_dn tab_cat_cont" tab_index="2" style="display: none;">



                <div class="f_cb">
                    <label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">作者</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb f_lht27">
                            <input name="txtAuthor" type="text" maxlength="20" id="txtAuthor" class="com_input clear_word bor1 writer_bd f_fl EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/20字符</em>
                            <div class="msg_btn f_fl f_csp">添加网址</div>
                            <div class="msg_content f_dn pt44 f_fl">
                                <span class="pd010 f_lht27 f_fl">网址</span>
                                <input name="txtAuthorURL" type="text" maxlength="50" id="txtAuthorURL" class="com_input clear_word e_input pt72 f_fl valid_type validatebox-text" validtype="url_" tipposition="top" placeholder="http://">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">编辑</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb f_lht27">
                            <input name="txtEditor" type="text" maxlength="20" id="txtEditor" class="com_input clear_word bor1 writer_bd f_fl EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/20字符</em>
                            <div class="msg_btn f_fl f_csp">添加网址</div>
                            <div class="msg_content f_dn pt44 f_fl">
                                <span class="pd010 f_lht27 f_fl">网址</span>
                                <input name="txtEditorURL" type="text" maxlength="50" id="txtEditorURL" class="com_input clear_word e_input pt72 f_fl valid_type validatebox-text" validtype="url_" tipposition="top" placeholder="http://">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">来源</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb f_lht27">
                            <input name="txtReffer" type="text" maxlength="20" id="txtReffer" class="com_input clear_word bor1 writer_bd f_fl EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/20字符</em>
                            <div class="msg_btn f_fl f_csp">添加网址</div>
                            <div class="msg_content f_dn pt44 f_fl">
                                <span class="pd010 f_lht27 f_fl">网址</span>
                                <input name="txtRefferURL" type="text" maxlength="50" id="txtRefferURL" class="com_input clear_word e_input pt72 f_fl valid_type validatebox-text" validtype="url_" tipposition="top" placeholder="http://">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">Banner广告图</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb f_lht27">
                            <div class="f_fl f_csp upload_img Upload_Clik" input="hdBannerPath" id="BannerPathUpload" directory="others"><span><em class="load_small"></em>点击上传</span></div>
                            <input type="hidden" name="hdBannerPath" id="hdBannerPath">
                            <div class="nsw_check_box w80" style="vertical-align:top;margin:12px 0 0 10px;">
                                <span class="ck_box mt5">
                                    <span class="dn"><input id="chkIsFullScreen" type="checkbox" name="chkIsFullScreen"></span>
                                </span>
                                <label class="ck_text">全屏显示</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">广告链接地址</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb f_lht27">
                            <span class="clear_bd f_fl p_inp1"><input name="txtBannerURL" type="text" maxlength="100" id="txtBannerURL" class="com_input clear_word EnterWords valid_type validatebox-text" validtype="url_" tipposition="top" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span><em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">广告ALT</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb f_lht27">
                            <span class="clear_bd f_fl p_inp1"><input name="txtBannerAlt" type="text" maxlength="100" id="txtBannerAlt" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span><em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>
                        </div>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">点击次数</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb f_lht27">
                            <span class="clear_bd f_fl p_inp1 span_max_w50" style="border-color: rgb(170, 170, 170);"><input name="txtHits" type="text" value="0" maxlength="6" id="txtHits" class="com_input clear_word onlyNumber valid_type validatebox-text" validtype="number" style="color: rgb(79, 81, 89); border-color: rgb(170, 170, 170);"><i class="clear_x"></i></span>
                            <em class="pd010 f_lht27 f_fl">次</em>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25 dn">
                    <label class="add_label f_fl"><span class="f_pdl15">查看权限</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb f_lht27">
                            <div class="set_cbs">

                                <div class="nsw_check_box w80 bx0">    <span class="ck_box mt5">    <input id="cblAuthority_0" type="checkbox" name="cblAuthority$0" class="dn"></span>    <label class="ck_text">VIP用户</label></div><div class="nsw_check_box w80 bx1">    <span class="ck_box mt5">    <input id="cblAuthority_1" type="checkbox" name="cblAuthority$1" class="dn"></span>    <label class="ck_text">普通用户</label></div><div class="nsw_check_box w80 bx2">    <span class="ck_box mt5">    <input id="cblAuthority_2" type="checkbox" name="cblAuthority$2" class="dn"></span>    <label class="ck_text">业务组</label></div></div>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">排序</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb f_lht27">
                            <span class="clear_bd s_selt f_fl pt43 f_mr15 span_max_w50">
                                <select name="ddlRanking" id="ddlRanking" class="pass_faq">
	<option value="0">0</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
	<option value="13">13</option>
	<option value="14">14</option>
	<option value="15">15</option>
	<option value="16">16</option>
	<option value="17">17</option>
	<option value="18">18</option>
	<option value="19">19</option>
	<option value="20">20</option>
	<option value="21">21</option>
	<option value="22">22</option>
	<option value="23">23</option>
	<option value="24">24</option>
	<option value="25">25</option>
	<option value="26">26</option>
	<option value="27">27</option>
	<option value="28">28</option>
	<option value="29">29</option>
	<option value="30">30</option>
	<option value="31">31</option>
	<option value="32">32</option>
	<option value="33">33</option>
	<option value="34">34</option>
	<option value="35">35</option>
	<option value="36">36</option>
	<option value="37">37</option>
	<option value="38">38</option>
	<option value="39">39</option>
	<option value="40">40</option>
	<option value="41">41</option>
	<option value="42">42</option>
	<option value="43">43</option>
	<option value="44">44</option>
	<option value="45">45</option>
	<option value="46">46</option>
	<option value="47">47</option>
	<option value="48">48</option>
	<option value="49">49</option>
	<option selected="selected" value="50">50</option>
	<option value="51">51</option>
	<option value="52">52</option>
	<option value="53">53</option>
	<option value="54">54</option>
	<option value="55">55</option>
	<option value="56">56</option>
	<option value="57">57</option>
	<option value="58">58</option>
	<option value="59">59</option>
	<option value="60">60</option>
	<option value="61">61</option>
	<option value="62">62</option>
	<option value="63">63</option>
	<option value="64">64</option>
	<option value="65">65</option>
	<option value="66">66</option>
	<option value="67">67</option>
	<option value="68">68</option>
	<option value="69">69</option>
	<option value="70">70</option>
	<option value="71">71</option>
	<option value="72">72</option>
	<option value="73">73</option>
	<option value="74">74</option>
	<option value="75">75</option>
	<option value="76">76</option>
	<option value="77">77</option>
	<option value="78">78</option>
	<option value="79">79</option>
	<option value="80">80</option>
	<option value="81">81</option>
	<option value="82">82</option>
	<option value="83">83</option>
	<option value="84">84</option>
	<option value="85">85</option>
	<option value="86">86</option>
	<option value="87">87</option>
	<option value="88">88</option>
	<option value="89">89</option>
	<option value="90">90</option>
	<option value="91">91</option>
	<option value="92">92</option>
	<option value="93">93</option>
	<option value="94">94</option>
	<option value="95">95</option>
	<option value="96">96</option>
	<option value="97">97</option>
	<option value="98">98</option>
	<option value="99">99</option>
	<option value="100">100</option>
	<option value="101">101</option>
	<option value="102">102</option>
	<option value="103">103</option>
	<option value="104">104</option>
	<option value="105">105</option>
	<option value="106">106</option>
	<option value="107">107</option>
	<option value="108">108</option>
	<option value="109">109</option>
	<option value="110">110</option>
	<option value="111">111</option>
	<option value="112">112</option>
	<option value="113">113</option>
	<option value="114">114</option>
	<option value="115">115</option>
	<option value="116">116</option>
	<option value="117">117</option>
	<option value="118">118</option>
	<option value="119">119</option>
	<option value="120">120</option>
	<option value="121">121</option>
	<option value="122">122</option>
	<option value="123">123</option>
	<option value="124">124</option>
	<option value="125">125</option>
	<option value="126">126</option>
	<option value="127">127</option>
	<option value="128">128</option>
	<option value="129">129</option>
	<option value="130">130</option>
	<option value="131">131</option>
	<option value="132">132</option>
	<option value="133">133</option>
	<option value="134">134</option>
	<option value="135">135</option>
	<option value="136">136</option>
	<option value="137">137</option>
	<option value="138">138</option>
	<option value="139">139</option>
	<option value="140">140</option>
	<option value="141">141</option>
	<option value="142">142</option>
	<option value="143">143</option>
	<option value="144">144</option>
	<option value="145">145</option>
	<option value="146">146</option>
	<option value="147">147</option>
	<option value="148">148</option>
	<option value="149">149</option>
	<option value="150">150</option>
	<option value="151">151</option>
	<option value="152">152</option>
	<option value="153">153</option>
	<option value="154">154</option>
	<option value="155">155</option>
	<option value="156">156</option>
	<option value="157">157</option>
	<option value="158">158</option>
	<option value="159">159</option>
	<option value="160">160</option>
	<option value="161">161</option>
	<option value="162">162</option>
	<option value="163">163</option>
	<option value="164">164</option>
	<option value="165">165</option>
	<option value="166">166</option>
	<option value="167">167</option>
	<option value="168">168</option>
	<option value="169">169</option>
	<option value="170">170</option>
	<option value="171">171</option>
	<option value="172">172</option>
	<option value="173">173</option>
	<option value="174">174</option>
	<option value="175">175</option>
	<option value="176">176</option>
	<option value="177">177</option>
	<option value="178">178</option>
	<option value="179">179</option>
	<option value="180">180</option>
	<option value="181">181</option>
	<option value="182">182</option>
	<option value="183">183</option>
	<option value="184">184</option>
	<option value="185">185</option>
	<option value="186">186</option>
	<option value="187">187</option>
	<option value="188">188</option>
	<option value="189">189</option>
	<option value="190">190</option>
	<option value="191">191</option>
	<option value="192">192</option>
	<option value="193">193</option>
	<option value="194">194</option>
	<option value="195">195</option>
	<option value="196">196</option>
	<option value="197">197</option>
	<option value="198">198</option>
	<option value="199">199</option>

</select>
                                <i class="revise_sub"></i>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">资讯推荐星级</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb f_lht27">
                            <span class="clear_bd s_selt f_fl pt43 f_mr15" style="width:65px;">
                                <select name="ddlStar" id="ddlStar" class="pass_faq" style="width:80px;">
	<option value="1">1星级</option>
	<option value="2">2星级</option>
	<option selected="selected" value="3">3星级</option>
	<option value="4">4星级</option>
	<option value="5">5星级</option>

</select>
                                <i class="revise_sub"></i>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">选项</span></label>
                    <div class="add_r f_fl">
                        <div class="nsw_check_box w80">
                            <span class="ck_box mt5">
                                <span class="dn"><input id="chkIsDelay" type="checkbox" name="chkIsDelay"></span>
                            </span>
                            <label class="ck_text">首页</label>
                        </div>
                        <div class="nsw_check_box w80">
                            <span class="ck_box mt5">
                                <span class="dn"><input id="chkIsCommend" type="checkbox" name="chkIsCommend"></span>
                            </span>
                            <label class="ck_text">推荐</label>
                        </div>
                        <div class="nsw_check_box w80">
                            <span class="ck_box mt5">
                                <span class="dn"><input id="chkIsBest" type="checkbox" name="chkIsBest"></span>
                            </span>
                            <label class="ck_text">精华</label>
                        </div>
                        <div class="nsw_check_box w80">
                            <span class="ck_box mt5">
                                <span class="dn"><input id="chkIsTop" type="checkbox" name="chkIsTop"></span>
                            </span>
                            <label class="ck_text">置顶</label>
                        </div>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">显示当前栏目</span></label>
                    <div class="add_r f_fl">

                        <span class="f_fl f_db e_radio z_select radio" name="Enable" cur="z_select">显示<span class="dn"><input id="rdoEnableYes_hdRadioButton" type="radio" name="rdoEnableYes$hdRadioButton" value="hdRadioButton" checked="checked"></span></span>

                        <span class="f_fl f_db e_radio radio" name="Enable" cur="z_select">隐藏<span class="dn"><input id="rdoEnableNo_hdRadioButton" type="radio" name="rdoEnableNo$hdRadioButton" value="hdRadioButton"></span></span>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">显示时间</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb controls_calendar">
                            <input name="txtShowTime" type="text" value="2022-08-27 23:31:20" maxlength="16" id="txtShowTime" class="com_input clear_word calendar_tx f_fl" readonly="readonly" style="color: rgb(79, 81, 89); border-color: rgb(170, 170, 170);"><i class="calendar_icon f_fr f_csp"></i>
                        </div>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">录入时间</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb controls_calendar">
                            <input name="txtInputTime" type="text" value="2022-08-27 23:31:20" maxlength="16" id="txtInputTime" class="com_input clear_word calendar_tx f_fl" readonly="readonly" style="color: rgb(79, 81, 89); border-color: rgb(170, 170, 170);"><i class="calendar_icon f_fr f_csp"></i>
                        </div>
                    </div>
                </div>

            </div>
            <!--其他信息 end-->

            <!-- 相关资讯及资讯 -->
            <div class="cont1 f_dn tab_cat_cont" tab_index="3" style="display: none;">

                <div class="f_cb">
                    <label class="add_label f_fl"><span class="f_pdl15">关联产品</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
			<span class="clear_bd f_fl cho_album f_mr20">
                <select name="RelevantProducts$ddlSelectColumn" id="RelevantProducts_ddlSelectColumn" class="pass_faq selectColumn" columntype="Product">
	<option selected="selected" value="">请选择分类....</option>
	<option value="0001">根分类</option>
	<option value="0001,0009">├-按用途分类</option>
	<option value="0001,0009,0021">　├-总裁-总经理</option>
	<option value="0001,0009,0022">　├-总监-经理</option>
	<option value="0001,0009,0023">　├-主管-职员</option>
	<option value="0001,0009,0024">　├-前台、公共休闲区</option>
	<option value="0001,0009,0025">　├-会议室区域</option>
	<option value="0001,0009,0026">　└-接待洽谈区</option>
	<option value="0001,0010">├-按行业分类</option>
	<option value="0001,0010,0027">　├-政府机关</option>
	<option value="0001,0010,0028">　├-事业单位</option>
	<option value="0001,0010,0029">　├-公司企业</option>
	<option value="0001,0010,0030">　├-学校家具</option>
	<option value="0001,0010,0031">　├-酒店家具</option>
	<option value="0001,0010,0032">　├-银行家具</option>
	<option value="0001,0010,0033">　└-医院家具</option>
	<option value="0001,0011">├-大班台系列</option>
	<option value="0001,0011,0034">　├-板式大班台</option>
	<option value="0001,0011,0035">　├-实木大班台</option>
	<option value="0001,0011,0036">　├-板式中班台</option>
	<option value="0001,0011,0037">　├-实木中班台</option>
	<option value="0001,0011,0075">　└-全实木办公家具</option>
	<option value="0001,0012">├-办公屏风系列</option>
	<option value="0001,0012,0038">　├-办公隔断卡座</option>
	<option value="0001,0012,0039">　├-开放办公屏风</option>
	<option value="0001,0012,0040">　└-钢架组合桌</option>
	<option value="0001,0013">├-办公桌系列</option>
	<option value="0001,0013,0042">　├-板式办公桌</option>
	<option value="0001,0013,0043">　├-钢架办公桌</option>
	<option value="0001,0013,0089">　├-升降桌</option>
	<option value="0001,0013,0090">　└-实木贴皮办公桌</option>
	<option value="0001,0014">├-会议桌系列</option>
	<option value="0001,0014,0044">　├-实木会议桌</option>
	<option value="0001,0014,0045">　├-板式会议桌</option>
	<option value="0001,0014,0046">　├-培训桌</option>
	<option value="0001,0014,0047">　├-演讲台</option>
	<option value="0001,0014,0048">　├-洽谈桌</option>
	<option value="0001,0014,0049">　└-主席台</option>
	<option value="0001,0015">├-办公椅系列</option>
	<option value="0001,0015,0050">　├-皮面大班椅</option>
	<option value="0001,0015,0051">　├-网面大班椅</option>
	<option value="0001,0015,0052">　├-网面转椅</option>
	<option value="0001,0015,0053">　├-固定椅</option>
	<option value="0001,0015,0054">　├-休闲椅</option>
	<option value="0001,0015,0055">　├-吧椅</option>
	<option value="0001,0015,0084">　├-礼堂椅</option>
	<option value="0001,0015,0091">　└-会议培训椅</option>
	<option value="0001,0016">├-文件柜系列</option>
	<option value="0001,0016,0056">　├-实木书柜</option>
	<option value="0001,0016,0057">　├-板式书柜</option>
	<option value="0001,0016,0058">　├-钢制文件柜</option>
	<option value="0001,0016,0059">　├-钢制更衣柜</option>
	<option value="0001,0016,0060">　├-地柜</option>
	<option value="0001,0016,0061">　└-保险柜</option>
	<option value="0001,0017">├-办公前台系列</option>
	<option value="0001,0017,0062">　├-板式前台</option>
	<option value="0001,0017,0063">　├-烤漆前台</option>
	<option value="0001,0017,0064">　└-实木前台</option>
	<option value="0001,0018">├-沙发茶几系列</option>
	<option value="0001,0018,0065">　├-气派舒适沙发</option>
	<option value="0001,0018,0066">　├-时尚休闲沙发</option>
	<option value="0001,0018,0067">　├-布艺沙发</option>
	<option value="0001,0018,0068">　├-木茶几</option>
	<option value="0001,0018,0069">　├-玻璃茶几</option>
	<option value="0001,0018,0092">　└-茶台</option>
	<option value="0001,0019">├-高隔断系列</option>
	<option value="0001,0019,0070">　├-高档加厚型</option>
	<option value="0001,0019,0071">　└-经济普通型</option>
	<option value="0001,0020">├-办公装饰系列</option>
	<option value="0001,0020,0072">　├-办公地毯</option>
	<option value="0001,0020,0074">　├-装饰灯</option>
	<option value="0001,0020,0082">　├-饰品和装饰画</option>
	<option value="0001,0020,0085">　└-装饰窗帘</option>
	<option value="0001,0076">└-其它</option>
	<option value="0001,0076,0077">　├-高管办公家具</option>
	<option value="0001,0076,0078">　├-职员办公家具</option>
	<option value="0001,0076,0079">　├-公共办公家具</option>
	<option value="0001,0076,0080">　├-会议培训家具</option>
	<option value="0001,0076,0086">　└-学校教育家具</option>

</select>
				<i class="revise_sub"></i>
			</span>
                            <div class="search_so f_fl">
                                <input class="so_text f_fl clear_word" type="text" value="" placeholder="请输入关键字">
                                <input class="so_btn f_csp f_fl" type="button">
                            </div>
                        </div>
                        <div class="f_cb f_mt30">
                            <dl class="sv_checkbox f_fl">
                                <dt>请选择关联产品</dt>
                                <dd>
                                    <select multiple="multiple" class="right_select" size="5"></select>
                                </dd>
                            </dl>
                            <div class="sv_check_btn f_fl">
                                <span class="sv_add">添 加</span>
                                <span class="sv_dele">删 除</span>
                            </div>
                            <dl class="sv_checkbox f_fl">
                                <dt class="pr">已选择产品</dt>
                                <dd>
                                    <select name="RelevantProducts$dllSelect" id="RelevantProducts_dllSelect" multiple="multiple" class="left_select" columntype="Product">

                                    </select>
                                    <input type="hidden" name="RelevantProducts$hdSelect" id="RelevantProducts_hdSelect">
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    $(function () {
                        Timeout(function () {
                            loadJs("js/other/selectRelevant.js", function () {
                                var id = "RelevantProducts_hdSelect";
                                var me = $("#" + id);
                                new RelevantDetailed(me);
                            });
                        });
                    });
                </script>

                <div class="f_cb mt40">
                    <label class="add_label f_fl"><span class="f_pdl15">关联资讯</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
			<span class="clear_bd f_fl cho_album f_mr20">
                <select name="RelevantNews$ddlSelectColumn" id="RelevantNews_ddlSelectColumn" class="pass_faq selectColumn" columntype="News">
	<option selected="selected" value="">请选择分类....</option>
	<option value="0001">根栏目</option>
	<option value="0001,0011">├-新闻资讯</option>
	<option value="0001,0011,0013">　├-新闻动态</option>
	<option value="0001,0011,0014">　├-家具常识</option>
	<option value="0001,0011,0021">　└-代理品牌</option>
	<option value="0001,0012">└-成功案例</option>
	<option value="0001,0012,0015">　├-政府机关案例</option>
	<option value="0001,0012,0015,0023">　　└-成功案例</option>
	<option value="0001,0012,0016">　├-公司企业案例</option>
	<option value="0001,0012,0017">　├-医疗教育案例</option>
	<option value="0001,0012,0018">　├-金融银行案例</option>
	<option value="0001,0012,0019">　└-经典成功案例</option>

</select>
				<i class="revise_sub"></i>
			</span>
                            <div class="search_so f_fl">
                                <input class="so_text f_fl clear_word" type="text" value="" placeholder="请输入关键字">
                                <input class="so_btn f_csp f_fl" type="button">
                            </div>
                        </div>
                        <div class="f_cb f_mt30">
                            <dl class="sv_checkbox f_fl">
                                <dt>请选择关联资讯</dt>
                                <dd>
                                    <select multiple="multiple" class="right_select" size="5"></select>
                                </dd>
                            </dl>
                            <div class="sv_check_btn f_fl">
                                <span class="sv_add">添 加</span>
                                <span class="sv_dele">删 除</span>
                            </div>
                            <dl class="sv_checkbox f_fl">
                                <dt class="pr">已选择资讯</dt>
                                <dd>
                                    <select name="RelevantNews$dllSelect" id="RelevantNews_dllSelect" multiple="multiple" class="left_select" columntype="News">

                                    </select>
                                    <input type="hidden" name="RelevantNews$hdSelect" id="RelevantNews_hdSelect">
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    $(function () {
                        Timeout(function () {
                            loadJs("js/other/selectRelevant.js", function () {
                                var id = "RelevantNews_hdSelect";
                                var me = $("#" + id);
                                new RelevantDetailed(me);
                            });
                        });
                    });
                </script>
            </div>
            <!-- 关联资讯或服务  end-->

            <!--按钮-->
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15"></span></label>
                <div class="add_r f_fl">
                    <!-- 保存并返回 -->
                    <div class="view_btn f_mt30">
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><input type="submit" name="btnSave" value="保 存" onclick="return ValidateForm(this);" id="btnSave"></span>

                        <span class="e_btn2 f_ml35 f_csp fl" onclick="listView();"><i class="back_icon"></i>返 回</span></div>
                </div>
            </div>

        </div>


        <script type="text/javascript">
            layui.use(['form','layer','layedit','laydate','upload'],function(){
                var form = layui.form,
                    layer = parent.layer === undefined ? layui.layer : top.layer,
                    laypage = layui.laypage,
                    upload = layui.upload,
                    layedit = layui.layedit,
                    laydate = layui.laydate,
                    $ = layui.jquery;

                //用于同步编辑器内容到textarea
                layedit.sync(editIndex);

                //创建一个编辑器
                layedit.set({
                    uploadImage: {
                        url: '/up/lay' //接口url
                        , type: 'post' //默认post
                    }
                });
                var editIndex = layedit.build('contents',{
                    tool: ["strong", "italic", "underline", "del", "|", "left", "center", "right", "|", "link", "unlink", "face", "image","code"],
                    height : 400,

                });

                form.on('switch(reward)', function(data){
                    if(data.elem.checked){
                        $("#reward_input").removeClass("layui-hide");
                        $("#is_reward").val(1);
                    }else{
                        $("#reward_input").addClass("layui-hide");
                        $("#is_reward").val(0);
                    }
                });

                form.on('switch(is_show)', function(data){
                    if(data.elem.checked){
                        $("#is_show").val(1);
                    }else{
                        $("#is_show").val(0);
                    }
                });

                form.on("submit(questionAdd)",function(data){
                    var content = layedit.getContent(editIndex);
                    $("#contents").val(content);
                    var options = {
                        dataType: "json",
                        success: function (d) {
                            if(d && d.code==1){
                                parent.layer.msg("发帖成功~", {icon: 6});
                                setTimeout(function () {
                                    window.location.href=d.result;
                                },800)
                            }else{
                                layer.msg(d.message?d.message:"发布失败~",{icon:5});
                            }

                        },
                        error: function (d) {
                            layer.msg(d.message?d.message:"发布失败~",{icon:5});
                        }
                    };
                    $("#listForm").ajaxSubmit(options);
                    return false;
                })
            })
        </script>
    </form>
</div>

</body>
</@html>
