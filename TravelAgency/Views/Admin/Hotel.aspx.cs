using EHotal.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.EnterpriseServices;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelAgency.Views.Admin
{
    public partial class Hotel : System.Web.UI.Page
    {
        private Functions fun;
        protected void Page_Load(object sender, EventArgs e)
        {
            fun = new Functions();
            showHotel();
        }
        //    {
        //        fun = new Functions();
        //    String query = "SELECT CustomerID, CustomerName, Phone, Address FROM dbo.Customer";
        //    SqlDataReader reader = fun.GetReader(query);
        //    StringBuilder tableContent = new StringBuilder();
        //    tableContent.Append("<div class=\"table-responsive\">\r\n                                        <table class=\"table student-data-table m-t-20\">\r\n                                            <thead>\r\n                                                <tr>\r\n                                                    <th><label><input type=\"checkbox\" value=\"\"></label>CustomerID<th>\r\n                                                    <th>CustomerName</th>\r\n                                                    <th> Phone</th>\r\n                                                    <th>Address</th>\r\n                                                </tr>\r\n                                            </thead>\r\n                                            <tbody>\r\n");
        //        while (reader.Read())
        //        {
        //            tableContent.Append("                                               <tr>\r\n");
        //            tableContent.AppendFormat("                                                 <td><label><input type=\"checkbox\" value=\"\"></label>{0}</td>\r\n", reader["CustomerID"]);
        //            tableContent.AppendFormat("                                                 <td>{0}</td>\r\n", reader["CustomerName"]);
        //            tableContent.AppendFormat("                                                 <td>{0}</td>\r\n", reader["Phone"]);
        //            tableContent.AppendFormat("                                                 <td>{0}</td>\r\n", reader["Address"]);
        //            tableContent.Append("                                                 <td>\r\n                                                        <span><a href=\"\"><i class=\"ti-eye color-default\"></i></a> </span>\r\n                                                        <span><a href=\"\"><i class=\"ti-pencil-alt color-success\"></i></a></span>\r\n                                                        <span><a href=\"\"><i class=\"ti-trash color-danger\"></i> </a></span>\r\n                                                    </td>\r\n");
        //            tableContent.Append("                                               </tr>\r\n");
        //        }
        //tableContent.Append("                                            </tbody>\r\n                                        </table>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>");
        //            String script = "document.addEventListener(\"DOMContentLoaded\", function() {document.getElementById('HTable').innerHTML = \"" + tableContent.ToString() + "\"});";
        //ClientScript.RegisterStartupScript(this.GetType(), "LoadCustomerData", script, true);
        //}
        private void showHotel()
        {
            String query = "Select HotelID, HotelName, Address, Price FROM Hotel";
            HGV.DataSource = fun.GetData(query);
            HGV.DataBind();
        }

        protected void HGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = HGV.SelectedIndex;
            if (selectedIndex >= 0)
            {
                HNameTb.Value = HGV.SelectedRow.Cells[2].Text;
                HAddressTb.Value = HGV.SelectedRow.Cells[3].Text;
                HPriceTb.Value = HGV.SelectedRow.Cells[4].Text;
            }
        }

        protected void HGV_PageIndexChanged(object sender, EventArgs e)
        {
            int newPageIndex = HGV.PageIndex;
        }

        protected void HGV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // 得到该控件
            GridView theGrid = sender as GridView;
            int newPageIndex = 0;
            if (e.NewPageIndex == -3)
            {
                //点击了Go按钮
                TextBox txtNewPageIndex = null;

                //GridView较DataGrid提供了更多的API，获取分页块可以使用BottomPagerRow 或者TopPagerRow，当然还增加了HeaderRow和FooterRow
                GridViewRow pagerRow = theGrid.BottomPagerRow;

                if (pagerRow != null)
                {
                    //得到text控件
                    txtNewPageIndex = pagerRow.FindControl("txtNewPageIndex") as TextBox;
                }
                if (txtNewPageIndex != null)
                {
                    //得到索引
                    newPageIndex = int.Parse(txtNewPageIndex.Text) - 1;
                }
            }
            else
            {
                //点击了其他的按钮
                newPageIndex = e.NewPageIndex;
            }
            //防止新索引溢出
            newPageIndex = newPageIndex < 0 ? 0 : newPageIndex;
            newPageIndex = newPageIndex >= theGrid.PageCount ? theGrid.PageCount - 1 : newPageIndex;

            //得到新的值
            theGrid.PageIndex = newPageIndex;

            //重新绑定数据
            //getInfo();
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string Query = "delete from Hotel where HotelID = {0};";
                Query = string.Format(Query, HGV.SelectedRow.Cells[1].Text);
                fun.setData(Query);
                ErrMsg.InnerText = "酒店已删除";
                showHotel();
                HNameTb.Value = "";
                HAddressTb.Value = "";
                HPriceTb.Value = "";
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string HName = HNameTb.Value;
                string HAddress = HAddressTb.Value;
                string HPrice = HPriceTb.Value;
                string Query = "INSERT INTO Hotel (HotelName, Address, Price) VALUES ('{0}', '{1}', {2});";
                Query = string.Format(Query, HName, HAddress, HPrice);
                fun.setData(Query);
                ErrMsg.InnerText = "酒店已添加";
                showHotel();
                HNTb.Value = "";
                HATb.Value = "";
                HPTb.Value = "";
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string HName = HNameTb.Value;
                string HAddress = HAddressTb.Value;
                string HPrice = HPriceTb.Value;
                string Query = "update Hotel set HotelName = {0}, Address = {1}, Price = {2} where HotelID = {3};";
                Query = string.Format(Query, HName, HAddress, HPrice,HGV.SelectedRow.Cells[1].Text);
                fun.setData(Query);
                ErrMsg.InnerText = "酒店已修改";
                showHotel();
                HNameTb.Value = "";
                HAddressTb.Value = "";
                HPriceTb.Value = "";
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
        }

        protected void Res_Click(object sender, EventArgs e)
        {
            HNTb.Value = "";
            HATb.Value = "";
            HPTb.Value = "";
        }
    }
}