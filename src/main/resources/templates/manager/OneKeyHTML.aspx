<%@ page language="C#" enableviewstate="true" autoeventwireup="true" inherits="NSW.Web.User.OneKeyHTML, qwt" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %></title>
    <link href="skins/base/publish.css" rel="stylesheet" type="text/css" />
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
	<!-- content_index -->
					
	<div class="bord_gray">
		<div class="graybar_one f_cb">
			<div class="title_two">全站生成</div>
		</div>
		<div class="webpub_side">
			<div class="webpub_intit"><b>您的网站包含如下栏目：</b></div>	
							
			<!-- 列表区 开始 -->
			<div id="nsw_list_table" class="nsw_mailsub_list frontpage_tab">
				<div class="nsw_list_header t_tr">
					<div class="nsw_check_box t_td"><span class="ck_box sele_all_ z_select"><span class="dn"><input type="checkbox" checked="checked" value="all" onclick="if(this.checked){$('#nsw_list_content').find('span.ck_box').addClass('z_select').find('input').attr('checked',true);}else{$('#nsw_list_content').find('span.ck_box').removeClass('z_select').find('input').attr('checked',false);}" /></span></span></div>
					<div class="nsw_key_1 t_td">栏目名称</div>
					<div class="nsw_key_6 t_td">状态</div>
					<div class="nsw_key_7 t_td">文章数量</div>
				</div>
				<!-- 列表内容开始 -->
				<div id="nsw_list_content" >
                    <asp:Repeater runat="server" ID="rpt"><ItemTemplate>
					<div class="t_tr child_1" <%#GetParentID(Container) %>>
						<div class="nsw_parent_tr t_tr">
							<div class="nsw_check_box t_td"><span class="ck_box z_select"><span class="dn"><input type="checkbox" value="<%#GetID(Container) %>" checked="checked"/></span></span></div>
							<div class="nsw_key_1 t_td"><span class="eps_text"><%#Eval("Title") %></span></div>
							<div class="nsw_key_6 t_td"><span class="e_rq e_rq_o">建议更新</span></div>
							<div class="nsw_key_7 t_td"><%#Eval("Count")%></div>
						</div>
					</div>
                    </ItemTemplate></asp:Repeater>
				</div>
			</div>

            <div class="probar_side">
                <span class="probar_bg" id="ProgressBar" style="width:0%;">&nbsp;</span>
                <span class="percent" id="ProgressBarTxt">0%</span>
            </div>

            <div class="probar_tips f_mt35 f_mb25 f_cb">
                <div class="tips_l f_fl" id="laySummery">本次成功更新
                    <em class="color_orange">xx</em>个页面，失败<em class="color_orange">xx</em>个页面，还有<em class="color_orange">xx</em>页面，总计<em class="color_orange">xx</em>页面。
                </div>
            </div>

            <div class="view_btn f_tac f_pdt10 f_pdb20">
                <span class="e_btn1 f_csp " id="shengcheng"><i class="suc_icon"></i>生 成</span>
            <span class="e_btn1 f_csp dn" id="zhanding"><i class="pause_icon"></i>生成中</span>
            </div>
		</div>
	</div>
