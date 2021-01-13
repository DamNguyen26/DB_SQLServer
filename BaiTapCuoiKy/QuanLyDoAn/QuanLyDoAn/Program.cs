using QuanLyDoAn.Connec;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDoAn
{
    static class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Getting Connection ...");
            SqlConnection conn = DBUtils.GetDBConnection();

            try
            {
                Console.WriteLine("Openning Connection ...");

                conn.Open();

                Console.WriteLine("Connection successful!");
            }
            catch (Exception e)
            {
                Console.WriteLine("Error: " + e.Message);
            }

            Console.Read();
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Giaovien());
        }
    }
}
