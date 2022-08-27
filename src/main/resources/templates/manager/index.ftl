<#include "common/manage_layout.ftl"/>
<@html>
<div class="col_main">
    <form name="form1" method="post" action="iindex.aspx" id="form1" onsubmit="top.refreshList=true">
        <div>
            <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
                   value="/wEPDwULLTE0NjA2MDc1NDFkZM49dZ/Mr9sELEOHm7cZn8vnx1cf">
        </div>

        <div>

            <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="46E9496E">
            <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION"
                   value="/wEWCgKx66CeDAKl+4a0AQK14pzMDwLgmqeaDgLlw/y0AgKct7iSDAK9wKW7DAKBgtzIAwLdsKuIBAKM54rGBhMqD8EWebgMpE3ppsiShAUZc4qI">
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
                                <input name="txtUserPassword" type="text" id="txtUserPassword"
                                       class="com_input admin_name">
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
</@html>