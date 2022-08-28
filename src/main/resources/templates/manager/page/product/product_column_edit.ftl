<#include "../../common/manage_layout.ftl"/>
<@html title_="产品列表" css_=["/manager/skins/base/products.css","/manager/skins/base/dialog.css","/manager/skins/default/list.css"]
js_=["/manager/js/common/common.js","/manager/js/common/edit.js"]>
<body marginwidth="0" marginheight="0">

<div class="nsw_bread_tit">
	<span class="nsw_add">当前位置：<a href="/manager/home.aspx" target="_parent">后台首页</a>&gt;<a href="#"><b>产品管理</b></a>&gt;<a href="product_column_edit.aspx">分类录入</a></span>

</div>
<div class="col_main">
	<div class="add_tile_tab f_cb">
		<ul class="f_cb addtab_ul addtab_ul_column j_recordCon f_fl">
			<li class="active li1 thistab"><span class="sp"><em class="zline1"></em><em class="zline2"></em><i class="red_point">*</i>分类基本属性</span></li>
			<li><span class="sp"><em class="zline1"></em><em class="zline2"></em>SEO搜索引擎</span></li>
			<li><span class="sp"><em class="zline1"></em><em class="zline2"></em>产品属性</span></li>
			<li><span class="sp"><em class="zline1"></em><em class="zline2"></em>其他属性</span></li>
			<li><span class="sp"><em class="zline1"></em><em class="zline2"></em>内页模板管理</span></li>
			<li class="li6"><span class="sp"><em class="zline1"></em><em class="zline2"></em>相关产品及资讯</span></li>
		</ul>
	</div>
