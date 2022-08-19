<%@ control language="C#" autoeventwireup="true" inherits="ManagerUserControl.ThumbnailImage01, qwt" enableviewstate="false" %>
<style>
.shuoming .add_short_cont,.shuoming .md_short_hide,.shuoming .md_short_cont{ height:320px;}
.shuoming li{ height:300px;}
.shuoming li input,.shuoming li textarea{ border:1px solid #dcdcdc; width:90%; margin:0 auto; display:block; resize:none; margin-bottom:5px; padding:2px 3px; line-height:16px;}
.shuoming li textarea{ height:100px;}
</style>
<div class="f_cb f_mt25 shuoming">
	<label class="add_label f_fl"><span class="f_pdl15"><%=Name01 %></span></label>
	<div class="add_r f_fl">
		<div class="f_cb add_short bord_gray">
			<div class="add_short_tit f_cb"><span class="f_fl"><%=Name02 %></span><span class="add_upload_btn f_fr" id="add_upload_btn"></span></div>		
			<div class="add_short_cont f_cb">
                <ul class="targetCell"></ul>	
				<div class="md_prev f_fl f_csp" id="prev_<%=ID %>_01"><img src="skins/Img/leftjt.gif"></div>
				<div class="md_short_cont f_fl f_csp">
					<dl class="alt_mark f_fl">
						<dt id="load_<%=ID %>_small_dt"><em class="load_small"></em>点击上传</dt>
					</dl>
					<div class="md_short_hide f_fl">
						<ul class="f_cb ThumbnailImage" id="<%=ID %>_warp" data-src='{"width":"152","show":"3","next":"#next_<%=ID %>_01","prev":"#prev_<%=ID %>_01"}'>
                            <asp:Repeater runat="server" ID="rpt"><ItemTemplate>
                            <li>
                                <a href="javascript:;">
                                    <i class="pro_view"></i>
                                    <i class="pro_del"></i>
                                    <img src="<%#Eval("URL")%>" />
                                    <input value="<%#Eval("URL")%>" name="<%=TImages.ClientID %>_src" type="hidden" />
                                </a>
                                <textarea placeholder="请输入文字说明" name="<%=TImages.ClientID %>_shortdesc"><%#GetEval("column01", Container)%></textarea>
                            </li>
                            </ItemTemplate></asp:Repeater>
                        </ul>
					</div>
				</div>
				<div class="md_next f_fl f_csp" id="next_<%=ID %>_01"><img src="skins/Img/rightjt.gif"></div>
			</div>
		</div>
	</div>
    <asp:TextBox runat="server" ID="TImages" TextMode="MultiLine" Width="700" CssClass="dn"></asp:TextBox>
    <asp:HiddenField runat="server" ID="hdKeys" Value="shortdesc" />
</div>
<div id="<%=ID %>_temp" style="display:none">
    <li>
        <a href="javascript:;">
            <i class="pro_view"></i>
            <i class="pro_del"></i>
            <img src="{src}" />
            <input value="{src}" name="{tid}_src" type="hidden" />
        </a>
        <textarea placeholder="请输入文字说明"name="{tid}_shortdesc">{val}</textarea>
    </li>
</div>
<script type="text/javascript">
    $(function () {
        var tid = "<%=TImages.ClientID %>";
        var id = "<%=ID %>";
        var directory = "<%=Directory %>";
        var tempwarp = $("#" + id + "_temp");
        var temp = _allReplace(tempwarp.html(), '{tid}', tid);
        tempwarp.remove();
        loadJs("js/common/editor.js", function () {
            new ThumbnailImage($("#load_" + id + "_small_dt"),
            {
                "warp": "#" + id + "_warp",
                "directory": directory, "InputID": tid,
                foreach: function (data) {
                    var me = this;
                    var html = temp;
                    if (data.url || data.title) {
                        data.title = data.title.replace('>', '').replace("'", "”").replace('"', "”").replace(",", "，");
                        html = _allReplace(html, "{src}", data.url);
                        //html = _allReplace(html, "{title}", data.title);
                        html = html.replace("{val}", data.title);
                        return html;
                    }
                    return '';
                }
            });
        })

        Timeout(function () {
            loadJs("js/other/thumbnailImage.js");
        });
    })
</script>
