using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EHotal.Models
{
    public class Functions
    {
        private SqlConnection Con;
        private SqlCommand Cmd;
        private SqlDataReader Reader;
        private DataTable dt;
        private string Constr;
        private SqlDataAdapter sda;

        public int setData(string Query)
        {
            int Cnt;
            if (Con.State == ConnectionState.Closed)
            {
                Con.Open();
            }
            Cmd.CommandText = Query;
            Cnt = Cmd.ExecuteNonQuery();
            Con.Close();
            return Cnt;
        }

        public DataTable GetData(string Query)
        {
            dt = new DataTable();
            sda = new SqlDataAdapter(Query, Constr);
            sda.Fill(dt);
            return dt;
        }

        public SqlDataReader GetReader(string Query)
        {
            if (Con.State == ConnectionState.Closed)
            {
                Con.Open();
            }
            Cmd.CommandText = Query;
            Reader = Cmd.ExecuteReader();
            return Reader;
        }

        public Functions()
        {
            Constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\C#data\TravelAgency\TravelAgency.mdf;Integrated Security=True;Connect Timeout=30";
            Con = new SqlConnection(Constr);
            Cmd = new SqlCommand();
            Cmd.Connection = Con;
        }
    }


}