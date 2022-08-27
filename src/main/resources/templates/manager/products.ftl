<#include "common/manage_layout.ftl"/>
<@html title_="产品列表" css_=["/manager/skins/base/products.css","/manager/skins/base/dialog.css","/manager/skins/default/list.css"]
js_=["/manager/js/common/common.js"]>
    <body marginwidth="0" marginheight="0">
    <div class="so_bread">
        <div class="nsw_bread_tit f_cb">

			<span class="nsw_add">当前位置：<a href="/manager/home.aspx" target="_parent">首页</a>&gt;<a href="#">
					<b>产品管理</b>
				</a>&gt;<a href="products.aspx">产品列表</a>
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
            <label class="com_name f_fl f_mr1">所属分类</label>
            <span class="clear_bd s_selt f_fl pt43" id="productColumn">
				<select class="pass_faq" name="cid">
					<option value="0001" oid="1">根分类</option>
					<option value="0001,0009" oid="9">├按用途分类</option>
					<option value="0001,0009,0021" oid="21">　├总裁总经理</option>
					<option value="0001,0009,0022" oid="22">　├总监经理</option>
					<option value="0001,0009,0023" oid="23">　├主管职员</option>
					<option value="0001,0009,0024" oid="24">　├前台、公共休闲区</option>
					<option value="0001,0009,0025" oid="25">　├会议室区域</option>
					<option value="0001,0009,0026" oid="26">　└接待洽谈区</option>
					<option value="0001,0010" oid="10">├按行业分类</option>
					<option value="0001,0010,0027" oid="27">　├政府机关</option>
					<option value="0001,0010,0028" oid="28">　├事业单位</option>
					<option value="0001,0010,0029" oid="29">　├公司企业</option>
					<option value="0001,0010,0030" oid="30">　├学校家具</option>
					<option value="0001,0010,0031" oid="31">　├酒店家具</option>
					<option value="0001,0010,0032" oid="32">　├银行家具</option>
					<option value="0001,0010,0033" oid="33">　└医院家具</option>
					<option value="0001,0011" oid="11">├大班台系列</option>
					<option value="0001,0011,0034" oid="34">　├板式大班台</option>
					<option value="0001,0011,0035" oid="35">　├实木大班台</option>
					<option value="0001,0011,0036" oid="36">　├板式中班台</option>
					<option value="0001,0011,0037" oid="37">　├实木中班台</option>
					<option value="0001,0011,0075" oid="75">　└全实木办公家具</option>
					<option value="0001,0012" oid="12">├办公屏风系列</option>
					<option value="0001,0012,0038" oid="38">　├办公隔断卡座</option>
					<option value="0001,0012,0039" oid="39">　├开放办公屏风</option>
					<option value="0001,0012,0040" oid="40">　└钢架组合桌</option>
					<option value="0001,0013" oid="13">├办公桌系列</option>
					<option value="0001,0013,0042" oid="42">　├板式办公桌</option>
					<option value="0001,0013,0043" oid="43">　├钢架办公桌</option>
					<option value="0001,0013,0089" oid="89">　├升降桌</option>
					<option value="0001,0013,0090" oid="90">　└实木贴皮办公桌</option>
					<option value="0001,0014" oid="14">├会议桌系列</option>
					<option value="0001,0014,0044" oid="44">　├实木会议桌</option>
					<option value="0001,0014,0045" oid="45">　├板式会议桌</option>
					<option value="0001,0014,0046" oid="46">　├培训桌</option>
					<option value="0001,0014,0047" oid="47">　├演讲台</option>
					<option value="0001,0014,0048" oid="48">　├洽谈桌</option>
					<option value="0001,0014,0049" oid="49">　└主席台</option>
					<option value="0001,0015" oid="15">├办公椅系列</option>
					<option value="0001,0015,0050" oid="50">　├皮面大班椅</option>
					<option value="0001,0015,0051" oid="51">　├网面大班椅</option>
					<option value="0001,0015,0052" oid="52">　├网面转椅</option>
					<option value="0001,0015,0053" oid="53">　├固定椅</option>
					<option value="0001,0015,0054" oid="54">　├休闲椅</option>
					<option value="0001,0015,0055" oid="55">　├吧椅</option>
					<option value="0001,0015,0084" oid="84">　├礼堂椅</option>
					<option value="0001,0015,0091" oid="91">　└会议培训椅</option>
					<option value="0001,0016" oid="16">├文件柜系列</option>
					<option value="0001,0016,0056" oid="56">　├实木书柜</option>
					<option value="0001,0016,0057" oid="57">　├板式书柜</option>
					<option value="0001,0016,0058" oid="58">　├钢制文件柜</option>
					<option value="0001,0016,0059" oid="59">　├钢制更衣柜</option>
					<option value="0001,0016,0060" oid="60">　├地柜</option>
					<option value="0001,0016,0061" oid="61">　└保险柜</option>
					<option value="0001,0017" oid="17">├办公前台系列</option>
					<option value="0001,0017,0062" oid="62">　├板式前台</option>
					<option value="0001,0017,0063" oid="63">　├烤漆前台</option>
					<option value="0001,0017,0064" oid="64">　└实木前台</option>
					<option value="0001,0018" oid="18">├沙发茶几系列</option>
					<option value="0001,0018,0065" oid="65">　├气派舒适沙发</option>
					<option value="0001,0018,0066" oid="66">　├时尚休闲沙发</option>
					<option value="0001,0018,0067" oid="67">　├布艺沙发</option>
					<option value="0001,0018,0068" oid="68">　├木茶几</option>
					<option value="0001,0018,0069" oid="69">　├玻璃茶几</option>
					<option value="0001,0018,0092" oid="92">　└茶台</option>
					<option value="0001,0019" oid="19">├高隔断系列</option>
					<option value="0001,0019,0070" oid="70">　├高档加厚型</option>
					<option value="0001,0019,0071" oid="71">　└经济普通型</option>
					<option value="0001,0020" oid="20">├办公装饰系列</option>
					<option value="0001,0020,0072" oid="72">　├办公地毯</option>
					<option value="0001,0020,0074" oid="74">　├装饰灯</option>
					<option value="0001,0020,0082" oid="82">　├饰品和装饰画</option>
					<option value="0001,0020,0085" oid="85">　└装饰窗帘</option>
					<option value="0001,0076" oid="76">└其它</option>
					<option value="0001,0076,0077" oid="77">　├高管办公家具</option>
					<option value="0001,0076,0078" oid="78">　├职员办公家具</option>
					<option value="0001,0076,0079" oid="79">　├公共办公家具</option>
					<option value="0001,0076,0080" oid="80">　├会议培训家具</option>
					<option value="0001,0076,0086" oid="86">　└学校教育家具</option>
				</select>
				<i class="revise_sub"></i>
			</span>
            <label class="com_name f_fl f_mr1 f_ml2">标题名称</label>
            <span class="clear_bd f_fl">
				<input class="com_input clear_word" type="text" placeholder="请输入标题名称" maxlength="15" name="kwd">
				<i class="clear_x"></i>
			</span>

            <input type="button" class="advan_so_btn f_csp f_fr" value="搜 索" onclick="SearchObjectByGet(this)">
        </div>
    </div>
    <div class="col_main">
        <form name="ctl01" method="post" action="products.aspx" id="ctl01">
            <div>
                <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
                <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
                <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTY1MjI1MTc2M2RkmwzUyq27iX96Nq4KSjVXQ9ZoT/E=">
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
                <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="FAB642B8">
                <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWCwLhrpzlDgLM0/WHCAKxi96RBQLM9PumDwKkvupQApaiwPwKAvu4omcC4M+E0gYCxebmvAwCqv3IpwICv6eI5grHf50fHKxmsPw8pksTUhkLvXNy/A==">
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
                        <li class="popUp" data-src="{&quot;popup&quot;:&quot;ExtensionClassification&quot;,&quot;action&quot;:&quot;extensionClassification&quot;,&quot;type&quot;:&quot;product&quot;}">批量添加扩展分类</li>
                        <li class="popUp nobd" data-src="{&quot;popup&quot;:&quot;ExtensionClassification&quot;,&quot;action&quot;:&quot;cancelExtensionClassification&quot;,&quot;type&quot;:&quot;product&quot;,&quot;title&quot;:&quot;批量取消扩展分类&quot;}">取消添加扩展分类</li>
                        <li class="popUp" data-src="{&quot;popup&quot;:&quot;MassTransfer&quot;,&quot;action&quot;:&quot;MassTransfer&quot;}">批量转移</li>
                        <li onclick="edit(event,null,true)">分类列表</li>
                    </ul>
                </div>
                <div class="nsw_pagination f_fr f_mr20 f_cb">
                    <!--IndexNavigator Start
