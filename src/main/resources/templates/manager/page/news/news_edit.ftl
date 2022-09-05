<#include "../../common/manage_layout.ftl"/>
<@html title_="添加案例">
    <div class="col_main">
        <body marginwidth="0" marginheight="0">

            <div class="nsw_bread_tit">
			<span class="nsw_add">当前位置：<a href="/manager/index" target="_parent">后台首页</a>&gt;<a href="#">
					<b>案例管理</b>
				</a>&gt;<a href="/manage/products_edit">添加案例</a>
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
                <form name="form1" method="post" action="/manage/news_edit_post" id="listForm" >
                    <div class="add_cont pad300 j_recordCon_c f_cb">
                        <!-- 产品基本信息 -->
                        <div class="cont1 tab_cat_cont" tab_index="0" style="display: block;">
                            <div class="f_cb">
                                <label class="add_label f_fl">
                                    <i class="red_point">*</i>案例标题名称
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
                                    <img id="banner" src="" style="max-height: 100px;display: none">
                                    <button type="button" class="layui-btn" id="test1">
                                        <i class="layui-icon">&#xe67c;</i>上传图片
                                    </button>
                                    <i class="i_shortdesc"></i>
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
                                    url: '/up/lay?type=article' //接口url
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
                                ,url: '/up/lay?type=case' //上传接口
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

                            form.on("submit(productAdd)",function(data){
                                var content = layedit.getContent(editIndex);
                                $("#content").val(content);
                                var options = {
                                    dataType: "json",
                                    success: function (d) {
                                        if (d.code == 1) {
                                            layer.confirm('添加成功', {
                                                btn: ['好的','查看案例列表'] //按钮
                                            }, function(){
                                                location.href = "/manage/news_edit";
                                            }, function(){
                                                location.href = "/manage/news";
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
