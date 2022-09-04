<%@ page language="C#" autoeventwireup="true" inherits="Mobile_MHelp_CompanyMap, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0,user-scalable=0" />
    <title>公司地图</title>
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
            height: 530px;
            width:100%;
            position:absolute;
            top:0;
            left:0; 
            z-index:10;
        }

        @media print {
            #notes {
                display: none;
            }

            #map_container {
                margin: 0;
            }
        }

        .iw_poi_title {
            color: #CC5522;
            font-size: 14px;
            font-weight: bold;
            overflow: hidden;
            padding-right: 13px;
            white-space: nowrap;
        }

        .iw_poi_content {
            font: 12px arial,sans-serif;
            overflow: visible;
            padding-top: 4px;
            word-wrap: break-word;
        }

        .iw_poi_phone a:link {
            display: block;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            background-image: url(/mobile/images/common/tel_bt.png);
            background-position: 20px center;
            background-repeat: no-repeat;
            background-size: 20px 20px;
        }

        .iw_poi_phone {
            border-radius: 3px;
            margin: 8px 0;
            text-indent: 50px;
            font: 14px arial,sans-serif;
            line-height: 23px;
            overflow: visible;
            padding-top: 4px;
            word-wrap: break-word;
            display: block;
            height: 25px;
            width: 100%;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#88CF32), to(#669C26));
            background-image: -webkit-linear-gradient(top, #88CF32, #669C26);
            background-image: -moz-linear-gradient(top, #88CF32, #669C26);
            background-image: -o-linear-gradient(top, #88CF32, #669C26);
            background-image: -ms-linear-gradient(top, #88CF32, #669C26);
            background-image: linear-gradient(top, #88CF32, #669C26);
        }

        .m-find {
            color: #4c4c4c;
            min-width: 250px;
            margin-top: 10px;
            font: 12px arial,sans-serif;
        }

            .m-find .select-box {
                min-width: 250px;
                height: 29px;
                border: 1px solid #dadada;
                border-bottom: 0;
            }

                .m-find .select-box li {
                    float: left;
                    display: inline;
                    width: 50%;
                    height: 28px;
                    line-height: 28px;
                    text-align: center;
                    text-indent: 5px;
                    color: #3d6dcc;
                    border-bottom: 1px solid #dadada;
                    position: relative;
                    background-image: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#f6f6f6));
                    background-image: -webkit-linear-gradient(top, #ffffff, #f6f6f6);
                    background-image: -moz-linear-gradient(top, #ffffff, #f6f6f6);
                    background-image: -o-linear-gradient(top, #ffffff, #f6f6f6);
                    background-image: -ms-linear-gradient(top, #ffffff, #f6f6f6);
                    background-image: linear-gradient(top, #ffffff, #f6f6f6);
                }

                    .m-find .select-box li span {
                        display: block;
                        position: absolute;
                        width: 14px;
                        height: 16px;
                        background-image: url(/mobile/images/web/map_icon.png);
                        left: 50%;
                        margin-left: -40px;
                        top: 7px;
                    }
                    .m-find .select-box li:nth-child(1) span {
                        background-position: 15px 0;
                    }

                    .m-find .select-box li:nth-child(2) span {
                        background-position: 30px 0;
                    }

                    .m-find .select-box li:nth-child(3) span {
                        background-position: 0 0;
                    }

                    .m-find .select-box li:nth-child(1):after{
                        border-right: 1px solid #dadada;
                        content:'';
                        position:absolute;
                        right:0;
                        height:100%;
                    }

                    .m-find .select-box li.z-chose {
                        background: #fcfcfc;
                        border-bottom: 0;
                        color: #4d4d4d;
                    }

            .m-find .change-box {
                display: none;
                padding: 9px 5px;
            }

              

                .m-find .change-box#divId0 a {
                    float: left;
                    display: inline-block;
                    height: 22px;
                    line-height: 22px;
                    color: #3D6DCC;
                }

                .m-find .change-box#divId0 {
                    display: block;
                }

                .m-find .change-box .u-des {
                    margin-right: 10px;
                }

                .m-find .change-box .u-input {
                    border: 1px solid #a5acb2;
                    height: 23px;
                    width:120px;
                    margin-right: 8px;
                }

                .m-find .change-box .u-inputsearch {
                    border: 1px solid #a5acb2;
                    height: 23px;
                    margin-right: 8px;
                    width: 50px;
                }

                .m-find .change-box .u-tran {
                    width: 45px;
                    height: 23px;
                    border-radius: 3px;
                    color: #000;
                    text-align: center;
                    border: 1px solid #b7b7b7;
                    margin-right: 4px;
                    background-image: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#efefef));
                    background-image: -webkit-linear-gradient(top, #ffffff, #efefef);
                    background-image: -moz-linear-gradient(top, #ffffff, #efefef);
                    background-image: -o-linear-gradient(top, #ffffff, #efefef);
                    background-image: -ms-linear-gradient(top, #ffffff, #efefef);
                    background-image: linear-gradient(top, #ffffff, #efefef);
                }

        .drivingPanel {
            height: 530px;
            overflow:scroll;
            width:80%;
            display: none;
            position:absolute;
            z-index:0;
            left:0;
            top:0;
        }
        .g-mapbox {
            height:530px;
            z-index:0;
            position:relative;
            overflow:hidden;
        }
        .left_btn {
             width: 30px; height: 60px; position:absolute; top: 50%; margin-top: -30px; left: 0; z-index: 200; display:none;
        }
        .right_btn {
             width: 30px; height: 60px; position:absolute; top: 50%; margin-top: -30px; left: 80%; margin-left:-30px; z-index:200; display:none;
        }
        .black_bg {
             width:30%; height:530px; position:absolute; top:0;left:80%; opacity:0.6; background:#000; z-index:200; display:none;
        }
        /*]]>*/
    </style>
    <script type="text/javascript" src="/Mobile/js/Jquery.js"></script>
    <script type="text/javascript" src="/Mobile/js/Nsw_mobile.js"></script>
    <link href="/Mobile/css/skins.css" rel="stylesheet" type="text/css" />
    <link href="/Mobile/Css/common.css" rel="stylesheet" type="text/css" />
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
    <%
        NVelocity.VelocityContext Context = NVEngine.NVTempHelp.GetVelocityContext();
    %>
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/Header.html;M_Common/BackPreviousControl.html")%>
    <div class="g-mapbox">
        <div id="drivingPanel" class="drivingPanel"></div>
        <div id="map_container"></div>
        <div class="left_btn"><img src="/Mobile/Images/Web/left_btn.png" width="30" height="60" /></div>
        <div class="right_btn"><img src="/Mobile/Images/Web/right_btn.png" width="30" height="60" /></div>
        <div class="black_bg"></div>
    </div>
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/Footer.html")%>
    <!--弹出提示层-->
    <div class="max_bg" id="max_bg">
        <div class="contapic_bg"></div>
        <div class="right" id="right">
            <p>提交成功，我们会认真阅读您的信息！</p>
            <p><a href="javascript:void(0);" onclick="javascript:$('.right,.contapic_bg').hide();" class="blue retry">返回</a></p>
        </div>
    </div>
</body>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=F6fc727ad0570f8d2501b30779b3f615"></script>
<script type="text/javascript">    /*<![CDATA[*/
    //标注点数组 
    var _companyName = '<%= NSW.OConfig.GlobalConfig.SiteName  %>';
    var _address = '<%= NSW.Mobile.MobileConfig.FindMAddress  %>';
    var _phone = '<%= NSW.OConfig.GlobalConfig.FindPinServiceTel %>';
    var markerArr = [{ title: _companyName, content: _address, isOpen: 0, icon: { w: 21, h: 25, l: 92, t: 21, x: 6, lb: 5 }, phone: _phone }];
    var _lng='<%=NSW.Mobile.MobileConfig.Mlng %>';
    var _lat='<%=NSW.Mobile.MobileConfig.Mlat %>';
    
    var map = null;
    var topPoint = null;
    //创建和初始化地图函数：
    function initMap() {
        map = new BMap.Map("map_container", {     //在百度地图容器中创建一个地图 
            enableHighResolution: true			      //是否开启高清
        });

        if (_lng != "" && _lat != "")
        {
            markerArr[0].point = { "lng": _lng, "lat": _lat };
            topPoint = new BMap.Point(_lng, _lat);    // 创建点坐标
            map.centerAndZoom(topPoint, 17); //设定地图的中心点和坐标并将地图显示在地图容器中
            window.map = map;//将map变量存储在全局

            setMapEvent();        //设置地图事件
            addMapControl();      //向地图添加控件
            addMarker();          //向地图中添加marker
            slide();
        }
        else 
        {
            var myGeo = new BMap.Geocoder(); //地理编码
            myGeo.getPoint(markerArr[0].content, function (point)//根据地理描述获得坐标
            {
                if (point)
                {
                    topPoint = point;
                    markerArr[0].point = point;
                    map.centerAndZoom(point, 17);//设定地图的中心点和坐标并将地图显示在地图容器中
                    window.map = map;//将map变量存储在全局

                    setMapEvent();        //设置地图事件
                    addMapControl();      //向地图添加控件
                    addMarker();          //向地图中添加marker
                    slide();
                }
            }, markerArr[0].content);
        }
    }

    //地图事件设置函数：
    function setMapEvent() {
        map.enableInertialDragging(); //开启关系拖拽
        map.enableScrollWheelZoom();  //开启鼠标滚动缩放
    }

    //地图控件添加函数：
    function addMapControl() {
        //向地图中添加缩放控件
        var navCtrl = new BMap.NavigationControl({ anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_LARGE });
        map.addControl(navCtrl);
    }

    //创建marker
    function addMarker() {
        for (var i = 0; i < markerArr.length; i++) {
            var json = markerArr[i];
            //var arr = json.point.split("|");
            var p0 = markerArr[0].point.lng;
            var p1 = markerArr[0].point.lat;
            var point = new BMap.Point(p0, p1);
            var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point, { icon: iconImg });
            var iw = createInfoWindow(i);
            var label = new BMap.Label(json.title, { "offset": new BMap.Size(json.icon.lb - json.icon.x + 10, -20) });
            marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                borderColor: "#808080",
                color: "#333",
                cursor: "pointer"
            });

            (function () {
                var index = i;
                var _iw = createInfoWindow(i);

                var _marker = marker;
                _marker.openInfoWindow(_iw);
                _marker.addEventListener("click", function () {
                    this.openInfoWindow(_iw);
                });
                _iw.addEventListener("open", function () {
                    _marker.getLabel().hide();
                })
                _iw.addEventListener("close", function () {
                    _marker.getLabel().show();
                })
                label.addEventListener("click", function () {
                    _marker.openInfoWindow(_iw);
                })
                if (!!json.isOpen) {
                    label.hide();
                    _marker.openInfoWindow(_iw);
                }
            })()
        }
    }

    //创建InfoWindow
    function createInfoWindow(i) {
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_phone'><a href='tel:" + json.phone + "'>" + json.phone + "</a></div><div class='iw_poi_content'>" + json.content + "</div>" +
           '<div class="m-find">' +
           '<ul class="select-box">' +
           '<li class="z-chose" id="aId0" onclick="tab(\'divId\',\'aId\',0,2,\'z-chose\',0)"><span></span>到这里去</li>' +
           '<li id="aId1" onclick="tab(\'divId\',\'aId\',1,2,\'z-chose\',1)"><span></span>从这里出发</li>' +
           '</ul>' +

           '<div class="change-box" id="divId0">' +
           '<span class="u-des">起点</span>' +
           '<span id="divId0_0"><input type="text" id="BMap_S" onclick="Autocomplete(this,\'divId0_0\')" class="u-input">' +
           '<input type="button" onclick="transitRouteAction(1)" value="公交" class="u-tran">' +
           '<input type="button" onclick="drivingRouteAction(1)" value="驾车" class="u-tran">' +
           '</span></div>' +
           '<div class="change-box" id="divId1">' +
           '<span class="u-des">终点</span>' +
           '<span id="divId1_0"><input type="text" id="BMap_E" onclick="Autocomplete(this,\'divId1_0\')" class="u-input">' +
           '<input type="button" onclick="transitRouteAction(2)" value="公交" class="u-tran">' +
           '<input type="button" onclick="drivingRouteAction(2)" value="驾车" class="u-tran">' +
           '</span></div>' +
           '</div>');

        return iw;
    }
    //创建一个Icon
    function createIcon(json) {
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w, json.h), { imageOffset: new BMap.Size(-json.l, -json.t), infoWindowOffset: new BMap.Size(json.lb + 5, 1), offset: new BMap.Size(json.x, json.h) })
        return icon;
    }
    function tab(id, aId, num1, num2, nameClass) {
        var dlBlock = document.getElementById(id + num1);
        var aArray = document.getElementById(aId + num1);
        for (var i = 0; i < num2; i++) {
            document.getElementById(id + i).style.display = 'none';
            document.getElementById(aId + i).className = ''; 
        }
        dlBlock.style.display = 'block';
        aArray.className = nameClass;
    }

    var routePolicy = [BMAP_TRANSIT_POLICY_LEAST_TIME,BMAP_TRANSIT_POLICY_LEAST_TRANSFER,BMAP_TRANSIT_POLICY_LEAST_WALKING,BMAP_TRANSIT_POLICY_AVOID_SUBWAYS];
    var transit = null;
    function getTransit(){
        if (transit == null) {
            map.centerAndZoom(topPoint, 17);
            transit = new BMap.TransitRoute(map, {
                renderOptions: {
                    map: map,
                    panel: "drivingPanel"
                },
                onSearchComplete: function () {
                    var g = transit.getStatus();
                    var b = showTipBox(g);
                    if (b) {
                        $("#drivingPanel").show();
                        $("#map_container").css("left", "80%");
                        $('.right_btn,.black_bg').show();
                    }
                }
            });
        }
        return transit;
    }

    var driving = null;
    function getDriving() {
        if (driving == null) {
            //map.centerAndZoom(topPoint, 14);
            driving = new BMap.DrivingRoute(map, {
                renderOptions: {
                    map: map,
                    panel: "drivingPanel",
                    autoViewport: true
                },
                onSearchComplete: function () {
                    var g = driving.getStatus();
                    var b = showTipBox(g);
                    if (b) {
                        $("#drivingPanel").show();
                        $("#map_container").css("left", "80%");
                        $('.right_btn,.black_bg').show();
                    }
                }
            });
        }
        return driving;
    }

    function transitRouteAction(v) {
        //公交导航
        var s = v == 1 ? $("#BMap_S").val() : $("#BMap_E").val();
        if (!s) {
            showTipBox("请填写地址");
            return;
        }
        var e = markerArr[0].content;

        map.clearOverlays();

        var transit = getTransit();
        if (v == 1) {//到这里去
            transit.search(s, e, topPoint);
        } else {
            transit.search(e, s, topPoint);
        }
    }

    function drivingRouteAction(v) {
        //驾车导航
        var s = v == 1 ? $("#BMap_S").val() : $("#BMap_E").val();
        if (!s) {
            showTipBox("请填写地址");
            return;
        }
        var e = markerArr[0].content;

        map.clearOverlays();
        var driving = getDriving();
        if (v == 1) {
            //到这里去
            driving.search(s, e, topPoint);
        } else {
            driving.search(e, s, topPoint);
        }
    }


    function showTipBox(e) {
        var b = true;
        var show = function (msg) {
            g = msg || "未搜索到准确的结果";
            $(".right").show();
            $(".right").find("p:first-child").text(g);
            $(".contapic_bg").show();
        }
        switch (e) {
            case BMAP_STATUS_UNKNOWN_LOCATION:
                show("位置结果未知");
                b = false;
                break;
            case BMAP_STATUS_UNKNOWN_ROUTE:
                show("导航结果未知");
                b = false;
                break
        }
        if (e !== BMAP_STATUS_SUCCESS) {
            e = e + "";
            show(e.length > 2 ? e : "");
            b = false;
        }
        return b;
    }

    function slide() {
        var drivingPanel = $("#drivingPanel");
        $('.left_btn').bind('click', function () {
            $('#map_container').css("left", '80%');
            $('.right_btn,.black_bg').show();
            $(this).hide();
            drivingPanel.show();
        })
        $('.right_btn').bind('click', function () {
            $(this).hide();
            $('.black_bg').hide();
            $('#map_container').css("left", '0%');
            $('.left_btn').show();
            drivingPanel.hide();
        })
    }


    var searchAC = null;
    function Autocomplete(obj1, id) {
        searchAC = new BMap.Autocomplete({
            input:obj1,
            location: map,
            baseDom: document.getElementById(id)
        });
        $(obj1).unbind("blur");
        $(obj1).bind("blur", function () { searchAC.hide(); })
    }
    initMap();

</script>
</html>
