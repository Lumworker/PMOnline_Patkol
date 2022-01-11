using PMOnline.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMOnline
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static List<ArrayList> Signin(string username, string password)
        {
            return new ClassBrowseNew().Signin(username, password);
        }
        [WebMethod]
        public static List<ArrayList> Check_Approve_Reject(string username, string password)
        {
            return new ClassBrowseNew().Check_Approve_Reject(username, password);
        }

        [WebMethod]
        public static List<ArrayList> GetSite_ref()
        {
            return new ClassBrowseNew().GetSite_ref();
        }
        [WebMethod]
        public static List<ArrayList> IT_TAG_Assign_Report(string site_ref, string IT_TAG, string EmpNum,string Status)
        {
            return new ClassBrowseNew().IT_TAG_Assign_Report(site_ref, IT_TAG, EmpNum, Status);
        }
        [WebMethod] 
        public static List<ArrayList> IT_TAG_Assign_ListReport(string stcYear, string SiteRef, string IT_TAG_Group, string IT_TAG, string EmpNum)
        {
            return new ClassBrowseNew().IT_TAG_Assign_ListReport( stcYear,  SiteRef,  IT_TAG_Group,  IT_TAG,  EmpNum);
        }
        [WebMethod]
        public static List<ArrayList> HR_Employee(string search)
        {
            return new ClassBrowseNew().HR_Employee(search);
        }
        [WebMethod]
        public static List<ArrayList> GetAssign_Detail(string Header_ID)
        {
            return new ClassBrowseNew().GetAssign_Detail(Header_ID);
        }
        [WebMethod]
        public static List<ArrayList> GetChecklistReport_Profile(string ID)
        {
            return new ClassBrowseNew().GetChecklistReport_Profile(ID);
        }
        [WebMethod]
        public static List<ArrayList> GETCheckList(string ITTAG_ID)
        {
            return new ClassBrowseNew().GETCheckList(ITTAG_ID);
        }
        [WebMethod]
        public static List<ArrayList> GETIT_TAG(string search)
        {
            return new ClassBrowseNew().GETIT_TAG(search);
        }
        [WebMethod]
        public static List<ArrayList> GETSearchAssign(string search)
        {
            return new ClassBrowseNew().GETSearchAssign(search);
        }
        [WebMethod]
        public static List<ArrayList> GetReportAssign_Special(string type,string year)
        {
            return new ClassBrowseNew().GetReportAssign_Special(type, year);
        }
        [WebMethod]
        public static List<ArrayList> GetIT_TAG_Group(string search)
        {
            return new ClassBrowseNew().GetIT_TAG_Group(search);
        }
        [WebMethod]
        public static List<ArrayList> GetAssign_Special(string Header_ID)
        {
            return new ClassBrowseNew().GetAssign_Special(Header_ID);
        }
        [WebMethod]
        public static List<ArrayList> TB_PMOnline_Assign_IMG(string Header_ID)
        {
            return new ClassBrowseNew().TB_PMOnline_Assign_IMG(Header_ID);
        }
        [WebMethod]
        public static List<ArrayList> GetDashboard(string year)
        {
            return new ClassBrowseNew().GetDashboard(year);
        }
        [WebMethod]
        public static List<ArrayList> GetDashboardDetail(string ITTagGroup,string year,string status)
        {
            return new ClassBrowseNew().GetDashboardDetail(ITTagGroup,year, status);
        }
        [WebMethod]
        public static List<ArrayList> GetDashboard_SpecialCase(string year)
        {
            return new ClassBrowseNew().GetDashboard_SpecialCase(year);
        }
        [WebMethod]
        public static string SP_PMOnline_Assign_Checker(int ID, string User, string status,string Reject_Remark)
        {
            return new ClassBrowseNew().SP_PMOnline_Assign_Checker(ID, User, status, Reject_Remark);
        }
        [WebMethod]
        public static string SP_PMOnline_Assign_Checker_Special(int ID, int Header_ID, string Type, string Remark,string Username)
        {
            return new ClassBrowseNew().SP_PMOnline_Assign_Checker_Special(ID, Header_ID, Type, Remark, Username);
        }
        [WebMethod]
        public static string SP_PMOnline_Assign_Checker_Detail(int ID, string Checked, string Remark)
        {
            return new ClassBrowseNew().SP_PMOnline_Assign_Checker_Detail(ID, Checked, Remark);
        }
        [WebMethod]
        public static string SP_PMOnline_Assign_Checker_IMG(int ID, int Header_ID, string Path, string Desc,string filetype)
        {
            return new ClassBrowseNew().SP_PMOnline_Assign_Checker_IMG(ID, Header_ID, Path, Desc, filetype);
        }
        
        [WebMethod]
        public static List<ArrayList> GetPermission(string Emp_Num, string Position)
        {
            return new ClassBrowseNew().GetPermission(Emp_Num, Position);
        }
        [WebMethod]
        public static List<ArrayList> VW_PMOnline_Monitoring_Checker_Deteil(string Empnum, string IT_TAG_GROUP)
        {
            return new ClassBrowseNew().VW_PMOnline_Monitoring_Checker_Deteil(Empnum, IT_TAG_GROUP);
        }
        [WebMethod]
        public static List<ArrayList> SP_PMOnline_Monitoring_Checker(int year, string IT_TAG_GROUP)
        {
            return new ClassBrowseNew().SP_PMOnline_Monitoring_Checker(year, IT_TAG_GROUP);
        }
    }

}