using EHotal.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelAgency.Views.Admin
{
    public partial class AddOrders : System.Web.UI.Page
    {
        private Functions fun;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"] == null || Session["username"].ToString() != "Admin")
            //{
            //    Response.Redirect("login.aspx");
            //}
            fun = new Functions();
            showLines();
        }

        private void showLines()
        {
            string query = "select * from Line"; ;
            DataView dv = fun.GetData(query);
            OLGV.DataSource = dv;
            OLGV.DataBind();
            GridViewRow pagerow = OLGV.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text = "共" + dv.Count.ToString() + "条记录," + OLGV.PageCount.ToString() + "页第" + (OLGV.PageIndex + 1).ToString() + "页,  本页" + OLGV.Rows.Count.ToString() + "条记录";
        }

        protected void OLGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            //需要加载数据到labels
            //首先从数据库中获取景点数据
            fun = new Functions();
            string seletedIndex = ((Label)OLGV.SelectedRow.Cells[0].FindControl("LID")).Text;
            string sql = "SELECT * FROM Visit join Spot on Visit.SpotID = Spot.SpotID WHERE Visit.LineID = " + seletedIndex + "ORDER BY Visit.[Day] ASC;";
            SqlDataReader reader = fun.GetReader(sql);
            string SpotInfoStr = "", CurStr;
            while (reader.Read())
            {
                int dayIndex = reader.GetOrdinal("Day");
                int SpotIndex = reader.GetOrdinal("SpotName");
                CurStr = "第{0}天，游览“{1}”。";
                CurStr = string.Format(CurStr, reader.GetInt32(dayIndex), reader.GetString(SpotIndex));
                SpotInfoStr += CurStr + "<br />";
            }
            reader.Close();
            SpotsInfo.InnerHtml = SpotInfoStr;


            //其次从数据库中获取酒店数据
            sql = "SELECT * FROM Reserve join Hotel on Reserve.HotelID = Hotel.HotelID WHERE Reserve.LineID = " + seletedIndex + "ORDER BY Reserve.[Day] ASC;";
            reader = fun.GetReader(sql);
            string HotelInfoStr = "";
            while (reader.Read())
            {
                int dayIndex = reader.GetOrdinal("Day");
                int SpotIndex = reader.GetOrdinal("HotelName");
                int addIndex = reader.GetOrdinal("Address");
                CurStr = "第{0}天，在“{1}”住宿。";
                CurStr = string.Format(CurStr, reader.GetInt32(dayIndex), reader.GetString(SpotIndex));
                HotelInfoStr += CurStr + "<br />";
            }
            reader.Close();
            HotelsInfo.InnerHtml = HotelInfoStr;

            //从数据库中读取导游信息
            sql = "SELECT * FROM Leadings join Guide on Leadings.GuideID = Guide.GuideID WHERE Leadings.LineID = " + seletedIndex + ";";
            reader = fun.GetReader(sql);
            string GuideInfoStr = "";
            int count = 1;
            while (reader.Read())
            {
                int nameidx = reader.GetOrdinal("GuideName");
                int contactidx = reader.GetOrdinal("Contact");
                CurStr = "导游{0}，{1}<br />      联系方式：{2}。";
                CurStr = string.Format(CurStr, count++, reader.GetString(nameidx), reader.GetString(contactidx));
                GuideInfoStr += CurStr + "<br />";
            }
            reader.Close();
            GuideInfo.InnerHtml = GuideInfoStr;
        }

        protected void AddOrderBtn_Click(object sender, EventArgs e)  // 添加订单
        {
            fun = new Functions();
            string sql = "INSERT INTO Orders (CustomerID, LineID) VALUES ({0}, {1});";
            sql = string.Format(sql, Session["userID"], ((Label)OLGV.SelectedRow.Cells[0].FindControl("LID")).Text);

            fun.setData(sql);
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