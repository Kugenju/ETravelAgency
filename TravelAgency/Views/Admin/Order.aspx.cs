using EHotal.Models;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelAgency.Views.Admin
{
    public partial class Order : System.Web.UI.Page
    {
        private Functions fun;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["username"].ToString() != "Admin")
                Response.Redirect("login.aspx");
            fun = new Functions();
            showOrder();
        }

        private void showOrder()
        {
            string query = "select * from Orders, Line, Customer where Orders.LineID=Line.LineID and Orders.CustomerID = Customer.CustomerID";
            DataView dv  = fun.GetData(query);
            OGV.DataSource = dv;
            OGV.DataBind();
            GridViewRow pagerow = OGV.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text = "共" + dv.Count.ToString() + "条记录," + OGV.PageCount.ToString() + "页第" + (OGV.PageIndex + 1).ToString() + "页,  本页" + OGV.Rows.Count.ToString() + "条记录";
        }


        protected void OGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void OGV_Del(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string Query = "delete from Orders where OrderID = {0};";
                Query = string.Format(Query, ((Label)OGV.Rows[e.RowIndex].Cells[1].FindControl("OIL")).Text);
                fun.setData(Query);
                //PagerMsg.InnerText = "订单已删除";
                showOrder();
            }
            catch (Exception ex)
            {
                //PagerMsg.InnerText = ex.Message;
            }
        }

        protected void PreBtnClick(object sender, EventArgs e)
        {
            OGV.PageIndex = Math.Max(OGV.PageIndex - 1, 0);
            showOrder();
            Button btn = sender as Button;
            btn.Focus();
        }

        protected void NextBtnClick(object sender, EventArgs e)
        {
            OGV.PageIndex = Math.Min(OGV.PageIndex + 1, OGV.PageCount - 1);
            showOrder();
            Button btn = sender as Button;
            btn.Focus();
        }
    }
}