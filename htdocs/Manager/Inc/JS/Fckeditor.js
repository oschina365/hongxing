var arryPictures;
var arryPictureTag;
var arryTables;
var arryTableTag;
//定义FCK自动排版保留内容的数组，内容包括标签前缀，正则表达式，对象对齐方式[Left\Center\None\Fix],Fix就是要在后面增加一个回车
var arryFckKeepObjectsReg;
//定义替换字符串字典键值对
var arryFckKeepObjectsValue;
arryFckKeepObjectsReg = new Array();
arryFckKeepObjectsValue = new Array();

//保留图片\Flash//ok
arryFckKeepObjectsReg[0] = new Array();
arryFckKeepObjectsReg[0][0] = "Picture";
arryFckKeepObjectsReg[0][1] = "<img.*?>";
arryFckKeepObjectsReg[0][2] = "Center";

//保留加重对象//ok
arryFckKeepObjectsReg[1] = new Array();
arryFckKeepObjectsReg[1][0] = "Strong";
arryFckKeepObjectsReg[1][1] = "<strong.*?>[\s\S]*?<\/strong>";
arryFckKeepObjectsReg[1][2] = "Fix";

arryFckKeepObjectsReg[2] = new Array();
arryFckKeepObjectsReg[2][0] = "Strong";
arryFckKeepObjectsReg[2][1] = "<strong.*?>.*?<\/strong>";
arryFckKeepObjectsReg[2][2] = "None";

//保留Java函数对象,还没有检测成功
arryFckKeepObjectsReg[3] = new Array();
arryFckKeepObjectsReg[3][0] = "Script";
arryFckKeepObjectsReg[3][1] = "<script.*?>[\s\S]*?<\/script>";
arryFckKeepObjectsReg[3][2] = "None";

//保留表格,还没有检测成功
arryFckKeepObjectsReg[4] = new Array();
arryFckKeepObjectsReg[4][0] = "Table";
arryFckKeepObjectsReg[4][1] = "<table.*?>[\s\S]*?<\/table>";
arryFckKeepObjectsReg[4][2] = "Center";


//---------------------对齐文本---------------------------------------//
//参数：文本控件对象,模式：0代表普通文本输入框,1代表FCKeditor文本输入框
function ContentAlign(objcontrolName, mode) {
    //0选中全部的
    UE.getEditor("nsweditor").execCommand("selectall");
    //1清除格式
    UE.getEditor("nsweditor").execCommand("removeformat");
    //0\对UE进行自动排版
    UE.getEditor("nsweditor").execCommand("autotypeset");
    //1\获取Ueditor内容
    var baceContent = UE.getEditor('nsweditor').getContent();
    //2\把空标签里面的换行去掉 <p[^>]*>\s*(<br.*?>)+\s*<\/p>
    baceContent = baceContent.replace(/<p[^>]*>\s*(<br.*?>)+\s*<\/p>/gi, "");
    //        console.log(baceContent);
    //        baceContent = baceContent.replace(/<p.*?>\s*(<br.*?>)+\s*<\/p>/i, "");
    //        console.log(baceContent);
    //3\去除单行里面前面的空格&nbsp;
    //        baceContent = baceContent.replace(/(?<=<p.*?>)\s*(&nbsp;)+/,"");
    //        baceContent = baceContent.replace(/(?<=<p.*?>)\s*(&nbsp;)+/, "");
    //        baceContent = baceContent.replace(/(<p.*?>)\s*(&nbsp;)+/i, "$1");
    //    baceContent = baceContent.replace(/(<p.*?>)([(&nbsp;)+(\s*)+])+/gi, "$1");
    baceContent = baceContent.replace(/(<p.*?>)((\s*)[　]*(&nbsp;)?(\s*)[　]*)*/gi, "$1");
    //5返回内容
    UE.getEditor('nsweditor').setContent(baceContent);
   
}

