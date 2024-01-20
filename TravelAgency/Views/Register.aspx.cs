using EHotal.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelAgency.Views.Admin;

namespace TravelAgency.Views
{
    public partial class Register : System.Web.UI.Page
    {
        private Functions MyDataAccess;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            bool flag=true;
            // 检查是否同意用户协议
            if (CheckBox1.Checked == true)
            {

                // 检查是否填满内容
                string ID = Usb.Value;
                string Name = CuName.Value;
                string Address = CuAddress.Value;
                string Number = PhoneNumber.Value;
                string pwdt = Passwordt.Value;
                string pwdt2 = Passwordt2.Value;

                if (ID != "" && Name != "" && Address != "" && Number != "")
                {
                    foreach (char c in ID)
                    {
                        if (c < '0' | c > '9')
                        {
                            flag = false;
                            Response.Write("<script>alert('账号必须是数字组成！');</script>");
                        }

                    }

                    foreach (char n in Number)
                    {
                        if (n < '0' | n > '9')
                        {
                            flag = false;
                            Response.Write("<script>alert('手机号必须是数字组成！');</script>");
                        }

                    }

                    
                    if (pwdt!=pwdt2)
                    {
                        flag = false;
                        Response.Write("<script>alert('两次密码不一致！请重新输入！');</script>");
                    }
                    


                }
                else
                {
                    flag = false;
                    Response.Write("<script>alert('请完善个人信息！');</script>");
                }
            }
            else
            {
                flag = false;
                Response.Write("<script>alert('请阅读并勾选协议！');</script>");
            }

            if (flag)
            {
                MyDataAccess = new Functions();
                SqlDataReader reader;
                string sql = "SELECT * FROM Customer WHERE CustomerName = '" + CuName.Value + "';";
                reader = MyDataAccess.GetReader(sql);

                if (!reader.HasRows) //若不存在重复的昵称，则插入
                {
                    reader.Close();

                    sql = "INSERT INTO Customer (CustomerName, Phone, Address, PassWord) " +
                "VALUES('{0}', '{1}', '{2}', '{3}')";
                    sql = string.Format(sql, CuName.Value, PhoneNumber.Value, CuAddress.Value, Passwordt.Value);

                    MyDataAccess.setData(sql);
                }
                else 
                {
                    flag=false;
                    Response.Write("<script>alert('存在相同昵称！请重新输入昵称！');</script>");
                }
            }


            if (flag)//注册成功则跳转到登录页面
            {
                Response.Write("注册成功！");
                Response.Redirect("~/Views/Admin/login.aspx");
            }
        }


        
    }
}