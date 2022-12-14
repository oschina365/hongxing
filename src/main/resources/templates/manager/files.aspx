<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.files, qwt" enableviewstate="false" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title><%= ItemName %></title>
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
<div>
<div class="so_bread">
    <div class="nsw_bread_tit f_cb">
        <SpanCurrentPosition:SpanCurrentPosition ID="cur" runat="server"/>
	    <div class="advanced_so f_fr form_search">
             <span class="clear_bd s_selt f_fl mr10 w140" id="filesColumn">
			    <select class="pass_faq" name="ddlColumnID">
			        <%=NSW.Admin.Tools.AdminTools.FillColumnData("<option value='{sid}' oid='{id}'>{title}</option>", "Files")%>
			    </select>
			    <i class="revise_sub"></i>
		    </span>
            <span class="clear_bd s_selt f_fl mr10 w140">
                <select id="ddlFields" class="pass_faq pl5">
                    <option value="[Title]">标题</option>
                    <option value="[SrcFilename]">原文件名称</option>
                    <option value="[Ext]">后缀</option>
                </select>
                <i class="revise_sub"></i>
            </span>
			<div class="search_so f_fl mr10">
				<input type="text" class="so_text clear_word f_fl" name="kwd" />
				<input type="button" class="so_btn f_csp f_fl" onclick="SearchObjectByGet(this)" />
			</div>
		</div>
    </div>
</div>

<!-- 快速录入 开始 -->
<%if (NVEngine.Tools.NewTools.GetAppWebConfig("BatchAddFilesConfig").Contains("true"))
  { %>
<div class="nsw_add_proclsify f_cb" style="padding-left:2%;">
    <form onsubmit="return false;"><label class="com_name f_fl" style="margin-right:1%;">所属分类</label>
	<span class="clear_bd fast_in f_fl">
		<select class="pass_faq" name="cid">
			<%=NSW.Admin.Tools.AdminTools.FillColumnData("<option value='{id}'>{title}</option>", "Files")%>
		</select>
		<i class="revise_sub"></i>
	</span>
	<label class="com_name f_ml10 f_fl">文件夹相对路径</label>
	<span class="clear_bd th1 f_fl"><input class="com_input clear_word" name="folder" type="text" maxLength="140" _required="true" tips="文件夹相对路径" placeholder="例如：/UploadFiles/QT/"><i class="clear_x"></i></span>
    <span class="e_btn1 f_ml2 f_csp f_fl f_mr5 ajaxSave" data-src='{"action":"BatchAddFiles"}'><i class="save_icon"></i>保 存</span></form>
</div>
<%} %>
<!-- 快速录入 结束 -->

<div class="col_main">
    <form id="Form2" runat="server">
        <!-- 列表区 开始 -->
        <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
            <tr id="tabHeader">
                <th style="width:50px" class="p"><span class="cho"></span></th>
                <th axis="[Title]" style="width:200px">标题</th>
                <th axis="[ColumnID]" style="width:200px">分类</th>
                <th axis="[Ext]" style="width:80px">后缀</th>
                <th axis="[SrcFilename]" style="width:100px">原文件名</th>
<%--                <th axis="[Path]" style="width:50px">路径</th>--%>
                <th axis="[ContentSize]" style="width:80px">大小(byte)</th>
                <th axis="[Revision]" style="width:50px">版本</th>
                <th axis="[InputTime]" style="width:120px">录入时间</th>
                <th style="width:130px">操作</th>
            </tr>
            <asp:Repeater ID="rptMain" runat="server"><ItemTemplate>
            <tr class="child_1">
                <td class="td1">
                    <div class="nsw_check_box">
                        <span class="ck_box">
                            <span class="dn">
                                <input type="checkbox" name="chkItem" value="<%#Eval("ID") %>"/>
                            </span>
                        </span>
                    </div>
                </td>
                <td><span class="editor_warp" data-src='{"action":"alertTitle","editor":"input_editor","type":"files","oid":"<%#Eval("ID") %>"}'><%#Eval("Title") %></span></td>
                <td>
                    <span class="editor_warp alertColumn" data-src='{"action":"alertColumn","editor":"select_editor","source":"#filesColumn","type":"files","value":"<%#Eval("ColumnID") %>","oid":"<%#Eval("id") %>"}'></span>
                </td>
                <td class="tac"><%# Eval("Ext")%></td>
                <td class="tac"><%# Eval("SrcFilename")%></td>
                <td class="tac"><%# Eval("ContentSize") %></td>
                <td class="tac"><%# Eval("Revision")%></td>
                <td><%# ((DateTime)Eval("InputTime")).ToString("yyyy-MM-dd<br />HH:mm:ss") %></td>
                <td>
                    <span class="pro_edit" oid="<%#Eval("ID") %>" src="<%#Eval("Path") %>"><i></i>修改附件</span>
                </td>
            </tr>
            </ItemTemplate></asp:Repeater>
            <tr id="noItemYet" runat="server" visible="false"><td class="noItemYet" style=" text-align:center;" colspan="99">没有任何项目</td></tr>
        </table>
        <!-- 列表分页 开始 -->
        <div class="nsw_tools_bar f_cb">
	        <ul class="nsw_check_btns f_fl">
		        <li class="f_ml20">
                    <span class="sele_all"><input type="radio" class="dn" /><em class="e_word"></em>全选</span>|
                    <span class="sele_inverse">反选</span>
                </li>
		        <li class="f_ml20">
                    <asp:LinkButton ID="LinkDel" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click"><span>删除</span>|</asp:LinkButton>
                    <span class="span_add editor_warp" data-src='{"editor":"AddFiles"}'>添加</span>|<span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>
                </li>
	        </ul>
	        <div class="nsw_pagination f_fr f_mr20 f_cb">
                <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	        </div>
        </div>
        <!-- 列表分页 结束 -->
    </form>	
</div>
<script type="text/javascript">
    $(function () {
        loadJs("js/common/edit.js", function () {
            $(document.body).append("<span id=\"SetUpload_\" />");
            var upload = new _SetUpload({
                buttonID: "SetUpload_",
                action: "SaveFilesHttpPostedFile",
                imgurl: '用于替换修改的附件',
                loadedSuccessfully: function () {
                    var me = this;
                    $("span.pro_edit").hover(function () {
                        var _me = $(this);
                        var _offset = _me.offset();
                        var src = _me.attr("src");
                        if (src) {
                            me.formFileUpload.css({ top: _offset.top, left: _offset.left, width: _me.outerWidth(), height: _me.outerHeight() }).show();
                            me.options.types = src.substr(src.lastIndexOf('.') + 1);
                            me.options.types = me.options.types.lastIndexOf('?') > 0 ? me.options.types.substr(0, me.options.types.lastIndexOf('?')) : me.options.types;
                            me.formFileUpload.find("input[name='ReplaceFile']").val(_me.attr("oid"));
                            me.input = _me;
                        }
                    })
                },
                showImg: function (data) {
                    var me = this;
                    var url = data.url;
                    if (me.input) {
                        $(me.input).attr("src", url + "?" + new Date().getTime());
                    }
                }
            });
        });
    })
</script>
</body></html>