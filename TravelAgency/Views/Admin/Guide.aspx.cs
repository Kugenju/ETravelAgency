using EHotal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelAgency.Views.Admin
{
    public partial class Guide : System.Web.UI.Page
    {
        private Functions fun;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"].ToString() != "Admin")
            {
                Response.Redirect("login.aspx");
            }
            fun = new Functions();
            showGuide();
        }

        private void showGuide()
        {
            String query = "Select GuideID, GuideName, Contact FROM Guide";
            GGV.DataSource = fun.GetData(query);
            GGV.DataBind();
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string GName = GNameTb.Value;
                string GContact = GContactTb.Value;
                string Query = "update Guide set GuideName = '{0}', Contact = '{1}' where GuideID = {2};";
                Query = string.Format(Query, GName, GContact, GGV.SelectedRow.Cells[1].Text);
                fun.setData(Query);
                ErrMsg.InnerText = "酒店已修改";
                showGuide();
                GNameTb.Value = "";
                GContactTb.Value = "";
            }
            catch (Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string Query = "delete form Guide where GuideID = {0};";
                Query = string.Format(Query, GGV.SelectedRow.Cells[1].Text);
                fun.setData(Query);
                ErrMsg.InnerText = "酒店已删除";
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
                GNameTb.Value = GGV.SelectedRow.Cells[2].Text;
                GContactTb.Value = GGV.SelectedRow.Cells[3].Text;
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string GName = GNTb.Value;
                string GContact = GCTb.Value;
                string Query = "insert into Guide (GuideName,Contact) values ('{0}','{1}');";
                Query = string.Format(Query, GName, GContact);
                fun.setData(Query);
                Msg.InnerText = "酒店已添加";
                showGuide();
                GNTb.Value = "";
                GCTb.Value = "";
            }
            catch (Exception ex)
            {
                Msg.InnerText = ex.Message;
            }
        }

        protected void Res_Click(object sender, EventArgs e)
        {
            GNTb.Value = "";
            GCTb.Value = "";
        }
    }
}