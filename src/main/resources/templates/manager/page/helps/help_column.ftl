<#include "../../common/manage_layout.ftl"/>
<@html title_="评论列表"
css_=["/manager/skins/base/common.css",
"/manager/skins/default/default.css",
"/manager/skins/base/editInterface.css"
]
js_=["/manager/js/common/common.js"]>
    <body class="column_list" marginwidth="0" marginheight="0">
    <div class="so_bread">
        <div class="nsw_bread_tit f_cb">

			<span class="nsw_add">当前位置：<a href="/manager/home.aspx" target="_parent">首页</a>&gt;<a href="#">
					<b>公司管理</b>
				</a>&gt;<a href="help_column.aspx">分类列表</a>
			</span>
            <div class="advanced_so f_fr form_search">
                <div class="search_so f_fl">
                    <input type="text" class="so_text clear_word f_fl" name="kwd">
                    <input type="hidden" name="field" value="[Title]|[ShortDesc]">
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
					<option value="0001" oid="1">根目录</option>
					<option value="0001,0008" oid="8">├关于红鑫</option>
					<option value="0001,0009" oid="9">├定制服务</option>
					<option value="0001,0010" oid="10">├荣誉资质</option>
					<option value="0001,0011" oid="11">├直营展厅</option>
					<option value="0001,0012" oid="12">├联系我们</option>
					<option value="0001,0013" oid="13">├在线留言</option>
					<option value="0001,0014" oid="14">├工厂实力</option>
					<option value="0001,0015" oid="15">└代理品牌</option>
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

    <!-- 快速录入 开始 -->
    <div class="nsw_add_proclsify f_cb" style="padding-left:2%;">
        <form onsubmit="return false;">
            <label class="com_name f_fl" style="margin-right:1%;">所属分类</label>
            <span class="clear_bd fast_in f_fl">
				<select class="pass_faq" name="cid">
					<option value="1">根目录</option>
					<option value="8">├关于红鑫</option>
					<option value="9">├定制服务</option>
					<option value="10">├荣誉资质</option>
					<option value="11">├直营展厅</option>
					<option value="12">├联系我们</option>
					<option value="13">├在线留言</option>
					<option value="14">├工厂实力</option>
					<option value="15">└代理品牌</option>
				</select>
				<i class="revise_sub"></i>
			</span>
            <label class="com_name f_ml10 f_fl">分类标题</label>
            <span class="clear_bd th1 f_fl">
				<input class="com_input clear_word validatebox-text validatebox-invalid" name="columns" type="text" maxlength="140" _required="true" tips="分类标题" placeholder="请填写分类名称">
				<i class="clear_x"></i>
			</span>
            <span class="e_btn1 f_ml2 f_csp f_fl f_mr5 ajaxSave" data-src="{&quot;action&quot;:&quot;BatchAddColumn&quot;}">
				<i class="save_icon"></i>保 存
			</span>
            <span class="role_addbtn f_ml2 f_csp f_fl popUp" data-src="{&quot;popup&quot;:&quot;BatchAddColumnPopUp&quot;,&quot;action&quot;:&quot;BatchAddColumn&quot;,&quot;title&quot;:&quot;批量添加帮助分类&quot;,&quot;type&quot;:&quot;helpcolumn&quot;}">添加</span>
            <input type="hidden" name="typename" value="helpcolumn">
            <input type="hidden" name="mode" value="single">
        </form>
    </div>
    <!-- 快速录入 结束 -->

    <div class="col_main">
        <form name="ctl01" method="post" action="help_column.aspx" id="ctl01">
            <div>
                <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
                <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
                <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE2ODA1NzE2NjJkZMR6YfAa98ijLPgZbMQON+oJw40g">
            </div>

            <script type="text/javascript">
                //<![CDATA[
                var theForm = document.forms['ctl01'];
                if (!theForm) {
                    theForm = document.ctl01;
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


            <div>

                <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="A5EBAC49">
                <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWCQLFm7GRCQLM0/WHCAKmwImNCwKjwImNCwKkwImNCwKZwImNCwKawImNCwKhwPWxAgKiwPWxAghSsWadCDc6ZPLZXg/Vb+GyrRHT">
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
                        <li class="popUp" data-src="{&quot;popup&quot;:&quot;BatchAddColumnPopUp&quot;,&quot;action&quot;:&quot;BatchAddColumn&quot;,&quot;title&quot;:&quot;批量添加分类&quot;,&quot;type&quot;:&quot;helpcolumn&quot;}">
                            批量添加分类
                        </li>
                        <li onclick="edit(event,null,'helps.aspx')">返回列表</li>
                    </ul>
                </div>
                <div class="nsw_pagination f_fr f_mr20 f_cb">
                    <!--IndexNavigator Start
    Developed by: Oran(LikeCode####gmail.com)
    Version:v0.5(Apr. 19, 2015)-->
                    <span class="p_numb f_fl">共9条&nbsp;|&nbsp;第1/1页</span>
                    <select class="pageList_btn" onchange="var pageFile='help_column.aspx?rc=9&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;">
                        <option value="1" selected="selected">1</option>
                    </select>
                    <div class="pageDown_btn f_fr">
                        <span class="p_prev  disable " title="上一页"></span>
                        <span class="p_next  disable " title="下一页"></span>
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
                    <th axis="[Title]" style=" width:200px;" class="order">帮助分类</th>
                    <th style="width:50px" axis="[isCommend]" class="order">推荐</th>
                    <th style="width:50px" axis="[isTop]" class="order">置顶</th>
                    <th style="width:50px" axis="[isBest]" class="order">精华</th>
                    <th style="width:50px" axis="[Enable]" class="order">可用</th>
                    <th style="width:50px" axis="[Enable]" class="order">数量</th>
                    <th style="width:50px" axis="[OrderID]" class="order">排序</th>
                    <th style="width:50px" axis="[ShowType]" class="order">显示方式</th>
                    <th style="width:120px" axis="[InputTime]" class="tcenter order">录入时间</th>
                    <th style="width:60px">操作</th>

                    <th style="width:60px;">手机操作</th>

                </tr>

                <tr class="child_1  dn parentid_0" oid="1" parentid="0">
                    <td class="td1">

                    </td>
                    <td>1</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick=" ">根目录</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="1" typename="helpcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="1" typename="helpcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="1" typename="helpcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="1" typename="helpcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>0</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;1&quot;}" style="">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:0px;line-height:0px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;0&quot;,&quot;oid&quot;:&quot;1&quot;,&quot;type&quot;:&quot;helpcolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="0">
										<option value="1">仅标题</option>
										<option value="2">标题+摘要</option>
										<option value="3">标题+缩略图</option>
										<option value="4">标题+缩略图+简介</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
                    </td>
                    <td>
							<span>2015-06-17
								<br -="">17:03:09</span>
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

                <tr class="child_1  parentid_1" oid="8" parentid="1">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="8">
									</span>
								</span>
                        </div>
                    </td>
                    <td>8</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,8)">├-关于红鑫</a>

								<i class="contraction popUp"></i>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="8" typename="helpcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="8" typename="helpcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="8" typename="helpcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="8" typename="helpcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>1</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;8&quot;}">
								<i style="font-style:normal;">1</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="1">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;8&quot;,&quot;type&quot;:&quot;helpcolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="1">
										<option value="1">仅标题</option>
										<option value="2">标题+摘要</option>
										<option value="3">标题+缩略图</option>
										<option value="4">标题+缩略图+简介</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">15:11:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="/helps/aboutus.html" title="关于红鑫" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,8,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;8&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,8)">
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

								<a href="##" onclick="edit(event,9)">├-定制服务</a>

								<i class="contraction popUp"></i>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="9" typename="helpcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="9" typename="helpcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="9" typename="helpcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="9" typename="helpcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>1</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;9&quot;}">
								<i style="font-style:normal;">2</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="2">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;9&quot;,&quot;type&quot;:&quot;helpcolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="1">
										<option value="1">仅标题</option>
										<option value="2">标题+摘要</option>
										<option value="3">标题+缩略图</option>
										<option value="4">标题+缩略图+简介</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">15:11:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="/helps/dzfw.html" title="定制服务" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,9,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;9&quot;}">
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

								<a href="##" onclick="edit(event,10)">├-荣誉资质</a>

								<i class="contraction popUp"></i>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="10" typename="helpcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="10" typename="helpcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="10" typename="helpcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="10" typename="helpcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>17</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;10&quot;}">
								<i style="font-style:normal;">4</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="4">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;3&quot;,&quot;oid&quot;:&quot;10&quot;,&quot;type&quot;:&quot;helpcolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="3">
										<option value="1">仅标题</option>
										<option value="2">标题+摘要</option>
										<option value="3">标题+缩略图</option>
										<option value="4">标题+缩略图+简介</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">15:11:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/ryzz.html" title="荣誉资质" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,10,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;10&quot;}">
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

								<a href="##" onclick="edit(event,11)">├-直营展厅</a>

								<i class="contraction popUp"></i>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="11" typename="helpcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="11" typename="helpcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="11" typename="helpcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="11" typename="helpcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>4</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;11&quot;}">
								<i style="font-style:normal;">3</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="3">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;3&quot;,&quot;oid&quot;:&quot;11&quot;,&quot;type&quot;:&quot;helpcolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="3">
										<option value="1">仅标题</option>
										<option value="2">标题+摘要</option>
										<option value="3">标题+缩略图</option>
										<option value="4">标题+缩略图+简介</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">15:11:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/zyzt" title="直营展厅" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,11,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;11&quot;}">
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

                <tr class="child_1  parentid_1" oid="12" parentid="1">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="12">
									</span>
								</span>
                        </div>
                    </td>
                    <td>12</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,12)">├-联系我们</a>

								<i class="contraction popUp"></i>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="12" typename="helpcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="12" typename="helpcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="12" typename="helpcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="12" typename="helpcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>1</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;12&quot;}">
								<i style="font-style:normal;">6</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="6">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;12&quot;,&quot;type&quot;:&quot;helpcolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="1">
										<option value="1">仅标题</option>
										<option value="2">标题+摘要</option>
										<option value="3">标题+缩略图</option>
										<option value="4">标题+缩略图+简介</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">15:11:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="/helps/contactus.html" title="联系我们" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,12,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;12&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,12)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_1" oid="13" parentid="1">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="13">
									</span>
								</span>
                        </div>
                    </td>
                    <td>13</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,13)">├-在线留言</a>

								<i class="contraction popUp"></i>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="13" typename="helpcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="13" typename="helpcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="13" typename="helpcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="13" typename="helpcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>0</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;13&quot;}">
								<i style="font-style:normal;">7</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="7">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;13&quot;,&quot;type&quot;:&quot;helpcolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="1">
										<option value="1">仅标题</option>
										<option value="2">标题+摘要</option>
										<option value="3">标题+缩略图</option>
										<option value="4">标题+缩略图+简介</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">15:11:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="/help/leaveword.aspx" title="在线留言" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,13,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;13&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,13)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_1" oid="14" parentid="1">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="14">
									</span>
								</span>
                        </div>
                    </td>
                    <td>14</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,14)">├-工厂实力</a>

								<i class="contraction popUp"></i>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="14" typename="helpcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="14" typename="helpcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="14" typename="helpcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="14" typename="helpcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>6</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;14&quot;}">
								<i style="font-style:normal;">5</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="5">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;3&quot;,&quot;oid&quot;:&quot;14&quot;,&quot;type&quot;:&quot;helpcolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="3">
										<option value="1">仅标题</option>
										<option value="2">标题+摘要</option>
										<option value="3">标题+缩略图</option>
										<option value="4">标题+缩略图+简介</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
                    </td>
                    <td>
							<span>2016-10-21
								<br -="">15:22:53</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/gcsl.html" title="工厂实力" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,14,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;14&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,14)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_1" oid="15" parentid="1">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="15">
									</span>
								</span>
                        </div>
                    </td>
                    <td>15</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,15)">└-代理品牌</a>

								<i class="contraction popUp"></i>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="15" typename="helpcolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="15" typename="helpcolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="15" typename="helpcolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="15" typename="helpcolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>0</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;15&quot;}">
								<i style="font-style:normal;">2</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="2">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;15&quot;,&quot;type&quot;:&quot;helpcolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="1">
										<option value="1">仅标题</option>
										<option value="2">标题+摘要</option>
										<option value="3">标题+缩略图</option>
										<option value="4">标题+缩略图+简介</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
                    </td>
                    <td>
							<span>2016-11-18
								<br -="">17:14:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="/dlpp.html" title="代理品牌" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,15,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;helpcolumn&quot;,&quot;oid&quot;:&quot;15&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,15)">
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
					<span class="c_act ">其他操作<i class="tri_up f_fr"></i>
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
                        <li class="popUp" data-src="{&quot;popup&quot;:&quot;BatchAddColumnPopUp&quot;,&quot;action&quot;:&quot;BatchAddColumn&quot;,&quot;title&quot;:&quot;批量添加分类&quot;,&quot;type&quot;:&quot;helpcolumn&quot;}">
                            批量添加分类
                        </li>
                        <li onclick="edit(event,null,'helps.aspx')">返回列表</li>
                    </ul>
                </div>
                <div class="nsw_pagination f_fr f_mr20 f_cb">
                    <!--IndexNavigator Start
    Developed by: Oran(LikeCode####gmail.com)
    Version:v0.5(Apr. 19, 2015)-->
                    <span class="p_numb f_fl">共9条&nbsp;|&nbsp;第1/1页</span>
                    <select class="pageList_btn" onchange="var pageFile='help_column.aspx?rc=9&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;">
                        <option value="1" selected="selected">1</option>
                    </select>
                    <div class="pageDown_btn f_fr">
                        <span class="p_prev  disable " title="上一页"></span>
                        <span class="p_next  disable " title="下一页"></span>
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
    <span class="clear_bd" style="padding-right:0;display:none;" id="showtypetemp">
		<select class="pass_faq">
			<option value="1">仅标题</option>
			<option value="2">标题+摘要</option>
			<option value="3">标题+缩略图</option>
			<option value="4">标题+缩略图+简介</option>
		</select>
		<i class="revise_sub"></i>
	</span>

    </body>

</@html>