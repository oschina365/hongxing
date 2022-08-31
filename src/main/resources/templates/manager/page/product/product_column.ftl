<#include "../../common/manage_layout.ftl"/>
<@html title_="产品列表" css_=["/manager/skins/base/products.css","/manager/skins/base/dialog.css","/manager/skins/default/list.css"]
js_=["/manager/js/common/common.js","/manager/js/common/editor.js","/manager/js/common/list.js"]>

    <body class="column_list" marginwidth="0" marginheight="0">
    <div class="so_bread">
        <div class="nsw_bread_tit f_cb">

			<span class="nsw_add">当前位置：<a href="/manager/index" target="_parent">首页</a>&gt;<a href="#">
					<b>产品管理</b>
				</a>&gt;<a href="product_column.aspx">产品分类</a>
			</span>
            <div class="advanced_so f_fr form_search">
                <div class="search_so f_fl">
                    <input type="text" class="so_text clear_word f_fl" name="kwd">
                    <input type="button" class="so_btn f_csp f_fl" onclick="SearchObjectByGet(this)">
                </div>
                <span class="advan_btn f_fl f_csp">高级</span>
            </div>
        </div>
        <div class="advan_posi design_posi form_search">
            <label class="com_name f_fl f_mr1">标题名称</label>
            <span class="clear_bd f_fl">
				<input class="com_input clear_word" type="text" placeholder="请填写分类名称" name="kwd">
				<i class="clear_x"></i>
			</span>
            <label class="com_name f_fl f_mr1 f_ml2">所属分类</label>
            <span class="clear_bd fast_in s_selt1 f_fl">
				<select class="pass_faq" name="cid">
					<#if categorys??>
                        <#list categorys as category>
                            <#if category?? && category.id gt 0>
                                <option value="${category.id}">${category.name}</option>
								<#if category.childs?? && (category.childs?size> 0) >
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
            <ul class="f_fl f_cb square_ul f_ml15">
                <li class="f_mr10">
                    <div class="nsw_check_box">
						<span class="ck_box mt5">
							<input type="checkbox" class="dn" name="iscommend" value="1">
						</span>
                        <label class="ck_text">推荐</label>
                    </div>
                </li>
                <li class="f_mr10">
                    <div class="nsw_check_box">
						<span class="ck_box mt5">
							<input type="checkbox" class="dn" name="istop" value="1">
						</span>
                        <label class="ck_text">置顶</label>
                    </div>
                </li>
                <li class="f_mr10">
                    <div class="nsw_check_box">
						<span class="ck_box mt5">
							<input type="checkbox" class="dn" name="isbest" value="1">
						</span>
                        <label class="ck_text">精华</label>
                    </div>
                </li>
            </ul>
            <ul class="f_fl f_cb circle_ul">
				<span class="f_fl f_db e_radio radio z_select" cur="z_select">
					<span class="dn">
						<input type="radio" checked="checked" name="enable" value="1">
					</span>
					<label>显示</label>
				</span>
                <span class="f_fl f_db e_radio radio" cur="z_select">
					<span class="dn">
						<input type="radio" name="enable" value="0">
					</span>
					<label>隐藏</label>
				</span>
                <span class="f_fl f_db e_radio radio" cur="z_select">
					<span class="dn">
						<input type="radio" name="enable" value="-1">
					</span>
					<label>不限</label>
				</span>
            </ul>
            <input type="button" class="advan_so_btn f_csp f_fr" value="搜 索" onclick="SearchObjectByGet(this)">
        </div>
    </div>



    <div class="col_main">
        <form name="ctl01" method="post" action="product_column.aspx" id="ctl01">
            <div>
                <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
                <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
                <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTUwODAwMjM3OWRkbcorRjWDwgz9QXnCDEu8jmAY5lw=">
            </div>

            <!-- 列表区 开始 -->
            <div class="nsw_tools_bar f_cb top_nsw_tools_bar" style="background: rgb(255, 255, 255);">
                <ul class="nsw_check_btns f_fl">
                    <li class="f_ml20">
						<span class="sele_all">
							<input type="radio" class="dn">
							<em class="e_word"></em>全选
						</span>|
                        <span class="sele_inverse">反选</span>
                    </li>
                    <li class="f_ml20">
                        <a onclick="return BatchOperation();" id="lnkBtnDel" href="javascript:__doPostBack('lnkBtnDel','')">
                            <span>删除</span>
                        </a>|<span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>
                    </li>
                </ul>
                <div class="batch_act f_fl f_ml20">
					<span class="c_act">其他操作<i class="tri_up f_fr"></i>
					</span>
                    <ul class="batch_dropup column" style="display: none;">
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）？');" href="javascript:__doPostBack('ctl05','')">批量隐藏</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定推荐选中项（共{count}项）？');" href="javascript:__doPostBack('ctl06','')">批量推荐</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）推荐？');" href="javascript:__doPostBack('ctl07','')">批量取消推荐</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定置顶选中项（共{count}项）？');" href="javascript:__doPostBack('ctl08','')">批量置顶</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）置顶？');" href="javascript:__doPostBack('ctl09','')">批量取消置顶</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定精华选中项（共{count}项）？');" href="javascript:__doPostBack('ctl10','')">批量精华</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）精华？');" href="javascript:__doPostBack('ctl11','')">批量取消精华</a>
                        </li>
                        <li class="popUp" data-src="{&quot;popup&quot;:&quot;BatchAddColumnPopUp&quot;,&quot;action&quot;:&quot;BatchAddColumn&quot;,&quot;title&quot;:&quot;批量添加分类&quot;,&quot;type&quot;:&quot;productcolumn&quot;}">
                            批量添加分类
                        </li>
                        <li class="popUp" data-src="{&quot;popup&quot;:&quot;ListImportedColumnAttribute&quot;,&quot;type&quot;:&quot;product&quot;}">
                            批量导入属性
                        </li>
                        <li onclick="edit(event,null,'products.aspx')">返回列表</li>
                    </ul>
                </div>
                <div class="nsw_pagination f_fr f_mr20 f_cb">
                    <span class="p_numb f_fl">共79条&nbsp;|&nbsp;第1/4页</span>
                    <select class="pageList_btn" onchange="var pageFile='product_column.aspx?rc=79&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;">
                        <option value="1" selected="selected">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
                    <div class="pageDown_btn f_fr">
                        <span class="p_prev  disable " title="上一页"></span>
                        <a href="product_column.aspx?rc=79&amp;page=2">
                            <span class="p_next " datahref="product_column.aspx?rc=79&amp;page=2" title="下一页"></span>
                        </a>
                    </div>
                    <!--IndexNavigator End-->
                </div>
            </div>
            <table class="nsw_pro_list grouping" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
                <tbody>
                <tr id="tabHeader" class="parentid_undefined">
                    <th style="width:50px" class="p">
                        <span class="cho"></span>
                    </th>
                    <th style="width:30px">ID</th>
                    <th axis="[Title]" style=" width:200px;" class="order">产品分类</th>
                    <th style="width:50px" axis="[isCommend]" class="order">推荐</th>
                    <th style="width:50px" axis="[isTop]" class="order">置顶</th>
                    <th style="width:50px" axis="[isBest]" class="order">精华</th>
                    <th style="width:50px" axis="[Enable]" class="order">可用</th>
                    <th style="width:50px" axis="[PostSum]" class="order">数量</th>
                    <th style="width:50px" axis="[OrderID]" class="order">排序</th>
                    <th style="width:120px" axis="[InputTime]" class="tcenter order">录入时间</th>
                    <th style="width:60px">操作</th>

                    <th style="width:60px;">
                        <b>手机</b>操作
                    </th>

                </tr>

                <tr class="child_1  dn parentid_0" oid="1" parentid="0">
                    <td class="td1">

                    </td>
                    <td>1</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick=" ">根分类</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="1" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="1" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="1" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="1" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>20</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;1&quot;}" style="">
								<i style="font-style:normal;">1</i>
								<input type="text" style="border:0;width:90%;height:0px;line-height:0px;display:none;border:1px solid #ccc;" defvalue="1">
							</span>
                    </td>
                    <td>
							<span>2014-03-08
								<br -="">10:50:55</span>
                    </td>
                    <td class="nsw_cnt_area action_tx  f_noinfo"></td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,1)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_1" oid="9" parentid="1">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="9">
									</span>
								</span>
                        </div>
                    </td>
                    <td>9</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,9)">├-按用途分类</a>

								<i class="contraction popUp"></i>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="9" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="9" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="9" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="9" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>0</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;9&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:56:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/aytfl.html" title="按用途分类" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,9,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;9&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,9)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_9" oid="21" parentid="9">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="21">
									</span>
								</span>
                        </div>
                    </td>
                    <td>21</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,21)">　├-总裁-总经理</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="21" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="21" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="21" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="21" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>11</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;21&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:56:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/zczjl.html" title="总裁-总经理" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,21,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;21&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,21)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_9" oid="22" parentid="9">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="22">
									</span>
								</span>
                        </div>
                    </td>
                    <td>22</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,22)">　├-总监-经理</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="22" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="22" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="22" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="22" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>5</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;22&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:56:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/zjjl.html" title="总监-经理" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,22,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;22&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,22)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_9" oid="23" parentid="9">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="23">
									</span>
								</span>
                        </div>
                    </td>
                    <td>23</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,23)">　├-主管-职员</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="23" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="23" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="23" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="23" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>15</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;23&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:56:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/zgzy.html" title="主管-职员" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,23,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;23&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,23)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_9" oid="24" parentid="9">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="24">
									</span>
								</span>
                        </div>
                    </td>
                    <td>24</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,24)">　├-前台、公共休闲区</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="24" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="24" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="24" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="24" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>2</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;24&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:56:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/qtggxxq.html" title="前台、公共休闲区" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,24,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;24&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,24)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_9" oid="25" parentid="9">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="25">
									</span>
								</span>
                        </div>
                    </td>
                    <td>25</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,25)">　├-会议室区域</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="25" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="25" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="25" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="25" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>9</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;25&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:56:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/hysqy.html" title="会议室区域" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,25,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;25&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,25)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_9" oid="26" parentid="9">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="26">
									</span>
								</span>
                        </div>
                    </td>
                    <td>26</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,26)">　└-接待洽谈区</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="26" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="26" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="26" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="26" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>18</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;26&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:56:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/jdqtq.html" title="接待洽谈区" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,26,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;26&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,26)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_1" oid="10" parentid="1">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="10">
									</span>
								</span>
                        </div>
                    </td>
                    <td>10</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,10)">├-按行业分类</a>

								<i class="contraction popUp"></i>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="10" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="10" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="10" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="10" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>0</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;10&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:56:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/axyfl.html" title="按行业分类" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,10,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;10&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,10)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_10" oid="27" parentid="10">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="27">
									</span>
								</span>
                        </div>
                    </td>
                    <td>27</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,27)">　├-政府机关</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="27" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="27" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="27" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="27" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>0</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;27&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:57:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/zfjg.html" title="政府机关" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,27,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;27&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,27)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_10" oid="28" parentid="10">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="28">
									</span>
								</span>
                        </div>
                    </td>
                    <td>28</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,28)">　├-事业单位</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="28" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="28" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="28" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="28" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>0</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;28&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:57:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/sydw.html" title="事业单位" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,28,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;28&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,28)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_10" oid="29" parentid="10">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="29">
									</span>
								</span>
                        </div>
                    </td>
                    <td>29</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,29)">　├-公司企业</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="29" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="29" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="29" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="29" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>0</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;29&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:57:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/gsqy.html" title="公司企业" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,29,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;29&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,29)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_10" oid="30" parentid="10">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="30">
									</span>
								</span>
                        </div>
                    </td>
                    <td>30</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,30)">　├-学校家具</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="30" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="30" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="30" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="30" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>9</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;30&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:57:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/xxjj.html" title="学校家具" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,30,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;30&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,30)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_10" oid="31" parentid="10">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="31">
									</span>
								</span>
                        </div>
                    </td>
                    <td>31</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,31)">　├-酒店家具</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="31" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="31" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="31" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="31" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>15</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;31&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:57:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/jdjj.html" title="酒店家具" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,31,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;31&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,31)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_10" oid="32" parentid="10">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="32">
									</span>
								</span>
                        </div>
                    </td>
                    <td>32</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,32)">　├-银行家具</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="32" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="32" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="32" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="32" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>0</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;32&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:57:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/yxjj.html" title="银行家具" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,32,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;32&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,32)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_10" oid="33" parentid="10">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="33">
									</span>
								</span>
                        </div>
                    </td>
                    <td>33</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,33)">　└-医院家具</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="33" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="33" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="33" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="33" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>0</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;33&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:57:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/yyjj.html" title="医院家具" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,33,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;33&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,33)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_1" oid="11" parentid="1">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="11">
									</span>
								</span>
                        </div>
                    </td>
                    <td>11</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,11)">├-大班台系列</a>

								<i class="contraction popUp"></i>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="11" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="11" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="11" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="11" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>1</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;11&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:56:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/dbtxl.html" title="大班台系列" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,11,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;11&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,11)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_11" oid="34" parentid="11">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="34">
									</span>
								</span>
                        </div>
                    </td>
                    <td>34</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,34)">　├-板式大班台</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="34" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="34" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="34" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="34" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>14</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;34&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:58:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/bsdbt.html" title="板式大班台" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,34,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;34&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,34)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_11" oid="35" parentid="11">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="35">
									</span>
								</span>
                        </div>
                    </td>
                    <td>35</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,35)">　├-实木大班台</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="35" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="35" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="35" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="35" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>9</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;35&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:58:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/smdbt.html" title="实木大班台" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,35,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;35&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,35)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_11" oid="36" parentid="11">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="36">
									</span>
								</span>
                        </div>
                    </td>
                    <td>36</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,36)">　├-板式中班台</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="36" typename="productcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="36" typename="productcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="36" typename="productcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="36" typename="productcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>10</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;36&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">14:58:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/bszbt.html" title="板式中班台" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,36,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;36&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,36)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>


                </tbody>
            </table>
            <!-- 列表分页 开始 -->
            <div class="nsw_tools_bar f_cb">
                <ul class="nsw_check_btns f_fl">
                    <li class="f_ml20">
						<span class="sele_all">
							<input type="radio" class="dn">
							<em class="e_word"></em>全选
						</span>|
                        <span class="sele_inverse">反选</span>
                    </li>
                    <li class="f_ml20">
                        <a onclick="return BatchOperation();" id="lnkBtnDel" href="javascript:__doPostBack('lnkBtnDel','')">
                            <span>删除</span>
                        </a>|<span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>
                    </li>
                </ul>
                <div class="batch_act f_fl f_ml20">
					<span class="c_act">其他操作<i class="tri_up f_fr"></i>
					</span>
                    <ul class="batch_dropup column">
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）？');" href="javascript:__doPostBack('ctl05','')">批量隐藏</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定推荐选中项（共{count}项）？');" href="javascript:__doPostBack('ctl06','')">批量推荐</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）推荐？');" href="javascript:__doPostBack('ctl07','')">批量取消推荐</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定置顶选中项（共{count}项）？');" href="javascript:__doPostBack('ctl08','')">批量置顶</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）置顶？');" href="javascript:__doPostBack('ctl09','')">批量取消置顶</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定精华选中项（共{count}项）？');" href="javascript:__doPostBack('ctl10','')">批量精华</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）精华？');" href="javascript:__doPostBack('ctl11','')">批量取消精华</a>
                        </li>
                        <li class="popUp" data-src="{&quot;popup&quot;:&quot;BatchAddColumnPopUp&quot;,&quot;action&quot;:&quot;BatchAddColumn&quot;,&quot;title&quot;:&quot;批量添加分类&quot;,&quot;type&quot;:&quot;productcolumn&quot;}">
                            批量添加分类
                        </li>
                        <li class="popUp" data-src="{&quot;popup&quot;:&quot;ListImportedColumnAttribute&quot;,&quot;type&quot;:&quot;product&quot;}">
                            批量导入属性
                        </li>
                        <li onclick="edit(event,null,'products.aspx')">返回列表</li>
                    </ul>
                </div>
                <div class="nsw_pagination f_fr f_mr20 f_cb">
                    <!--IndexNavigator Start
    Developed by: Oran(LikeCode####gmail.com)
    Version:v0.5(Apr. 19, 2015)-->
                    <span class="p_numb f_fl">共79条&nbsp;|&nbsp;第1/4页</span>
                    <select class="pageList_btn" onchange="var pageFile='product_column.aspx?rc=79&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;">
                        <option value="1" selected="selected">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
                    <div class="pageDown_btn f_fr">
                        <span class="p_prev  disable " title="上一页"></span>
                        <a href="product_column.aspx?rc=79&amp;page=2">
                            <span class="p_next " datahref="product_column.aspx?rc=79&amp;page=2" title="下一页"></span>
                        </a>
                    </div>
                    <!--IndexNavigator End-->
                </div>
            </div>
            <!-- 列表分页 结束 -->

            <script type="text/javascript">
                IsPostBack = false;
            </script>
        </form>
    </div>

    </body>
</@html>