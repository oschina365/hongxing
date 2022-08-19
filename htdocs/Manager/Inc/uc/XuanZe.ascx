<%@ control language="C#" autoeventwireup="true" inherits="NSW.Web.UserControls.TemplateResource.XuanZe, qwt" enableviewstate="false" %>
<%--<%@ Register Src="~/Manager/Inc/UserControls/ImgUploadCombo.ascx" TagName="ImgUploadCombo" TagPrefix="ImgUploadCombo" %>--%>
<div class="wx-zhannei f_cb add_sv">
    <div class="wx-select lh27">
        <span class="f_db f_fl f_csp">选择栏目：</span>  
        <span class="clear_bd s_selt f_fl pt43" style="width:90px;">      
            <asp:DropDownList ID="ddlcolumntype" runat="server" CssClass="pass_faq"></asp:DropDownList>
        </span>
        <span class="f_db f_fl f_csp ml10">分类</span> 
        <span class="clear_bd s_selt f_fl pt43 ml10" style="width:100px;">     
            <asp:DropDownList ID="ddlcolumns" runat="server" CssClass="pass_faq">
                <asp:ListItem Value="">请先选择栏目...</asp:ListItem>
            </asp:DropDownList>
        </span>
        <span class="f_db f_fl f_csp ml10">文章</span> 
        <span class="clear_bd s_selt f_fl pt43 ml10" style="width:120px;">    
            <asp:DropDownList ID="ddlitems" runat="server" CssClass="pass_faq">
                <asp:ListItem Value="">请先选择分类...</asp:ListItem>
            </asp:DropDownList>
        </span>
        <asp:HiddenField runat="server" ID="hdnnewsColumns" /><!--资讯-->
        <asp:HiddenField runat="server" ID="hdnproductColumns" /><!--产品-->
        <asp:HiddenField runat="server" ID="hdnagentColumns" /><!--招商-->
        <asp:HiddenField runat="server" ID="hdnprojectColumns" /><!--方案-->
        <asp:HiddenField runat="server" ID="hdnhelpColumns" /><!--帮助-->
        <div class="msg_btn f_fl f_csp ml10" id="insertzhannei" onclick="addToSelect('ddlitems','ddlvalue')">添加到左侧</div>
    </div>
    <div class="clear"></div>
    <div class="wx-list mt10">
        <dl class="sv_checkbox f_fl" style=" height:auto;width:40%;">
            <dt class="pr">
                <a href="###" class="pro_up" onclick="moveOption('up','ddlvalue');"></a>
                <a href="###" class="pro_down" onclick="moveOption('next','ddlvalue');"></a>
                已选文章
            </dt>
			<dd style=" height:auto; width:100%;">
                <asp:ListBox ID="ddlvalue" runat="server" Height="300px" Width="100%" CssClass="pass_faq fl_select"></asp:ListBox>
			</dd>
		</dl>
        <span style="float:left; display:block; width:48px; margin:60px 10px 0;">
            <span class="btn" onclick="updateOption('ddlvalue');">修 改</span>
            <span class="btn" onclick="moveOption('right','ddlvalue');">移 除</span>
        </span>
        <div style="float:left; width:280px;">
            <div class="lh27 mt10">
                <span class="f_db f_fl f_csp">标题：</span>
                <span class="clear_bd f_fl p_inp1 ml10" style="width:70%;">
                    <input id="txtBt" type="text" class="com_input clear_word" splaceholder="请输入标题..." />
                    <i class="clear_x"></i>
				</span>
                <div class="clear"></div>
            </div>
            <div class="lh27 mt10">
                <span class="f_db f_fl f_csp">简介：</span>
                <div class="f_cb bord_gray f_fl ml10" style="width:75%;">
                    <textarea rows="2" cols="20" id="txtJj" class="text_area tx1" style="height:80px;min-height:80px;"></textarea>
                </div>
                <div class="clear"></div>
            </div>
            <div class="lh27 mt10">
                <span class="f_db f_fl f_csp">图片：</span>
                <div class="ml10 f_db f_fl">
                    <div class="f_fl f_csp upload_img" input="hdImg" directory="others"><span><em class="load_small"></em>点击上传</span></div>
                    <input id="hdImg" type="hidden" />
                </div>
                <div class="clear"></div>
            </div>
            <div class="lh27 mt10">
                <span class="f_db f_fl f_csp">链接：</span>
                <span class="clear_bd f_fl p_inp1 ml10" style="width:70%;">
                    <input id="txtLj" type="text" class="com_input clear_word" splaceholder="请输入链接..." />
                    <i class="clear_x"></i>
				</span>
                <div class="clear"></div>
            </div>
            <div class="lh27 mt10">
                <span class="btn" id="addTo" onclick="addOrUpdateToSelect('ddlvalue');">添加到文章列表</span>
                <span class="btn" id="changeS" onclick="$(this).hide();$('#addTo').text('添加到文章列表');$$('#ddlvalue').find('option').attr('update','0');" style="margin-left:20px; display:none;">修改更改为添加</span>
            </div>
        </div>
    </div>
    <div class="wx-view"></div>
    <script type="text/javascript">
        window._imgs_ = null;
        $(function(){
            var btn = $("div.upload_img");
            btn.bind("click",function(){
                _alert("正在加载插件，请稍后重试...");
            })
            $("input[type='submit']").click(function(){
                $$("ddlvalue").attr("multiple","multiple").find("option").attr("selected",true);
                return true;
            })
            loadJs("js/common/editor.js", function () {
                btn.unbind("click");
                window._imgs_ = new img_gallerywindow($("div.upload_img"),{
                    input:"hdImg",
                    directory:"others",
                    max:1
                });
            })
        })
        var KJID = "<%=ID==""?"KJID":ID %>";
        var ddlcolumntype = $$("ddlcolumntype");//栏目
        var ddlcolumns = $$("ddlcolumns");//分类
        var ddlitems = $$("ddlitems");//文章
        window.XqObj = {};
        //根据当前控件ID获取实际服务器控件ID
        function $$(id){
            return  $("#" + KJID + "_" + id);
        }
        //类型更改
        ddlcolumntype.change(function(){
            var val = $(this).val();
            if(val != ""){
                ddlcolumns.html($$("hdn" + val + "Columns").val());
            }
        }).change();
        //获取资讯
        function getwxnews(type,sid,fn){
            var key = type + "_" + sid;
            fn = fn||function(msg,isAjax){
                if(msg!=""){
                    ddlitems.html(msg);
                }else{
                    ddlitems.html("<option type=\"\" url=\"\" short=\"\" img=\"\" value=\"\">请选择文章...</option>");
                }
                XqObj[key] = ddlitems.html();
            }
            if(key in XqObj){
                fn(XqObj[key],false);
                return;
            }
             $.post("Handler/wajax.ashx?action=getwxnews&t=" + Math.random(), {
                type:type,
                sid:sid
            }, function(msg) {
                fn(msg);
            });
        }
        //分类更改
        ddlcolumns.change(function(){
            var sid = $(this).val();
            if(sid != ""){
                var type = ddlcolumntype.val();
                var key = type + "_" + sid;
                if(key in XqObj){
                    ddlitems.html(XqObj[key]);
                    return;
                }
                getwxnews(type,sid);
            }
        })

        //点击修改现在内容显示到右边
        function updateOption(ddlvalue){
            var ddlvalue = $$(ddlvalue);
            var item = ddlvalue.find("option:selected");
            if(!item.length){
                _alert("请选择要修改的文章！");
                return;
            }
            var val = item.val().split("$#$");
            if( val.length < 4 ){
                _alert("改文章信息格式错误！");
                return;
            }
            item.attr("update",'1').siblings().attr("update",'0');
            $("#txtBt").val(val[0]).trigger("hasValue");//标题
            $("#txtJj").val(val[1]).trigger("hasValue");//简介
            $("#hdImg").val(val[2]);//图片
            if(window._imgs_){
                window._imgs_.ShowImg();
            }
            $("#txtLj").val(val[3]).trigger("hasValue");//链接
            $("#addTo").text("保存修改");
            $("#changeS").show();

        }
        function addOrUpdateToSelect(ddlvalue){
            var ddlvalue = $$(ddlvalue);
            var txtBt = $("#txtBt").val();//标题
            var txtJj = $("#txtJj").val();//简介
            var txtTp = $("#hdImg").val();//图片
            var txtLj = $("#txtLj").val();//链接
            if(txtBt.length==0){
                _alert("请输入文章标题！");
                return;
            }
            if(ddlvalue.find("option[value^='" + txtBt + "$#$'][update!='1']").length){
                _alert("已存在相同的文章！");
                return;
            }
            //标题，简介，图片,URL
            var temp = "{0}$#${1}$#${2}$#${3}";
            var _val = temp.replace(/\{0\}/g, txtBt)
                .replace(/\{1\}/, txtJj)
                .replace(/\{2\}/, txtTp)
                .replace(/\{3\}/, txtLj);
            if($("#addTo").text()=="保存修改"){
                var op = ddlvalue.find("[update='1']").attr("update",'0');
                op.val(_val).text(txtBt);
                $("#changeS").hide();
                $("#addTo").text("添加到文章列表");
            }else{
                ddlvalue.append("<option value=\"" + _val + "\" update='false'>" + txtBt + "</option>");
            }
            $("#txtBt").val("").trigger("hasValue");
            $("#txtJj").val("").trigger("hasValue");
            $("#txtBt").val("").trigger("hasValue");
            $("#hdImg").val("");
            $("#txtLj").val("").trigger("hasValue");
            if(window._imgs_){
                window._imgs_.ShowImg();
            }
        }
        //添加到左边
        function addToSelect(ddlitems, ddlvalue) {
            var ddlitems = $$(ddlitems);
            var ddlvalue = $$(ddlvalue);
            var item = ddlitems.find("option:selected");
            var title = $$(ddlcolumntype).val();
            if (item.length == 0 || !/^\d+$/.test(item.val())) {
                _alert("请选择文章");
                return;
            }
            if (ddlvalue.find("option[value^='" + item.text() + "$#$']").length) {
                _alert("已存在该文章");
                return;
            }
            //标题，简介，图片,URL
            var temp = "<option value=\"{0}$#${1}$#${2}$#${3}\" update='false'>{0}</option>";
            ddlvalue.append(
                temp.replace(/\{0\}/g, item.text())
                .replace(/\{1\}/, item.attr("short"))
                .replace(/\{2\}/, item.attr("img"))
                .replace(/\{3\}/, item.attr("url"))
            )
        }
        //移动和移除
        function moveOption(cz, id) {
            var elm = $$(id || 'ddlvalue');
            var option = elm.find("option:selected");
            if (option.length > 1 && cz != "right") {
                _alert("只能选择一个列进行排序");
                return;
            }
            if (cz == "right") {
                if (confirm("确定移除？")) {
                    option.remove();
                    return;
                }
            }
            if (cz == "up") {
                option.prev("option").before(option);
                return;
            }
            if (cz == "next") {
                option.next("option").after(option);
                return;
            }
        }
    </script>
</div>