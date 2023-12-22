using EHotal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelAgency.Views.Admin
{
    public partial class Order : System.Web.UI.Page
    {
        private Functions fun;
        protected void Page_Load(object sender, EventArgs e)
        {
            fun = new Functions();
            showOrder();
        }

        private void showOrder()
        {
            string query = "select Orders.OrderID as ID, Customer.CustomerID, Customer.CustomerName, Line.LineName from Orders, Line, Customer where Orders.LineID=Line.LineID and Orders.CustomerID = Customer.CustomerID";
            OGV.DataSource = fun.GetData(query);
            OGV.DataBind();
        }
    }
}