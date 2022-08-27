<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.admin_systemlog, qwt" enableviewstate="false" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>后台操作日志</title>
<link href="skins/base/superadmin.css" rel="stylesheet" type="text/css"/>
<!-- hongxin.com.cn/Mobile Baidu tongji analytics -->
<script>
var _hmt = _hmt || [];
(function() {
var hm = document.createElement("script");
hm.src = "https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d";
var s = document.getElementsByTagName("script")[0];
s.parentNode.insertBefore(hm, s);
})();
</script>
</head>
<body>
<div class="so_bread">
    <div class="nsw_bread_tit f_cb">
        <SpanCurrentPosition:SpanCurrentPosition runat="server"/>
	    <div class="advanced_so f_fr">
		    <div class="search_so f_fl">
			    <input type="text" class="so_text clear_word f_fl" />
			    <input type="button" class="so_btn f_csp f_fl" />
		    </div>
		    <span class="advan_btn f_fl f_csp">高级</span>	
	    </div>
    </div>
    <div  class="advan_posi so_log f_cb form_search">
 
    <ul>
	    <li>
		    <label class="com_name">操作人姓名</label>
			    <span class="clear_bd">
			    <input class="com_input clear_word" type="text" name="cuser" placeholder="请填写操作人姓名" />
			    <i class="clear_x"></i>
			    </span>
		    </li>
	    <li>
		    <label class="com_name">操作对象</label>
			    <span class="clear_bd">
			    <input class="com_input clear_word" type="text" name="cname" placeholder="请填写操作对象" />
			    <i class="clear_x"></i>
			    </span>
		    </li>
	    <li>
		    <label class="com_name">具体操作</label>
			    <span class="clear_bd">
			    <input class="com_input clear_word" type="text" name="desc" placeholder="请填写具体操作" />
			    <i class="clear_x"></i>
			    </span>
		    </li>
	   <%-- <li>
		    <label class="com_name">操作标题</label>
			    <span class="clear_bd">
			    <input class="com_input clear_word" type="text" name="desc" placeholder="请填写操作标题">
			    <i class="clear_x"></i>
			    </span>
		    </li>--%>
	    <li>
		    <label class="com_name">操作IP</label>
			    <span class="clear_bd">
			    <input class="com_input clear_word" type="text" name="ip" placeholder="请填写操作IP" />
			    <i class="clear_x"></i>
			    </span>
		    </li>
	    <li class="dn">		
		    <label class="com_name">操作时间</label><span class="np1 f_fl">从</span>
		    <span class="f_fl"><input class="com_input bor1 wth1 clear_word " type="text" id="begin_date" name="starttime" placeholder="请选择开始时间"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'endtime\')}'})" /></span><span class="np1 f_fl">到</span><span class="f_fl"><input class="com_input bor1 wth1 clear_word f_fl " type="text" id="endtime" name="endtime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'begin_date\')}',maxDate:'%y-%M-%d %H:%m'})" placeholder="请选择结束时间"/></span>
	    </li>
	    <li class="log_btn"><input type="button" class="advan_so_btn f_csp " value="搜索" onclick="SearchObjectByGet(this)"/></li>
    </ul>
        </div>
    </div>

				<div class="col_main">
					<!-- content_index -->
					
					<!-- 头部工具栏 开始 -->
					<div class="nsw_tools_bar f_cb">
	        <ul class="nsw_check_btns f_fl">
		        <li class="f_ml20">
                    <span class="sele_all"><input type="radio" class="dn" /><em class="e_word"></em>全选</span>|
                    <span class="sele_inverse">反选</span>
                </li>
		        <li class="f_ml20"><span  class="xLogDelete">删除</span>|<span class="xLogEmpty">清空日志</span>|<span class="xLogExport">导出日志</span>
                </li>
	        </ul>
	        <div class="nsw_pagination f_fr f_mr20 f_cb">
                <IndexNavi:IndexNavigator runat="server" ID="IndexNavigator1" />
	        </div>
        </div>
					
					<!-- 头部工具栏 结束 --> 
					
					<!-- 列表区 开始 -->
        <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
            <tr id="tabHeader">
                <th style="width:50px" class="p"><span class="cho">选择</span></th>
                <th axis="[ID]" style=" width:50px;">序列</th>
                <th class="tcenter" style="width:120px"  axis="[UserName]">操作人</th>  
                <th class="tcenter" style="width:120px"  axis="[ColumnName]">操作对象</th>        
                <th style="width:150px" axis="[ShortDesc]">具体操作</th>   
                <th style="width:50px" axis="[LastIP]">操作IP</th>
                <th style="width:120px" axis="[InputTime]" class="tcenter">操作时间</th>
            </tr>
            <asp:Repeater ID="rptMain" runat="server"><ItemTemplate>
            <tr class="child_1">
                <td class="td1">
                    <div class="nsw_check_box">
                        <span class="ck_box">
                            <span class="dn">
                                <input type="checkbox" name="chkItem" value="<%#Eval("ID") %>"/>
                            </span>
                        </span>
                    </div>
                </td>
                <td><%#Eval("ID") %></td>
                <td>
                    <div class="">
                        <%#Eval("UserName") %>
                    </div>
                </td>
                <td>
                    <div class="">
                        <%#Eval("ColumnName") %>
                    </div>    
                </td>
                <td>
                    <div class="">
                        <%#Eval("ShortDesc")%>
                    </div>  
                </td>
                <td>
                    <div class="" >
                        <%#Eval("LastIP") %>
                    </div>  
                </td>
                <td>
                    <span><%#((DateTime)Eval("InputTime")).ToString("yyyy-MM-dd<br />HH:mm:ss")%></span>
                </td>
            </tr>
            </ItemTemplate></asp:Repeater>
            <tr id="noItemYet" runat="server" visible="false"><td class="noItemYet" style=" text-align:center;" colspan="99">没有任何项目</td></tr>
        </table>
					<!-- 列表区 结束 -->
						
					<!-- 列表分页 开始 -->
