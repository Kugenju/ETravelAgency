using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using EHotal.Models;

namespace TravelAgency.Admin
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            if(userRadio.Checked == true)
            {
                Functions MyDataAccess = new Functions();
                string sql = "SELECT * FROM Customer WHERE CustomerName = '" + UserTb.Value + "';";
                SqlDataReader reader = MyDataAccess.GetReader(sql);
                if (reader.Read())
                {
                    
                    string pwd = reader.GetString(4);
                    if (pwd == PasswordTb.Value.Trim())
                    {
                        Session["username"] = UserTb.Value;
                        Session["userID"] = reader.GetInt32(0);
                        Response.Redirect("AddOrders.aspx");
                    }
                    else
                    {
                        Msg.InnerText = "您输入的账号或密码有错误";
                    }
                }
                else
                {
                    Msg.InnerText = "用户名不存在，请注册";
                }

                
            }
            if(adminRadio.Checked == true)
            {
                if(UserTb.Value == "Admin" && PasswordTb.Value == "123")
                {
                    Session["username"] = UserTb.Value;
                    //Session["password"] = PasswordTb.Value;
                    Response.Redirect("Overall-Lines.aspx");
                }
                else
                {
                    Msg.InnerText = "您输入的账号或密码有错误";
                }
            }
        }
        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Register.aspx");
        }

    }
}