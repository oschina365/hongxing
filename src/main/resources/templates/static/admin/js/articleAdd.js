layui.use(['form', 'layer', 'layedit', 'laydate', 'upload', 'transfer'], function () {
    var form = layui.form
    layer = parent.layer === undefined ? layui.layer : top.layer,
        laypage = layui.laypage,
        upload = layui.upload,
        layedit = layui.layedit,
        laydate = layui.laydate,
        transfer = layui.transfer,
        $ = layui.jquery;

    layui.form.render();

    ['showFolderIcon', 'showLine', 'strict', 'simple'].forEach(function(key){
        layui.form.on('checkbox('+key+')', function(data){
            var treeConfig = {};
            treeConfig[key] = data.elem.checked;
            demo1.update({
                tree: treeConfig
            })
        });
    })

//控制显示父节点的图标
    layui.form.on('checkbox(hidden)', function(data){
        demo1.update({
            iconfont: {
                parent: data.elem.checked ? 'hidden' : '',
            }
        })
    });

//自定义图标
    layui.form.on('checkbox(custom)', function(data){
        let iconfont = data.elem.checked ? {
            select: 'layui-icon layui-icon-chart',
            unselect: 'layui-icon-ok-circle',
            half: 'layui-icon layui-icon-table',
            parent: 'layui-icon layui-icon-survey',
        } : {
            select: '',
            unselect: '',
            half: '',
            parent: '',
        }
        demo1.update({
            iconfont: iconfont
        })
        layui.form.render();
    });

//展开所有节点
    layui.form.on('checkbox(all)', function(data){
        if(data.elem.checked){
            demo1.changeExpandedKeys(true)
        }
    });

//闭合所有节点
    layui.form.on('checkbox(close)', function(data){
        if(data.elem.checked){
            demo1.changeExpandedKeys(false)
        }
    });

//展开指定节点
    layui.form.on('checkbox(key3)', function(data){
        if(data.elem.checked){
            demo1.changeExpandedKeys([ -3 ])
        }
    });

    layui.form.on('checkbox(clickExpand)', function(data){
        demo1.update({
            tree: {
                clickExpand: data.elem.checked
            }
        })
    });

    layui.form.on('checkbox(clickCheck)', function(data){
        demo1.update({
            tree: {
                clickCheck: data.elem.checked
            }
        })
    });

    var demo1 = xmSelect.render({
        el: '#demo1',
        autoRow: true,
        filterable: true,
        /*tree: {
            show: true,
            showFolderIcon: true,
            showLine: true,
            indent: 20,
            expandedKeys: [ -3 ],
        },*/
        cascader:{
            show: true,
            indent : 150
        },
        toolbar: {
            show: true,
            list: ['ALL', 'REVERSE', 'CLEAR']
        },
        filterable: true,
        paging: true,
        pageSize: 1,
        height: 'auto',
        data: []
    })

    var articleId = $("#articleId").val();
    init();
    var categoryList;
    var selectCategoryIds = [];

    async function init() {
        $.ajax({
            url: '/admin/article/xm/category',
            method: 'post',
            dataType: 'json',
            success: function (data) {
                console.log(data);
                if (data && data.code == 1) {
                    categoryList = data.result.categoryList;
                    //初始右侧数据
                   /* transfer.render({
                        elem: '#test3'
                        , data: categoryList
                        , value: []
                        , id: 'selectCategoryIds'
                        , showSearch: true
                        , title: ['案例分类', '已选分类']
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
                    })*/
                    demo1.update({
                        data: categoryList
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
        url: '/up/lay?type=article',
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

    form.on("submit(addarticle)", function (data) {
        console.log(data);
        //截取文章内容中的一部分文字放入文章摘要
        //弹出loading
        /*if (selectCategoryIds.length == 0) {
            var choose = $(".layui-transfer-box")[1];
            var lis = $(choose).find("ul>li");
            selectCategoryIds = [];
            for (var i = 0; i < lis.length; i++) {
                var li = lis[i];
                console.log(li);
                selectCategoryIds.push($(li)[0].firstChild.value)
            }
            if (selectCategoryIds.length == 0) {
                layer.alert('请选择案例分类');
                return false;
            }
        }
        if (selectCategoryIds.length > 5) {
            layer.alert('最多关联5个分类');
        }*/
        $.post("/admin/article/edit", {
            name: $(".articleName").val(),  //文章标题
            desc: $(".articleDesc").val(),  //文章摘要
            content: layedit.getContent(editIndex).split('<audio controls="controls" style="display: none;"></audio>')[0],  //文章内容
            banner: $(".thumbImg").attr("src"),  //缩略图
            selectCategoryIds: selectCategoryIds
        }, function (res) {
            if(res && res.code==1){
                layer.msg("编辑案例成功~",{icon:6});
                setTimeout(function(){
                    layer.closeAll("iframe");
                    //刷新父页面
                    parent.location.reload();
                    window.location.href="/admin/page/article/index.html";
                },500);
            }else{
                layer.msg(res.message?res.message:"保存失败~",{icon:5});
            }

        })
        return false;
    })

    //创建一个编辑器
    var editIndex = layedit.build('article_content', {
        height: 535,
        uploadImage: {
            url: "../../json/newsImg.json"
        }
    });

})