</div>
<form name="form2" method="post" action="product_column_edit.aspx" id="form2" onsubmit="top.refreshList=true;">
	<div>
		<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="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AjQ3AjQ4AjQ5AjUwAjUxAjUyAjUzAjU0AjU1AjU2AjU3AjU4AjU5AjYwAjYxAjYyAjYzAjY0AjY1AjY2AjY3AjY4AjY5AjcwAjcxAjcyAjczAjc0Ajc1Ajc2Ajc3Ajc4Ajc5AjgwAjgxAjgyAjgzAjg0Ajg1Ajg2Ajg3Ajg4Ajg5AjkwAjkxAjkyAjkzAjk0Ajk1Ajk2Ajk3Ajk4Ajk5AzEwMAMxMDEDMTAyAzEwMwMxMDQDMTA1AzEwNgMxMDcDMTA4AzEwOQMxMTADMTExAzExMgMxMTMDMTE0AzExNQMxMTYDMTE3AzExOAMxMTkDMTIwAzEyMQMxMjIDMTIzAzEyNAMxMjUDMTI2AzEyNwMxMjgDMTI5AzEzMAMxMzEDMTMyAzEzMwMxMzQDMTM1AzEzNgMxMzcDMTM4AzEzOQMxNDADMTQxAzE0MgMxNDMDMTQ0AzE0NQMxNDYDMTQ3AzE0OAMxNDkDMTUwAzE1MQMxNTIDMTUzAzE1NAMxNTUDMTU2AzE1NwMxNTgDMTU5AzE2MAMxNjEDMTYyAzE2MwMxNjQDMTY1AzE2NgMxNjcDMTY4AzE2OQMxNzADMTcxAzE3MgMxNzMDMTc0AzE3NQMxNzYDMTc3AzE3OAMxNzkDMTgwAzE4MQMxODIDMTgzAzE4NAMxODUDMTg2AzE4NwMxODgDMTg5AzE5MAMxOTEDMTkyAzE5MwMxOTQDMTk1AzE5NgMxOTcDMTk4AzE5ORXIAQEwATEBMgEzATQBNQE2ATcBOAE5AjEwAjExAjEyAjEzAjE0AjE1AjE2AjE3AjE4AjE5AjIwAjIxAjIyAjIzAjI0AjI1AjI2AjI3AjI4AjI5AjMwAjMxAjMyAjMzAjM0AjM1AjM2AjM3AjM4AjM5AjQwAjQxAjQyAjQzAjQ0AjQ1AjQ2AjQ3AjQ4AjQ5AjUwAjUxAjUyAjUzAjU0AjU1AjU2AjU3AjU4AjU5AjYwAjYxAjYyAjYzAjY0AjY1AjY2AjY3AjY4AjY5AjcwAjcxAjcyAjczAjc0Ajc1Ajc2Ajc3Ajc4Ajc5AjgwAjgxAjgyAjgzAjg0Ajg1Ajg2Ajg3Ajg4Ajg5AjkwAjkxAjkyAjkzAjk0Ajk1Ajk2Ajk3Ajk4Ajk5AzEwMAMxMDEDMTAyAzEwMwMxMDQDMTA1AzEwNgMxMDcDMTA4AzEwOQMxMTADMTExAzExMgMxMTMDMTE0AzExNQMxMTYDMTE3AzExOAMxMTkDMTIwAzEyMQMxMjIDMTIzAzEyNAMxMjUDMTI2AzEyNwMxMjgDMTI5AzEzMAMxMzEDMTMyAzEzMwMxMzQDMTM1AzEzNgMxMzcDMTM4AzEzOQMxNDADMTQxAzE0MgMxNDMDMTQ0AzE0NQMxNDYDMTQ3AzE0OAMxNDkDMTUwAzE1MQMxNTIDMTUzAzE1NAMxNTUDMTU2AzE1NwMxNTgDMTU5AzE2MAMxNjEDMTYyAzE2MwMxNjQDMTY1AzE2NgMxNjcDMTY4AzE2OQMxNzADMTcxAzE3MgMxNzMDMTc0AzE3NQMxNzYDMTc3AzE3OAMxNzkDMTgwAzE4MQMxODIDMTgzAzE4NAMxODUDMTg2AzE4NwMxODgDMTg5AzE5MAMxOTEDMTkyAzE5MwMxOTQDMTk1AzE5NgMxOTcDMTk4AzE5ORQrA8gBZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dkZAIlDxYCHgdWaXNpYmxlaGQYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFhIFFHJ1cmxObyRoZFJhZGlvQnV0dG9uBRVydXJsWWVzJGhkUmFkaW9CdXR0b24FFXJ1cmxZZXMkaGRSYWRpb0J1dHRvbgUccklzU2hvd0Rlc2NZZXMkaGRSYWRpb0J1dHRvbgUccklzU2hvd0Rlc2NZZXMkaGRSYWRpb0J1dHRvbgUbcklzU2hvd0Rlc2NObyRoZFJhZGlvQnV0dG9uBQ9jaGtJc0Z1bGxTY3JlZW4FDmNibEF1dGhvcml0eSQwBQ5jYmxBdXRob3JpdHkkMQUOY2JsQXV0aG9yaXR5JDIFDmNibEF1dGhvcml0eSQzBQ5jYmxBdXRob3JpdHkkMwUMY2hrSXNDb21tZW5kBQljaGtJc0Jlc3QFCGNoa0lzVG9wBRpyZG9FbmFibGVZZXMkaGRSYWRpb0J1dHRvbgUZcmRvRW5hYmxlTm8kaGRSYWRpb0J1dHRvbgUZcmRvRW5hYmxlTm8kaGRSYWRpb0J1dHRvbrbaSk6+bNR73+RatsJE9guDj/ZY">
	</div>

	<div>

		<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="5F43C757">
	</div>
	<div class="add_cont pad300 j_recordCon_c f_cb">
		<!-- 分类基本属性 -->
		<div class="cont1 tab_cat_cont" tab_index="0" style="display: block;">
			<div class="f_cb">
				<label class="add_label f_fl"><i class="red_point">*</i>上级分类</label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
					        <span class="clear_bd s_selt f_fl pt43 f_mr15">
                                <select name="ddlMenus" id="ddlMenus" class="pass_faq">
	<option value="1" sid="0001">产品根目录</option>
	<option value="9" sid="0001,0009">├-按用途分类</option>
	<option value="21" sid="0001,0009,0021">　├-总裁-总经理</option>
	<option value="22" sid="0001,0009,0022">　├-总监-经理</option>
	<option value="23" sid="0001,0009,0023">　├-主管-职员</option>
	<option value="24" sid="0001,0009,0024">　├-前台、公共休闲区</option>
	<option value="25" sid="0001,0009,0025">　├-会议室区域</option>
	<option value="26" sid="0001,0009,0026">　└-接待洽谈区</option>
	<option value="10" sid="0001,0010">├-按行业分类</option>
	<option value="27" sid="0001,0010,0027">　├-政府机关</option>
	<option value="28" sid="0001,0010,0028">　├-事业单位</option>
	<option value="29" sid="0001,0010,0029">　├-公司企业</option>
	<option value="30" sid="0001,0010,0030">　├-学校家具</option>
	<option value="31" sid="0001,0010,0031">　├-酒店家具</option>
	<option value="32" sid="0001,0010,0032">　├-银行家具</option>
	<option value="33" sid="0001,0010,0033">　└-医院家具</option>
	<option value="11" sid="0001,0011">├-大班台系列</option>
	<option value="34" sid="0001,0011,0034">　├-板式大班台</option>
	<option value="35" sid="0001,0011,0035">　├-实木大班台</option>
	<option value="36" sid="0001,0011,0036">　├-板式中班台</option>
	<option value="37" sid="0001,0011,0037">　├-实木中班台</option>
	<option value="75" sid="0001,0011,0075">　└-全实木办公家具</option>
	<option value="12" sid="0001,0012">├-办公屏风系列</option>
	<option value="38" sid="0001,0012,0038">　├-办公隔断卡座</option>
	<option value="39" sid="0001,0012,0039">　├-开放办公屏风</option>
	<option value="40" sid="0001,0012,0040">　└-钢架组合桌</option>
	<option value="13" sid="0001,0013">├-办公桌系列</option>
	<option value="42" sid="0001,0013,0042">　├-板式办公桌</option>
	<option value="43" sid="0001,0013,0043">　├-钢架办公桌</option>
	<option value="89" sid="0001,0013,0089">　├-升降桌</option>
	<option value="90" sid="0001,0013,0090">　└-实木贴皮办公桌</option>
	<option value="14" sid="0001,0014">├-会议桌系列</option>
	<option value="44" sid="0001,0014,0044">　├-实木会议桌</option>
	<option value="45" sid="0001,0014,0045">　├-板式会议桌</option>
	<option value="46" sid="0001,0014,0046">　├-培训桌</option>
	<option value="47" sid="0001,0014,0047">　├-演讲台</option>
	<option value="48" sid="0001,0014,0048">　├-洽谈桌</option>
	<option value="49" sid="0001,0014,0049">　└-主席台</option>
	<option value="15" sid="0001,0015">├-办公椅系列</option>
	<option value="50" sid="0001,0015,0050">　├-皮面大班椅</option>
	<option value="51" sid="0001,0015,0051">　├-网面大班椅</option>
	<option value="52" sid="0001,0015,0052">　├-网面转椅</option>
	<option value="53" sid="0001,0015,0053">　├-固定椅</option>
	<option value="54" sid="0001,0015,0054">　├-休闲椅</option>
	<option value="55" sid="0001,0015,0055">　├-吧椅</option>
	<option value="84" sid="0001,0015,0084">　├-礼堂椅</option>
	<option value="91" sid="0001,0015,0091">　└-会议培训椅</option>
	<option value="16" sid="0001,0016">├-文件柜系列</option>
	<option value="56" sid="0001,0016,0056">　├-实木书柜</option>
	<option value="57" sid="0001,0016,0057">　├-板式书柜</option>
	<option value="58" sid="0001,0016,0058">　├-钢制文件柜</option>
	<option value="59" sid="0001,0016,0059">　├-钢制更衣柜</option>
	<option value="60" sid="0001,0016,0060">　├-地柜</option>
	<option value="61" sid="0001,0016,0061">　└-保险柜</option>
	<option value="17" sid="0001,0017">├-办公前台系列</option>
	<option value="62" sid="0001,0017,0062">　├-板式前台</option>
	<option value="63" sid="0001,0017,0063">　├-烤漆前台</option>
	<option value="64" sid="0001,0017,0064">　└-实木前台</option>
	<option value="18" sid="0001,0018">├-沙发茶几系列</option>
	<option value="65" sid="0001,0018,0065">　├-气派舒适沙发</option>
	<option value="66" sid="0001,0018,0066">　├-时尚休闲沙发</option>
	<option value="67" sid="0001,0018,0067">　├-布艺沙发</option>
	<option value="68" sid="0001,0018,0068">　├-木茶几</option>
	<option value="69" sid="0001,0018,0069">　├-玻璃茶几</option>
	<option value="92" sid="0001,0018,0092">　└-茶台</option>
	<option value="19" sid="0001,0019">├-高隔断系列</option>
	<option value="70" sid="0001,0019,0070">　├-高档加厚型</option>
	<option value="71" sid="0001,0019,0071">　└-经济普通型</option>
	<option value="20" sid="0001,0020">├-办公装饰系列</option>
	<option value="72" sid="0001,0020,0072">　├-办公地毯</option>
	<option value="74" sid="0001,0020,0074">　├-装饰灯</option>
	<option value="82" sid="0001,0020,0082">　├-饰品和装饰画</option>
	<option value="85" sid="0001,0020,0085">　└-装饰窗帘</option>
	<option value="76" sid="0001,0076">└-其它</option>
	<option value="77" sid="0001,0076,0077">　├-高管办公家具</option>
	<option value="78" sid="0001,0076,0078">　├-职员办公家具</option>
	<option value="79" sid="0001,0076,0079">　├-公共办公家具</option>
	<option value="80" sid="0001,0076,0080">　├-会议培训家具</option>
	<option value="86" sid="0001,0076,0086">　└-学校教育家具</option>

