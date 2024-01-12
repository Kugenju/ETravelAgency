using EHotal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelAgency.Views.Admin
{
    public partial class Spot : System.Web.UI.Page
    {
        private Functions fun;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            fun = new Functions();
            showSpot();
        }

        private void showSpot()
        {
            String query = "Select * FROM Spot";
            SGV.DataSource = fun.GetData(query);
            SGV.DataBind();
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string SName = SNTb.Value;
                string SAddress = SATb.Value;
                string SPrice = SPTb.Value;
                string Query = "insert into Spot (SpotName,Address,Price) values ('{0}','{1}','{2}');";
                Query = string.Format(Query, SName,SAddress,SPrice);
                fun.setData(Query);
                Msg.InnerText = "景点已添加";
                showSpot();
                SNTb.Value = "";
                SATb.Value = "";
                SPTb.Value = "";
            }
            catch (Exception ex)
            {
                Msg.InnerText = ex.Message;
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
                Query = string.Format(Query, SName, SAddress,SPrice, SGV.SelectedRow.Cells[1].Text);
                fun.setData(Query);
                ErrMsg.InnerText = "酒店已修改";
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
                SNameTb.Value = SGV.SelectedRow.Cells[2].Text;
                SAddressTb.Value = SGV.SelectedRow.Cells[3].Text;
                SPriceTb.Value = SGV.SelectedRow.Cells[4].Text;
            }
        }

        protected void Res_Click(object sender, EventArgs e)
        {
            SNTb.Value = "";
            SATb.Value = "";
            SPTb.Value = "";
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string Query = "delete from Spot where SpotID = {0};";
                Query = string.Format(Query, SGV.SelectedRow.Cells[1].Text);
                fun.setData(Query);
                ErrMsg.InnerText = "酒店已删除";
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

    }
}