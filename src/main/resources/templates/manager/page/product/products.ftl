<#include "../../common/manage_layout.ftl"/>
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
            </div>
        </div>
    </div>
    <div class="col_main">
        <form name="ctl01" method="post" action="products.aspx" id="ctl01">
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
                <#if products??>
                    <#list products as product>
                        <#if product?? && product.id gt 0>
                            <tr class="child_1">
                    <td class="td1">
                        <div class="nsw_check_box">
								<span class="ck_box">
									<span class="dn">
										<input type="checkbox" name="chkItem" value="${product.id}">
									</span>
								</span>
                        </div>
                    </td>
                    <td>${product.id}</td>
                    <td class="pimgsv">
                            <#if product.thumbnail??>
							<span class="shot_img f_fl">
								<img src="${product.thumbnail}">
							</span>
							</#if>
                        <span class="poducts short_tit f_fl">
								<a href="##" onclick="edit(event,544)" class="update_Title">${product.name}</a>
								<i class="e_edi1 e_more_edit popUp" style="display: none;"></i>
							</span>
                    </td>
                    <td>
							<span>${product.category_name}</span>
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
                        <span>1</span>
                    </td>
                    <td>
							<span>${product.create_time}</span>
                    </td>
                    <td class="nsw_cnt_area action_tx">
                        <a href="/product/${product.id}" title="西昊c300人体工学椅" target="_blank" class="PageURL">
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
                        </#if>
                    </#list>
                </#if>

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