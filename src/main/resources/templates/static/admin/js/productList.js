layui.use(['form', 'layer', 'laydate', 'table', 'laytpl','layedit'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        layedit = layui.layedit,
        table = layui.table;

    //产品列表
    var tableIns = table.render({
        elem: '#productList',
        url: "/admin/product",
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limit: 20,
        limits: [10, 20, 50,100],
        id: "productListTable",
        cols: [[
            {type: "checkbox", fixed: "left", width: 50},
            {field: 'id', title: 'ID', width: 60, align: "center"},
            {
                field: 'banner', title: '缩略图', align: 'center', templet: function (d) {
                    return '<img src="'+d.banner+'">'
                }
            },
            {field: 'name', title: '产品名称', width: 200},
            {field: 'all_category_name', title: '所属分类', align: 'center'},
            {
                field: 'top', title: '是否置顶', align: 'center', templet: function (d) {
                    return '<input type="checkbox" name="newsTop" lay-filter="productTop" lay-skin="switch" lay-text="是|否" ' + d.top + '>'
                }
            },
            {
                field: 'cream', title: '是否精华', align: 'center', templet: function (d) {
                    return '<input type="checkbox" name="newsTop" lay-filter="productCream" lay-skin="switch" lay-text="是|否" ' + d.cream + '>'
                }
            },
            {
                field: 'recomm', title: '是否推荐', align: 'center', templet: function (d) {
                    return '<input type="checkbox" name="newsTop" lay-filter="productRecomm" lay-skin="switch" lay-text="是|否" ' + d.recomm + '>'
                }
            },
            {field: 'create_time', title: '录入时间', align: 'center'},
            {title: '操作', width: 120, templet: '#productListBar', fixed: "right", align: "center"}
        ]]
    });

    //是否置顶
    form.on('switch(productTop)', function (data) {
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

    //是否精华
    form.on('switch(productCream)', function (data) {
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
    //是否推荐
    form.on('switch(productRecomm)', function (data) {
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
            table.reload("productListTable", {
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
            title: "编辑产品",
            type: 2,
            area: ['100%', '100%'],
            content: "/admin/product/" + data.id,
            success: function (layero, index) {

            }
        })
    }

    //添加产品
    function addNews() {
        var index = layer.open({
            title: "添加产品",
            type: 2,
            area: ['100%', '100%'],
            content: "/admin/product/0",
            success: function (layero, index) {

            }
        })
    }

    $(".addNews_btn").click(function () {
        addNews();
    })

    //批量删除
    $(".delAll_btn").click(function () {
        var checkStatus = table.checkStatus('productListTable'),
            data = checkStatus.data,
            newsId = [];
        if (data.length > 0) {
            for (let i in data) {
                newsId.push(data[i].newsId);
            }
            layer.confirm('确定删除选中的文章？', {icon: 3, title: '提示信息'}, function (index) {
                // $.get("删除文章接口",{
                //     newsId : newsId  //将需要删除的newsId作为参数传入
                // },function(data){
                tableIns.reload();
                layer.close(index);
                // })
            })
        } else {
            layer.msg("请选择需要删除的文章");
        }
    })

    //列表操作
    table.on('tool(productList)', function (obj) {
        var layEvent = obj.event,
            data = obj.data;

        if (layEvent === 'edit') { //编辑
            edit(data);
        } else if (layEvent === 'del') { //删除
            layer.confirm('确定删除此产品？', {icon: 3, title: '提示信息'}, function (index) {
                $.post("/admin/product/delete/"+data.id,null,function(data){
                    if(data && data.code==1){
                        layer.msg("刪除成功！");
                        tableIns.reload();
                        layer.close(index);
                    }
                })
            });
        } else if (layEvent === 'look') { //预览
            layer.alert("此功能需要前台展示，实际开发中传入对应的必要参数进行文章内容页面访问")
        }
    });

})