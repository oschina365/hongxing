<#include "/manager/common/manage_layout.ftl"/>
<@html title_="产品列表" css_=["/manager/skins/base/products.css","/manager/skins/base/dialog.css","/manager/skins/default/list.css"]
js_=["/manager/js/common/common.js","/manager/js/common/editor.js","/manager/js/common/list.js"]>

<body class="column_list" marginwidth="0" marginheight="0">
<div class="so_bread">
    <div class="nsw_bread_tit f_cb">

        <span class="nsw_add">当前位置：<a href="/manager/home.aspx" target="_parent">首页</a>&gt;<a href="#"><b>产品管理</b></a>&gt;<a href="product_column.aspx">产品分类</a></span>
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
                <option value="0001" oid="1">根分类</option><option value="0001,0009" oid="9">├按用途分类</option><option value="0001,0009,0021" oid="21">　├总裁总经理</option><option value="0001,0009,0022" oid="22">　├总监经理</option><option value="0001,0009,0023" oid="23">　├主管职员</option><option value="0001,0009,0024" oid="24">　├前台、公共休闲区</option><option value="0001,0009,0025" oid="25">　├会议室区域</option><option value="0001,0009,0026" oid="26">　└接待洽谈区</option><option value="0001,0010" oid="10">├按行业分类</option><option value="0001,0010,0027" oid="27">　├政府机关</option><option value="0001,0010,0028" oid="28">　├事业单位</option><option value="0001,0010,0029" oid="29">　├公司企业</option><option value="0001,0010,0030" oid="30">　├学校家具</option><option value="0001,0010,0031" oid="31">　├酒店家具</option><option value="0001,0010,0032" oid="32">　├银行家具</option><option value="0001,0010,0033" oid="33">　└医院家具</option><option value="0001,0011" oid="11">├大班台系列</option><option value="0001,0011,0034" oid="34">　├板式大班台</option><option value="0001,0011,0035" oid="35">　├实木大班台</option><option value="0001,0011,0036" oid="36">　├板式中班台</option><option value="0001,0011,0037" oid="37">　├实木中班台</option><option value="0001,0011,0075" oid="75">　└全实木办公家具</option><option value="0001,0012" oid="12">├办公屏风系列</option><option value="0001,0012,0038" oid="38">　├办公隔断卡座</option><option value="0001,0012,0039" oid="39">　├开放办公屏风</option><option value="0001,0012,0040" oid="40">　└钢架组合桌</option><option value="0001,0013" oid="13">├办公桌系列</option><option value="0001,0013,0042" oid="42">　├板式办公桌</option><option value="0001,0013,0043" oid="43">　├钢架办公桌</option><option value="0001,0013,0089" oid="89">　├升降桌</option><option value="0001,0013,0090" oid="90">　└实木贴皮办公桌</option><option value="0001,0014" oid="14">├会议桌系列</option><option value="0001,0014,0044" oid="44">　├实木会议桌</option><option value="0001,0014,0045" oid="45">　├板式会议桌</option><option value="0001,0014,0046" oid="46">　├培训桌</option><option value="0001,0014,0047" oid="47">　├演讲台</option><option value="0001,0014,0048" oid="48">　├洽谈桌</option><option value="0001,0014,0049" oid="49">　└主席台</option><option value="0001,0015" oid="15">├办公椅系列</option><option value="0001,0015,0050" oid="50">　├皮面大班椅</option><option value="0001,0015,0051" oid="51">　├网面大班椅</option><option value="0001,0015,0052" oid="52">　├网面转椅</option><option value="0001,0015,0053" oid="53">　├固定椅</option><option value="0001,0015,0054" oid="54">　├休闲椅</option><option value="0001,0015,0055" oid="55">　├吧椅</option><option value="0001,0015,0084" oid="84">　├礼堂椅</option><option value="0001,0015,0091" oid="91">　└会议培训椅</option><option value="0001,0016" oid="16">├文件柜系列</option><option value="0001,0016,0056" oid="56">　├实木书柜</option><option value="0001,0016,0057" oid="57">　├板式书柜</option><option value="0001,0016,0058" oid="58">　├钢制文件柜</option><option value="0001,0016,0059" oid="59">　├钢制更衣柜</option><option value="0001,0016,0060" oid="60">　├地柜</option><option value="0001,0016,0061" oid="61">　└保险柜</option><option value="0001,0017" oid="17">├办公前台系列</option><option value="0001,0017,0062" oid="62">　├板式前台</option><option value="0001,0017,0063" oid="63">　├烤漆前台</option><option value="0001,0017,0064" oid="64">　└实木前台</option><option value="0001,0018" oid="18">├沙发茶几系列</option><option value="0001,0018,0065" oid="65">　├气派舒适沙发</option><option value="0001,0018,0066" oid="66">　├时尚休闲沙发</option><option value="0001,0018,0067" oid="67">　├布艺沙发</option><option value="0001,0018,0068" oid="68">　├木茶几</option><option value="0001,0018,0069" oid="69">　├玻璃茶几</option><option value="0001,0018,0092" oid="92">　└茶台</option><option value="0001,0019" oid="19">├高隔断系列</option><option value="0001,0019,0070" oid="70">　├高档加厚型</option><option value="0001,0019,0071" oid="71">　└经济普通型</option><option value="0001,0020" oid="20">├办公装饰系列</option><option value="0001,0020,0072" oid="72">　├办公地毯</option><option value="0001,0020,0074" oid="74">　├装饰灯</option><option value="0001,0020,0082" oid="82">　├饰品和装饰画</option><option value="0001,0020,0085" oid="85">　└装饰窗帘</option><option value="0001,0076" oid="76">└其它</option><option value="0001,0076,0077" oid="77">　├高管办公家具</option><option value="0001,0076,0078" oid="78">　├职员办公家具</option><option value="0001,0076,0079" oid="79">　├公共办公家具</option><option value="0001,0076,0080" oid="80">　├会议培训家具</option><option value="0001,0076,0086" oid="86">　└学校教育家具</option>
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
                <span class="dn"><input type="radio" checked="checked" name="enable" value="1"></span>
                <label>显示</label>
            </span>
            <span class="f_fl f_db e_radio radio" cur="z_select">
                <span class="dn"><input type="radio" name="enable" value="0"></span>
                <label>隐藏</label>
            </span>
            <span class="f_fl f_db e_radio radio" cur="z_select">
                <span class="dn"><input type="radio" name="enable" value="-1"></span>
                <label>不限</label>
            </span>
        </ul>
        <input type="button" class="advan_so_btn f_csp f_fr" value="搜 索" onclick="SearchObjectByGet(this)">
    </div>
