<#include "common/layout.ftl"/>
<@html title_="武汉红鑫家具联系方式：400-678-5198">
    <!--新闻详细页-->
    <div class="g-bd">
        <!--新闻导航-->
        <h3 class="m-btit">
            <a href="/">首页</a>
            <span></span>
            <a href="/mobile/Mhelp/">帮助中心</a>
            <span></span>联系我们
        </h3>
        <div class="m-con">
            <!--新闻标题-->
            <div class="u-mtit f-tc s-wc">
                <h2>联系我们</h2>
            </div>
            <!--新闻内容-->
            <div id="content" class="m-mcon">
                <p style="color: rgb(51, 51, 51);">
                    <img src="/res/images/fangke.jpg" title="尊敬的访客" alt="尊敬的访客" />
                </p>
                <p style="color: rgb(51, 51, 51); padding-left: 92px;">
                    当您进入&ldquo;联系我们&rdquo;的页面时，您已成为我们最尊贵的客户，欢迎您从网上来到线下：来到美丽的江城&mdash;武汉。
                </p>
                <p style="color: rgb(51, 51, 51); padding-left: 92px;">
                    您可以通过以下几种方式联系我们。
                </p>
                <p style="color: rgb(51, 51, 51); padding-left: 92px;">
                    外地客户来武汉，请预约：<b>
                    <span style="color:#FF0000;">400-678-5198</span>
                </b>，我们将专车接送。
                </p>
                <p style="color: rgb(51, 51, 51);">
                    <img src="/res/images/contact.jpg" title="联系我们" alt="联系我们" />
                </p>
                <p style="color: rgb(51, 51, 51); padding-left: 92px;">
                    <b>销售中心24小时热线：</b>
                    <b>
                        <span style="color:#FF0000;">400-678-5198</span>
                    </b>
                </p>
                <p style="color: rgb(51, 51, 51); padding-left: 92px;">
                    <b>
                        <span style="color:#FF0000;">
                            <br />
                        </span>
                    </b>
                </p>
                <p style="padding-left: 92px;">
                    销售热线：<span style="word-spacing:-1.5px">027-83939586</span>
                </p>
                <p style="padding-left: 92px;">
                    <br />
                    手 机：18207180188
                </p>
                <p style="padding-left: 92px;">
                    <br />
                    旗舰展厅：武汉市光谷大道未来之光6栋1-3楼
                </p>
                <p style="padding-left: 92px;">
                    <br />
                    工厂展厅：武汉市汉口北大道五百亩工业园
                </p>
                <p style="color: rgb(51, 51, 51); padding-left: 92px;">
                    <br />
                </p>
                <p style="color: rgb(51, 51, 51); padding-left: 92px;">
                    <img src="/res/images/weixin2.jpg" title="红鑫家具" alt="红鑫家具" />
                </p>
                <p style="color: rgb(51, 51, 51); padding-left: 92px;">
                    <br />
                </p>
                <p style="color: rgb(51, 51, 51);">
                    <img src="/res/images/map.jpg" title="地图路线" alt="地图路线" />
                </p>
                <style>
                    .BMap_Marker{background:url(/res/images/map_point.png) no-repeat!important;    position: absolute;padding: 0px;margin: 0px;border: 0px;cursor: pointer;left: 147px;top: 153px;z-index: -6125060;}
                </style>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
                <meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
                <title>
                    百度地图API自定义地图
                </title>
                <!--引用百度地图API-->

                <!--百度地图容器-->
                <div style="border:#ccc solid 1px;font-size:12px" id="map">
                </div>
                <script type="text/javascript">
                    //创建和初始化地图函数：
                    function initMap(){
                        createMap();//创建地图
                        setMapEvent();//设置地图事件
                        addMapControl();//向地图添加控件
                        addMapOverlay();//向地图添加覆盖物
                    }
                    function createMap(){
                        map = new BMap.Map("map");
                        map.centerAndZoom(new BMap.Point(114.581982,30.631804),10);
                    }
                    function setMapEvent(){
                        map.enableScrollWheelZoom();
                        map.enableKeyboard();
                        map.enableDragging();
                        map.enableDoubleClickZoom()
                    }
                    function addClickHandler(target,window){
                        target.addEventListener("click",function(){
                            target.openInfoWindow(window);
                        });
                    }
                    function addMapOverlay(){
                        var markers = [
                            {content:"地址：武汉市光谷大道未来之光6号楼一楼<br/>电话：027-61520188",title:"光谷展厅",imageOffset: {width:-46,height:-21},position:{lat:30.509555,lng:114.430487}},
                            {content:"地址：武汉市汉口北大道家具CBD五百亩工业园内<br/>电话：18207180189",title:"工厂展厅",imageOffset: {width:-46,height:-21},position:{lat:30.720666,lng:114.380744}}
                        ];
                        for(var index = 0; index < markers.length; index++ ){
                            var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
                            var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
                                    imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
                                })});
                            var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
                            var opts = {
                                width: 200,
                                title: markers[index].title,
                                enableMessage: false
                            };
                            var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
                            marker.setLabel(label);
                            addClickHandler(marker,infoWindow);
                            map.addOverlay(marker);
                        };
                    }
                    //向地图添加控件
                    function addMapControl(){
                        var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
                        scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
                        map.addControl(scaleControl);
                        var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
                        map.addControl(navControl);
                        var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
                        map.addControl(overviewControl);
                    }
                    var map;
                    initMap();
                </script>
                <p style="color: rgb(51, 51, 51);">
                    <b style="color: rgb(255, 0, 0); text-align: center; word-spacing: -1.5px;">
                        <br />
                    </b>
                </p>
                <p style="text-align: center;">
                    <img src="/res/images/zt_guanggu_way.jpg" title="20170508142411_4872" alt="20170508142411_4872" />
                </p>
                <p style="color: rgb(51, 51, 51); text-align: start;">
                    <b style="color: rgb(255, 0, 0); text-align: center; word-spacing: -1.5px;"></b>
                </p>
                <p style="text-align: center;">
                    <b style="color: rgb(255, 0, 0); text-align: center; word-spacing: -1.5px;">
                        <span style="color:#000000;"> 光谷展厅：光谷大道未来之光6号楼1-3楼，联系电话：</span>400-678-5198
                    </b>
                </p>
                <p style="color: rgb(51, 51, 51);">
                    <b style="color: rgb(255, 0, 0); text-align: center; word-spacing: -1.5px;">
								<span style="color:#000000">
									<br />
								</span>
                    </b>
                </p>
                <p style="text-align: center;">
                    <img src="/res/images/zt_guanggu.jpg" title="门头已批" alt="门头已批" />
                </p>
                <p style="color: rgb(51, 51, 51); text-align: center;">
                    <img src="/res/images/zt_guanggu_map.jpg" title="lADPDgQ9qmOhBTjNAkTNA7s_955_580" alt="lADPDgQ9qmOhBTjNAkTNA7s_955_580" />
                </p>
                <div>
                    <p style="text-align: center;">
                        <br />
                    </p>
                </div>
                <p style="text-align: left; padding-left: 92px; color: rgb(51, 51, 51);">
                    <b>百度地图搜索：<span style="color:#ff0000">未来之光</span>
                    </b>
                </p>
                <p style="text-align: left; padding-left: 92px; color: rgb(51, 51, 51);">
                    光谷展厅位于光谷大道与珞喻路交汇处（光谷8号正对面），提前预约红鑫家具可提供免费停车报销往返车费哦。
                </p>
                <p style="text-align: center;">
                    <img src="/res/images/bus_way.jpg" title="20161107165529_4822" alt="20161107165529_4822" />
                </p>
                <p style="text-align: center;">
                    <br />
                </p>
                <p style="text-align: left; padding-left: 92px; color: rgb(51, 51, 51);">
                    <b>
                        <b>
                            <span style="color:#ff0000">光谷展厅乘车路线：</span>
                        </b>
                    </b>
                </p>
                <p style="text-align: left; padding-left: 92px; color: rgb(51, 51, 51);">
                    <b>轨道交通2号线：</b>
                </p>
                <p style="text-align: left; padding-left: 92px; color: rgb(51, 51, 51);">
                    2号线&rarr;光谷大道站B出口<span style="color:#ff0000">&rarr;未来之光6栋1-3楼</span>
                </p>
                <p style="text-align: left; padding-left: 92px; color: rgb(51, 51, 51);">
                    <b>公交路线：</b>
                </p>
                <p style="text-align: left; padding-left: 92px; color: rgb(51, 51, 51);">
							<span style="color:#ff0000">
								<span style="color:#000000">武汉市内乘</span>18、25、327、340、513、518、536、591、702、<span style="color:#000000">
									<span style="color:#ff0000">703</span>路公交到<span style="color:#ff0000">&ldquo;珞喻东路光谷大道站</span>
								</span>
								<span style="color:#000000">
									<span style="color:#ff0000">&rdquo;</span>下车。
								</span>
							</span>
                </p>
                <p style="text-align: left;">
                    <br />
                </p>
                <p style="color: rgb(67, 67, 67); font-family: Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);">
                    <img src="/res/images/zt_hankou_way.jpg" title="汉口展厅" alt="汉口展厅" />
                </p>
                <p style="text-align: center; color: rgb(67, 67, 67); font-family: Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);">
							<span style="color:#FF0000;">
								<b>
									<span style="color:#000000;">工厂展厅</span>
									<span style="color: rgb(0, 0, 0);" microsoft="" yahei",="" 微软雅黑;="" text-align:="" center;="" word-spacing:="" -1.5px;"="">：武汉市汉口北大道五百亩工业园 </span>
                    <span style="color:#000000;">联系电话：</span>027-83939586
                    </b>
                    </span>
                </p>
                <p style="text-align: center; color: rgb(67, 67, 67); font-family: Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);">
                    <br />
                </p>
                <p style="color: rgb(51, 51, 51); text-align: center;">
                    <img src="/res/images/红鑫家具厂家外景_large.jpg" title="武汉红鑫家具厂" alt="武汉红鑫家具厂" />
                </p>
                <span style="color:#FF0000;">
							<p style="color: rgb(51, 51, 51); text-align: left; padding-left: 92px;">
								<br />
							</p>
						</span>
            </div>
            <!--分页-->
            <#include "common/contactus.ftl"/>
        </div>
    </div>
</@html>