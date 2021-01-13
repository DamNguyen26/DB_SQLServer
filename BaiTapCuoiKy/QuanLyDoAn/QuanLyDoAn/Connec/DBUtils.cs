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
            string datasource = @"DAMNGUYEN";

            string database = "QLDoAn";
            string username = "SA";
            string password = "12345";

            return DBSQLServerUtils.GetDBConnection(datasource, database, username, password);
        }
    }
}
