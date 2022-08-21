function SetCheckedValues(checkboxS, id) {
    var cbs = $(checkboxS).find("input[type='checkbox']:checked");
    var ids = '';
    cbs.each(function (i) {
        if (i == 0) {
            ids += $(this).val();
        } else {
            ids += ','+$(this).val();
        }
    })
    //alert(ids);
    $(id).val(ids);
}
function addTr(i, title, value, tr,isDuoXuan) {
    tr = $(tr);
    var trStr = '<tr>'
    + '<td class="xh">{0}</td>'
    + '<td class="bt">{1}</td>'
    + '<td class="mrz">{2}</td>'
    + '<td class="mrxx"><input type=\"{3}\" value="1" name="moren"></td>'
    + '<td class="px"><a class="shang" href="javascript:;">↑</a><a style="margin:5px;" class="xia" href="javascript:;">↓</a></td>'
    + '<td class="sc"><a href="javascript:;">×</a></td>'
    + '</tr>';
    var newTr = $(trStr.replace("{0}", i).replace("{1}", title).replace("{2}", value).replace("{3}", isDuoXuan ? "checkbox" : "radio")).insertBefore(tr);
    newTr.find(".shang").click(function () {
        var prev = newTr.prev();
        if (!prev.hasClass("notTr")) {
            newTr.insertBefore(prev);
        }
    })
    newTr.find(".xia").click(function () {
        var next = newTr.next();
        if (!next.hasClass("notTr")) {
            newTr.insertAfter(next);
        }
    })
    newTr.find("td.sc a").click(function () {
        if (confirm("确定删掉？")) {
            newTr.remove();
        }
    })
    return newTr;
}
var zhezhao = '<div id="oran_full_bg" class="oran_bgs" style="position: absolute; top: 0px; left: 0px; z-index: 9; background:none repeat scroll 0 0 #777777; opacity: 0.75;filter:progid:DXImageTransform.Microsoft.Alpha(opacity=75);"></div>';
function showZheZhao(isShow){
	var chen = $("#oran_full_bg");
	if(isShow){
		if(!chen.length){
            $(document.body).append(zhezhao);
			chen = $("#oran_full_bg");
		}
		chen.css("height",(window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight)).css("width",$(document.body).width());
		chen.show();
	}else{
		chen.hide();
	}
}

var bianji = '<div class="lightbox pricebox" id="{id}">'
	+'<div class="inner clearfix">'
		+ '<a href="javascript:void(0)" class="right close"></a>'
		+'<h2 class="title"></h2><div class="msgHtml"></div>'
		+'<input type="button" value="保存" name="sib" class="save"></div>'
		+ '</div>';
function thisResize(element){
	var w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	var h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
	_thisResize(element,w,h);
}
function _thisResize(element,w,h){
	var element = $(element);
	var top = (h-element.height())/2 - 10;
	var left = (w-element.width())/2;
	element.css("top", top).css("left", left);
//	if (arguments[3]) {
//	    element.css({ width: w, height: h });
//    }
}
function showBianJi(id,title,html,fn){
	id = id||parseInt(Math.random()*4,10);
	fn = fn||function(){};
	html = html||"";
	var lightbox = $("#"+id);
	if(!lightbox.length){
		$(document.body).append(bianji.replace("{id}",id));
		lightbox = $("#"+id);
	}
	lightbox.find(".title").html(title);
	lightbox.find(".msgHtml").html(html);
	showZheZhao(true);
	lightbox.find("a.close").click(function(){
		lightbox.hide();
		showZheZhao(false);
	})
	thisResize(lightbox);
	lightbox.find("input.save").click(function(){
		fn(lightbox);
	})
	lightbox.show();
	return lightbox;
}
$(window).resize(function () {
    var w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
    var h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
    $(".lightbox:visible").each(function () {
        _thisResize(this, w, h)
    })
//    $(".oran_bgs:visible").each(function () {
//        _thisResize(this, w, h,true)
//    });
})