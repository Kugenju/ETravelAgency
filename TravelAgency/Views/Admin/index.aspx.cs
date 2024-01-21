using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using EHotal.Models;

namespace TravelAgency.Views.Admin
{
    public partial class index : System.Web.UI.Page
    {
        private Functions fun;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"].ToString().Trim() != "Admin")
            {
                Response.Redirect("login.aspx");
            }
            loadStats();
            showMonProfit();
            showLineProfit();
        }
        private void loadStats()   //加载上方的统计数据
        {
            // 客户数量
            fun = new Functions();
            string sql = "Select COUNT(*) from Customer";
            SqlDataReader reader = fun.GetReader(sql);
            reader.Read();
            USERCOUNT.Text = reader.GetInt32(0).ToString();
            reader.Close();
            // 导游数量
            sql = "Select COUNT(*) from Guide";
            reader = fun.GetReader(sql);
            reader.Read();
            GUIDECOUNT.Text = reader.GetInt32(0).ToString();
            reader.Close();
            // 线路数量
            sql = "Select COUNT(*) from Line";
            reader = fun.GetReader(sql);
            reader.Read();
            LINECOUNT.Text = reader.GetInt32(0).ToString();
            reader.Close();

            // 总收益数量
            sql = "Select SUM(MonthProfit) from MONTH_PANNAL";
            reader = fun.GetReader(sql);
            reader.Read();
            TOTALPROFIT.Text = reader.GetInt32(0).ToString();
            reader.Close();

        }
        private void showMonProfit()
        {
            fun = new Functions();
            string query = "select * from MONTH_PANNAL"; ;
            DataView dv = fun.GetData(query);
            MONTHPANEL.DataSource = dv;
            MONTHPANEL.DataBind();
            GridViewRow pagerow = MONTHPANEL.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text = "共" + dv.Count.ToString() + "条记录," + MONTHPANEL.PageCount.ToString() + "页第" + (MONTHPANEL.PageIndex + 1).ToString() + "页,  本页" + MONTHPANEL.Rows.Count.ToString() + "条记录";

        }

        private void showLineProfit()
        {
            fun = new Functions();
            string query = "select * from LineStats join Line on LineStats.LineID = Line.LineID"; ;
            DataView dv = fun.GetData(query);
            LineStats.DataSource = dv;
            LineStats.DataBind();
            GridViewRow pagerow = LineStats.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text = "共" + dv.Count.ToString() + "条记录," + LineStats.PageCount.ToString() + "页第" + (LineStats.PageIndex + 1).ToString() + "页,  本页" + LineStats.Rows.Count.ToString() + "条记录";

        }


        protected void PreBtnClick(object sender, EventArgs e)
        {
            MONTHPANEL.PageIndex = Math.Max(MONTHPANEL.PageIndex - 1, 0);
            showMonProfit();
            Button btn = sender as Button;
            btn.Focus();
        }

        protected void NextBtnClick(object sender, EventArgs e)
        {
            MONTHPANEL.PageIndex = Math.Min(MONTHPANEL.PageIndex + 1, MONTHPANEL.PageCount - 1);
            showMonProfit();
            Button btn = sender as Button;
            btn.Focus();
        }

        protected void PreBtnClick2(object sender, EventArgs e)
        {
            LineStats.PageIndex = Math.Max(LineStats.PageIndex - 1, 0);
            showLineProfit();
            Button btn = sender as Button;
            btn.Focus();
        }

        protected void NextBtnClick2(object sender, EventArgs e)
        {
            LineStats.PageIndex = Math.Min(LineStats.PageIndex + 1, LineStats.PageCount - 1);
            showLineProfit();
            Button btn = sender as Button;
            btn.Focus();
        }

    }
}