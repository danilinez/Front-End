using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Linez.Library.WHCS.BAL;

public partial class UserPanels_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fnLoadDropDowns();
        }

    }

    private void fnLoadDropDowns()
    {
        Users objQuery = new Users();
        objQuery.ExecuteSql("select iContactID, isNull(sFirstName,'') +' '+ isNull(sLastName,'') as sName from Contacts where iUserTypeID = 2 and iAdminCompanyID = " + Session["iAdminCompanyID"].ToString() + "");

        CommonMethods.FillDropDownList(ddlDoctorName, objQuery.DefaultView, "sName", "iContactID");




        objQuery.ExecuteSql("select iContactID, isNull(sFirstName,'') +' '+ isNull(sLastName,'') as sName from Contacts where iUserTypeID = 4 and iAdminCompanyID = " + Session["iAdminCompanyID"].ToString() + "");

        CommonMethods.FillDropDownList(ddlPatients, objQuery.DefaultView, "sName", "iContactID");
        // string strQuery2 = "select iAppointmentID,isNull(t1.dtAppointmentDate,'')+', '+ isNull(t1.sTimeFrom,'')+', '+isNull(t1.sLocationName,'') AS sAppointmentDetail from (select iAppointmentID ,CONVERT(VARCHAR(12), dtAppointmentDate, 113) as dtAppointmentDate ,sTimeFrom ,(Case when 1=1 then (select  sLocationName from LinkedVenue where iVenueID = objDoc.iVenueID  )Else '' END) as sLocationName from  ExpertAppointments objDoc where iAdminCompanyID=" + Session["iAdminCompanyID"].ToString() + "  and cast(dtAppointmentDate as DATE) >= CAST(GETDATE() as Date)) as t1 where not EXISTS(select * from Cases where iAppointmentID=t1.iAppointmentID)";

    }
    private void fnLoadCases()
    {
        Users objQuery = new Users();
        string strQuery = "select * from (select iCaseID,sCaseRefNo,CONVERT(VARCHAR(12), dtCaseDate, 113) as dtCaseDate	,sCaseStatus,sCaseDiscription,CONVERT(VARCHAR(12), dtCreatedDate, 113) as dtCreatedDate  ,(Case when 1=1 then (select top 1 sFirstName from Contacts where iContactID = objProd.iPatientID) Else '' END) as sPatientName,(Case when 1=1 then (select top 1 sFirstName from Contacts where iContactID =objProd.iExpretID) Else '' END) as sDoctorName ,(Case when 1=1 then (select top 1 sLocationName from LinkedVenue LV where EXISTS(select * from ExpertAppointments where iAppointmentID =objProd.iAppointmentID AND iVenueID=LV.iVenueID)) Else '' END)as sLocationName  from  Cases objProd where iAdminCompanyID =" + Session["iAdminCompanyID"].ToString() + "and iExpretID=" + Session["iContactID"].ToString() + ") as t1 ";

        bool isWhereExists = false;

        if (txtCaseRef.Text != "")
        {
            if (!isWhereExists)
            {
                strQuery += " where t1.sCaseRefNo Like '%" + txtCaseRef.Text + "%'";
                isWhereExists = true;
            }//WHCS-01
            else
                strQuery += " and t1.sCaseRefNo Like '%" + txtCaseRef.Text + "%'";      //WHCS-01
        }

        if (txtDocName.Text != "")
        {
            if (!isWhereExists)
            {
                strQuery += " where  t1.sDoctorName Like '%" + txtDocName.Text + "%'"; isWhereExists = true;
            }//Dr. Akbar
            else
                strQuery += " and  t1.sDoctorName Like '%" + txtDocName.Text + "%'";                  //Dr. Akbar

        }
        if (txtCaseDate.Text != "")
        {
            if (!isWhereExists)
            {
                strQuery += " where  cast(t1.dtCaseDate as date)= Cast('" + txtCaseDate.Text + "' as date)"; isWhereExists = true;
            }//27 Mar 2013
            else
                strQuery += " and  cast(t1.dtCaseDate as date)= Cast('" + txtCaseDate.Text + "' as date)";       //27 Mar 2013
        }
        if (txtLocationName.Text != "")
        {
            if (!isWhereExists)
            {
                strQuery += " where  t1.sLocationName Like '%" + txtLocationName.Text + "%'"; isWhereExists = true;
            }// 75 The Mall
            else
                strQuery += " and  t1.sLocationName Like '%" + txtLocationName.Text + "%'";    // 75 The Mall
        }
        objQuery.ExecuteSql(strQuery);




        lstCase.Items.Clear();
        lstCase.DataSource = objQuery.DefaultView;
        lstCase.DataBind();
    }


    protected void dtpCase_PreRender(object sender, EventArgs e)
    {
        fnLoadCases();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }

    protected void btnAddNewCase_Click(object sender, EventArgs e)
    {
        ModalPopupExtender3.TargetControlID = "btnPopUP";
        ModalPopupExtender3.Show();
        ModalPopupExtender3.CancelControlID = "btnCancelBooking";
    }

    protected void lstCase_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "EditCase")
        {
            Session["CaseID"] = e.CommandArgument.ToString();
            Response.Redirect("ManageCase.aspx", true);
            Response.End();
        }
        if (e.CommandName == "ViewCase")
        {
            Session["CaseID"] = e.CommandArgument.ToString();
            Response.Redirect("ManageCase.aspx", true);
            Response.End();
        }
        if (e.CommandName == "DeleteCase")
        {

        }
    }
    protected void btnAddNewCase_Click1(object sender, EventArgs e)
    {

    }
    protected void btnCancelBooking_Click(object sender, EventArgs e)
    {


        ModalPopupExtender3.CancelControlID = "btnCancelBooking";
        ModalPopupExtender3.Hide();
        ModalPopupExtender3.TargetControlID = "HyperLink1";
    }

    protected void btnBookCase_Click(object sender, EventArgs e)
    {
        Users objQuery = new Users();
        objQuery.ExecuteSql("select * from Cases where iAdminCompanyID = " + Session["iAdminCompanyID"].ToString() + " and sCaseRefNo = '" + txtCaseRefNo.Text + "' ");

        if (objQuery.RowCount > 0)
        {
            lblCaseBookingError.Text = "* Case Reference already Exists!";
            lblCaseBookingError.Visible = true;
            ModalPopupExtender3.Show();
            return;
        }

        try
        {
            Contacts objPatient = new Contacts();
            // Contacts objDoctor = new Contacts();

            objPatient.LoadByPrimaryKey(Convert.ToInt32(ddlPatients.SelectedValue));

            if (objPatient.RowCount > 0)
            {
                objPatient.s_SFirstName = txtPatientFirstName.Text;
                objPatient.s_SLastName = txtPatientLastName.Text;
                objPatient.s_SGender = ddlPatientGender.SelectedValue.ToString();

                if (txtPatientDOB.Text != "")
                    objPatient.DtDateOfBirth = Convert.ToDateTime(txtPatientDOB.Text);


                objPatient.s_SAddress = txtPatientAddress.Text;
                objPatient.s_SPostcode = txtPatientPostCode.Text;
                objPatient.s_SPhone = txtPatientPhone.Text;

                if (txtPatientEmail.Text != "")
                    objPatient.s_SEmail = txtPatientEmail.Text;

                objPatient.Save();


                Users objCreatedByUser = (Users)Session["UserID"];

                ExpertAppointments objExpertAppointment = new ExpertAppointments();
                objExpertAppointment.LoadByPrimaryKey(Convert.ToInt32(ddlAppointmentDetail.SelectedValue));


                Cases objCases = new Cases();
                objCases.AddNew();

                objCases.IPatientID = objPatient.IContactID;
                objCases.s_IAppointmentID = ddlAppointmentDetail.SelectedValue.ToString();
                objCases.s_IAdminCompanyID = Session["iAdminCompanyID"].ToString();
                objCases.s_IUserIDCreatedBy = objCreatedByUser.s_IUserID;
                objCases.s_IExpretID = ddlDoctorName.SelectedValue.ToString();
                objCases.s_SCaseDiscription = txtCaseDescription.Text;
                objCases.DtCreatedDate = System.DateTime.Now;
                objCases.s_SCaseStatus = ddlCaseStatus.SelectedValue.ToString();
                objCases.DtCaseDate = Convert.ToDateTime(txtCaseDate.Text);

                objCases.IVenueID = objExpertAppointment.IVenueID;
                objCases.s_SBillingAddress = objPatient.s_SAddress;
                objCases.s_SBillingPostCode = objPatient.s_SPostcode;
                objCases.s_SBillingCountry = objPatient.s_SCountry;
                objCases.s_SBillingPhone = objPatient.s_SPhone;
                objCases.s_SBillingEmail = objPatient.s_SEmail;
                objCases.s_SCaseRefNo = txtCaseRefNo.Text;

                objCases.Save();


                Session["CaseID"] = objCases.s_ICaseID;
                Response.Redirect("ManageCase.aspx", true);
                Response.End();

            }
        }
        catch (Exception exc)
        {

        }

    }
    protected void ddlPatients_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Contacts objContacts = new Contacts();
            objContacts.LoadByPrimaryKey(Convert.ToInt32(ddlPatients.SelectedValue));

            if (objContacts.RowCount > 0)
            {
                txtPatientFirstName.Text = objContacts.s_SFirstName;
                txtPatientLastName.Text = objContacts.s_SLastName;
                txtPatientEmail.Text = objContacts.s_SEmail;
                txtPatientPhone.Text = objContacts.s_SPhone;
                if (objContacts.s_SGender != "")
                    ddlPatientGender.SelectedIndex = 0;
                else
                    ddlPatientGender.SelectedValue = objContacts.s_SGender;

                txtPatientPostCode.Text = objContacts.s_SPostcode;
                if (objContacts.s_DtDateOfBirth != "")
                    txtPatientDOB.Text = objContacts.DtDateOfBirth.ToShortDateString();
                txtPatientAddress.Text = objContacts.s_SAddress;
            }
            else
            {
                txtPatientAddress.Text = "";
                txtPatientDOB.Text = "";
                txtPatientEmail.Text = "";
                txtPatientFirstName.Text = "";
                txtPatientLastName.Text = "";
                txtPatientPhone.Text = "";
                txtPatientPostCode.Text = "";
            }

            ModalPopupExtender3.Show();
        }
        catch (Exception)
        {

        }


    }

    protected void ddlCaseStatus_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlPatientGender_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlAppointmentDetail_SelectedIndexChanged(object sender, EventArgs e)
    {

        Users objQuery = new Users();
        string strQuery2 = " select t1.iAppointmentID,'Appointment on '+isNull(t1.dtAppointmentDate,'')+' at '+ isNull(t1.sTimeFrom,'')+' to '+ isNull(t1.sTimeTo,'') +' on location, '+isNull(t1.sLocationName,'') AS sAppointmentDetail from (select iAppointmentID ,CONVERT(VARCHAR(12), dtAppointmentDate, 113) as dtAppointmentDate ,sTimeFrom,sTimeTo ,(Case when 1=1 then (select  sLocationName from LinkedVenue where iVenueID = objDoc.iVenueID )Else '' END) as sLocationName from  ExpertAppointments objDoc where iAdminCompanyID=" + Session["iAdminCompanyID"].ToString() + " and iContactID =" + ddlDoctorName.SelectedValue.ToString() + "   and cast(dtAppointmentDate as DATE) >= CAST(GETDATE() as Date)) as t1 where not EXISTS(select * from Cases where iAppointmentID=t1.iAppointmentID) and iAppointmentID =" + ddlAppointmentDetail.SelectedValue.ToString() + " ";
        objQuery.ExecuteSql(strQuery2);
        lblAppointmentDetail.Text = objQuery.DefaultView.Table.Rows[0].ItemArray[1].ToString();
        ModalPopupExtender3.Show();
    }
    protected void ddlMedicalDoctors_SelectedIndexChanged(object sender, EventArgs e)
    {
        Users objQuery = new Users();
        string strQuery2 = " select iAppointmentID,isNull(t1.dtAppointmentDate,'')+', '+ isNull(t1.sTimeFrom,'')+', '+isNull(t1.sLocationName,'') AS sAppointmentDetail from (select iAppointmentID ,CONVERT(VARCHAR(12), dtAppointmentDate, 113) as dtAppointmentDate ,sTimeFrom ,(Case when 1=1 then (select  sLocationName from LinkedVenue where iVenueID = objDoc.iVenueID )Else '' END) as sLocationName from  ExpertAppointments objDoc where iAdminCompanyID=" + Session["iAdminCompanyID"].ToString() + " and iContactID =" + ddlDoctorName.SelectedValue.ToString() + "  and cast(dtAppointmentDate as DATE) >= CAST(GETDATE() as Date)) as t1 where not EXISTS(select * from Cases where iAppointmentID=t1.iAppointmentID)";

        objQuery.ExecuteSql(strQuery2);
        CommonMethods.FillDropDownList(ddlAppointmentDetail, objQuery.DefaultView, "sAppointmentDetail", "iAppointmentID");
        ModalPopupExtender3.Show();

    }
}