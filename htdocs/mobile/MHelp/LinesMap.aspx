<%@ page language="C#" autoeventwireup="true" inherits="Mobile_MHelp_LinesMap, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <title>乘车路线</title>
    <style type="text/css">
        /*<![CDATA[*/
        body {
            margin: 0;
            padding: 0;
            font-family: Times New Roman, serif;
        }

        p {
            margin: 0;
            padding: 0;
        }

        html, body {
            width: 100%;
            height: 100%;
        }

        #map_container {
            height: 80%;
            border: 1px solid #999;
        }


        @media print {
            #notes {
                display: none;
            }

            #map_container {
                margin: 0;
            }
        }
        /*]]>*/
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
    <script src="/Mobile/JS/SearchControl_min.js"></script>
    <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchControl/1.4/src/SearchControl_min.css" />
    <link href="/Mobile/css/skins.css" rel="stylesheet" type="text/css" />
    <link href="/Mobile/Css/common.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/Mobile/js/Jquery.js"></script>
    <script type="text/javascript" src="/Mobile/js/Nsw_mobile.js"></script>
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
    <a name="top"></a>
    <%NVelocity.VelocityContext Context = NVEngine.NVTempHelp.GetVelocityContext();%>
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/Header.html;M_Common/BackPreviousControl.html")%>
    <div>
        <span style="margin-left:10px;">请选择乘车方式:</span>
        <select id="drpSelectType" style="margin-bottom:10px;height:24px; margin-top:15px; width:150px; ">
            <option value="1" >周边搜索</option>
            <option value="2" selected="selected">公交路线</option>
            <option value="3">驾车路线</option>
        </select>
    </div>
    <div id="searchBox"></div>
    <div id="map_container" style="display: none;"></div>
    <div id="panel"></div>
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/Footer.html")%>
    <!--底部开始-->
</body>
<script type="text/javascript">    /*<![CDATA[*/
    //标注点数组 
    var _companyName = '<%= NSW.OConfig.GlobalConfig.SiteName==""?"深圳市牛商网络有限公司":NSW.OConfig.GlobalConfig.SiteName  %>';
    var _address = '<%= NSW.Mobile.MobileConfig.FindMAddress==""?"福田区梅华路东方星大厦3栋1-2层":NSW.Mobile.MobileConfig.FindMAddress  %>';
    var _phone = '<%= NSW.OConfig.GlobalConfig.FindPinServiceTel %>';
    var markerArr = [{ title: _companyName, content: _address, isOpen: 0, icon: { w: 21, h: 21, l: 0, t: 0, x: 6, lb: 5 }, phone: _phone }];
    //检索类型
    var type = "";
    //type = LOCAL_SEARCH;   //周边检索
    type = TRANSIT_ROUTE; //公交检索
    //type = DRIVING_ROUTE; //驾车检索
    //创建和初始化地图函数：
    function initMap() {
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
    }

    //创建地图函数：
    function createMap() {
        var map = new BMap.Map("map_container", {     //在百度地图容器中创建一个地图 
            enableHighResolution: true			      //是否开启高清
        });
        var point = new BMap.Point(114.061879, 22.570036);//定义一个中心点坐标  
        map.centerAndZoom(point, 17);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }

    //地图事件设置函数：
    function setMapEvent() {
        map.enableInertialDragging(); //开启关系拖拽
        map.enableScrollWheelZoom();  //开启鼠标滚动缩放
    }

    //地图控件添加函数：
    function addMapControl() {
        //创建检索控件
        var searchControl = new BMapLib.SearchControl({
            container: "searchBox"   //存放检索控件的容器
            , map: map           //检索的关联地图
            , type: type              //检索类型
        });

        document.getElementById("drpSelectType").onchange = function () {
            searchControl.setType(this.value);
        };
    }
    initMap();//创建和初始化地图
    /*]]>*/</script>
</html>
