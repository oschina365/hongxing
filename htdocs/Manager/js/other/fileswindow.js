var isWebuploader=window["isWebuploader"]===true;if(isWebuploader){window.WebUploader_Options={pick:{id:"#filePicker",label:"点击选择文件"},accept:{title:"Files",extensions:window.file_types.replace(/\*\./g,"").replace(/;/g,","),mimeTypes:window.file_types.replace(/\*\./g,".").replace(/;/g,",")},fileNumLimit:window._MAX_,formData:{PermissionID:window.PermissionID||""},chunked:false,fileVal:"imgFile",fileSingleSizeLimit:window.bigsize,addFile:function(G,E,H,C){var J=this,D=parseInt(G.id.substr(G.id.lastIndexOf("_")+1))+1,L=['<li id="'+G.id+'" class="file_queued_handler state-start">','<em class="e_word f_fl z_select"></em>','<span class="annex_numb">'+(D>9?""+D:"0"+D)+"</span>",'<span class="ann_tx"><input name="name" class="li-name-title txt" value="" /></span>','<em class="annex_dele cancel"></em>','<div class="list-message progress_" op="left"></div>',"</li>"].join(""),K=$(L),I=H.find("ul:last"),F=$("#annex_list");console.log(G);console.log(J);if(I.find("li").length>5){F.append("<div class='fl ul_warp'><ul class='annex_list clearfix'></ul></div>");I=F.find("ul:last")}K.appendTo(I);K.find(".txt").val(G.name.lastIndexOf(".")>0?G.name.substr(0,G.name.lastIndexOf(".")):G.name);K.find(".cancel").on("click",function(){J.removeFile(G);var M=F.find(".ul_warp:last");if(M.find("li").length==0){M.remove()}});if(C){C(G)}var B=function(M){var N="";switch(M){case"exceed_size":N="文件大小超出";break;case"interrupt":N="上传暂停";break;default:N="上传失败，请重试";break}_alert(N||M)};var A=K.find(".progress_");G.on("statuschange",function(N,M){if(M==="progress"){A.hide().width(0)}if(N==="error"||N==="invalid"){B(G.statusText);E[G.id][1]=1}else{if(N==="interrupt"){B("interrupt")}else{if(N==="queued"){E[G.id][1]=0}}}K.removeClass("state-start").removeClass("state-"+M).addClass("state-"+N)});return K}};var _upload_settings_={file_upload_limit:window.WebUploader_Options.fileNumLimit}}$(function(){var A=$("ul.tab_ul li:eq(1)");A.bind("mouseover",function(){var F=$("div.iframes");if(F.find("iframe").length==0){$("div.iframes").html('<iframe src="SearchFiles.aspx" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="searchFiles" name="searchFiles"></iframe><div class="clear"></div>');var G=window.frames["searchFiles"];$(G).bind("load",function(){$("#searchFiles").attr("_load_","true")})}});var D=$("#prev_01");var B=$("#next_01");var E=$("#annex_list");var C=568;B.bind("click",function(){var G=parseInt(E.css("left"));G=isNaN(G)?0:G;var H=E.children();var I=H.length;var F=G>0?G:-(G);F=F/C+1;if(F<I){E.stop(true,true).animate({"left":-F*(C)},500)}else{E.stop(true,true).animate({"left":0},500)}});$(D).bind("click",function(){var F=parseInt(E.css("left"));F=isNaN(F)?0:F;if(F<0){E.stop(true,true).animate({"left":F+(C)},500)}else{var G=E.children();var H=G.length-1;E.stop(true,true).animate({"left":-H*(C)},500)}});E.bind("_change_",function(){var F=E.children();var G=F.length;E.stop(true,true).animate({"left":-(C*G)},500)})});var ValidateForm=function(){var A=$("#txtTitle").val().trim();if(A.length==0){_alert("请填写目录名称！");return false}$("#ddlColumns01 option").each(function(){var B=$(this).text();B=_allReplace(B.replace("├","").replace("└",""),"-","");if(B==A){_alert("已经存在相同目录！");return false}});return true};$(function(){var B=parse_url(window.location+"");if(B.directory){var E=B.directory.toLowerCase();$("#ddlColumns option[directory='"+E+"']").attr("selected",true)}$(".tab_ul li").bind("click",function(){$("div.acc_cont").eq($(".tab_ul li").index($(this))).show().siblings("div.acc_cont").hide();$(this).addClass("zon").siblings().removeClass("zon")}).eq(0).click();if(!isWebuploader){var C=window.bigsize*1204;var A=function(){return new SWFUpload(jQuery.extend({},_upload_settings_,{file_upload_limit:window._MAX_,file_types:window.file_types,file_size_limit:C}))};var D=window._swf_=null;if("SWFUpload" in window){D=window._swf_=A()}else{loadJs("js/SWFUpload.js",function(){D=window._swf_=A()})}}var F=$("#annex_list");$("#ups").bind(isWebuploader?"click_":"click",function(H,G){var I=F.find(isWebuploader?"li.state-start,li.state-error":"li[data-status='-1']");if(I.length){I=I.filter(function(){return $(this).find("em.z_select").length>0});if(I.length==0){_alert("请选择要上传的文件！");return}}else{_alert("没有可上传文件！");return}if(!isWebuploader){D.startUpload()}else{if(G){G.call(this)}}}).on("callback",function(I,G){if(isWebuploader){var K=F.find("li.state-complete");if(K.length>0){var H={};var J=0;K.each(function(){var L=$(this);H[J]=L.data("data")||{};H[J].alt=H[J].title=L.find(".txt").val()||H[J].name;J++});console.log(H);__callback(H,popid);window._clear_()}}});$("#lijicharu").unbind("click").bind("click",function(){if(!$("#searchFiles").attr("_load_")){_alert("文档尚未加载完成，请稍后重试！");return}var H=window.frames["searchFiles"];var J=$(H.document.body);var G=[];var I=J.find("#annex_list li");if(I.length){}else{_alert("请选择附件！");return}I=J.find("#annex_list em.e_word");if(I.length){I.each(function(K){var L=$(this);G[K]={error:0,fileID:L.attr("pictureid"),input:L,name:L.attr("title"),title:L.attr("title"),url:L.attr("src")}});__callback(G,popid,"False")}else{_alert("请选择图片！");return}});$(document).on("click","em.e_word",function(){if($(this).hasClass("z_select")){$(this).removeClass("z_select")}else{$(this).addClass("z_select")}})});window._clear_=function(){if(!isWebuploader){if(_swf_){try{var A=_swf_.getStats();A.successful_uploads=0;_swf_.setStats(A)}catch(C){}$("#annex_list li").remove();$("#annex_list div.ul_warp:gt(0)").remove()}}else{if(window.uploader&&window.uploader.reset_){window.uploader.reset_()}}var B=window.frames["searchFiles"];if(B){if("_clear_" in B){B._clear_()}}};$(function(){var C=$("#insertList02 ul");var A=['<li id="n_f_2">','<em class="e_word f_fl z_select" src="{0}" title="{1}"></em>','<span class="annex_numb">{2}</span><span class="ann_tx">{1}</span>','<em class="annex_dele"></em>',"</li>"].join("");var B=window._MAX_==1;$("ul.tab_ul li:eq(2)").click(function(){if($("#xzxc").find("option").length>0){return}$("#xzxc").append($("#ddlColumns").find("option").clone());loadJs("js/other/ajax.js");$(document).on("click","ul li",function(E){var F=$(this);if(E&&E.target&&E.target.tagName=="EM"){var D=$(E.target);if(D.hasClass("annex_dele")){F.remove()}return}if(!B){F.addClass("zon")}else{F.addClass("zon").siblings().removeClass("zon")}});$("#insertList02 li.add").remove();$("#shuru").unbind("click").bind("click",function(){var D=[];var E=$("#insertList02 li em.e_word.z_select");if(E.length){E.each(function(G){var H=$(this);var F=H.parents("li").addClass("add");D[G]={error:0,name:H.attr("title"),title:H.attr("title"),url:H.attr("src")}});__callback(D,popid,window._MAX_==1?"False":"True")}else{_alert("请填写附件！");return}})});$(document).on("click","span.add",function(E){var F=$(this);var D=F.parents(".loadbar");loadJs("js/other/ajax.js",function(){var I=D.find(".pictureAddress");var G=D.find(".pictureTitle");var H=$("#xzxc");if(I.val()==""){_alert("请填写附件地址！");return}_PostAjax("addLocal",{ColumnID:H.val(),pictureTitle:G.val(),pictureAddress:I.val(),isfile:true},function(K){var M=_Json(K);if(M.error){_alert("添加成功！");C.append(A.replace(/\{0\}/g,I.val()).replace(/\{1\}/g,M.msg));var J=C.find("li:last");var L=C.find("li").length;if(L<10){L="0"+L}J.find(".annex_numb").text(L);I.val("");G.val("");return}_alert(M.msg)})})})});