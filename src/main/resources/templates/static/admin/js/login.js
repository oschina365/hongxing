layui.use(['form','layer','jquery'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer
        $ = layui.jquery;

    $(".loginBody .seraph").click(function(){
        layer.msg("这只是做个样式，至于功能，你见过哪个后台能这样登录的？还是老老实实的找管理员去注册吧",{
            time:5000
        });
    })

    //登录按钮
    form.on("submit(login)",function(data){
        var _that = this;
        $(_that).text("登录中...").attr("disabled","disabled").addClass("layui-disabled");
        let name = $("#username").val();
        let pwd = $("#password").val();
        let adminLoginCode = $("#adminLoginCode").val();
        $.ajax({
            url: '/captcha/check',
            type: 'get',
            data: {'key': 'adminVerifyCode', 'value': adminLoginCode},
            dataType: 'json',
            success: function (d) {
                if (d.code == 1) {
                    $.ajax({
                        url: '/admin/login',
                        type: 'post',
                        data: {'username': name, 'password': pwd},
                        dataType: 'json',
                        success: function (d) {
                            if (d.code == 1) {
                                window.sessionStorage.setItem("lockcms",false);
                                layer.msg(d.message ? d.message : "登录成功", {
                                    icon: 6,
                                    time: 1500
                                }, function () {
                                    window.location.href = "/admin/index";
                                });
                            } else {
                                layer.msg(d.message ? d.message : "登录失败", {icon: 5});
                                init(_that);
                            }
                        }
                    });
                } else {
                    layer.msg(d.message ? d.message : "请填写正确的验证码", {icon: 5});
                    init(_that);
                }
            }
        });
        return false;
    })

    function init(_that){
        setTimeout(function () {
            $(_that).text("登录").removeAttr("disabled").removeClass("layui-disabled");
        },1500);
    }

    //表单输入效果
    $(".loginBody .input-item").click(function(e){
        e.stopPropagation();
        $(this).addClass("layui-input-focus").find(".layui-input").focus();
    })
    $(".loginBody .layui-form-item .layui-input").focus(function(){
        $(this).parent().addClass("layui-input-focus");
    })
    $(".loginBody .layui-form-item .layui-input").blur(function(){
        $(this).parent().removeClass("layui-input-focus");
        if($(this).val() != ''){
            $(this).parent().addClass("layui-input-active");
        }else{
            $(this).parent().removeClass("layui-input-active");
        }
    })
})
