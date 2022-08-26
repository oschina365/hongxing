<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
    <head>
        <meta name="renderer" content="webkit" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="/manager/skins/base/common.css" rel="stylesheet" type="text/css" />
        <link href="/manager/skins/default/default.css" rel="stylesheet" type="text/css" />
        <link href="/manager/skins/base/index.css" rel="stylesheet" type="text/css" />
        <meta name="description" />
        <meta name="keywords" />
        <title>
            武汉红鑫家俱有限公司网站后台
        </title>
        <link href="skins/base/editInterface.css" rel="stylesheet" type="text/css" />
        <link href="skins/base/products.css" rel="stylesheet" type="text/css" />
        <link href="skins/base/dialog.css" rel="stylesheet" type="text/css" />
        <!-- hongxin.com.cn/Mobile Baidu tongji analytics -->
        <script>
            var _hmt = _hmt || [];
            (function () {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>
        <script type="text/javascript" src="js/easyui/jquery.min.js"></script>
        <script type="text/javascript" src="home.aspx?t=config"></script>
    </head>
    <body>
        <!-- Header -->
        <div class="top_line">
            <div class="header">
                <h1 class="nsw_logo">
                    <a href="iIndex.aspx" target="frmEditor"></a>
                </h1>
                <div class="hd_r f_fr f_tar">
                    <div class="help_centre">
                        <a href="/" target="_blank" title="网站首页">网站首页</a>|
                        <a href="http://www.nsw88.com/peixun.shtml" target="_blank" title="帮助中心">帮助中心</a>|
                        <a href="http://i.youku.com/nswvideo" target="_blank" title="后台教程">后台教程</a>|
                        <a href="entrance.aspx" target="_blank" title="牛商学堂">牛商学堂</a>
                    </div>
                    <div class="manager_info">
                        <a href="#" class="adm">hxnsw 欢迎您来到<b>武汉红鑫家俱有限公司</b>网站后台</a>|
                        <a href="iIndex.aspx" target="frmEditor">帐户管理</a>|
                        <a href="del_html.aspx" target="frmEditor">清除缓存</a>|
                        <a href="javascript:;" id="widthscreen">宽屏</a>|
                        <a href="admin_logout.aspx">退出</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- wrap -->
        <div class="wrap">
            <div class="content f_cb">
                <!-- leftbar -->
                <div class="col_side">
                    <div class="menu_name">我的工具</div>
                    <div class="menu_line">
                        <div id="menuBar" class="menu_box">

                            <div class="menu color_tex">
                                <h3 class="menu_title">
                                    <em class="yel_line"></em>
                                    <span class="mu_ico "></span>
                                    <a href="javascript:;" target="frmEditor">
                                        <b>产品管理</b>
                                    </a>
                                </h3>
                                <ul style="display:none;">
                                    <li class="menu_item">
                                        <a href="https://www.baidu.com" target="frmEditor" class="zon_line">添加产品<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="products.aspx" target="frmEditor" class="zon_line">产品列表<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="product_column_edit.aspx" target="frmEditor" class="zon_line">添加分类<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="product_column.aspx" target="frmEditor" class="zon_line">产品分类<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="product_comment.aspx" target="frmEditor" class="zon_line">产品评论<em class="yel_line"></em>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="menu color_tex">
                                <h3 class="menu_title">
                                    <em class="yel_line"></em>
                                    <span class="mu_ico news_ico"></span>
                                    <a href="#" target="frmEditor">
                                        <b>资讯管理</b>
                                    </a>
                                </h3>
                                <ul style="display:none;">
                                    <li class="menu_item">
                                        <a href="news_edit.aspx" target="frmEditor" class="zon_line">添加文章<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="news.aspx" target="frmEditor" class="zon_line">文章列表<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="news_column_edit.aspx" target="frmEditor" class="zon_line">分类录入<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="news_column.aspx" target="frmEditor" class="zon_line">分类列表<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="news_comment.aspx" target="frmEditor" class="zon_line">文章评论<em class="yel_line"></em>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="menu color_tex">
                                <h3 class="menu_title">
                                    <em class="yel_line"></em>
                                    <span class="mu_ico news_ico"></span>
                                    <a href="#" target="frmEditor">
                                        <b>公司管理</b>
                                    </a>
                                </h3>
                                <ul style="display:none;">
                                    <li class="menu_item">
                                        <a href="helps_edit.aspx" target="frmEditor" class="zon_line">公司文档录入<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="helps.aspx" target="frmEditor" class="zon_line">公司信息列表<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="help_column_edit.aspx" target="frmEditor" class="zon_line">分类录入<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="help_column.aspx" target="frmEditor" class="zon_line">分类列表<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="help_comment.aspx" target="frmEditor" class="zon_line">帮助评论<em class="yel_line"></em>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="menu color_tex">
                                <h3 class="menu_title">
                                    <em class="yel_line"></em>
                                    <span class="mu_ico "></span>
                                    <a href="#" target="frmEditor">
                                        <b>手机管理</b>
                                    </a>
                                </h3>
                                <ul style="display:none;">
                                    <li class="menu_item">
                                        <a href="mobilebatchimg.aspx" target="frmEditor" class="zon_line">手机图片批量转换<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="mobileconfig.aspx" target="frmEditor" class="zon_line">手机网站参数配置<em class="yel_line"></em>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="menu color_tex">
                                <h3 class="menu_title">
                                    <em class="yel_line"></em>
                                    <span class="mu_ico seo_ico"></span>
                                    <a href="#" target="frmEditor">SEO优化</a>
                                </h3>
                                <ul style="display:none;">
                                    <li class="menu_item">
                                        <a href="sitepage.aspx" target="frmEditor" class="zon_line">独立页面SEO设置<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="sitemap.aspx" target="frmEditor" class="zon_line">网站地图<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="site_seo_config.aspx" target="frmEditor" class="zon_line">网站默认SEO设置<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="keywords.aspx" target="frmEditor" class="zon_line">关键词管理<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="tags.aspx" target="frmEditor" class="zon_line">Tag标签管理<em class="yel_line"></em>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="menu color_tex">
                                <h3 class="menu_title">
                                    <em class="yel_line"></em>
                                    <span class="mu_ico "></span>
                                    <a href="#" target="frmEditor">
                                        <b>订单管理</b>
                                    </a>
                                </h3>
                                <ul style="display:none;">
                                    <li class="menu_item">
                                        <a href="orders.aspx" target="frmEditor" class="zon_line">意向订单管理<em class="yel_line"></em>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="menu color_tex">
                                <h3 class="menu_title">
                                    <em class="yel_line"></em>
                                    <span class="mu_ico overall_ico"></span>
                                    <a href="#" target="frmEditor">全局设置</a>
                                </h3>
                                <ul style="display:none;">
                                    <li class="menu_item">
                                        <a href="site_basics_config.aspx" target="frmEditor" class="zon_line">网站基础设置<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="site_columns_config.aspx" target="frmEditor" class="zon_line">网站栏目设置<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="site_detail_config.aspx" target="frmEditor" class="zon_line">网站详细配置<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="site_talk99_config.aspx" target="frmEditor" class="zon_line">网站Talk99配置<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="site_adv_config.aspx" target="frmEditor" class="zon_line">网站高级参数配置<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="site_other_config.aspx" target="frmEditor" class="zon_line">网站其它配置<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="site_config_mail_subject.aspx" target="frmEditor" class="zon_line">网站邮件发送设置<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="site_email_config.aspx" target="frmEditor" class="zon_line">网站邮箱账号设置<em class="yel_line"></em>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="menu color_tex">
                                <h3 class="menu_title">
                                    <em class="yel_line"></em>
                                    <span class="mu_ico "></span>
                                    <a href="#" target="frmEditor">系统管理</a>
                                </h3>
                                <ul style="display:none;">
                                    <li class="menu_item">
                                        <a href="admin_systemmenu.aspx" target="frmEditor" class="zon_line">后台菜单管理<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="admin_permission.aspx" target="frmEditor" class="zon_line">后台权限管理<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="admin_systemlog.aspx" target="frmEditor" class="zon_line">后台操作日志<em class="yel_line"></em>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="menu color_tex">
                                <h3 class="menu_title">
                                    <em class="yel_line"></em>
                                    <span class="mu_ico "></span>
                                    <a href="#" target="frmEditor">高级设置</a>
                                </h3>
                                <ul style="display:none;">
                                    <li class="menu_item">
                                        <a href="admin_admin.aspx" target="frmEditor" class="zon_line">管理员管理<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="template.aspx" target="frmEditor" class="zon_line">网页模块管理<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="mune_config.aspx" target="frmEditor" class="zon_line">配置主导航<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="tbforms.aspx" target="frmEditor" class="zon_line">自定义表单管理<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="recyclebin.aspx" target="frmEditor" class="zon_line">回收站<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="nvcontrols.aspx" target="frmEditor" class="zon_line">控件库<em class="yel_line"></em>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="menu color_tex">
                                <h3 class="menu_title">
                                    <em class="yel_line"></em>
                                    <span class="mu_ico "></span>
                                    <a href="#" target="frmEditor">其他管理</a>
                                </h3>
                                <ul style="display:none;">
                                    <li class="menu_item">
                                        <a href="leaveword.aspx" target="frmEditor" class="zon_line">客户留言<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="im_service.aspx" target="frmEditor" class="zon_line">在线客服<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="friend_links.aspx" target="frmEditor" class="zon_line">友情链接<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="video.aspx" target="frmEditor" class="zon_line">产品视频管理<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="applys.aspx" target="frmEditor" class="zon_line">申请友情连接管理<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="onekeyhtml.aspx" target="frmEditor" class="zon_line">全站生成静态页<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="ads.aspx" target="frmEditor" class="zon_line">广告管理<em class="yel_line"></em>
                                        </a>
                                    </li>

                                    <li class="menu_item">
                                        <a href="tbleavemessage.aspx?oid=1" target="frmEditor" class="zon_line">体验卡免费申请 <em class="yel_line"></em>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                        <div class="drag_receive">
                            <a href="admin_systemmenu_edit.aspx" target="frmEditor">
                                <span></span>
                            </a>
                        </div>

                    </div>
                </div>
                <!-- right box -->
                <div class="float_box">
                    <script type="text/javascript">
                        window.top.SetHeight = function () {
                            var frmEditor = $("#frmEditor");
                            var h = frmEditor.contents().find("body").height();
                            h = parseInt(h);
                            if (!isNaN(h) && h > 20) {
                                var _h = $("div.col_side").height();
                                if (h < _h) {
                                    h = _h;
                                }
                                h = frmEditor.data("setheight") ? h : h + 20;
                                frmEditor.height(h);
                                frmEditor.data("setheight", true);
                            } else {
                                frmEditor.height(1500);
                            }
                        }

                        function SaveURL(url) {
                            alert(url)
                            //var _href = url || (window.location + '');
                        }
                    </script>
                    <div class="col_main">
                        <form name="form1" method="post" action="iindex.aspx" id="form1" onsubmit="top.refreshList=true">
                            <div>
                                <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE0NjA2MDc1NDFkZM49dZ/Mr9sELEOHm7cZn8vnx1cf">
                            </div>

                            <div>

                                <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="46E9496E">
                                <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWCgKx66CeDAKl+4a0AQK14pzMDwLgmqeaDgLlw/y0AgKct7iSDAK9wKW7DAKBgtzIAwLdsKuIBAKM54rGBhMqD8EWebgMpE3ppsiShAUZc4qI">
                            </div>

                            <div class="bord_gray">
                                <div class="graybar_one f_cb">
                                    <div class="wel_name">欢迎登陆<span class="color_orange">武汉红鑫家俱有限公司</span>网站后台</div>
                                    <span class="wel_revise" id="wel_revise">[ 修改 ]</span>
                                </div>
                                <div class="wel_info">
                                    <table cellspacing="" cellpadding="0" class="admin_table table_class1">
                                        <tbody>
                                        <tr>
                                            <td class="td30">
                                                <label>姓 名</label>
                                                <em class="clear_bd">
                                                    <input name="txtChnName" type="text" id="txtChnName" class="com_input admin_name">
                                                    <i class="clear_x"></i>
                                                </em>
                                            </td>
                                            <td class="td30">
                                                <label>部 门</label>
                                                <em class="clear_bd">
                                                    <input name="txtDepartment" type="text" id="txtDepartment" class="com_input admin_name">
                                                    <i class="clear_x"></i>
                                                </em>
                                            </td>
                                            <td class="td30">管理员角色：普通管理员</td>
                                            <td class="td10"></td>
                                        </tr>
                                        <tr>
                                            <td class="td30">
                                                <label>手机号</label>
                                                <em class="clear_bd">
                                                    <input name="txtMPhone" type="text" id="txtMPhone" class="com_input admin_name">
                                                    <i class="clear_x"></i>
                                                </em>
                                            </td>
                                            <td class="td30">
                                                <label>E-mail</label>
                                                <em class="clear_bd">
                                                    <input name="txtUserEmail" type="text" id="txtUserEmail" class="com_input admin_name">
                                                    <i class="clear_x"></i>
                                                </em>
                                            </td>
                                            <td class="td30"></td>
                                            <td class="td10"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <td class="td30">登陆次数：466次</td>
                                            <td class="td30">登陆IP：111.172.7.148,119.96.52.58,218.93.204.52</td>
                                            <td class="td30"></td>
                                            <td class="td10"></td>
                                        </tr>
                                        <tr>
                                            <td class="td30">上次登陆时间：2022-08-26 11:40:49</td>
                                            <td class="td30">上次登陆IP：111.172.7.148,101.72.249.87,27.221.124.63</td>
                                            <td class="td30"></td>
                                            <td class="td10"></td>
                                        </tr>

                                        </tbody>
                                    </table>
                                    <em class="wel_line"></em>
                                    <div class="admin_btn" style="display: none">
                                        <div class="save_btn">
                                            <em class="mini_ico"></em>
                                            <input type="submit" name="btnSave" value="保 存" id="btnSave">
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="bord_gray f_mt25">
                                <div class="graybar_one f_cb">
                                    <div class="wel_name">常用操作</div>
                                </div>
                                <div class="wel_info">

                                    <table cellspacing="" cellpadding="0" class="admin_table table_class1">
                                        <tbody>
                                        <tr>
                                            <td class="td12">产品管理：</td>
                                            <td>
                                                <a href="products_edit.aspx" target="frmEditor">添加产品</a>
                                                <em class="cutline">|</em>
                                                <a href="product_column_edit.aspx" target="frmEditor">添加分类</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td12">内容管理：</td>
                                            <td>
                                                <a href="news_edit.aspx" target="frmEditor">添加资讯文章</a>
                                                <em class="cutline">|</em>
                                                <a href="news_column_edit.aspx" target="frmEditor">添加资讯分类</a>
                                                <em class="cutline">|</em>
                                                <a href="helps_edit.aspx" target="frmEditor">添加帮助文档</a>
                                                <em class="cutline">|</em>
                                                <a href="help_column_edit.aspx" target="frmEditor">添加帮助分类</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td12">搜索引擎优化：</td>
                                            <td>
                                                <a href="sitepage.aspx" target="frmEditor">独立页面设置</a>
                                                <em class="cutline">|</em>
                                                <a href="keywords.aspx" target="frmEditor">关键词管理</a>
                                                <em class="cutline">|</em>
                                                <a href="sitemap.aspx" target="frmEditor">网站地图管理</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td12">订单管理：</td>
                                            <td>
                                                <a href="orders.aspx?type=1" target="frmEditor">最新订单</a>
                                                <em class="cutline">|</em>
                                                <a href="orders.aspx" target="frmEditor">订单列表</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td12">工具管理：</td>
                                            <td>
                                                <a href="ads_edit.aspx" target="frmEditor">添加广告</a>
                                                <em class="cutline">|</em>
                                                <a href="applys_edit.aspx" target="frmEditor">添加友情链接</a>
                                                <em class="cutline">|</em>
                                                <a href="pictures.aspx" target="frmEditor">上传图片</a>
                                                <em class="cutline">|</em>
                                                <a href="subsite_info.aspx" target="frmEditor">分站管理</a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>

                                </div>

                            </div>

                            <div class="bord_gray f_mt25">
                                <div class="graybar_one f_cb">
                                    <div class="wel_name">密码</div>
                                    <span class="wel_revise" id="pass_revise">[ 修改 ]</span>
                                </div>
                                <div class="wel_info">

                                    <table cellspacing="" cellpadding="0" class="admin_table table_class1 table_class2">
                                        <tbody>
                                        <tr>
                                            <td class="td30">
                                                <label>新密码</label>
                                                <em class="clear_bd">
                                                    <input name="txtUserPassword" type="text" id="txtUserPassword" class="com_input admin_name">
                                                    <i class="clear_x"></i>
                                                </em>
                                            </td>
                                            <td class="td30"></td>
                                            <td class="td30"></td>
                                        </tr>
                                        <tr>
                                            <td class="td30">
                                                <label>密码保护问题</label>
                                                <em class="clear_bd">
                                                    <input name="txtSecQus" type="text" id="txtSecQus" class="com_input admin_name">
                                                    <i class="clear_x"></i>
                                                </em>
                                            </td>
                                            <td class="td30 wel_faq">

                                            </td>
                                            <td class="td30"></td>
                                        </tr>
                                        <tr>
                                            <td class="td30">
                                                <label>答案</label>
                                                <em class="clear_bd">
                                                    <input name="txtAnswer" type="text" id="txtAnswer" class="com_input admin_name">
                                                    <i class="clear_x"></i>
                                                </em>
                                            </td>
                                            <td class="td30"></td>
                                            <td class="td30"></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="admin_btn">
                                        <div class="save_btn">
                                            <em class="mini_ico"></em>
                                            <input type="submit" name="Button1" value="保 存" id="Button1">
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="foot">
            <div class="footer">网址 http://www.nsw88.com Services@nsw88.com 服务热线： 400-033-3087 Power By 深圳市牛商网络股份有限公司
                V1.3666 <a href="system_update.aspx" target="_blank" style="color:#f18d14;">检查更新</a>
            </div>
        </div>
    </body>
    <script src="js/common/common.js" type="text/javascript"></script>
    <script type="text/javascript">
        function getPageFilename(path) {
            path = path || window.location.pathname;
            var filename = path;
            var pos = -1;
            if ((pos = path.lastIndexOf('/') + 1) > 0) {
                filename = path.substr(pos, path.length);
            }
            if ((pos = filename.indexOf('?')) > 0) {
                filename = filename.substr(0, pos);
            }
            return filename;
        }

        $(function () {
            $(".table_class1 a").click(function (event) {

                SaveURL();
            })
            $(".wel_revise").bind("click", function () {
                var admin_btn = $(this).parents("div.bord_gray").find("div.admin_btn");
                admin_btn.toggle();
            })
            $("a[href='#']").attr("href", "javascript:;");
            $("a[href='admin_logout.aspx']").attr("target", "_self");
            var frmeditor = $("#frmEditor");
            $(".menu_item a[href*='_edit']").click(function (event) {
                SaveURL($(this).attr("href").toLowerCase().replace("_edit", ''));
            })
            var content = $("div.content");
            $("#widthscreen").bind("click", function () {
                if (content.hasClass("w_98")) {
                    $(this).text("宽屏");
                    content.removeClass("w_98");
                    $.cookie("w_98", "false", {expires: 7, path: window.location.pathname});
                    window.top.SetHeight();
                } else {
                    $(this).text("窄屏");
                    content.addClass("w_98");
                    $.cookie("w_98", "true", {expires: 7, path: window.location.pathname});
                    window.top.SetHeight();
                }
            })
            if ($.cookie("w_98") === "true") {
                $("#widthscreen").click();
            }

            $(".menu h3").click(function () {
                $(this).next().slideDown().parents("div.menu").siblings("div.menu").find("ul").slideUp("slow");
            })

            //选中
            var as = $("div.menu li a");
            var lis = as.parent("li");
            var _select = function (a, li) {
                if (a.length) {
                    $("#menuBar ul:visible").hide();
                    a.parent("li").addClass("selected").parent("ul").show().siblings("ul").hide();
                }
            }
            as.bind("click", function () {
                var a = $(this);
                a.attr("_load_", "true");
                _select(a, lis.filter(".selected").removeClass("selected"));
            })
            $("#frmEditor").bind("load", function () {
                var url = getPageFilename(window.top.frames["frmEditor"].location + "").toLowerCase();
                var a = as.filter("[href$='" + url + "']");
                if (a.attr("_load_") == "true") {
                    a.attr("_load_", "false");
                    return;
                }
                var li = lis.filter(".selected").removeClass("selected");
                if (a.length) {
                    _select(a, li);
                } else if (url.indexOf('_edit.aspx') > 0) {
                    url = url.replace('_edit', '');
                    if (_OBJ_[url]) {
                        url = _OBJ_[url];
                    }
                    a = as.filter("[href$='" + url + "']");
                    _select(a, li);
                } else {
                    a = as.filter("[href*='" + url + "']");
                    _select(a, li);
                }
            })
        })
    </script>
</html>