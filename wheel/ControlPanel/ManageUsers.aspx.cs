using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Linez.Library.WHCS.BAL;
using Linez.Library.WHCS.SecurityManager;

public partial class ControlPanel_ManageUsers : ControlPanelSessionManager
{
    Users objUser;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null && Session["iAdminCompanyID"] != null)
        {
            if (!IsPostBack)
            {
                hfAdminCompanyID.Value = Session["iAdminCompanyID"].ToString();

                //objUser = (Users)Session["UserID"];

                //hfUserID.Value = objUser.s_IUserID;
                fnLoadDropDown();
            }
        }
        else
            Response.Redirect("~/LogOut.aspx", false);

        return;
    }

    private void fnLoadDropDown()
    {
        LinezWS_WHCS objWS = new LinezWS_WHCS();
        CommonMethods.FillDropDownList(ddlCompanyTypes, objWS.fnLoadCompanyTypes(Session["iAdminCompanyID"].ToString()).DefaultView, "sTypeName", "iCompanyTypeID");

        Users objQuery = new Users();
        objQuery.ExecuteSql("select IUserTypeID,STypeName from UserType where iUserTypeID<>1");
        CommonMethods.FillDropDownList(ddlUserTypes, objQuery.DefaultView, UserType.ColumnNames.STypeName, UserType.ColumnNames.IUserTypeID);
        if (ddlUserTypes.Items.Count > 0)
            ddlUserTypes.Items.RemoveAt(0);
    }

    private void fnLoadUsers()
    {
        LinezWS_WHCS objWS = new LinezWS_WHCS();
        lstUsers.DataSource = objWS.fnLoadUsers(Session["iAdminCompanyID"].ToString());
        lstUsers.DataBind();
    }

    protected void btnSaveDetails_Click(object sender, EventArgs e)
    {
        objUser = new Users();
        Contacts objContacts = new Contacts();

        if (hfUserID.Value == "")
        {
            objUser.AddNew();
            objContacts.AddNew();
            objUser.BtIsActive = true;
            objUser.DtCreatedDate = System.DateTime.Now;
            objContacts.DtCreatedDate = System.DateTime.Now;
            objContacts.BtIsActive = true;
        }
        else if (hfUserID.Value != "")
        {
            objUser.LoadByPrimaryKey(Convert.ToInt32(hfUserID.Value));
            Contacts objTmpCont = new Contacts();
            objTmpCont.Where.IUserID.Value = objUser.IUserID;
            objTmpCont.Query.Load();
            if (objTmpCont.RowCount == 1)
            {
                objContacts.LoadByPrimaryKey(objTmpCont.IContactID);

            }
            else
            {
                objContacts.AddNew();
                objContacts.DtCreatedDate = System.DateTime.Now;
                objContacts.BtIsActive = true;
            }
        }

        objUser.s_SUserName = txtUserName.Value;
        objUser.s_SPassword = txtPassword.Value;
        objUser.s_SName = txtFullName.Value;
        objUser.s_SEmail = txtEmail.Value;
        objUser.BtIsActive = chkbActive.Checked;
        objUser.s_IUserTypeID = ddlUserTypes.SelectedValue.ToString();
        objUser.s_IAdminCompanyID = Session["iAdminCompanyID"].ToString();

        objUser.Save();

        // Save Contact Details

        objContacts.IUserID = objUser.IUserID;

        string[] strFNLN = txtFullName.Value.Split(' ');
        if (strFNLN.Length > 1)
        {
            objContacts.SFirstName = strFNLN[0];
            int i = 0;
            foreach (string sName in strFNLN)
            {
                ++i;
                try
                {
                    if (strFNLN[i] != "")
                        objContacts.SLastName = strFNLN[i];
                }
                catch (Exception ex)
                { }
            }
        }
        else
        {
            objContacts.SFirstName = txtFullName.Value;
        }

        objContacts.s_SEmail = txtEmail.Value;
        objContacts.s_SUserName = txtUserName.Value;
        objContacts.s_SPassword = txtPassword.Value;
        objContacts.s_SPostcode = txtPostCode.Value;

        objContacts.s_SGender = "Male";
        objContacts.BtIsActive = chkbActive.Checked;
        objContacts.IAdminCompanyID = objUser.IAdminCompanyID;
        objContacts.s_ICompanyID = hfUserTypeID.Value;
        objContacts.s_IUserTypeID = ddlUserTypes.SelectedValue.ToString();

        objContacts.Save();

        dtpUsers_PreRender(new object(), new EventArgs());

    }
    protected void dtpUsers_PreRender(object sender, EventArgs e)
    {
        fnLoadUsers();
    }
}