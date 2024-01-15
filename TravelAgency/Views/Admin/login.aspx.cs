using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

            }
            if(adminRadio.Checked == true)
            {
                if(UserTb.Value == "Admin" && PasswordTb.Value == "123")
                {
                    Session["username"] = UserTb.Value;
                    Session["password"] = PasswordTb.Value;
                    Response.Redirect("index.aspx");
                }
                else
                {
                    Msg.InnerText = "您输入的账号或密码有错误";
                }
            }
        }
    }
}