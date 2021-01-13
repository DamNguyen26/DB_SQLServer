using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using QuanLyDoAn.Connec;

namespace QuanLyDoAn
{
    public partial class Giaovien : Form
    {
        public Giaovien()
        {
            InitializeComponent();
        }
        private void dataGridViewGiaoVien_Load(object sender, EventArgs e)
        {
            SqlConnection conn = DBUtils.GetDBConnection();
            conn.Open();
            String sql = "SELECT * FROM GV";
            DataSet ds = new DataSet();
            SqlDataAdapter dap = new SqlDataAdapter(sql, conn);
            dap.Fill(ds);
            dataGridViewGiaoVien.DataSource = ds.Tables;
            dataGridViewGiaoVien.Refresh();
        }

        private void btCapNhat_Click(object sender, EventArgs e)
        {
            SqlConnection conn = DBUtils.GetDBConnection();
            conn.Open();
            String sql = "SELECT * FROM GV";
            DataSet ds = new DataSet();
            SqlDataAdapter dap = new SqlDataAdapter(sql, conn);
            dap.Fill(ds);
            dataGridViewGiaoVien.DataSource = ds.Tables;
            dataGridViewGiaoVien.Refresh();
        }
    }   
}
