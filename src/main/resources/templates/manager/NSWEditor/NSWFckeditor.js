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
function ContentAlign(objcontrolName, mode, editor) {
    var objcontrol;
    var objcontrolString;
    //获取保留内容的数组，并且采用标签技术在指定的位置放置替换的标志

    editor.html(FindObjects(editor.html()));


    editor.html(StringTrim(editor.text()));


    //循环替换标签的内容
    if (arryFckKeepObjectsValue != null && arryFckKeepObjectsValue.length >= 0) {
        //alert(arryPictures.length);
        var Temp = editor.html(); // oDOM.body.innerText;
        for (var i = 0; i < arryFckKeepObjectsValue.length; i++) {
            //1\查找图片标签变量

            //2\替换内容eval("/"+ch+"/ig");
            var reg = eval("/" + arryFckKeepObjectsValue[i][0] + "/ig");
            //alert(reg);
            //3\设置替换内容的对齐方式
            //alert(arryFckKeepObjectsValue[i][2]);
            if (arryFckKeepObjectsValue[i][2] == "None" || arryFckKeepObjectsValue[i][2] == "Fix") {
                Temp = Temp.replace(reg, arryFckKeepObjectsValue[i][1]);
            }
            else {
                Temp = Temp.replace(reg, "<p style=\"text-align:" + arryFckKeepObjectsValue[i][2] + ";\">" + arryFckKeepObjectsValue[i][1] + "</p>");
                Temp = Temp.replace("<TABLE", "<table align=" + arryFckKeepObjectsReg[4][2] + "");
            }
        }
        if (navigator.userAgent.indexOf("Firefox") > 0) {
            editor.text(Temp);
            editor.html(HTMLDecode(editor.html()));
            editor.html("<p>" + FildEnterCode(editor.html()) + "</p>");

        } else {
            //editor.text(Temp);
            //  document.writeln();
            editor.html("<p>" + Temp + "</p>");

        }

        //                oDOM.body.innerHTML = HTMLDecode(oDOM.body.innerHTML);
        //                oDOM.body.innerHTML = StringTrim(FildEnterCode(oDOM.body.innerHTML),1);
        //3\初始化变量
        //arryFckKeepObjectsValue=null;
    }
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
            arryFckKeepObjectsValue[TagIndex][0] = "-NSW-" + arryFckKeepObjectsReg[i][0] + CurrentTagIndex + "-NSW-"; //保存标签\			
            arryFckKeepObjectsValue[TagIndex][1] = ar[0]; //保存内容					
            arryFckKeepObjectsValue[TagIndex][2] = arryFckKeepObjectsReg[i][2]; //保留对齐方式

            Temp = Temp + Content.substring(FromIndex, ar.index) + "-NSW-" + arryFckKeepObjectsReg[i][0] + CurrentTagIndex + "-NSW-";
            if (arryFckKeepObjectsReg[i][2] == "Fix") { Temp = Temp + "<p>"; }
            TagIndex = TagIndex + 1;
            CurrentTagIndex = CurrentTagIndex + 1;
            FromIndex = ar.index+ar[0].length;
        }
        // Temp = Temp + Content.substring(FromIndex);
//        console.log(FromIndex);
//        console.log(Content.substring(FromIndex));
        Temp = Temp + Content.substring(FromIndex);
        Content = Temp;
        //alert(Content);
    }

    //alert(Content);
    //5\返回HTML格式的字符串
    return Content;

}

//--------------------过滤字符串开头和尾巴的空格----------------------  
function StringTrim(string, mode) {
    
    var FieldValue = string;
    var Blank = String.fromCharCode(32) + String.fromCharCode(32);
    //var Blank="aabb";
    var myArray = new Array;
    var ContentArray = FieldValue.split("\n");
    var TempString = "";
    var Block = "";
   
        //循环去掉空字符串
    for (iRow = 0; iRow < ContentArray.length; iRow++) {
        if (mode && mode == 1) {//model等于1 兼容ff处理操作
            Block = ContentArray[iRow];
        } else {
            Block = ContentArray[iRow].replace(/^\s*|\s*$/g, '');
            Block = Block.replace(/　/g, '');
            Block = Block.replace(/ /g, '');
        }
        //把空的段落内容去掉
        if (Block != "")
        { myArray.push(Blank + Block); }
    }

    //把字符串整理出来
   
    for (iRow = 0; iRow < myArray.length; iRow++) {
        if (mode&&mode==1) {//model等于1 兼容ff处理操作
            if (myArray.length - 1 == iRow) {
                TempString += myArray[iRow];
            } else {
                TempString += myArray[iRow] + "<br/>";
            }
        } else {
            TempString += myArray[iRow] + "<br/>";
        }
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

function AllinnerText(obj) {
    if (navigator.userAgent.indexOf("MSIE") > 0) {
        return obj.body.innerText;
    } else if (isFirefox = navigator.userAgent.indexOf("Firefox") > 0) {
        return obj.body.textContent;
    } else {
        return obj.body.innerText;
    }
}