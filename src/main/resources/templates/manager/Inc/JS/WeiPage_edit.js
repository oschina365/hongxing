//标题输入框失去焦点后自动生成拼音文件名
function CreatPY(flag) {
    //最终只取10个长度的拼音
    var pylength = 20;
    $.get("/Manager/Handler/Ajax.ashx?action=getpy&params=" + encodeURIComponent($("#txtTitle").val().trim()) + "&x=" + Math.random(), function (data) {
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
    var columntype = "/mobile/WeiPage/";
    var txtDirectory = $("#txtDirectory");
    if (txtDirectory.length) {
        txtDirectory = $.trim(txtDirectory.val());
        if (txtDirectory == "") {//如果为空的话
            columntype = $.trim($("#lblDirectory").text());
        } else {
            columntype = txtDirectory;
        }
    }
    if (FileName.length > 0) {
        //最终只取10个长度的拼音
        $.get("/Manager/Handler/Ajax.ashx?action=checkfile&params=" + encodeURIComponent(FileName) + "&x=" + Math.random() + "&columntype=" + columntype,
			function (data) {
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