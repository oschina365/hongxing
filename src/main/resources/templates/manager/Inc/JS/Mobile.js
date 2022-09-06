
//手机中心设置
//效果：当商品导航显示模式选中的是:纯文本的时候,则商品导航显示列数的选择行显示出来    ;当商品导航显示模式选中的是:图标+标题的时候,则商品导航显示列数的选择行不显示出来 
function mobileNavModelSelect() {
    if (!$("#rdobtnFont").attr("checked")) {
        $("#MobileNavCountRow").hide();
        $("#Sanji").hide();
    } else {
        $("#MobileNavCountRow").show();
        $("#Sanji").show();
    }
}


//是否显示产品导航三级子导航
function mobileProSanJi() {
    if (!$("#rdobtnCol1").attr("checked")) {
        $("#Sanji").hide();
    } else {
        $("#Sanji").show();
    }
}



//同步PC版详细内容到手机端详细内容
$(function () {
    $("input[name='TOPC']").bind("click", function () {
        GetPCContentToMobile($(this).val(), $(this).attr("OID"), $(this).attr("TableName"));
    });
});
//同步PC版详细内容到手机端详细内容
//分为自定义、图文并茂、纯文字版
//参数说明：
//val 参数：要进行 的操作。如：同步PC图文并茂版、纯文字版、自定义
//oId:当前的对象ID
//type:操作的对象表名，如tbProduct、tbNews等
function GetPCContentToMobile(val, oId, type, id) {
    id = id || "txtContent";
    var editor = $("#" + id).data("editor");
    oId = parseInt(oId);
    var str = "";
    switch (val) {
        case "TOPCZi":
            if (confirm("此选项将清空手机端详细内容文本框里面的内容，确定继续？")) {
                str = "";
                //UE.getEditor("nsweditor").setContent(str);
                editor.html(str);
            }
            break;
        case "TOPCImg":
            $.post("/mobile/MAjax.ashx?action=PCToMobileImg&t=" + Math.random(), { Action: "ToImg", OID: oId, TableName: type }, function (rsp) {
                if ($(rsp).find("Error").length > 0) {
                    alert($(rsp).find("Error").text());
                } else {
                    str = $(rsp).find("Content").text();
                    //UE.getEditor("nsweditor").setContent(str);
                    editor.html(str);
                }
            });
            break;
        case "TOPCFont":
            $.post("/mobile/MAjax.ashx?action=PCToMobileImg&t=" + Math.random(), { Action: "ToFont", OID: oId, TableName: type }, function (rsp) {
                if ($(rsp).find("Error").length > 0) {
                    alert($(rsp).find("Error").text());
                } else {
                    str = $(rsp).find("Content").text();
                    //UE.getEditor("nsweditor").setContent(str);
                    editor.html(str);
                }
            });
            break;
        default:
            if (confirm("此选项将清空手机端详细内容文本框里面的内容，确定继续？")) {
                str = "";
                //UE.getEditor("nsweditor").setContent(str);
                editor.html(str);
            }
            break;
    }
}

function initPC2MC(src, oid, table,id) {
    GetPCContentToMobile($(src).val(), oid, table, id);
}