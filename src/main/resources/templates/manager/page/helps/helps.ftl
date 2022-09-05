<#include "../../common/manage_layout.ftl"/>
<@html title_="评论列表"
css_=["/manager/skins/base/common.css",
"/manager/skins/default/default.css",
"/manager/skins/base/editInterface.css"
]
js_=["/manager/js/common/common.js"]>
    <body marginwidth="0" marginheight="0">
    <div class="so_bread">
        <div class="nsw_bread_tit f_cb">

			<span class="nsw_add">当前位置：<a href="/manager/home.aspx" target="_parent">首页</a>&gt;<a href="#">
					<b>公司管理</b>
				</a>&gt;<a href="helps.aspx">公司信息列表</a>
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
            <span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
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

    <div class="col_main">
        <form name="ctl01" method="post" action="helps.aspx" id="ctl01">
            <div>
                <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
                <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
                <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTE4MzgzMTY0MGRkIdibJCIUrLyboN7onKDpN1q6WZ8=">
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

                <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="61F915E3">
                <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWCwLBpqOxBALM0/WHCAKxi96RBQLM9PumDwKkvupQApaiwPwKAvu4omcC4M+E0gYCxebmvAwCqv3IpwICv6eI5go6r7UFB4urDZaKkJt8EmIm6b7VNQ==">
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
					<span class="c_act ">批量操作<i class="tri_up f_fr"></i>
					</span>
                    <ul class="batch_dropup list">
                        <li>
                            <a onclick="return BatchOperation('确定禁用选中项（共{count}项）？');" id="LinkButton2" href="javascript:__doPostBack('LinkButton2','')">批量隐藏</a>
                        </li>
                        <li>
                            <a onclick="return BatchOperation('确定首页显示选中项（共{count}项）？');" id="LinkButton1" href="javascript:__doPostBack('LinkButton1','')">批量显示</a>
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
                    <span class="p_numb f_fl">共29条&nbsp;|&nbsp;第1/2页</span>
                    <select class="pageList_btn" onchange="var pageFile='helps.aspx?rc=29&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;">
                        <option value="1" selected="selected">1</option>
                        <option value="2">2</option>
                    </select>
                    <div class="pageDown_btn f_fr">
                        <span class="p_prev  disable " title="上一页"></span>
                        <a href="helps.aspx?rc=29&amp;page=2">
                            <span class="p_next " datahref="helps.aspx?rc=29&amp;page=2" title="下一页"></span>
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
                    <th style="width:80px">
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
										<input type="checkbox" name="chkItem" value="58">
									</span>
								</span>
                        </div>
                    </td>
                    <td>58</td>
                    <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,58)" class="update_Title">2018-2019年度优秀企业</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;58&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}" style="display: none;"></i>
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;58&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="58" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="58" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>

                    </td>
                    <td>
                        <div class="hd_input" oid="58" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="58" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="58" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;58&quot;}">
								<i style="font-style:normal;">51</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="51">
							</span>
                    </td>
                    <td>
							<span>2020-01-16
								<br -="">13:55:02</span>
                    </td>
                    <td class="nsw_cnt_area action_tx">
                        <a href="/Helps/20182019nd.html" title="2018-2019年度优秀企业" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,58)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                        <a href="##" onclick="edit(event,58,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>

                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="/mobile/Mhelps/20182019nd.html" title="2018-2019年度优秀企业" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="EditMobile(event,58)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                        <p class="scl_d">
                            <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/20182019nd.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                            </a>
                            <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                                <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                                    <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="57">
									</span>
								</span>
            </div>
        </td>
        <td>57</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,57)" class="update_Title">中国环境标志产品认证证书(CEC2018ELP04206023)</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;57&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;57&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="57" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="57" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="57" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="57" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="57" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;57&quot;}">
								<i style="font-style:normal;">35</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="35">
							</span>
        </td>
        <td>
							<span>2018-12-21
								<br -="">15:04:33</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/zghjbzcprzzsc.html" title="中国环境标志产品认证证书(CEC2018ELP04206023)" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,57)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,57,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/zghjbzcprzzsc.html" title="中国环境标志产品认证证书(CEC2018ELP04206023)" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,57)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/zghjbzcprzzsc.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="56">
									</span>
								</span>
            </div>
        </td>
        <td>56</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,56)" class="update_Title">中国环境标志产品认证证书(CEC2018ELP04206022)</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;56&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;56&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="56" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="56" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="56" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="56" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="56" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;56&quot;}">
								<i style="font-style:normal;">36</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="36">
							</span>
        </td>
        <td>
							<span>2018-12-21
								<br -="">14:59:36</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/zghjbzcprzzs.html" title="中国环境标志产品认证证书(CEC2018ELP04206022)" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,56)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,56,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/zghjbzcprzzs.html" title="中国环境标志产品认证证书(CEC2018ELP04206022)" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,56)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/zghjbzcprzzs.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="55">
									</span>
								</span>
            </div>
        </td>
        <td>55</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,55)" class="update_Title">中国环境标志产品认证证书(CEC2018ELP04206021)</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;55&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;55&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="55" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="55" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="55" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="55" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="55" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;55&quot;}">
								<i style="font-style:normal;">37</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="37">
							</span>
        </td>
        <td>
							<span>2018-12-21
								<br -="">14:53:49</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/zghjbzcprzz.html" title="中国环境标志产品认证证书(CEC2018ELP04206021)" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,55)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,55,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/zghjbzcprzz.html" title="中国环境标志产品认证证书(CEC2018ELP04206021)" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,55)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/zghjbzcprzz.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="54">
									</span>
								</span>
            </div>
        </td>
        <td>54</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,54)" class="update_Title">中国环保产品认证证书CQC-（金属办公家具）</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;54&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;54&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="54" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="54" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="54" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="54" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="54" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;54&quot;}">
								<i style="font-style:normal;">38</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="38">
							</span>
        </td>
        <td>
							<span>2018-12-21
								<br -="">11:59:00</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/zghbcprzzscq.html" title="中国环保产品认证证书CQC-（金属办公家具）" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,54)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,54,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/zghbcprzzscq.html" title="中国环保产品认证证书CQC-（金属办公家具）" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,54)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/zghbcprzzscq.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="53">
									</span>
								</span>
            </div>
        </td>
        <td>53</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,53)" class="update_Title">中国环保产品认证证书CQC-（木制办公家具）</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;53&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;53&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="53" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="53" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="53" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="53" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="53" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;53&quot;}">
								<i style="font-style:normal;">39</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="39">
							</span>
        </td>
        <td>
							<span>2018-12-21
								<br -="">11:48:23</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/zghbcprzzsc.html" title="中国环保产品认证证书CQC-（木制办公家具）" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,53)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,53,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/zghbcprzzsc.html" title="中国环保产品认证证书CQC-（木制办公家具）" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,53)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/zghbcprzzsc.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="52">
									</span>
								</span>
            </div>
        </td>
        <td>52</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,52)" class="update_Title">中国环保产品认证证书CQC-（软体家具-沙发）</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;52&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;52&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="52" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="52" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="52" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="52" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="52" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;52&quot;}">
								<i style="font-style:normal;">40</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="40">
							</span>
        </td>
        <td>
							<span>2018-12-21
								<br -="">10:56:46</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/zghbcprzzs.html" title="中国环保产品认证证书CQC-（软体家具-沙发）" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,52)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,52,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/zghbcprzzs.html" title="中国环保产品认证证书CQC-（软体家具-沙发）" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,52)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/zghbcprzzs.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="51">
									</span>
								</span>
            </div>
        </td>
        <td>51</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,51)" class="update_Title">营业执照</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;51&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;51&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="51" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="51" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="51" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="51" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="51" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;51&quot;}">
								<i style="font-style:normal;">41</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="41">
							</span>
        </td>
        <td>
							<span>2018-12-07
								<br -="">14:30:22</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/yyzz.html" title="营业执照" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,51)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,51,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/yyzz.html" title="营业执照" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,51)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/yyzz.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="50">
									</span>
								</span>
            </div>
        </td>
        <td>50</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,50)" class="update_Title">中国环境标志产品认证证书(CEC2018ELP04206020)</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;50&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;50&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="50" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="50" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="50" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="50" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="50" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;50&quot;}">
								<i style="font-style:normal;">34</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="34">
							</span>
        </td>
        <td>
							<span>2018-12-04
								<br -="">16:47:16</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/zghjbzcprz.html" title="中国环境标志产品认证证书(CEC2018ELP04206020)" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,50)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,50,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/zghjbzcprz.html" title="中国环境标志产品认证证书(CEC2018ELP04206020)" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,50)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/zghjbzcprz.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="48">
									</span>
								</span>
            </div>
        </td>
        <td>48</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,48)" class="update_Title">商标注册证</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;48&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;48&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="48" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="48" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="48" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="48" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="48" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;48&quot;}">
								<i style="font-style:normal;">43</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="43">
							</span>
        </td>
        <td>
							<span>2016-10-24
								<br -="">14:27:29</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/sbzcz.html" title="商标注册证" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,48)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,48,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/sbzcz.html" title="商标注册证" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,48)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/sbzcz.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="47">
									</span>
								</span>
            </div>
        </td>
        <td>47</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,47)" class="update_Title">质量管理体系证书</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;47&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;47&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="47" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="47" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="47" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="47" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="47" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;47&quot;}">
								<i style="font-style:normal;">44</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="44">
							</span>
        </td>
        <td>
							<span>2016-10-24
								<br -="">14:26:33</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/zlgltxzs.html" title="质量管理体系证书" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,47)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,47,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/zlgltxzs.html" title="质量管理体系证书" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,47)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/zlgltxzs.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="46">
									</span>
								</span>
            </div>
        </td>
        <td>46</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,46)" class="update_Title">职业健康体系证书</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;46&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;46&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="46" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="46" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="46" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="46" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="46" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;46&quot;}">
								<i style="font-style:normal;">45</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="45">
							</span>
        </td>
        <td>
							<span>2016-10-24
								<br -="">14:26:06</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/zyjktxzs.html" title="职业健康体系证书" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,46)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,46,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/zyjktxzs.html" title="职业健康体系证书" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,46)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/zyjktxzs.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="45">
									</span>
								</span>
            </div>
        </td>
        <td>45</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,45)" class="update_Title">环境管理体系证书</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;45&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;45&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="45" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="45" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="45" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="45" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="45" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;45&quot;}">
								<i style="font-style:normal;">46</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="46">
							</span>
        </td>
        <td>
							<span>2016-10-24
								<br -="">14:25:38</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/hjzltxzs.html" title="环境管理体系证书" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,45)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,45,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/hjzltxzs.html" title="环境管理体系证书" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,45)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/hjzltxzs.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="43">
									</span>
								</span>
            </div>
        </td>
        <td>43</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,43)" class="update_Title">消费者信赖品牌</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;43&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;43&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="43" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="43" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="43" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="43" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="43" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;43&quot;}">
								<i style="font-style:normal;">48</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="48">
							</span>
        </td>
        <td>
							<span>2016-10-24
								<br -="">14:24:33</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/xfzxlpp.html" title="消费者信赖品牌" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,43)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,43,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/xfzxlpp.html" title="消费者信赖品牌" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,43)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/xfzxlpp.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="42">
									</span>
								</span>
            </div>
        </td>
        <td>42</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,42)" class="update_Title">湖北省名优产品</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;42&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;42&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="42" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="42" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="42" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="42" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="42" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;42&quot;}">
								<i style="font-style:normal;">49</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="49">
							</span>
        </td>
        <td>
							<span>2016-10-24
								<br -="">14:23:23</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/hbsmycp.html" title="湖北省名优产品" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,42)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,42,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/hbsmycp.html" title="湖北省名优产品" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,42)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/hbsmycp.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="41">
									</span>
								</span>
            </div>
        </td>
        <td>41</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,41)" class="update_Title">质量服务信誉AAAA级单位</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;41&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;10&quot;,&quot;oid&quot;:&quot;41&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="10">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="41" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="41" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="41" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="41" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="41" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;41&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2016-10-24
								<br -="">14:21:27</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/zlfwxyaaaa.html" title="质量服务信誉AAAA级单位" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,41)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,41,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/zlfwxyaaaa.html" title="质量服务信誉AAAA级单位" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,41)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/zlfwxyaaaa.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="40">
									</span>
								</span>
            </div>
        </td>
        <td>40</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,40)" class="update_Title">工厂展厅</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;40&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;11&quot;,&quot;oid&quot;:&quot;40&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="11">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="40" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="40" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="40" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="40" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="40" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;40&quot;}">
								<i style="font-style:normal;">3</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="3">
							</span>
        </td>
        <td>
							<span>2016-10-24
								<br -="">13:54:54</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/hnzt_05.html" title="工厂展厅" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,40)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,40,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/hnzt_05.html" title="工厂展厅" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,40)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/hnzt_05.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="39">
									</span>
								</span>
            </div>
        </td>
        <td>39</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,39)" class="update_Title">旗舰展厅</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;39&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;11&quot;,&quot;oid&quot;:&quot;39&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="11">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="39" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="39" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="39" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="39" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="39" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;39&quot;}">
								<i style="font-style:normal;">1</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="1">
							</span>
        </td>
        <td>
							<span>2016-10-24
								<br -="">13:53:36</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/hnzt_04.html" title="旗舰展厅" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,39)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,39,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/hnzt_04.html" title="旗舰展厅" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,39)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/hnzt_04.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="38">
									</span>
								</span>
            </div>
        </td>
        <td>38</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,38)" class="update_Title">光谷展厅</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;38&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;11&quot;,&quot;oid&quot;:&quot;38&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="11">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="38" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="38" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="38" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="38" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="38" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;38&quot;}">
								<i style="font-style:normal;">2</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="2">
							</span>
        </td>
        <td>
							<span>2016-10-24
								<br -="">13:51:19</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/hnzt_03.html" title="光谷展厅" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,38)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,38,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/hnzt_03.html" title="光谷展厅" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,38)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/hnzt_03.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
										<input type="checkbox" name="chkItem" value="37">
									</span>
								</span>
            </div>
        </td>
        <td>37</td>
        <td>
							<span class="short_tit f_fl">
								<a href="##" onclick="edit(event,37)" class="update_Title">汉口展厅</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;37&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#helpColumn&quot;,&quot;type&quot;:&quot;help&quot;,&quot;value&quot;:&quot;11&quot;,&quot;oid&quot;:&quot;37&quot;}">
								<span class="clear_bd fast_in s_selt1 f_fl" id="helpColumn">
									<select class="pass_faq" name="cid" defvalue="11">
										<option value="1" oid="1">根目录</option>
										<option value="8" oid="8">├关于红鑫</option>
										<option value="9" oid="9">├定制服务</option>
										<option value="10" oid="10">├荣誉资质</option>
										<option value="11" oid="11">├直营展厅</option>
										<option value="12" oid="12">├联系我们</option>
										<option value="13" oid="13">├在线留言</option>
										<option value="14" oid="14">├工厂实力</option>
										<option value="15" oid="15">└代理品牌</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="37" typename="help" filecolumn="isindex">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="37" typename="help" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>

        </td>
        <td>
            <div class="hd_input" oid="37" typename="help" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="37" typename="help" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="37" typename="help" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;help&quot;,&quot;oid&quot;:&quot;37&quot;}">
								<i style="font-style:normal;">4</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="4">
							</span>
        </td>
        <td>
							<span>2016-10-24
								<br -="">13:50:54</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Helps/hnzt_02.html" title="汉口展厅" target="_blank" class="update_PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,37)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,37,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/mobile/Mhelps/hnzt_02.html" title="汉口展厅" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,37)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/mobile/Mhelps/hnzt_02.html')">
									<span class="pro_view pro_qrcode">
										<i></i>二维码
									</span>
                </a>
                <div class="code_img" style="position: absolute; top: 15px; right: 0px; z-index: 99; width: 303px; height: 303px; display: none; background-image: url(&quot;/Manager/mobile/Img/ailog_bg_03.gif&quot;); overflow: hidden;">
                    <div class="con_header" style="text-align: left; height: 47px; line-height: 45px; text-indent: 1em;">
                        <span class="close_btn" onclick="hideQR(this);" style="display: block; float: right; width: 30px; height: 30px; margin: 8px 5px 0px 0px; cursor: pointer; background-image: url(&quot;/Manager/mobile/Img/ailog_close.gif&quot;); background-position: center center; background-repeat: no-repeat;"></span>
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
                    <a onclick="return BatchOperation('确定禁用选中项（共{count}项）？');" id="LinkButton2" href="javascript:__doPostBack('LinkButton2','')">批量隐藏</a>
                </li>
                <li>
                    <a onclick="return BatchOperation('确定首页显示选中项（共{count}项）？');" id="LinkButton1" href="javascript:__doPostBack('LinkButton1','')">批量显示</a>
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
            <span class="p_numb f_fl">共29条&nbsp;|&nbsp;第1/2页</span>
            <select class="pageList_btn" onchange="var pageFile='helps.aspx?rc=29&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;">
                <option value="1" selected="selected">1</option>
                <option value="2">2</option>
            </select>
            <div class="pageDown_btn f_fr">
                <span class="p_prev  disable " title="上一页"></span>
                <a href="helps.aspx?rc=29&amp;page=2">
                    <span class="p_next " datahref="helps.aspx?rc=29&amp;page=2" title="下一页"></span>
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