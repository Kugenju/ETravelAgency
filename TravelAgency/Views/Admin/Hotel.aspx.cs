using EHotal.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.EnterpriseServices;
using System.Linq;
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
            if (Session["username"].ToString() != "Admin")
            {
                Response.Redirect("login.aspx");
            }
            fun = new Functions();
            showHotel();
        }

        private void showHotel()
        {
            String query = "Select HotelID, HotelName, Address, Price FROM Hotel";
            DataView dv = fun.GetData(query);
            HGV.DataSource = dv;
            HGV.DataBind();
            GridViewRow pagerow = HGV.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text = "共" + dv.Count.ToString() + "条记录," + HGV.PageCount.ToString() + "页第" + (HGV.PageIndex + 1).ToString() + "页,  本页" + HGV.Rows.Count.ToString() + "条记录";
        }

        protected void HGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = HGV.SelectedIndex;
            if (selectedIndex >= 0)
            {
                HNameTb.Value = ((Label)HGV.Rows[selectedIndex].Cells[1].FindControl("HNL")).Text;
                HAddressTb.Value = ((Label)HGV.Rows[selectedIndex].Cells[1].FindControl("HAL")).Text;
                HPriceTb.Value = ((Label)HGV.Rows[selectedIndex].Cells[1].FindControl("HPL")).Text;
            }
        }


        public void HGV_Del(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string Query = "delete from Hotel where HotelID = {0};";
                Query = string.Format(Query, ((Label)HGV.Rows[e.RowIndex].Cells[1].FindControl("HIL")).Text);
                fun.setData(Query);
                ErrMsg.InnerText = "酒店已删除";
                showHotel();
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
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


        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string HName = HNameTb.Value;
                string HAddress = HAddressTb.Value;
                string HPrice = HPriceTb.Value;
                string Query = "insert into Hotel (HotelName,Address,Price) values ('{0}','{1}','{2}');";
                Query = string.Format(Query, HName, HAddress, HPrice);
                fun.setData(Query);
                ErrMsg.InnerText = "酒店已保存";
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

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string HName = HNameTb.Value;
                string HAddress = HAddressTb.Value;
                string HPrice = HPriceTb.Value;
                string Query = "update Hotel set HotelName = '{0}', Address = '{1}', Price = {2} where HotelID = {3};";
                Query = string.Format(Query, HName, HAddress, HPrice, ((Label)HGV.SelectedRow.Cells[1].FindControl("HIL")).Text);
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

        protected void PreBtnClick(object sender, EventArgs e)
        {
            HGV.PageIndex = Math.Max(HGV.PageIndex - 1, 0);
            showHotel();
        }

        protected void NextBtnClick(object sender, EventArgs e)
        {
            HGV.PageIndex = Math.Min(HGV.PageIndex + 1, HGV.PageCount - 1);
            showHotel();
        }

    }
}