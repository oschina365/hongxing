var banners = [];
layui.use(['form', 'layer', 'layedit', 'laydate', 'upload'], function () {
    var form = layui.form
    layer = parent.layer === undefined ? layui.layer : top.layer,
        laypage = layui.laypage,
        upload = layui.upload,
        layedit = layui.layedit,
        laydate = layui.laydate,
        $ = layui.jquery;

    jQuery(function () {
        var $ = jQuery,    // just in case. Make sure it's not an other libaray.
            $wrap = $('#uploader'),        // 图片容器
            $queue = $('<ul class="filelist"></ul>')
                .appendTo($wrap.find('.queueList')),        // 状态栏，包括进度和控制按钮
            $statusBar = $wrap.find('.statusBar'),        // 文件总体选择信息。
            $info = $statusBar.find('.info'),        // 上传按钮
            $upload = $wrap.find('.uploadBtn'),        // 没选择文件之前的内容。
            $placeHolder = $wrap.find('.placeholder'),        // 总体进度条
            $progress = $statusBar.find('.progress').hide(),        // 添加的文件数量
            fileCount = 0,        // 添加的文件总大小
            fileSize = 0,        // 优化retina, 在retina下这个值是2
            ratio = window.devicePixelRatio || 1,        // 缩略图大小
            thumbnailWidth = 110 * ratio,
            thumbnailHeight = 110 * ratio,        // 可能有pedding, ready, uploading, confirm, done.
            state = 'pedding',        // 所有文件的进度信息，key为file id
            percentages = {},
            supportTransition = (function () {
                var s = document.createElement('p').style,
                    r = 'transition' in s ||
                        'WebkitTransition' in s ||
                        'MozTransition' in s ||
                        'msTransition' in s ||
                        'OTransition' in s;
                s = null;
                return r;
            })(),        // WebUploader实例
            uploader;

        if (!WebUploader.Uploader.support()) {
            alert('Web Uploader 不支持您的浏览器！如果你使用的是IE浏览器，请尝试升级 flash 播放器');
            throw new Error('WebUploader does not support the browser you are using.');
        }

        // 实例化
        uploader = WebUploader.create({
            pick: {
                id: '#filePicker',
                label: '点击选择图片'
            },
            dnd: '#uploader .queueList',
            paste: document.body,

            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            },

            // swf文件路径
            swf: 'http://cdn.staticfile.org/webuploader/0.1.0/Uploader.swf',

            disableGlobalDnd: true,
            chunked: true,
            server: '/up/lay?type=category',
            fileNumLimit: 10,
            fileSizeLimit: 5 * 1024 * 1024,    // 200 M
            fileSingleSizeLimit: 10 * 1024 * 1024    // 50 M
        });

        // 添加“添加文件”的按钮，
        uploader.addButton({
            id: '#filePicker2',
            label: '继续添加'
        });

        // 当有文件添加进来时执行，负责view的创建
        function addFile(file) {
            var $li = $('<input type="hidden" name="bannerImage"/><li id="' + file.id + '">' +
                    '<p class="title">' + file.name + '</p>' +
                    '<p class="imgWrap"></p>' +
                    '<p class="progress"><span></span></p>' +
                    '</li>'),

                $btns = $('<div class="file-panel">' +
                    '<span class="cancel">删除</span>' +
                    '<span class="rotateRight">向右旋转</span>' +
                    '<span class="rotateLeft">向左旋转</span></div>').appendTo($li),
                $prgress = $li.find('p.progress span'),
                $wrap = $li.find('p.imgWrap'),
                $info = $('<p class="error"></p>'),

                showError = function (code) {
                    switch (code) {
                        case 'exceed_size':
                            text = '文件大小超出';
                            break;

                        case 'interrupt':
                            text = '上传暂停';
                            break;

                        default:
                            text = '上传失败，请重试';
                            break;
                    }

                    $info.text(text).appendTo($li);
                };

            if (file.getStatus() === 'invalid') {
                showError(file.statusText);
            } else {
                // @todo lazyload
                $wrap.text('预览中');
                uploader.makeThumb(file, function (error, src) {
                    if (error) {
                        $wrap.text('不能预览');
                        return;
                    }

                    var img = $('<img src="' + src + '">');
                    $wrap.empty().append(img);
                }, thumbnailWidth, thumbnailHeight);

                percentages[file.id] = [file.size, 0];
                file.rotation = 0;
            }

            file.on('statuschange', function (cur, prev) {
                if (prev === 'progress') {
                    $prgress.hide().width(0);
                } else if (prev === 'queued') {
                    $li.off('mouseenter mouseleave');
                    $btns.remove();
                }

                // 成功
                if (cur === 'error' || cur === 'invalid') {
                    console.log(file.statusText);
                    showError(file.statusText);
                    percentages[file.id][1] = 1;
                } else if (cur === 'interrupt') {
                    showError('interrupt');
                } else if (cur === 'queued') {
                    percentages[file.id][1] = 0;
                } else if (cur === 'progress') {
                    $info.remove();
                    $prgress.css('display', 'block');
                } else if (cur === 'complete') {
                    $li.append('<span class="success"></span>');
                }

                $li.removeClass('state-' + prev).addClass('state-' + cur);
            });

            $li.on('mouseenter', function () {
                $btns.stop().animate({height: 30});
            });

            $li.on('mouseleave', function () {
                $btns.stop().animate({height: 0});
            });

            $btns.on('click', 'span', function () {
                var index = $(this).index(),
                    deg;

                switch (index) {
                    case 0:
                        uploader.removeFile(file);
                        return;

                    case 1:
                        file.rotation += 90;
                        break;

                    case 2:
                        file.rotation -= 90;
                        break;
                }

                if (supportTransition) {
                    deg = 'rotate(' + file.rotation + 'deg)';
                    $wrap.css({
                        '-webkit-transform': deg,
                        '-mos-transform': deg,
                        '-o-transform': deg,
                        'transform': deg
                    });
                } else {
                    $wrap.css('filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation=' + (~~((file.rotation / 90) % 4 + 4) % 4) + ')');
                }


            });

            $li.appendTo($queue);
        }

        // 负责view的销毁
        function removeFile(file) {
            var $li = $('#' + file.id);

            delete percentages[file.id];
            updateTotalProgress();
            $li.off().find('.file-panel').off().end().remove();
        }

        function updateTotalProgress() {
            var loaded = 0,
                total = 0,
                spans = $progress.children(),
                percent;

            $.each(percentages, function (k, v) {
                total += v[0];
                loaded += v[0] * v[1];
            });

            percent = total ? loaded / total : 0;

            spans.eq(0).text(Math.round(percent * 100) + '%');
            spans.eq(1).css('width', Math.round(percent * 100) + '%');
            updateStatus();
        }

        function updateStatus() {
            var text = '', stats;

            if (state === 'ready') {
                text = '选中' + fileCount + '张图片，共' +
                    WebUploader.formatSize(fileSize) + '。';
            } else if (state === 'confirm') {
                stats = uploader.getStats();
                if (stats.uploadFailNum) {
                    text = '已成功上传' + stats.successNum + '张照片至XX相册，' +
                        stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
                }

            } else {
                stats = uploader.getStats();
                text = '共' + fileCount + '张（' +
                    WebUploader.formatSize(fileSize) +
                    '），已上传' + stats.successNum + '张';

                if (stats.uploadFailNum) {
                    text += '，失败' + stats.uploadFailNum + '张';
                }
            }

            $info.html(text);
        }

        function setState(val) {
            var file, stats;

            if (val === state) {
                return;
            }

            $upload.removeClass('state-' + state);
            $upload.addClass('state-' + val);
            state = val;

            switch (state) {
                case 'pedding':
                    $placeHolder.removeClass('element-invisible');
                    $queue.parent().removeClass('filled');
                    $queue.hide();
                    $statusBar.addClass('element-invisible');
                    uploader.refresh();
                    break;

                case 'ready':
                    $placeHolder.addClass('element-invisible');
                    $('#filePicker2').removeClass('element-invisible');
                    $queue.parent().addClass('filled');
                    $queue.show();
                    $statusBar.removeClass('element-invisible');
                    uploader.refresh();
                    break;

                case 'uploading':
                    $('#filePicker2').addClass('element-invisible');
                    $progress.show();
                    $upload.text('暂停上传');
                    break;

                case 'paused':
                    $progress.show();
                    $upload.text('继续上传');
                    break;

                case 'confirm':
                    $progress.hide();
                    $upload.text('开始上传').addClass('disabled');

                    stats = uploader.getStats();
                    console.log(stats);
                    if (stats.successNum && !stats.uploadFailNum) {
                        setState('finish');
                        return;
                    }
                    break;
                case 'finish':
                    stats = uploader.getStats();
                    if (stats.successNum) {
                        parent.layer.msg("上传成功！", {icon: 1});
                    } else {
                        // 没有成功的图片，重设
                        state = 'done';
                        location.reload();
                    }
                    break;
            }

            updateStatus();
        }

        uploader.onUploadProgress = function (file, percentage) {
            var $li = $('#' + file.id),
                $percent = $li.find('.progress span');

            $percent.css('width', percentage * 100 + '%');
            percentages[file.id][1] = percentage;
            updateTotalProgress();
        };

        uploader.onFileQueued = function (file) {
            fileCount++;
            fileSize += file.size;

            if (fileCount === 1) {
                $placeHolder.addClass('element-invisible');
                $statusBar.show();
            }

            addFile(file);
            setState('ready');
            updateTotalProgress();
        };

        uploader.onFileDequeued = function (file) {
            fileCount--;
            fileSize -= file.size;

            if (!fileCount) {
                setState('pedding');
            }

            removeFile(file);
            updateTotalProgress();

        };

        uploader.on('all', function (type, arg1, arg2) {
            var stats;
            switch (type) {
                case 'uploadFinished':
                    setState('confirm');
                    break;

                case 'startUpload':
                    setState('uploading');
                    break;

                case 'stopUpload':
                    setState('paused');
                    break;
                case 'uploadSuccess':
                    uploadSuccess(arg1, arg2)
                    break;
            }
        });

        $upload.on('click', function () {
            if ($(this).hasClass('disabled')) {
                return false;
            }

            if (state === 'ready') {
                uploader.upload();
            } else if (state === 'paused') {
                uploader.upload();
            } else if (state === 'uploading') {
                uploader.stop();
            }
        });

        $info.on('click', '.retry', function () {
            uploader.retry();
        });

        $info.on('click', '.ignore', function () {
            alert('todo');
        });

        $upload.addClass('state-' + state);
        updateTotalProgress();

        function uploadSuccess(f, d) {
            console.log( f)
            console.log( d)
            console.log("key:" + d.key)
            var id = f.id;
            console.log(id);
            $(id).find("img").attr("src",d.key);
            banners.push(d.key);
        }

        uploader.on('error', function (code, file) {
            var str="";
            switch(code){
                case "F_DUPLICATE":
                    str="文件重复";
                    break;
                case "Q_TYPE_DENIED":
                    str="文件类型 不允许";
                    break;
                case "F_EXCEED_SIZE":
                    str="文件大小超出限制10M";
                    break;
                case "Q_EXCEED_SIZE_LIMIT":
                    str="超出空间文件大小";
                    break;
                case "Q_EXCEED_NUM_LIMIT":
                    str="抱歉，超过每次上传数量图片限制";
                    break;
                default:
                    str=name+" Error:"+code;
            }
            layer.msg(str);
        });
    });

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
        //监听方法
        on: function (data) {
            var arr = data.arr;
            if (arr.length > 0) {
                selectCategoryIds = [];
                for (let i = 0; i < arr.length; i++) {
                    selectCategoryIds.push(arr[i].value)
                }
            }
        },
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

    var productId = $("#productId").val();
    init();
    var categoryList;
    var selectCategoryIds = [];

    async function init() {
        $.ajax({
            url: '/admin/product/xm/' + productId,
            method: 'post',
            dataType: 'json',
            success: function (data) {
                console.log(data);
                if (data && data.code == 1) {
                    categoryList = data.result.categoryList;
                    demo1.update({
                        data: categoryList
                    })
                    //初始右侧数据
                    /*transfer.render({
                        elem: '#test3'
                        , data: categoryList
                        , value: data.result.categoryIds
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
                    })*/
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
        method: "post",  //此处是为了演示之用，实际使用中请将此删除，默认用post方式提交
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
        }
        if (selectCategoryIds.length > 5) {
            layer.alert('最多关联5个分类');
        }
        $.post("/admin/product/edit", {
            id: productId,
            name: $(".productName").val(),  //文章标题
            desc: $(".productDesc").val(),  //文章摘要
            content: layedit.getContent(editIndex).split('<audio controls="controls" style="display: none;"></audio>')[0],  //文章内容
            imgUrls: banners,  //缩略图
            banner: $(".thumbImg").attr("src"),  //缩略图
            sort : $("#sort").val(),
            selectCategoryIds: selectCategoryIds
        }, function (res) {
            if(res && res.code==1){
                layer.msg(res.message ? res.message : "操作成功",{icon:6});
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
            url: "/up/lay?type=product"
        }
    });

})

function selectImage() {
    var body;
    var index = layer.open({
        title: "选择图库",
        type: 2,
        area: ['100%', '100%'],
        content: "/admin/page/img/photo.html",
        success: function (layero, index) {
            body = layui.layer.getChildFrame('body', index);
            console.log(index);
        },
        end: function () {
            //关闭窗体时 触发
            var images = localStorage.getItem("images");
            if(images && images.length>0){
                var list = images.split(",");
                $("#uploader").show();
                for(var i=0;i<list.length;i++){
                    let image = list[i];
                    $(".imagelist").append('<li id="WU_FILE_'+i+'" class="preview-image-li cover-select">' +
                        '<p class="title"> <a type="button" class="layui-btn layui-btn-xs" ' +
                        'onclick="deletePreviewImage(this,\''+image+'\')">删除</a></p>\n' +
                        '<p class="imgWrap"><img src="'+image+'"></p>\n' +
                        '<p class="progress"><span></span></p>\n' +
                        '</li>')
                    banners.push(image);
                }
                localStorage.removeItem("images")
                console.log("关闭子弹窗了");
            }
        }
    })
    layui.layer.full(index);
    //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
    $(window).on("resize", function () {
        layui.layer.full(index);
    })
}

function deletePreviewImage(obj, fileKey) {
    $(obj).parent().parent().remove();
    parent.layer.msg("移除成功！", {icon: 1});
    let li = $(".imagelist>li").length;
    if(li == 0){
        $("#uploader").show();
    }
}