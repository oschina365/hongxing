$(function () {
    var div = $("#button_warp");
    if (div.length) {
        loadJs("/user/jquery.validate.js", function () {
            loadJs("/user/jquery.form.js", function () {
                var html = [
                    '<form id="commentForm">',
                        '<div class="h1div"><span>在线投标</span><div class="h1div_des">带*的必须填写</div></div>',
                        '<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="regtable" id="tbForm">',
                            '<tbody>',
                                '<tr>',
                                    '<td width="130" align="right"><span class="bt">*</span>报价:</td>',
                                    '<td><input type="text" class="inputs2" style="display: none;" name="oid" id="oid" /><input type="text" class="inputs2" name="quote" /><span class="bt_des">含税、含运费报价</span></td>',
                                '</tr>',
                                '<tr>',
                                    '<td align="right"><span class="bt">*</span>交期:</td>',
                                    '<td><input type="text" class="inputs2" name="delivery" /></td>',
                                '</tr>',
                                '<tr>',
                                    '<td align="right"><span class="bt">*</span>付款方式:</td>',
                                    '<td><textarea style=" height:100px;" name="paymentMethod"></textarea></td>',
                                '</tr>',
                                '<tr>',
                                    '<td align="right"><span class="bt">*</span>质量:</td>',
                                    '<td><textarea style=" height:100px;" name="quality"></textarea></td>',
                                '</tr>',
                                '<tr>',
                                    '<td align="right"><span class="bt">*</span>质保时间:</td>',
                                    '<td><input type="text" class="inputs2" name="qualityAssuranceTime" /></td>',
                                '</tr>',
                                '<tr>',
                                    '<td align="right"><span class="bt">*</span>附件:</td>',
                                    '<td><input type="file" name="imgFile" id="businesslicense" class="inputm1" /><span class="bt_des">附件提交(技术参数、相关图纸、规格书)</span></td>',
                                '</tr>',
                                '<tr>',
                                    '<td align="right"><span class="bt">*</span>验证码:</td>',
                                    '<td><input id="vcode" name="vcode" type="text" class="inputs2" value="" left="70" top="5" style="width:60px;" /><span class="bt_des"><img src="/tools/ValidCodes.aspx" style=" vertical-align:middle;" onclick="this.src=\'/tools/ValidCodes.aspx?\'+(new Date()).getTime();" /></span></td>',
                                '</tr>',
                                '<tr>',
                                    '<td align="right"></td>',
                                    '<td><input type="submit" class="b13" value="提 交" /><input type="reset" id="reset" class="b13" value="重 填" /></td>',
                                '</tr>',
                            '</tbody>',
                        '</table>',
                    '</form>'
                ].join('');
                div.append(html);
                $.validator.setDefaults({
                    submitHandler: function () {
                        if (!checkFile("#businesslicense") || $("#commentForm").find("label.error_,label.error").filter(":visible").length > 0) {
                            return false;
                        }
                        showBgProc(true, "正在注册，请稍候...");
                        $("#oid").val(OBJ_ID);
                        $("#commentForm").ajaxSubmit({
                            type: "post",
                            url: "/Ajax.ashx?action=SaveAgentApply&time=" + (new Date()).getTime(),
                            success: function (msg) {
                                if (msg) {
                                    $a(msg);
                                } else {
                                    $a("提交成功，感谢您的参与，我们将会尽快联系您！");
                                    $("#reset").click();
                                }
                                showBgProc(false);
                            }
                        });
                        return false;
                    }
                });

                function checkFile(src) {
                    src = $(src);
                    var fileName = src.val();
                    var fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1);
                    var types = 'gif,jpg,jpeg,png,bmp,doc,docx,xls,xlsx,ppt';
                    var label = src.siblings("label.error_").hide();
                    if (label.length == 0) {
                        src.after('<label generated="true" class="error_" style="position: absolute;display:none;"></label>');
                        label = src.next("label.error_");
                        var l = 10, t = 3;
                    }
                    label.css("position", "absolute").css("top", src.offset().top + t).css("left", src.offset().left + src.width() + l);
                    if (!fileExtension || (',' + types + ',').indexOf(fileExtension) == -1) {
                        label.html("请上传" + types + "类型的文件！").show().siblings(".error").hide();
                        src.val("");
                        return false;
                    } else {
                        label.hide();
                    }
                    return true;
                }

                $("#commentForm").validate({
                    rules: {
                        quote: {
                            required: true
                        },
                        delivery: {
                            required: true
                        },
                        paymentMethod: {
                            required: true
                        },
                        quality: {
                            required: true
                        },
                        qualityAssuranceTime: {
                            required: true
                        },
                        vcode: {
                            required: true,
                            maxlength: 4,
                            minlength: 4
                        }
                    }
                });
                $("#vcode").one("click", function () {
                    $(this).next().find("img").click();
                })
                $("#businesslicense").bind("change", function () {
                    checkFile(this);
                })
            })
        })
    }
})