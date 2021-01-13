using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyDoAn.Connec
{
    class DBSQLServerUtils
    {
        public static SqlConnection
                 GetDBConnection(string datasource, string database, string username, string password)
        {
            //  Data Source=DAMNGUYEN;Initial Catalog=QLDoAn;Persist Security Info=True;User ID=SA;Password=***********
            //  Data Source = MAYTINH - 2HU1F0P\SQLEXPRESS; Initial Catalog = QLDoAn; Integrated Security = True
            //
            string connString = @"Data Source=" + datasource + ";Initial Catalog="
                        + database + ";Persist Security Info=True;User ID=" + username + ";Password=" + password;

            SqlConnection conn = new SqlConnection(connString);

            return conn;
        }

    }
}
