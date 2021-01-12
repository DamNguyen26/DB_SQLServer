using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Data.SqlClient;

namespace QuanLyDoAn
{
    class DocDuLieu
    {
        Ketnoi kn = new Ketnoi();
        public DocDuLieu()
        {

        }
        public DataTable DocDL(string str)
        {
            try
            {
                kn.Open();
                SqlDataAdapter da = new SqlDataAdapter(str, kn.GetCon);
                DataTable table = new DataTable();
                da.Fill(table);
                kn.Close();
                return table;
            }
            catch
            {
                return null;
            }
        }
        public DataSet DocDL1(string str)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(str, kn.GetCon);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            catch
            {
                return null;
            }
        }
        public DataTable DocDLStoreprocedure(string strSP)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(strSP, kn.GetCon);
                cmd.CommandType = CommandType.StoredProcedure;
                //lop do du lieu
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                da.Fill(table);
                return table;
            }
            catch
            {
                return null;
            }

        }
        public DataTable DocDLSP(string sp, SqlParameter[] para)
        {
            Ketnoi kn = new Ketnoi();
            try
            {
                kn.Open();
                SqlCommand cmd = new SqlCommand(sp, kn.GetCon);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                if (para != null)
                    cmd.Parameters.AddRange(para);

                DataTable table = new DataTable();
                da.Fill(table);
                return table;
            }
            catch
            {
                return null;
            }
            finally
            {
                kn.Close();
            }
        }
        public int Insert_Delete_UpDate(string storeprocedure, SqlParameter[] para)
        {
            Ketnoi kn = new Ketnoi();
            try
            {
                kn.Open();
                SqlCommand cmd = new SqlCommand(storeprocedure, kn.GetCon);
                cmd.CommandType = CommandType.StoredProcedure;
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                if (para != null)
                    cmd.Parameters.AddRange(para);
                int kq = (int)cmd.ExecuteNonQuery();
                return kq;
            }
            catch
            {
                return -1;
            }
            finally
            {
                kn.Close();
            }
        }
        //public DataTable ExecuteStoreProduceTable(string storeproduce, SqlParameter[] para)
        //{
        //    KetNoi connection = new KetNoi();
        //    try
        //    {
        //        connection.Open();
        //        SqlCommand cmd = new SqlCommand(storeproduce, connection.GetCon);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        if (para != null)
        //            cmd.Parameters.AddRange(para);
        //        DataTable table = new DataTable();
        //        //doc du lieu ket noi xong roi ngat ket noi 
        //        table.Load(cmd.ExecuteReader(CommandBehavior.CloseConnection));
        //        return table;
        //    }
        //    catch
        //    {
        //        return null;
        //    }
        //}
    }
}
