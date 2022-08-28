﻿<#include "../../common/manage_layout.ftl"/>
<@html title_="新闻列表"
css_=["/manager/skins/base/common.css",
"/manager/skins/default/default.css",
"/manager/skins/base/editInterface.css",
"/manager/skins/base/news.css"]
js_=["/manager/js/common/common.js"]>

    <body marginwidth="0" marginheight="0">

    <div class="so_bread">
        <div class="nsw_bread_tit f_cb">

			<span class="nsw_add">当前位置：<a href="/manager/home.aspx" target="_parent">首页</a>&gt;<a href="#">
					<b>资讯管理</b>
				</a>&gt;<a href="news.aspx">文章列表</a>
			</span>
            <div class="advanced_so f_fr form_search">
                <input type="hidden" name="ddlFields" value="[Title]|[ShortDesc]">
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
				<input class="com_input clear_word" type="text" placeholder="请输入标题名称" name="kwd">
				<i class="clear_x"></i>
			</span>
            <label class="com_name f_fl f_mr1 f_ml2">所属分类</label>
            <span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
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

    <div class="col_main">
        <form name="ctl01" method="post" action="news.aspx" id="ctl01">
            <div>
                <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
                <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
                <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTE4MzgzMTY0MGRkScHj/5yBGAw+1rm46crtYS45QOs=">
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

                <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="CE2194EB">
                <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWCwLKjcnhAgLM0/WHCALM9PumDwKxi96RBQKkvupQApaiwPwKAvu4omcC4M+E0gYCxebmvAwCqv3IpwICv6eI5goL5c6owxMXXWnweuGV/miyvskHYw==">
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
					<span class="c_act">批量操作<i class="tri_up f_fr"></i>
					</span>
                    <ul class="batch_dropup list" style="display: none;">
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）？');" id="LinkButton1" href="javascript:__doPostBack('LinkButton1','')">批量隐藏</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定首页显示选中项（共{count}项）？');" id="LinkButton2" href="javascript:__doPostBack('LinkButton2','')">批量显示</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）首页显示？');" id="LinkButton9" href="javascript:__doPostBack('LinkButton9','')">批量取消显示</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定推荐选中项（共{count}项）？');" id="LinkButton3" href="javascript:__doPostBack('LinkButton3','')">批量推荐</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）推荐？');" id="LinkButton4" href="javascript:__doPostBack('LinkButton4','')">批量取消推荐</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定置顶选中项（共{count}项）？');" id="LinkButton5" href="javascript:__doPostBack('LinkButton5','')">批量置顶</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）置顶？');" id="LinkButton6" href="javascript:__doPostBack('LinkButton6','')">批量取消置顶</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定精华选中项（共{count}项）？');" id="LinkButton7" href="javascript:__doPostBack('LinkButton7','')">批量精华</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）精华？');" id="LinkButton8" href="javascript:__doPostBack('LinkButton8','')">批量取消精华</a>
                        </li>
                        <li class="popUp" data-src="{&quot;popup&quot;:&quot;MassTransfer&quot;,&quot;action&quot;:&quot;MassTransfer&quot;}">批量转移</li>
                        <li onclick="edit(event,null,true)">分类列表</li>
                    </ul>
                </div>
                <div class="nsw_pagination f_fr f_mr20 f_cb">
                    <!--IndexNavigator Start
    Developed by: Oran(LikeCode####gmail.com)
    Version:v0.5(Apr. 19, 2015)-->
                    <span class="p_numb f_fl">共261条&nbsp;|&nbsp;第1/14页</span>
                    <select class="pageList_btn" onchange="var pageFile='news.aspx?rc=261&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;">
                        <option value="1" selected="selected">1</option>
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
                    </select>
                    <div class="pageDown_btn f_fr">
                        <span class="p_prev  disable " title="上一页"></span>
                        <a href="news.aspx?rc=261&amp;page=2">
                            <span class="p_next " datahref="news.aspx?rc=261&amp;page=2" title="下一页"></span>
                        </a>
                    </div>
                    <!--IndexNavigator End-->
                </div>
            </div>
            <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
                <tbody>
                <tr id="tabHeader" class="">
                    <th style="width:50px" class="p">
                        <span class="cho"></span>
                    </th>
                    <th style="width:30px">ID</th>
                    <th axis="[Title]" style=" width:200px;" class="order">标题名称</th>
                    <th class="tcenter order" style="width:120px" axis="[ColumnName]">所属分类</th>
                    <th style="width:70px" axis="[Delay]" class="order">首页
                        <br>显示</th>
                    <th style="width:50px" axis="[isCommend]" class="order">推荐</th>
                    <th style="width:50px" axis="[isTop]" class="order">置顶</th>
                    <th style="width:50px" axis="[isBest]" class="order">精华</th>
                    <th style="width:50px" axis="[Enable]" class="order">可用</th>
                    <th style="width:50px" axis="[OrderID]" class="order">排序</th>
                    <th style="width:120px" axis="[InputTime]" class="tcenter order">录入时间</th>
                    <th style="width:60px">
                        <b>PC</b>操作
                    </th>

                    <th style="width:60px;">
                        <b>手机</b>操作
                    </th>

                </tr>

                <tr class="child_1">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="319">
									</span>
								</span>
                        </div>
                    </td>
                    <td>319</td>
                    <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,319)" class="update_Title">湖北凡华市政园林景观办公家具工程案例</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;319&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}" style="display: none;"></i>
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;15&quot;,&quot;oid&quot;:&quot;319&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="15">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="319" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="319" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>

                    </td>
                    <td>
                        <div class="hd_input" oid="319" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="319" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="319" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;319&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2022-07-06
								<br -="">14:59:20</span>
                    </td>
                    <td class="nsw_cnt_area action_tx">
                        <a href="/Article/hbfhszyljg.html" title="湖北凡华市政园林景观办公家具工程案例" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,319)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                        <a href="##" onclick="edit(event,319,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>

                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="/Mobile/MArticles/hbfhszyljg.html" title="湖北凡华市政园林景观办公家具工程案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="EditMobile(event,319)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                        <p class="scl_d">
                            <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/hbfhszyljg.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                            </a>
                            <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                                <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                                    <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
                        <p>分享到微信朋友圈</p>
    </div>
    <div class="con_img" style="height: 201px; text-align: center;">
        <img src="">
    </div>
    <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
        <p>打开微信，点击底部的'发现',使用'扫一扫'
            <br>即可将网页分享到我的朋友圈。 </p>
    </div>
    </div>
    </p>
    </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="318">
									</span>
								</span>
            </div>
        </td>
        <td>318</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,318)" class="update_Title">武汉市惠驰广迪汽车办公家具工程案例</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;318&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}" style="display: none;"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;16&quot;,&quot;oid&quot;:&quot;318&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="16">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="318" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="318" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="318" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="318" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="318" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;318&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-06-10
								<br -="">14:42:10</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/whshcgdqcb.html" title="武汉市惠驰广迪汽车办公家具工程案例" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,318)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,318,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/whshcgdqcb.html" title="武汉市惠驰广迪汽车办公家具工程案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,318)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/whshcgdqcb.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="317">
									</span>
								</span>
            </div>
        </td>
        <td>317</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,317)" class="update_Title">湖北大禹新材料科技有限公司办公家具案例</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;317&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}" style="display: none;"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;16&quot;,&quot;oid&quot;:&quot;317&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="16">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="317" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="317" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="317" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="317" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="317" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;317&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-06-10
								<br -="">10:49:58</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/hbdyxclkjy.html" title="湖北大禹新材料科技有限公司办公家具案例" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,317)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,317,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/hbdyxclkjy.html" title="湖北大禹新材料科技有限公司办公家具案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,317)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/hbdyxclkjy.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="316">
									</span>
								</span>
            </div>
        </td>
        <td>316</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,316)" class="update_Title">武汉青山图书馆家具案例</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;316&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;15&quot;,&quot;oid&quot;:&quot;316&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="15">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="316" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="316" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="316" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="316" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="316" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;316&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-06-09
								<br -="">17:39:41</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/whqstsgjja.html" title="武汉青山图书馆家具案例" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,316)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,316,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/whqstsgjja.html" title="武汉青山图书馆家具案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,316)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/whqstsgjja.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="315">
									</span>
								</span>
            </div>
        </td>
        <td>315</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,315)" class="update_Title">武汉招联消费金融有限公司家具案例</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;315&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;18&quot;,&quot;oid&quot;:&quot;315&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="18">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="315" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="315" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="315" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="315" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="315" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;315&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-05-31
								<br -="">10:35:32</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/whzlxfjryx.html" title="武汉招联消费金融有限公司家具案例" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,315)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,315,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/whzlxfjryx.html" title="武汉招联消费金融有限公司家具案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,315)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/whzlxfjryx.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="314">
									</span>
								</span>
            </div>
        </td>
        <td>314</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,314)" class="update_Title">中青城投办公家具工程案例</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;314&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;16&quot;,&quot;oid&quot;:&quot;314&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="16">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="314" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="314" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="314" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="314" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="314" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;314&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-03-23
								<br -="">11:47:30</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/zqctbgjjgc.html" title="中青城投办公家具工程案例" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,314)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,314,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/zqctbgjjgc.html" title="中青城投办公家具工程案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,314)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/zqctbgjjgc.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="313">
									</span>
								</span>
            </div>
        </td>
        <td>313</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,313)" class="update_Title">湖北富瑞尔科技有限公司办公家具工程案例</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;313&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;16&quot;,&quot;oid&quot;:&quot;313&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="16">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="313" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="313" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="313" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="313" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="313" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;313&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-03-19
								<br -="">09:41:59</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/hbfrekjyxg.html" title="湖北富瑞尔科技有限公司办公家具工程案例" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,313)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,313,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/hbfrekjyxg.html" title="湖北富瑞尔科技有限公司办公家具工程案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,313)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/hbfrekjyxg.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="312">
									</span>
								</span>
            </div>
        </td>
        <td>312</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,312)" class="update_Title">武汉工程科技学院办公家具工程案例</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;312&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;17&quot;,&quot;oid&quot;:&quot;312&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="17">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="312" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="312" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="312" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="312" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="312" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;312&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2021-12-26
								<br -="">16:29:26</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/whgckjxybg.html" title="武汉工程科技学院办公家具工程案例" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,312)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,312,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/whgckjxybg.html" title="武汉工程科技学院办公家具工程案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,312)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/whgckjxybg.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="311">
									</span>
								</span>
            </div>
        </td>
        <td>311</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,311)" class="update_Title">武汉微思敦网络，红鑫完美打造固装家具</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;311&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;16&quot;,&quot;oid&quot;:&quot;311&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="16">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="311" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="311" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="311" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="311" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="311" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;311&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2021-09-23
								<br -="">17:39:00</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/whwsdwlhxw.html" title="武汉微思敦网络，红鑫完美打造固装家具" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,311)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,311,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/whwsdwlhxw.html" title="武汉微思敦网络，红鑫完美打造固装家具" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,311)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/whwsdwlhxw.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="310">
									</span>
								</span>
            </div>
        </td>
        <td>310</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,310)" class="update_Title">当代中心楼兰蜜语，对红鑫产品相当满意！</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;310&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;16&quot;,&quot;oid&quot;:&quot;310&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="16">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="310" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="310" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="310" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="310" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="310" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;310&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2021-09-19
								<br -="">16:57:29</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/ddzxllmydh.html" title="当代中心楼兰蜜语，对红鑫产品相当满意！" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,310)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,310,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/ddzxllmydh.html" title="当代中心楼兰蜜语，对红鑫产品相当满意！" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,310)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/ddzxllmydh.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="309">
									</span>
								</span>
            </div>
        </td>
        <td>309</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,309)" class="update_Title">白沙洲街道长江紫都社区 定制家具选红鑫，省钱省力更省心</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;309&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;15&quot;,&quot;oid&quot;:&quot;309&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="15">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="309" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="309" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="309" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="309" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="309" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;309&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2021-08-04
								<br -="">16:05:41</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/wcbszjdzjz.html" title="白沙洲街道长江紫都社区  定制家具选红鑫，省钱省力更省心" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,309)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,309,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/wcbszjdzjz.html" title="白沙洲街道长江紫都社区  定制家具选红鑫，省钱省力更省心" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,309)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/wcbszjdzjz.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="308">
									</span>
								</span>
            </div>
        </td>
        <td>308</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,308)" class="update_Title">湖北省交通运输厅高速公路管理局采购办公家具，红鑫提供一站式解决</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;308&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;15&quot;,&quot;oid&quot;:&quot;308&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="15">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="308" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="308" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="308" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="308" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="308" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;308&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2021-05-26
								<br -="">15:53:33</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/hbsjtystgsg.html" title="湖北省交通运输厅高速公路管理局采购办公家具，红鑫提供一站式解决" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,308)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,308,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/hbsjtystgsg.html" title="湖北省交通运输厅高速公路管理局采购办公家具，红鑫提供一站式解决" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,308)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/hbsjtystgsg.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="307">
									</span>
								</span>
            </div>
        </td>
        <td>307</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,307)" class="update_Title">和平大道湖北伟度律师事务所采购办公家具，红鑫提供一站式解决</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;307&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;19&quot;,&quot;oid&quot;:&quot;307&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="19">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="307" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="307" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="307" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="307" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="307" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;307&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2021-05-26
								<br -="">11:15:24</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/hbwdlsswsc.html" title="和平大道湖北伟度律师事务所采购办公家具，红鑫提供一站式解决" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,307)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,307,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/hbwdlsswsc.html" title="和平大道湖北伟度律师事务所采购办公家具，红鑫提供一站式解决" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,307)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/hbwdlsswsc.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="306">
									</span>
								</span>
            </div>
        </td>
        <td>306</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,306)" class="update_Title">花山中船重工采购办公家具，红鑫提供一站式解决</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;306&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;15&quot;,&quot;oid&quot;:&quot;306&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="15">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="306" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="306" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="306" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="306" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="306" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;306&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2021-04-27
								<br -="">16:12:42</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/zgcbjtyjs.html" title="花山中船重工采购办公家具，红鑫提供一站式解决" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,306)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,306,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/zgcbjtyjs.html" title="花山中船重工采购办公家具，红鑫提供一站式解决" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,306)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/zgcbjtyjs.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="305">
									</span>
								</span>
            </div>
        </td>
        <td>305</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,305)" class="update_Title">中国通信建设第三工程局家具配置案例</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;305&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;12&quot;,&quot;oid&quot;:&quot;305&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="12">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="305" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="305" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="305" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="305" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="305" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;305&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2021-02-27
								<br -="">16:44:26</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/zgtxjsdsgc.html" title="中国通信建设第三工程局家具配置案例" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,305)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,305,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/zgtxjsdsgc.html" title="中国通信建设第三工程局家具配置案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,305)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/zgtxjsdsgc.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="304">
									</span>
								</span>
            </div>
        </td>
        <td>304</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,304)" class="update_Title">湖北省交通规划设计院股份有限公司家具配置案例</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;304&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;12&quot;,&quot;oid&quot;:&quot;304&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="12">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="304" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="304" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="304" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="304" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="304" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;304&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2021-02-27
								<br -="">15:07:15</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/hbsjtghsjyg.html" title="湖北省交通规划设计院股份有限公司家具配置案例" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,304)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,304,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/hbsjtghsjyg.html" title="湖北省交通规划设计院股份有限公司家具配置案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,304)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/hbsjtghsjyg.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="303">
									</span>
								</span>
            </div>
        </td>
        <td>303</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,303)" class="update_Title">融创服务集团家具配置案例</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;303&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;12&quot;,&quot;oid&quot;:&quot;303&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="12">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="303" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="303" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="303" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="303" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="303" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;303&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2021-01-31
								<br -="">17:12:40</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/rcfwjtjjpz.html" title="融创服务集团家具配置案例" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,303)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,303,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/rcfwjtjjpz.html" title="融创服务集团家具配置案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,303)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/rcfwjtjjpz.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="302">
									</span>
								</span>
            </div>
        </td>
        <td>302</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,302)" class="update_Title">林发钢铁贸易公司家具配置方案</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;302&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;12&quot;,&quot;oid&quot;:&quot;302&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="12">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="302" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="302" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="302" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="302" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="302" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;302&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2021-01-31
								<br -="">14:02:38</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/whlfgtmyyx.html" title="林发钢铁贸易公司家具配置方案" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,302)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,302,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/whlfgtmyyx.html" title="林发钢铁贸易公司家具配置方案" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,302)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/whlfgtmyyx.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="301">
									</span>
								</span>
            </div>
        </td>
        <td>301</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,301)" class="update_Title">武汉利世德建筑公司办公家具配置案例</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;301&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;16&quot;,&quot;oid&quot;:&quot;301&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="16">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="301" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="301" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="301" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="301" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="301" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;301&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2020-12-16
								<br -="">10:46:48</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/whlsdjzgsb.html" title="武汉利世德建筑公司办公家具配置案例" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,301)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,301,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/whlsdjzgsb.html" title="武汉利世德建筑公司办公家具配置案例" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,301)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/whlsdjzgsb.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
        </td>

    </tr>

    <tr class="child_1">
        <td class="td1">
            <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="300">
									</span>
								</span>
            </div>
        </td>
        <td>300</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,300)" class="update_Title">站着办公有哪些好处，关键点都在这！</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;300&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#newsColumn&quot;,&quot;type&quot;:&quot;news&quot;,&quot;value&quot;:&quot;14&quot;,&quot;oid&quot;:&quot;300&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="newsColumn">
									<select class="pass_faq" name="cid" defvalue="14">
										<option value="1" oid="1">根栏目</option>
										<option value="11" oid="11">├新闻资讯</option>
										<option value="13" oid="13">　├新闻动态</option>
										<option value="14" oid="14">　├家具常识</option>
										<option value="21" oid="21">　└代理品牌</option>
										<option value="12" oid="12">└成功案例</option>
										<option value="15" oid="15">　├政府机关案例</option>
										<option value="23" oid="23">　　└成功案例</option>
										<option value="16" oid="16">　├公司企业案例</option>
										<option value="17" oid="17">　├医疗教育案例</option>
										<option value="18" oid="18">　├金融银行案例</option>
										<option value="19" oid="19">　└经典成功案例</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="300" typename="news" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="300" typename="news" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="300" typename="news" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="300" typename="news" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="300" typename="news" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;news&quot;,&quot;oid&quot;:&quot;300&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2020-12-10
								<br -="">11:04:29</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Article/zzbgynxhcg.html" title="站着办公有哪些好处，关键点都在这！" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,300)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,300,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MArticles/zzbgynxhcg.html" title="站着办公有哪些好处，关键点都在这！" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,300)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MArticles/zzbgynxhcg.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/Mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/Mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
            <p>分享到微信朋友圈</p>
            </div>
            <div class="con_img" style="height: 201px; text-align: center;">
                <img src="">
            </div>
            <div class="con_foot" style="text-align: left; height: 40px; line-height: 22px; padding: 6px 0px 0px 10px;">
                <p>打开微信，点击底部的'发现',使用'扫一扫'
                    <br>即可将网页分享到我的朋友圈。 </p>
            </div>
            </div>
            </p>
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
					<span class="c_act ">批量操作<i class="tri_up f_fr"></i>
					</span>
            <ul class="batch_dropup list">
                <li>
                    <a onclick="return BatchOperation('确定禁用选中项（共{count}项）？');" id="LinkButton1" href="javascript:__doPostBack('LinkButton1','')">批量隐藏</a>
                </li>
                <li>
                    <a onclick="return BatchOperation('确定首页显示选中项（共{count}项）？');" id="LinkButton2" href="javascript:__doPostBack('LinkButton2','')">批量显示</a>
                </li>
                <li>
                    <a onclick="return BatchOperation('确定禁用选中项（共{count}项）首页显示？');" id="LinkButton9" href="javascript:__doPostBack('LinkButton9','')">批量取消显示</a>
                </li>
                <li>
                    <a onclick="return BatchOperation('确定推荐选中项（共{count}项）？');" id="LinkButton3" href="javascript:__doPostBack('LinkButton3','')">批量推荐</a>
                </li>
                <li>
                    <a onclick="return BatchOperation('确定禁用选中项（共{count}项）推荐？');" id="LinkButton4" href="javascript:__doPostBack('LinkButton4','')">批量取消推荐</a>
                </li>
                <li>
                    <a onclick="return BatchOperation('确定置顶选中项（共{count}项）？');" id="LinkButton5" href="javascript:__doPostBack('LinkButton5','')">批量置顶</a>
                </li>
                <li>
                    <a onclick="return BatchOperation('确定禁用选中项（共{count}项）置顶？');" id="LinkButton6" href="javascript:__doPostBack('LinkButton6','')">批量取消置顶</a>
                </li>
                <li>
                    <a onclick="return BatchOperation('确定精华选中项（共{count}项）？');" id="LinkButton7" href="javascript:__doPostBack('LinkButton7','')">批量精华</a>
                </li>
                <li>
                    <a onclick="return BatchOperation('确定禁用选中项（共{count}项）精华？');" id="LinkButton8" href="javascript:__doPostBack('LinkButton8','')">批量取消精华</a>
                </li>
                <li class="popUp" data-src="{&quot;popup&quot;:&quot;MassTransfer&quot;,&quot;action&quot;:&quot;MassTransfer&quot;}">批量转移</li>
                <li onclick="edit(event,null,true)">分类列表</li>
            </ul>
        </div>
        <div class="nsw_pagination f_fr f_mr20 f_cb">
            <!--IndexNavigator Start
Developed by: Oran(LikeCode####gmail.com)
Version:v0.5(Apr. 19, 2015)-->
            <span class="p_numb f_fl">共261条&nbsp;|&nbsp;第1/14页</span>
            <select class="pageList_btn" onchange="var pageFile='news.aspx?rc=261&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;">
                <option value="1" selected="selected">1</option>
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
            </select>
            <div class="pageDown_btn f_fr">
                <span class="p_prev  disable " title="上一页"></span>
                <a href="news.aspx?rc=261&amp;page=2">
                    <span class="p_next " datahref="news.aspx?rc=261&amp;page=2" title="下一页"></span>
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