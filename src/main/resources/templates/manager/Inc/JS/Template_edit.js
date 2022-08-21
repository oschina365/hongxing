
///根据用户的选择，是Fckeditor进行资料录入还是TextBox资料录入
//参数
// mode
// 1代表Fckeditor
// 2代表TextBox
function ExchangeContentByMode(rad1name, rad2name) {
    //-1\定义变量
    var fckContent, txtContent;
    var fckContentValue, txtContentValue;
    var radFck, radText;
    var trFck, trText;
    var HidHead, HidEnd;
    var mode;

    //0\查找控件
//    fckContent = FCKeditorAPI.GetInstance("fckContent");
    txtContent = document.getElementById("txtContent");
    HidHead = document.getElementById("HidHead");
    HidEnd = document.getElementById("HidEnd");

    trFck = document.getElementById("trFck");
    trText = document.getElementById("trText");


    radFck = document.getElementById(rad1name);
    radText = document.getElementById(rad2name);
    if (radFck.checked == true) { mode = 1; }
    if (radText.checked == true) { mode = 2; }

//    try {

//        //1\如果当前选择为Fck录入框，则把Textbox里面的内容赋值到Fck录入框并显示出来
//        if (mode == 1) {

//            if ($("#trFck").css("display") == "none") {
//                SetFckContent(txtContent.value);
//                txtContent.value = "";
//            }
//        }


        //2\如果当前选择为TextBox，则把Fck里面的内容赋值到TextBox录入框并显示出来
//        else {
            if ($("trText").css("display") == "none") {
                if (HidHead.value.length > 0) {
                    txtContent.value = HidHead.value + "\r\n";
                }
                if ($.browser.msie) val = $.trim(fckContent.EditorDocument.body.innerText); // ie
                else if ($.browser.mozilla) val = $.trim($(fckContent.EditorDocument.body).text()); //ff
                    txtContent.value += val;
                if (HidEnd.value.length > 0) {
                    txtContent.value += "\r\n" + HidEnd.value;
                }
//                fckContent.SetHTML("");
            }
//        }

        //3\切换内容
//        IniPageTable(mode);
//        setFrameHeight('frmEditor', 'body');
//    }
//    catch (err) {
//        ;
//    }
}

///根据用户的选择，是Fckeditor进行资料录入还是TextBox资料录入,显示不同的内容
//参数
// mode
// 1代表Fckeditor
// 2代表TextBox
function ShowContent(rad1name, rad2name, Content) {

    //-1\定义变量
    var fckContent, txtContent;
    var fckContentValue, txtContentValue;
    var radFck, radText;
    var mode;


    //0\查找控件
//    fckContent = FCKeditorAPI.GetInstance("fckContent");
    txtContent = document.getElementById("txtContent");
    radFck = document.getElementById(rad1name);
    radText = document.getElementById(rad2name);
    if (radFck.checked == true) { mode = 1; }
    if (radText.checked == true) { mode = 2; }

//    try {

//        //1\如果当前选择为Fck录入框，则把Textbox里面的内容赋值到Fck录入框并显示出来
//        if (mode == 1) {
//            SetFckContent(Content);
//        }


//        //2\如果当前选择为TextBox，则把Fck里面的内容赋值到TextBox录入框并显示出来
//        else {
            txtContent.value = Content;
//        }

        //3\切换内容
//    }
//    catch (err) {
//        ;
//    }

}

/// <summary>
/// 设置Fck里面的内容，把头头尾尾的内容全部分离出来
/// </summary>
/// <param name="Content"></param>
function SetFckContent(Content) {
    return;
    //1\定义变量
    var BodyStartString, BodyEndString;
    var BodyStartPlace, BodyEndPlace;
    var HidHead, HidEnd, fckContent;
    var HidHeadString, HidEndString;

    //2\设置变量值
    BodyStartString = "";
    BodyEndString = "</body>";
    HidHeadString = "";
    HidEndString = "";
    BodyStartPlace = -1;
    BodyEndPlace = -1;
    BodyStartPlace = Content.indexOf(BodyStartString);


    fckContent = FCKeditorAPI.GetInstance("fckContent");
    HidHead = document.getElementById("HidHead");
    HidEnd = document.getElementById("HidEnd");

    //3\截取Body头部以上部分存放到HidHead里面

    //1--通过正则表达式查找<body xxxxxx>整个字符串的内容
    var reg = new RegExp("<body\\s+(.*)>", "i");
    var rs = reg.exec(Content); //---------------------------存在问题                
    if (rs != null) {
        BodyStartString = rs[0];
        //2--查找字符串的位置
        if (BodyStartString.length > 0) {
            BodyStartPlace = Content.indexOf(BodyStartString);
            if (BodyStartPlace > -1) {
                HidHead.value = Content.substring(0, BodyStartPlace + BodyStartString.length);
            }
        }
        else {
            HidHead.value = "";
        }
    }
    else {
        HidHead.value = "";
    }

    BodyEndPlace = Content.toLocaleString().indexOf(BodyEndString);
    //4\截取Body尾部以下部分存放到HidEnd里面
    if (BodyEndPlace > -1) {
        HidEnd.value = Content.substring(BodyEndPlace);
    }
    else {
        HidEnd.value = "";
    }

    //5\截取中间存放到Fck里面
    fckContent.SetHTML(Content);


    //6\结束

}