</div>

<!-- 快速录入 开始 -->
<div class="nsw_add_proclsify f_cb" style="padding-left:2%;">
    <form onsubmit="return false;"><label class="com_name f_fl" style="margin-right:1%;">所属分类</label>
        <span class="clear_bd fast_in f_fl">
		<select class="pass_faq" name="cid">
			<option value="1">根分类</option><option value="9">├按用途分类</option><option value="21">　├总裁总经理</option><option value="22">　├总监经理</option><option value="23">　├主管职员</option><option value="24">　├前台、公共休闲区</option><option value="25">　├会议室区域</option><option value="26">　└接待洽谈区</option><option value="10">├按行业分类</option><option value="27">　├政府机关</option><option value="28">　├事业单位</option><option value="29">　├公司企业</option><option value="30">　├学校家具</option><option value="31">　├酒店家具</option><option value="32">　├银行家具</option><option value="33">　└医院家具</option><option value="11">├大班台系列</option><option value="34">　├板式大班台</option><option value="35">　├实木大班台</option><option value="36">　├板式中班台</option><option value="37">　├实木中班台</option><option value="75">　└全实木办公家具</option><option value="12">├办公屏风系列</option><option value="38">　├办公隔断卡座</option><option value="39">　├开放办公屏风</option><option value="40">　└钢架组合桌</option><option value="13">├办公桌系列</option><option value="42">　├板式办公桌</option><option value="43">　├钢架办公桌</option><option value="89">　├升降桌</option><option value="90">　└实木贴皮办公桌</option><option value="14">├会议桌系列</option><option value="44">　├实木会议桌</option><option value="45">　├板式会议桌</option><option value="46">　├培训桌</option><option value="47">　├演讲台</option><option value="48">　├洽谈桌</option><option value="49">　└主席台</option><option value="15">├办公椅系列</option><option value="50">　├皮面大班椅</option><option value="51">　├网面大班椅</option><option value="52">　├网面转椅</option><option value="53">　├固定椅</option><option value="54">　├休闲椅</option><option value="55">　├吧椅</option><option value="84">　├礼堂椅</option><option value="91">　└会议培训椅</option><option value="16">├文件柜系列</option><option value="56">　├实木书柜</option><option value="57">　├板式书柜</option><option value="58">　├钢制文件柜</option><option value="59">　├钢制更衣柜</option><option value="60">　├地柜</option><option value="61">　└保险柜</option><option value="17">├办公前台系列</option><option value="62">　├板式前台</option><option value="63">　├烤漆前台</option><option value="64">　└实木前台</option><option value="18">├沙发茶几系列</option><option value="65">　├气派舒适沙发</option><option value="66">　├时尚休闲沙发</option><option value="67">　├布艺沙发</option><option value="68">　├木茶几</option><option value="69">　├玻璃茶几</option><option value="92">　└茶台</option><option value="19">├高隔断系列</option><option value="70">　├高档加厚型</option><option value="71">　└经济普通型</option><option value="20">├办公装饰系列</option><option value="72">　├办公地毯</option><option value="74">　├装饰灯</option><option value="82">　├饰品和装饰画</option><option value="85">　└装饰窗帘</option><option value="76">└其它</option><option value="77">　├高管办公家具</option><option value="78">　├职员办公家具</option><option value="79">　├公共办公家具</option><option value="80">　├会议培训家具</option><option value="86">　└学校教育家具</option>
		</select>
		<i class="revise_sub"></i>
	</span>
        <label class="com_name f_ml10 f_fl">分类标题</label>
        <span class="clear_bd th1 f_fl"><input class="com_input clear_word validatebox-text validatebox-invalid" name="columns" type="text" maxlength="140" _required="true" tips="分类标题" placeholder="请填写分类名称"><i class="clear_x"></i></span>
        <span class="e_btn1 f_ml2 f_csp f_fl f_mr5 ajaxSave" data-src="{&quot;action&quot;:&quot;BatchAddColumn&quot;}"><i class="save_icon"></i>保 存</span>
        <span class="role_addbtn f_ml2 f_csp f_fl popUp" data-src="{&quot;popup&quot;:&quot;BatchAddColumnPopUp&quot;,&quot;action&quot;:&quot;BatchAddColumn&quot;,&quot;title&quot;:&quot;批量添加产品分类&quot;,&quot;type&quot;:&quot;productcolumn&quot;}">添加</span>
        <input type="hidden" name="typename" value="productcolumn"><input type="hidden" name="mode" value="single"></form>
