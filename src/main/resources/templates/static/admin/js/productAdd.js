layui.use(['form', 'layer', 'layedit', 'laydate', 'upload', 'transfer'], function () {
    var form = layui.form
    layer = parent.layer === undefined ? layui.layer : top.layer,
        laypage = layui.laypage,
        upload = layui.upload,
        layedit = layui.layedit,
        laydate = layui.laydate,
        transfer = layui.transfer,
        $ = layui.jquery;

    var productId = $("#productId").val();
    init();
    var categoryList;
    var selectCategoryIds = [];

    async function init() {
        $.ajax({
            url: '/admin/product/category',
            method: 'post',
            dataType: 'json',
            success: function (data) {
                console.log(data);
                if (data && data.code == 1) {
                    categoryList = data.result.categoryList;
                    //初始右侧数据
                    transfer.render({
                        elem: '#test3'
                        , data: categoryList
                        , value: []
                        , id: 'selectCategoryIds'
                        , showSearch: true
                        , title: ['产品分类', '已选分类']
                        , onchange: function (obj, index) {
                            var choose = $(".layui-transfer-box")[1];
                            var lis = $(choose).find("ul>li");
                            selectCategoryIds = [];
                            for (var i = 0; i < lis.length; i++) {
                                var li = lis[i];
                                console.log(li);
                                selectCategoryIds.push($(li)[0].firstChild.value)
                            }
                        }
                    })
                }
            }
        });
    }

    //用于同步编辑器内容到textarea
    layedit.sync(editIndex);

    //上传缩略图
    upload.render({
        elem: '.thumbBox',
        url: '/up/lay?type=product',
        method: "get",  //此处是为了演示之用，实际使用中请将此删除，默认用post方式提交
        done: function (res, index, upload) {
            $('.thumbImg').attr('src', res.key);
            $('.thumbBox').css("background", "#fff");
        }
    });


    //格式化时间
    function filterTime(val) {
        if (val < 10) {
            return "0" + val;
        } else {
            return val;
        }
    }

    //定时发布
    var time = new Date();
    var submitTime = time.getFullYear() + '-' + filterTime(time.getMonth() + 1) + '-' + filterTime(time.getDate()) + ' ' + filterTime(time.getHours()) + ':' + filterTime(time.getMinutes()) + ':' + filterTime(time.getSeconds());
    laydate.render({
        elem: '#release',
        type: 'datetime',
        trigger: "click",
        done: function (value, date, endDate) {
            submitTime = value;
        }
    });
    form.on("radio(release)", function (data) {
        if (data.elem.title == "定时发布") {
            $(".releaseDate").removeClass("layui-hide");
            $(".releaseDate #release").attr("lay-verify", "required");
        } else {
            $(".releaseDate").addClass("layui-hide");
            $(".releaseDate #release").removeAttr("lay-verify");
            submitTime = time.getFullYear() + '-' + (time.getMonth() + 1) + '-' + time.getDate() + ' ' + time.getHours() + ':' + time.getMinutes() + ':' + time.getSeconds();
        }
    });

    form.on("submit(addProduct)", function (data) {
        console.log(data);
        //截取文章内容中的一部分文字放入文章摘要
        //弹出loading
        if (selectCategoryIds.length == 0) {
            var choose = $(".layui-transfer-box")[1];
            var lis = $(choose).find("ul>li");
            selectCategoryIds = [];
            for (var i = 0; i < lis.length; i++) {
                var li = lis[i];
                console.log(li);
                selectCategoryIds.push($(li)[0].firstChild.value)
            }
            if (selectCategoryIds.length == 0) {
                layer.alert('请选择产品分类');
                return false;
            }
        }
        if (selectCategoryIds.length > 5) {
            layer.alert('最多关联5个分类');
        }
        $.post("/admin/product/edit", {
            name: $(".productName").val(),  //文章标题
            desc: $(".productDesc").val(),  //文章摘要
            content: layedit.getContent(editIndex).split('<audio controls="controls" style="display: none;"></audio>')[0],  //文章内容
            banner: $(".thumbImg").attr("src"),  //缩略图
            selectCategoryIds: selectCategoryIds
        }, function (res) {
            if(res && res.code==1){
                layer.msg("添加产品成功~",{icon:6});
                setTimeout(function(){
                    layer.closeAll("iframe");
                    //刷新父页面
                    parent.location.reload();
                    window.location.href="/admin/page/product/index.html";
                },500);
            }else{
                layer.msg(res.message?res.message:"保存失败~",{icon:5});
            }

        })
        return false;
    })

    //创建一个编辑器
    var editIndex = layedit.build('product_content', {
        height: 535,
        uploadImage: {
            url: "../../json/newsImg.json"
        }
    });

})