<div class="nsw_tools_bar f_cb">
	        <ul class="nsw_check_btns f_fl">
		        <li class="f_ml20">
                    <span class="sele_all"><input type="radio" class="dn" /><em class="e_word"></em>全选</span>|
                    <span class="sele_inverse">反选</span>
                </li>
		        <li class="f_ml20"><span  class="xLogDelete">删除</span>|<span class="xLogEmpty">清空日志</span>|<span class="xLogExport">导出日志</span>
                </li>
	        </ul>
	        <div class="nsw_pagination f_fr f_mr20 f_cb">
                <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	        </div>
        </div>
					<!-- 列表分页 结束 -->
				    
				</div>
<script src="/manager/js/other/ajax.js" type="text/javascript"></script>
<script type="text/javascript">
    var LogInfo = {
        refresh: function (src) {
            window.location.href = src || window.location.href;
        }
    };
    //删除日志
    $(".xLogDelete").unbind("click").bind("click", function () {
        var data = SerializeCheckID();
        if (data == "") { _alert("未有选中项"); return; }
        _confirm("确实要删除这些操作日志吗？如果确认删除，则出现问题的时候，无法查看团队具体工作情况。", function () {
            _PostAjax("dellog", { "ids": data, "type": "dellog" }, function (msg) {
                var data = _Json(msg);
                if (data.error) {
                    _alert(data.msg, true, function () {
                        LogInfo.refresh();
                    });
                } else {
                    _alert(data.msg);
                }
            });
        });
    });
    //清空并导出日志
    $(".xLogEmpty").unbind("click").bind("click", function () {
        var msg = "清空日志会自动备份日志并下载。";
        _confirm(msg, function () {
            _PostAjax("emptylog", { "type": "dellog", "cmd": "del" }, function (msg) {
                var data = _Json(msg);
                if (data.error) {
                    _alert("清空日志成功！备份日志正在下载中...", true, function () {
                        LogInfo.refresh(data.msg);
                        setTimeout("LogInfo.refresh()", 5000);
                    });
                }
            });
        });
    });
    //导出日志
    $(".xLogExport").unbind("click").bind("click", function () {
        _PostAjax("emptylog", { "type": "dellog", "cmd": "export" }, function (msg) {
            var data = _Json(msg);
            if (data.error) {
                _alert("备份日志正在下载中...", true, function () {
                    LogInfo.refresh(data.msg);
                });
            }
        });
    });
//var sltedItemCnt=0;
//altRow(1,"itemListTab","odd","even");
//hoverRow(1,"itemListTab","over");
//$("#pagerTop").html($("#pagerBtm").html());
//initRowClick(0);
//hoverTabHeader("itemListTab","tbTitOver");
//setOrderSign("<%= SqlOrder %>");
</script>
</body>
</html>