layui.config({
	base : "../../js/"
}).use(['flow','form','layer','upload','laytpl','laypage'],function(){
    var flow = layui.flow,
        form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        upload = layui.upload,
        laytpl = layui.laytpl,
        laypage = layui.laypage,
        $ = layui.jquery;

    dataList(1);

    /**
     * 查询数据列表
     * @param number
     */
    function dataList(number) {
        var currentCategoryId =$("#currentCategoryId").val();
        $.ajax({
            url: '/admin/photo',
            method: 'get',
            dataType: 'json',
            data: {"categoryId":currentCategoryId,"page": number,"limit":10},
            success: function (data) {
                console.log(data);
                if (data && data.code == 1) {
                    console.log(data);
                    if (data && data.code == 1) {
                        var listData = {"list": data.result.list};
                        var getTpl = imageListTpl.innerHTML, view = document.getElementById('Images');

                        laytpl(getTpl).render(listData, function (html) {
                            view.innerHTML = html;
                        });
                        form.render();

                        if(data.result.count >0){
                            if (number === 1) {
                                //分页标签
                                pageBar(data.result.count, 10);
                            }
                        }

                    }
                }
            }
        });
    }

    /**
     * 数据分页
     * @param count
     * @param limit
     */
    function pageBar(count, limit) {
        //var themes = ['#ff0000', '#eb4310', '#3f9337', '#219167', '#239676', '#24998d', '#1f9baa', '#0080ff', '#3366cc', '#800080', '#a1488e', '#c71585', '#bd2158'];
        var themes = ['#E70012'];
        laypage.render({
            elem: "imagePage",
            limit: limit,
            count: count,
            first: '首页',
            last: '尾页',
            theme: themes[parseInt(Math.random() * themes.length)],
            layout: ['prev', 'page', 'next'],
            jump: function (obj, first) {
                if (!first) {
                    $("#number").val(obj.curr);
                    dataList(obj.curr);
                }
            }
        });
    }

    //设置图片的高度
    $(window).resize(function(){
        $("#Images li img").height($("#Images li img").width());
    })

    //多图片上传
    upload.render({
        elem: '.uploadNewImg',
        url: '/up/lay?type=photo' ,//接口url
        multiple: true,
        before: function(obj){
            //预读本地文件示例，不支持ie8
            obj.preview(function(index, file, result){

            });
        },
        done: function(res){
            //上传完毕
            console.log(res);
            $('#Images').prepend('<li data-id="'+res.photoId+'" id="li_'+res.photoId+'">' +
                '<img layer-src="'+ res.key +'" src="'+ res.key +'" alt="'+ res.name +'" class="layui-upload-img">' +
                '<div class="operate"><div class="check">' +
                '<input type="checkbox" name="belle" lay-filter="choose" lay-skin="primary" title="'+res.name+'"></div>' +
                '<i class="layui-icon img_del">&#xe640;</i></div></li>')
            //设置图片的高度
            $("#Images li img").height($("#Images li img").width());
            form.render("checkbox");
        }
    });

    //弹出层
    $("body").on("click","#Images img",function(){
        parent.showImg();
    })

    //删除单张图片
    $("body").on("click",".img_del",function(){
        var _this = $(this);
        console.log(_this);
        layer.confirm('确定删除图片吗？',{icon:3, title:'提示信息'},function(index){
            let id = _this.parents("li").data("id");
            $.ajax({
                url: '/admin/photo/delete/'+id,
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    if (data && data.code == 1) {
                        _this.parents("li").hide(1000);
                        setTimeout(function(){_this.parents("li").remove();},950);
                        layer.close(index);
                    }
                }
            });
        });
    })

    //删除单张图片
    $("body").on("click",".img_delete",function(){
        var _this = $(this);
        console.log(_this);
        _this.parents("li").hide(1000);
        let id = _this.parents("li").data("id");
        console.log(id);
        setTimeout(function(){_this.parents("li").remove();},950);
        $("#li_"+id).find("div.layui-form-checked").removeClass("layui-form-checked");
    })

    //全选
    form.on('checkbox(selectAll)', function(data){
        var child = $("#Images li input[type='checkbox']");
        child.each(function(index, item){
            item.checked = data.elem.checked;
        });
        form.render('checkbox');
    });

    //通过判断是否全部选中来确定全选按钮是否选中
    form.on("checkbox(choose)",function(data){
        console.log(data.elem.checked);
        console.log(data);
        let id = $(data.elem).parents("li").data("id");
        let src = $("#li_"+id).find("img").attr("src");
        var html = document.getElementById("selectedList").innerHTML;

        if(data.elem.checked){
            let append = '<li data-id="'+id+'" id="selectedli_'+id+'" >\n' +
                '<input type="hidden" value="{{item.id}}"/>\n' +
                '<img layer-src="'+src+'" src="'+src+'" style="max-height: 150px;">\n' +
                ' <div class="operate">\n' +
                ' <i class="layui-icon img_delete">&#xe640;</i>\n' +
                ' </div>\n' +
                '</li>';
            document.getElementById("selectedList").innerHTML = html+append;
        }else{
            $("#selectedli_"+id).remove();
        }
    })

    //获取元素在数组的下标
    Array.prototype.indexOf = function(val) {
        for (var i = 0; i < this.length; i++) {
            if (this[i] == val)	{
                return i;
            };
        }
        return -1;
    };

//根据数组的下标，删除该下标的元素
    Array.prototype.remove = function(val) {
        var index = this.indexOf(val);
        if (index > -1) {
            this.splice(index, 1);
        }
    };

    //批量删除
    $(".batchDel").click(function(){
        var $checkbox = $('#Images li input[type="checkbox"]');
        var $checked = $('#Images li input[type="checkbox"]:checked');
        if($checkbox.is(":checked")){
            layer.confirm('确定删除选中的图片？',{icon:3, title:'提示信息'},function(index){
                var index = layer.msg('删除中，请稍候',{icon: 16,time:false,shade:0.8});
                setTimeout(function(){
                    //删除数据
                    $checked.each(function(){
                        $(this).parents("li").hide(1000);
                        setTimeout(function(){$(this).parents("li").remove();},950);
                    })
                    $('#Images li input[type="checkbox"],#selectAll').prop("checked",false);
                    form.render();
                    layer.close(index);
                    layer.msg("删除成功");
                },2000);
            })
        }else{
            layer.msg("请选择需要删除的图片");
        }
    })

    //删除单张图片
    $("body").on("click",".doneSelect",function(index){
        var lis = $("#selectedList>li");
        if(lis.length==0){
            layer.msg("请选择图片")
            return false;
        }
        var images = [];
        localStorage.setItem("images",images);
        for(var i = 0; i<lis.length;i++){
            images.push($(lis[i]).children("img").attr("src"));
        }
        localStorage.setItem("images",images);
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    })

})