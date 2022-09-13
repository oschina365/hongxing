layui.use(['form', 'layer', 'laydate', 'table', 'laytpl','layedit'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        layedit = layui.layedit,
        table = layui.table;

    //案例列表
    var tableIns = table.render({
        elem: '#articleList',
        url: "/admin/category?type=2",
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limit: 20,
        limits: [10, 15, 20, 25],
        id: "articleCategoryListTable",
        cols: [[
            {type: "checkbox", fixed: "left", width: 50},
            {field: 'id', title: 'ID', width: 60, align: "center"},
            {field: 'name', title: '分类名称', width: 200},
            {field: 'parent_category_name', title: '上级分类', align: 'center'},
            {field: 'create_time', title: '录入时间', align: 'center'}
           /* {title: '操作', width: 140, templet: '#articleListBar', fixed: "right", align: "center"}*/
        ]]
    });

    //是否置顶
    form.on('switch(articleTop)', function (data) {
        var index = layer.msg('修改中，请稍候', {icon: 16, time: false, shade: 0.8});
        setTimeout(function () {
            layer.close(index);
            if (data.elem.checked) {
                layer.msg("置顶成功！");
            } else {
                layer.msg("取消置顶成功！");
            }
        }, 500);
    })

    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click", function () {
        if ($(".searchVal").val() != '') {
            table.reload("articleCategoryListTable", {
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    name: $(".searchVal").val()  //搜索的关键字
                }
            })
        } else {
            layer.msg("请输入搜索的内容");
        }
    });

    function edit(data){
        console.log(data);
        var index = layer.open({
            title: "编辑案例",
            type: 2,
            area: ['100%', '100%'],
            content: "/admin/article/" + data.id,
            success: function (layero, index) {

            }
        })
    }

    //添加案例
    function addNews(edit) {
        console.log(edit);
        var index = layui.layer.open({
            title: "添加案例",
            type: 2,
            content: "add.html",
            success: function (layero, index) {
                var body = layui.layer.getChildFrame('body', index);
                if (edit) {
                    body.find(".articleName").val(edit.name);  //登录名
                    body.find(".articleDesc").val(edit.desc);  //邮箱
                    body.find(".article_content").val(111111111);  //邮箱
                    layedit.build('article_content');  //渲染 build
                    body.find(".userSex input[value=" + edit.userSex + "]").prop("checked", "checked");  //性别
                    body.find(".userGrade").val(edit.userGrade);  //会员等级
                    body.find(".userStatus").val(edit.userStatus);    //用户状态
                    body.find(".userDesc").text(edit.userDesc);    //用户简介
                    form.render();
                }
                setTimeout(function () {
                    layui.layer.tips('点击此处返回用户列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                }, 500)
            }
        })
        layui.layer.full(index);
        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize", function () {
            layui.layer.full(index);
        })
    }

    $(".addNews_btn").click(function () {
        addNews();
    })

    //批量删除
    $(".delAll_btn").click(function () {
        var checkStatus = table.checkStatus('articleCategoryListTable'),
            data = checkStatus.data,
            newsId = [];
        if (data.length > 0) {
            for (let i in data) {
                newsId.push(data[i].newsId);
            }
            layer.confirm('确定删除选中的分类？', {icon: 3, title: '提示信息'}, function (index) {
                // $.get("删除分类接口",{
                //     newsId : newsId  //将需要删除的newsId作为参数传入
                // },function(data){
                tableIns.reload();
                layer.close(index);
                // })
            })
        } else {
            layer.msg("请选择需要删除的分类");
        }
    })

    //列表操作
    table.on('tool(articleList)', function (obj) {
        var layEvent = obj.event,
            data = obj.data;

        if (layEvent === 'edit') { //编辑
            edit(data);
        } else if (layEvent === 'del') { //删除
            layer.confirm('确定删除此分类？', {icon: 3, title: '提示信息'}, function (index) {
                console.log(data.id);
                // $.get("删除分类接口",{
                //     newsId : data.newsId  //将需要删除的newsId作为参数传入
                // },function(data){
                tableIns.reload();
                layer.close(index);
                // })
            });
        } else if (layEvent === 'look') { //预览
            layer.alert("此功能需要前台展示，实际开发中传入对应的必要参数进行分类内容页面访问")
        }
    });

})