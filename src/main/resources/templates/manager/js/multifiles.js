var _upload_settings_ = {
    debug: false,
    upload_url: "Handler/upload.ashx?action=SaveFilesHttpPostedFile",
    flash_url: 'NSWEditor/plugins/multiimage/images/swfupload_files.swf',
    file_post_name: "imgFile",
    button_placeholder: $(".file_btn b")[0],
    button_width: 106,
    button_height: 27,
    button_text: '选择附件...',
    button_text_style: 'color:#4f5159; font-size: 12px;',
    button_text_top_padding: 4,
    button_text_left_padding: 22,
    button_cursor: SWFUpload.CURSOR.HAND,
    file_types: "",
    file_types_description: "附件上传",
    file_upload_limit: 20, //上传数量限制
    file_size_limit: "5MB", //文件大小限制
    post_params: {},
    file_queued_handler: function (file) {
        /*
        file对象
        creationdate: Wed Mar 18 2015 09:41:55 GMT+0800 (中国标准时间)
        filestatus: -1
        id: "KindEditor_SWFUpload_0_0"
        index: 0
        modificationdate: Wed Mar 18 2015 09:41:55 GMT+0800 (中国标准时间)
        name: "1.jpg"
        post: Object
        size: 22392
        type: ".jpg"
        uploadtype: 0
        */
        var self = this;
        var div = $("#annex_list");
        file.name = file.name.replace(file.type, '').replace(",", "，").replace("<", "").replace(">", "");
        var _index = file.index > 8 ? (file.index + 1) : "0" + (file.index + 1);
        var html = [
                '<li data-id="' + file.id + '" data-status="' + file.filestatus + '" index="' + file.index + '" class="file_queued_handler">',
                    '<em class="e_word f_fl z_select"></em>',
                    '<span class="annex_numb">' + _index + '</span>',
                    '<span class="ann_tx"><input name=\"name\" class=\"li-name-title\" value=\"' + file.name + '\"/></span>',
                    '<em class="annex_dele"></em>',
                    '<div class="list-message"></div>',
                '</li>'
            ].join('');
        var ul = div.find("ul:last");
        if (ul.find("li").length > 5) {
            div.append("<div class='fl ul_warp'><ul class='annex_list clearfix'></ul></div>");
            ul = div.find("ul:last");
        }
        ul.append(html);
        //div.trigger("_change_");
        var li = ul.find("li[data-id='" + file.id + "']");
        li.find("em.annex_dele").bind("click", function () {
            self.cancelUpload(file.id);
            li.remove();
        });
        if (!self.progressbars) {
            self.progressbars = {};
        }
        self.progressbars[file.id] = {
            src: li,
            bar: li.find("div.list-message")
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
                errorName = "文件大小超过限制";
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
            if (window._swf_) {
                try {
                    $("div.list-message").hide();
                    window.cmax = window.cmax || window._MAX_;
                    window.cmax = window.cmax + 1;
                    window._swf_.setFileUploadLimit(window.cmax);
                } catch (e) { }
            }
        }
        if (this.debug) {
            _alert(errorName);
        }
    },
    //开始上传的时候
    upload_start_handler: function (file) {
        var self = this;
        var index = file.index;
        var progressbar = self.progressbars[file.id];
        var li = $(progressbar.src);
        if (li.length > 0 && li.find("em.z_select").length) {
            li.removeClass();
            file.name = file.name.replace(file.type, '').replace(",", "，");
            var input = li.find("input");
            var name = input.val() || file.name || "";
            self.setPostParams({ Title: name, ColumnID: $("#ddlColumns").val(), PermissionID: window.PermissionID || "", Directory: window.directory_ || "" });
        } else {
            self.cancelUpload(file.id);
        }
    },
    upload_progress_handler: function (file, bytesLoaded, bytesTotal) {//上传进度
        var self = this;
        var percent = Math.round(bytesLoaded * 100 / bytesTotal);
        var progressbar = self.progressbars[file.id];
        $(progressbar.bar).show().css('left', Math.round(percent * 80 / 100) + '%');
    },
    upload_error_handler: function (file, errorCode, message) {//上传失败
        if (file && file.filestatus == SWFUpload.FILE_STATUS.ERROR) {
            //上传失败
            _alert("上传失败！");
        }
    },
    upload_success_handler: function (file, serverData) {//上传成功
        var self = this;
        var data = {};

        $(self.progressbars[file.id].bar).hide();
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

        var li = $(self.progressbars[file.id].src);
        if (li.length) {
            li.attr("src", file.url).attr("data-status", file.filestatus).data("_data_", data);
            var input = li.find("input");
            data.title = input.val();
            data.input = input;
            data.alt = data.title;
        }
        if (!$("#annex_list li[data-status='-1']").length) {//没有未上传的文件
            var lis = $("#annex_list li[data-status='-4']");
            var datas = [];
            var i = 0;
            lis.each(function () {
                var _data = $(this).data("_data_");
                if (_data) {
                    datas[i] = _data;
                    i++;
                }
            })
            //_alert("上传成功！", true, function () {
            __callback(datas, popid);
            //});
        }
    }
};
