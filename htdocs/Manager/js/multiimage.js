﻿var _multiimage_clear = function () {
    if (window._swf_) {
        try {
            window.cmax = window.cmax || window._MAX_;
            window.cmax = window.cmax + 1;
            window._swf_.setFileUploadLimit(window.cmax);
        } catch (e) { }
    }
};
var _upload_settings_ = {
    debug: false,
    upload_url: "Handler/upload.ashx?action=SavePictureHttpPostedFile",
    flash_url: 'NSWEditor/plugins/multiimage/images/swfupload.swf',
    file_post_name: "imgFile",
    button_placeholder: $(".file_btn b")[0],
    button_width: 106,
    button_height: 27,
    button_text: '选择图片...',
    button_text_style: 'color:#4f5159; font-size: 12px;',
    button_text_top_padding: 4,
    button_text_left_padding: 22,
    button_cursor: SWFUpload.CURSOR.HAND,
    file_types: "*.jpg;*.gif;*.png;*.jpeg;*.bmp;",
    file_types_description: "图片上传",
    file_upload_limit: 20, //上传数量限制
    file_size_limit: "2MB", //文件大小限制
    post_params: {},
    file_queued_handler: function (file) {
        var self = this;
        file.url = "NSWEditor/plugins/multiimage/images/image.png";
        var insertList = $("#insertList").show();
        insertList.prev().hide();
        var ul = insertList.find("ul.insertimg_list");
        file.name = file.name.replace(file.type, '').replace(",", "，");
        var html = [
            '<li data-id="' + file.id + '">',
                '<i class="v_dele"></i>',
                '<i class="pro_view"></i>',
                '<a href="javascript:;"><img src="' + file.url + '" data-status="' + file.filestatus + '" class="to_upload_pictures" index="' + file.index + '"/></a>',
                '<p><input name=\"name\" class=\"li-name-title\" value=\"' + file.name + '\"/></p>',
                '<div class="list-status">',
                    '<div class="list-progressbar" style="display: none;">',
                        '<div class="list-progressbar-bar">',
                            '<div class="list-progressbar-bar-inner"></div>',
                        '</div>',
                    '</div>',
                    '<div class="list-message">等待上传</div>',
                '</div>',
            '</li>'
        ].join('');
        var li_ = ul.find("li:eq(0)");
        ul.append(html);
        var li = ul.find("li[data-id='" + file.id + "']");
        li.find("i.v_dele").bind("click", function () {
            self.cancelUpload(file.id);
            li.remove();
        })
        if ((window._MAX_ || 0) > 1) {
            SetDraggableLi(li);
        }
        if (!self.progressbars) {
            self.progressbars = {};
        }
        self.progressbars[file.id] = {
            progressbar: li.find("div.list-progressbar"),
            bar: li.find("div.list-progressbar-bar-inner"),
            message: li.find("div.list-message")
        };
        if (self.datas) {
            self.datas = null;
        }
        $("ul.insertimg_list").trigger("_change_");
    },
    file_queue_error_handler: function (file, errorCode, message) {
        var errorName = '';
        var me = this;
        var iserr = false;
        switch (errorCode) {
            case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
                errorName = "文件数量超过限制，只能上传" + me.settings.file_upload_limit + "张。";
                break;
            case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
                var max = me.settings.file_size_limit;
                if (!isNaN(me.settings.file_size_limit)) {
                    max = me.settings.file_size_limit < 1024 ? (me.settings.file_size_limit + "KB") : ((me.settings.file_size_limit / 1024) + "M");
                }
                errorName = "文件大小超过限制，最大只能上传" + max;
                iserr = true;
                break;
            case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                errorName = "无法上传空文件。";
                iserr = true;
                break;
            case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
                errorName = "文件类型不正确。";
                iserr = true;
                break;
            default:
                errorName = "发生异常，无法上传。";
                iserr = true;
                break;
        }
        if (iserr) {
            _multiimage_clear();
        } else {

        }
        if (this.debug) {
            _alert(errorName);
        }
    },
    //开始上传的时候
    upload_start_handler: function (file) {
        var self = this;
        var index = file.index;
        var img = $("img.to_upload_pictures[index='" + index + "']");
        if (img.length) {
            file.name = file.name.replace(file.type, '').replace(",", "，");
            var input = img.parents("li").find("input");
            var name = input.val() || file.name || "";
            var watermark = $("em.e_word.z_select").length > 0;
            //alert(watermark);
            self.setPostParams({ Title: name, ColumnID: $("#ddlColumns").val(), Watermark: watermark, PermissionID: window.PermissionID || "", Directory: window.directory_ || "" });
        } else {
            self.cancelUpload(file.id);
        }
        var progressbar = self.progressbars[file.id];
        progressbar.progressbar.show();
        progressbar.message.hide();
    },
    upload_progress_handler: function (file, bytesLoaded, bytesTotal) {//上传进度
        var self = this;
        var percent = Math.round(bytesLoaded * 100 / bytesTotal);
        var progressbar = self.progressbars[file.id];
        $(progressbar.bar).show().css('width', Math.round(percent * 80 / 100) + 'px');
    },
    upload_error_handler: function (file, errorCode, message) {//上传失败
        if (file && file.filestatus == SWFUpload.FILE_STATUS.ERROR) {
            //上传失败
            _alert("上传失败！");
        }
    },
    upload_success_handler: function (file, serverData) {//上传成功
        var self = this;
        var progressbar = self.progressbars[file.id];
        progressbar.progressbar.hide();
        var data = {};
        try {
            data = jQuery.parseJSON(serverData);
        } catch (e) {
            _alert(serverData);
            return;
        }
        if (data.error !== 0) {
            _alert(data.message);
            return;
        }
        file.url = data.url;

        var img = $("img.to_upload_pictures[index='" + file.index + "']");
        if (img.length) {
            var li = img.parents("li");
            img.attr("src", file.url).attr("data-status", file.filestatus).data("_data_", data);
            var input = li.find("input");
            data.title = input.val();
            data.input = input;
            data.alt = data.title;
        }
        if (!$("#insertList ul.insertimg_list img[data-status='-1']").length) {
            //没有未上传的文件
            var align = $("div.acc_cont:visible span.dqfs select").val();
            var imgs = $("#insertList ul.insertimg_list img[data-status='-4']");
            var datas = [];
            var i = 0;
            imgs.each(function () {
                var _data = $(this).data("_data_");
                if (_data) {
                    datas[i] = _data;
                    //console.log(datas);
                    if (align) {
                        datas[i]["align"] = align;
                    }
                    i++;
                }
            })
            if (window["console"]) console.log(datas);
            __callback(datas, popid);
            imgs.parents("ul").empty();
            _multiimage_clear();
        }
    }
};