Developed by: Oran(LikeCode####gmail.com)
Version:v0.5(Apr. 19, 2015)-->
                    <span class="p_numb f_fl">共448条&nbsp;|&nbsp;第1/23页</span>
                    <select class="pageList_btn" onchange="var pageFile='products.aspx?rc=448&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;">
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
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                    </select>
                    <div class="pageDown_btn f_fr">
                        <span class="p_prev  disable " title="上一页"></span>
                        <a href="products.aspx?rc=448&amp;page=2">
                            <span class="p_next " datahref="products.aspx?rc=448&amp;page=2" title="下一页"></span>
                        </a>
                    </div>
                    <!--IndexNavigator End-->
                </div>
            </div>
            <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
                <tbody>
                <tr id="tabHeader" class="">
                    <th style="width:30px" class="p">
                        <span class="cho"></span>
                    </th>
                    <th style="width:30px">ID</th>
                    <th style="width:200px;" axis="[Title]" class="order">标题名称</th>
                    <th style="width:200px" axis="[ColumnName]" class="order">所属分类</th>
                    <th style="width:30px" axis="[Delay]" class="order">首页
                        <br>显示</th>
                    <th style="width:30px" axis="[isCommend]" class="order">推荐</th>
                    <th style="width:30px" axis="[isTop]" class="order">置顶</th>
                    <th style="width:30px" axis="[isBest]" class="order">精华</th>
                    <th style="width:30px" axis="[Enable]" class="order">可用</th>
                    <th style="width:30px" axis="[OrderID]" class="order">排序</th>
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
										<input type="checkbox" name="chkItem" value="544">
									</span>
								</span>
                        </div>
                    </td>
                    <td>544</td>
                    <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220821154549_6640.jpg">
							</span>
                        <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,544)" class="update_Title">西昊c300人体工学椅</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;544&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}" style="display: none;"></i>
							</span>
                    </td>
                    <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;544&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="1">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
                    </td>
                    <td>
                        <div class="hd_input" oid="544" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="544" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="544" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="544" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
                        <div class="hd_input" oid="544" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
                        </div>
                    </td>
                    <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;544&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
                    </td>
                    <td>
							<span>2022-08-21
								<br -="">15:44:04</span>
                    </td>
                    <td class="nsw_cnt_area action_tx">
                        <a href="/Products/xhc300.html" title="西昊c300人体工学椅" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="edit(event,544)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                        <a href="##" onclick="edit(event,544,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
                        </a>

                    </td>

                    <td class="nsw_cnt_area action_tx">
                        <a href="/Mobile/MProducts/xhc300.html" title="西昊c300人体工学椅" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
                        </a>
                        <a href="##" onclick="EditMobile(event,544)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
                        </a>
                        <p class="scl_d">
                            <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/xhc300.html')">
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
										<input type="checkbox" name="chkItem" value="545">
									</span>
								</span>
            </div>
        </td>
        <td>545</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220821154646_0913.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,545)" class="update_Title">西昊m18人体工学椅</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;545&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}" style="display: none;"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;545&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="1">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="545" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="545" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="545" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="545" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="545" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;545&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-08-21
								<br -="">15:44:03</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/xhm18.html" title="西昊m18人体工学椅" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,545)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,545,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/xhm18.html" title="西昊m18人体工学椅" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,545)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/xhm18.html')">
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
										<input type="checkbox" name="chkItem" value="546">
									</span>
								</span>
            </div>
        </td>
        <td>546</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220821154737_1712.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,546)" class="update_Title">西昊M77C人体工学椅</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;546&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}" style="display: none;"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;546&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="1">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="546" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="546" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="546" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="546" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="546" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;546&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-08-21
								<br -="">15:44:02</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/m77.html" title="西昊M77C人体工学椅" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,546)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,546,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/m77.html" title="西昊M77C人体工学椅" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,546)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/m77.html')">
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
										<input type="checkbox" name="chkItem" value="547">
									</span>
								</span>
            </div>
        </td>
        <td>547</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220821154832_0403.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,547)" class="update_Title">西昊vito人体工学椅</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;547&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}" style="display: none;"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;547&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="1">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="547" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="547" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="547" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="547" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="547" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;547&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-08-21
								<br -="">15:44:01</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/xhvito.html" title="西昊vito人体工学椅" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,547)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,547,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/xhvito.html" title="西昊vito人体工学椅" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,547)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/xhvito.html')">
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
										<input type="checkbox" name="chkItem" value="542">
									</span>
								</span>
            </div>
        </td>
        <td>542</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220811164101_0785.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,542)" class="update_Title">西昊m97人体工学椅</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;542&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}" style="display: none;"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;542&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="1">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="542" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="542" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="542" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="542" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="542" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;542&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-08-11
								<br -="">16:44:33</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/xhm97e300.html" title="西昊m97人体工学椅" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,542)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,542,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/xhm97e300.html" title="西昊m97人体工学椅" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,542)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/xhm97e300.html')">
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
										<input type="checkbox" name="chkItem" value="543">
									</span>
								</span>
            </div>
        </td>
        <td>543</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220811164603_2977.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,543)" class="update_Title">西昊人体工学椅V1</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;543&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}" style="display: none;"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;543&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="1">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="543" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="543" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="543" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="543" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="543" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;543&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-08-11
								<br -="">16:44:32</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/v1.html" title="西昊人体工学椅V1" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,543)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,543,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/v1.html" title="西昊人体工学椅V1" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,543)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/v1.html')">
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
										<input type="checkbox" name="chkItem" value="541">
									</span>
								</span>
            </div>
        </td>
        <td>541</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220811164018_0180.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,541)" class="update_Title">西昊m59网面人体工学椅</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;541&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;1&quot;,&quot;oid&quot;:&quot;541&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="1">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="541" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="541" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="541" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="541" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="541" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;541&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-08-11
								<br -="">16:38:19</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/xhm59.html" title="西昊m59网面人体工学椅" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,541)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,541,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/xhm59.html" title="西昊m59网面人体工学椅" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,541)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/xhm59.html')">
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
										<input type="checkbox" name="chkItem" value="540">
									</span>
								</span>
            </div>
        </td>
        <td>540</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220804170926_8524.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,540)" class="update_Title">西昊m98人体工学椅子</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;540&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;15&quot;,&quot;oid&quot;:&quot;540&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="15">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="540" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="540" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="540" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="540" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="540" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;540&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-08-04
								<br -="">17:08:49</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/xhm98rtgxy.html" title="西昊m98人体工学椅子" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,540)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,540,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/xhm98rtgxy.html" title="西昊m98人体工学椅子" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,540)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/xhm98rtgxy.html')">
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
										<input type="checkbox" name="chkItem" value="539">
									</span>
								</span>
            </div>
        </td>
        <td>539</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220804165752_0697.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,539)" class="update_Title">西昊m57人体工学椅子</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;539&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;15&quot;,&quot;oid&quot;:&quot;539&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="15">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="539" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="539" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="539" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="539" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="539" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;539&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-08-04
								<br -="">16:54:00</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/xhm57rtgxy.html" title="西昊m57人体工学椅子" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,539)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,539,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/xhm57rtgxy.html" title="西昊m57人体工学椅子" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,539)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/xhm57rtgxy.html')">
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
										<input type="checkbox" name="chkItem" value="538">
									</span>
								</span>
            </div>
        </td>
        <td>538</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220801171408_4972.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,538)" class="update_Title">明哲MZE-DEA系列行政桌</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;538&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;21&quot;,&quot;oid&quot;:&quot;538&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="21">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="538" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="538" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="538" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="538" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="538" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;538&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-08-01
								<br -="">17:12:59</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/mz.html" title="明哲MZE-DEA系列行政桌" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,538)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,538,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/mz.html" title="明哲MZE-DEA系列行政桌" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,538)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/mz.html')">
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
										<input type="checkbox" name="chkItem" value="537">
									</span>
								</span>
            </div>
        </td>
        <td>537</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220801164819_2965.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,537)" class="update_Title">观和GAN-DEA高管台</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;537&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;21&quot;,&quot;oid&quot;:&quot;537&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="21">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="537" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="537" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="537" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="537" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="537" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;537&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-08-01
								<br -="">16:47:06</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/gh.html" title="观和GAN-DEA高管台" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,537)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,537,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/gh.html" title="观和GAN-DEA高管台" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,537)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/gh.html')">
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
										<input type="checkbox" name="chkItem" value="536">
									</span>
								</span>
            </div>
        </td>
        <td>536</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220729164023_4639.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,536)" class="update_Title">半月山BYS-DEA-3624行政桌</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;536&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;21&quot;,&quot;oid&quot;:&quot;536&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="21">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="536" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="536" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="536" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="536" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="536" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;536&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-07-29
								<br -="">16:38:15</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/bys.html" title="半月山BYS-DEA-3624行政桌" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,536)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,536,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/bys.html" title="半月山BYS-DEA-3624行政桌" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,536)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/bys.html')">
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
										<input type="checkbox" name="chkItem" value="533">
									</span>
								</span>
            </div>
        </td>
        <td>533</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220729161106_4174.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,533)" class="update_Title">WG-1882-x/y茶桌茶椅组合</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;533&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;92&quot;,&quot;oid&quot;:&quot;533&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="92">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="533" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="533" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="533" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="533" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="533" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;533&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-07-29
								<br -="">16:09:16</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/wg1882.html" title="WG-1882-x/y茶桌茶椅组合" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,533)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,533,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/wg1882.html" title="WG-1882-x/y茶桌茶椅组合" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,533)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/wg1882.html')">
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
										<input type="checkbox" name="chkItem" value="534">
									</span>
								</span>
            </div>
        </td>
        <td>534</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220729161542_0982.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,534)" class="update_Title">WG-2080系列茶桌茶椅组合</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;534&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;92&quot;,&quot;oid&quot;:&quot;534&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="92">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="534" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="534" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="534" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="534" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="534" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;534&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-07-29
								<br -="">16:09:15</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/wg2080xlcz.html" title="WG-2080系列茶桌茶椅组合" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,534)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,534,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/wg2080xlcz.html" title="WG-2080系列茶桌茶椅组合" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,534)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/wg2080xlcz.html')">
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
										<input type="checkbox" name="chkItem" value="535">
									</span>
								</span>
            </div>
        </td>
        <td>535</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220729162408_2602.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,535)" class="update_Title">WG-2273岩板茶桌茶椅组合</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;535&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;92&quot;,&quot;oid&quot;:&quot;535&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="92">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="535" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="535" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="535" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="535" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="535" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;535&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-07-29
								<br -="">16:09:14</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/wg2273ybcz.html" title="WG-2273岩板茶桌茶椅组合" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,535)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,535,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/wg2273ybcz.html" title="WG-2273岩板茶桌茶椅组合" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,535)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/wg2273ybcz.html')">
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
										<input type="checkbox" name="chkItem" value="532">
									</span>
								</span>
            </div>
        </td>
        <td>532</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220729154718_2858.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,532)" class="update_Title">WG-2188茶台/茶椅系列</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;532&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;92&quot;,&quot;oid&quot;:&quot;532&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="92">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="532" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="532" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="532" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="532" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="532" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;532&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-07-29
								<br -="">15:42:29</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/wg2188ctcy.html" title="WG-2188茶台/茶椅系列" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,532)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,532,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/wg2188ctcy.html" title="WG-2188茶台/茶椅系列" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,532)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/wg2188ctcy.html')">
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
										<input type="checkbox" name="chkItem" value="529">
									</span>
								</span>
            </div>
        </td>
        <td>529</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220728164506_1743.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,529)" class="update_Title">HX-2116文件柜</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;529&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;16&quot;,&quot;oid&quot;:&quot;529&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="16">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="529" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="529" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="529" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="529" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="529" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;529&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-07-28
								<br -="">16:50:26</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/hx2116wjg_1.html" title="HX-2116文件柜" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,529)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,529,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/hx2116wjg_1.html" title="HX-2116文件柜" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,529)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/hx2116wjg_1.html')">
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
										<input type="checkbox" name="chkItem" value="528">
									</span>
								</span>
            </div>
        </td>
        <td>528</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220728165446_9575.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,528)" class="update_Title">HX-G32文件柜</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;528&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;16&quot;,&quot;oid&quot;:&quot;528&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="16">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="528" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="528" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="528" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="528" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="528" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;528&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-07-28
								<br -="">16:50:25</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/hxg32wjg.html" title="HX-G32文件柜" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,528)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,528,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/hxg32wjg.html" title="HX-G32文件柜" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,528)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/hxg32wjg.html')">
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
										<input type="checkbox" name="chkItem" value="527">
									</span>
								</span>
            </div>
        </td>
        <td>527</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220728165517_9593.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,527)" class="update_Title">NX-G02文件柜</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;527&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;16&quot;,&quot;oid&quot;:&quot;527&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="16">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="527" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="527" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="527" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="527" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="527" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;527&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-07-28
								<br -="">16:50:23</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/nxg02wjg.html" title="NX-G02文件柜" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,527)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,527,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/nxg02wjg.html" title="NX-G02文件柜" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,527)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/nxg02wjg.html')">
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
										<input type="checkbox" name="chkItem" value="526">
									</span>
								</span>
            </div>
        </td>
        <td>526</td>
        <td class="pimgsv">
							<span class="shot_img f_fl">
								<img src="/uploadfiles/pictures/product/20220728165543_0157.jpg">
							</span>
            <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,526)" class="update_Title">NX-G03文件柜</a>
								<i class="e_edi1 e_more_edit popUp" data-src="{&quot;oid&quot;:&quot;526&quot;,&quot;popup&quot;:&quot;ModificationPopUp&quot;}"></i>
							</span>
        </td>
        <td>
							<span class="editor_warp alertColumn update_ColumnID" data-src="{&quot;action&quot;:&quot;alertColumn&quot;,&quot;editor&quot;:&quot;select_editor&quot;,&quot;source&quot;:&quot;#productColumn&quot;,&quot;type&quot;:&quot;product&quot;,&quot;value&quot;:&quot;16&quot;,&quot;oid&quot;:&quot;526&quot;}">
								<span class="clear_bd s_selt f_fl pt43" id="productColumn">
									<select class="pass_faq" name="cid" defvalue="16">
										<option value="1" oid="1">根分类</option>
										<option value="9" oid="9">├按用途分类</option>
										<option value="21" oid="21">　├总裁总经理</option>
										<option value="22" oid="22">　├总监经理</option>
										<option value="23" oid="23">　├主管职员</option>
										<option value="24" oid="24">　├前台、公共休闲区</option>
										<option value="25" oid="25">　├会议室区域</option>
										<option value="26" oid="26">　└接待洽谈区</option>
										<option value="10" oid="10">├按行业分类</option>
										<option value="27" oid="27">　├政府机关</option>
										<option value="28" oid="28">　├事业单位</option>
										<option value="29" oid="29">　├公司企业</option>
										<option value="30" oid="30">　├学校家具</option>
										<option value="31" oid="31">　├酒店家具</option>
										<option value="32" oid="32">　├银行家具</option>
										<option value="33" oid="33">　└医院家具</option>
										<option value="11" oid="11">├大班台系列</option>
										<option value="34" oid="34">　├板式大班台</option>
										<option value="35" oid="35">　├实木大班台</option>
										<option value="36" oid="36">　├板式中班台</option>
										<option value="37" oid="37">　├实木中班台</option>
										<option value="75" oid="75">　└全实木办公家具</option>
										<option value="12" oid="12">├办公屏风系列</option>
										<option value="38" oid="38">　├办公隔断卡座</option>
										<option value="39" oid="39">　├开放办公屏风</option>
										<option value="40" oid="40">　└钢架组合桌</option>
										<option value="13" oid="13">├办公桌系列</option>
										<option value="42" oid="42">　├板式办公桌</option>
										<option value="43" oid="43">　├钢架办公桌</option>
										<option value="89" oid="89">　├升降桌</option>
										<option value="90" oid="90">　└实木贴皮办公桌</option>
										<option value="14" oid="14">├会议桌系列</option>
										<option value="44" oid="44">　├实木会议桌</option>
										<option value="45" oid="45">　├板式会议桌</option>
										<option value="46" oid="46">　├培训桌</option>
										<option value="47" oid="47">　├演讲台</option>
										<option value="48" oid="48">　├洽谈桌</option>
										<option value="49" oid="49">　└主席台</option>
										<option value="15" oid="15">├办公椅系列</option>
										<option value="50" oid="50">　├皮面大班椅</option>
										<option value="51" oid="51">　├网面大班椅</option>
										<option value="52" oid="52">　├网面转椅</option>
										<option value="53" oid="53">　├固定椅</option>
										<option value="54" oid="54">　├休闲椅</option>
										<option value="55" oid="55">　├吧椅</option>
										<option value="84" oid="84">　├礼堂椅</option>
										<option value="91" oid="91">　└会议培训椅</option>
										<option value="16" oid="16">├文件柜系列</option>
										<option value="56" oid="56">　├实木书柜</option>
										<option value="57" oid="57">　├板式书柜</option>
										<option value="58" oid="58">　├钢制文件柜</option>
										<option value="59" oid="59">　├钢制更衣柜</option>
										<option value="60" oid="60">　├地柜</option>
										<option value="61" oid="61">　└保险柜</option>
										<option value="17" oid="17">├办公前台系列</option>
										<option value="62" oid="62">　├板式前台</option>
										<option value="63" oid="63">　├烤漆前台</option>
										<option value="64" oid="64">　└实木前台</option>
										<option value="18" oid="18">├沙发茶几系列</option>
										<option value="65" oid="65">　├气派舒适沙发</option>
										<option value="66" oid="66">　├时尚休闲沙发</option>
										<option value="67" oid="67">　├布艺沙发</option>
										<option value="68" oid="68">　├木茶几</option>
										<option value="69" oid="69">　├玻璃茶几</option>
										<option value="92" oid="92">　└茶台</option>
										<option value="19" oid="19">├高隔断系列</option>
										<option value="70" oid="70">　├高档加厚型</option>
										<option value="71" oid="71">　└经济普通型</option>
										<option value="20" oid="20">├办公装饰系列</option>
										<option value="72" oid="72">　├办公地毯</option>
										<option value="74" oid="74">　├装饰灯</option>
										<option value="82" oid="82">　├饰品和装饰画</option>
										<option value="85" oid="85">　└装饰窗帘</option>
										<option value="76" oid="76">└其它</option>
										<option value="77" oid="77">　├高管办公家具</option>
										<option value="78" oid="78">　├职员办公家具</option>
										<option value="79" oid="79">　├公共办公家具</option>
										<option value="80" oid="80">　├会议培训家具</option>
										<option value="86" oid="86">　└学校教育家具</option>
									</select>
									<i class="revise_sub"></i>
								</span>
							</span>
        </td>
        <td>
            <div class="hd_input" oid="526" typename="product" filecolumn="isindex">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="526" typename="product" filecolumn="isCommend">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="526" typename="product" filecolumn="isTop">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="526" typename="product" filecolumn="isBest">
								<span class="p_show e_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio">
									<label></label>
								</span>
            </div>
        </td>
        <td>
            <div class="hd_input" oid="526" typename="product" filecolumn="Enable">
								<span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint">
									<input class="hd" type="radio" checked="checked">
									<label></label>
								</span>
            </div>
        </td>
        <td>
							<span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;product&quot;,&quot;oid&quot;:&quot;526&quot;}">
								<i style="font-style:normal;">50</i>
								<input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50">
							</span>
        </td>
        <td>
							<span>2022-07-28
								<br -="">16:50:22</span>
        </td>
        <td class="nsw_cnt_area action_tx">
            <a href="/Products/nxg03wjg.html" title="NX-G03文件柜" target="_blank" class="PageURL">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="edit(event,526)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <a href="##" onclick="edit(event,526,'action=copy')">
								<span class="pro_copy">
									<i></i>复制
								</span>
            </a>

        </td>

        <td class="nsw_cnt_area action_tx">
            <a href="/Mobile/MProducts/nxg03wjg.html" title="NX-G03文件柜" target="_blank">
								<span class="pro_view">
									<i></i>预览
								</span>
            </a>
            <a href="##" onclick="EditMobile(event,526)">
								<span class="pro_view pro_edit">
									<i></i>编辑
								</span>
            </a>
            <p class="scl_d">
                <a href="##" onclick="Qrcode(this,'http://www.hongxin.com.cn/Mobile/MProducts/nxg03wjg.html')">
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
                <li class="popUp" data-src="{&quot;popup&quot;:&quot;ExtensionClassification&quot;,&quot;action&quot;:&quot;extensionClassification&quot;,&quot;type&quot;:&quot;product&quot;}">批量添加扩展分类</li>
                <li class="popUp nobd" data-src="{&quot;popup&quot;:&quot;ExtensionClassification&quot;,&quot;action&quot;:&quot;cancelExtensionClassification&quot;,&quot;type&quot;:&quot;product&quot;,&quot;title&quot;:&quot;批量取消扩展分类&quot;}">取消添加扩展分类</li>
                <li class="popUp" data-src="{&quot;popup&quot;:&quot;MassTransfer&quot;,&quot;action&quot;:&quot;MassTransfer&quot;}">批量转移</li>
                <li onclick="edit(event,null,true)">分类列表</li>
            </ul>
        </div>
        <div class="nsw_pagination f_fr f_mr20 f_cb">
            <!--IndexNavigator Start
Developed by: Oran(LikeCode####gmail.com)
Version:v0.5(Apr. 19, 2015)-->
            <span class="p_numb f_fl">共448条&nbsp;|&nbsp;第1/23页</span>
            <select class="pageList_btn" onchange="var pageFile='products.aspx?rc=448&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;">
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
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
            </select>
            <div class="pageDown_btn f_fr">
                <span class="p_prev  disable " title="上一页"></span>
                <a href="products.aspx?rc=448&amp;page=2">
                    <span class="p_next " datahref="products.aspx?rc=448&amp;page=2" title="下一页"></span>
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