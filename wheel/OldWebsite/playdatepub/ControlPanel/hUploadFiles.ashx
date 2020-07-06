<%@ WebHandler Language="C#" Class="hUploadFiles" %>

using System;
using System.Web;
using System.IO;
using System.Data;
using System.Collections;
using System.Collections.Generic;

public class hUploadFiles : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string path = context.Server.MapPath("~/UploadFiles");

        try
        {

            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);

            if (context.Request.Files.Count > 0)
            {
                for (int i = 0; i < context.Request.Files.Count; i++)
                {
                    HttpPostedFile file = context.Request.Files[i];
                    string fileName;
                    if (HttpContext.Current.Request.Browser.Browser.ToUpper() == "IE")
                    {
                        string[] files = file.FileName.Split(new char[] { '\\' });
                        fileName = files[files.Length - 1];
                    }
                    else
                    {
                        fileName = file.FileName;
                    }
                    string strFileName = fileName;
                    fileName = Path.Combine(path, fileName);
                    file.SaveAs(fileName);
                }

                string msg11 = "{";
                msg11 += string.Format("error:'{0}',\n", string.Empty);
                msg11 += string.Format("msg:'{0}'\n", "Thanks");
                msg11 += "}";
                context.Response.Write(msg11);

            }
        }
        catch (Exception)
        {
            string msg11 = "{";
            msg11 += string.Format("error:'{0}',\n", string.Empty);
            msg11 += string.Format("msg:'{0}'\n", "Error");
            msg11 += "}";
            context.Response.Write(msg11);
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