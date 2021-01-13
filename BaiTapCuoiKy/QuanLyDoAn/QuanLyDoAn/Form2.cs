using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDoAn
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Doan da = new Doan();
            da.ShowDialog();
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Sinhvien sv = new Sinhvien();
            sv.ShowDialog();
        }

        private void linkLabel3_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Giaovien gv = new Giaovien();
            gv.ShowDialog();
        }

        private void linkLabel4_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Lop lo = new Lop();
            lo.ShowDialog();
        }

        private void linkLabel5_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            HoiDong hd = new HoiDong();
            hd.ShowDialog();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
