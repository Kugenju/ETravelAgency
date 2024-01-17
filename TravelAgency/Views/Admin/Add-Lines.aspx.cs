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
    public partial class Add_Lines : System.Web.UI.Page
    {
        private Functions fun;
        protected void Page_Load(object sender, EventArgs e)
        {
            fun = new Functions();
            showHotel();
            showGuide();
            showSpot();
        }
        private void showHotel()
        {
            String query = "Select HotelID, HotelName, Address, Price FROM Hotel";
            DataView dv = fun.GetData(query);
            ALHGV.DataSource = dv;
            ALHGV.DataBind();
            GridViewRow pagerow = ALHGV.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text = "共" + dv.Count.ToString() + "条记录," + ALHGV.PageCount.ToString() + "页第" + (ALHGV.PageIndex + 1).ToString() + "页,  本页" + ALHGV.Rows.Count.ToString() + "条记录";
        }

        private void showSpot()
        {
            String query = "Select * FROM Spot";
            DataView dv = fun.GetData(query);
            ALSGV.DataSource = dv;
            ALSGV.DataBind();
            GridViewRow pagerow = ALSGV.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text = "共" + dv.Count.ToString() + "条记录," + ALSGV.PageCount.ToString() + "页第" + (ALSGV.PageIndex + 1).ToString() + "页,  本页" + ALSGV.Rows.Count.ToString() + "条记录";
        }

        private void showGuide()
        {
            String query = "Select GuideID, GuideName, Contact FROM Guide";
            DataView dv = fun.GetData(query);
            ALGGV.DataSource = dv;
            ALGGV.DataBind();
            GridViewRow pagerow = ALGGV.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text = "共" + dv.Count.ToString() + "条记录," + ALGGV.PageCount.ToString() + "页第" + (ALGGV.PageIndex + 1).ToString() + "页,  本页" + ALGGV.Rows.Count.ToString() + "条记录";
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
    }
}