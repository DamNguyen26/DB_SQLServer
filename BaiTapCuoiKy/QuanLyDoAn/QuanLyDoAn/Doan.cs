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

namespace QuanLyDoAn
{
    public partial class Doan : Form
    {
        Ketnoi kn = new Ketnoi();
        DocDuLieu dl = new DocDuLieu();
        public Doan()
        {
            InitializeComponent();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void Form4_Load(object sender, EventArgs e)
        {

        }

        private void btThem_Click(object sender, EventArgs e)
        {
            int kq;
            if (this.tbMSSV.Text.Trim().Length == 0 && this.tbHoTen.Text.Trim().Length == 0 && this.tbQue.Text.Trim().Length == 0 && this.textBox1.Text.Trim().Length == 0)
            {
                MessageBox.Show("Bạn chưa nhập đầy đủ thông tin đồ án", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                if (this.tbMSSV.Text.Trim().Length == 0)
                {
                    MessageBox.Show("Bạn chưa nhập MSSV", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    if (this.tbQue.Text.Trim().Length == 0)
                    {
                        MessageBox.Show("Bạn chưa nhập tên đồ án", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    else
                    {
                        if (this.tbHoTen.Text.Trim().Length == 0)
                        {
                            MessageBox.Show("Bạn chưa nhập mã hội đồng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        }
                        else
                        {
                            if (this.textBox1.Text.Trim().Length == 0)
                            {
                                MessageBox.Show("Bạn chưa nhập năm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                            }
                            else
                            {
                                kq = ThemDoAn(this.tbMSSV.Text, this.tbQue.Text, this.tbHoTen.Text, this.textBox1.Text);
                                if (kq == 1)
                                {
                                    MessageBox.Show("Thêm thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                    this.dataGridView1.DataSource = dl.DocDLStoreprocedure("XuatDoAn");
                                }
                                else
                                {
                                    MessageBox.Show("Thêm không thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                }
                            }


                            
                        }

                    }

                }
            }
        }
        private int ThemDoAn(string MaDoAn, string MaHoiDong, string TenDoAn, int Nam)
        {
            SqlParameter[] para = new SqlParameter[6];
            para[0] = new SqlParameter("@madoan", KiemTraSinhVien(MaDoAn));
            para[1] = new SqlParameter("@mahoidong", KiemTraDiaChi(diaChi));
            para[2] = new SqlParameter("@tendoan", KiemTraChuNha(chuNha));
            para[3] = new SqlParameter("@nam", ngayDen);
            para[3].Direction = ParameterDirection.Output;
            int kq = dl.Insert_Delete_UpDate("ThemOTro", para);
            return kq;
        }
    }

}
    }
}
