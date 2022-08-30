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

				function ajaxForm(){
					layui.use(['layer'],function() {
						var layer = parent.layer === undefined ? layui.layer : top.layer;
						$.ajax({
							url: "/manage/product_column_edit_post",
							type: "post",
							dataType: "json",
							data: JSON.stringify($('#form2').serialize()),
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