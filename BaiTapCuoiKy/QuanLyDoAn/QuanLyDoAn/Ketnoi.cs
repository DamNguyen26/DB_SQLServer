using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace QuanLyDoAn
{
    class Ketnoi
    {
        SqlConnection con;

        public SqlConnection GetCon
        {
            get { return con; }

        }
        public Ketnoi()
        {
            //chuoi ket noi
            string strcon = "Data Source=(local);Integrated Security = SSPI; Initial Catalog = QLDoAn";
            //con = new SqlConnection();
            //con.ConnectionString = "Data Source=(local); Initial Catalog = QLYSinhVien; User ID = sa; password = sa";
            con = new SqlConnection(strcon);
           

        }
        public Ketnoi(string str)
        {
            //chuoi ket noi
            //string strcon = "Data Source=(local);Integrated Security = SSPI; Initial Catalog = cnpm";
            con = new SqlConnection(str);
            //    con.Open();
            //Open();
        }
        public void Open()
        {
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();

        }
        public void Close()
        {
            if (con.State != System.Data.ConnectionState.Closed)
                con.Close();
        }
    }
}
