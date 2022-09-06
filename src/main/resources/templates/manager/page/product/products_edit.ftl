<#include "../../common/manage_layout.ftl"/>
<@html title_="添加产品">
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
            <form name="form1" method="post" action="/manage/products_edit_post" id="listForm" >
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
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">上传照片</label>
                                            <div class="layui-input-inline uploadHeadImage">
                                                <div class="layui-upload-drag" id="headImg">
                                                    <i class="layui-icon"></i>
                                                    <p>点击上传图片，或将图片拖拽到此处</p>
                                                </div>
                                            </div>
                                            预览图：
                                            <div class="layui-upload-list" id="demo2"></div>

                                            <input type="text" id="imgUrls" name="imgUrls" style="display: none;" class="layui-input">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

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
                                        <div id="next_01" class="md_next f_fl f_csp"><img src="/manager/skins/css/rightjt.gif"></div>
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
                                    <textarea id="content" name="content" ></textarea>
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
                                <button class="layui-btn" lay-filter="productAdd" lay-submit>保存</button>
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
                        var editIndex = layedit.build('content',{
                            tool: ["strong", "italic", "underline", "del", "|", "left", "center", "right", "|", "link", "unlink", "face", "image","code"],
                            height : 400,
                        });

                        let index = layedit.build('content');
                        form.verify({
                            index: function(value) {
                                return layedit.sync(index);
                            }
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

                        var s = "";

                        //拖拽上传
                        var uploadInst = upload.render({
                            elem: '#headImg'
                            , url: '/up/lay?type=product'
                            , size: 1000
                            , multiple: true
                            , number: 7
                            , before: function (obj) {
                                //预读本地文件示例，不支持ie8
                                obj.preview(function (index, file, result) {
                                    // $('#demo1').attr('src', result); //图片链接（base64）
                                    $('#demo2').append('<img src="' + result
                                        + '" alt="' + file.name
                                        + '"height="100px" width="100px" class="layui-upload-img uploadImgPreView">')


                                });
                            }
                            , done: function (res) {
                                if (s == "") {
                                    s = JSON.stringify(res);
                                } else {
                                    s = s + "," + JSON.stringify(res);
                                };
                                localStorage.setItem("address1", s);
                            }
                            , error: function () {
                                demoText.find('.demo-reload').on('click', function () {
                                    uploadInst.upload();
                                });
                            }

                        });

                        form.on("submit(productAdd)",function(data){
                            var content = layedit.getContent(editIndex);
                            $("#content").val(content);
                            var options = {
                                dataType: "json",
                                success: function (d) {
                                    if (d.code == 1) {
                                        layer.confirm('添加成功', {
                                            btn: ['好的','查看产品列表'] //按钮
                                        }, function(){
                                            location.href = "/manage/products_edit";
                                        }, function(){
                                            location.href = "/manage/products";
                                        });
                                    } else {
                                        layer.msg(d.message ? d.message : "添加失败", {icon: 5});
                                    }

                                },
                                error: function (d) {
                                    layer.msg(d.message ? d.message : "网络错误", {icon: 5});
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
