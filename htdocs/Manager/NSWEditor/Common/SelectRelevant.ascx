<%@ control language="C#" autoeventwireup="true" inherits="ManagerUserControl.SelectRelevant, qwt" enableviewstate="false" %>
<div class="<%=CssName %>">
	<label class="add_label f_fl"><span class="f_pdl15"><%=ColumnName %></span></label>
	<div class="add_r f_fl">
		<div class="f_cb add_sv">
			<span class="clear_bd f_fl cho_album f_mr20">
                <asp:DropDownList runat="server" CssClass="pass_faq selectColumn" ID="ddlSelectColumn"></asp:DropDownList>
				<i class="revise_sub"></i>
			</span>
			<div class="search_so f_fl">
				<input class="so_text f_fl clear_word" type="text" value="" placeholder="请输入关键字" />
				<input class="so_btn f_csp f_fl" type="button" />
			</div>
		</div>
		<div class="f_cb f_mt30">
			<dl class="sv_checkbox f_fl">
				<dt>请选择关联<%=MColumnName %></dt>
				<dd>
                    <select multiple="multiple" class="right_select" size="5"></select>
                </dd>
			</dl>
			<div class="sv_check_btn f_fl">
                <span class="sv_add">添 加</span>
                <span class="sv_dele">删 除</span>
            </div>
			<dl class="sv_checkbox f_fl">
                <dt class="pr"><%if(SelectRelevantSort){ %><a href="###" class="pro_up"></a><a href="###" class="pro_down"></a><%} %>已选择<%=MColumnName %></dt>
				<dd>
                    <asp:DropDownList runat="server" ID="dllSelect" multiple="multiple" class="left_select"></asp:DropDownList>
                    <asp:HiddenField runat="server" ID="hdSelect" />
                </dd>
			</dl>
		</div>
	</div>
</div>
<script type="text/javascript">
    $(function () {
        Timeout(function () {
            loadJs("js/other/selectRelevant.js", function () {
                var id = "<%=hdSelect.ClientID %>";
                var me = $("#" + id);
                new RelevantDetailed(me);
            });
        });
    });
</script>