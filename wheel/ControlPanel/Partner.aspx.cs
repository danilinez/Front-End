using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Linez.Library.WHCS.BAL;
using System.IO;

public partial class ControlPanel_Partner : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (IsPostBack)
        //{
        //    SaveBanner();
        //}
        if (!IsPostBack)
            fnLoadPartner();
    }

    private void fnLoadPartner()
    {
        Users objuser = new Users();
        objuser.ExecuteSql("select iPartnerID,isnull(sPartnerName,'')sPartnerName,isnull(sPartnerDescription,'')sPartnerDescription,isnull(sImageLink,'')sImageLink ,isnull(sEmail,'')sEmail,isnull(sWebsite,'')sWebsite,isnull(sLocation,'')sLocation,isnull(btIsActive,((1)))btIsActive  from Partner    ");

        lstPartner.Items.Clear();
        lstPartner.DataSource = objuser.DefaultView;
        lstPartner.DataBind();
    }


    protected void dtpPartner_PreRender(object sender, EventArgs e)
    {
        fnLoadPartner();
    }


    protected void SaveBanner()
    {
        String sFileName = FileUpload1.FileName;

        Partner objPartner = new Partner();
        objPartner.Where.SImageLink.Value = sFileName;
        objPartner.Query.Load();
        if (objPartner.RowCount > 0)
        {
            Guid objGuid = Guid.NewGuid();
            sFileName = objGuid + sFileName;
            objPartner.SImageLink = sFileName;
            if (objPartner.SImageOldLink != "")
            {
                try
                {
                    string sOldImagePath = objPartner.SImageOldLink.ToString();
                    File.Delete(Server.MapPath("~/UploadedFiles/" + sOldImagePath));
                    objPartner.SImageOldLink = "";
                }
                catch (Exception e)
                { }

            }
            objPartner.Save();

            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/UploadedFiles/" + sFileName));
        }
    }
    protected void btnCallUpload_Click(object sender, EventArgs e)
    {
        SaveBanner();
        fnLoadPartner();
    }
}