<#include "../../common/manage_layout.ftl"/>
<@html title_="评论列表"
css_=["/manager/skins/base/common.css",
"/manager/skins/default/default.css",
"/manager/skins/base/editInterface.css"
]
js_=["/manager/js/common/common.js"]>
    <body marginwidth="0" marginheight="0">

    <div class="nsw_bread_tit">
		<span class="nsw_add">当前位置：<a href="/manager/home.aspx" target="_parent">后台首页</a>&gt;<a href="#">
				<b>公司管理</b>
			</a>&gt;<a href="help_column_edit.aspx">分类录入</a>
		</span>

    </div>
    <div class="col_main">
        <div class="add_tile_tab f_cb">
            <ul class="f_cb addtab_ul addtab_ul_column j_recordCon f_fl">
                <li class="active li1 thistab">
					<span class="sp">
						<em class="zline1"></em>
						<em class="zline2"></em>
						<i class="red_point">*</i>分类基本属性
					</span>
                </li>
                <li>
					<span class="sp">
						<em class="zline1"></em>
						<em class="zline2"></em>SEO搜索引擎
					</span>
                </li>
                <li>
					<span class="sp">
						<em class="zline1"></em>
						<em class="zline2"></em>其他属性
					</span>
                </li>
                <li class="li6">
					<span class="sp">
						<em class="zline1"></em>
						<em class="zline2"></em>内页模板管理
					</span>
                </li>
            </ul>
        </div>
    </div>
    <form name="form2" method="post" action="help_column_edit.aspx" id="form2" onsubmit="top.refreshList=true;">
        <div>
            <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE4MzA0MDI3MTgPZBYCAgUPZBYKZg8QZA8WCWYCAQICAgMCBAIFAgYCBwIIFgkQBQ/luK7liqnmoLnnm67lvZUFATFnEAUQ4pScLeWFs+S6jue6oumRqwUBOGcQBRDilJwt5a6a5Yi25pyN5YqhBQE5ZxAFEOKUnC3ojaPoqonotYTotKgFAjEwZxAFEOKUnC3nm7TokKXlsZXljoUFAjExZxAFEOKUnC3ogZTns7vmiJHku6wFAjEyZxAFEOKUnC3lnKjnur/nlZnoqIAFAjEzZxAFEOKUnC3lt6XljoLlrp7lipsFAjE0ZxAFEOKUlC3ku6PnkIblk4HniYwFAjE1Z2RkAh0PEA8WBh4NRGF0YVRleHRGaWVsZAUFVGl0bGUeDkRhdGFWYWx1ZUZpZWxkBQJJRB4LXyFEYXRhQm91bmRnZBAVBAnku6PnkIbllYYJVklQ55So5oi3DOaZrumAmueUqOaItwnkuJrliqHnu4QVBAE1ATQBMwE2FCsDBGdnZ2dkZAIeDxAPFgIfAmdkEBXIAQEwATEBMgEzATQBNQE2ATcBOAE5AjEwAjExAjEyAjEzAjE0AjE1AjE2AjE3AjE4AjE5AjIwAjIxAjIyAjIzAjI0AjI1AjI2AjI3AjI4AjI5AjMwAjMxAjMyAjMzAjM0AjM1AjM2AjM3AjM4AjM5AjQwAjQxAjQyAjQzAjQ0AjQ1AjQ2AjQ3AjQ4AjQ5AjUwAjUxAjUyAjUzAjU0AjU1AjU2AjU3AjU4AjU5AjYwAjYxAjYyAjYzAjY0AjY1AjY2AjY3AjY4AjY5AjcwAjcxAjcyAjczAjc0Ajc1Ajc2Ajc3Ajc4Ajc5AjgwAjgxAjgyAjgzAjg0Ajg1Ajg2Ajg3Ajg4Ajg5AjkwAjkxAjkyAjkzAjk0Ajk1Ajk2Ajk3Ajk4Ajk5AzEwMAMxMDEDMTAyAzEwMwMxMDQDMTA1AzEwNgMxMDcDMTA4AzEwOQMxMTADMTExAzExMgMxMTMDMTE0AzExNQMxMTYDMTE3AzExOAMxMTkDMTIwAzEyMQMxMjIDMTIzAzEyNAMxMjUDMTI2AzEyNwMxMjgDMTI5AzEzMAMxMzEDMTMyAzEzMwMxMzQDMTM1AzEzNgMxMzcDMTM4AzEzOQMxNDADMTQxAzE0MgMxNDMDMTQ0AzE0NQMxNDYDMTQ3AzE0OAMxNDkDMTUwAzE1MQMxNTIDMTUzAzE1NAMxNTUDMTU2AzE1NwMxNTgDMTU5AzE2MAMxNjEDMTYyAzE2MwMxNjQDMTY1AzE2NgMxNjcDMTY4AzE2OQMxNzADMTcxAzE3MgMxNzMDMTc0AzE3NQMxNzYDMTc3AzE3OAMxNzkDMTgwAzE4MQMxODIDMTgzAzE4NAMxODUDMTg2AzE4NwMxODgDMTg5AzE5MAMxOTEDMTkyAzE5MwMxOTQDMTk1AzE5NgMxOTcDMTk4AzE5ORXIAQEwATEBMgEzATQBNQE2ATcBOAE5AjEwAjExAjEyAjEzAjE0AjE1AjE2AjE3AjE4AjE5AjIwAjIxAjIyAjIzAjI0AjI1AjI2AjI3AjI4AjI5AjMwAjMxAjMyAjMzAjM0AjM1AjM2AjM3AjM4AjM5AjQwAjQxAjQyAjQzAjQ0AjQ1AjQ2AjQ3AjQ4AjQ5AjUwAjUxAjUyAjUzAjU0AjU1AjU2AjU3AjU4AjU5AjYwAjYxAjYyAjYzAjY0AjY1AjY2AjY3AjY4AjY5AjcwAjcxAjcyAjczAjc0Ajc1Ajc2Ajc3Ajc4Ajc5AjgwAjgxAjgyAjgzAjg0Ajg1Ajg2Ajg3Ajg4Ajg5AjkwAjkxAjkyAjkzAjk0Ajk1Ajk2Ajk3Ajk4Ajk5AzEwMAMxMDEDMTAyAzEwMwMxMDQDMTA1AzEwNgMxMDcDMTA4AzEwOQMxMTADMTExAzExMgMxMTMDMTE0AzExNQMxMTYDMTE3AzExOAMxMTkDMTIwAzEyMQMxMjIDMTIzAzEyNAMxMjUDMTI2AzEyNwMxMjgDMTI5AzEzMAMxMzEDMTMyAzEzMwMxMzQDMTM1AzEzNgMxMzcDMTM4AzEzOQMxNDADMTQxAzE0MgMxNDMDMTQ0AzE0NQMxNDYDMTQ3AzE0OAMxNDkDMTUwAzE1MQMxNTIDMTUzAzE1NAMxNTUDMTU2AzE1NwMxNTgDMTU5AzE2MAMxNjEDMTYyAzE2MwMxNjQDMTY1AzE2NgMxNjcDMTY4AzE2OQMxNzADMTcxAzE3MgMxNzMDMTc0AzE3NQMxNzYDMTc3AzE3OAMxNzkDMTgwAzE4MQMxODIDMTgzAzE4NAMxODUDMTg2AzE4NwMxODgDMTg5AzE5MAMxOTEDMTkyAzE5MwMxOTQDMTk1AzE5NgMxOTcDMTk4AzE5ORQrA8gBZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dkZAIkDw9kFgIeCHJlYWRvbmx5BQhyZWFkb25seWQCKQ8WAh4HVmlzaWJsZWhkGAEFHl9fQ29udHJvbHNSZXF1aXJlUG9zdEJhY2tLZXlfXxYUBRRydXJsTm8kaGRSYWRpb0J1dHRvbgUVcnVybFllcyRoZFJhZGlvQnV0dG9uBRVydXJsWWVzJGhkUmFkaW9CdXR0b24FEklzU2hvd0ludHJvZHVjdGlvbgUMSXNTaG93RGV0YWlsBRxySXNTaG93RGVzY1llcyRoZFJhZGlvQnV0dG9uBRxySXNTaG93RGVzY1llcyRoZFJhZGlvQnV0dG9uBRtySXNTaG93RGVzY05vJGhkUmFkaW9CdXR0b24FD2Noa0lzRnVsbFNjcmVlbgUOY2JsQXV0aG9yaXR5JDAFDmNibEF1dGhvcml0eSQxBQ5jYmxBdXRob3JpdHkkMgUOY2JsQXV0aG9yaXR5JDMFDmNibEF1dGhvcml0eSQzBQxjaGtJc0NvbW1lbmQFCWNoa0lzQmVzdAUIY2hrSXNUb3AFGnJkb0VuYWJsZVllcyRoZFJhZGlvQnV0dG9uBRlyZG9FbmFibGVObyRoZFJhZGlvQnV0dG9uBRlyZG9FbmFibGVObyRoZFJhZGlvQnV0dG9ugXozWPL9Z+pRseC5wu9h2bJ3DTY=">
        </div>

        <div>

            <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="02792D24">
        </div>
        <div class="add_cont pad300 j_recordCon_c f_cb">
            <!-- 分类基本属性 -->
            <div class="cont1 tab_cat_cont" tab_index="0" style="display: block;">
                <div class="f_cb">
                    <label class="add_label f_fl">
                        <i class="red_point">*</i>上级分类
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
							<span class="clear_bd s_selt f_fl pt43 f_mr15">
								<select name="ddlMenus" id="ddlMenus" class="pass_faq">
									<option value="1" sid="0001">帮助根目录</option>
									<option value="8" sid="0001,0008">├-关于红鑫</option>
									<option value="9" sid="0001,0009">├-定制服务</option>
									<option value="10" sid="0001,0010">├-荣誉资质</option>
									<option value="11" sid="0001,0011">├-直营展厅</option>
									<option value="12" sid="0001,0012">├-联系我们</option>
									<option value="13" sid="0001,0013">├-在线留言</option>
									<option value="14" sid="0001,0014">├-工厂实力</option>
									<option value="15" sid="0001,0015">└-代理品牌</option>

								</select>
								<i class="revise_sub"></i>
							</span>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl">
                        <i class="red_point">*</i>分类名称
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1">
								<input name="txtTitle" type="text" maxlength="64" id="txtTitle" class="com_input clear_word EnterWords CreatePY validatebox-text validatebox-invalid" data-src="{&quot;pyid&quot;:&quot;txtFileName&quot;,&quot;type&quot;:&quot;helpcolumn&quot;}" _required="true" triggerkeyup="triggerkeyup" _defvalue="">
								<i class="clear_x"></i>
							</span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl">
                        <i class="red_point">*</i>栏目名称
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1">
								<input name="txtFileName" type="text" maxlength="64" id="txtFileName" class="com_input clear_word EnterWords validatebox-text validatebox-invalid" _required="true" triggerkeyup="triggerkeyup" _defvalue="">
								<i class="clear_x"></i>
							</span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
                            <input type="hidden" name="hidFileName" id="hidFileName">
                            <div class="msg_btn f_fl f_csp GetPY">手动更新</div>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl">
                        <i class="red_point">*</i>静态页目录
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1" style="border-color: rgb(170, 170, 170);">
								<input name="txtDirectory" type="text" value="/Helps/" maxlength="64" id="txtDirectory" class="com_input clear_word EnterWords validatebox-text" _required="true" style="color: rgb(79, 81, 89); border-color: rgb(170, 170, 170);" triggerkeyup="triggerkeyup" _defvalue="/Helps/">
								<i class="clear_x"></i>
							</span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">7/64字符</em>
                        </div>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl">
                        <span class="f_pdl15">关联标签</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1">
								<input name="txtDefaultTag" type="text" maxlength="100" id="txtDefaultTag" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
								<i class="clear_x"></i>
							</span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>
                            <div class="selt_mark_btn f_fl f_csp popUp" data-src="{&quot;popup&quot;:&quot;SelectTagPopUp&quot;,&quot;input&quot;:&quot;txtDefaultTag&quot;}">
                                选择标签
                            </div>
                        </div>
                    </div>
                </div>

                <div class="f_cb f_mt25 dn" id="PictureSizeTips">
                    <label class="add_label f_fl">
                        <span class="f_pdl15">图片规格大小</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1" style="width: 50px; border-color: rgb(170, 170, 170);">
								<input name="txtWidth" type="text" value="0" maxlength="3" id="txtWidth" class="com_input clear_word valid_type validatebox-text" validtype="number" style="width: 50px; color: rgb(79, 81, 89); border-color: rgb(170, 170, 170);">
								<i class="clear_x"></i>
							</span>
                            <span class="f_fl lh27 ml10">X</span>
                            <span class="clear_bd f_fl p_inp1 ml10" style="width: 50px; border-color: rgb(170, 170, 170);">
								<input name="txtHeight" type="text" value="0" maxlength="3" id="txtHeight" class="com_input clear_word valid_type validatebox-text" validtype="number" style="width: 50px; color: rgb(79, 81, 89); border-color: rgb(170, 170, 170);">
								<i class="clear_x"></i>
							</span>
                        </div>
                        <i class="i_shortdesc"></i>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl">
                        <span class="f_pdl15">显示类型</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">

							<span class="clear_bd s_selt f_fl pt43 f_mr15" style=" width:120px;">
								<select name="ShowTypes" id="ShowTypes" class="pass_faq" style="width:120px;">
									<option selected="selected" value="1">仅标题</option>
									<option value="2">标题+摘要</option>
									<option value="3">标题+缩略图</option>
									<option value="4">标题+缩略图+简介</option>

								</select>
								<i class="revise_sub"></i>
							</span>

                            <div class="nsw_check_box" style="vertical-align:top;margin:4px 0 0 10px; width:110px;">
								<span class="ck_box mt5" id="ShowIntroductionSpan">
									<span class="dn">
										<input id="IsShowIntroduction" type="checkbox" name="IsShowIntroduction" onclick="if($(this).attr('checked')){$('#ShowDetailSpan').removeClass('z_select').find('input').attr('checked',false);};">
									</span>
								</span>
                                <label class="ck_text">显示该简介</label>
                            </div>

                            <div class="nsw_check_box" style="vertical-align:top;margin:4px 0 0 10px; width:110px;">
								<span class="ck_box mt5" id="ShowDetailSpan">
									<span class="dn">
										<input id="IsShowDetail" type="checkbox" name="IsShowDetail" onclick="if($(this).attr('checked')){$('#ShowIntroductionSpan').removeClass('z_select').find('input').attr('checked',false);};">
									</span>
								</span>
                                <label class="ck_text">显示文章内容</label>
                            </div>

                            <span class="clear_bd s_selt f_mr15" style=" width:120px;">
								<select name="ddlList" id="ddlList" class="pass_faq" style="width:120px;">
									<option value="">暂无数据</option>

								</select>
								<i class="revise_sub"></i>
							</span>

                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl">
                        <span class="f_pdl15">分类描述</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_editor ">
                            <textarea id="contents" name="content" style="width: 800px; height: 400px; visibility: hidden; display: none;" id="txtContent"></textarea>
                        </div>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl">
						<span class="f_pdl15 f_ldb f_lht18">前台列表头
							<br>部显示描述</span>
                    </label>
                    <div class="add_r f_fl">
                        <div>

							<span class="f_fl f_db e_radio e_radio2 radio" cur="z_select">显示<span class="dn">
									<input id="rIsShowDescYes_hdRadioButton" type="radio" name="rIsShowDescYes$hdRadioButton" value="hdRadioButton">
								</span>
							</span>

                            <span class="f_fl f_db e_radio e_radio2 z_select radio" cur="z_select">隐藏<span class="dn">
									<input id="rIsShowDescNo_hdRadioButton" type="radio" name="rIsShowDescNo$hdRadioButton" value="hdRadioButton" checked="checked">
								</span>
							</span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 分类基本属性 end-->

            <!--SEO-->
            <div class="cont1 seo_settab f_dn tab_cat_cont" tab_index="1" style="display: none;">
                <div class="f_cb dn">
                    <label class="add_label f_fl">
                        <span class="f_ldb f_pdl15">网页核心关键字</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1">
								<input name="txtTitleKeyword" type="text" maxlength="64" id="txtTitleKeyword" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
								<i class="clear_x"></i>
							</span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
                        </div>
                    </div>
                </div>
                <div class="f_cb">
                    <label class="add_label f_fl">
						<span class="f_ldb f_pdl15">网页标题
							<br>
							<span>(Title)</span>
						</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1">
								<input name="txtPageTitle" type="text" maxlength="64" id="txtPageTitle" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
								<i class="clear_x"></i>
							</span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
                            <a href="http://www.nsw88.com/Article/chanpinfenlei-title(_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange f_lht27">不知道怎么填写？</a>
                            <a href="javascript:;" class="f_ml10 f_ib f_underline color_orange f_lht27  select_key_words" data-src="{&quot;popup&quot;:&quot;SelectKeywordPopUp&quot;,&quot;input&quot;:&quot;txtPageTitle&quot;,&quot;append&quot;:&quot;true&quot;}">提取关键词</a>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl">
						<span class="f_ldb f_pdl15">网页关键词
							<br>
							<span>(Keywords)</span>
						</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1">
								<input name="txtMetaKeyword" type="text" maxlength="100" id="txtMetaKeyword" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
								<i class="clear_x"></i>
							</span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>
                            <a href="http://www.nsw88.com/Article/chanpinfenlei-Keywor_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange f_lht27">不知道怎么填写？</a>
                            <a href="javascript:;" class="f_ml10 f_ib f_underline color_orange f_lht27  select_key_words" data-src="{&quot;popup&quot;:&quot;SelectKeywordPopUp&quot;,&quot;input&quot;:&quot;txtMetaKeyword&quot;,&quot;append&quot;:&quot;true&quot;}">提取关键词</a>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl">
						<span class="f_ldb f_pdl15">网页描述
							<br>
							<span>(Description)</span>
						</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb seo_area">
                            <textarea name="txtMetaDescription" rows="2" cols="20" id="txtMetaDescription" class="seo_descript EnterWords_Decreasing" _maxlength="250" temp="你还可以输<span class='color_orange'>{surplus_length}</span>个字符" triggerkeyup="triggerkeyup" _defvalue=""></textarea>
                            <div class="f_cb f_mt5 f_lht27 f_tar">
                                <span class="inp_tips_gray f_ib"></span>
                            </div>
                        </div>
                        <div class="f_cb f_mt5 f_lht27">
                            <div class="f_fl f_mr10 f_ib_">你还可以输<span class="color_orange">250</span>个字符</div>
                            <a href="http://www.nsw88.com/Article/chanpinfenlei-descri_1.html" target="_blank" class="f_fl f_ml10 f_ib f_underline color_orange f_mr20">不知道怎么填写？</a>
                            <a href="javascript:;" class="f_ml10 f_ib f_underline color_orange f_lht27  select_key_words" data-src="{&quot;popup&quot;:&quot;SelectKeywordPopUp&quot;,&quot;input&quot;:&quot;txtMetaDescription&quot;,&quot;append&quot;:&quot;true&quot;}">提取关键词</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--SEO END-->

            <!--其他属性-->
            <div class="cont1 f_dn tab_cat_cont" tab_index="2" style="display: none;">
                <div class="f_cb">
                    <label class="add_label padt5 f_fl">
                        <span class="f_ldb f_pdl15">分类小图标</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb">
                            <div class="colum_onload f_csp f_fl Upload_Clik" id="icoUpload" input="hdIco" directory="Help">
                                <i class="colum_icon"></i>
                                <p class="f_tac f_lht27">点击上传</p>
                            </div>
                            <input type="hidden" name="hdIco" id="hdIco">
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label padt5 f_fl">
                        <span class="f_ldb f_pdl15">分类缩略图</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb">
                            <div class="colum_onload f_csp f_fl Upload_Clik" id="photoPathUpload" input="hdPhotopath" directory="Help">
                                <i class="colum_icon"></i>
                                <p class="f_tac f_lht27">点击上传</p>
                            </div>
                            <input type="hidden" name="hdPhotopath" id="hdPhotopath">
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label padt5 f_fl">
                        <span class="f_ldb f_pdl15">Banner广告图</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb">
                            <div class="f_fl f_csp upload_img Upload_Clik" input="hdBannerPath" id="BannerPathUpload" directory="others">
								<span>
									<em class="load_small"></em>点击上传
								</span>
                            </div>
                            <input type="hidden" name="hdBannerPath" id="hdBannerPath">
                            <div class="nsw_check_box w80" style="vertical-align:top;margin:12px 0 0 10px;">
								<span class="ck_box mt5">
									<span class="dn">
										<input id="chkIsFullScreen" type="checkbox" name="chkIsFullScreen">
									</span>
								</span>
                                <label class="ck_text">全屏显示</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label padt5 f_fl">
                        <span class="f_ldb f_pdl15">广告链接地址</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb">
                            <div class="f_cb add_sv">
								<span class="clear_bd f_fl p_inp1">
									<input name="txtBannerURL" type="text" maxlength="100" id="txtBannerURL" class="com_input clear_word EnterWords valid_type validatebox-text" validtype="url_" tipposition="top" triggerkeyup="triggerkeyup" _defvalue="">
									<i class="clear_x"></i>
								</span>
                                <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label padt5 f_fl">
                        <span class="f_ldb f_pdl15">广告ALT</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb">
                            <div class="f_cb add_sv">
								<span class="clear_bd f_fl p_inp1">
									<input name="txtBannerAlt" type="text" maxlength="100" id="txtBannerAlt" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
									<i class="clear_x"></i>
								</span>
                                <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label padt5 f_fl">
                        <span class="f_ldb f_pdl15">列表页显示条数</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb">
                            <div class="f_cb add_sv">
								<span class="clear_bd f_fl p_inp1" style="width: 50px; border-color: rgb(170, 170, 170);">
									<input name="txtPageSize" type="text" value="20" maxlength="3" id="txtPageSize" class="com_input clear_word EnterWords valid_type validatebox-text" validtype="number" style="width: 50px; color: rgb(79, 81, 89); border-color: rgb(170, 170, 170);" triggerkeyup="triggerkeyup" _defvalue="20">
									<i class="clear_x"></i>
								</span>
                                <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">2/3字符</em>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25 dn">
                    <label class="add_label padt5 f_fl">
                        <span class="f_ldb f_pdl15">查看权限</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
                            <div class="set_cbs">

                                <div class="nsw_check_box w80 bx0">
									<span class="ck_box mt5">
										<input id="cblAuthority_0" type="checkbox" name="cblAuthority$0" class="dn">
									</span>
                                    <label class="ck_text">代理商</label>
                                </div>
                                <div class="nsw_check_box w80 bx1">
									<span class="ck_box mt5">
										<input id="cblAuthority_1" type="checkbox" name="cblAuthority$1" class="dn">
									</span>
                                    <label class="ck_text">VIP用户</label>
                                </div>
                                <div class="nsw_check_box w80 bx2">
									<span class="ck_box mt5">
										<input id="cblAuthority_2" type="checkbox" name="cblAuthority$2" class="dn">
									</span>
                                    <label class="ck_text">普通用户</label>
                                </div>
                                <div class="nsw_check_box w80 bx3">
									<span class="ck_box mt5">
										<input id="cblAuthority_3" type="checkbox" name="cblAuthority$3" class="dn">
									</span>
                                    <label class="ck_text">业务组</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label padt5 f_fl">
                        <span class="f_ldb f_pdl15">排序</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
							<span class="clear_bd s_selt f_fl pt43 f_mr15" style=" width:50px;">
								<select name="ddlRanking" id="ddlRanking" class="pass_faq" style="width:50px;">
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
                    <label class="add_label padt5 f_fl">
                        <span class="f_ldb f_pdl15">选项</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="nsw_check_box w80">
							<span class="ck_box mt5">
								<span class="dn">
									<input id="chkIsCommend" type="checkbox" name="chkIsCommend">
								</span>
							</span>
                            <label class="ck_text">推荐</label>
                        </div>
                        <div class="nsw_check_box w80">
							<span class="ck_box mt5">
								<span class="dn">
									<input id="chkIsBest" type="checkbox" name="chkIsBest">
								</span>
							</span>
                            <label class="ck_text">精华</label>
                        </div>
                        <div class="nsw_check_box w80">
							<span class="ck_box mt5">
								<span class="dn">
									<input id="chkIsTop" type="checkbox" name="chkIsTop">
								</span>
							</span>
                            <label class="ck_text">置顶</label>
                        </div>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label padt5 f_fl">
                        <span class="f_ldb f_pdl15">显示当前栏目</span>
                    </label>
                    <div class="add_r f_fl">

						<span class="f_fl f_db e_radio z_select radio" name="Enable" cur="z_select">显示<span class="dn">
								<input id="rdoEnableYes_hdRadioButton" type="radio" name="rdoEnableYes$hdRadioButton" value="hdRadioButton" checked="checked">
							</span>
						</span>

                        <span class="f_fl f_db e_radio radio" name="Enable" cur="z_select">隐藏<span class="dn">
								<input id="rdoEnableNo_hdRadioButton" type="radio" name="rdoEnableNo$hdRadioButton" value="hdRadioButton">
							</span>
						</span>
                    </div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label padt5 f_fl">
                        <span class="f_ldb f_pdl15">录入时间</span>
                    </label>
                    <div class="add_r f_fl">
                        <div class="f_cb controls_calendar">
                            <input name="txtInputTime" type="text" value="2022-08-28 09:50:36" maxlength="16" id="txtInputTime" class="com_input clear_word calendar_tx f_fl" readonly="readonly" style="color: rgb(79, 81, 89); border-color: rgb(170, 170, 170);">
                            <i class="calendar_icon f_fr f_csp"></i>
                        </div>
                    </div>
                </div>
            </div>
            <!--其他属性 end-->

            <!--内页模版-->
            <div class="cont1 inpage_box f_dn tab_cat_cont" tab_index="3" style="display: none;">
                <div class="model_side model_list_normal ">
                    <div class="model_tit">
						<span class="model_type f_fl">
							<i></i>模板选择
						</span>
                    </div>
                    <div class="model_box">
                        <iframe src="nvtemps.aspx?type=help&amp;page=nvtemps" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="nvtemps" name="nvtemps"></iframe>
                    </div>
                    <input type="hidden" name="hdhelpdiretorie" id="hdhelpdiretorie" value="help01">
                    <input type="hidden" name="hdmobilehelpdiretorie" id="hdmobilehelpdiretorie">
                </div>

                <div class="model_side model_list_normal f_mt30">
                    <div class="model_tit">
						<span class="model_type f_fl">
							<i></i>详细页模板选择
						</span>
                    </div>
                    <div class="model_box">
                        <iframe src="nvtemps.aspx?type=help&amp;page=detailedpagetemps&amp;input=hdDefaultTemplate&amp;defselect=false&amp;cancel=true&amp;columnid=-1" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="nvtemps01" name="nvtemps01"></iframe>
                    </div>
                    <input type="hidden" name="hdDefaultTemplate" id="hdDefaultTemplate">
                </div>

            </div>
            <!--内页模版 end-->

            <!--按钮-->
            <div class="f_cb f_mt25">
                <label class="add_label f_fl">
                    <span class="f_pdl15"></span>
                </label>
                <div class="add_r f_fl">
                    <!-- 保存并返回 -->
                    <div class="view_btn f_mt30">
						<span class="e_btn1 f_csp fl">
							<i class="insert_icon"></i>
							<input type="submit" name="btnSave" value="保 存" onclick="return ValidateForm(this);" id="btnSave">
						</span>

                        <span class="e_btn2 f_ml35 f_csp fl" onclick="listView();">
							<i class="back_icon"></i>返 回
						</span>
                    </div>
                </div>
            </div>
            <!--按钮 end-->
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


    </body>
</@html>