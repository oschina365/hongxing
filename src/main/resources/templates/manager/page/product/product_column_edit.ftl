<#include "../../common/manage_layout.ftl"/>
<@html title_="添加产品分类" css_=["/manager/skins/base/products.css","/manager/skins/base/dialog.css","/manager/skins/default/list.css"]
js_=["/manager/js/common/common.js","/manager/js/common/edit.js"]>
	<body marginwidth="0" marginheight="0">

		<div class="nsw_bread_tit">
			<span class="nsw_add">当前位置：<a href="/manager/home.aspx" target="_parent">后台首页</a>&gt;<a href="#">
					<b>产品管理</b>
				</a>&gt;<a href="product_column_edit.aspx">分类录入</a>
			</span>
		</div>

		<form name="form2" method="post" action="/manage/product_column_edit_post" id="form2" onsubmit="top.refreshList=true;">
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
								<label for="parent_id"></label>
								<select name="parent_id" id="parent_id" class="pass_faq">
									<option value="0" >顶级父类</option>
									<#if categorys??>
										<#list categorys as category>
											<#if category?? && category.id gt 0>
												<option value="${category.id}">${category.name}</option>
												<#if category.childs?? && (category.childs?size > 0) >
												<#list category.childs as child>
													<option value="${child.id}"> └-${child.name}</option>
												</#list>
											</#if>
											</#if>
										</#list>
									</#if>
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
								<input name="name" type="text" maxlength="64" id="txtTitle" class="com_input clear_word EnterWords CreatePY validatebox-text validatebox-invalid" data-src="{&quot;pyid&quot;:&quot;txtFileName&quot;,&quot;type&quot;:&quot;productcolumn&quot;}" _required="true" triggerkeyup="triggerkeyup" _defvalue="">
								<i class="clear_x"></i>
							</span>
								<em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
							</div>
						</div>
					</div>
					<div class="f_cb f_mt25">
						<label class="add_label padt5 f_fl">
							<span class="f_ldb f_pdl15">分类小图标</span>
						</label>
						<div class="add_r f_fl">
							<div class="f_cb">
								<div class="colum_onload f_csp f_fl Upload_Clik" id="icoUpload" input="hdIco" directory="Product">
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
								<div class="colum_onload f_csp f_fl Upload_Clik" id="photoPathUpload" input="hdPhotopath" directory="Product">
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
								<div class="selt_mark_btn f_fl f_csp popUp" data-src="{&quot;popup&quot;:&quot;SelectTagPopUp&quot;,&quot;input&quot;:&quot;txtDefaultTag&quot;}">选择标签</div>
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
				<!-- 分类基本属性 end-->

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
							<input type="button" name="btnSave" value="保 存"  id="btnSave" onclick="ajaxForm();">
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
							url: '/up/lay?type=product_category' //接口url
							, type: 'post' //默认post
						}
					});
					var editIndex = layedit.build('contents',{
						tool: ["strong", "italic", "underline", "del", "|", "left", "center", "right", "|", "link", "unlink", "face", "image","code"],
						height : 400,

					});

				})

				function ajaxForm(){
					layui.use(['layer'],function() {
						var layer = parent.layer === undefined ? layui.layer : top.layer;
						$.ajax({
							url: "/manage/product_column_edit_post",
							type: "post",
							dataType: "json",
							data: $('#form2').serialize(),
							success: function (d) {
								if (d.code == 1) {
									layer.msg(d.message ? d.message : "添加成功", {
										icon: 6,
										time: 1500
									}, function () {
										window.location.reload;
									});
								} else {
									layer.msg(d.message ? d.message : "添加失败", {icon: 5});
								}

							},
							error: function (d) {
								layer.msg(d.message ? d.message : "网络错误", {icon: 5});
							}
						})
					});
				}
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
		</form>

	</body>
</@html>