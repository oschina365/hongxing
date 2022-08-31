<#include "../../common/manage_layout.ftl"/>
<@html title_="添加产品" js_=["/manager/js/common/edit.js"]>
    <div class="col_main">
        <body marginwidth="0" marginheight="0">

        <div class="nsw_bread_tit">
			<span class="nsw_add">当前位置：<a href="/manager/index" target="_parent">后台首页</a>&gt;<a href="#">
					<b>产品管理</b>
				</a>&gt;<a href="/manage/products_edit">产品录入</a>
			</span>

        </div>
        <div class="col_main">
            <div class="add_tile_tab f_cb">
                <ul class="f_cb addtab_ul j_recordCon f_fl">
                    <li class="active li1 thistab">
						<span class="sp">
							<em class="zline1"></em>
							<em class="zline2"></em>
							<i class="red_point">*</i>产品基本信息
						</span>
                    </li>
                </ul>
            </div>
            <form name="form1" method="post" action="/manage/products_edit_post" id="form1" >
                <div class="add_cont pad300 j_recordCon_c f_cb">
                    <!-- 产品基本信息 -->
                    <div class="cont1 tab_cat_cont" tab_index="0" style="display: block;">
                        <div class="f_cb">
                            <label class="add_label f_fl">
                                <i class="red_point">*</i>产品标题名称
                            </label>
                            <div class="add_r f_fl">
                                <div class="f_cb add_sv">
									<span class="clear_bd f_fl p_inp1">
										<input name="name" type="text" maxlength="64" id="txtTitle" class="com_input clear_word EnterWords CreatePY validatebox-text validatebox-invalid" data-src="{&quot;pyid&quot;:&quot;txtFileName&quot;,&quot;type&quot;:&quot;product&quot;}" _required="true" triggerkeyup="triggerkeyup" _defvalue="" title="">
										<i class="clear_x"></i>
									</span>
                                    <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
                                </div>
                            </div>
                        </div>
                        <div class="f_cb f_mt25">
                            <label class="add_label f_fl">
                                <i class="red_point">*</i>所属主要分类
                            </label>
                            <div class="add_r f_fl">
                                <div class="f_cb add_sv">
									<span class="clear_bd s_selt f_fl pt43 f_mr15">
										<select name="category_id" id="ddlColumnsSource" class="pass_faq" onchange="$('#hdnSelectedColumn').val($(this).val());$('#btnColumn').click();">
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

                        <!-- 默认属性 -->

                        <div class="f_cb f_mt25">
                            <label class="add_label f_fl">
                                <span class="f_pdl15">缩略图</span>
                            </label>
                            <div class="add_r f_fl">
                                <input type="hidden" id="thumbnailInput" name="thumbnail"/>
                                <img id="thumbnail" src="" style="max-height: 100px;display: none">
                                <button type="button" class="layui-btn" id="test1">
                                    <i class="layui-icon">&#xe67c;</i>上传图片
                                </button>
                                <i class="i_shortdesc"></i>
                            </div>
                        </div>

                        <div class="f_cb f_mt25">
                            <label class="add_label f_fl">
                                <span class="f_pdl15">外部链接</span>
                            </label>
                            <div class="add_r f_fl">
                                <div class="f_cb add_sv f_lht27">

									<span class="f_fl f_db e_radio e_radio2 z_select radio" cur="z_select">不存在<span class="dn">
											<input id="radioUrlNo_hdRadioButton" type="radio" name="radioUrlNo$hdRadioButton" value="hdRadioButton" checked="checked" onclick="initTabCut(0);$('#url_warp').hide().find('input').val('');">
										</span>
									</span>

                                    <span class="f_fl f_db e_radio e_radio2 radio" cur="z_select">存在<span class="dn">
											<input id="radioUrlYes_hdRadioButton" type="radio" name="radioUrlYes$hdRadioButton" value="hdRadioButton" onclick="initTabCut(1);$('#url_warp').show();">
										</span>
									</span>
                                    <span class="clear_bd f_fl p_inp1" id="url_warp" style="display: none;">
										<input name="link" type="text" maxlength="64" id="txtUrl" class="com_input clear_word valid_type validatebox-text" validtype="url_" tipposition="top">
										<i class="clear_x"></i>
									</span>
                                </div>
                            </div>
                        </div>

                        <#--<div class="f_cb f_mt25">
                            <label class="add_label f_fl">
                                <span class="f_pdl15">关联标签</span>
                            </label>
                            <div class="add_r f_fl">
                                <div class="f_cb add_sv">
									<span class="clear_bd f_fl p_inp1">
										<input name="txtTag" type="text" maxlength="100" id="txtTag" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
										<i class="clear_x"></i>
									</span>
                                    <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>
                                    <div class="selt_mark_btn f_fl f_csp popUp" data-src="{&quot;popup&quot;:&quot;SelectTagPopUp&quot;,&quot;input&quot;:&quot;txtTag&quot;}">选择标签</div>
                                </div>
                            </div>
                        </div>-->
                        <div class="f_cb f_mt25">
                            <label class="add_label f_fl">
                                <span class="f_pdl15">产品尺寸：</span>
                            </label>
                            <div class="add_r f_fl">
                                <div class="f_cb add_sv">
									<span class="clear_bd f_fl p_inp1">
										<input name="size" type="text" maxlength="100" id="txtCustomFields01" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
										<i class="clear_x"></i>
									</span>
                                    <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>

                                </div>
                            </div>
                        </div>

                        <!--缩略图大图-->

                        <div class="f_cb f_mt25">
                            <label class="add_label f_fl">
                                <span class="f_pdl15">产品图片</span>
                            </label>
                            <div class="add_r f_fl">
                                <div class="f_cb add_short bord_gray">
                                    <div class="add_short_tit f_cb">
                                        <span class="f_fl">产品大图</span>
                                        <span class="add_upload_btn f_fr" id="add_upload_btn"></span>
                                    </div>
                                    <div class="add_short_cont f_cb">
                                        <ul class="targetCell"></ul>
                                        <div class="md_prev f_fl f_csp" id="prev_ThumbnailImage_01">
                                            <img src="/manager/skins/Img/leftjt.gif">
                                        </div>
                                        <div class="md_short_cont f_fl f_csp">
                                            <dl class="alt_mark f_fl">
                                                <dt id="load_ThumbnailImage_small_dt" class="editor_warp" data-src="{&quot;editor&quot;:&quot;ThumbnailImage&quot;,&quot;warp&quot;:&quot;#ThumbnailImage_warp&quot;,&quot;directory&quot;:&quot;product&quot;,&quot;InputID&quot;:&quot;ThumbnailImage_TImages&quot;}">
                                                    <em class="load_small"></em>点击上传
                                                </dt>
                                            </dl>
                                            <div class="md_short_hide f_fl">
                                                <div style="width:458px;height:auto;overflow:hidden;position: relative;">
                                                    <ul class="f_cb ThumbnailImage" id="ThumbnailImage_warp" data-src="{&quot;width&quot;:&quot;152&quot;,&quot;show&quot;:&quot;3&quot;,&quot;next&quot;:&quot;#next_ThumbnailImage_01&quot;,&quot;prev&quot;:&quot;#prev_ThumbnailImage_01&quot;}" style="width:10000px;position:relative;left:0;top:0;">

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="md_next f_fl f_csp" id="next_ThumbnailImage_01">
                                            <img src="/manager/skins/Img/rightjt.gif">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <textarea name="content" rows="2" cols="20" id="ThumbnailImage_TImages" class="dn" style="width:700px;"></textarea>
                        </div>
                        <script type="text/javascript">
                            $(function () {
                                Timeout(function () {
                                    loadJs("/manager/js/other/thumbnailImage.js");
                                });
                            })
                        </script>

                        <div class="f_cb f_mt25">
                            <label class="add_label f_fl">
                                <span class="f_pdl15">产品简介录入</span>
                            </label>
                            <div class="add_r f_fl">
                                <div class="f_cb add_typeset bord_gray">
                                    <textarea name="desc" rows="2" cols="20" id="txtShortDesc" class="text_area tx1"></textarea>
                                    <div class="add_short_tit add_typeset_tit f_cb">
                                        <span class="f_fl f_underline">自动排版</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="f_cb f_mt25">
                            <label class="add_label f_fl">
                                <span class="f_pdl15">页面模板选择</span>
                            </label>
                            <div class="add_r f_fl">
                                <div class="f_cb add_sv">
                                    <div class="model_box">
                                        <div class="md_hide f_fl">
                                            <div style="width:506px;height:182px;overflow:hidden;position: relative;"><ul id="ThumbnailImage" class="md_inner ul_level_c f_cb ThumbnailImage" data-src="{&quot;width&quot;:&quot;126&quot;,&quot;show&quot;:&quot;4&quot;,&quot;prev&quot;:&quot;#prev_01&quot;,&quot;next&quot;:&quot;#next_01&quot;}" style="width:10000px;position:relative;left:0;top:0;">

                                                    <li diretorie="product01" styles="" onclick="liClick(event,this);" class="z_select" style="float: left; overflow: hidden;">
                                                        <i class="mdc_zon"></i>
                                                        <i class="v_set" title="全部使用该模板"></i>
                                                        <i class="v_set01" title="设置为默认模板"></i>
                                                        <a href="javascript:;"><img src="/skins/default/template/product/product01/small.gif" onerror="this.src='/manager/js/iconfont-iconfontmoban.png'" big="/manager/skins/default/template/product/product01/small.gif"></a>
                                                        <p>右侧内容+左侧导航</p>
                                                    </li>
                                                    &nbsp; &nbsp; &nbsp;
                                                    <li diretorie="product04" styles="" onclick="liClick(event,this);" style="float: left; overflow: hidden;">
                                                        <i class="mdc_zon"></i>
                                                        <i class="v_set" title="全部使用该模板"></i>
                                                        <i class="v_set01" title="设置为默认模板"></i>
                                                        <a href="javascript:;"><img src="/skins/default/template/product/product04/small.gif" onerror="this.src='/manager/js/iconfont-iconfontmoban.png'" big="/manager/skins/default/template/product/product04/small.gif"></a>
                                                        <p>通栏</p>
                                                    </li>

                                                </ul></div>
                                        </div>
                                        <div id="next_01" class="md_next f_fl f_csp"><img src="/manager/skins/Img/rightjt.gif"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="f_cb f_mt25">
                            <label class="add_label f_fl">
                                <span class="f_pdl15">详情内容录入</span>

                                <br>
                            </label>
                            <div class="add_r f_fl">
                                <div class="f_cb add_typeset bord_gray extend_warp" style="width:98%;">
                                    <div class="add_short_tit f_cb">
                                        <ul class="type_marklist f_fl f_cb" id="addTags">
                                            <li onclick="SetContentToInput(this)" class="cur">详细信息<i></i>
                                                <input type="hidden" name="hdContent" id="hdContent">
                                            </li>

                                        </ul>
                                        <input type="hidden" name="hdAllContent" id="hdAllContent">
                                        <input type="hidden" name="hdSeparate" id="hdSeparate" value="#$$#">
                                        <input type="hidden" name="hdAllTitle" id="hdAllTitle">
                                        <span class="add_mark_btn f_csp f_fr popUp" data-src="{&quot;popup&quot;:&quot;addTag&quot;,&quot;input&quot;:&quot;#addTags&quot;}">添加标签</span>
                                    </div>
                                    <textarea id="contents" name="content" style="width: 800px; height: 400px; visibility: hidden; display: none;" id="txtContent"></textarea>

                                    <div class="add_short_tit add_typeset_tit f_cb">
                                        <span class="f_fl f_underline f_underline_content">自动排版</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 产品基本信息 end-->

                    <!-- 关联产品或服务  end-->
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
									<input type="button" name="btnSave" value="保 存" id="btnSave" onclick="ajaxForm();">
								</span>

                                <span class="e_btn2 f_ml35 f_csp fl" onclick="listView();">
									<i class="back_icon"></i>返 回
								</span>
                            </div>
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
                                url: '/up/lay?type=product' //接口url
                                , type: 'post' //默认post
                            }
                        });
                        var editIndex = layedit.build('contents',{
                            tool: ["strong", "italic", "underline", "del", "|", "left", "center", "right", "|", "link", "unlink", "face", "image","code"],
                            height : 400,
                        });

                        //执行实例
                        var uploadInst = upload.render({
                            elem: '#test1' //绑定元素
                            ,url: '/up/lay?type=product' //上传接口
                            ,done: function(res){
                                //上传完毕回调
                                if(res.key){
                                    $("#thumbnail").css('display','block');
                                    $("#thumbnail").attr('src',res.key);
                                    $("#thumbnailInput").val(res.key);
                                }
                            }
                            ,error: function(){
                                //请求异常回调
                            }
                        });
                    })

                    function ajaxForm(){
                        layui.use(['layer'],function() {
                            var layer = parent.layer === undefined ? layui.layer : top.layer;
                            $.ajax({
                                url: "/manage/products_edit_post",
                                type: "post",
                                dataType: "json",
                                data: $('#form1').serialize(),
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
                </script>
            </form>
        </div>


        </body>
    </div>
</@html>
