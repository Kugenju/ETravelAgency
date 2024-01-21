using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EHotal.Models;
using System.Data.SqlClient;
using System.Data;

namespace TravelAgency.Views.Admin
{
    public partial class Change_Lines : System.Web.UI.Page
    {
        private Functions MyDataAccess;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["EditLineID"] != null && Session["username"].ToString() == "Admin")  //
                {
                    MyDataAccess = new Functions();
                    string sql = "SELECT * FROM Line WHERE LineID = " + Session["EditLineID"] + ";";
                    SqlDataReader reader = MyDataAccess.GetReader(sql);
                    while (reader.Read())
                    {
                        int LineNameIndex = reader.GetOrdinal("LineName");
                        LineName.Value = reader.GetString(LineNameIndex);
                        int StartTimeIndex = reader.GetOrdinal("StartTime");
                        StartTime.Value = reader.GetDateTime(StartTimeIndex).ToString("yyyy-MM-dd hh:mm:ss");
                        int EndTimeIndex = reader.GetOrdinal("EndTime");
                        EndTime.Value = reader.GetDateTime(EndTimeIndex).ToString("yyyy-MM-dd hh:mm:ss");
                        // 需要解析的话用下面的这行代码
                        // DateTime parsedExactDateTime = DateTime.ParseExact(dateString, "yyyy-MM-dd HH:mm:ss", null);
                        int TransportationIndex = reader.GetOrdinal("Transportaion");
                        Transport.Value = reader.GetString(TransportationIndex);
                        int TransFeeIndex = reader.GetOrdinal("TransFee");
                        TransFee.Value = reader.GetInt32(TransFeeIndex).ToString();
                        int PriceIndex = reader.GetOrdinal("Price");
                        Price.Value = reader.GetInt32(PriceIndex).ToString();
                        int AllDayIndex = reader.GetOrdinal("AllDay");
                        AllDay.Value = reader.GetInt32(AllDayIndex).ToString();
                    }
                    //首先获取线路信息和景点信息\
                    reader.Close();
                    sql = "SELECT * FROM Visit join Spot on Visit.SpotID = Spot.SpotID WHERE Visit.LineID = " + Session["EditLineID"] + "ORDER BY Visit.[Day] ASC;";
                    reader = MyDataAccess.GetReader(sql);
                    string SpotLString = "";
                    while (reader.Read())
                    {
                        //下面加载景点的信息
                        int SpotIndex = reader.GetOrdinal("SpotName");
                        SpotLString += reader.GetString(SpotIndex) + ";";
                    }
                    if (SpotLString.Length > 0) SpotLString = SpotLString.Substring(0, SpotLString.Length - 1);
                    SpotsL.Value = SpotLString;
                    //加载导游信息
                    reader.Close();
                    string GuideString = "";
                    sql = "SELECT * FROM Leadings join Guide on Leadings.GuideID = Guide.GuideID WHERE Leadings.LineID = " + Session["EditLineID"] + ";";
                    reader = MyDataAccess.GetReader(sql);
                    while (reader.Read())
                    {
                        int GuideIndex = reader.GetOrdinal("GuideName");
                        GuideString += reader.GetString(GuideIndex) + ";";
                    }
                    if (GuideString.Length > 0) GuideString = GuideString.Substring(0, GuideString.Length - 1);
                    GuidesL.Value = GuideString;
                    //加载酒店信息
                    reader.Close();
                    string HotelString = "";
                    sql = "SELECT * FROM Reserve join Hotel on Reserve.HotelID = Hotel.HotelID WHERE Reserve.LineID = " + Session["EditLineID"] + "ORDER BY Reserve.[Day] ASC;";
                    reader = MyDataAccess.GetReader(sql);
                    while (reader.Read())
                    {
                        int HotelIndex = reader.GetOrdinal("HotelName");
                        HotelString += reader.GetString(HotelIndex) + ";";
                    }
                    if (HotelString.Length > 0) HotelString = HotelString.Substring(0, HotelString.Length - 1);
                    HotelsL.Value = HotelString;



                    showHotel();
                    showGuide();
                    showSpot();
                }
                else
                {
                    Response.Redirect("Overall-Lines.aspx");
                }
            }
        }

        protected void EditBtn_Click(object sender, EventArgs e)  //保存修改
        {
            MyDataAccess = new Functions();
            SqlDataReader reader;
            //首先修改Line属性
            string sql = "UPDATE Line SET LineName = '{0}', StartTime = '{1}', EndTime = '{2}', Transportaion = '{3}', " +
                "TransFee={4}, AllDay={5}, Price={6} WHERE LineID = {7}";
            sql = string.Format(sql, LineName.Value, StartTime.Value, EndTime.Value, Transport.Value,
                TransFee.Value, AllDay.Value, Price.Value, Session["EditLineID"]);
            MyDataAccess.setData(sql);  //执行SQL

            // 其次修改关联的属性，先删除后添加
            // Hotels
            // 1 先删除记录
            sql = "DELETE FROM Reserve WHERE LineID = " + Session["EditLineID"];
            MyDataAccess.setData(sql);  //执行SQL
            // 2 对每个酒店，先检查是否存在，后插入关联
            string[] toAddHotels = HotelsL.Value.Split(';');
            int day = 1;  //重设天数
            foreach (string curHote in toAddHotels)
            {
                string curHotel = curHote.Trim();
                if (curHotel == "") continue;
                sql = "SELECT HotelID FROM Hotel WHERE HotelName = '" + curHotel + "';";
                reader = MyDataAccess.GetReader(sql);
                if (!reader.HasRows) //若不存在，则插入
                {
                    reader.Close();
                    MyDataAccess.setData("INSERT INTO Hotel (HotelName) VALUES ('" + curHotel + "')");
                    reader = MyDataAccess.GetReader(sql);  // 插入完后重新读取数据
                }
                sql = "INSERT INTO Reserve (LineID, HotelID, [Day]) VALUES ({0}, {1}, {2});";
                reader.Read();
                sql = string.Format(sql, Session["EditLineID"], reader.GetInt32(0), day); reader.Close();
                MyDataAccess.setData(sql);
                day++; 
            }
            day = 1;

            // Spots
            // 1 先删除记录
            sql = "DELETE FROM Visit WHERE LineID = " + Session["EditLineID"];
            MyDataAccess.setData(sql);  //执行SQL
            // 2 对每个酒店，先检查是否存在，后插入关联
            string[] toAddSpots = SpotsL.Value.Split(';');
            foreach (string curSpo in toAddSpots)
            {
                string curSpot = curSpo.Trim();
                if (curSpot == "") continue;
                sql = "SELECT SpotID FROM Spot WHERE SpotName = '" + curSpot + "';";
                reader = MyDataAccess.GetReader(sql);
                if (!reader.HasRows) //若不存在，则插入
                {
                    reader.Close();
                    MyDataAccess.setData("INSERT INTO Spot (SpotName) VALUES ('" + curSpot + "')");
                    reader = MyDataAccess.GetReader(sql);  // 插入完后重新读取数据
                }
                sql = "INSERT INTO Visit (LineID, SpotID, [Day]) VALUES ({0}, {1}, {2});";
                reader.Read();
                sql = string.Format(sql, Session["EditLineID"], reader.GetInt32(0), day); reader.Close();
                MyDataAccess.setData(sql);
                day++; 
            }

            // Guide
            // 1 先删除记录
            sql = "DELETE FROM Leadings WHERE LineID = " + Session["EditLineID"];
            MyDataAccess.setData(sql);  //执行SQL
            // 2 对每个酒店，先检查是否存在，后插入关联
            string[] toAddGuide = GuidesL.Value.Split(';');
            foreach (string curGuid in toAddGuide)
            {
                string curGuide = curGuid.Trim();
                if (curGuide == "") continue;
                sql = "SELECT GuideID FROM Guide WHERE GuideName = '" + curGuide + "';";
                reader = MyDataAccess.GetReader(sql);
                if (!reader.HasRows) //若不存在，则插入
                {
                    reader.Close();
                    MyDataAccess.setData("INSERT INTO Guide (GuideName) VALUES ('" + curGuide + "')");
                    reader = MyDataAccess.GetReader(sql);  // 插入完后重新读取数据
                }
                sql = "INSERT INTO Leadings (LineID, GuideID) VALUES ({0}, {1});";
                reader.Read();
                sql = string.Format(sql, Session["EditLineID"], reader.GetInt32(0)); reader.Close();
                MyDataAccess.setData(sql);
            }
        }

        // 基本迁移了addline的代码
        private void showHotel()
        {
            MyDataAccess = new Functions();
            String query = "Select HotelID, HotelName, Address, Price FROM Hotel";
            DataView dv = MyDataAccess.GetData(query);
            ALHGV.DataSource = dv;
            ALHGV.DataBind();
            GridViewRow pagerow = ALHGV.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text = "共" + dv.Count.ToString() + "条记录," + ALHGV.PageCount.ToString() + "页第" + (ALHGV.PageIndex + 1).ToString() + "页,  本页" + ALHGV.Rows.Count.ToString() + "条记录";
        }

        private void showSpot()
        {
            MyDataAccess = new Functions();
            String query = "Select * FROM Spot";
            DataView dv = MyDataAccess.GetData(query);
            ALSGV.DataSource = dv;
            ALSGV.DataBind();
            GridViewRow pagerow = ALSGV.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text = "共" + dv.Count.ToString() + "条记录," + ALSGV.PageCount.ToString() + "页第" + (ALSGV.PageIndex + 1).ToString() + "页,  本页" + ALSGV.Rows.Count.ToString() + "条记录";
        }

        private void showGuide()
        {
            MyDataAccess = new Functions();
            String query = "Select GuideID, GuideName, Contact FROM Guide";
            DataView dv = MyDataAccess.GetData(query);
            ALGGV.DataSource = dv;
            ALGGV.DataBind();
            GridViewRow pagerow = ALGGV.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text = "共" + dv.Count.ToString() + "条记录," + ALGGV.PageCount.ToString() + "页第" + (ALGGV.PageIndex + 1).ToString() + "页,  本页" + ALGGV.Rows.Count.ToString() + "条记录";
        }
        protected void PreBtnClick(object sender, EventArgs e)
        {
            ALHGV.PageIndex = Math.Max(ALHGV.PageIndex - 1, 0);
            showHotel();
            Button btn = sender as Button;
            btn.Focus();
        }

        protected void NextBtnClick(object sender, EventArgs e)
        {
            ALHGV.PageIndex = Math.Min(ALHGV.PageIndex + 1, ALHGV.PageCount - 1);
            showHotel();
            Button btn = sender as Button;
            btn.Focus();
        }

        protected void GPreBtnClick(object sender, EventArgs e)
        {
            ALGGV.PageIndex = Math.Max(ALGGV.PageIndex - 1, 0);
            showGuide();
            Button btn = sender as Button;
            btn.Focus();
        }

        protected void GNextBtnClick(object sender, EventArgs e)
        {
            ALGGV.PageIndex = Math.Min(ALGGV.PageIndex + 1, ALGGV.PageCount - 1);
            showGuide();
            Button btn = sender as Button;
            btn.Focus();
        }

        protected void SPreBtnClick(object sender, EventArgs e)
        {
            ALSGV.PageIndex = Math.Max(ALSGV.PageIndex - 1, 0);
            showSpot();
            Button btn = sender as Button;
            btn.Focus();
        }

        protected void SNextBtnClick(object sender, EventArgs e)
        {
            ALSGV.PageIndex = Math.Min(ALSGV.PageIndex + 1, ALSGV.PageCount - 1);
            showSpot();
            Button btn = sender as Button;
            btn.Focus();
        }


        protected void AddHotel(object sender, EventArgs e)
        {
            string curHotel = ((Label)ALHGV.SelectedRow.Cells[0].FindControl("HNL")).Text;
            if (HotelsL.Value == "") HotelsL.Value = curHotel;
            else HotelsL.Value += ";" + curHotel;
        }
        protected void AddGuide(object sender, EventArgs e)
        {
            string cur = ((Label)ALGGV.SelectedRow.Cells[0].FindControl("GNL")).Text;
            if (GuidesL.Value == "") GuidesL.Value = cur;
            else GuidesL.Value += ";" + cur;
        }
        protected void AddSpot(object sender, EventArgs e)
        {
            string cur = ((Label)ALSGV.SelectedRow.Cells[0].FindControl("SNL")).Text;
            if (SpotsL.Value == "") SpotsL.Value = cur;
            else SpotsL.Value += ";" + cur;
        }
    }
}