using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyDoAn.Connec
{
    class DBUtils
    {
        public static SqlConnection GetDBConnection()
        {
            string datasource = @"MAYTINH - 2HU1F0P\SQLEXPRESS";

            string database = "QLDoAn";
            string username = "";
            string password = "";

            return DBSQLServerUtils.GetDBConnection(datasource, database, username, password);
        }
    }
}
