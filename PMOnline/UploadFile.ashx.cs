using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace PMOnline
{
    /// <summary>
    /// Summary description for UploadFile
    /// </summary>
    public class UploadFile : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            try
            {
                //string floderName = context.Request.Form["floderName"];
                //string filePath = "\\\\patkoldevelop.patkol.com\\PMOnline\\" + context.Request.Form["folderName"] + "\\" + context.Request.Form["Emp_Num"];
                string webRootPath = context.Server.MapPath("~");
                string filePath = Path.GetFullPath(Path.Combine(webRootPath, "../PMOnline_Attach/" + context.Request.Form["folderName"]));
                if (!Directory.Exists(filePath)) { Directory.CreateDirectory(filePath); }

                string str_image = "";
                HttpPostedFile file = context.Request.Files["file"];
                string MasterfileName = file.FileName;
                string NewfileName = context.Request.Form["imageid"];
                //string fileExtension = file.ContentType;
                string fileExtension = Path.GetExtension(MasterfileName);

                if (!string.IsNullOrEmpty(NewfileName))
                {
                    str_image = NewfileName + fileExtension;
                    string pathToSave_100 = filePath + "\\" + str_image;
                    file.SaveAs(pathToSave_100);
                }
                context.Response.Write(str_image);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}