<#include "../../common/manage_layout.ftl"/>
<@html title_="分类列表"
css_=["/manager/skins/base/common.css",
"/manager/skins/default/default.css",
"/manager/skins/base/editInterface.css",
"/manager/skins/base/news.css"]
js_=["/manager/js/common/common.js"]>

    <body class="column_list" marginwidth="0" marginheight="0">
    <div class="so_bread">
        <div class="nsw_bread_tit f_cb">

			<span class="nsw_add">当前位置：<a href="/manager/home.aspx" target="_parent">首页</a>&gt;<a href="#">
					<b>资讯管理</b>
				</a>&gt;<a href="news_column.aspx">分类列表</a>
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
				<input class="com_input clear_word" type="text" placeholder="请填写标题名称" name="kwd">
				<i class="clear_x"></i>
			</span>
            <label class="com_name f_fl f_mr1 f_ml2">所属分类</label>
            <span class="clear_bd fast_in s_selt1 f_fl">
				<select class="pass_faq" name="cid">
					<option value="0001" oid="1">根栏目</option>
					<option value="0001,0011" oid="11">├新闻资讯</option>
					<option value="0001,0011,0013" oid="13">　├新闻动态</option>
					<option value="0001,0011,0014" oid="14">　├家具常识</option>
					<option value="0001,0011,0021" oid="21">　└代理品牌</option>
					<option value="0001,0012" oid="12">└成功案例</option>
					<option value="0001,0012,0015" oid="15">　├政府机关案例</option>
					<option value="0001,0012,0015,0023" oid="23">　　└成功案例</option>
					<option value="0001,0012,0016" oid="16">　├公司企业案例</option>
					<option value="0001,0012,0017" oid="17">　├医疗教育案例</option>
					<option value="0001,0012,0018" oid="18">　├金融银行案例</option>
					<option value="0001,0012,0019" oid="19">　└经典成功案例</option>
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
					<option value="1">根栏目</option>
					<option value="11">├新闻资讯</option>
					<option value="13">　├新闻动态</option>
					<option value="14">　├家具常识</option>
					<option value="21">　└代理品牌</option>
					<option value="12">└成功案例</option>
					<option value="15">　├政府机关案例</option>
					<option value="23">　　└成功案例</option>
					<option value="16">　├公司企业案例</option>
					<option value="17">　├医疗教育案例</option>
					<option value="18">　├金融银行案例</option>
					<option value="19">　└经典成功案例</option>
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
            <span class="role_addbtn f_ml2 f_csp f_fl popUp" data-src="{&quot;popup&quot;:&quot;BatchAddColumnPopUp&quot;,&quot;action&quot;:&quot;BatchAddColumn&quot;,&quot;title&quot;:&quot;批量添加资讯分类&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">添加</span>
            <input type="hidden" name="typename" value="newscolumn">
            <input type="hidden" name="mode" value="single">
        </form>
    </div>
    <!-- 快速录入 结束 -->
    <div class="col_main">
        <form name="ctl01" method="post" action="news_column.aspx" id="ctl01">
            <div>
                <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
                <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
                <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE2ODA1NzE2NjJkZCg+V58mNMThbIUnlBI8qQzGrluY">
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

                <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="D84B24D8">
                <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWCQL2uK67CgLM0/WHCAKmwImNCwKjwImNCwKkwImNCwKZwImNCwKawImNCwKhwPWxAgKiwPWxAlXLayHvUKjZG4VoUJ7hEdmXJJa1">
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
                        <li class="popUp" data-src="{&quot;popup&quot;:&quot;BatchAddColumnPopUp&quot;,&quot;action&quot;:&quot;BatchAddColumn&quot;,&quot;title&quot;:&quot;批量添加分类&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">批量添加分类</li>
                        <li onclick="edit(event,null,'newss.aspx')">返回列表</li>
                    </ul>
                </div>
                <div class="nsw_pagination f_fr f_mr20 f_cb">
                    <!--IndexNavigator Start
    Developed by: Oran(LikeCode####gmail.com)
    Version:v0.5(Apr. 19, 2015)-->
                    <span class="p_numb f_fl">共12条&nbsp;|&nbsp;第1/1页</span>
                    <select class="pageList_btn" onchange="var pageFile='news_column.aspx?rc=12&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;">
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
                    <th axis="[Title]" style=" width:200px;" class="order">资讯分类</th>
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

								<a href="##" onclick=" ">根栏目</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="1" typename="newscolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="1" typename="newscolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="1" typename="newscolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="1" typename="newscolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>0</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;1&quot;}" style="">
								<i style="font-style:normal;">0</i>
								<input type="text" style="border:0;width:90%;height:0px;line-height:0px;display:none;border:1px solid #ccc;" defvalue="0">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;1&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">
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

								<a href="##" onclick="edit(event,11)">├-新闻资讯</a>

								<i class="contraction popUp"></i>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="11" typename="newscolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="11" typename="newscolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="11" typename="newscolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="11" typename="newscolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>8</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;11&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;2&quot;,&quot;oid&quot;:&quot;11&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="2">
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
								<br -="">14:47:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/xwzx.html" title="新闻资讯" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,11,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;11&quot;}">
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

                <tr class="child_1  parentid_11" oid="13" parentid="11">
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

								<a href="##" onclick="edit(event,13)">　├-新闻动态</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="13" typename="newscolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="13" typename="newscolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="13" typename="newscolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="13" typename="newscolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>51</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;13&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;2&quot;,&quot;oid&quot;:&quot;13&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="2">
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
								<br -="">14:47:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/xwdt.html" title="新闻动态" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,13,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;13&quot;}">
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

                <tr class="child_1  parentid_11" oid="14" parentid="11">
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

								<a href="##" onclick="edit(event,14)">　├-家具常识</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="14" typename="newscolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="14" typename="newscolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="14" typename="newscolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="14" typename="newscolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>55</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;14&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;2&quot;,&quot;oid&quot;:&quot;14&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="2">
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
								<br -="">14:47:32</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/jjcs.html" title="家具常识" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,14,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;14&quot;}">
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

                <tr class="child_1  parentid_11" oid="21" parentid="11">
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

								<a href="##" onclick="edit(event,21)">　└-代理品牌</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="21" typename="newscolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="21" typename="newscolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="21" typename="newscolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="21" typename="newscolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>3</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;21&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;4&quot;,&quot;oid&quot;:&quot;21&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="4">
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
							<span>2016-12-12
								<br -="">17:05:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/dlpp.html" title="代理品牌" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,21,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;21&quot;}">
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

								<a href="##" onclick="edit(event,12)">└-成功案例</a>

								<i class="contraction popUp"></i>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="12" typename="newscolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="12" typename="newscolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="12" typename="newscolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="12" typename="newscolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>6</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;12&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;4&quot;,&quot;oid&quot;:&quot;12&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="4">
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
								<br -="">14:47:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/gcal" title="成功案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,12,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;12&quot;}">
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

                <tr class="child_1  parentid_12" oid="15" parentid="12">
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

								<a href="##" onclick="edit(event,15)">　├-政府机关案例</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="15" typename="newscolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="15" typename="newscolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="15" typename="newscolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="15" typename="newscolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>25</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;15&quot;}">
								<i style="font-style:normal;">2</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="2">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;4&quot;,&quot;oid&quot;:&quot;15&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="4">
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
								<br -="">14:47:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/zfjgal.html" title="政府机关案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,15,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;15&quot;}">
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

                <tr class="child_1  parentid_15" oid="23" parentid="15">
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

								<a href="##" onclick="edit(event,23)">　　└-成功案例</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="23" typename="newscolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="23" typename="newscolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="23" typename="newscolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="23" typename="newscolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>0</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;23&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;23&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">
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
							<span>2022-06-09
								<br -="">17:48:25</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/cgal_1.html" title="成功案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,23,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;23&quot;}">
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

                <tr class="child_1  parentid_12" oid="16" parentid="12">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="16">
									</span>
								</span>
                        </div>
                    </td>
                    <td>16</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,16)">　├-公司企业案例</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="16" typename="newscolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="16" typename="newscolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="16" typename="newscolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="16" typename="newscolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>82</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;16&quot;}">
								<i style="font-style:normal;">3</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="3">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;4&quot;,&quot;oid&quot;:&quot;16&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="4">
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
								<br -="">14:47:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/gsqyal.html" title="公司企业案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,16,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;16&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,16)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_12" oid="17" parentid="12">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="17">
									</span>
								</span>
                        </div>
                    </td>
                    <td>17</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,17)">　├-医疗教育案例</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="17" typename="newscolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="17" typename="newscolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="17" typename="newscolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="17" typename="newscolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>24</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;17&quot;}">
								<i style="font-style:normal;">5</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="5">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;4&quot;,&quot;oid&quot;:&quot;17&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="4">
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
								<br -="">14:47:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/yljyal.html" title="医疗教育案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,17,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;17&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,17)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_12" oid="18" parentid="12">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="18">
									</span>
								</span>
                        </div>
                    </td>
                    <td>18</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,18)">　├-金融银行案例</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="18" typename="newscolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="18" typename="newscolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="18" typename="newscolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="18" typename="newscolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>20</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;18&quot;}">
								<i style="font-style:normal;">4</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="4">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;4&quot;,&quot;oid&quot;:&quot;18&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="4">
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
								<br -="">14:47:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/jryxal.html" title="金融银行案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,18,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;18&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,18)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                    </td>

                </tr>

                <tr class="child_1  parentid_12" oid="19" parentid="12">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="19">
									</span>
								</span>
                        </div>
                    </td>
                    <td>19</td>
                    <td class="rname">
							<span class="short_tit f_fl">

								<a href="##" onclick="edit(event,19)">　└-经典成功案例</a>

							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="19" typename="newscolumn" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="19" typename="newscolumn" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="19" typename="newscolumn" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="19" typename="newscolumn" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>10</td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;19&quot;}">
								<i style="font-style:normal;">1</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="1">
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn" data-src="{&quot;action&quot;:&quot;updateColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#showtypetemp&quot;,&quot;value&quot;:&quot;4&quot;,&quot;oid&quot;:&quot;19&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">
								<span class="clear_bd" style="padding-right: 0px;" id="showtypetemp">
									<select class="pass_faq" defvalue="4">
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
							<span>2016-11-10
								<br -="">10:54:00</span>
                    </td>
                    <td class="nsw_cnt_area action_tx ">
                        <a href="http://www.hongxin.com.cn/jdcgal.html" title="经典成功案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,19,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>
                        <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;newscolumn&quot;,&quot;oid&quot;:&quot;19&quot;}">
								<i></i>删除
							</span>
                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="##" onclick="EditMobile(event,19)">
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
                        <li class="popUp" data-src="{&quot;popup&quot;:&quot;BatchAddColumnPopUp&quot;,&quot;action&quot;:&quot;BatchAddColumn&quot;,&quot;title&quot;:&quot;批量添加分类&quot;,&quot;type&quot;:&quot;newscolumn&quot;}">批量添加分类</li>
                        <li onclick="edit(event,null,'newss.aspx')">返回列表</li>
                    </ul>
                </div>
                <div class="nsw_pagination f_fr f_mr20 f_cb">
                    <!--IndexNavigator Start
    Developed by: Oran(LikeCode####gmail.com)
    Version:v0.5(Apr. 19, 2015)-->
                    <span class="p_numb f_fl">共12条&nbsp;|&nbsp;第1/1页</span>
                    <select class="pageList_btn" onchange="var pageFile='news_column.aspx?rc=12&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;">
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