</select>
						        <i class="revise_sub"></i>
					        </span>
					</div>
				</div>
			</div>
			<div class="f_cb f_mt25">
				<label class="add_label f_fl"><i class="red_point">*</i>分类名称</label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><input name="txtTitle" type="text" maxlength="64" id="txtTitle" class="com_input clear_word EnterWords CreatePY validatebox-text validatebox-invalid" data-src="{&quot;pyid&quot;:&quot;txtFileName&quot;,&quot;type&quot;:&quot;productcolumn&quot;}" _required="true" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span><em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
					</div>
				</div>
			</div>
			<div class="f_cb f_mt25">
				<label class="add_label f_fl"><i class="red_point">*</i>栏目名称</label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><input name="txtFileName" type="text" maxlength="64" id="txtFileName" class="com_input clear_word EnterWords validatebox-text validatebox-invalid" _required="true" triggerkeyup="triggerkeyup" _defvalue="" title=""><i class="clear_x"></i></span><em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
						<input type="hidden" name="hidFileName" id="hidFileName">
						<div class="msg_btn f_fl f_csp GetPY">手动更新</div>
					</div>
				</div>
			</div>
			<div class="f_cb f_mt25">
				<label class="add_label f_fl"><i class="red_point">*</i>静态页目录</label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1" style="border-color: rgb(170, 170, 170);"><input name="txtDirectory" type="text" value="/Products/" maxlength="64" id="txtDirectory" class="com_input clear_word EnterWords validatebox-text" _required="true" style="color: rgb(79, 81, 89); border-color: rgb(170, 170, 170);" triggerkeyup="triggerkeyup" _defvalue="/Products/"><i class="clear_x"></i></span><em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">10/64字符</em>
					</div>
				</div>
			</div>
			<div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">关联标签</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><input name="txtDefaultTag" type="text" maxlength="100" id="txtDefaultTag" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span>
						<em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em><div class="selt_mark_btn f_fl f_csp popUp" data-src="{&quot;popup&quot;:&quot;SelectTagPopUp&quot;,&quot;input&quot;:&quot;txtDefaultTag&quot;}">选择标签</div>
					</div>
				</div>
			</div>

			<div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">分类描述</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_editor ">
						<textarea id="contents" name="content" style="width: 800px; height: 400px; visibility: hidden; display: none;" id="txtContent"></textarea>
					</div>
				</div>
			</div>

			<div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15 f_ldb f_lht18">前台列表头<br>部显示描述</span></label>
				<div class="add_r f_fl">

					<span class="f_fl f_db e_radio e_radio2 radio" cur="z_select">显示<span class="dn"><input id="rIsShowDescYes_hdRadioButton" type="radio" name="rIsShowDescYes$hdRadioButton" value="hdRadioButton"></span></span>

					<span class="f_fl f_db e_radio e_radio2 z_select radio" cur="z_select">隐藏<span class="dn"><input id="rIsShowDescNo_hdRadioButton" type="radio" name="rIsShowDescNo$hdRadioButton" value="hdRadioButton" checked="checked"></span></span>
				</div>
			</div>
		</div>
		<!-- 分类基本属性 end-->

		<!--SEO-->
		<div class="cont1 seo_settab f_dn tab_cat_cont" tab_index="1" style="display: none;">
			<div class="f_cb dn">
				<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页核心关键字</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><input name="txtTitleKeyword" type="text" maxlength="64" id="txtTitleKeyword" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span>
						<em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
					</div>
				</div>
			</div>
			<div class="f_cb">
				<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页标题<br><span>(Title)</span></span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><input name="txtPageTitle" type="text" maxlength="64" id="txtPageTitle" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span>
						<em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
						<a href="http://www.nsw88.com/Article/chanpinfenlei-title(_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange f_lht27">不知道怎么填写？</a>
						<a href="javascript:;" class="f_ml10 f_ib f_underline color_orange f_lht27  select_key_words" data-src="{&quot;popup&quot;:&quot;SelectKeywordPopUp&quot;,&quot;input&quot;:&quot;txtPageTitle&quot;,&quot;append&quot;:&quot;true&quot;}">提取关键词</a></div>
				</div>
			</div>
			<div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页关键词<br><span>(Keywords)</span></span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><input name="txtMetaKeyword" type="text" maxlength="100" id="txtMetaKeyword" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span>
						<em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>
						<a href="http://www.nsw88.com/Article/chanpinfenlei-Keywor_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange f_lht27">不知道怎么填写？</a>
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
					<div class="f_cb f_mt5 f_lht27"><div class="f_fl f_mr10 f_ib_">你还可以输<span class="color_orange">250</span>个字符</div><a href="http://www.nsw88.com/Article/chanpinfenlei-descri_1.html" target="_blank" class="f_fl f_ml10 f_ib f_underline color_orange f_mr20">不知道怎么填写？</a><a href="javascript:;" class="f_ml10 f_ib f_underline color_orange f_lht27  select_key_words" data-src="{&quot;popup&quot;:&quot;SelectKeywordPopUp&quot;,&quot;input&quot;:&quot;txtMetaDescription&quot;,&quot;append&quot;:&quot;true&quot;}">提取关键词</a></div>
				</div>
			</div>
		</div>
		<!--SEO END-->

		<!-- 产品属性 -->
		<div class="cont1 else_info f_dn tab_cat_cont" tab_index="2" style="display: none;">
			<div class="f_cb">
				<label class="add_label f_fl"><span class="f_pdl15">相同属性</span></label>
				<div class="add_r f_fl">
					<div class="f_cb">
						<span class="f_fl attr_btn create_attr f_mr30 popUp" data-src="{&quot;popup&quot;:&quot;ProductAttributeColumn&quot;,&quot;temp_id&quot;:&quot;#temp_id&quot;, &quot;updatelist&quot;: &quot;#nsw_list_content&quot;}"><i></i>新建属性</span>
						<span class="f_fl attr_btn importing f_ml15 popUp" data-src="{&quot;popup&quot;:&quot;ImportedProductColumnAttribute&quot;,&quot;temp_id&quot;:&quot;#temp_id&quot;, &quot;updatelist&quot;: &quot;#nsw_list_content&quot;,&quot;column&quot;:&quot;#txtTitle&quot;}"><i></i>导 入</span>
					</div>

					<!-- 属性列表区 开始 -->
					<div id="nsw_list_table" class="attr_list f_mt30">
						<div class="nsw_list_header t_tr">
							<div class="nsw_key_1 t_td">属性名称</div>
							<div class="nsw_key_2 t_td">类型</div>
							<div class="nsw_key_3 t_td">选项（文本框为空）</div>
							<div class="nsw_key_4 t_td">排序</div>
							<div class="nsw_key_5 t_td">操作</div>
						</div>
						<!-- 列表内容开始 -->
						<div id="nsw_list_content">
							<div class="t_tr child_1">

							</div>
						</div>
						<div class="dn" id="temp_id">
							<div class="nsw_parent_tr t_tr">
								<div class="nsw_no1 nsw_key_1 t_td"><span class="short_tit f_fl">{title}<i class="e_edi1 e_more_edit" data-src="{&quot;title&quot;:&quot;修改属性&quot;,&quot;popup&quot;:&quot;ProductAttributeColumn&quot;,&quot;temp_id&quot;:&quot;#temp_id&quot;, &quot;updatelist&quot;: &quot;#nsw_list_content&quot;,&quot;oid&quot;:&quot;{oid}&quot;}"></i></span></div>
								<div class="nsw_key_2 t_td"><span class="attr_text">{type}</span></div>
								<div class="nsw_key_3 t_td"><span class="attr_color">{values}</span><input type="hidden" name="_attrid_" value="{oid}"></div>
								<div class="nsw_tabsort nsw_key_4 t_td">
									<span class="e_up"></span>
									<span class="e_down"></span>
								</div>
								<div class="nsw_key_5 t_td"><span class="admin_dele"></span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$(function () {

					$(document).on("mouseenter", "div.nsw_parent_tr", function () {
						$(this).find("i.e_edi1").show();
					});
					$(document).on("mouseleave", "div.nsw_parent_tr", function () {
						$(this).find("i.e_edi1").hide();
					});

					$(document).on("click", "span.e_up", function () {
						var div = $(this).parents("div.nsw_parent_tr");
						var prev = div.prev("div.nsw_parent_tr");
						if (prev.length) {
							div.insertBefore(prev);
						}
					})
					$(document).on("click", "span.e_down", function () {
						var div = $(this).parents("div.nsw_parent_tr");
						var next = div.next("div.nsw_parent_tr");
						if (next.length) {
							next.insertBefore(div);
						}
					})
					$(document).on("click", "span.admin_dele", function () {
						var parent = $(this).parents("div.nsw_parent_tr");
						_confirm("确定删除该属性？", function () {
							parent.remove();
						});
					})
					loadJs("js/common/popup.js", function () {
						$(document).on("click", "#nsw_list_content .e_more_edit", function () {
							var me = $(this);
							var popUp = me.data("popup");
							if (!popUp) {
								var data = me.attr("data-src") ? _Json(me.attr("data-src")) : null;
								if (!data) {
									_alert("请设置data-src");
								}
								var popup = data.popup || "NewPopUp";
								if (popup && (popup in window)) {
									popUp = window[popup](data);
									popUp._src = me;
									me.data("popup", popUp);
								}
							} else {
								popUp.options.show.call(popUp);
							}
						})
					});
				})
			</script>
		</div>
		<!-- 产品属性 end-->

		<!--其他属性-->
		<div class="cont1 f_dn tab_cat_cont" tab_index="3" style="display: none;">
			<div class="f_cb">
				<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">分类小图标</span></label>
				<div class="add_r f_fl">
					<div class="f_cb">
						<div class="colum_onload f_csp f_fl Upload_Clik" id="icoUpload" input="hdIco" directory="Product"><i class="colum_icon"></i><p class="f_tac f_lht27">点击上传</p></div>
						<input type="hidden" name="hdIco" id="hdIco">
					</div>
				</div>
			</div>
			<div class="f_cb f_mt25">
				<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">分类缩略图</span></label>
				<div class="add_r f_fl">
					<div class="f_cb">
						<div class="colum_onload f_csp f_fl Upload_Clik" id="photoPathUpload" input="hdPhotopath" directory="Product"><i class="colum_icon"></i><p class="f_tac f_lht27">点击上传</p></div>
						<input type="hidden" name="hdPhotopath" id="hdPhotopath">
					</div>
				</div>
			</div>
			<div class="f_cb f_mt25">
				<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">Banner广告图</span></label>
				<div class="add_r f_fl">
					<div class="f_cb">
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
				<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">广告链接地址</span></label>
				<div class="add_r f_fl">
					<div class="f_cb">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><input name="txtBannerURL" type="text" maxlength="100" id="txtBannerURL" class="com_input clear_word EnterWords valid_type validatebox-text" validtype="url_" tipposition="top" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span><em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>
						</div>
					</div>
				</div>
			</div>
			<div class="f_cb f_mt25">
				<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">广告ALT</span></label>
				<div class="add_r f_fl">
					<div class="f_cb">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><input name="txtBannerAlt" type="text" maxlength="100" id="txtBannerAlt" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span><em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>
						</div>
					</div>
				</div>
			</div>
			<div class="f_cb f_mt25">
				<label class="add_label padt5 f_fl"><span class="f_pdl15">扩展标签</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><input name="txtExtendTag" type="text" maxlength="100" id="txtExtendTag" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue=""><i class="clear_x"></i></span><em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>
					</div>
				</div>
			</div>
			<div class="f_cb f_mt25 dn">
				<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">查看权限</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<div class="set_cbs">

							<div class="nsw_check_box w80 bx0">    <span class="ck_box mt5">    <input id="cblAuthority_0" type="checkbox" name="cblAuthority$0" class="dn"></span>    <label class="ck_text">代理商</label></div><div class="nsw_check_box w80 bx1">    <span class="ck_box mt5">    <input id="cblAuthority_1" type="checkbox" name="cblAuthority$1" class="dn"></span>    <label class="ck_text">VIP用户</label></div><div class="nsw_check_box w80 bx2">    <span class="ck_box mt5">    <input id="cblAuthority_2" type="checkbox" name="cblAuthority$2" class="dn"></span>    <label class="ck_text">普通用户</label></div><div class="nsw_check_box w80 bx3">    <span class="ck_box mt5">    <input id="cblAuthority_3" type="checkbox" name="cblAuthority$3" class="dn"></span>    <label class="ck_text">业务组</label></div></div>
					</div>
				</div>
			</div>
			<div class="f_cb f_mt25">
				<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">排序</span></label>
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
				<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">选项</span></label>
				<div class="add_r f_fl">
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
				<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">显示当前栏目</span></label>
				<div class="add_r f_fl">

					<span class="f_fl f_db e_radio z_select radio" name="Enable" cur="z_select">显示<span class="dn"><input id="rdoEnableYes_hdRadioButton" type="radio" name="rdoEnableYes$hdRadioButton" value="hdRadioButton" checked="checked"></span></span>

					<span class="f_fl f_db e_radio radio" name="Enable" cur="z_select">隐藏<span class="dn"><input id="rdoEnableNo_hdRadioButton" type="radio" name="rdoEnableNo$hdRadioButton" value="hdRadioButton"></span></span>
				</div>
			</div>

			<div class="f_cb f_mt25">
				<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">录入时间</span></label>
				<div class="add_r f_fl">
					<div class="f_cb controls_calendar">
						<input name="txtInputTime" type="text" value="2022-08-27 18:08:21" maxlength="16" id="txtInputTime" class="com_input clear_word calendar_tx f_fl" readonly="readonly" style="color: rgb(79, 81, 89); border-color: rgb(170, 170, 170);"><i class="calendar_icon f_fr f_csp"></i>
					</div>
				</div>
			</div>
		</div>
		<!--其他属性 end-->

		<!--内页模版-->
		<div class="cont1 inpage_box f_dn tab_cat_cont" tab_index="4" style="display: none;">
			<div class="model_side model_list_normal ">
				<div class="model_tit"><span class="model_type f_fl"><i></i>模板选择</span></div>
				<div class="model_box">
				</div>
				<input type="hidden" name="hdproductdiretorie" id="hdproductdiretorie" value="product01">
				<input type="hidden" name="hdmobileproductdiretorie" id="hdmobileproductdiretorie">
			</div>
		</div>
		<!--内页模版 end-->

		<!--相关产品及资讯-->
		<div class="cont1 f_dn tab_cat_cont" tab_index="5" style="display: none;">

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
						loadJs("/manager/js/other/selectRelevant.js", function () {
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
						loadJs("/manager/js/other/selectRelevant.js", function () {
							var id = "RelevantNews_hdSelect";
							var me = $("#" + id);
							new RelevantDetailed(me);
						});
					});
				});
			</script>
		</div>
		<!--相关产品及资讯 end-->

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
		<!--按钮 end-->
	</div>

	<script type="text/javascript">
		$(function () {

			$(document).on("mouseenter", "div.nsw_parent_tr", function () {
				$(this).find("i.e_edi1").show();
			});
			$(document).on("mouseleave", "div.nsw_parent_tr", function () {
				$(this).find("i.e_edi1").hide();
			});

			$(document).on("click", "span.e_up", function () {
				var div = $(this).parents("div.nsw_parent_tr");
				var prev = div.prev("div.nsw_parent_tr");
				if (prev.length) {
					div.insertBefore(prev);
				}
			})
			$(document).on("click", "span.e_down", function () {
				var div = $(this).parents("div.nsw_parent_tr");
				var next = div.next("div.nsw_parent_tr");
				if (next.length) {
					next.insertBefore(div);
				}
			})
			$(document).on("click", "span.admin_dele", function () {
				var parent = $(this).parents("div.nsw_parent_tr");
				_confirm("确定删除该属性？", function () {
					parent.remove();
				});
			})
			loadJs("js/common/popup.js", function () {
				$(document).on("click", "#nsw_list_content .e_more_edit", function () {
					var me = $(this);
					var popUp = me.data("popup");
					if (!popUp) {
						var data = me.attr("data-src") ? _Json(me.attr("data-src")) : null;
						if (!data) {
							_alert("请设置data-src");
						}
						var popup = data.popup || "NewPopUp";
						if (popup && (popup in window)) {
							popUp = window[popup](data);
							popUp._src = me;
							me.data("popup", popUp);
						}
					} else {
						popUp.options.show.call(popUp);
					}
				})
			});
		})
	</script></form>


</body>
</@html>