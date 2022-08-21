<%@ page language="C#" autoeventwireup="True" enableeventvalidation="false" enableviewstate="true" maintainscrollpositiononpostback="true" inherits="NSW.Web.Manager.projects_edit, qwt" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %>（<%= OID > 0 ? "Object ID: " + OID : "新建对象" %>）</title>
    <link href="skins/base/products.css" rel="stylesheet" type="text/css"/>
<!-- hongxin.com.cn/Mobile Baidu tongji analytics -->
<script>
var _hmt = _hmt || [];
(function() {
var hm = document.createElement("script");
hm.src = "https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d";
var s = document.getElementsByTagName("script")[0];
s.parentNode.insertBefore(hm, s);
})();
</script>
</head>
<body>
<CurrentPosition:CurrentPosition runat="server" ID="currentPosition"/>
<div class="col_main">
	<div class="add_tile_tab f_cb">
		<ul class="f_cb addtab_ul j_recordCon f_fl">
			<li class="active li1"><span class="sp"><em class="zline1"></em><em class="zline2"></em><i class="red_point">*</i>方案基本信息</span></li>
			<li><span class="sp"><em class="zline1"></em><em class="zline2"></em>SEO搜索引擎设置</span></li>
			<li><span class="sp"><em class="zline1"></em><em class="zline2"></em>其他信息（非必填项）</span></li>
			<li class="li6"><span class="sp"><em class="zline1"></em><em class="zline2"></em>相关产品及资讯</span></li>
		</ul>						
	</div>
    <form id="form1" runat="server" onsubmit="saveAllContent();">
	    <div class="add_cont pad300 j_recordCon_c f_cb">
	        <!-- 方案基本信息 -->
            <div class="cont1">
				<div class="f_cb">
					<label class="add_label f_fl"><i class="red_point">*</i>方案标题</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords CreatePY" data-src='{"pyid":"txtFileName","type":"project"}' MaxLength="64" ID="txtTitle" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
                            <div class="msg_btn f_fl f_csp">添加短标题</div>
                            <div class="msg_content f_dn pt44 f_fl"><span class="pd010 f_lht27 f_fl">短标题名称</span>
                            <asp:TextBox CssClass="com_input clear_word e_input pt32 f_fl EnterWords" MaxLength="15" ID="txtShortTitle" runat="server"></asp:TextBox>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em></div>	
						</div>			
					</div>
				</div>
				<div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">所属主要分类</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd s_selt f_fl pt43 f_mr15">
                                <asp:DropDownList ID="ddlColumnsSource" CssClass="pass_faq" runat="server" onchange="$('#hdnSelectedColumn').val($(this).val());$('#btnColumn').click();"></asp:DropDownList>
                                <asp:HiddenField runat="server" ID="hdnSelectedColumn" />
                                <asp:Button runat="server" OnClick="ddlColumns_SelectedIndexChanged" ID="btnColumn"  CssClass="dn" CausesValidation="false" />
								<i class="revise_sub"></i>
							</span>
							<%--<div class="add_sort_btn f_fl f_csp">展开关联分类</div>--%>
						</div>		
					</div>
				</div>

                <div class="RelevantColumn">
                    <RelevantColumn:RelevantColumn ID="RelevantColumn" runat="server" CssName="mt40" ColumnTypes="Project" ColumnName="相关分类" MColumnName="请选择方案分类"/>
                </div>
                <script type="text/javascript">
                    $(function () {
                        $(".add_sort_btn").click(function () {
                            if ($("div.RelevantColumn").is(":hidden")) {
                                $("div.RelevantColumn").slideDown(function () {
                                    window.top.SetHeight();
                                });
                                $(this).addClass("add_sort_btno")
                            } else {
                                $("div.RelevantColumn").slideUp(function () {
                                    window.top.SetHeight();
                                });
                                $(this).removeClass("add_sort_btno")
                            }
                        });
                    })
                </script>
				<!-- 默认属性 -->
                <div class="f_cb f_mt25" runat="server" id="labAttr">
                    <label class="add_label f_fl"><span class="f_pdl15">预设属性</span></label>
                    <div class="add_r f_fl">
                        <asp:Label ID="projectAttr" runat="server"></asp:Label>
                    </div>
				</div>

                <div class="f_cb f_mt25 dn">
                    <label class="add_label f_fl"><span class="f_pdl15">缩略图名称</span></label>
                    <div class="add_r f_fl">
                        <asp:TextBox runat="server" ID="txtPhotoName" CssClass="com_input clear_word EnterWords"/>
                    </div>
                </div>


                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">缩略图</span></label>
                    <div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <div class="f_fl f_csp upload_img Upload_Clik" input="hdThumbnail" id="ThumbnailUpload" directory="Product"><span><em class="load_small"></em>点击上传</span></div>
                            <asp:HiddenField runat="server" ID="hdThumbnail" />
                        </div>
                        <i class="i_shortdesc"></i>
					</div>
                </div>

				<div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">外部链接</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv f_lht27">
                           <radio_control:radio_control runat="server" ID="radioUrlNo" Checked="true" CssName="f_fl f_db e_radio e_radio2" onclick="initTabCut(0);$('#url_warp').hide().find('input').val('');" Text="不存在" />
					        <radio_control:radio_control runat="server" ID="radioUrlYes" CssName="f_fl f_db e_radio e_radio2" Text="存在" onclick="initTabCut(1);$('#url_warp').show()" />
                            <span class="clear_bd f_fl p_inp1" id="url_warp"><asp:TextBox ID="txtUrl" validtype="url_" tipPosition="top" runat="server" CssClass="com_input clear_word" MaxLength="64"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>
				<div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">关联标签</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="100" ID="txtTag" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em><div class="selt_mark_btn f_fl f_csp popUp" data-src='{"popup":"SelectTagPopUp","input":"txtTag"}'>选择标签</div>	
						</div>		
					</div>
				</div>
                <!--缩略图大图-->
				<ThumbnailImage:ThumbnailImage runat="server" ID="ThumbnailImage" />		
				<div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">方案简介录入</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_typeset bord_gray">
                            <asp:TextBox CssClass="text_area tx1" MaxLength="500" ID="txtShortDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
							<div class="add_short_tit add_typeset_tit f_cb"><span class="f_fl f_underline">自动排版</span></div>		
						</div>		
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">页面模板选择</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <iframe src="nvtemps.aspx?page=detailedpagetemps&type=project" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="nvtemps" name="nvtemps"></iframe>
                            <asp:HiddenField ID="hdprojectdiretorie" Value="project01" runat="server" />
                            <asp:HiddenField ID="hdmobileprojectdiretorie" runat="server" />
						</div>
					</div>
				</div>
				<div class="f_cb f_mt25">
					<label class="add_label f_fl">
                        <span class="f_pdl15">详情内容录入</span>
                        <% if (NSW.Mobile.MobileConfig.MEnableMobile == "true"){ %>
                        <br />
                        <div class="nsw_check_box">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="isTongbu" CssClass="dn" />
                            </span>
                            <label class="ck_text">PC内容是否同步到手机</label>
                        </div>
                        <%} %>
                    </label>
					<div class="add_r f_fl">
						<div class="f_cb add_typeset bord_gray extend_warp" style="width:98%;">
							<div class="add_short_tit f_cb">
								<ul class="type_marklist f_fl f_cb" id="addTags">
                                    <li onclick="SetContentToInput(this)" class="cur">详细信息<i></i><asp:HiddenField ID="hdContent" runat="server"/></li>
                                    <asp:Repeater runat="server" ID="rpDetailExtend" OnItemDataBound="rpDetailExtend_ItemDataBound" EnableViewState="true"><ItemTemplate>
									<li onclick="SetContentToInput(this)" title="<%#Eval("Title") %>"><%#Eval("Title") %><em class="mark_dele" onclick="delContent(this)"></em><i></i><asp:HiddenField ID="hdExtendTag" runat="server" /></li>
                                    </ItemTemplate></asp:Repeater>
								</ul>
                                <asp:HiddenField runat="server" ID="hdAllContent" />
                                <asp:HiddenField runat="server" ID="hdSeparate" />
                                <asp:HiddenField runat="server" ID="hdAllTitle" />
								<span class="add_mark_btn f_csp f_fr popUp" data-src='{"popup":"addTag","input":"#addTags"}'>添加标签</span>
							</div>
							<NSW:UEditor runat="server" ID="txtContent"  Directory="Project"/>
							<div class="add_short_tit add_typeset_tit f_cb"><span class="f_fl f_underline f_underline_content">自动排版</span></div>	
						</div>
					</div>
				</div>
			</div>
            <!-- 方案基本信息 end-->

            <!--SEO-->
			<div class="cont1 seo_settab f_dn">
                <div class="f_cb">
					<label class="add_label f_fl"><i class="red_point">*</i>静态页名称</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="64" ID="txtFileName" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
                            <asp:HiddenField runat="server" ID="hidFileName" />
                            <div class="msg_btn f_fl f_csp GetPY">手动更新</div>
						</div>			
					</div>
				</div>
                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页核心关键字</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="64" ID="txtTitleKeyword" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
						</div>		
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页标题<br /><span>(Title)</span></span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="64" ID="txtPageTitle" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
                            <a href="http://www.nsw88.com/Article/chanpinluruseoxiangg_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange f_lht27">不知道怎么填写？</a>
						</div>		
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页关键词<br /><span>(Keywords)</span></span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="100" ID="txtMetaKeyword" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
                            <a href="http://www.nsw88.com/Article/chanpinseoxiangguan-_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange f_lht27">不知道怎么填写？</a>
						</div>		
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页描述<br /><span>(Description)</span></span></label>
					<div class="add_r f_fl">
                        <div class="f_cb seo_area">
                            <asp:TextBox CssClass="seo_descript EnterWords_Decreasing" MaxLength="250" _maxlength="250" ID="txtMetaDescription" runat="server" TextMode="MultiLine" temp="你还可以输<span class='color_orange'>{surplus_length}</span>个字符"></asp:TextBox>
							<div class="f_cb f_mt5 f_lht27 f_tar"><span class="inp_tips_gray f_ib"></span></div>
						</div>
                        <div class="f_cb f_mt5 f_lht27"><div class="f_fl f_mr10 f_ib_"></div><a href="http://www.nsw88.com/Article/chanpinluruSEOxiangg2_1.html" target="_blank" class="f_fl f_ml10 f_ib f_underline color_orange f_mr20">不知道怎么填写？</a></div>
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">启用站内互链</span></label>
					<div class="add_r f_fl">
                        <div class="nsw_check_box">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="cbxKeywordContain" CssClass="dn" onclick="if(this.checked){$('#KeywordSet').show();}else{$('#KeywordSet').hide();}" />
                            </span>
                            <label class="ck_text">启用</label>
                        </div>
					</div>
				</div>
                <div class="f_cb f_mt25 dn" id="KeywordSet">
					<label class="add_label f_fl"><span class="f_pdl15">站内互链设置</span></label>
					<div class="add_r f_fl">
                        <span class="f_lht27 f_fl">关键词重复次数：</span>
                        <span class="clear_bd s_selt f_fl pt43 f_mr15" style="width:50px;">
                            <asp:DropDownList runat="server" ID="dropKeywordRepeat" Width="60px" CssClass="pass_faq">
                                <asp:ListItem Text="1次" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="2次" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3次" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4次" Value="4"></asp:ListItem>
                                <asp:ListItem Text="5次" Value="5"></asp:ListItem>
                                <asp:ListItem Text="6次" Value="6"></asp:ListItem>
                            </asp:DropDownList>
                            <i class="revise_sub"></i>
                        </span>
                        <span class="f_lht27 f_fl">最多允许替换：</span>
                        <span class="clear_bd s_selt f_fl pt43 f_mr15" style="width:50px;">
                            <asp:DropDownList runat="server" ID="dropKeywordMax" Width="60px" CssClass="pass_faq">
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                            </asp:DropDownList>
                            <i class="revise_sub"></i>
                        </span>
					</div>
				</div>
            </div>
            <!--SEO  end-->

            <!--其他信息-->
			<div class="cont1 f_dn">
                <div class="f_cb">
					<label class="add_label f_fl"><span class="f_pdl15">Banner广告图</span></label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <div class="f_fl f_csp upload_img Upload_Clik" input="hdBannerPath" id="BannerPathUpload" directory="others"><span><em class="load_small"></em>点击上传</span></div>
                            <asp:HiddenField runat="server" ID="hdBannerPath" />	
                            <div class="nsw_check_box w80" style="vertical-align:top;margin:12px 0 0 10px;">
                                <span class="ck_box mt5">
                                    <asp:CheckBox runat="server" ID="chkIsFullScreen" CssClass="dn" />
                                </span>
                                <label class="ck_text">全屏显示</label>
                            </div>	
						</div>
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">广告链接地址</span></label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <div class="f_cb add_sv">
					            <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtBannerURL" validtype="url_" tipPosition="top" runat="server" CssClass="com_input clear_word EnterWords" MaxLength="100"></asp:TextBox><i class="clear_x"></i></span>
				            </div>	
						</div>
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">广告ALT</span></label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <div class="f_cb add_sv">
					            <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtBannerAlt" runat="server" CssClass="com_input clear_word EnterWords" MaxLength="100"></asp:TextBox><i class="clear_x"></i></span>
				            </div>	
						</div>
					</div>
				</div>
                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl"><span class="f_pdl15">启用第三方商城</span></label>
					<div class="add_r f_fl">
						<div class="nsw_check_box w80">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="CheckBox2" CssClass="dn" onclick="if(this.checked){$('#div_url').css('display','inline-block');}else{$('#div_url').hide();}" />
                            </span>
                            <label class="ck_text">启用</label>
                        </div>
                        <div class="nsw_check_box dn" style="line-height:25px;vertical-align:top;width:60%;" id="div_url">
                            <span class="f_pdl15">启用第三方商城</span>
                            <span class="clear_bd p_inp1 ml10"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="100" ID="txtUrl1" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                        </div>
					</div>
				</div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">点击次数</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox CssClass="com_input clear_word onlyNumber" MaxLength="6" ID="txtHits" validtype="number" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="pd010 f_lht27 f_fl">次</em>
						</div>			
					</div>
                </div>
                <div class="f_cb f_mt25 <%=NSW.Admin.Tools.AdminTools.EnableUsersClass %>">
                    <label class="add_label f_fl"><span class="f_pdl15">查看权限</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <div class="set_cbs">
                                <asp:CheckBoxList runat="server" ID="cblAuthority" RepeatDirection="Horizontal" RepeatLayout="Flow" />
                            </div>
						</div>			
					</div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">排序</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <span class="clear_bd s_selt f_fl pt43 f_mr15" style=" width:50px;">
                                <asp:DropDownList runat="server" CssClass="pass_faq" Width="50" ID="ddlRanking"></asp:DropDownList>
                                <i class="revise_sub"></i>
                            </span>
						</div>			
					</div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">方案推荐星级</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <span class="clear_bd s_selt f_fl pt43 f_mr15" style="width:80px;">
                                <asp:DropDownList runat="server" CssClass="pass_faq" ID="ddlStar" Width="80px">
                                    <asp:ListItem Text="1星级" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2星级" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3星级" Value="3" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="4星级" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5星级" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                                <i class="revise_sub"></i>
                            </span>
						</div>			
					</div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">选项</span></label>
					<div class="add_r f_fl">
                        <div class="nsw_check_box w80">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="chkIsDelay" CssClass="dn" />
                            </span>
                            <label class="ck_text">首页</label>
                        </div>	
						<div class="nsw_check_box w80">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="chkIsCommend" CssClass="dn" />
                            </span>
                            <label class="ck_text">推荐</label>
                        </div>	
                        <div class="nsw_check_box w80">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="chkIsBest" CssClass="dn" />
                            </span>
                            <label class="ck_text">精华</label>
                        </div>	
                        <div class="nsw_check_box w80">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="chkIsTop" CssClass="dn" />
                            </span>
                            <label class="ck_text">置顶</label>
                        </div>
					</div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">显示当前栏目</span></label>
					<div class="add_r f_fl">
                        <div>
                            <radio_control:radio_control Text="显示" GroupName="Enable" ID="rdoEnableYes" runat="server" Checked="true" />
                            <radio_control:radio_control Text="隐藏" GroupName="Enable" ID="rdoEnableNo" runat="server" />
                        </div>
					</div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">显示时间</span></label>
					<div class="add_r f_fl">
                        <div class="f_cb controls_calendar">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtShowTime" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						</div>			
					</div>
                </div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">录入时间</span></label>
					<div class="add_r f_fl">
                        <div class="f_cb controls_calendar">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtInputTime" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						</div>		
					</div>
                </div>

            </div>
            <!--其他信息 end-->

			<!-- 相关方案及资讯 -->
			<div class="cont1 f_dn">
                <SelectRelevant:SelectRelevant ID="RelevantProjects" runat="server" ColumnTypes="Product" ColumnName="关联产品" MColumnName="产品"/>
                <SelectRelevant:SelectRelevant ID="RelevantNews" runat="server" ColumnTypes="News" CssName="f_cb mt40" ColumnName="关联资讯" MColumnName="资讯"/>
			</div>
            <!-- 关联方案或服务  end-->
            <!--按钮-->
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15"></span></label>
                <div class="add_r f_fl">
                    <!-- 保存并返回 -->
			        <div class="view_btn f_mt30">
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="btnSave" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                        <span class="e_btn1 f_ml35 f_csp fl" runat="server" id="btnDel"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="del" runat="server" Text="删 除" onclick="btnSubmit_Click" /></span>
                    </div>
                </div>
            </div>
		</div>
    </form>
</div>
</body>
</html>
