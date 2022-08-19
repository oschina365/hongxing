/******************************************************************************
* filename: product_edit.js
* 产品录入页脚本
* (C) Oran Day(oransite#gmail.com), MasterLi(masterljf#hotmail.com)
* (C) NSW(http://www.nsw.com)
*******************************************************************************/
//产品编辑页
//保存产品所有标签内容
function saveAllContent() {
    var currentValue = "";
    currentValue = UE.getEditor('nsweditor').getContent();
    $("#ulDescTabs").find("a.cur").next("input").val(currentValue);
    var jAll = $j("hdnAllContent");
    jAll.val("");
    $("#ulDescTabs input[type=hidden]").each(function (i) {
        if (i != 0) {
            jAll.val(jAll.val() + PE_ALL_CONTENT_SPLITER);
        }
        jAll.val(jAll.val() + $(this).val());
    });
    //去掉ie 里面录入图片的话 会添加一个绝对地址  如<img src="http://192.168.1.14:100/img.jpg" /> 去掉/前面的内容
    var remDomainContent = jAll.val();
    remDomainContent = remDomainContent.replace(new RegExp("(src=['\"])" + window.location.protocol + "//" + window.location.host, "ig"), "$1");
    //去掉IE里面可能会出现的js错误信息
    remDomainContent = remDomainContent.replace(/&#10;/gi, "\n").replace(/&#9;/gi, "\t").replace(/&#13;/gi, "\r");
    jAll.val(remDomainContent);    
}
//// 获取编辑器中HTML内容
//function getEditorHTMLContents(EditorName) {
//    var oEditor = FCKeditorAPI.GetInstance(EditorName);
//    return (oEditor.GetXHTML(true));
//}

//// 获取编辑器中文字内容
//function getEditorTextContents(EditorName) {
//    var oEditor = FCKeditorAPI.GetInstance(EditorName);
//    return (oEditor.EditorDocument.body.innerText);
//}

//// 设置编辑器中内容
//function SetEditorContents(EditorName, ContentStr) {
//    var oEditor = FCKeditorAPI.GetInstance(EditorName);
//    oEditor.SetHTML(ContentStr);
//}
//获取前一个标签对应的内容
function GetPreviousTagContent(src) {
    var fck; //定义Fck对象
    var obj;
    //2\设置变量值
    //3\把当前标签的上一个内容找出来
    obj = $(src).parent().find("input[type=hidden]");
    //4\把Fck里面的内容设置到Hidden隐藏域里面保存    
    SetEditorContents("txtContent", obj.val());
}
//设置当前标签的内容值到Fck里面
function SetCurrentTagToFck(src) {
    //将当前FCK内容保存到正在编辑的标签
//    $(PROD_ED_CURRENT_HIDDEN).val(getEditorHTMLContents("txtContent"));
//    PROD_ED_CURRENT_HIDDEN = $(src).next()[0];
//    //1\定义变量
//    var fck; //定义Fck对象
//    var obj;
//    //2\设置变量值
//    //3\把当前标签的内容找出来
//    obj = $(src).parent().find("input[type=hidden]");
//    //4\把内容设置到Fck里面
//    SetEditorContents("txtContent", obj.val());
//    //设置标签位置
//    $("#ulDescTabs a").removeClass("cur");
    //    $(src).addClass("cur").blur();
    $(src).parent().parent().find("a.cur").next("input").val(getEditorHTMLContents("txtContent"));
    $(src).parent().parent().find("a.cur").removeClass("cur");
    $(src).addClass("cur");
    SetEditorContents("txtContent", $(src).next("input").val());
}


//设置标签
//参数:返回录入框控件名称,设置显示内容
//返回参数：无
function SetCurrentCBLValue(cb, ctl, txt) {
    //1\定义变量
    var obj, objvalue;
    //2\查找控件
    obj = document.getElementById(ctl);
    //3\设置标签内容
    if (obj) {
        if (obj.value.length == 0) { obj.value = txt; return }
        objvalue = "," + obj.value + ",";
        //3、检测里面是否有此名称,如果有,则不填写，否则添加到末尾
        if (cb.checked) {
            txt = "," + txt + ",";
            var offset = objvalue.indexOf(txt);
            if (offset == -1) {
                objvalue = objvalue.substring(0, objvalue.length - 1);
                objvalue += txt;
            }
        }
        else {
            objvalue = objvalue.replace(txt + ",", "");
        }
        obj.value = objvalue.substring(1, objvalue.length - 1);
        if (obj.value == ",") { obj.value = ""; }
    }
}

function SetCurrentRadValue(ctl, txt) {
    //1\定义变量
    var obj, objvalue;
    //2\查找控件
    obj = document.getElementById(ctl);
    //3\设置控件内容
    if (obj) {
        obj.value = txt;
        return;
    }
}

function ShowCombo() {
    var obj;
    //2\设置变量值
    //3\设置是否显示
    for (var i = 0; i < 4; i++) {
        obj = document.getElementById("EnableCombo" + i);
        if (obj != null) {
            if (obj.style.display == "none") {
                obj.style.display = "block";
            } else {
                obj.style.display = "none";
            }
        }
    }
}
//标题输入框失去焦点后自动生成拼音文件名
function CreatPY(flag) {
    //最终只取10个长度的拼音
    var pylength = 10;
    $.get("Handler/Ajax.ashx?action=getpy&params=" + encodeURIComponent($("#txtTitle").val().trim()) + "&x=" + Math.random(), function(data) {
        if (data != "error") {
            if (data.length <= pylength) {
                $("#txtFileName").val(data + ".html");
            }
            else {
                $("#txtFileName").val(data.substring(0, pylength) + ".html");
            }
            //检查文件是否存在
            CheckFileName();
        }
        else {
            alert("请填写标题名称");
        }
    });
}
function CheckFileName() {
    var SourceFileName, CurrentFileName;
    SourceFileName = $("#hidFileName").val().trim();
    CurrentFileName = $("#txtFileName").val().trim();
    //1\如果第一次录入文件，则检测文件是否存在，如果存在，则提示错误信息
    if (SourceFileName.length == 0) {
        checkFile(CurrentFileName);
    }

    //2\如果第二次录入文件[即编辑文件，如果当前文件名称不变，则不需要检查文件的存在性]

    //3\如果第二次录入文件[即编辑文件，如果当前文件名称已经变化了，则需要检测文件是否存在，如果存在，则提示错误信息]
    else if (SourceFileName.toLowerCase() != CurrentFileName.toLowerCase()) {
        checkFile(CurrentFileName);
    }

}

function checkFile(FileName, flag) {
    if (!flag) flag = false;
    if (FileName.length > 0 && basecolumnid != 1) {
        //最终只取10个长度的拼音
        $.get("Handler/Ajax.ashx?action=checkfile&params=" + encodeURIComponent(FileName) + "&x=" + Math.random() + "&columntype=product&columnid=" + $("#hdnSelectedColumn").val() + "&oid=" + oid,
			function(data) {
			    if (data != "error") {
			        if (data == "true") {
			            alert("文件名：" + FileName + "已经存在，已在文件后面添加重命名_1");
			            FileName = FileName.substr(0, FileName.indexOf(".html")) + "_1.html";
			            $("#txtFileName").val(FileName).focus();
			        }
			        else if (flag && data == "false") {
			            alert("文件名：" + FileName + "可以使用。");
			        }
			    }
			}
		);
    }
}
//填充产品分类到列表
function fillProductColumns() {
    var columns = $v("hdnColumns").split("||");
    var clnValIdPair;
    var ddlOpts = document.getElementById("ddlColumns").options;
    var ddlOtherColumnOpts = document.getElementById("SelectList").options;
    ddlOpts.length = 0;
    ddlOtherColumnOpts.length = 0;
    var opt;
    var opt2;
    var selectedID = $v("hdnSelectedColumn");
    for (var i = 0; i < columns.length; ++i) {
        clnValIdPair = columns[i].split("$$");
        opt = new Option(clnValIdPair[1], clnValIdPair[0]);
        if (clnValIdPair[0] == selectedID) {
            opt.selected = true;
        }
        ddlOpts[i] = opt;
        opt2 = new Option(clnValIdPair[1], clnValIdPair[0].replace(",", "||"));
        ddlOtherColumnOpts[i] = opt2;
    }
}
//当产品分类列表选择项改变事件
function ddlColumns_Changed(src) {
    $v("hdnSelectedColumn", src.value);
    $j("btnColumn").click();
}