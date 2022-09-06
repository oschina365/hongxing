/******************************************************************************
* filename: Register.js
* Register Modul Scripting
* (C) MasterLi(masterljf#hotmail.com),Oran Day(likecode#qq.com)
* (C) NSW(http://www.nsw88.com)
*******************************************************************************/
SKIN_PATH = "/skins/default/";
function checkEmail(src, fmtOnly) {
    if (fmtOnly == null)
        fmtOnly = false;
 
    var jIcoOk = $j("imgEmOks").hide();
    var jIcoErr = $j("imgEmErr").show();
    var jO2 = $j("spEmailMsg2").hide();
    var jO = $j("spEmailMsg").show();

    var _email = $.trim($(src).val());
    var ptn = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
    if (_email.length == 0) {
        jO.html("E-Mail 不可为空");
        return false;
    }
    if (!ptn.test(_email)) {
        jO.html("E-Mail 格式错误");
        return false;
    }

    jIcoOk.hide();
    jO2.hide();
    jIcoErr.hide();
    jO.hide();
    if (fmtOnly)
        return true;
        
      
    $.post("/ajax.ashx?action=checkemail&t=" + Math.random(), { email: _email }, function(msg) {
    
        if (msg == "1") {
        jO2.html("对不起," + _email + " 已存在。").css({ color: "red", fontSize: "12px", fontWeight: "bold" }).show(); 
            //jO.html("对不起," + _email + " 已存在，请换其它 E-Mail。", "spMsgEmail").css({ color: "red", fontSize: "12px",display:"inline", fontWeight: "bold" }).show();
            jIcoErr.show();
            return false;
        } else if (msg == "0") {
       
        jO2.html("恭喜您," + _email + " 可用。").css({ color: "#2971C1", fontSize: "12px", fontWeight: "bold" }).show(); 
            //jO2.html("恭喜您," + _email + " 可用。", "spMsgEmail", "spMsgEmail").css({ color: "#2971C1", fontSize: "12px",display:"inline", fontWeight: "bold" }).show();
            jIcoOk.show();
            return true;
        }
//        else {
//            jO.hide();
//            $a(msg, "spMsgEmail");
//            return false;
//        }
    });
   
    return true;
}
function checkMobile(src) {
 
    var jO = $j("img1").hide(); 
    var j2 = $j("img2").hide();
    var val = src.value;
    
    var partten = /^1\d{10}$/;
     if (!partten.test(val)) { 
     
      j2.hide();
        jO.show();
        return false;
    } else {
    
    j2.show();
        jO.hide();
        return true;
    }
   
}

 