</div>
<!-- 快速录入 结束 -->

<div class="col_main">
    <form name="ctl01" method="post" action="product_column.aspx" id="ctl01">
        <div>
            <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
            <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
            <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTUwODAwMjM3OWRkbcorRjWDwgz9QXnCDEu8jmAY5lw=">
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

            <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="C5C25670">
            <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWCQLN7fDQDQLM0/WHCAKmwImNCwKjwImNCwKkwImNCwKZwImNCwKawImNCwKhwPWxAgKiwPWxAlUPcFTJtljYewBzwmuDzLZxJDAB">
        </div>
        <!-- 列表区 开始 -->
        <div class="nsw_tools_bar f_cb top_nsw_tools_bar" style="background: rgb(255, 255, 255);">
            <ul class="nsw_check_btns f_fl">
                <li class="f_ml20">
                    <span class="sele_all"><input type="radio" class="dn"><em class="e_word"></em>全选</span>|
                    <span class="sele_inverse">反选</span>
                </li>
                <li class="f_ml20">
                    <a onclick="return BatchOperation();" id="lnkBtnDel" href="javascript:__doPostBack('lnkBtnDel','')"><span>删除</span></a>|<span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>
                </li>
            </ul>
            <div class="batch_act f_fl f_ml20">
                <span class="c_act">其他操作<i class="tri_up f_fr"></i></span>
                <ul class="batch_dropup column" style="display: none;">
                    <li><a onclick="return BatchOperation('确定禁用选中项（共{count}项）？');" href="javascript:__doPostBack('ctl05','')">批量隐藏</a></li>
                    <li><a onclick="return BatchOperation('确定推荐选中项（共{count}项）？');" href="javascript:__doPostBack('ctl06','')">批量推荐</a></li>
                    <li><a onclick="return BatchOperation('确定禁用选中项（共{count}项）推荐？');" href="javascript:__doPostBack('ctl07','')">批量取消推荐</a></li>
                    <li><a onclick="return BatchOperation('确定置顶选中项（共{count}项）？');" href="javascript:__doPostBack('ctl08','')">批量置顶</a></li>
                    <li><a onclick="return BatchOperation('确定禁用选中项（共{count}项）置顶？');" href="javascript:__doPostBack('ctl09','')">批量取消置顶</a></li>
                    <li><a onclick="return BatchOperation('确定精华选中项（共{count}项）？');" href="javascript:__doPostBack('ctl10','')">批量精华</a></li>
                    <li><a onclick="return BatchOperation('确定禁用选中项（共{count}项）精华？');" href="javascript:__doPostBack('ctl11','')">批量取消精华</a></li>
                    <li class="popUp" data-src="{&quot;popup&quot;:&quot;BatchAddColumnPopUp&quot;,&quot;action&quot;:&quot;BatchAddColumn&quot;,&quot;title&quot;:&quot;批量添加分类&quot;,&quot;type&quot;:&quot;productcolumn&quot;}">批量添加分类</li>
                    <li class="popUp" data-src="{&quot;popup&quot;:&quot;ListImportedColumnAttribute&quot;,&quot;type&quot;:&quot;product&quot;}">批量导入属性</li>
                    <li onclick="edit(event,null,'products.aspx')">返回列表</li></ul>
            </div>
            <div class="nsw_pagination f_fr f_mr20 f_cb">
                <!--IndexNavigator Start
