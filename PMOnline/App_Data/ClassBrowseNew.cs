using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PMOnline.Models
{
    public class ClassBrowseNew
    {
        public static String conDMZ = "Data Source=PK-Leave\\PKLEAVEDB;Initial Catalog=PMOnline;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public List<ArrayList> Signin(string username, string password)
        {
            List<ArrayList> Signin = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conDMZ))
            {
                string sql = "SELECT [Emp_Num],[pass_id] FROM [VW_PMOnline_Login] ";

                sql += "WHERE [Emp_Num] = '" + username + "' AND [pass_id] = '" + password + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            Signin.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return Signin;
        }
        public List<ArrayList> Check_Approve_Reject(string username, string password)
        {
            List<ArrayList> Signin = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conDMZ))
            {
                string sql = "SELECT [Emp_Num],[pass_id] FROM [VW_PMOnline_Check_Approve_Reject] ";

                sql += "WHERE [Emp_Num] = '" + username + "' AND [pass_id] = '" + password + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            Signin.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return Signin;
        }
        public List<ArrayList> GetSite_ref()
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "SELECT DISTINCT [site_ref],[Comp_Name] FROM [VW_Dept_AllSite]";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GETIT_TAG(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "SELECT TOP(1000) [IT_Tag_Code],[Asset_of_Company] ,[EmpNum],[Fullname] FROM [dbo].[TB_PMOnline_IT_TAG_New]";
                if(search != "" )
                {
                        sql += "WHERE ";
                        sql += " [Asset_of_Company] like '%" + search + "%' ";
                        sql += "OR [IT_TAG_CODE] like '%" + search + "%' ";
                        sql += "OR [EmpNum] like '%" + search + "%' ";
                        sql += "OR [Fullname] like '%" + search + "%' ";
                    
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GETSearchAssign(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "SELECT TOP(1000) [ID],[IT_TAG],[IT_TAG_GROUP],[EmpNum],[Status],[Assign_Date],[site_ref],[Reject_Remark],[CreateBy],[CreateDate] FROM[dbo].[TB_PMOnline_Assign]";
                if (search != "")
                {
                    sql += "WHERE ";
                    sql += " [IT_TAG] like '%" + search + "%' ";
                    sql += "OR [EmpNum] like '%" + search + "%' ";
                    sql += "OR [IT_TAG_GROUP] like '%" + search + "%' ";

                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> IT_TAG_Assign_Report(string site_ref, string IT_TAG, string EmpNum, string Status)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "SELECT DISTINCT [ID],[IT_TAG],[Status],[site_ref],[EmpNum],[IT_TAG_GROUP],[Assign_Date],[Fullname] FROM [dbo].[VW_PMOnline_CheckList]";
                if (site_ref != "" || IT_TAG != "" || EmpNum != "" || Status != "")
                {
                    sql += "where ";
                    sql += "[site_ref] like '%" + site_ref + "%' AND ";
                    sql += "[IT_TAG] like '%" + IT_TAG + "%' AND ";
                    sql += "[EmpNum] like '%" + EmpNum + "%' AND ";
                   if(Status == "Awaiting MA")
                    {
                        sql += "[Status] like 'Awaiting MA' OR  [Status] like 'Reject' ";
                    }
                    else
                    {
                        sql += "[Status] like '%" + Status + "%'  ";
                    }
                }
                sql += "ORDER BY [Status] , [site_ref], [EmpNum]";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> IT_TAG_Assign_ListReport(string stcYear, string SiteRef, string IT_TAG_Group, string IT_TAG, string EmpNum)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "SELECT [ID],[IT_TAG],[Status],[site_ref],[EmpNum],[IT_TAG_GROUP],[Assign_Date],[Fullname] FROM [dbo].[VW_PMOnline_CheckList]";
                sql += "where ";
                sql += "[Status] = 'Complete'  ";
                if (stcYear != "" || SiteRef != "" || IT_TAG_Group != "" || IT_TAG != ""|| EmpNum != "")
                {
                    sql += "AND [Assign_Date] like '%" + stcYear + "%'";
                    sql += "AND [site_ref] like '%" + SiteRef + "%'";
                    sql += "AND [IT_TAG_GROUP] like '%" + IT_TAG_Group + "%'";
                    sql += "AND [IT_TAG] like '%" + IT_TAG + "%'";
                    sql += "AND [EmpNum] like '%" + EmpNum + "%'";
                   
                }
                sql += "ORDER BY [Status] , [site_ref], [EmpNum]";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GETCheckList(string ITTAG_ID)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "SELECT [IT_TAG],[IT_TAG_GROUP],[EmpNum],[Fullname],[Status],[Assign_Date],[site_ref],[Reject_Remark] FROM [dbo].[VW_PMOnline_CheckList]";
                sql += "where ";
                sql += "[IT_TAG] = '" + ITTAG_ID + "'  ";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> HR_Employee(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "SELECT TOP (100) [Emp_Num],[Language],[Emp_Prefix],[Emp_FirstName],[Emp_LastName],[Emp_Level] FROM [HRPortal].[dbo].[TB_HR_Employee] WHERE[Language]='TH'";
                if (search != "")
                {
                    sql += "AND  [Emp_Num] like '" + search + "%' OR [Emp_FirstName] like '" + search + "%' ";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetAssign_Special(string Header_ID)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "SELECT  [ID],[Header_ID],[Type],[Remark] FROM [dbo].[TB_PMOnline_Assign_Special]";

                sql += "WHERE [Header_ID] = '" + Header_ID + "' ";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetReportAssign_Special(string type,string year)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "SELECT [ID],[IT_TAG],[site_ref],[Type],[Remark] FROM [dbo].[VW_PMOnline_Monitoring_Assign_Special_Detail]";

                sql += "WHERE [Type] = '" + type + "' AND YEAR([Assign_Date]) = '" + year + "'  ";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetDashboardDetail(string ITTagGroup,string year,string status)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "SELECT TOP(1000) [ID],[IT_TAG],[IT_TAG_GROUP],[EmpNum],[Name],[Status],[site_ref],[Reject_Remark],[Assign_EmpNum],[Assign_Name],[Assign_Date],[CheckerName] FROM [dbo].[VW_PMOnline_Assign_Summary_Detail]";

                sql += "WHERE  [IT_TAG_GROUP] = '"+ ITTagGroup + "' AND YEAR([Assign_Date]) = '"+ year + "'";
                if(status == "Complete")
                {
                    sql += " AND [Status] = 'Complete'";
                }
                else if(status == "Inprocess")
                {
                    sql += " AND [Status] != 'Complete'";
                }
                sql += " ORDER BY [ID],[Status],[Assign_Date]";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> TB_PMOnline_Assign_IMG(string Header_ID)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "SELECT  [ID],[Header_ID],[Path],[Desc] FROM [dbo].[TB_PMOnline_Assign_IMG]";

                sql += "WHERE [Header_ID] = '" + Header_ID + "' ";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
       
        public List<ArrayList> GetDashboard(string year)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "EXEC [dbo].[SP_PMOnline_Monitoring_Assign_Summary]  '" + year+"'" ;
                

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GetDashboard_SpecialCase(string year)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "[dbo].[SP_PMOnline_Monitoring_Assign_Special] '"+year+"'";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }

        public string SP_PMOnline_Assign_Checker(int ID, string User, string status,string Reject_Remark)
        {
            SqlConnection con = new SqlConnection(conDMZ);
            SqlCommand cmd = new SqlCommand("SP_PMOnline_Assign_Checker", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("User", User);
            cmd.Parameters.AddWithValue("status", status);
            cmd.Parameters.AddWithValue("Reject_Remark", Reject_Remark);
            con.Open();
            //cmd.ExecuteNonQuery();
            string returnData = "";
            using (SqlDataReader rs = cmd.ExecuteReader())
            {
                while (rs.Read())
                {
                    returnData = rs["msg"].ToString();
                }
            }
            con.Close();
            return returnData;
        }
        public string SP_PMOnline_Assign_Checker_Detail(int ID, string Checked, string Remark)
        {
            SqlConnection con = new SqlConnection(conDMZ);
            SqlCommand cmd = new SqlCommand("SP_PMOnline_Assign_Checker_Detail", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Checked", Checked);
            cmd.Parameters.AddWithValue("Remark", Remark);
            con.Open();
            //cmd.ExecuteNonQuery();
            string returnData = "";
            using (SqlDataReader rs = cmd.ExecuteReader())
            {
                while (rs.Read())
                {
                    returnData = rs["Msg"].ToString();
                }
            }
            con.Close();
            return returnData;
        }
        public string SP_PMOnline_Assign_Checker_Special(int ID, int Header_ID, string Type, string Remark,string Username)
        {
            SqlConnection con = new SqlConnection(conDMZ);
            SqlCommand cmd = new SqlCommand("SP_PMOnline_Assign_Checker_Special", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Header_ID", Header_ID);
            cmd.Parameters.AddWithValue("Type", Type);
            cmd.Parameters.AddWithValue("Remark", Remark);
            cmd.Parameters.AddWithValue("Username", Username);
            con.Open();
            //cmd.ExecuteNonQuery();
            string returnData = "";
            using (SqlDataReader rs = cmd.ExecuteReader())
            {
                while (rs.Read())
                {
                    returnData = rs["msg"].ToString();
                }
            }
            con.Close();
            return returnData;
        }
        public string SP_PMOnline_Assign_Checker_IMG(int ID, int Header_ID, string Path, string Desc,string filetype)
        {
            SqlConnection con = new SqlConnection(conDMZ);
            SqlCommand cmd = new SqlCommand("SP_PMOnline_Assign_Checker_IMG", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Header_ID", Header_ID);
            cmd.Parameters.AddWithValue("Path", Path);
            cmd.Parameters.AddWithValue("Desc", Desc);
            cmd.Parameters.AddWithValue("filetype", filetype);
            con.Open();
            //cmd.ExecuteNonQuery();
            string returnData = "";
            using (SqlDataReader rs = cmd.ExecuteReader())
            {
                while (rs.Read())
                {
                    returnData = rs["ID"].ToString();
                }
            }
            con.Close();
            return returnData;
        }

        public List<ArrayList> GetAssign_Detail(string Header_ID)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conDMZ))
            {
                string sql = "EXEC [SP_PMOnline_Assign_Detail_Select] '" + Header_ID + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetData;
        }

        public List<ArrayList> GetChecklistReport_Profile(string ID)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conDMZ))
            {
                string sql = "EXEC [SP_PMOnline_Monitoring_Report_Checklist_Select] '" + ID + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetData;
        }
        public List<ArrayList> GetPermission(string Emp_Num, string Position)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conDMZ))
            {
                string sql = "SELECT [Position],[Cost_Center],[Level],[Emp_Num] FROM [PMOnline].[dbo].[TB_PMOnline_Permission] ";
                sql += "WHERE [Emp_Num] = '" + Emp_Num + "' AND ([Position] = '" + Position + "' OR [Position] = 'Admin')";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetData;
        }
        public List<ArrayList> SP_PMOnline_Monitoring_Checker(int year, string IT_TAG_GROUP)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conDMZ))
            {
                string sql = "EXEC [SP_PMOnline_Monitoring_Checker] '"+ year + "','"+ IT_TAG_GROUP + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_PMOnline_Monitoring_Checker_Deteil(string Empnum, string IT_TAG_GROUP)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conDMZ))
            {
                string sql = "SELECT TOP (1000) [Position],[Cost_Center],[Level],[Emp_Num],[Assign_ID],[Username],[Fullname],[CheckDate],[Status_On_Click]" +
                    ",[IT_TAG],[IT_TAG_GROUP],[EmpNum_Assign],[Status_Assign],[Assign_Date],[site_ref],[Reject_Remark]" +
                    "FROM[PMOnline].[dbo].[VW_PMOnline_Monitoring_Checker_Deteil]" +
                    "WHERE[Emp_Num] = '"+ Empnum + "' AND[IT_TAG_GROUP] = '"+ IT_TAG_GROUP + "' ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetData;
        }
        public List<ArrayList> GetIT_TAG_Group(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conDMZ))
            {
                string sql = "SELECT distinct [Tag_Group] FROM [dbo].[TB_PMOnline_IT_TAG_New]";
                if (search != "")
                {
                    sql += " where [Tag_Group] like '%" + search + "%'";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }

        public DataTable GetExportExcel_Checklist(string Year,string Group)
        {
            string sql = "EXEC [dbo].[SP_PMOnline_Export_IT_TAG_V3] '" + Group + "','"+ Year + "'";

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conDMZ);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }
        public DataTable GetExportExcel_Special(string Year)
        {
            string sql = " EXEC [SP_PMOnline_Export_IT_TAG_Special_V2] '" + Year + "'";

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conDMZ);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }



    }

}