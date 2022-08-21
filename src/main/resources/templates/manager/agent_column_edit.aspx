<%@ page language="C#" autoeventwireup="True" enableeventvalidation="false" inherits="NSW.Web.Manager.agent_column_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %>（<%= OID > 0 ? "Object ID: " + OID : "新建对象" %>）</title>
    <link href="skins/base/news.css" rel="stylesheet" type="text/css"/>
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
		    <ul class="f_cb addtab_ul addtab_ul_column j_recordCon f_fl">
			    <li class="active li1"><span class="sp"><em class="zline1"></em><em class="zline2"></em><i class="red_point">*</i>分类基本属性</span></li>
			    <li><span class="sp"><em class="zline1"></em><em class="zline2"></em>SEO搜索引擎</span></li>
			    <li><span class="sp"><em class="zline1"></em><em class="zline2"></em>其他属性</span></li>
                <li class="li6"><span class="sp"><em class="zline1"></em><em class="zline2"></em>内页模板管理</span></li>
		    </ul>						
	    </div>
    </div>
    <form id="form2" runat="server" onsubmit="top.refreshList=true;">
        <div class="add_cont pad300 j_recordCon_c f_cb">
	        <!-- 分类基本属性 -->
	        <div class="cont1">
		        <div class="f_cb">
			        <label class="add_label f_fl"><i class="red_point">*</i>上级分类</label>
			        <div class="add_r f_fl">
				        <div class="f_cb add_sv">
					        <span class="clear_bd s_selt f_fl pt43 f_mr15">
                                <asp:DropDownList ID="ddlMenus" CssClass="pass_faq" runat="server"></asp:DropDownList>
						        <i class="revise_sub"></i>
					        </span>
				        </div>			
			        </div>
		        </div>
		        <div class="f_cb f_mt25">
			        <label class="add_label f_fl"><i class="red_point">*</i>分类名称</label>
			        <div class="add_r f_fl">
				        <div class="f_cb add_sv">
					        <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word EnterWords CreatePY" data-src='{"pyid":"txtFileName","type":"agentcolumn"}' MaxLength="64"></asp:TextBox><i class="clear_x"></i></span><em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>			
				        </div>				
			        </div>
		        </div>
                <div class="f_cb f_mt25">
			        <label class="add_label f_fl"><i class="red_point">*</i>栏目名称</label>
			        <div class="add_r f_fl">
				        <div class="f_cb add_sv">
					        <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtFileName" runat="server" CssClass="com_input clear_word EnterWords" MaxLength="64"></asp:TextBox><i class="clear_x"></i></span><em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>			
                            <asp:HiddenField runat="server" ID="hidFileName" />
                            <div class="msg_btn f_fl f_csp GetPY">手动更新</div>
				        </div>				
			        </div>
		        </div>
                <div class="f_cb f_mt25">
			        <label class="add_label f_fl"><i class="red_point">*</i>静态页目录</label>
			        <div class="add_r f_fl">
				        <div class="f_cb add_sv">
					        <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtDirectory" runat="server" CssClass="com_input clear_word EnterWords" MaxLength="64"></asp:TextBox><i class="clear_x"></i></span><em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>			
				        </div>				
			        </div>
		        </div>
		        <div class="f_cb f_mt25">
			        <label class="add_label f_fl"><span class="f_pdl15">外部链接</span></label>
			        <div class="add_r f_fl">
				        <div class="f_cb add_sv f_lht27">
                            <radio_control:radio_control runat="server" ID="rurlNo" Checked="true" CssName="f_fl f_db e_radio e_radio2" onclick="initTabCut(0);$('#url_warp').hide().find('input').val('');" Text="不存在" />
					        <radio_control:radio_control runat="server" ID="rurlYes" CssName="f_fl f_db e_radio e_radio2" Text="存在" onclick="initTabCut(1);$('#url_warp').show()" />
                            <span class="clear_bd f_fl p_inp1" id="url_warp"><asp:TextBox ID="txtURL" validtype="url_" tipPosition="top" runat="server" CssClass="com_input clear_word" MaxLength="64"></asp:TextBox><i class="clear_x"></i></span>
				        </div>
			        </div>
		        </div>
		        <div class="f_cb f_mt25">
			        <label class="add_label f_fl"><span class="f_pdl15">关联标签</span></label>
			        <div class="add_r f_fl">
				        <div class="f_cb add_sv">
					        <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtDefaultTag" runat="server" CssClass="com_input clear_word EnterWords" MaxLength="100"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em><div class="selt_mark_btn f_fl f_csp popUp" data-src='{"popup":"SelectTagPopUp","input":"txtDefaultTag"}'>选择标签</div>			
				        </div>			
			        </div>
		        </div>

                <div class="f_cb f_mt25 dn" id="PictureSizeTips">
			        <label class="add_label f_fl"><span class="f_pdl15">图片规格大小</span></label>
			        <div class="add_r f_fl">
				        <div class="f_cb add_sv">
					        <span class="clear_bd f_fl p_inp1" style="width:50px;"><asp:TextBox validtype="number" ID="txtWidth" Text="20" runat="server" CssClass="com_input clear_word" MaxLength="3" Width="50"></asp:TextBox><i class="clear_x"></i></span>
                            <span class="f_fl lh27 ml10">X</span>
                            <span class="clear_bd f_fl p_inp1 ml10" style="width:50px;"><asp:TextBox validtype="number" ID="txtHeight" Text="20" runat="server" CssClass="com_input clear_word" MaxLength="3" Width="50"></asp:TextBox><i class="clear_x"></i></span>
				        </div>
                        <i class="i_shortdesc"><%=NSW.OConfig2.SMTP.GetConfig("PictureSizeTips")%></i>		
			        </div>
		        </div>

                <div class="f_cb f_mt25">
			        <label class="add_label f_fl"><span class="f_pdl15">显示类型</span></label>
			        <div class="add_r f_fl">
				        <div class="f_cb add_sv">
                            
                            <span class="clear_bd s_selt f_fl pt43 f_mr15" style=" width:120px;">
                                <asp:DropDownList ID="ShowTypes" CssClass="pass_faq" runat="server" Width="120">
                                    <asp:ListItem Text="仅标题" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="标题+摘要" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="标题+缩略图" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="标题+缩略图+简介" Value="4"></asp:ListItem>
                                </asp:DropDownList>
                                <i class="revise_sub"></i>
					        </span>

                            <div class="nsw_check_box" style="vertical-align:top;margin:4px 0 0 10px; width:110px;">
                                <span class="ck_box mt5" id="ShowIntroductionSpan">
                                    <asp:CheckBox runat="server" ID="IsShowIntroduction" onclick="if($(this).attr('checked')){$('#ShowDetailSpan').removeClass('z_select').find('input').attr('checked',false);}" CssClass="dn" />
                                </span>
                                <label class="ck_text">显示该简介</label>
                            </div>

                            <div class="nsw_check_box" style="vertical-align:top;margin:4px 0 0 10px; width:110px;">
                                <span class="ck_box mt5" id="ShowDetailSpan">
                                    <asp:CheckBox runat="server" ID="IsShowDetail" onclick="if($(this).attr('checked')){$('#ShowIntroductionSpan').removeClass('z_select').find('input').attr('checked',false);}" CssClass="dn" />
                                </span>
                                <label class="ck_text">显示文章内容</label>
                            </div>

                            <span class="clear_bd s_selt f_mr15" style=" width:120px;">
                                <asp:DropDownList ID="ddlList" CssClass="pass_faq" runat="server" Width="120">
                                    <asp:ListItem Text="暂无数据" Value=""></asp:ListItem>
                                </asp:DropDownList>
                                <i class="revise_sub"></i>
					        </span>

				        </div>
			        </div>
		        </div>
		        <div class="f_cb f_mt25">
			        <label class="add_label f_fl"><span class="f_pdl15">分类描述</span></label>
			        <div class="add_r f_fl">
				        <div class="f_cb add_editor ">
                            <NSW:UEditor runat="server" ID="txtShortDesc" Height="200" Directory="Agent" />
				        </div>			
			        </div>
		        </div>
							
		        <div class="f_cb f_mt25">
			        <label class="add_label f_fl"><span class="f_pdl15 f_ldb f_lht18">前台列表头<br />部显示描述</span></label>
			        <div class="add_r f_fl">
				        <radio_control:radio_control runat="server" ID="rIsShowDescYes" CssName="f_fl f_db e_radio e_radio2" Text="显示" />
					    <radio_control:radio_control runat="server" ID="rIsShowDescNo" Checked="true" CssName="f_fl f_db e_radio e_radio2" Text="隐藏" />
			        </div>
		        </div>
	        </div>
		    <!-- 分类基本属性 end-->
            
            <!--SEO-->	
		    <div class="cont1 seo_settab f_dn">
                <div class="f_cb dn">
					<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页核心关键字</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="64" ID="txtTitleKeyword" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
						</div>		
					</div>
				</div>
                <div class="f_cb">
					<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页标题<br /><span>(Title)</span></span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="64" ID="txtPageTitle" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
                            <a href="http://www.nsw88.com/Article/chanpinfenlei-title(_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange f_lht27">不知道怎么填写？</a>
						</div>		
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页关键词<br /><span>(Keywords)</span></span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="100" ID="txtMetaKeyword" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
                            <a href="http://www.nsw88.com/Article/chanpinfenlei-Keywor_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange f_lht27">不知道怎么填写？</a>
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
                        <div class="f_cb f_mt5 f_lht27"><div class="f_fl f_mr10 f_ib_"></div><a href="http://www.nsw88.com/Article/chanpinfenlei-descri_1.html" target="_blank" class="f_fl f_ml10 f_ib f_underline color_orange f_mr20">不知道怎么填写？</a></div>
					</div>
				</div>
            </div>
            <!--SEO END-->

            <!--其他属性-->
		    <div class="cont1 f_dn">
                <div class="f_cb">
					<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">分类小图标</span></label>
					<div class="add_r f_fl">
						<div class="f_cb">
							<div class="colum_onload f_csp f_fl Upload_Clik"  id="icoUpload" input="hdIco" directory="Agent"><i class="colum_icon"></i><p class="f_tac f_lht27">点击上传</p></div>
                            <asp:HiddenField runat="server" ID="hdIco" />	
						</div>
					</div>
				</div>
				<div class="f_cb f_mt25">
					<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">分类缩略图</span></label>
					<div class="add_r f_fl">
						<div class="f_cb">
							<div class="colum_onload f_csp f_fl Upload_Clik" id="photoPathUpload" input="hdPhotopath" directory="Agent"><i class="colum_icon"></i><p class="f_tac f_lht27">点击上传</p></div>
                            <asp:HiddenField runat="server" ID="hdPhotopath" />	
						</div>
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">Banner广告图</span></label>
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
					<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">广告链接地址</span></label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <div class="f_cb add_sv">
					            <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtBannerURL" validtype="url_" tipPosition="top" runat="server" CssClass="com_input clear_word EnterWords" MaxLength="100"></asp:TextBox><i class="clear_x"></i></span>
				            </div>	
						</div>
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">广告ALT</span></label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <div class="f_cb add_sv">
					            <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtBannerAlt" runat="server" CssClass="com_input clear_word EnterWords" MaxLength="100"></asp:TextBox><i class="clear_x"></i></span>
				            </div>	
						</div>
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">列表页显示条数</span></label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <div class="f_cb add_sv">
					            <span class="clear_bd f_fl p_inp1" style=" width:50px;"><asp:TextBox validtype="number" ID="txtPageSize" Text="20" runat="server" CssClass="com_input clear_word EnterWords onlyNumber" MaxLength="3" Width="50"></asp:TextBox><i class="clear_x"></i></span>
				            </div>	
						</div>
					</div>
				</div>
                <div class="f_cb f_mt25 <%=NSW.Admin.Tools.AdminTools.EnableUsersClass %>">
                    <label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">查看权限</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <div class="set_cbs">
                                <asp:CheckBoxList runat="server" ID="cblAuthority" RepeatDirection="Horizontal" RepeatLayout="Flow" />
                            </div>
						</div>			
					</div>
                </div>
                <div class="f_cb f_mt25">
                    <label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">排序</span></label>
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
					<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">选项</span></label>
					<div class="add_r f_fl">
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
					<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">显示当前栏目</span></label>
					<div class="add_r f_fl">
						<radio_control:radio_control Text="显示" GroupName="Enable" ID="rdoEnableYes" runat="server" Checked="true" />
                        <radio_control:radio_control Text="隐藏" GroupName="Enable" ID="rdoEnableNo" runat="server" />
					</div>
				</div>

				<div class="f_cb f_mt25">
					<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">显示类型</span></label>
					<div class="add_r f_fl">
						<radio_control:radio_control Text="全部" GroupName="ModelType" ID="rdoModelTypeYes" runat="server" Checked="true" />
                        <radio_control:radio_control Text="仅PC端" GroupName="ModelType" ID="rdoModelTypeNo" runat="server" />
					</div>
				</div>

                <div class="f_cb f_mt25">
                    <label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">录入时间</span></label>
					<div class="add_r f_fl">
						<div class="f_cb controls_calendar">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtInputTime" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						</div>
					</div>
                </div>
            </div>
            <!--其他属性 end-->

            <!--内页模版-->
            <div class="cont1 inpage_box f_dn">
                <div class="model_side model_list_normal ">
					<div class="model_tit"><span class="model_type f_fl"><i></i>模板选择</span></div>
					<div class="model_box">
                        <iframe src="nvtemps.aspx?type=agent&page=nvtemps" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="nvtemps" name="nvtemps"></iframe>
					</div>
                    <asp:HiddenField runat="server" ID="hdagentdiretorie" Value="agent01" />
                    <asp:HiddenField runat="server" ID="hdmobileagentdiretorie" />
				</div>

                <div class="model_side model_list_normal f_mt30">
					<div class="model_tit"><span class="model_type f_fl"><i></i>详细页模板选择</span></div>
					<div class="model_box">
                        <iframe src="nvtemps.aspx?type=agent&page=detailedpagetemps&input=hdDefaultTemplate&defselect=false&cancel=true&columnid=<%=OID %>" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="nvtemps01" name="nvtemps01"></iframe>
					</div>
                    <asp:HiddenField runat="server" ID="hdDefaultTemplate" Value="" />
				</div>

            </div>
            <!--内页模版 end-->

            <!--按钮-->
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15"></span></label>
                <div class="add_r f_fl">
                    <!-- 保存并返回 -->
			        <div class="view_btn f_mt30">
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="btnSave" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);"/></span>
                        <span class="e_btn1 f_ml35 f_csp fl" runat="server" id="btnDel"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="del" runat="server" Text="删 除" onclick="btnSubmit_Click" /></span>
                    </div>
                </div>
            </div>
            <!--按钮 end-->
	    </div>
    </form>
</body>
</html>