</div>
<script type="text/javascript">

    $(function () {
        var checkOneLoad = true;
        var shengcheng = false;
        var objlaySummery = $("#laySummery");
        var ProgressBar = $("#ProgressBar");
        var ProgressBarTxt = $("#ProgressBarTxt");
        var SetText = function (data) {
            var html = '';
            if (data.Title) {
                html += "正在生成" + data.Title + "中，";
            }
            html += "本次成功更新<em class=\"color_orange\">" + data.SuccessCount + "<em>个页面";
            html += "，失败<em class=\"color_orange\">" + data.ErrorCount + "<em>个页面";
            html += '，总计<em class="color_orange">' + data.RecordSetSum + '</em>页面';

            objlaySummery.html(html);
            data.RecordSetSum = data.RecordSetSum == 0 ? 1 : data.RecordSetSum;
            var processer = Math.round(data.RecordSetDill / data.RecordSetSum * 100) + "%";
            ProgressBar.css("width", processer);
            ProgressBarTxt.html(processer);
        }
        SetText({ SuccessCount: 0, data: 0, RecordSetSum: 0, RecordSetDill: 0, ErrorCount: 0 });
        function Generate(ids, selectcount) {
            if (!shengcheng) {
                return;
            }
            $.ajax({
                type: "post",
                url: "OneKeyLing.aspx?SelectCount=" + selectcount + "&checkOneLoad=" + checkOneLoad,
                data:{ids:ids},
                cache: "false",
                success: function (msg) {
                    var data = {};
                    try {
                        data = jQuery.parseJSON(msg);
                    } catch (e) {
                        alert("parseJSON Error:\r\n" + msg);
                    }
                    if (data.State == "generation") {

                        SetText(data);

                        setTimeout(function () {
                            Generate(ids, selectcount);
                        }, 1000);
                    } else if (data.State == "complete") {
                        _alert("静态页生成完成！！", true);
                        $("#shengcheng").css("display", "inline-block");
                        $("#zhanding").hide();
                        shengcheng = false;
                        checkOneLoad = true;
                        objlaySummery.html("静态页生成完成！！");
                        ProgressBar.css("width", "0%").html("&nbsp;");
                        ProgressBarTxt.html("0%");
                    } else if (data.State == "nodata") {
                        _alert("没有可压缩文件！");
                        $("#shengcheng").css("display", "inline-block");
                        $("#zhanding").hide();
                        shengcheng = false;
                        checkOneLoad = true;
                        objlaySummery.html("0条");
                        ProgressBar.css("width", "0%").html("&nbsp;");
                        ProgressBarTxt.html("0%");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        $("#shengcheng").bind("click", function () {
            var cbs = $("#nsw_list_content input:checked");
            if (cbs.length == 0) {
                _alert("请选择要压缩的栏目");
                return;
            }
            $("#shengcheng").hide();
            $("#zhanding").css("display", "inline-block");
            shengcheng = true;

            var values = [];
            cbs.each(function () {
                values.push($(this).val());
            })
            values = values.join(',');
            var SelectCount = 20;

            objlaySummery.html("正在生成中，请稍等...");
            if (checkOneLoad) {
                ProgressBar.css("width", "0%").html("&nbsp;");
                ProgressBarTxt.html("0%");
            }
            Generate(values, SelectCount);

            checkOneLoad = false;
        })
        $("#zhanding").bind("click", function () {
            shengcheng = false;
            $("#shengcheng").css("display", "inline-block");
            $("#zhanding").hide();
        })

        /*********************************************/
        var nsw_list_content = $("#nsw_list_content");
        nsw_list_content.find(".child_1[parentid='1'][type_] input").bind("ev_click", function () {
            var me = $(this);
            var tr = me.parents(".child_1");
            var type_ = tr.attr("type_");
            if (!type_) {
                return;
            }
            var checked = me.attr("checked");
            var ck_boxs = tr.data("ck_boxs") || [];
            if (ck_boxs.length == 0) {
                tr.attr("type", null);
            }
            if (checked) {
                ck_boxs.addClass("z_select").find("input").attr("checked", true);
            } else {
                ck_boxs.removeClass("z_select").find("input").attr("checked", false);
            }
        }).each(function () {
            var me = $(this);
            var tr = me.parents(".child_1");
            var type_ = tr.attr("type_");
            var ck_boxs = tr.siblings(".child_1[type_='" + type_ + "']").find(".ck_box");
            tr.data("ck_boxs", ck_boxs);
            ck_boxs.find("input").bind("ev_click", function () {
                var _me = $(this);
                var checked = _me.attr("checked");
                if (checked) {
                    if (ck_boxs.find("input[checked]").length == ck_boxs.length) {
                        me.attr("checked", true).parents(".ck_box").addClass("z_select");
                    }
                } else {
                    me.attr("checked", false).parents(".ck_box").removeClass("z_select");
                }
            })
        });
    })
</script>
</body>
</html>
