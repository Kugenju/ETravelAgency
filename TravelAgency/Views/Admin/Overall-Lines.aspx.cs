using EHotal.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelAgency.Views.Admin
{
    public partial class Overall_Lines : System.Web.UI.Page
    {
        private Functions fun;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["username"].ToString() != "Admin")
            {
                Response.Redirect("login.aspx");
            }
            fun = new Functions();
            showLines();
        }

        private void showLines()
        {
            string query = "select * from Line";;
            DataView dv = fun.GetData(query);
            OLGV.DataSource = dv;
            OLGV.DataBind();
            GridViewRow pagerow = OLGV.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text = "共" + dv.Count.ToString() + "条记录," + OLGV.PageCount.ToString() + "页第" + (OLGV.PageIndex + 1).ToString() + "页,  本页" + OLGV.Rows.Count.ToString() + "条记录";
        }

        protected void OLGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        public void OLGV_Del(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string Query = "delete from Line where LineID = {0};";
                Query = string.Format(Query, ((Label)OLGV.Rows[e.RowIndex].Cells[1].FindControl("LID")).Text);
                fun.setData(Query);
                showLines();
            }
            catch (Exception ex)
            { 
                
            }
            
        }

        protected void PreBtnClick(object sender, EventArgs e)
        {
            OLGV.PageIndex = Math.Max(OLGV.PageIndex - 1, 0);
            showLines();
            Button btn = sender as Button;
            btn.Focus();
        }

        protected void NextBtnClick(object sender, EventArgs e)
        {
            OLGV.PageIndex = Math.Min(OLGV.PageIndex + 1, OLGV.PageCount - 1);
            showLines();
            Button btn = sender as Button;
            btn.Focus();
        }
    }
}