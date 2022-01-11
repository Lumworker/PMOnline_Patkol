using PMOnline.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMOnline
{
    public partial class PMMoniter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void exportTableC_onClick(object sender, EventArgs e)
        {
            String Year = snsstcExportYear.Text;
            String Group = snstxtExportITTagGroup.Text;
            DataTable dt = new DataTable();

            //Get Query
            dt = new ClassBrowseNew().GetExportExcel_Checklist(Year, Group);

            GridView GV = new GridView();
            GV.AllowPaging = false;
            GV.DataSource = dt;
            GV.DataBind();
            if (GV.Rows.Count > 0)
            {
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=PATAG Checklist กรุ๊บ"+ Group + " ปี"+ Year+  " ณ." + DateTime.Now + ".xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                for (int i = 0; i > GV.Rows.Count; i++)
                {
                    GV.Rows[i].Attributes.Add("class", "textmode");
                }
                GV.RenderControl(hw);
                String style = @"<style> .textmode{mso-number-format:\@;}</style>";
                Response.Write(style);
                Response.Output.Write("<html><head><META http-equiv=Content-Type content=text/html; charset=utf-8></head><body><FONT face=Tahoma>" + sw.ToString() + "</FONT></Body></Html>");
                Response.Flush();
                Response.End();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Data')", true);
            }
        }
        protected void exportTableS_onClick(object sender, EventArgs e)
        {
            String Year = snsstcExportYear.Text;
            String Group = snstxtExportITTagGroup.Text;
            DataTable dt = new DataTable();

            //Get Query
            dt = new ClassBrowseNew().GetExportExcel_Special(Year);

            GridView GV = new GridView();
            GV.AllowPaging = false;
            GV.DataSource = dt;
            GV.DataBind();
            if (GV.Rows.Count > 0)
            {
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=PATAG Special กรุ๊บ" + Group + " ปี"+ Year+  " ณ." + DateTime.Now + ".xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                for (int i = 0; i > GV.Rows.Count; i++)
                {
                    GV.Rows[i].Attributes.Add("class", "textmode");
                }
                GV.RenderControl(hw);
                String style = @"<style> .textmode{mso-number-format:\@;}</style>";
                Response.Write(style);
                Response.Output.Write("<html><head><META http-equiv=Content-Type content=text/html; charset=utf-8></head><body><FONT face=Tahoma>" + sw.ToString() + "</FONT></Body></Html>");
                Response.Flush();
                Response.End();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Data')", true);
            }
        }
    }
}