//找出HTML文本的图片，并且把需要保留的内容存放到数组里面
//二维数组格式字符串
//返回处理过的文本
function FindObjects(Content) {
    //1\定义变量
    var TagIndex, CurrentTagIndex, Temp;
    var FromIndex;

    //2\设置变量初始值
    TagIndex = 0;

    //alert(Content)
    //3\根据正则表达式数组，循环把需要保留的内容保留下来，并且存放在arryFckKeepObjectsValue里面
    for (var i = 0; i < arryFckKeepObjectsReg.length; i++) {
        //0>初始化变量值
        Temp = "";
        FromIndex = 0;
        CurrentTagIndex = 0;

        //1>设置存放的空间	
        //alert(arryFckKeepObjectsReg[i][1]);
        //var reg = eval(arryFckKeepObjectsReg[i][1]);//设置正则表达式
        var reg;

        if (i == 3) {
            reg = /<script.*?>[\s\S]*?<\/script>/ig;
        }
        else if (i == 4) {
            reg = /<table.*?>[\s\S]*?<\/table>/ig;
        }
        else {
            reg = new RegExp(arryFckKeepObjectsReg[i][1], "ig");
        }
        //alert(Content);
        //2>根据正则表达式，获取图片的所有内容，并且循环获得图片的内容
        while ((ar = reg.exec(Content)) != null) {
            //alert(ar[0]);
            arryFckKeepObjectsValue[TagIndex] = new Array();
            arryFckKeepObjectsValue[TagIndex][0] = "&&" + arryFckKeepObjectsReg[i][0] + CurrentTagIndex + "&&"; //保存标签\			
            arryFckKeepObjectsValue[TagIndex][1] = ar[0]; //保存内容					
            arryFckKeepObjectsValue[TagIndex][2] = arryFckKeepObjectsReg[i][2]; //保留对齐方式

            Temp = Temp + Content.substring(FromIndex, ar.index) + "&&" + arryFckKeepObjectsReg[i][0] + CurrentTagIndex + "&&";
            if (arryFckKeepObjectsReg[i][2] == "Fix") { Temp = Temp + "<p>"; }
            TagIndex = TagIndex + 1;
            CurrentTagIndex = CurrentTagIndex + 1;
            FromIndex = ar.lastIndex;
        }
        Temp = Temp + Content.substring(FromIndex);
        Content = Temp;
        //alert(Content);
    }
    //alert(Content);
    //5\返回HTML格式的字符串
    return Content;

}


//---------------------对齐文本---------------------------------------//
//参数：文本控件对象,模式：0代表普通文本输入框,1代表FCKeditor文本输入框,页面文本字数大小,是否增强版
function ContentAlignAndPager(objcontrolName, mode, pagesize, isStrong) {
    //1\获取Ueditor内容
    var baceContent = UE.getEditor('nsweditor').getContent();
    var newContent = "";
    $(baceContent).children().each(function (ii) {
        alert($(this).html());
        var tagName = $(this).get(0).tagName;
        alert(tagName);
        if (!(ii + 1) % 10) {

        } else {
            //            newContent
        }
    });

    //1\定义变量
//    var objcontrol, objcontrolText;
//    var pagercode;
//    var Temp = "";
//    objcontrol = FCKeditorAPI.GetInstance(objcontrolName);
//    var oDOM = objcontrol.EditorDocument;
////    pagercode = "<span>&nbsp;</span>";
//    pagercode = "<div style=\"PAGE-BREAK-AFTER: always\"><span style=\"DISPLAY: none\">&nbsp;<\/span><\/div>";

//    //2\对齐文本
//    ContentAlign(objcontrolName, mode)

//    //3\分页
//    objcontrolText = oDOM.body.innerHTML;

//    //1>删除原来的分页符
//    objcontrolText = objcontrolText.replace(/''/g, pagercode);

//    //2>计算文本的长度
//    //3>循环截取字符串的长度，后面添加分页符
//    //for (var i = 0; i < eval(objcontrolText.length / pagesize); i++) {
//    //    if (i > 0) {
//    //        Temp += "&nbsp; ";
//    //    }
//    //    Temp += objcontrolText.substr(i * pagesize, pagesize) + "<br><br>" + pagercode;
//    //}
//    //Temp = Temp.substr(0, Temp.length - pagercode.length);
//    //2>通过正则表达式，获取段落个数，并且通过段落劈开成数组
//    //alert(objcontrolText);
//    var ContentArray = objcontrolText.split("<BR><BR>");
//    //3>判断段落个数
//    //1-- 如果当前段落个数小于制定的段落，则不需要进行分页
//    if (ContentArray.length <= pagesize) {
//        Temp = objcontrolText;
//    }
//    else
//    //2-- 循环把指定段落的最后面增加分页符
//    {
//        for (iRow = 0; iRow < ContentArray.length; iRow++) {
//            Temp = Temp + ContentArray[iRow] + "<br><br>";
//            if (iRow > 0 && iRow % pagesize == 0) {
//                Temp = Temp + pagercode;
//            }
//        }
//    }

//    //4>结束
//    oDOM.body.innerHTML = Temp;

//    if (isStrong) {
//        if (isStrong == 1) {
//            objcontrol.Commands.GetCommand('Source').Execute();
//            objcontrol.Commands.GetCommand('Source').Execute();
//        }
//    }
}

