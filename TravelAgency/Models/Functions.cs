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
        //private SqlCommand Cmd;
        //private SqlDataReader Reader;
        //private DataSet ds;
        private string Constr;
        //private SqlDataAdapter sda;

        public Functions()
        {
            Constr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\nju\lessons\信息系统开发\a大作业\TravelAgency.mdf;Integrated Security=True;Connect Timeout=30";
            Con = new SqlConnection(Constr);
            
        }

        private SqlCommand newCommand()
        {
            SqlCommand Cmd = new SqlCommand();
            Cmd.Connection = Con;
            return Cmd;
        }

        public int setData(string Query)
        {
            int Cnt;
            if (Con.State == ConnectionState.Closed)
            {
                Con.Open();
            }
            SqlCommand localCmd = newCommand();
            localCmd.CommandText = Query;
            Cnt = localCmd.ExecuteNonQuery();
            Con.Close();
            return Cnt;
        }

        public DataView GetData(string Query)  // 与command无关
        {
            DataSet ds = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter(Query, Constr);
            sda.Fill(ds);
            DataView dv = new DataView(ds.Tables[0]);
            return dv;
        }

        public SqlDataReader GetReader(string Query)
        {
            if (Con.State == ConnectionState.Closed)
            {
                Con.Open();
            }
            SqlCommand Cmd = newCommand();
            Cmd.CommandText = Query;
            SqlDataReader Reader = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return Reader;
        }

        public bool CheckExists(string Query)  //检验SQL语句，一般是查询语句，返回的内容是否为空
        {
            if (Con.State == ConnectionState.Closed)
            {
                Con.Open();
            }
            SqlCommand Cmd = newCommand();
            Cmd.CommandText = Query;
            SqlDataReader Reader = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return Reader.HasRows;
        }

    }


}