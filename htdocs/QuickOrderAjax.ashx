<%@ WebHandler Language="C#" Class="NSW.Web.QuickOrderAjax" %>

#region namspace
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using NSW.Entities;
using System.Data;
using BlueCrystal.Data;
using System.Xml;
using NSW.Utls;
using System.Text.RegularExpressions;
using System.Net;
using System.IO;
#endregion

#region 程序著作权以及用途
/**********************************************************************
 * 程序作者：宋天峰
 * 电子邮件：masterlijf@hotmail.com, 679417@qq.com
 * 公司名称：深圳市牛商网络有限公司
 * 程序书写时间：2011-7-26
 * 程序实现目的：
 * 1. 前台程序AJAX服务端代码
 **********************************************************************/
#endregion;


namespace NSW.Web
{
    public class QuickOrderAjax : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            //操作
            string action = context.Request.QueryString["action"];

            //检查来源
            if (!ComUtls.CheckPostSource())
            {
                context.Response.Write(ORes.Error.SuspiciousOfPostingSourceAndBeIgnored);
                return;
            }

            /****************************************
             * 加快方法调用响应速度，所有方法和属性尽量以静态的形式实现
             ***************************************/

            switch (action)
            {
                //获取快速订单产品数据列表
                case "quickOrder": QuickOrder(); break;
                //获取COKIE如果有值获取快速订单产品数据列表   
                case "quickOrders": QuickOrders(); break;
                //获得产品快速订单的简单介绍
                case "quickOrderShowProductInfos": QuickOrderShowProductInfos(); break;
                //增加用户选中的快速定单值处理同时获取产品数据列表
                case "addquickorder": AddQuickorder(); break;
                //删除用户选中的快速定单值处理同时获取产品数据列表
                case "delquickorder": DelQuickorder(); break;
                //增加用户选中的快速定单值处理同时获取产品数据列表
                case "addquickOrders": AddQuickorders(); break;
                //清空用户选中的快速定单值处理同时获取产品数据列表
                case "rfertaddquickorders": RfertaddQuickorders(); break;
                //更新订单数量
                case "orderquantity": OrderQuantity(); break;
                //获取缓存订单的COOKIE
                case "Getaddquantitycokie": Getaddquantitycokie(); break;
                //获取缓存订单的COOKIE
                case "GetGETquantitycokie": GetGetquantitycokie(); break;
                //更新订单内容
                case "orderdemand": OrderDemand(); break;
                //更新下一步处理
                case "qbtnsubmit": QBtnsuBmit(); break;
                //获取缓存订单的COOKIE
                case "delquickorderconfirm": DelQuickorderConfirm(); break;
                    
                default:
                    WriteString("无效请求。");
                    break;
            }
        }
        
        private static void DelQuickorderConfirm()
        {
            string _Getquickcheckboxal = GF("getquickcheckboxal");
            string strmsg = "";
            if (NSW.QuickOrder.ProductCount > 0)
            {
                NSW.CartQuickOrderDetail QuickOrderDetail = new NSW.CartQuickOrderDetail();
                DataTable dts = QuickOrderDetail.ProductDataTable;
                System.Data.DataView dv = new System.Data.DataView(dts);
                dv.RowFilter = "ID in(" + _Getquickcheckboxal+")";
                DataTable tmpdt = dv.ToTable();
                if (tmpdt.Rows.Count > 0)
                {
                    int gg = 0;
                    foreach (DataRow row in tmpdt.Rows)
                    {
                        gg++;
                        strmsg += gg + "、" + row["Title"].ToString() + "<br/>";
                    }
                }
            }
            KeyValuePair<string, string> _node1 = new KeyValuePair<string, string>("msg", strmsg);
            WriteXml(_node1);
            return;
        }

        /// <summary>
        /// 更新快速订单下一步处理
        /// </summary>
        private static void QBtnsuBmit()
        {
            
            //收集用户数据处理
            //联系人
            string _Contact = HttpUtility.UrlEncode(GF("_Contact"));
            //手机号码
            string _Phonenumber = GF("_Phonenumber");
            //电子邮件
            string _Email = GF("_Email");
            //公司名称
            string _CompanyName = HttpUtility.UrlEncode(GF("_CompanyName"));
            //验证码 
            string _VerCode = GF("_VerCode");
            string _ddlPrtRegions =  HttpUtility.UrlEncode(GF("_ddlPrtRegions"));
            string _ddlChdRegions = HttpUtility.UrlEncode(GF("_ddlChdRegions"));
            string _ddlPrtRegionsval = GF("_ddlPrtRegionsval");
            string _ddlChdRegionsval = GF("_ddlChdRegionsval");
            string _Streetaddress = HttpUtility.UrlEncode(GF("_Streetaddress"));
            string _Zipcode = GF("_Zipcode");
            string _tTel1 = GF("_tTel1");
            string _tTel2 = GF("_tTel2");
            string _tTel3 = GF("_tTel3");
            string _PurchasingNotes = HttpUtility.UrlEncode(GF("_PurchasingNotes"));
            if (!BLL.OSecurity.CheckVerifyCode(_VerCode.Trim()))
            {
                KeyValuePair<string, string> _node1 = new KeyValuePair<string, string>("state", "-3");
                KeyValuePair<string, string> _node2 = new KeyValuePair<string, string>("msg", "验证错误或者已过期，请重新输入。");
                WriteXml(_node1, _node2);
                return;
            }
            if (NSW.QuickOrder.ProductCount > 0)
            {
                //处理用户快速度订单，保存处理
                NSW.OCookie.QuickOrderMem.Contact = _Contact;
                NSW.OCookie.QuickOrderMem.Phonenumber = _Phonenumber;
                NSW.OCookie.QuickOrderMem.CompanyName = _CompanyName;
                NSW.OCookie.QuickOrderMem.ParentRegion = _ddlPrtRegions;
                NSW.OCookie.QuickOrderMem.ChildRegion = _ddlChdRegions;
                NSW.OCookie.QuickOrderMem.ParentRegionVal = _ddlPrtRegionsval;
                NSW.OCookie.QuickOrderMem.ChildRegionVal = _ddlChdRegionsval;
                NSW.OCookie.QuickOrderMem.Streetaddress = _Streetaddress;
                NSW.OCookie.QuickOrderMem.Zipcode = _Zipcode;
                NSW.OCookie.QuickOrderMem.txtTel1 = _tTel1;
                NSW.OCookie.QuickOrderMem.txtTel2 = _tTel2;
                NSW.OCookie.QuickOrderMem.txtTel3 = _tTel3;
                NSW.OCookie.QuickOrderMem.PurchasingNotes = _PurchasingNotes;
                NSW.OCookie.QuickOrderMem.Email = _Email;
                NSW.OCookie.QuickOrderMem.Processing = true;
                
                KeyValuePair<string, string> _node3 = new KeyValuePair<string, string>("state", "0");
                KeyValuePair<string, string> _node4 = new KeyValuePair<string, string>("msg", "");
                WriteXml(_node3, _node4);

            }
            else
            {
                KeyValuePair<string, string> _node1 = new KeyValuePair<string, string>("state", "-2");
                KeyValuePair<string, string> _node2 = new KeyValuePair<string, string>("msg", "对不起，订单库内无商品。");
                WriteXml(_node1, _node2);
            }
        }

        /// <summary>
        /// 获取缓存订单的COOKIE
        /// </summary>
        private static void Getaddquantitycokie()
        {
            string vle = ComUtls.GetCookie("addQuantityCokie");
            if(vle == "")
            {
                vle = NSW.QuickOrder.ProductCount.ToString();
            }
            KeyValuePair<string, string> _node = new KeyValuePair<string, string>("count", vle.ToString());
            WriteXml(_node);
        }

        /// <summary>
        /// 获取缓存订单的COOKIE
        /// </summary>
        private static void GetGetquantitycokie()
        {
            string vle = ComUtls.GetCookie("GetQuantityCokie");
            if(vle =="")
            {
                string SqlWhere = "1=1";
                int PageSize = 10;
                int PageIndex = 1;
                int RecordCountVariable = -1;
                DataTable dtm = MQuery.GetBatch("VW_Product", "[ID]", "*", "[InputTime] DESC", SqlWhere, PageSize,
                                                PageIndex, ref RecordCountVariable);
                vle = RecordCountVariable.ToString();
            }
            KeyValuePair<string, string> _node = new KeyValuePair<string, string>("count", vle.ToString());
            WriteXml(_node);
        }
        /// <summary>
        /// 更新订单数量
        /// 回应：XML对象
        /// </summary>
        private static void OrderQuantity()
        {
            int pid = ComUtls.ParseInt(GF("pid"), -1);
            int quti = ComUtls.ParseInt(GF("quti"), -1);
            if (NSW.QuickOrder.ProductCount >0)
            {
                NSW.CartQuickOrderDetail QuickOrderDetail = new NSW.CartQuickOrderDetail();
                DataTable dts = QuickOrderDetail.ProductDataTable;
                System.Data.DataView dv = new System.Data.DataView(dts);
                dv.RowFilter  = "ID =" + pid;
                DataTable tmpdt = dv.ToTable();
                if (tmpdt.Rows.Count > 0)
                {
                    int qutisg = int.Parse(tmpdt.Rows[0]["__quickorderquantity__"].ToString());
                    if(qutisg == quti)
                    {
                        KeyValuePair<string, string> _node2 = new KeyValuePair<string, string>("state", "2");
                        KeyValuePair<string, string> _node3 = new KeyValuePair<string, string>("RecordCountVariable", "");
                        WriteXml(_node2, _node3);
                        return;
                    }
                }
            }
            NSW.QuickOrder _quickorder = new QuickOrder();
            NSW.CartQuickOrder _cartquickorder = new NSW.CartQuickOrder(pid, quti, "", "");
            _quickorder.Add(_cartquickorder, 1);
            _quickorder.BulidCart();
            KeyValuePair<string, string> _node = new KeyValuePair<string, string>("state", "1");
            KeyValuePair<string, string> _node1 = new KeyValuePair<string, string>("RecordCountVariable", "");
            WriteXml(_node, _node1);
        }
        /// <summary>
        /// 更新订单内容
        /// 回应：XML对象
        /// </summary>
        private static void OrderDemand()
        {
            int pid = ComUtls.ParseInt(GF("pid"), -1);
            string atts = GF("atts");
            if (NSW.QuickOrder.ProductCount > 0)
            {
                NSW.CartQuickOrderDetail QuickOrderDetail = new NSW.CartQuickOrderDetail();
                DataTable dts = QuickOrderDetail.ProductDataTable;
                System.Data.DataView dv = new System.Data.DataView(dts);
                dv.RowFilter = "ID =" + pid;
                DataTable tmpdt = dv.ToTable();
                if (tmpdt.Rows.Count > 0)
                {
                    string qutisg = tmpdt.Rows[0]["__requirements__"].ToString();
                    if (qutisg == atts)
                    {
                        KeyValuePair<string, string> _node2 = new KeyValuePair<string, string>("state", "2");
                        KeyValuePair<string, string> _node3 = new KeyValuePair<string, string>("RecordCountVariable", "");
                        WriteXml(_node2, _node3);
                        return;
                    }
                }
            }
            NSW.QuickOrder _quickorder = new QuickOrder();
            NSW.CartQuickOrder _cartquickorder = new NSW.CartQuickOrder(pid, 1, "", atts);
            _quickorder.Add(_cartquickorder, 3);
            _quickorder.BulidCart();
            KeyValuePair<string, string> _node = new KeyValuePair<string, string>("state", "1");
            KeyValuePair<string, string> _node1 = new KeyValuePair<string, string>("RecordCountVariable", "");
            WriteXml(_node, _node1);
        }

        #region GetPagedTable DataTable分页
        /// <summary>
        /// DataTable分页
        /// </summary>
        /// <param name="dt">DataTable</param>
        /// <param name="PageIndex">页索引,注意：从1开始</param>
        /// <param name="PageSize">每页大小</param>
        /// <returns></returns>
        public static DataTable GetPagedTable(DataTable dt, int PageIndex, int PageSize)
        {
            if (PageIndex == 0)
                return dt;
            DataTable newdt = dt.Copy();
            newdt.Clear();

            int rowbegin = (PageIndex - 1) * PageSize;
            int rowend = PageIndex * PageSize;

            if (rowbegin >= dt.Rows.Count)
                return newdt;

            if (rowend > dt.Rows.Count)
                rowend = dt.Rows.Count;
            for (int i = rowbegin; i <= rowend - 1; i++)
            {
                DataRow newdr = newdt.NewRow();
                DataRow dr = dt.Rows[i];
                foreach (DataColumn column in dt.Columns)
                {
                    newdr[column.ColumnName] = dr[column.ColumnName];
                }
                newdt.Rows.Add(newdr);
            }

            return newdt;
        }
        #endregion

        #region 获取快速订单产品数据列表处理
        /// <summary>
        /// 获取快速订单产品数据列表
        /// 回应：XML对象
        /// </summary>
        private static void QuickOrder()
        {
            string A_HTML_LI = "<li id=\"QuickOrderli{0}\"><input id=\"checkQuickOrder{0}\" name=\"checkQuickOrder\" type=\"checkbox\" value=\"{0}\" onclick=\"QuikcheckAll('checkQuickOrder{0}','QuickOrderli{0}')\"  class=\"k3\"/><span style=\"float: left; padding: 16px 10px;\">{1}</span>"
                                 + "<dl>"
                                     + "<dt><a href=\"{2}\" target=\"_blank\"  ><img src=\"{3}\"  onload=\"DrawImage(this,50,50,1);\"     /></a></dt>"
                                     + "<dd><a href=\"{2}\" target=\"_blank\"  >{4}</a></dd>"
                               + "</dl>"
                             + "</li>";
            StringBuilder _strHtml = new StringBuilder();
            string _SelProductColumnID = GF("selproductcolumn");
            string _ProductKeword = GF("productkeword");
            int PageIndex = int.Parse(GF("page"));
            int RecordCountVariable = -1;
            DataTable dt = null;
            //查询数据
            int PageSize = 10;
            string TableName = "[VW_Product]";
            string SqlWhere = string.Empty;

            if (_SelProductColumnID != "")
            {
                SqlWhere += string.Format("([sid] LIKE '%{0}%') ", _SelProductColumnID);
            }
            if (_ProductKeword != "")
            {
                if (_SelProductColumnID != "")
                {
                    SqlWhere += string.Format("and ([Title] LIKE '%{0}%')", _ProductKeword);
                }
                else
                {
                    SqlWhere += string.Format("([Title] LIKE '%{0}%')", _ProductKeword);
                }
            }

            OCookie.QuickOrderOCookie.QuickProductColumnID = _SelProductColumnID;
            OCookie.QuickOrderOCookie.QuickProductKeword = _ProductKeword;
        
            using (dt = MQuery.GetBatch(TableName, "[ID]", "*", "[InputTime] DESC", SqlWhere, PageSize, PageIndex, ref RecordCountVariable))
            {
                ComUtls.AddCookie("GetQuantityCokie", RecordCountVariable.ToString(), -1);
                int lenght = dt.Rows.Count;
                if (lenght > 0)
                {
                    DataRowCollection rows = dt.Rows;
                    int rowi = 0;
                    int gii = 0;
                    string outid = string.Empty;
                    foreach (DataRow row in rows)
                    {
                        gii++;
                        if (PageIndex > 1 && gii == 1)
                        {
                            rowi = 10 * PageIndex;
                        }
                        rowi++;
                        if (rowi < 10)
                        {
                            outid = "0" + rowi.ToString();
                        }
                        else
                        {
                            outid = rowi.ToString();
                        }
                        _strHtml.AppendFormat(A_HTML_LI, row["ID"], outid, row["PageURL"], row["PhotoPath"], row["Title"]);
                    }
                }
                else
                {
                    _strHtml.AppendFormat("<div><img src='{0}' />暂无数据!</div>", "/Images/nodata.GIF");
                }
            }

            KeyValuePair<string, string> _node = new KeyValuePair<string, string>("msg", _strHtml.ToString());
            KeyValuePair<string, string> _node1 = new KeyValuePair<string, string>("RecordCountVariable", RecordCountVariable.ToString());
            WriteXml(_node, _node1);
        }
        #endregion

        #region 获取缓存快速订单产品数据列表处理
        /// <summary>
        /// 获取缓存快速订单产品数据列表处理
        /// 回应：XML对象
        /// </summary>
        private static void QuickOrders()
        {
            string A_HTML_LI = "<li id=\"QuickOrderli{0}\"><input id=\"checkQuickOrder{0}\" name=\"checkQuickOrder\" type=\"checkbox\" value=\"{0}\" onclick=\"QuikcheckAll('checkQuickOrder{0}','QuickOrderli{0}')\"  class=\"k3\"/><span style=\"float: left; padding: 16px 10px;\" >{1}</span>"
                                + "<dl>"
                                    + "<dt><a href=\"{2}\" target=\"_blank\" ><img src=\"{3}\"  onload=\"DrawImage(this,50,50,1);\"/></a></dt>"
                                    + "<dd><a href=\"{2}\" target=\"_blank\" >{4}</a></dd>"
                              + "</dl>"
                            + "</li>";
            StringBuilder _strHtml = new StringBuilder();
            int PageIndex = int.Parse(GF("page"));
            int RecordCountVariable = -1;
            DataTable dt = null;
            //查询数据
            int PageSize = 10;
            string TableName = "[VW_Product]";
            string SqlWhere = string.Empty;
            OCookie.QuickOrderOCookie.QuickProcessing = "1";
            string _QuickProcessing = OCookie.QuickOrderOCookie.QuickProcessing;
            string _QuickProductColumnID = OCookie.QuickOrderOCookie.QuickProductColumnID;
            string _QuickProductKeword = OCookie.QuickOrderOCookie.QuickProductKeword;

            //if (_QuickProcessing == "1")
            //{
                //判断快速产品用户是否离开如果离页还没有填写完成处理到用户操作之前的数据
                if (_QuickProductColumnID.Length > 0 || _QuickProductKeword.Length > 0)
                {
                    if (_QuickProductColumnID != "")
                    {
                        SqlWhere += string.Format("([sid] LIKE '%{0}%') ", _QuickProductColumnID);
                    }
                    if (_QuickProductKeword != "")
                    {
                        if (_QuickProductColumnID != "")
                        {
                            SqlWhere += string.Format("and ([Title] LIKE '%{0}%')", _QuickProductKeword);
                        }
                        else
                        {
                            SqlWhere += string.Format("([Title] LIKE '%{0}%')", _QuickProductKeword);
                        }
                    }
                }
                using (dt = MQuery.GetBatch(TableName, "[ID]", "*", "[InputTime] DESC", SqlWhere, PageSize, PageIndex, ref RecordCountVariable))
                {
                    ComUtls.AddCookie("GetQuantityCokie", RecordCountVariable.ToString(), -1);
                    int lenght = dt.Rows.Count;
                    if (lenght > 0)
                    {
                        DataRowCollection rows = dt.Rows;
                        int rowi = 0;
                        int gii = 0;
                        string outid = string.Empty;
                        foreach (DataRow row in rows)
                        {
                            gii++;
                            if (PageIndex > 1 && gii == 1)
                            {
                                rowi = 10 * PageIndex;
                            }
                            rowi++;
                            if (rowi < 10)
                            {
                                outid = "0" + rowi.ToString();
                            }
                            else
                            {
                                outid = rowi.ToString();
                            }
                            _strHtml.AppendFormat(A_HTML_LI, row["ID"], outid, row["PageURL"], row["PhotoPath"], row["Title"]);
                        }
                    }
                    else
                    {
                        _strHtml.AppendFormat("<div><img src='{0}' />暂无数据!</div>", "/Images/nodata.GIF");
                    }
                }
                KeyValuePair<string, string> _node = new KeyValuePair<string, string>("msg", _strHtml.ToString());
                KeyValuePair<string, string> _node1 = new KeyValuePair<string, string>("RecordCountVariable", RecordCountVariable.ToString());
                WriteXml(_node, _node1);
           // }
        }
        #endregion



        #region 获得产品快速订单的简单介绍处理
        /// <summary>
        /// 获得产品快速订单的简单介绍
        /// </summary>
        private static void QuickOrderShowProductInfos()
        {
            try
            {

                StringBuilder sbRtnVal = new StringBuilder();
                int ID = int.Parse(GF("oid"));
                VW_Product Obj = DbSession.Default.Get<VW_Product>(VW_Product._.ID == ID);
                if (Obj == null)
                {
                    return;
                }

                sbRtnVal.Append("<div class=\"quickmesbook44\"><div class=\"con\"><img src=\"/Skins/Default/Img/PRight.gif\" class=\"jian\" />");

                sbRtnVal.Append("<h4><a href='" + Obj.PageURL + "' target=\"_blank\"  >" + Obj.Title + "</a></h4>");
                sbRtnVal.Append("<div class=\"cont\">" + Obj.ShortDesc + "</div>");
                sbRtnVal.Append("<div class=\"jieshao\">产品库存：" + Obj.Inventory + "件</div>");
                DataTable dt = DbSession.Default.From<tbProductAttribute>().Select(tbProductAttribute._.KeyNameID).Where(tbProductAttribute._.ProductID == ID).ToDataTable();
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow ObjRow in dt.Rows)
                    {

                        //获得单独的一个属性对象
                        int KeyNameID = int.Parse(ObjRow["KeyNameID"].ToString());
                        tbProductAttributeColumn AttrCln = DbSession.Default.Get<tbProductAttributeColumn>(tbProductAttributeColumn._.ID == KeyNameID);

                        //是否存在这个属性对象
                        if (AttrCln == null)
                        {
                            continue;
                        }

                        //是否是置顶属性
                        if (!Obj.isTop)
                        {
                            continue;
                        }

                        //是否存在属性值
                        if (AttrCln.ValueList.Trim() == "")
                        {
                            continue;
                        }
                        //如果存在，开始追加属性输出（属性名）
                        sbRtnVal.Append("<dl class=\"dl_lt\"><dt>" + AttrCln.Title + ":</dt><dd>");

                        if (AttrCln.ValueList.IndexOf(",") != -1)
                        {
                            //不止一个置顶属性
                            string[] str = AttrCln.ValueList.Split(',');
                            if (str.Length > 0)
                            {
                                foreach (string s in str)
                                {
                                    int AttValID = int.Parse(s);
                                    //获得这个置顶属性的对象，得到对应的图片
                                    tbProductAttributeValue tbAttValues = DbSession.Default.Get<tbProductAttributeValue>(tbProductAttributeValue._.ID == AttValID);
                                    if (tbAttValues == null)
                                    {
                                        continue;
                                    }
                                    if (tbAttValues.SmallPhotoPath != "")
                                    {
                                        //如果是图片的形式存在，则输出图片
                                        sbRtnVal.Append("<a href='javascript:void(0)'><img src='" + tbAttValues.SmallPhotoPath + "' alt='" + tbAttValues.Title + "' /></a>");
                                    }
                                    else
                                    {
                                        //如果是文字的显示存在，则输出文字
                                        sbRtnVal.Append("<a href='javascript:void(0)'>" + tbAttValues.Title + "</a>");
                                    }
                                }
                            }

                        }
                        else
                        {
                            //只有一个置顶属性
                            int AttValID = int.Parse(AttrCln.ValueList);
                            //获得这个置顶属性的对象，得到对应的图片
                            tbProductAttributeValue tbAttValues = DbSession.Default.Get<tbProductAttributeValue>(tbProductAttributeValue._.ID == AttValID);
                            if (tbAttValues == null)
                            {
                                continue;
                            }
                            if (tbAttValues.SmallPhotoPath != "")
                            {
                                //如果是图片的形式存在，则输出图片
                                sbRtnVal.Append("<a href='javascript:void(0)'><img src='" + tbAttValues.SmallPhotoPath + "' alt='" + tbAttValues.Title + "' /></a>");
                            }
                            else
                            {
                                //如果是文字的显示存在，则输出文字
                                sbRtnVal.Append("<a href='javascript:void(0)'>" + tbAttValues.Title + "</a>");
                            }
                        }

                        sbRtnVal.Append("</dd></dl>");
                    }
                }
                sbRtnVal.Append("<div class=\"clear\"></div>");
                sbRtnVal.Append("<div class=\"mes_btn\"><input type=\"button\" class=\"b55\" onclick=\"mailProduct('product'," + ID + ")\" value=\"推荐给朋友\" /><input type=\"button\" class=\"b56\" onclick=\"showFav(this,'" + Obj.Title + "','" + Obj.PageURL + "')\" value=\"添加收藏\" /><input type=\"button\" class=\"b57\" value=\"加到愿望夹\" onclick=\"showMyWish(" + Obj.ID + ")\" /><input type=\"button\" class=\"b58\" onclick=\"showProductTips(" + Obj.ID + ")\" value=\"购买小Tips\" /></div>");
                sbRtnVal.Append("  <div class=\"tc\"><input type=\"button\" class=\"b59\" value=\"立即采购\"  onclick=\"javascript:window.open('" + Obj.PageURL + "#caigou')\" /><input type=\"button\" class=\"b60\" value=\"查看商品详情\" onclick=\"javascript:window.open('" + Obj.PageURL + "')\" /></div>");
                sbRtnVal.Append("</div></div>");
                WriteString(sbRtnVal.ToString());
            }
            catch (Exception ex)
            {

            }

        }
        #endregion


        #region 增加用户选中的快速定单值处理同时获取产品数据列表
        /// <summary>
        /// 增加用户选中的快速定单值处理同时获取产品数据列表
        /// 回应：XML对象
        /// </summary>
        private static void AddQuickorder()
        {
            string A_HTML_LI = "<li id=\"ADDQuickOrderli{0}\"><input id=\"qQuickOrdersChecked\" name=\"checkbox\" type=\"checkbox\" onclick=\"singleCk(this,{0});\" value=\"{0}\"  class=\"k3\"/><span style=\"float:left;padding:16px 10px;\">{1}</span>"
                               + "<dl>"
                               + "<dt><a href=\"{2}\" target=\"_blank\" >{3}</a></dt>"
                               + "<dd>{4}</dd>"
                               + "</dl>"
                               + "<input id=\"OrderQuantity{0}\" name=\"OrderQuantity{0}\" type=\"text\" value=\"{5}\" onblur=\"OrderQuantity('OrderQuantity{0}',{0});\"  class=\"k6\"/>"
                //+ "<input id=\"OrderDemand{0}\" name=\"OrderDemand{0}\" type=\"text\" value=\"{6}\" onblur=\"OrderDemand('OrderDemand{0}',{0});\" class=\"k7\"/>"
                               + "<textarea id=\"OrderDemand{0}\" name=\"OrderDemand{0}\" cols=\"20\" rows=\"4\" onblur=\"OrderDemand('OrderDemand{0}',{0});\" class=\"k7\">{6}</textarea>"
                               + "</li>";
            StringBuilder _strHtml = new StringBuilder();
            NSW.QuickOrder _quickorder = new QuickOrder();
            string _Quickcheckboxall = GF("quickcheckboxall");
            string QUANTITY_COLUMN_TITLE = "__quickorderquantity__";
            string ATTRIBUTES_TITLE = "__attrs__";
            string REQUIREMENTS_TITLE = "__requirements__";
            string RecordCountVariable = "";
            int count = 0;
            DataTable dt = null;
            //查询数据
            if (_Quickcheckboxall != "")
            {
                string[] quickstr = NSW.Utls.StringUtls.Split(_Quickcheckboxall, ",");
                if (quickstr.Length > 0)
                {
                    foreach (string s in quickstr)
                    {
                        int pid = int.Parse(s);
                        int quti = 1;
                        //1> 检查购物车是否有礼品)
                        if (NSW.QuickOrder.ProductCount != 0)
                        {
                            //添加商品，如果购物车有此商品，则累加
                            DataTable tmpdt = null;
                            System.Data.DataView tmpdetaildv = null;
                            CartQuickOrderDetail NCartProdDetail = new CartQuickOrderDetail();
                            tmpdt = NCartProdDetail.ProductDataTable;
                            if (tmpdt.Rows.Count > 0)
                            {
                                tmpdt.DefaultView.RowFilter = "[ID] =" + pid;
                                tmpdetaildv = tmpdt.DefaultView;
                                
                                if (tmpdetaildv.Count > 0)
                                {
                                    quti = int.Parse(tmpdetaildv[0][QUANTITY_COLUMN_TITLE].ToString()) + quti;
                                }
                            }
                        }

                        NSW.CartQuickOrder _cartquickorder = new NSW.CartQuickOrder(int.Parse(s), quti, "", "");
                        _quickorder.Add(_cartquickorder);
                        _quickorder.BulidCart();
                    }
                }

                NSW.CartQuickOrderDetail NCartQuickOrderDetail = new NSW.CartQuickOrderDetail();
                count = NCartQuickOrderDetail.ProductDataTable.Rows.Count;
                
                using (dt = GetPagedTable(NCartQuickOrderDetail.ProductDataTable, 1, 10))
                {
                    System.Data.DataView dv = new System.Data.DataView(dt);
                    dv.Sort = "__requioraderid__ desc";
                    DataTable tmpdt = dv.ToTable();
                    int lenght = tmpdt.Rows.Count;
                    if (lenght > 0)
                    {
                        ComUtls.AddCookie("addQuantityCokie", count.ToString(), -1);
                        DataRowCollection rows = tmpdt.Rows;
                        int rowi = 0;
                        string outid = string.Empty;
                        string strgss = string.Empty;
                        foreach (DataRow row in rows)
                        {
                            rowi++;
                            if (rowi < 10)
                            {
                                outid = "0" + rowi.ToString();
                            }
                            else
                            {
                                outid = rowi.ToString();
                            }
                            strgss = row[ATTRIBUTES_TITLE].ToString();
                            if (strgss == "")
                            {
                                strgss = "暂无属性";
                            }
                            _strHtml.AppendFormat(A_HTML_LI, row["ID"], outid, row["PageURL"], row["Title"],
                                                  strgss, row[QUANTITY_COLUMN_TITLE],
                                                  row[REQUIREMENTS_TITLE]);
                        }
                    }
                    else
                    {
                        ComUtls.AddCookie("addQuantityCokie", "0", -1);
                        _strHtml.AppendFormat("<div><img src='{0}' />暂无数据!</div>", "/Images/nodata.GIF");
                    }
                }
            }
            else
            {
                ComUtls.AddCookie("addQuantityCokie", "0", -1);
                _strHtml.AppendFormat("<div><img src='{0}' />暂无数据!</div>", "/Images/nodata.GIF");
            }
            KeyValuePair<string, string> _node = new KeyValuePair<string, string>("msg", _strHtml.ToString());
            KeyValuePair<string, string> _node1 = new KeyValuePair<string, string>("RecordCountVariable",
                                                                                   RecordCountVariable);
            KeyValuePair<string, string> _node2 = new KeyValuePair<string, string>("count",
                                                                                   count.ToString());
            WriteXml(_node, _node1, _node2);
        }

        #endregion

        #region 删除用户选中的快速定单值处理同时获取产品数据列表
        /// <summary>
        /// 删除用户选中的快速定单值处理同时获取产品数据列表
        /// 回应：XML对象
        /// </summary>
        private static void DelQuickorder()
        {
            string A_HTML_LI = "<li id=\"ADDQuickOrderli{0}\" ><input id=\"qQuickOrdersChecked\" name=\"checkbox\" type=\"checkbox\" onclick=\"singleCk(this,{0});\" value=\"{0}\"  class=\"k3\"/><span style=\"float:left;padding:16px 10px;\">{1}</span>"
                              + "<dl>"
                              + "<dt><a href=\"{2}\" target=\"_blank\" >{3}</a></dt>"
                              + "<dd>{4}</dd>"
                              + "</dl>"
                               + "<input id=\"OrderQuantity{0}\" name=\"OrderQuantity{0}\" type=\"text\" value=\"{5}\" onblur=\"OrderQuantity('OrderQuantity{0}',{0});\"  class=\"k6\"/>"
                //+ "<input id=\"OrderDemand{0}\" name=\"OrderDemand{0}\" type=\"text\" value=\"{6}\" onblur=\"OrderDemand('OrderDemand{0}',{0});\" class=\"k7\"/>"
                               + "<textarea id=\"OrderDemand{0}\" name=\"OrderDemand{0}\" cols=\"20\" rows=\"4\" onblur=\"OrderDemand('OrderDemand{0}',{0});\" class=\"k7\">{6}</textarea>"
                               + "</li>";
            StringBuilder _strHtml = new StringBuilder();
            string _Getquickcheckboxal = GF("getquickcheckboxal");
            int PageIndex = int.Parse(GF("page"));
            int RecordCountVariable = -1;
            DataTable dt = null;
            string QUANTITY_COLUMN_TITLE = "__quickorderquantity__";
            string ATTRIBUTES_TITLE = "__attrs__";
            string REQUIREMENTS_TITLE = "__requirements__";
            NSW.QuickOrder _quickorder = new QuickOrder();
            //查询数据
            int PageSize = 10;
            string TableName = "[VW_Product]";
            string SqlWhere = string.Empty;
            int count = 0;
            if (_Getquickcheckboxal != "")
            {
                string[] pidstr = NSW.Utls.StringUtls.Split(_Getquickcheckboxal, ",");
                if (pidstr.Length > 0)
                {
                    foreach (string str in pidstr)
                    {
                        int pid = int.Parse(str);
                        _quickorder.Delete(pid, "");
                        _quickorder.BulidCart();
                    }
                    if (NSW.QuickOrder.ProductCount > 0)
                    {
                        NSW.CartQuickOrderDetail NCartQuickOrderDetail = new NSW.CartQuickOrderDetail();
                        count = NCartQuickOrderDetail.ProductDataTable.Rows.Count;
                       
                        using (dt = GetPagedTable(NCartQuickOrderDetail.ProductDataTable, 1, PageSize))
                        {
                            System.Data.DataView dv = new System.Data.DataView(dt);
                            dv.Sort = "__requioraderid__ desc";
                            DataTable tmpdt = dv.ToTable();
                            int lenght = tmpdt.Rows.Count;
                            if (lenght > 0)
                            {
                                ComUtls.AddCookie("addQuantityCokie", count.ToString(), -1);
                                DataRowCollection rows = tmpdt.Rows;
                                int rowi = 0;
                                string outid = string.Empty;
                                string strgss = string.Empty;
                                foreach (DataRow row in rows)
                                {
                                    rowi++;
                                    if (rowi < 10)
                                    {
                                        outid = "0" + rowi.ToString();
                                    }
                                    else
                                    {
                                        outid = rowi.ToString();
                                    }
                                    strgss = row[ATTRIBUTES_TITLE].ToString();
                                    if (strgss == "")
                                    {
                                        strgss = "暂无属性";
                                    }
                                    _strHtml.AppendFormat(A_HTML_LI, row["ID"], outid, row["PageURL"], row["Title"],
                                                          strgss, row[QUANTITY_COLUMN_TITLE],
                                                          row[REQUIREMENTS_TITLE]);
                                }
                            }
                            else
                            {
                                ComUtls.AddCookie("addQuantityCokie", "0", -1);
                                _strHtml.AppendFormat("<div><img src='{0}' />暂无数据!</div>", "/Images/nodata.GIF");
                            }
                        }
                    }
                    else
                    {
                        ComUtls.AddCookie("addQuantityCokie", "0", -1);
                        _strHtml.AppendFormat("<div><img src='{0}' />暂无数据!</div>", "/Images/nodata.GIF");
                    }
                }
                else
                {
                    ComUtls.AddCookie("addQuantityCokie", "0", -1);
                    _strHtml.AppendFormat("<div><img src='{0}' />暂无数据!</div>", "/Images/nodata.GIF");
                }
            }
            else
            {
                ComUtls.AddCookie("addQuantityCokie", "0", -1);
                _strHtml.AppendFormat("<div><img src='{0}' />暂无数据!</div>", "/Images/nodata.GIF");
            }
            KeyValuePair<string, string> _node = new KeyValuePair<string, string>("msg", _strHtml.ToString());
            KeyValuePair<string, string> _node1 = new KeyValuePair<string, string>("RecordCountVariable", RecordCountVariable.ToString());
            KeyValuePair<string, string> _node2 = new KeyValuePair<string, string>("count",
                                                                                  count.ToString());
            WriteXml(_node, _node1, _node2);
        }
        #endregion

        #region 增加用户选中的快速定单值处理同时获取产品数据缓存列表
        /// <summary>
        /// 增加用户选中的快速定单值处理同时获取产品数据缓存列表
        /// 回应：XML对象
        /// </summary>
        private static void AddQuickorders()
        {
            string A_HTML_LI = "<li id=\"ADDQuickOrderli{0}\" ><input id=\"qQuickOrdersChecked\" name=\"checkbox\" type=\"checkbox\" onclick=\"singleCk(this,{0});\" value=\"{0}\"  class=\"k3\"/><span style=\"float:left;padding:16px 10px;\">{1}</span>"
                             + "<dl>"
                             + "<dt><a href=\"{2}\" target=\"_blank\" >{3}</a></dt>"
                             + "<dd>{4}</dd>"
                             + "</dl>"
                               + "<input id=\"OrderQuantity{0}\" name=\"OrderQuantity{0}\" type=\"text\" value=\"{5}\" onblur=\"OrderQuantity('OrderQuantity{0}',{0});\"  class=\"k6\"/>"
                //+ "<input id=\"OrderDemand{0}\" name=\"OrderDemand{0}\" type=\"text\" value=\"{6}\" onblur=\"OrderDemand('OrderDemand{0}',{0});\" class=\"k7\"/>"
                               + "<textarea id=\"OrderDemand{0}\" name=\"OrderDemand{0}\" cols=\"20\" rows=\"4\" onblur=\"OrderDemand('OrderDemand{0}',{0});\" class=\"k7\">{6}</textarea>"
                               + "</li>";
            StringBuilder _strHtml = new StringBuilder();
            int PageIndex = int.Parse(GF("page"));
            int RecordCountVariable = -1;
            DataTable dt = null;
            string QUANTITY_COLUMN_TITLE = "__quickorderquantity__";
            string ATTRIBUTES_TITLE = "__attrs__";
            string REQUIREMENTS_TITLE = "__requirements__";
            //查询数据
            int PageSize = 10;
            int count = 0;
            if (NSW.QuickOrder.ProductCount > 0)
            {
                NSW.CartQuickOrderDetail NCartQuickOrderDetail = new NSW.CartQuickOrderDetail();
                count = NCartQuickOrderDetail.ProductDataTable.Rows.Count;
                using (dt = GetPagedTable(NCartQuickOrderDetail.ProductDataTable, PageIndex, PageSize))
                {
                    System.Data.DataView dv = new System.Data.DataView(dt);
                    dv.Sort = "__requioraderid__ desc";
                    DataTable tmpdt = dv.ToTable();
                    int lenght = tmpdt.Rows.Count;
                    if (lenght > 0)
                    {
                        ComUtls.AddCookie("addQuantityCokie", count.ToString(), -1);
                        DataRowCollection rows = tmpdt.Rows;
                        int rowi = 0;
                        int gii = 0;
                        string outid = string.Empty;
                        string strgss = string.Empty;
                        foreach (DataRow row in rows)
                        {
                            gii++;
                            if (PageIndex > 1 && gii == 1)
                            {
                                rowi = 10 * PageIndex;
                            }
                            rowi++;
                            if (rowi < 10)
                            {
                                outid = "0" + rowi.ToString();
                            }
                            else
                            {
                                outid = rowi.ToString();
                            }
                            strgss = row[ATTRIBUTES_TITLE].ToString();
                            if (strgss == "")
                            {
                                strgss = "暂无属性";
                            }
                            _strHtml.AppendFormat(A_HTML_LI, row["ID"], outid, row["PageURL"], row["Title"],
                                                  strgss, row[QUANTITY_COLUMN_TITLE],
                                                  row[REQUIREMENTS_TITLE]);
                        }
                    }
                    else
                    {
                        ComUtls.AddCookie("addQuantityCokie", "0", -1);
                        _strHtml.AppendFormat("<div><img src='{0}' />暂无数据!</div>", "/Images/nodata.GIF");
                    }
                }
            }
            else
            {
                _strHtml.AppendFormat("<div><img src='{0}' />暂无数据!</div>", "/Images/nodata.GIF");
            }

            KeyValuePair<string, string> _node = new KeyValuePair<string, string>("msg", _strHtml.ToString());
            KeyValuePair<string, string> _node1 = new KeyValuePair<string, string>("CheckboxALL", OCookie.QuickOrderOCookie.QuickCheckboxALL);
            KeyValuePair<string, string> _node2 = new KeyValuePair<string, string>("RecordCountVariable", RecordCountVariable.ToString());
            KeyValuePair<string, string> _node3 = new KeyValuePair<string, string>("count",
                                                                                   count.ToString());
            WriteXml(_node, _node1, _node2, _node3);

        }
        #endregion

        #region 清空用户选中的快速定单值处理同时获取产品数据列表
        /// <summary>
        /// 清空用户选中的快速定单值处理同时获取产品数据列表
        /// 回应：XML对象
        /// </summary>
        private static void RfertaddQuickorders()
        {
            StringBuilder _strHtml = new StringBuilder();
            OCookie.QuickOrderOCookie.QuickProcessing = "0";
            OCookie.QuickOrderOCookie.QuickCheckboxALL = "";
            NSW.QuickOrder.EmptyCart();
            _strHtml.AppendFormat("<div><img src='{0}' />暂无数据!</div>", "/Images/nodata.GIF");
            KeyValuePair<string, string> _node = new KeyValuePair<string, string>("msg", _strHtml.ToString());
            ComUtls.AddCookie("addQuantityCokie", "0", -1);
            WriteXml(_node);
        }
        #endregion
        
        
        
        
        #region ***常用对象***

        /// <summary>
        /// 检查类型枚举
        /// </summary>
        public enum CheckingType
        {
            ForbiddenIP = 1,
            BlockToSubmitIPs = 5,
            GlobalCommentabled = 2,
            VerifyCode = 3,
            GlobalSubmittingFrequency = 4
        }

        /// <summary>
        /// 安全检查
        /// </summary>
        /// <param name="verCode">源验证码，如果不检查验证，则传递null</param>
        /// <param name="checkingTypes">检查类型参数组</param>
        /// <returns>检查是否通过</returns>
        private static bool SecurityCheck(string verCode, params CheckingType[] checkingTypes)
        {
            //bool rtnVal = true;

            if (Contain(checkingTypes, CheckingType.ForbiddenIP))
            {
                if (ComUtls.IsForbiddenIP(OConfig.GlobalConfig.ForbiddenIPs, IP))
                {
                    WriteString(ORes.Error.TheIpIsForbidToSubmitData);
                    return false;
                }
            }


            if (Contain(checkingTypes, CheckingType.BlockToSubmitIPs))
            {
                if (ComUtls.IsForbiddenIP(OConfig.GlobalConfig.BlockToSubmitIPs, IP))
                {
                    WriteString(ORes.Error.TheIpIsForbidden);
                    return false;
                }
            }

            if (Contain(checkingTypes, CheckingType.GlobalCommentabled))
            {
                if (!OConfig.GlobalConfig.Commentabled)
                {
                    WriteString(ORes.Error.CommentIsClosedBySystem);
                    return false;
                }
            }

            if (Contain(checkingTypes, CheckingType.GlobalSubmittingFrequency))
            {
                if (!BLL.OSecurity.CheckSubmitFrequency(OConfig.GlobalConfig.GlobalSubmitDataInterval))
                {
                    WriteString(ORes.Error.ToAvoidMaliceSubmittingPlsWaitAndResubmit);
                    return false;
                }
            }

            if (Contain(checkingTypes, CheckingType.VerifyCode) && verCode != null)
            {
                if (verCode.Length == 0)
                {
                    WriteString(ORes.Error.VerifyCodeIsRequiredField);
                    return false;
                }

                if (!CheckVerifyCode(verCode))
                {
                    WriteString(ORes.Error.VerifyCodeIsInvalidPlsRefreshAndTryAgain);
                    return false;
                }
            }

            return true;
        }


        private static bool Contain(CheckingType[] checkingTypes, CheckingType checking)
        {
            foreach (CheckingType item in checkingTypes)
            {
                if (item == checking)
                    return true;
            }

            return false;
        }

        /// <summary>
        /// 获取表单值Request.Form，获取失败则返回 string.Empty
        /// </summary>
        /// <param name="paraName">参数名</param>
        /// <returns>参数值</returns>
        private static string GF(string paraName)
        {
            string val = HttpContext.Current.Request.Form[paraName];
            return val == null ? string.Empty : val.Trim();
        }

        /// <summary>
        /// 获取表单值Request.Form，获取失败则返回默认值
        /// </summary>
        /// <param name="paraName">参数名</param>
        /// <param name="defaultVal">默认值</param>
        /// <returns>参数值</returns>
        private static string GF(string paraName, string defaultVal)
        {
            string val = HttpContext.Current.Request.Form[paraName];
            return val == null ? defaultVal : val.Trim();
        }

        /// <summary>
        /// 获取客户端IP地址
        /// </summary>
        protected static string IP
        {
            get
            {
                return ComUtls.HostAddress;
            }
        }

        /// <summary>
        /// 检查验证码
        /// </summary>
        /// <param name="verCode">源验证码</param>
        /// <returns>是否正确</returns>
        protected static bool CheckVerifyCode(string verCode)
        {
            return BLL.OSecurity.CheckVerifyCode(verCode);
        }

        /// <summary>
        /// 输出 XML 对象
        /// </summary>
        /// <param name="node">节点</param>
        protected static void WriteXml(params KeyValuePair<string, string>[] nodes)
        {

            string xmlCode = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                                + "<root>"
                                + "{node}"
                                + "</root>";

            StringBuilder sbNodes = new StringBuilder();

            foreach (KeyValuePair<string, string> node in nodes)
            {
                sbNodes.AppendFormat("<node key=\"{0}\">{1}</node>",
                    node.Key,
                   HttpUtility.HtmlEncode(node.Value));
            }

            xmlCode = xmlCode.Replace("{node}", sbNodes.ToString());

            HttpContext.Current.Response.ContentType = "text/xml";
            HttpContext.Current.Response.Write(xmlCode);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

        /// <summary>
        /// 输出 XML 对象
        /// </summary>
        /// <param name="node">节点</param>
        protected static void WriteXml(string xml)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "text/xml";
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.UTF8;
            HttpContext.Current.Response.Write(xml);
            HttpContext.Current.Response.End();

            //HttpContext.Current.Response.ContentType = "text/xml";
            //HttpContext.Current.Response.Write(xml);
            //HttpContext.Current.Response.Flush();
            //HttpContext.Current.Response.End();
        }

        protected static void WriteXml(List<KeyValuePair<string, string>> listNodes)
        {
            KeyValuePair<string, string>[] nodes = new KeyValuePair<string, string>[listNodes.Count];

            for (int i = 0; i < listNodes.Count; ++i)
            {
                nodes[i] = listNodes[i];
            }

            WriteXml(nodes);
        }

        /// <summary>
        /// 输出字符串
        /// </summary>
        /// <param name="str">字符串</param>
        protected static void WriteString(string str)
        {
            HttpContext.Current.Response.ContentType = "plain/text";
            HttpContext.Current.Response.Write(str);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

        protected static void WriteString(string format, params object[] args)
        {
            WriteString(string.Format(format, args));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        #endregion

        #region 读取url参数值
        /// <summary>
        /// 读取url参数值
        /// </summary>
        /// <param name="paramName"></param>
        /// <param name="defaultValue"></param>
        /// <returns></returns>
        private string GetUrlParams(string paramName, string defaultValue)
        {
            //string tmp = HttpContext.Current.Request[paramName];
            //if (string.IsNullOrEmpty(tmp))
            //    return defaultValue;
            //return tmp.Replace("'", "''");
            return QS(paramName, defaultValue);
        }

        /// <summary>
        /// 从 URL 解析参数[Request.QueryString]，解析失败则返回 string.Empty
        /// </summary>
        /// <param name="paraName">参数名</param>
        /// <returns>参数值</returns>
        protected static string QS(string paraName)
        {
            string s = HttpContext.Current.Request.QueryString[paraName];
            return s == null ? string.Empty : s;
        }

        /// <summary>
        /// 从 URL 解析参数[Request.QueryString]，解析失败则返回 默认值;
        /// </summary>
        /// <param name="paraName">参数名</param>
        /// <param name="defaultVal">默认值</param>
        /// <returns>参数值</returns>
        protected static string QS(string paraName, string defaultVal)
        {
            string s = HttpContext.Current.Request.QueryString[paraName];
            return s == null ? defaultVal : s;
        }

        protected static string ClearGF(string paraName)
        {
            return HttpUtility.HtmlEncode(GF(paraName).Trim());
        }

        /// <summary>
        /// 输出状态值与消息
        /// </summary>
        /// <param name="state">状态值</param>
        /// <param name="msg">消息</param>
        protected static void WriteState(int state, string msg)
        {
            KeyValuePair<string, string> node = new KeyValuePair<string, string>("state", state.ToString());
            KeyValuePair<string, string> node2 = new KeyValuePair<string, string>("msg", msg);
            WriteXml(node, node2);

        }

        /// <summary>
        /// 获取格式化的错误消息字符串
        /// </summary>
        /// <param name="lstErr">错误消息列表</param>
        /// <returns></returns>
        protected static string GetError(List<string> lstErr)
        {
            if (lstErr.Count == 0)
            {
                return string.Empty;
            }

            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < lstErr.Count; i++)
            {
                if (i != 0)
                {
                    sb.Append("$$");
                }

                sb.Append(lstErr[i]);
            }

            return sb.ToString();
        }


        #endregion
    }
}