//--------------------过滤字符串开头和尾巴的空格----------------------  
function StringTrim(string) {
    var FieldValue = string;
    var Blank = String.fromCharCode(32) + String.fromCharCode(32);
    //var Blank="aabb";
    var myArray = new Array;
    var ContentArray = FieldValue.split("\n");
    var TempString = "";
    var Block = "";
    //循环去掉空字符串
    for (iRow = 0; iRow < ContentArray.length; iRow++) {
        Block = ContentArray[iRow].replace(/^\s*|\s*$/g, '');
        Block = Block.replace(/　/g, '');
        Block = Block.replace(/ /g, '');
        //把空的段落内容去掉
        if (Block != "")
        { myArray.push(Blank + Block); }
    }
    //把字符串整理出来
    for (iRow = 0; iRow < myArray.length; iRow++) {
        TempString += myArray[iRow] + "\n\n";
    }
    return TempString;
}


function HTMLEncode(text) {
    text = text.replace(/;/g, "##59;");
    text = text.replace(/&/g, "&#38;");
    text = text.replace(/[*]/g, "&#42;");
    text = text.replace(/ /g, "&#32;");
    text = text.replace(/"/g, "&quot;");
    text = text.replace(/%/g, "&#37;");
    text = text.replace(/'/g, "&#39;");
    text = text.replace(/[+]/g, "&#43;");
    text = text.replace(/,/g, "&#44;");
    text = text.replace(/--/g, "&#45;&#45;");
    text = text.replace(/[\\]/g, "&#92;");
    text = text.replace(/[(]/g, "&#40;");
    text = text.replace(/[)]/g, "&#41;");
    text = text.replace(/</g, "&#60;");
    text = text.replace(/>/g, "&#62;");
    text = text.replace(/{/g, "&#123;");
    text = text.replace(/}/g, "&#125;");
    return text;
}

function HTMLDecode(text) {

    text = text.replace(/##59;/g, ";");
    text = text.replace(/&#38;/g, "&");
    text = text.replace(/&#42;/g, "*");
    text = text.replace(/&#32;/g, " ");
    text = text.replace(/&quot;/g, "\"");
    text = text.replace(/&#37;/g, "%");
    text = text.replace(/&#39;/g, "'");
    text = text.replace(/&#43;/g, "+");
    text = text.replace(/&#44;/g, ",");
    text = text.replace(/&#45;&#45;/g, "--");
    text = text.replace(/&#92;/g, "\\");
    text = text.replace(/&#40;/g, "(");
    text = text.replace(/&#41;/g, ")");
    text = text.replace(/&#60;/g, "<");
    text = text.replace(/&#62;/g, ">");
    text = text.replace(/&#123;/g, "{");
    text = text.replace(/&#125;/g, "}");
    text = text.replace(/&lt;/g, "<");
    text = text.replace(/&gt;/g, ">");
    return text;
}

function FildEnterCode(text) {
    return text;
}