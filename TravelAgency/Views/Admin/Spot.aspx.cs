using EHotal.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelAgency.Views.Admin
{
    public partial class Spot : System.Web.UI.Page
    {
        private Functions fun;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"].ToString() != "Admin")
            {
                Response.Redirect("login.aspx");
            }
            fun = new Functions();
            showSpot();
        }

        private void showSpot()
        {
            String query = "Select * FROM Spot";
            DataView dv = fun.GetData(query);
            SGV.DataSource = dv;
            SGV.DataBind();
            GridViewRow pagerow = SGV.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text= "共" + dv.Count.ToString() + "条记录," + SGV.PageCount.ToString() + "页第" + (SGV.PageIndex + 1).ToString() + "页,  本页" + SGV.Rows.Count.ToString() + "条记录";
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string SName = SNameTb.Value;
                string SAddress = SAddressTb.Value;
                string SPrice = SPriceTb.Value;
                string Query = "insert into Spot (SpotName,Address,Price) values ('{0}','{1}','{2}');";
                Query = string.Format(Query, SName, SAddress, SPrice);
                fun.setData(Query);
                ErrMsg.InnerText = "景点已添加";
                showSpot();
                SNameTb.Value = "";
                SAddressTb.Value = "";
                SPriceTb.Value = "";
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
                string SName = SNameTb.Value;
                string SAddress = SAddressTb.Value;
                string SPrice = SPriceTb.Value;
                string Query = "update Spot set SpotName = '{0}', Address = '{1}', Price = '{2}' where SpotID = {3};";
                Query = string.Format(Query, SName, SAddress, SPrice, ((Label)SGV.SelectedRow.Cells[1].FindControl("SIL")).Text);
                fun.setData(Query);
                ErrMsg.InnerText = "景点已修改";
                showSpot();
                SNameTb.Value = "";
                SAddressTb.Value = "";
                SPriceTb.Value = "";
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
        }

        protected void SGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = SGV.SelectedIndex;
            if (selectedIndex >= 0)
            {
                SNameTb.Value = ((Label)SGV.Rows[selectedIndex].Cells[1].FindControl("SNL")).Text;
                SAddressTb.Value = ((Label)SGV.Rows[selectedIndex].Cells[1].FindControl("SAL")).Text;
                SPriceTb.Value = ((Label)SGV.Rows[selectedIndex].Cells[1].FindControl("SPL")).Text;
            }
        }

        public void SGV_Del(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string Query = "delete from Spot where SpotID = {0};";
                Query = string.Format(Query, ((Label)SGV.Rows[e.RowIndex].Cells[1].FindControl("SIL")).Text);
                fun.setData(Query);
                ErrMsg.InnerText = "酒店已删除";
                showSpot();
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
        }

        protected void PreBtnClick(object sender, EventArgs e)
        {
            SGV.PageIndex = Math.Max(SGV.PageIndex - 1, 0);
            showSpot();
        }

        protected void NextBtnClick(object sender, EventArgs e)
        {
            SGV.PageIndex = Math.Min(SGV.PageIndex + 1, SGV.PageCount - 1);
            showSpot();
        }
    }
}