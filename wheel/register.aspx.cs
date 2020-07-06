using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Linez.Library.WHCS.BAL;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblNameType.Text = Request.QueryString["type"].ToString();
            //lblUserType2.Text = Request.QueryString["type"].ToString();
        }
        catch (Exception ex)
        { }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (chkRememberMe.Checked)
        {
            lblAgreeTerms.Text = "";
            string sAdminSubject = "New User Registered as ";
            Users obusers = new Users();
            Users obusers1 = new Users();
            obusers1.Where.SEmail.Value = txtemail.Value;
            obusers1.Where.SPassword.Value = txtpassword.Value;
            obusers1.Where.SName.Value = txtname.Value;
            obusers1.Query.Load();
            if (obusers1.RowCount > 0)
            {
                lblExist.Text = "* User Name or Email is already Exist or may not active.";
                //Page.Response.Redirect(Page.Request.Url.ToString(), true);
                //Response.End();
                return;
            }

            Contacts objContact = new Contacts();

            objContact.Where.SEmail.Value = txtemail.Value;
            objContact.Query.Load();
            if (objContact.RowCount > 0)
            {

                if (objContact.IUserTypeID == 2)
                {
                    lblExist.Text = "* Email is already Exist or may not active.";
                    //Response.Redirect("register.aspx?type=Doctor", false);
                    //Response.End();
                    return;
                }
                if (objContact.IUserTypeID == 3)
                {
                    lblExist.Text = "* User Name or Email is Already Exist ";
                    //Response.Redirect("register.aspx?type=Pharmacist", false);
                    //Response.End();
                    return;
                }

                if (objContact.IUserTypeID == 4)
                {
                    lblExist.Text = "User Name or Email is Already Exist ";
                    Response.Redirect("register.aspx?type=Patient", false);
                    Response.End();
                    return;
                }

            }

            if (objContact.RowCount == 0)
            {
                objContact.AddNew();
                objContact.s_SFirstName = txtname.Value;
                objContact.s_SLastName = txtLastName.Value;
                //objContact.s_SUserName = txtUserName.Value;
                objContact.s_SPassword = txtpassword.Value;
                objContact.DtDateOfBirth = Convert.ToDateTime(txtDOB.Value);
                objContact.s_SPhone = txtPhone.Text;
                objContact.s_SPostcode = txtPostCode.Value;
                objContact.s_SAddress = txtAddress.Value;
                objContact.s_SCountry = txtCountry.Value;
                objContact.s_SEmail = txtemail.Value;
                objContact.DtCreatedDate = System.DateTime.Now;
                objContact.IAdminCompanyID = 1;
                objContact.BtIsActive = false;

                if (Request.QueryString["Type"] == "Patient")
                {
                    objContact.IUserTypeID = 4;
                    sAdminSubject += "Patient";
                }

                if (Request.QueryString["Type"] == "Doctor")
                {
                    objContact.IUserTypeID = 2;
                    sAdminSubject += "Doctor";
                }
                if (Request.QueryString["Type"] == "Pharmacists")
                {
                    objContact.IUserTypeID = 3;
                    sAdminSubject += "Pharmacists";
                }



                if (ChkMale.Checked)
                {
                    objContact.s_SGender = "Male";
                }


                if (ChkFemale.Checked)
                {
                    objContact.s_SGender = "FeMale";
                }
                objContact.Save();
            }

            if (obusers.RowCount == 0)
            {
                obusers.AddNew();
                obusers.s_SName = txtname.Value;
                obusers.s_SEmail = txtemail.Value;
                obusers.s_SPassword = txtpassword.Value;
                obusers.IAdminCompanyID = 1;

                obusers.s_SUserName = txtname.Value;
                obusers.DtCreatedDate = System.DateTime.Now;
                if (Request.QueryString["Type"] == "Patient")
                {
                    obusers.IUserTypeID = 4;
                }

                if (Request.QueryString["Type"] == "Doctor")
                {
                    obusers.IUserTypeID = 2;
                }
                if (Request.QueryString["Type"] == "Pharmacists")
                {
                    obusers.IUserTypeID = 3;
                }


                obusers.BtIsActive = false;


                Guid objNewGUID = Guid.NewGuid();

                obusers.s_SUserGUID = objNewGUID.ToString();

                obusers.Save();

                objContact.IUserID = obusers.IUserID;
                objContact.Save();



                #region Send Email Region

                Emailing objAdminEmail = new Emailing();

                string sAdminMessage = "Hi Administrator WheelHC,";
                sAdminMessage += "<br/>New Account created with these details;";
                sAdminMessage += "<br/>Name : " + objContact.s_SFirstName + " " + objContact.s_SLastName + ",<br/>";
                sAdminMessage += "<br/>Email : " + objContact.s_SEmail + ",<br/>";
                sAdminMessage += "<br/>Phone : " + objContact.s_SPhone + ",<br/>";
                sAdminMessage += "<br/>Postcode : " + objContact.s_SPostcode + ",<br/>";
                sAdminMessage += "<br/>Address : " + objContact.s_SAddress + ",<br/>";
                sAdminMessage += "<br/>Country : " + objContact.s_SCountry + ",<br/>";

                try
                {
                    if (objAdminEmail.sendEMAIL("info@wheelhc.com", "wheelhc1@gmail.com", "", "", sAdminSubject, sAdminMessage))
                    {
                        lblMessage.Text = "Registration Is Completed";

                        Response.Redirect("ThankYou.html", false);
                        Response.End();
                    }
                }
                catch (Exception)
                {
                    lblMessage.Text = "Registration Is Completed";

                    Response.Redirect("ThankYou.html", false);
                    Response.End();
                }



                /*Emailing objEmail = new Emailing();

                string sSubject = "To whome it may concern, Account Activation on Wheel Healthcare Services Inc";

                string sMessage = "Hi " + obusers.s_SName + ",";
                sMessage += "<br/>Your account is created on Wheel Healthcare Services Portal, Please click on the link below to complete activation process. http://www.wheelhc.com/completeregisteration.html?user=" + obusers.s_SUserGUID + "&activate=1";
                sMessage += "<br/>Thanks,<br/>Admin";

                if (objEmail.sendEMAIL("info@wheelhc.com", obusers.s_SEmail, "", "", sSubject, sMessage))
                {
                    ResetField();
                    try
                    {
                        Emailing objAdminEmail = new Emailing();

                        string sAdminMessage = "Hi Administrator WheelHC,";
                        sAdminMessage += "<br/>New Account created with these details;";
                        sAdminMessage += "<br/>Name : " + objContact.s_SFirstName + " " + objContact.s_SLastName + ",<br/>";
                        sAdminMessage += "<br/>Email : " + objContact.s_SEmail + ",<br/>";
                        sAdminMessage += "<br/>Phone : " + objContact.s_SPhone + ",<br/>";
                        sAdminMessage += "<br/>Postcode : " + objContact.s_SPostcode + ",<br/>";
                        sAdminMessage += "<br/>Address : " + objContact.s_SAddress + ",<br/>";
                        sAdminMessage += "<br/>Country : " + objContact.s_SCountry + ",<br/>";

                        objAdminEmail.sendEMAIL("info@wheelhc.com", "wheelhc1@gmail.com", "", "", sAdminSubject, sAdminMessage);
                    }
                    catch (Exception)
                    {

                    }


                    System.Threading.Thread.Sleep(3000);
                    Response.Redirect("ThankYou.html", false);
                    Response.End();
                }*/
                #endregion


            }


        }
        else
        {
            lblAgreeTerms.Text = "* Can not proceed if you are not agree with terms & conditions";
        }
    }

    public void ResetField()
    {
        txtname.Value = "";
        txtemail.Value = "";
        txtpassword.Value = "";
        txtAddress.Value = "";
        txtCountry.Value = "";
        txtLastName.Value = "";
        txtPhone.Text = "";
        txtPostCode.Value = "";
        //txtUserName.Value = "";
        ChkFemale.Checked = false;
        chkRememberMe.Checked = false;
        //lblExist.Visible = false;

    }

}