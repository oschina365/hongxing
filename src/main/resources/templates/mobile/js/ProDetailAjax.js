/* 此JS只针对于ProDetail.aspx的评论加载   */
//获取url的参数
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return unescape(r[2]);
    } else {
        return "undefined";
    }
}
$(function () {
    //初始参数 
    var reset = 0; //某些滚动条会触发三次scroll事件 用这个解决 
    var surplusHeight = 400; //差值 
    var scrollTop = 0;
    var clientHeight = 0;
    var scrollHeight = 0;

    var ProDetailPageIndex = 1;   //记录当前页数
    var ProDetailPageSize = 10;   //记录当前条数
    var ProDetailTotalCount;      //记录总记录数
    var ProDetailId = getQueryString("Id");         //记录评论ID
    var _div = '<div id="loading" class="loading"><div id="circularG"><div id="circularG_1" class="circularG"></div><div id="circularG_2" class="circularG"></div><div id="circularG_3" class="circularG"></div><div id="circularG_4" class="circularG"></div><div id="circularG_5" class="circularG"></div><div id="circularG_6" class="circularG"></div><div id="circularG_7" class="circularG"></div><div id="circularG_8" class="circularG"></div></div></div>';
    $("body").append(_div);    //append LOAD图  

    //初始化 
    //var intervalProcess = setInterval(InitLoadContent, 0);
    loadContent();

    //主会场 
    window.onscroll = fun_scroll;
    //滚动方法 
    function fun_scroll() {
        var _dis = $('.tab-box #divId1').css('display');
        if (_dis == "block" && reset == 0) {
            if (document.documentElement && document.documentElement.scrollTop) {
                scrollTop = document.documentElement.scrollTop;
            } else if (document.body) {
                scrollTop = document.body.scrollTop;
            }
            if (document.body.clientHeight && document.documentElement.clientHeight) {
                clientHeight = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
            } else {
                clientHeight = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
            }
            scrollHeight = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
            scroll_Height = parseInt(scrollHeight) - surplusHeight;
            var scrollHeight = document.documentElement.scrollHeight;

            var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;

            //控制滚动条次数以及判断是否到达底部 
            var result = scrollHeight - scrollTop;
            if (clientHeight + scrollTop + surplusHeight > scrollHeight) {
                var _d = ProDetailTotalCount / ProDetailPageSize;
                var _totalPage = Math.ceil(_d);           //得到总页数  
                if (ProDetailPageIndex < _totalPage) {    //是否是最后一页评论
                    ProDetailPageIndex = ProDetailPageIndex + 1;
                    reset = 1;
                    document.getElementById("loading").style.display = "block";
                    var scrollTime = setTimeout(loadContent, 1000);
                }
            }
        }
    }


    //加载内容
    function loadContent() {
        $.ajax({
            type: "post",
            url: "/Mobile/MAjax.ashx?action=GetCommentByProIdToDeatil&t=" + Math.random(),
            data: { "ProId": ProDetailId, "Curr": ProDetailPageIndex, "Top": ProDetailPageSize },
            beforeSend: function (XMLHttpRequest) {

            },
            success: function (msg, textStatus) {
                var commtns = $(msg).find("comment");
                ProDetailTotalCount = $(msg).find("Count").text();  //得到总记录数
                $("#AppendCount").text(ProDetailTotalCount);
                var sHtml = "";
                for (var i = 0; i < commtns.length; i++) {
                    var jCmt = $(commtns[i]);
                    var sUsername = jCmt.find("username").text();
                    var sContent = jCmt.find("content").text();
                    var sTime = jCmt.find("inputTime").text().toString();
                    var sfeedback = jCmt.find("feedback").text();
                    var list = [];
                    list.push(["<dl>", "<dt class=\"relay_time\"><span>", sUsername, "</span> 于<em>", sTime, "</em>说道：</dt>"].join(''));
                    list.push(["  <dd>", " <p class=\"re_fir\">", sContent.toString(), "</p>", " <p class=\"re_sec\"><span class=\"tit\">管理员回复：</span>"].join(''));
                    list.push([sfeedback, "</p>", "</dd>", "</dl>"].join(''));
                    list = list.join('');
                    sHtml += list;
                }
                $("#CommentList").append(sHtml);
            },
            complete: function (XMLHttpRequest, textStatus) {
                document.getElementById("loading").style.display = "none";
                reset = 0;
            },
            error: function () {
                //请求出错处理
            }
        });
    }
});