Developed by: Oran(LikeCode####gmail.com)
Version:v0.5(Apr. 19, 2015)--><span class="p_numb f_fl">共79条&nbsp;|&nbsp;第1/4页</span><select class="pageList_btn" onchange="var pageFile='product_column.aspx?rc=79&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;"><option value="1" selected="selected">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option></select><div class="pageDown_btn f_fr"><span class="p_prev  disable " title="上一页"></span><a href="product_column.aspx?rc=79&amp;page=2"><span class="p_next " datahref="product_column.aspx?rc=79&amp;page=2" title="下一页"></span></a></div><!--IndexNavigator End-->
            </div>
        </div><table class="nsw_pro_list grouping" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
            <tbody><tr id="tabHeader" class="parentid_undefined">
                <th style="width:50px" class="p"><span class="cho"></span></th>
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

                <th style="width:60px;"><b>手机</b>操作</th>

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
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="1" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="1" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="1" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>20</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;1&quot;}" style=""><i style="font-style:normal;">1</i><input type="text" style="border:0;width:90%;height:0px;line-height:0px;display:none;border:1px solid #ccc;" defvalue="1"></span></td>
                <td>
                    <span>2014-03-08<br -="">10:50:55</span>
                </td>
                <td class="nsw_cnt_area action_tx  f_noinfo"></td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,1)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_1" oid="9" parentid="1">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="9"></span></span></div>
                </td>
                <td>9</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,9)">├-按用途分类</a>

                    <i class="contraction popUp"></i></span>
                </td>
                <td>
                    <div class="hd_input" oid="9" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="9" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="9" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="9" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>0</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;9&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:56:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/aytfl.html" title="按用途分类" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,9,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;9&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,9)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_9" oid="21" parentid="9">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="21"></span></span></div>
                </td>
                <td>21</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,21)">　├-总裁-总经理</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="21" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="21" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="21" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="21" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>11</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;21&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:56:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/zczjl.html" title="总裁-总经理" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,21,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;21&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,21)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_9" oid="22" parentid="9">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="22"></span></span></div>
                </td>
                <td>22</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,22)">　├-总监-经理</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="22" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="22" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="22" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="22" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>5</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;22&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:56:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/zjjl.html" title="总监-经理" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,22,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;22&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,22)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_9" oid="23" parentid="9">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="23"></span></span></div>
                </td>
                <td>23</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,23)">　├-主管-职员</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="23" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="23" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="23" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="23" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>15</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;23&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:56:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/zgzy.html" title="主管-职员" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,23,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;23&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,23)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_9" oid="24" parentid="9">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="24"></span></span></div>
                </td>
                <td>24</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,24)">　├-前台、公共休闲区</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="24" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="24" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="24" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="24" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>2</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;24&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:56:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/qtggxxq.html" title="前台、公共休闲区" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,24,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;24&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,24)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_9" oid="25" parentid="9">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="25"></span></span></div>
                </td>
                <td>25</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,25)">　├-会议室区域</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="25" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="25" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="25" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="25" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>9</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;25&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:56:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/hysqy.html" title="会议室区域" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,25,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;25&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,25)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_9" oid="26" parentid="9">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="26"></span></span></div>
                </td>
                <td>26</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,26)">　└-接待洽谈区</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="26" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="26" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="26" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="26" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>18</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;26&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:56:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/jdqtq.html" title="接待洽谈区" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,26,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;26&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,26)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_1" oid="10" parentid="1">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="10"></span></span></div>
                </td>
                <td>10</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,10)">├-按行业分类</a>

                    <i class="contraction popUp"></i></span>
                </td>
                <td>
                    <div class="hd_input" oid="10" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="10" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="10" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="10" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>0</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;10&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:56:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/axyfl.html" title="按行业分类" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,10,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;10&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,10)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_10" oid="27" parentid="10">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="27"></span></span></div>
                </td>
                <td>27</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,27)">　├-政府机关</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="27" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="27" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="27" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="27" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>0</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;27&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:57:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/zfjg.html" title="政府机关" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,27,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;27&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,27)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_10" oid="28" parentid="10">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="28"></span></span></div>
                </td>
                <td>28</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,28)">　├-事业单位</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="28" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="28" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="28" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="28" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>0</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;28&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:57:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/sydw.html" title="事业单位" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,28,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;28&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,28)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_10" oid="29" parentid="10">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="29"></span></span></div>
                </td>
                <td>29</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,29)">　├-公司企业</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="29" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="29" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="29" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="29" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>0</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;29&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:57:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/gsqy.html" title="公司企业" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,29,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;29&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,29)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_10" oid="30" parentid="10">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="30"></span></span></div>
                </td>
                <td>30</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,30)">　├-学校家具</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="30" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="30" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="30" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="30" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>9</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;30&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:57:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/xxjj.html" title="学校家具" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,30,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;30&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,30)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_10" oid="31" parentid="10">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="31"></span></span></div>
                </td>
                <td>31</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,31)">　├-酒店家具</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="31" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="31" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="31" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="31" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>15</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;31&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:57:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/jdjj.html" title="酒店家具" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,31,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;31&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,31)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_10" oid="32" parentid="10">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="32"></span></span></div>
                </td>
                <td>32</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,32)">　├-银行家具</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="32" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="32" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="32" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="32" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>0</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;32&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:57:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/yxjj.html" title="银行家具" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,32,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;32&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,32)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_10" oid="33" parentid="10">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="33"></span></span></div>
                </td>
                <td>33</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,33)">　└-医院家具</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="33" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="33" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="33" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="33" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>0</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;33&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:57:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/yyjj.html" title="医院家具" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,33,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;33&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,33)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_1" oid="11" parentid="1">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="11"></span></span></div>
                </td>
                <td>11</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,11)">├-大班台系列</a>

                    <i class="contraction popUp"></i></span>
                </td>
                <td>
                    <div class="hd_input" oid="11" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="11" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="11" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="11" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>1</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;11&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:56:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/dbtxl.html" title="大班台系列" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,11,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;11&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,11)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_11" oid="34" parentid="11">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="34"></span></span></div>
                </td>
                <td>34</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,34)">　├-板式大班台</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="34" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="34" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="34" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="34" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>14</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;34&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:58:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/bsdbt.html" title="板式大班台" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,34,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;34&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,34)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_11" oid="35" parentid="11">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="35"></span></span></div>
                </td>
                <td>35</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,35)">　├-实木大班台</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="35" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="35" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="35" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="35" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>9</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;35&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:58:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/smdbt.html" title="实木大班台" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,35,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;35&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,35)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>

            <tr class="child_1  parentid_11" oid="36" parentid="11">
                <td class="td1">
                    <div class="nsw_check_box"><span class="ck_box"><span class="dn"><input type="checkbox" name="chkItem" value="36"></span></span></div>
                </td>
                <td>36</td>
                <td class="rname">
                    <span class="short_tit f_fl">

                        <a href="##" onclick="edit(event,36)">　├-板式中班台</a>

                    </span>
                </td>
                <td>
                    <div class="hd_input" oid="36" typename="productcolumn" filecolumn="isCommend">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="36" typename="productcolumn" filecolumn="isTop">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="36" typename="productcolumn" filecolumn="isBest">
                        <span class="p_show e_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio"><label></label></span>
                    </div>
                </td>
                <td>
                    <div class="hd_input" oid="36" typename="productcolumn" filecolumn="Enable">
                        <span class="p_show e_lowpoint  z_lowpoint  " cur="z_lowpoint"><input class="hd" type="radio" checked="checked"><label></label></span>
                    </div>
                </td>
                <td>10</td>
                <td><span class="editor_warp" data-src="{&quot;action&quot;:&quot;alertOrder&quot;,&quot;dataType&quot;:&quot;number&quot;,&quot;editor&quot;:&quot;input_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;36&quot;}"><i style="font-style:normal;">50</i><input type="text" style="border:0;width:90%;height:16px;line-height:16px;display:none;border:1px solid #ccc;" defvalue="50"></span></td>
                <td>
                    <span>2016-10-21<br -="">14:58:00</span>
                </td>
                <td class="nsw_cnt_area action_tx ">
                    <a href="http://www.hongxin.com.cn/bszbt.html" title="板式中班台" target="_blank"><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="edit(event,36,'action=copy')"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src="{&quot;action&quot;:&quot;delete&quot;,&quot;editor&quot;:&quot;delete_editor&quot;,&quot;type&quot;:&quot;productcolumn&quot;,&quot;oid&quot;:&quot;36&quot;}"><i></i>删除</span>
                </td>

                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,36)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>

            </tr>


            </tbody></table>
        <!-- 列表分页 开始 -->
        <div class="nsw_tools_bar f_cb">
            <ul class="nsw_check_btns f_fl">
                <li class="f_ml20">
                    <span class="sele_all"><input type="radio" class="dn"><em class="e_word"></em>全选</span>|
                    <span class="sele_inverse">反选</span>
                </li>
                <li class="f_ml20">
                    <a onclick="return BatchOperation();" id="lnkBtnDel" href="javascript:__doPostBack('lnkBtnDel','')"><span>删除</span></a>|<span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>
                </li>
            </ul>
            <div class="batch_act f_fl f_ml20">
                <span class="c_act">其他操作<i class="tri_up f_fr"></i></span>
                <ul class="batch_dropup column">
                    <li><a onclick="return BatchOperation('确定禁用选中项（共{count}项）？');" href="javascript:__doPostBack('ctl05','')">批量隐藏</a></li>
                    <li><a onclick="return BatchOperation('确定推荐选中项（共{count}项）？');" href="javascript:__doPostBack('ctl06','')">批量推荐</a></li>
                    <li><a onclick="return BatchOperation('确定禁用选中项（共{count}项）推荐？');" href="javascript:__doPostBack('ctl07','')">批量取消推荐</a></li>
                    <li><a onclick="return BatchOperation('确定置顶选中项（共{count}项）？');" href="javascript:__doPostBack('ctl08','')">批量置顶</a></li>
                    <li><a onclick="return BatchOperation('确定禁用选中项（共{count}项）置顶？');" href="javascript:__doPostBack('ctl09','')">批量取消置顶</a></li>
                    <li><a onclick="return BatchOperation('确定精华选中项（共{count}项）？');" href="javascript:__doPostBack('ctl10','')">批量精华</a></li>
                    <li><a onclick="return BatchOperation('确定禁用选中项（共{count}项）精华？');" href="javascript:__doPostBack('ctl11','')">批量取消精华</a></li>
                    <li class="popUp" data-src="{&quot;popup&quot;:&quot;BatchAddColumnPopUp&quot;,&quot;action&quot;:&quot;BatchAddColumn&quot;,&quot;title&quot;:&quot;批量添加分类&quot;,&quot;type&quot;:&quot;productcolumn&quot;}">批量添加分类</li>
                    <li class="popUp" data-src="{&quot;popup&quot;:&quot;ListImportedColumnAttribute&quot;,&quot;type&quot;:&quot;product&quot;}">批量导入属性</li>
                    <li onclick="edit(event,null,'products.aspx')">返回列表</li></ul>
            </div>
            <div class="nsw_pagination f_fr f_mr20 f_cb">
                <!--IndexNavigator Start
Developed by: Oran(LikeCode####gmail.com)
Version:v0.5(Apr. 19, 2015)--><span class="p_numb f_fl">共79条&nbsp;|&nbsp;第1/4页</span><select class="pageList_btn" onchange="var pageFile='product_column.aspx?rc=79&amp;';var trgIdx=this.value;pageFile+='page='+trgIdx;location=pageFile;"><option value="1" selected="selected">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option></select><div class="pageDown_btn f_fr"><span class="p_prev  disable " title="上一页"></span><a href="product_column.aspx?rc=79&amp;page=2"><span class="p_next " datahref="product_column.aspx?rc=79&amp;page=2" title="下一页"></span></a></div><!--IndexNavigator End-->
            </div>
        </div>
        <!-- 列表分页 结束 -->

        <script type="text/javascript">IsPostBack = false;</script></form>
</div>

</body>
</@html>