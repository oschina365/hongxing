<#include "../../common/manage_layout.ftl"/>
<@html title_="添加产品" js_=["/manager/js/common/edit.js"]>
    <div class="col_main">
        <body marginwidth="0" marginheight="0">

        <div class="nsw_bread_tit">
			<span class="nsw_add">当前位置：<a href="/manager/home.aspx" target="_parent">后台首页</a>&gt;<a href="#">
					<b>产品管理</b>
				</a>&gt;<a href="products_edit.aspx">产品录入</a>
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
										<input name="txtTitle" type="text" maxlength="64" id="txtTitle" class="com_input clear_word EnterWords CreatePY validatebox-text validatebox-invalid" data-src="{&quot;pyid&quot;:&quot;txtFileName&quot;,&quot;type&quot;:&quot;product&quot;}" _required="true" triggerkeyup="triggerkeyup" _defvalue="" title="">
										<i class="clear_x"></i>
									</span>
                                    <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/64字符</em>
                                    <div class="msg_btn f_fl f_csp">添加短标题</div>
                                    <div class="msg_content f_dn pt44 f_fl">
                                        <span class="pd010 f_lht27 f_fl">短标题名称</span>
                                        <input name="txtShortTitle" type="text" maxlength="15" id="txtShortTitle" class="com_input clear_word e_input pt32 f_fl EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
                                        <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/15字符</em>
                                    </div>
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
										<select name="ddlColumnsSource" id="ddlColumnsSource" class="pass_faq" onchange="$('#hdnSelectedColumn').val($(this).val());$('#btnColumn').click();">
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
										<input type="hidden" name="hdnSelectedColumn" id="hdnSelectedColumn">
										<input type="submit" name="btnColumn" value="" id="btnColumn" class="dn">
										<i class="revise_sub"></i>
									</span>

                                </div>
                            </div>
                        </div>

                        <script type="text/javascript">
                            $(function () {
                                $(".add_sort_btn").click(function () {
                                    if ($("div.RelevantColumn").is(":hidden")) {
                                        $("div.RelevantColumn").slideDown(function () {
                                            window.top.SetHeight();
                                        });
                                        $(this).addClass("add_sort_btno")
                                    } else {
                                        $("div.RelevantColumn").slideUp(function () {
                                            window.top.SetHeight();
                                        });
                                        $(this).removeClass("add_sort_btno")
                                    }
                                });
                            })
                        </script>
                        <!-- 默认属性 -->

                        <div class="f_cb f_mt25">
                            <label class="add_label f_fl">
                                <span class="f_pdl15">缩略图</span>
                            </label>
                            <div class="add_r f_fl">
                                <div class="f_cb add_sv">
                                    <div class="f_fl f_csp upload_img Upload_Clik" input="hdThumbnail" id="ThumbnailUpload" directory="Product">
										<span>
											<em class="load_small"></em>点击上传
										</span>
                                    </div>
                                    <input type="hidden" name="hdThumbnail" id="hdThumbnail" width_="" height_="" ratio="">
                                </div>
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
										<input name="txtUrl" type="text" maxlength="64" id="txtUrl" class="com_input clear_word valid_type validatebox-text" validtype="url_" tipposition="top">
										<i class="clear_x"></i>
									</span>
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
										<input name="txtTag" type="text" maxlength="100" id="txtTag" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
										<i class="clear_x"></i>
									</span>
                                    <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>
                                    <div class="selt_mark_btn f_fl f_csp popUp" data-src="{&quot;popup&quot;:&quot;SelectTagPopUp&quot;,&quot;input&quot;:&quot;txtTag&quot;}">选择标签</div>
                                </div>
                            </div>
                        </div>
                        <div class="f_cb f_mt25">
                            <label class="add_label f_fl">
                                <span class="f_pdl15">产品尺寸：</span>
                            </label>
                            <div class="add_r f_fl">
                                <div class="f_cb add_sv">
									<span class="clear_bd f_fl p_inp1">
										<input name="txtCustomFields01" type="text" maxlength="100" id="txtCustomFields01" class="com_input clear_word EnterWords" triggerkeyup="triggerkeyup" _defvalue="">
										<i class="clear_x"></i>
									</span>
                                    <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_">0/100字符</em>

                                </div>
                            </div>
                            <input type="hidden" name="hdOtherField" id="hdOtherField" value="txtCustomFields01">
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
                            <textarea name="ThumbnailImage$TImages" rows="2" cols="20" id="ThumbnailImage_TImages" class="dn" style="width:700px;"></textarea>
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
                                    <textarea name="txtShortDesc" rows="2" cols="20" id="txtShortDesc" class="text_area tx1"></textarea>
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
									<input type="submit" name="btnSave" value="保 存" onclick="return ValidateForm(this);" id="btnSave">
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
    </div>
</@html>