/********************
* 检查用户名
* src : 触发事件的源对象
* fmtOnly : (可选)是否只检查格式默认为false
********************/
function checkUsername(src, fmtOnly) {
    if (fmtOnly == null)
        fmtOnly == false;

    var jIcoOk = $j("imgUnOks").hide();
    var jO2 = $j("spUsernameMsg2").hide();
    var jIcoErr = $j("imgUnErr").show();
    var jO = $j("spUsernameMsg").show();
    var _email = $.trim($(src).val());
    var ptn = /\w{6,20}/;
    
     var name = $j("txtUsername").val();
   var reg=/[^\u4E00-\u9FA5]/g;//中文 
  var reg2=/[\W]/g;          
  var regs=/^\s*$/;      
  if(regs.test(name)) { 
            jIcoErr.show();
            return false;
    }  
     var Regx = /^[A-Za-z0-9]*$/;   //英文和数字
      
     
  if (Regx.test(name)&&name.length<4) 
  { 
       jO2.html("英文名称必须在4到16位之间。").css({ color: "red", fontSize: "12px", fontWeight: "bold" }).show(); 
       jIcoErr.show();
       jIcoOk.hide();
       return false;  
    }
            
    if ((!reg.test(name)&&name.length<2)||(!reg.test(name)&&name.length>8))     
    {
            jO2.html("中文长度必须在2到8位之间。").css({ color: "red", fontSize: "12px", fontWeight: "bold" }).show(); 
            jIcoErr.show();jIcoOk.hide();
            return false;  
    } 
    else
    { 
    jIcoOk.hide();
    jO2.hide();
    jIcoErr.hide();
    jO.hide();
    if (fmtOnly)
        return true;
    $.post("/ajax.ashx?action=checkusername&t=" + Math.random(), { username: _email }, function(msg) { 
         if(msg == "1")
        {  
                jO2.html("对不起," + _email + " 已存在。").css({ color: "red", fontSize: "12px", fontWeight: "bold" }).show();
                jIcoErr.show();
                return false; 
        }
        else if (msg == "0")
         {  
            jO2.html("恭喜您," + _email + " 可用。").css({ color: "#2971C1", fontSize: "12px", fontWeight: "bold" }).show();
            jIcoOk.show();
            return true;  
        }
        else {
            jO2.hide();
            $a(msg);
            return false;
        }
   });
    return true;
    }
}
function checkPin(src) {
    var jIcoOk = $j("imgPwdOk").hide();
    var jIcoErr = $j("imgPwdErr").show();
    var jO = $j("msgPin");
    var pin = src.value;
    var ptn = /.{6,16}/;
    if (pin.length == 0) {
        jO.html("密码不可为空").show();
        return false;
    } else if (pin == "" || !ptn.test(pin)) {
        jO.html("密码长度必须为6到16位").show();
        return false;
    } else {
        jIcoOk.show();
        jIcoErr.hide();
        jO.hide();
        return true;
    }
}
function checkConfirmPin(src) {
    var jIcoOk = $j("imgCPwdOk").hide();
    var jIcoErr = $j("imgCPwdErr").show();
    var jO = $j("msgConfirmPin");
    var pin = $v("txtPin");
    var cPin = src.value;
    if (pin != cPin) {
        jO.html("两次密码不一致").show();
        return false;
    } else if (cPin.length > 0 && pin == cPin) {
        jIcoOk.show();
        jIcoErr.hide();
        jO.hide();
        return true;
    }
}
function checkSecQus(src) {
    var jO = $j("msgSecQus");
    var val = src.value;
    if (val.length == 0) {
        jO.html("安全提问问题不可为空").show();
        return false;
    } else {
        jO.html("<img src='img/ok.gif' alt='格式正确' />").show();
        return true;
    }
}
function checkSecAsr(src) {
    var jO = $j("msgSecAsr").show();
    var val = src.value;
    if (val.length == 0) {
        jO.html("安全提问答案不可为空");
        return false;
    } else {
        jO.hide();
        return true;
    }
}
function checkVerCode(src) {
    var jIcoOk = $j("imgVcOk").hide();
    var jIcoErr = $j("imgVcErr").show();
    var jO = $j("msgVerCode");
    var val = src.value;
    if (val.length == 0) {
        jO.html("验证码不可为空");
        return false;
    } else {
        jO.hide();
        jIcoOk.show();
        jIcoErr.hide();
        return true;
    }
}
function checkD(src, msgElmId) {
    var jO = $j(msgElmId);
    var val = src.value;
    var ptn = /^\d*$/;
    if (val.length > 0 && !ptn.test(val)) {
        jO.html("格式错误，必须为纯数字").addClass("reg_err").show();
        return false;
    } else {
        jO.removeClass("error").html("<img src='img/ok.gif' alt='格式正确' />").show();
        return true;
    }
}

