using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Linez.Library.WHCS.BAL;

public partial class LoginAuthentication : System.Web.UI.Page
{
    Users objUsers;
    Contacts objContacts;
    protected void Page_Load(object sender, EventArgs e)
    {
        objUsers = new Users();
        objContacts = new Contacts();

        //objUsers.Where.SUserName.Value = txtUserName.Text;
        //objUsers.Where.SPassword.Value = txtPassword.Text;

        try
        {
            objUsers.Where.SEmail.Value = Request.Form["username"].ToString();
            objUsers.Where.SPassword.Value = Request.Form["password"].ToString();
        }
        catch (Exception ex)
        {

        }
        objUsers.Where.BtIsActive.Value = true;
        //objUsers.Where.IUserTypeID.Value = 1;// for Admin

        objUsers.Query.Load();

        if (objUsers.RowCount > 0)
        {
            //////if (objUsers.IUserTypeID == 1 && objUsers.IUserTypeID < 2)
            //////{
            //////    Session["UserID"] = objUsers;
            //////    Session["iAdminCompanyID"] = objUsers.s_IAdminCompanyID;
            //////    Response.Redirect("Home.aspx", false);
            //////}
            //////else 
            if (objUsers.IUserTypeID == 2)
            {
                Session["UserID"] = objUsers;
                Session["iAdminCompanyID"] = objUsers.s_IAdminCompanyID;

                objContacts.Where.IUserID.Value = objUsers.IUserID;
                //objContacts.Query.AddResultColumn(Contacts.ColumnNames.IContactID);

                objContacts.Query.Load();

                if (objContacts.RowCount == 1)
                {
                    Session["iContactID"] = objContacts.IContactID;
                    Session["sPostcode"] = objContacts.SPostcode;
                }
                Response.Redirect("UserPanels/DoctorDashboard.aspx", false);
            }
            else if (objUsers.IUserTypeID == 3)
            {
                Session["UserID"] = objUsers;

                objContacts.Where.IUserID.Value = objUsers.IUserID;


                objContacts.Query.Load();

                objContacts.LoadByPrimaryKey(objContacts.IContactID);
                Session["UserID"] = objUsers;
                Session["iAdminCompanyID"] = objUsers.s_IAdminCompanyID;
                Session["iContactID"] = objContacts.IContactID;
                Session["sPostcode"] = objContacts.SPostcode;

                //Session["sPostcode"] = Session["profilePostCode"];
                Response.Redirect("UserPanels/PharmasistDashBoard.aspx", false);

            }
            else if (objUsers.IUserTypeID == 4)
            {
                objContacts.Where.IUserID.Value = objUsers.IUserID;
                //objContacts.Query.AddResultColumn(Contacts.ColumnNames.IContactID);

                objContacts.Query.Load();

                objContacts.LoadByPrimaryKey(objContacts.IContactID);
                Session["UserID"] = objUsers;
                Session["iAdminCompanyID"] = objUsers.s_IAdminCompanyID;
                Session["iContactID"] = objContacts.IContactID;
                Session["sPostcode"] = objContacts.SPostcode;

                //Session["sPostcode"] = Session["profilePostCode"];
                Response.Redirect("UserPanels/PatientDashBoard.aspx", false);
            }
        }
    }
}