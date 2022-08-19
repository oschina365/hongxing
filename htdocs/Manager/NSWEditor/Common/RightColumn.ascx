<%@ control language="C#" autoeventwireup="true" inherits="ManagerUserControl.RightColumn, qwt" enableviewstate="false" %>
<div class="bd_side" id="webChannel">
	<h2 class="channel_tit f_fw"><%=ColumnTitle %></h2>
	<ul class="channel_list f_cb">
        <asp:Repeater runat="server" ID="rpt"><ItemTemplate>
		<li oid=<%#Eval("ID") %> pid="<%#GetEval(Container,"ParentID")%>"> 
			<input class="channel_wz f_fl" value="<%#Eval("Title") %>" />
			<span class="channel_tits f_fl"><%#Eval("ReName")%></span>
			<span class="channel_num f_fl"><%#GetPostSum(Container,"(<em class=\"this_nums\">{0}</em>)") %></span>
			<i class="channel_icn1"></i>
            <%if (IsDel){ %><i class="channel_icn2"></i><%}%>
			<i class="channel_icn3">保存</i>
		</li>
        </ItemTemplate></asp:Repeater>
	</ul>
    <%if (IsShowAdd)
      { %>
	<div class="f_mt10 div_warp">
		<input type="text" class="com_input bor1 clear_word f_mb10" value="" />
		<span class="add_chel"><i></i>添加</span>
	</div>
    <%} %>
</div>
<script type="text/javascript">
    var IsDel = <%= IsDel.ToString().ToLower() %>;
    var IsShrink = <%= IsShrink.ToString().ToLower() %>;
    var EditSort = "<%= EditSort.ToString() %>";
</script>
<script type="text/javascript" src="js/other/rightcolumn.js"></script>