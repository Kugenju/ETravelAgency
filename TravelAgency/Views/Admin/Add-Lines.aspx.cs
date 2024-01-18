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
    public partial class Add_Lines : System.Web.UI.Page
    {
        private Functions MyDataAccess;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null || Session["username"].ToString() != "Admin")
                    Response.Redirect("login.aspx");

                ResetBut_Click(sender, e);

                showHotel();
                showGuide();
                showSpot();
            }
        }
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



        protected void AddLineBut_Click(object sender, EventArgs e)  //添加线路的代码
        {
            //是Change-Lines里函数的简化版本
            MyDataAccess = new Functions();
            SqlDataReader reader;
            //首先修改Line属性
            string sql = "INSERT INTO Line (LineName, StartTime, EndTime, Transportaion, TransFee, AllDay, Price, Status) " +
                "VALUES('{0}', '{1}', '{2}', '{3}', {4}, {5}, {6}, 0)";
            sql = string.Format(sql, LineName.Value, StartTime.Value, EndTime.Value, Transport.Value,
                TransFee.Value, AllDay.Value, Price.Value);
            //try
            //{
                MyDataAccess.setData(sql);  //执行SQL
            //}
            //catch (Exception ex)
            //{
              //  ErrInfo.InnerText = ex.Message;
            //}

            sql = "SELECT LineID FROM Line WHERE LineName = '" + LineName.Value + "';";
            reader = MyDataAccess.GetReader(sql);
            reader.Read();
            int AddLineID = reader.GetInt32(0);
            reader.Close();


            // 其次增加关联的属性
            // Hotels
            //  对每个酒店，先检查是否存在，后插入关联
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
                sql = string.Format(sql, AddLineID, reader.GetInt32(0), day); reader.Close();
                MyDataAccess.setData(sql);
                day++;
            }
            day = 1;

            // Spots
            // 2 对每个景点，先检查是否存在，后插入关联
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
                sql = string.Format(sql, AddLineID, reader.GetInt32(0), day); reader.Close();
                MyDataAccess.setData(sql);
                day++;
            }

            // Guide
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
                sql = string.Format(sql, AddLineID, reader.GetInt32(0)); reader.Close();
                MyDataAccess.setData(sql);
            }
        }
        protected void ResetBut_Click(object sender, EventArgs e)  //重设数据的代码
        {
            MyDataAccess = new Functions();
            LineName.Value = "<填入旅行线路名称>";
            StartTime.Value = DateTime.Today.ToString("yyyy-MM-dd hh:mm:ss");
            EndTime.Value = DateTime.Today.AddDays(1).ToString("yyyy-MM-dd hh:mm:ss");
            Transport.Value = "大巴";
            TransFee.Value = "0";
            Price.Value = "1000";
            AllDay.Value = "1";
        }

        protected void ALHGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = ALHGV.SelectedIndex;
            if (selectedIndex >= 0)
            {

            }
        }

        protected void ALHGV_PageIndexChanged(object sender, EventArgs e)
        {
            int newPageIndex = ALHGV.PageIndex;
        }

        protected void ALHGV_PageIndexChanging(object sender, GridViewPageEventArgs e)
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


        // 将下面表格中的内容插入
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