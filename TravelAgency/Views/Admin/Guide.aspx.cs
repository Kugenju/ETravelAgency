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
    public partial class Guide : System.Web.UI.Page
    {
        private Functions fun;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"]==null || Session["username"].ToString() != "Admin")
            {
                Response.Redirect("login.aspx");
            }
            fun = new Functions();
            showGuide();
        }

        private void showGuide()
        {
            String query = "Select GuideID, GuideName, Contact FROM Guide";
            DataView dv = fun.GetData(query);
            GGV.DataSource = dv;
            GGV.DataBind();
            GridViewRow pagerow = GGV.BottomPagerRow;
            ((Label)pagerow.Cells[0].FindControl("PagerMsg")).Text = "共" + dv.Count.ToString() + "条记录," + GGV.PageCount.ToString() + "页第" + (GGV.PageIndex + 1).ToString() + "页,  本页" + GGV.Rows.Count.ToString() + "条记录";
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string GName = GNameTb.Value;
                string GContact = GContactTb.Value;
                string Query = "update Guide set GuideName = '{0}', Contact = '{1}' where GuideID = {2};";
                Query = string.Format(Query, GName, GContact, ((Label)GGV.SelectedRow.Cells[1].FindControl("GIL")).Text);
                fun.setData(Query);
                ErrMsg.InnerText = "导游信息已修改";
                showGuide();
                GNameTb.Value = "";
                GContactTb.Value = "";
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
        }


        protected void GGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = GGV.SelectedIndex;
            if (selectedIndex >= 0)
            {
                GNameTb.Value = ((Label)GGV.Rows[selectedIndex].Cells[1].FindControl("GNL")).Text;
                GContactTb.Value = ((Label)GGV.Rows[selectedIndex].Cells[1].FindControl("GCL")).Text;
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string GName = GNameTb.Value;
                string GContact = GContactTb.Value;
                string Query = "insert into Guide (GuideName,Contact) values ('{0}','{1}');";
                Query = string.Format(Query, GName, GContact);
                fun.setData(Query);
                ErrMsg.InnerText = "导游已添加";
                showGuide();
                GNameTb.Value = "";
                GContactTb.Value = "";
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
        }

        public void GGV_Del(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string Query = "delete from Guide where GuideID = {0};";
                Query = string.Format(Query, ((Label)GGV.Rows[e.RowIndex].Cells[1].FindControl("GIL")).Text);
                fun.setData(Query);
                ErrMsg.InnerText = "导游已删除";
                showGuide();
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
        }

        protected void PreBtnClick(object sender, EventArgs e)
        {
            GGV.PageIndex = Math.Max(GGV.PageIndex - 1, 0);
            showGuide();
            Button btn = sender as Button;
            btn.Focus();
        }

        protected void NextBtnClick(object sender, EventArgs e)
        {
            GGV.PageIndex = Math.Min(GGV.PageIndex + 1, GGV.PageCount - 1);
            showGuide();
            Button btn = sender as Button;
            btn.Focus();
        }
    }
}