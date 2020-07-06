using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Linez.Library.WHCS.BAL;

public partial class ControlPanel_UpdateNewsFeeds : System.Web.UI.Page
{
    NewsFeeds objNewsFeeds;
    Users objUser;
    UserType objusertype;


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, ImageClickEventArgs e)
    {
        string[] validFileTypes = { "bmp", "gif", "png", "jpg", "jpeg" };
        string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
        bool isValidFile = false;
        for (int i = 0; i < validFileTypes.Length; i++)
        {
            if (ext == "." + validFileTypes[i])
            {
                isValidFile = true;
                break;
            }
        }
        if (!isValidFile)
        {
            Label4.ForeColor = System.Drawing.Color.Red;
            Label4.Text = "Invalid File. Please upload a File with extension " +
                           string.Join(",", validFileTypes);
            return;
        }
        else
        {
            Label4.Text = ".";
            //Label4.ForeColor = System.Drawing.Color.Green;
            //Label4.Text = "File uploaded successfully.";
        }


        if (Session["iNewsID"] == null)
        {
            objUser = (Users)Session["UserID"];

            idiUserID.Value = objUser.s_IUserID;

            Users objQuery = new Users();
            objQuery.ExecuteSql("select * from NewsFeeds where SNewsTitle = '" + tbTitle.Text + "'");
            if (objQuery.RowCount < 1)
            {
                Guid objGuid = Guid.NewGuid();
                objNewsFeeds = new NewsFeeds();
                objNewsFeeds.AddNew();
                objNewsFeeds.SNewsTitle = tbTitle.Text;
                objNewsFeeds.SImageName = objGuid + FileUpload1.FileName;
                objNewsFeeds.SNewsDescription = tbDescription.Text;
                objNewsFeeds.DtPostingDate = Convert.ToDateTime(txtPostingDate.Text);

                objNewsFeeds.DtCreatedDate = DateTime.Now;
                objNewsFeeds.IAdminCompanyID = Convert.ToInt32(Session["iAdminCompanyID"]);
                objNewsFeeds.IUserID = Convert.ToInt32(objUser.s_IUserID);
                objNewsFeeds.IUserTypeID = Convert.ToInt32(ddlNewsFeeds.SelectedValue);

                objNewsFeeds.Save();
                FileUpload1.SaveAs(Server.MapPath("~/ImageStorage/" + objGuid + FileUpload1.FileName));
                tbTitle.Text = null;
                tbDescription.Text = null;
            }
            else
            {
                tbTitle.Text = null;
                tbDescription.Text = null;
            }
        }
        else
        {
            objNewsFeeds = new NewsFeeds();
            objNewsFeeds.LoadByPrimaryKey(Convert.ToInt32(Session["iNewsID"]));
            objNewsFeeds.SNewsTitle = tbTitle.Text;
            objNewsFeeds.SNewsDescription = tbDescription.Text;
            objNewsFeeds.DtPostingDate = Convert.ToDateTime(txtPostingDate.Text);
            objNewsFeeds.IAdminCompanyID = Convert.ToInt32(Session["iAdminCompanyID"]);

            if (FileUpload1.HasFile)
            {
                Guid objGuid = Guid.NewGuid();
                objNewsFeeds.SImageName = objGuid + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/ImageStorage/" + objGuid + FileUpload1.FileName));
            }

            objNewsFeeds.Save();
            tbTitle.Text = null;
            tbDescription.Text = null;
            Session["iNewsID"] = null;
            RequiredFieldValidator3.Enabled = true;
        }
    }
    protected void btnReset_Click(object sender, ImageClickEventArgs e)
    {

    }



    protected void showDocumentList()
    {
        objNewsFeeds = new NewsFeeds();
        objNewsFeeds.LoadAll();
        lstDocuments.Items.Clear();
        lstDocuments.DataSource = objNewsFeeds.DefaultView;
        lstDocuments.DataBind();
    }

    protected void lstDocuments_PreRender(object sender, EventArgs e)
    {
        showDocumentList();
    }
    protected void lstDocuments_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("deleteDocument"))
        {
            objNewsFeeds = new NewsFeeds();
            objNewsFeeds.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));

            if (objNewsFeeds.RowCount > 0)
            {
                objNewsFeeds.MarkAsDeleted();
                objNewsFeeds.Save();
                showDocumentList();
            }
        }
        else if (e.CommandName.Equals("editDocument"))
        {
            Session["iNewsID"] = e.CommandArgument.ToString();
            objNewsFeeds = new NewsFeeds();
            objNewsFeeds.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));

            if (objNewsFeeds.RowCount > 0)
            {
                ddlNewsFeeds.SelectedValue = objNewsFeeds.s_IUserTypeID;
                tbTitle.Text = objNewsFeeds.SNewsTitle;
                tbDescription.Text = objNewsFeeds.SNewsDescription;
                txtPostingDate.Text = objNewsFeeds.DtPostingDate.ToString("MM/dd/yyyy");

                if (objNewsFeeds.s_SImageName != "")
                {
                    imgEventImage.ImageUrl = "../ImageStorage/" + objNewsFeeds.s_SImageName;
                }
                else
                {
                    imgEventImage.ImageUrl = "#";
                }

                RequiredFieldValidator3.Enabled = false;
            }
        }
    }
    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        ddlNewsFeeds.SelectedIndex = 0;
        txtPostingDate.Text = "";
        imgEventImage.ImageUrl = "#";
        tbTitle.Text = "";
        tbDescription.Text = "";
        Session["iNewsID"] = null;
        RequiredFieldValidator3.Enabled = true;
    }
}