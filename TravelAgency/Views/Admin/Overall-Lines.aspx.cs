﻿using EHotal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelAgency.Views.Admin
{
    public partial class Overall_Lines : System.Web.UI.Page
    {
        private Functions fun;
        protected void Page_Load(object sender, EventArgs e)
        {
            fun = new Functions();
        }

        private void showLines()
        {
            string query = "select * from Line";
            OLGV.DataSource = fun.GetData(query);
            OLGV.DataBind();
        }
    }
}