function checkZipCode(src) {
    var jO = $j("msgZipCode").show();
    var val = src.value;
    var ptn = /^\d{6}$/;
    if (val.length > 0 && !ptn.test(val)) {
        jO.html("格式错误");
        return false;
    } else {
        jO.hide();
        return true;
    }
}
function checkTel(src) {
    var jO = $j("msgTel").show();
    var val = src.value;
    var ptn = /^\d{3,4}-\d{7,8}(-\d{1,5})?$/;
    if (val.length > 0 && !ptn.test(val)) {
        jO.html("格式错误");
        return false;
    } else {
        jO.hide();
        return true;
    }
}
function checkFax(src) {
    var jO = $j("msgFax").show();
    var val = src.value;
    var ptn = /^\d{3,4}-\d{7,8}(-\d{1,5})?$/;
    if (val.length > 0 && !ptn.test(val)) {
        jO.html("格式错误");
        return false;
    } else {
        jO.hide();
        return true;
    }
}
function signUp(src) {
 

    showBgProc(true, "正在注册，请稍候...");
    var b1 = checkEmail($g("txtEmail"), true);
    var b2 = checkUsername($g("txtUsername"), true);
    var b3 = checkPin($g("txtPin"));
    var b4 = checkConfirmPin($g("txtConfirmPin"));
    //    var b5 = checkSecQus($g("txtSecQus"));
    //    var b6 = checkSecAsr($g("txtSecAsr"));
    var b8 = checkMobile($g("txtMobile"));
    var b9 = checkTel($g("txtTel"));
    var b10 = checkFax($g("txtFax"));
    var b11 = checkZipCode($g("txtZipCode"));



    if (b1 && b2 && b3 && b4 && b8 && b9 && b10 && b11) {
        if (!$j('chkAgreed').attr('checked')) {
            $a('您必须同意本站会员注册协议才能注册成为会员', 2);
            showBgProc(false);
            return false;
        }

        var s_username = $tv("txtUsername");
        var s_pin = $tv("txtPin");
        var s_email = $tv("txtEmail");
        var s_verCode = $tv("txtVerCode");
        var s_secQus = $tv("txtSecQus");
        var s_secAsr = $tv("txtSecAsr");
        var s_realName = $v("txtRealName");
        var s_sex = getChecked("rdoMale") ? "1" : getChecked("rdoFemale") ? "0" : "-1";
        var s_birth = $tv("txtBirth");
        var s_edu = $tv("ddlEducational");
        var s_compName = $tv("txtCompName");
        var s_industry = $tv("ddlIndustry");
        var s_position = $tv("ddlPositions");
        var s_mobile = $tv("txtMobile");
        var s_tel = $tv("txtTel");
        var s_fax = $tv("txtFax");
        var s_province =document.getElementById("region1_hdnPrtRegion").value;
        var s_city =document.getElementById("region1_ddlChdRegions").value  
        
        var s_zipCode = $tv("txtZipCode");
        var s_addr = $tv("txtAddr");
        var s_hobby = $tv("txtHobby");
        var s_code = $qs("code");
        
        
        var usergroupid="";
        var objs = document.getElementsByName("stfgroup");
        for(var i=0; i<objs.length; i++)
        {
            if(objs[i].tagName.toLowerCase()=='input' && objs[i].checked)
            {
                usergroupid=objs[i].value;
            } 
        } 
        
 
         
        $.post("/ajax.ashx?action=register&t=" + Math.random(), {
            _username: s_username,
            _pin: s_pin,
            _email: s_email,
            _verCode: s_verCode,

            _secQus: s_secQus,
            _secAsr: s_secAsr,
            _realName: s_realName,
            _sex: s_sex,
            _birth: s_birth,

            _edu: s_edu,
            _compName: s_compName,
            _industry: s_industry,
            _position: s_position,

            _mobile: s_mobile,
            _tel: s_tel,
            _fax: s_fax,
            _province: s_province,
            _city: s_city,

            _zipCode: s_zipCode,
            _addr: s_addr,
            _hobby: s_hobby,
            _code: s_code ,
            usergroupid:usergroupid
            
            
            
            
        }, function(msg) {
            if (gav(msg, "state") == "1") {
                $j("registerNotify").html(gav(msg, "msg"));
                $j("divForm").slideUp(80);
                $j("divNotify").slideDown(80);
                $j("spNotifyUsername").html(gav(msg, "username"));
                $j("spNotifyEmail").html(gav(msg, "email"));
                $j("divNotify").find(".user_left").height($j("divNotify").find(".u_right_main").height());
            } else {
                $a(gav(msg, "msg"));
            }
            showBgProc(false);
        });
    } else {
        $a("表单填写不完整或格式错误，请检查并重新填写。", 2);
        showBgProc(false);
    }
}