///根据用户的选择，是Fckeditor进行资料录入还是TextBox资料录入,显示相关的表格内容
//参数
// mode
// 1代表Fckeditor
// 2代表TextBox
function IniPageTable(mode) {

    //1\页面第一次加载，不会显示太多内容
    if (mode < 0) {
        $("#trPhoto").css("display", "none");
        $("#trFilePath").css("display", "none");
        $("#trShortDesc").css("display", "none");
        $("#trDetailTitle").css("display", "none");
        $("#trFckHelp").css("display", "none");
        $("#trFck").css("display", "none");
        $("#trText").css("display", "none");
    }
    else {
        if (mode == 1)
        //2\如果当前模式属于Fck编辑器模式，则显示如下内容
        {
            $("#trFckHelp").css("display", "");
            $("#trFck").css("display", "");
            $("#trText").css("display", "none");

        }
        //3\如果当前模式属于TextBox编辑器模式，则显示如下内容
        else if (mode == 2) {
            $("#trFckHelp").css("display", "none");
            $("#trFck").css("display", "none");
            //trText.style.display = "table-row";  alert(trText.style.display);               
            $("#trText").css("display", "");
        }
        //trPhoto.style.display = "table-row";
        $("#trPhoto").css("display", "");
        $("#trFilePath").css("display", "");
        $("#trShortDesc").css("display", "");
        $("#trDetailTitle").css("display", "");
        //alert($("#trPhoto").css("display"));
        //trFilePath.style.display = "table-row";
        //trShortDesc.style.display = "table-row";
        //trDetailTitle.style.display = "table-row";
    }
    //4\结束
}

///显示加载按钮
function ShowLoadingBtn(txt,btnName)
{
    //1\定义变量
    var btn;
    
    //2\设置变量值
    
    
    //3\查找控件
    btn=document.getElementById(btnName);
    
    //4\逻辑开始
    
    
        //1--如果录入框没有内容，则把加载按钮隐藏
        if(txt.value.length==0)
        {
            btn.style.display="none";
        }
        else
        //2--否则显示加载按钮
        {
            btn.style.display="block";
        }
}


//给Fck录入框里面增加辅助样式表
function SetCss()
{
    //1\定义变量
    var cssValue;
    //1\定义变量
    var StartValue,EndValue;
    var StartPlace,EndPlace;
    var FckValue;
    var FrontString,EndString;
    
    //2\设置变量值
    var objcontrol=FCKeditorAPI.GetInstance("fckContent");
    FckValue=objcontrol.GetXHTML(true);
    StartValue="<!-- 以下为辅助样式表,保存之前请删除-->";
    EndValue="<!-- 以上为辅助样式表,保存之前请删除-->";

    cssValue=document.getElementById("cssTemplate").value;
    //3\用户操作
    StartPlace=FckValue.indexOf(StartValue);
    EndPlace=FckValue.indexOf(EndValue);
    if(StartPlace>-1&&EndPlace>-1)    
    {
        alert("辅助样式表已经添加成功，请不要重复添加。");
    }
    else
    {

        //1-- 获取样式表模板的内容
        //2-- 把此内容赋值到Fck录入框里面
        objcontrol.SetHTML(cssValue+objcontrol.GetXHTML(true));
        
        
        //3-- 重新刷新录入框
    }
}

//删除Fck录入框里面里面的辅助样式表
function DelCss()
{
    //1\定义变量
    var StartValue,EndValue;
    var StartPlace,EndPlace;
    var FckValue;
    var FrontString,EndString;
    
    //2\设置变量值
    var objcontrol=FCKeditorAPI.GetInstance("fckContent");
    FckValue=objcontrol.GetXHTML(true);
    StartValue="<!-- 以下为辅助样式表,保存之前请删除-->";
    EndValue="<!-- 以上为辅助样式表,保存之前请删除-->";
    
    //3\用户操作
    
    
        //1-- 获取样式表模板的内容
        StartPlace=FckValue.indexOf(StartValue);
    if(StartPlace>-1)    
    {
        FrontString=FckValue.substring(0,StartPlace);
        EndPlace=FckValue.indexOf(EndValue);
        if(EndPlace>-1)
        {
            EndString=FckValue.substring(EndPlace+EndValue.length,FckValue.length);        
            
            //2-- 把此内容赋值到Fck录入框里面
            objcontrol.SetHTML(FrontString+EndString);
        }
        else
        {
            alert("辅助样式表清除失败，请检查是否包含辅助样式表。");
        }
     } 
    else
    {
        alert("辅助样式表清除失败，请检查是否包含辅助样式表。");
    }
        
        //3-- 重新刷新录入框

}