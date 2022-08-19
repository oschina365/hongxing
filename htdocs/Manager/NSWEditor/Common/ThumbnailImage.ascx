﻿<%@ control language="C#" autoeventwireup="true" inherits="ManagerUserControl.ThumbnailImage, qwt" enableviewstate="false" %>
<div class="f_cb f_mt25">
	<label class="add_label f_fl"><span class="f_pdl15"><%=Name01 %></span></label>
	<div class="add_r f_fl">
		<div class="f_cb add_short bord_gray">
			<div class="add_short_tit f_cb"><span class="f_fl"><%=Name02 %></span><span class="add_upload_btn f_fr" id="add_upload_btn"><%--<a href="javascript:;">上传</a>--%></span></div>		
			<div class="add_short_cont f_cb">
                <ul class="targetCell"></ul>	
				<div class="md_prev f_fl f_csp" id="prev_<%=ID %>_01"><img src="skins/Img/leftjt.gif"></div>
				<div class="md_short_cont f_fl f_csp">
					<dl class="alt_mark f_fl">
						<dt id="load_<%=ID %>_small_dt" class="editor_warp" data-src='{"editor":"ThumbnailImage","warp":"#<%=ID %>_warp","directory":"<%=Directory %>","InputID":"<%=TImages.ClientID %>"}'><em class="load_small"></em>点击上传</dt>
					</dl>
					<div class="md_short_hide f_fl">
						<ul class="f_cb ThumbnailImage" id="<%=ID %>_warp" data-src='{"width":"152","show":"3","next":"#next_<%=ID %>_01","prev":"#prev_<%=ID %>_01"}'>
                            <asp:Repeater runat="server" ID="rpt"><ItemTemplate>
                            <li><a href="javascript:;"><i class="pro_view"></i><i class="pro_del"></i><img src="<%#Eval("URL")%>" /><input value="<%#Eval("URL")%>" name="<%=TImages.ClientID %>_src" type="hidden" /></a></li>
                            </ItemTemplate></asp:Repeater>
                        </ul>
					</div>
				</div>
				<div class="md_next f_fl f_csp" id="next_<%=ID %>_01"><img src="skins/Img/rightjt.gif"></div>
			</div>
		</div>
	</div>
    <asp:TextBox runat="server" ID="TImages" TextMode="MultiLine" Width="700" CssClass="dn"></asp:TextBox>
</div>
<script type="text/javascript">
    $(function () {
        Timeout(function () {
            loadJs("js/other/thumbnailImage.js");
        });
    })
</script>
