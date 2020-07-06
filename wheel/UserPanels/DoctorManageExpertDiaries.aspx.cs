using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Linez.Library.WHCS.BAL;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class UserPanels_Default : System.Web.UI.Page
{
    Users objUsers;
    LinkedVenue objLinkedVenue;
    ExpertAppointments objDoctorAppointment;
    Contacts objContacts;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fnLoadAppointmentsOnCalender();
            hfAddmore.Value = "0";
            calAppointment.SelectedDate = System.DateTime.Now.Date;
            lblCurrentDate.Text = calAppointment.SelectedDate.ToString("D");

            Session["SelectedDate"] = System.DateTime.Now.Date;
            btnAddSlots.Visible = true;
            fnLoadDropDowns();
            fnResetFields();

            calAppointment_SelectionChanged(new object(), new EventArgs());
        }
    }

    protected void calAppointment_DayRender(object sender, DayRenderEventArgs e)
    {
        try
        {
            if (e.Day.IsOtherMonth)
            {
                //e.Cell.Height = 25;
                e.Cell.Text = "";
            }
            else
            {
                //e.Cell.Height = 25;

            }
        }
        catch (Exception exc)
        {
            //lblDisplayErrors.Text = exc.Message;
        }

    }

    private void fnLoadDropDowns()
    {
        Users objQuery = new Users();
        objQuery.ExecuteSql("select iContactID, isNull(sFirstName,'') +' '+ isNull(sLastName,'') as sName from Contacts where iUserTypeID = 2 and iAdminCompanyID = " + Session["iAdminCompanyID"].ToString() + " and iContactID = " + Session["iContactID"].ToString() + "");

        CommonMethods.FillDropDownList(ddlMedicalExperts, objQuery.DefaultView, "sName", "iContactID");

        if (ddlMedicalExperts.Items.Count > 1)
        {
            ddlMedicalExperts.Items.RemoveAt(0);
            ddlMedicalExperts.Enabled = false;
            ddlMedicalExperts_SelectedIndexChanged(new object(),new EventArgs());
        }
        objQuery.ExecuteSql("select iContactID, isNull(sFirstName,'') +' '+ isNull(sLastName,'') as sName from Contacts where iUserTypeID = 4 and iAdminCompanyID = " + Session["iAdminCompanyID"].ToString() + "");

        CommonMethods.FillDropDownList(ddlPatients, objQuery.DefaultView, "sName", "iContactID");
    }

    protected void btnAddSlots_Click(object sender, EventArgs e)
    {
        if (calAppointment.SelectedDate < System.DateTime.Now)
        {
            lblFormMessages.Text = "* Can not add appointments for past date(s)";
            lblFormMessages.Font.Bold = true;
            lblFormMessages.Style.Add("font-size", "11px");
            lblFormMessages.ForeColor = System.Drawing.Color.OrangeRed;//System.Drawing.Color.FromArgb(48, 123, 192);
            lblFormMessages.Visible = true;
            return;
        }



        System.Threading.Thread.Sleep(1000);
        ModalPopupExtender1.TargetControlID = "btnPopUP";
        ModalPopupExtender1.Show();
        ModalPopupExtender1.CancelControlID = "btnCloseSlot";

        lblSelectedDate.Text = calAppointment.SelectedDate.ToString("D");
        Session["iDoctorID"] = null;
        Session["IsMoving"] = null;
        Session["iAppointmentID"] = null;
        Session["MoveTimeMinutsDifference"] = null;
    }

    protected void calAppointment_SelectionChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        Session["SelectedDate"] = calAppointment.SelectedDate.ToShortDateString();
        lblFormMessages.Visible = false;
        btnAddSlots.Visible = true;

        lblSelectedDate.Text = calAppointment.SelectedDate.ToString("D");
        lblCurrentDate.Text = calAppointment.SelectedDate.ToString("D");
        fnLoadAppointmentsPerDate();
        return;

    }

    protected void ddlMedicalExperts_SelectedIndexChanged(object sender, EventArgs e)
    {
        objLinkedVenue = new LinkedVenue();
        objLinkedVenue.Where.IContactID.Value = Convert.ToInt32(ddlMedicalExperts.SelectedValue);
        objLinkedVenue.Query.Load();

        CommonMethods.FillDropDownList(ddlLocation, objLinkedVenue.DefaultView, LinkedVenue.ColumnNames.SLocationName, LinkedVenue.ColumnNames.IVenueID);

        ModalPopupExtender1.Show();
    }

    protected void btnSaveSlot_Click(object sender, EventArgs e)
    {
        if (Session["IsMoving"] != null && Session["iAppointmentID"] != null && Session["MoveTimeMinutsDifference"] != null)
        {
            System.Threading.Thread.Sleep(1000);

            ExpertAppointments objTmpEA = new ExpertAppointments();
            objTmpEA.LoadByPrimaryKey(Convert.ToInt32(Session["iAppointmentID"]));



            if (objTmpEA.RowCount > 0)
            {
                DateTime dtTmpStartDate = Convert.ToDateTime(txtMoveToDate.Text + " " + ddlMoveHours.SelectedValue.ToString() + ":" + ddlMoveMinuts.SelectedValue.ToString() + " " + ddlMoveDayPart.SelectedValue.ToString());

                if (dtTmpStartDate < System.DateTime.Now)
                {
                    lblMoveDateErro.Visible = true;
                    ModalPopupExtender2.Show();
                    return;
                }


                if (fnCheckIfExists(objTmpEA.s_IContactID, txtMoveToDate.Text, dtTmpStartDate.ToShortTimeString(), dtTmpStartDate.AddMinutes(Convert.ToInt32(Session["MoveTimeMinutsDifference"])).ToShortDateString(), dtTmpStartDate.AddMinutes(Convert.ToInt32(Session["MoveTimeMinutsDifference"])).ToShortTimeString()))
                {
                    lblMoveDateErro.Visible = true;
                    ModalPopupExtender2.Show();
                    return;
                }
                else
                {
                    objTmpEA.DtAppointmentDate = dtTmpStartDate.Date;
                    objTmpEA.s_STimeFrom = dtTmpStartDate.ToShortTimeString();
                    objTmpEA.s_STimeTo = dtTmpStartDate.AddMinutes(Convert.ToInt32(Session["MoveTimeMinutsDifference"])).ToShortTimeString();

                    objTmpEA.Save();
                    Session["iDoctorID"] = null;
                    Session["IsMoving"] = null;
                    Session["iAppointmentID"] = null;
                    Session["MoveTimeMinutsDifference"] = null;

                    fnResetMoveToFields();
                    ModalPopupExtender2.TargetControlID = "HyperLink2";
                    ModalPopupExtender2.CancelControlID = "btnPopUP";
                    ModalPopupExtender2.Hide();
                    ModalPopupExtender2.CancelControlID = "btnCloseMoveApp";
                    fnLoadAppointmentsOnCalender();
                    calAppointment_SelectionChanged(new object(), new EventArgs());
                    return;
                }
            }

        }
        else
        {
            Session["IsMoving"] = null;
            int iCount = 1;

            if (hfAddmore.Value.ToString() == "1")
            {
                if (txtNumberToAdd.Text == "")
                {
                    ModalPopupExtender1.Show();
                    lblAddNumber.Visible = true;
                    return;
                }
                else
                    lblAddNumber.Visible = false;

                if (txtNumberToAdd.Text != "00" && txtNumberToAdd.Text != "0")
                    iCount = Convert.ToInt32(txtNumberToAdd.Text);

            }

            string strDateTime = Convert.ToDateTime(Session["SelectedDate"].ToString()).ToShortDateString() + " " + ddlHours.SelectedValue.ToString() + ":" + ddlMinuts.SelectedValue.ToString() + " " + ddlDayPart.SelectedValue.ToString();
            DateTime dtStartingDateTime = Convert.ToDateTime(strDateTime);





            if (iCount == 1)
            {
                System.Threading.Thread.Sleep(1000);
                if (fnCheckIfExists(ddlMedicalExperts.SelectedValue.ToString(), dtStartingDateTime.ToShortDateString(), dtStartingDateTime.ToShortTimeString(), dtStartingDateTime.AddMinutes(10).ToShortDateString(), dtStartingDateTime.AddMinutes(10).ToShortTimeString()))
                {
                    lblError.Visible = true;
                    ModalPopupExtender1.Show();
                    return;
                }

                objDoctorAppointment = new ExpertAppointments();
                objDoctorAppointment.AddNew();

                objDoctorAppointment.s_IContactID = ddlMedicalExperts.SelectedValue.ToString();
                objDoctorAppointment.DtAppointmentDate = dtStartingDateTime.Date;
                objDoctorAppointment.s_STimeFrom = dtStartingDateTime.ToShortTimeString();

                objDoctorAppointment.s_STimeTo = dtStartingDateTime.AddMinutes(10).ToShortTimeString();

                objDoctorAppointment.s_IAdminCompanyID = Session["iAdminCompanyID"].ToString();

                objDoctorAppointment.s_IVenueID = ddlLocation.SelectedValue.ToString();
                objDoctorAppointment.DtCreatedDate = System.DateTime.Now;

                objUsers = (Users)Session["UserID"];


                objDoctorAppointment.IUserID = objUsers.IUserID;

                objDoctorAppointment.Save();

                fnResetFields();
                ModalPopupExtender1.TargetControlID = "HyperLink1";
                ModalPopupExtender1.CancelControlID = "btnAddSlots";
                ModalPopupExtender1.Hide();
                ModalPopupExtender1.CancelControlID = "btnCloseSlot";
                fnLoadAppointmentsOnCalender();
                calAppointment_SelectionChanged(new object(), new EventArgs());
                return;

            }
            else if (iCount > 1)
            {
                System.Threading.Thread.Sleep(1000);
                int iOverlappingCount = 0;

                int iAppointmentDuration = Convert.ToInt32(ddlEveryMinut.SelectedValue);

                for (int i = 0; i < iCount; i++)
                {
                    if (!fnCheckIfExists(ddlMedicalExperts.SelectedValue.ToString(), dtStartingDateTime.ToShortDateString(), dtStartingDateTime.ToShortTimeString(), dtStartingDateTime.AddMinutes(iAppointmentDuration).ToShortDateString(), dtStartingDateTime.AddMinutes(iAppointmentDuration).ToShortTimeString()))
                    {
                        objDoctorAppointment = new ExpertAppointments();
                        objDoctorAppointment.AddNew();

                        objDoctorAppointment.s_IContactID = ddlMedicalExperts.SelectedValue.ToString();
                        objDoctorAppointment.DtAppointmentDate = dtStartingDateTime.Date;
                        objDoctorAppointment.s_STimeFrom = dtStartingDateTime.ToShortTimeString();

                        dtStartingDateTime = dtStartingDateTime.AddMinutes(iAppointmentDuration);
                        objDoctorAppointment.s_STimeTo = dtStartingDateTime.ToShortTimeString();

                        objDoctorAppointment.s_IAdminCompanyID = Session["iAdminCompanyID"].ToString();

                        objDoctorAppointment.s_IVenueID = ddlLocation.SelectedValue.ToString();
                        objDoctorAppointment.DtCreatedDate = System.DateTime.Now;

                        objUsers = (Users)Session["UserID"];


                        objDoctorAppointment.IUserID = objUsers.IUserID;

                        objDoctorAppointment.Save();

                        dtStartingDateTime = dtStartingDateTime.AddMinutes(1);
                    }
                    else
                    {
                        ++iOverlappingCount;
                        dtStartingDateTime = dtStartingDateTime.AddMinutes(iAppointmentDuration);
                    }

                }

                if (iOverlappingCount != 0)
                {
                    lblError.Text = iOverlappingCount.ToString() + " of appointment(s) overlaping with other appointments";
                    lblError.Visible = true;
                }


                fnResetFields();
                ModalPopupExtender1.TargetControlID = "HyperLink1";
                ModalPopupExtender1.CancelControlID = "btnAddSlots";
                ModalPopupExtender1.Hide();
                ModalPopupExtender1.CancelControlID = "btnCloseSlot";

                Session["iDoctorID"] = null;
                Session["IsMoving"] = null;
                Session["iAppointmentID"] = null;
                Session["MoveTimeMinutsDifference"] = null;
                fnLoadAppointmentsOnCalender();
                calAppointment_SelectionChanged(new object(), new EventArgs());
            }

        }
    }

    private void fnResetFields()
    {

        if (ddlMedicalExperts.Items.Count > 0)
            ddlMedicalExperts.SelectedIndex = 0;

        ddlMinuts.SelectedIndex = 0;
        ddlHours.SelectedIndex = 0;
        ddlDayPart.SelectedIndex = 0;
        ddlLocation.SelectedIndex = 0;
        ddlEveryMinut.SelectedIndex = 0;
        txtNumberToAdd.Text = "01";

        Session["iDoctorID"] = null;
        Session["IsMoving"] = null;
        Session["iAppointmentID"] = null;
        Session["MoveTimeMinutsDifference"] = null;

    }

    private bool fnCheckIfExists(string iContactID, string dtAppointmentStartDate, string sAppointmentStartTime, string dtAppointmentEndDate, string sAppointmentEndTime)
    {
        Users objQuery = new Users();

        objQuery.ExecuteSql("select * from ExpertAppointments where iContactID = " + iContactID + " and (CAST('" + dtAppointmentStartDate + " " + sAppointmentStartTime + "' as Datetime)) between (Cast((Cast((Cast(dtAppointmentDate as date)) as varchar(100)) +' '+ sTimeFrom) as DateTime)) and (Cast((Cast((Cast(dtAppointmentDate as date)) as varchar(100)) +' '+ sTimeTo) as DateTime))");

        if (objQuery.RowCount > 0)
            return true;

        objQuery.ExecuteSql("select * from ExpertAppointments where iContactID = " + iContactID + " and (CAST('" + dtAppointmentEndDate + " " + sAppointmentEndTime + "' as Datetime)) between (Cast((Cast((Cast(dtAppointmentDate as date)) as varchar(100)) +' '+ sTimeFrom) as DateTime)) and (Cast((Cast((Cast(dtAppointmentDate as date)) as varchar(100)) +' '+ sTimeTo) as DateTime))");

        if (objQuery.RowCount > 0)
            return true;
        else
            return false;
    }

    protected void btnCloseSlot_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.TargetControlID = "HyperLink1";
        ModalPopupExtender1.CancelControlID = "btnCloseSlot";
        ModalPopupExtender1.Hide();
        fnResetFields();
        Session["iDoctorID"] = null;
        Session["IsMoving"] = null;
        Session["iAppointmentID"] = null;
        Session["MoveTimeMinutsDifference"] = null;
    }

    private void fnLoadAppointmentsPerDate()
    {
        Users objQuery = new Users();
        objQuery.ExecuteSql("select iAppointmentID, iContactID,isNull((case when 1=1 then (select top 1 isNull(sFirstName,'')+' '+isNull(sLastName,'')  from Contacts where iContactID = objEA.iContactID) ELSE '' END),'') as sDoctorName,sTimeFrom,sTimeTo,iVenueID,isnull((Case when 1=1 then (select top 1 sLocationName from LinkedVenue where iVenueID = objEA.iVenueID) ELSE '' END),'') as sLocationName from ExpertAppointments objEA where iAdminCompanyID = " + Session["iAdminCompanyID"].ToString() + "and iContactID =" + Session["iContactID"].ToString() + "  and (Cast(dtAppointmentDate as date) = Cast('" + Session["SelectedDate"].ToString() + "' as date)) order by (Cast((Cast((Cast(dtAppointmentDate as date)) as varchar(100)) +' '+ sTimeFrom) as DateTime)) ASC");

        lstAvailableSlots.Items.Clear();

        lstAvailableSlots.DataSource = objQuery.DefaultView;
        lstAvailableSlots.DataBind();
    }

    private void fnLoadAppointmentsOnCalender()
    {
        calAppointment.EventDateColumnName = "EventDate";
        calAppointment.EventDescriptionColumnName = "EventDescription";
        calAppointment.EventHeaderColumnName = "EventHeader";
        calAppointment.EventSource = fnGetAppointments();

    }
    DateTime RoundUp(DateTime dt, TimeSpan d)
    {
        return new DateTime(((dt.Ticks + d.Ticks - 1) / d.Ticks) * d.Ticks);
    }
    private DataTable fnGetAppointments()
    {
        Users objQuery = new Users();
        objQuery.ExecuteSql("exec [sp_GetAllAppointmentsForDoctor] " + Session["iAdminCompanyID"].ToString() + "," + Session["iContactID"].ToString() + "");

        return objQuery.DefaultView.Table;
    }
    protected void lstAvailableSlots_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            ImageButton imgBtnDelete = (ImageButton)e.Item.FindControl("imgBtnDelete");
            ImageButton imgBtnMove = (ImageButton)e.Item.FindControl("imgBtnMove");
            ImageButton imgBtnBookAppointment = (ImageButton)e.Item.FindControl("imgBtnBookAppointment");



            HtmlTableRow trAppointment = (HtmlTableRow)e.Item.FindControl("trAppointment");
            Label lblReserved = (Label)e.Item.FindControl("lblReserved");
            Cases objCases = new Cases();
            objCases.Where.IAppointmentID.Value = Convert.ToInt32(imgBtnDelete.CommandArgument);
            objCases.Query.Load();

            if (objCases.RowCount > 0)
            {
                imgBtnDelete.Visible = false;
                imgBtnBookAppointment.Visible = false;
                imgBtnMove.Visible = false;
                lblReserved.Text = "Reserved";
                lblReserved.ToolTip = "Reserved";
                lblReserved.Visible = true;
                trAppointment.Style.Add("color", "#dd86e9");
            }
        }
    }
    protected void lstAvailableSlots_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        try
        {
            int iAppointmentID = Convert.ToInt32(e.CommandArgument);

            ExpertAppointments objExpApp = new ExpertAppointments();
            objExpApp.LoadByPrimaryKey(iAppointmentID);

            if (e.CommandName.ToString() == "MoveApppointment")
            {
                if (objExpApp.RowCount > 0)
                {
                    txtMoveToDate.Text = objExpApp.DtAppointmentDate.ToShortDateString();

                    string strAppStartTime = txtMoveToDate.Text + " " + objExpApp.s_STimeFrom;
                    DateTime dtApptStartDateTime = Convert.ToDateTime(strAppStartTime);

                    string strAppEndTime = txtMoveToDate.Text + " " + objExpApp.s_STimeTo;
                    DateTime dtApptEndDateTime = Convert.ToDateTime(strAppEndTime);

                    ddlMoveHours.SelectedValue = dtApptStartDateTime.ToString("hh");
                    //ddlMoveMinuts.SelectedValue = dtApptStartDateTime.Minute.ToString();

                    if (RoundUp(dtApptStartDateTime, TimeSpan.FromMinutes(5)).Minute == 0)
                        ddlMoveMinuts.SelectedValue = "00";
                    else if (RoundUp(dtApptStartDateTime, TimeSpan.FromMinutes(5)).Minute < 10)
                        ddlMoveMinuts.SelectedValue = "0" + RoundUp(dtApptStartDateTime, TimeSpan.FromMinutes(5)).Minute.ToString();
                    else
                        ddlMoveMinuts.SelectedValue = RoundUp(dtApptStartDateTime, TimeSpan.FromMinutes(5)).Minute.ToString();

                    ddlMoveDayPart.SelectedValue = dtApptStartDateTime.ToString("tt");

                    Session["MoveTimeMinutsDifference"] = (dtApptEndDateTime - dtApptStartDateTime).Minutes;
                    Session["IsMoving"] = true;
                    Session["iAppointmentID"] = objExpApp.s_IAppointmentID;
                    System.Threading.Thread.Sleep(1000);
                    ModalPopupExtender2.TargetControlID = "btnPopUP";
                    ModalPopupExtender2.Show();
                    ModalPopupExtender2.CancelControlID = "btnCloseMoveApp";

                    lblAppointmentDate.Text = calAppointment.SelectedDate.ToString("D");

                }
            }
            else if (e.CommandName.ToString() == "DeleteApppointment")
            {
                if (objExpApp.RowCount > 0)
                {
                    objExpApp.MarkAsDeleted();
                    objExpApp.Save();

                    fnLoadAppointmentsOnCalender();
                    calAppointment_SelectionChanged(new object(), new EventArgs());
                }
            }
            else if (e.CommandName == "BookApppointment")
            {
                objContacts = new Contacts();

                objContacts.LoadByPrimaryKey(objExpApp.IContactID);

                if (objContacts.RowCount > 0)
                    lblDoctorName.Text = objContacts.s_SFirstName + " " + objContacts.s_SLastName;

                lblCaseBookingTitle.Text = objExpApp.DtAppointmentDate.ToString("D") + " at " + objExpApp.s_STimeFrom + " - " + objExpApp.s_STimeTo;

                Session["iAppointmentID"] = objExpApp.IAppointmentID;
                Session["iDoctorID"] = objExpApp.IContactID;
                ModalPopupExtender3.TargetControlID = "btnPopUP";
                ModalPopupExtender3.Show();
                ModalPopupExtender3.CancelControlID = "btnCancelBooking";
            }


        }
        catch (Exception)
        {

        }

    }

    protected void btnCloseMoveApp_Click(object sender, EventArgs e)
    {
        ModalPopupExtender2.TargetControlID = "HyperLink2";
        ModalPopupExtender2.CancelControlID = "btnCloseMoveApp";
        ModalPopupExtender2.Hide();
        fnResetMoveToFields();

        Session["iDoctorID"] = null;
        Session["IsMoving"] = null;
        Session["iAppointmentID"] = null;
        Session["MoveTimeMinutsDifference"] = null;
    }
    private void fnResetMoveToFields()
    {
        txtMoveToDate.Text = "";
        ddlMoveHours.SelectedIndex = 0;
        ddlMoveMinuts.SelectedIndex = 0;
        ddlMoveDayPart.SelectedIndex = 0;
        Session["iDoctorID"] = null;
        Session["IsMoving"] = null;
        Session["iAppointmentID"] = null;
        Session["MoveTimeMinutsDifference"] = null;
    }
    protected void ddlPatients_SelectedIndexChanged(object sender, EventArgs e)
    {

        try
        {
            objContacts = new Contacts();
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
    protected void btnBookCase_Click(object sender, EventArgs e)
    {
        // Session["iDoctorID"]       
        // Session["iAppointmentID"] = null;
        // Session["UserID"]
        // Session["iAdminCompanyID"]

        Users objQuery = new Users();
        objQuery.ExecuteSql("select * from Cases where iAdminCompanyID = " + Session["iAdminCompanyID"].ToString() + " and sCaseRefNo = '" + txtCaseRefNo.Text + "' ");

        if (objQuery.RowCount > 0)
        {
            lblCaseBookingError.Text = "* Case Reference already Exists!";
            lblCaseBookingError.Visible = true;
            return;
        }

        try
        {
            Contacts objPatient = new Contacts();
            Contacts objDoctor = new Contacts();

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
                objExpertAppointment.LoadByPrimaryKey(Convert.ToInt32(Session["iAppointmentID"]));


                Cases objCases = new Cases();
                objCases.AddNew();

                objCases.IPatientID = objPatient.IContactID;
                objCases.s_IAdminCompanyID = Session["iAdminCompanyID"].ToString();
                objCases.s_IUserIDCreatedBy = objCreatedByUser.s_IUserID;
                objCases.s_IExpretID = Session["iDoctorID"].ToString();
                objCases.s_SCaseDiscription = txtCaseDescription.Text;
                objCases.DtCreatedDate = System.DateTime.Now;
                objCases.s_SCaseStatus = ddlCaseStatus.SelectedValue.ToString();
                objCases.DtCaseDate = Convert.ToDateTime(txtCaseDate.Text);
                objCases.s_IAppointmentID = Session["iAppointmentID"].ToString();
                objCases.IVenueID = objExpertAppointment.IVenueID;
                objCases.s_SBillingAddress = objPatient.s_SAddress;
                objCases.s_SBillingPostCode = objPatient.s_SPostcode;
                objCases.s_SBillingCountry = objPatient.s_SCountry;
                objCases.s_SBillingPhone = objPatient.s_SPhone;
                objCases.s_SBillingEmail = objPatient.s_SEmail;
                objCases.s_SCaseRefNo = txtCaseRefNo.Text;

                objCases.Save();


                Session["CaseID"] = objCases.s_ICaseID;


                Session["iDoctorID"] = null;
                Session["IsMoving"] = null;
                Session["iAppointmentID"] = null;
                Session["MoveTimeMinutsDifference"] = null;

                fnLoadAppointmentsOnCalender();
                fnLoadAppointmentsPerDate();

                Response.Redirect("ManageCase.aspx", true);
                Response.End();

            }
        }
        catch (Exception exc)
        {

        }



    }

    private void fnResetCaseBookingFields()
    {
        txtCaseRefNo.Text = "";
        txtCaseDate.Text = "";
        txtCaseDescription.Text = "";
        ddlCaseStatus.SelectedIndex = 0;
        if (ddlPatients.Items.Count > 0)
            ddlPatients.SelectedIndex = 0;

        txtPatientAddress.Text = "";
        txtPatientDOB.Text = "";
        txtPatientEmail.Text = "";
        txtPatientFirstName.Text = "";
        txtPatientLastName.Text = "";
        txtPatientPhone.Text = "";
        txtPatientPostCode.Text = "";

    }

    protected void btnCancelBooking_Click(object sender, EventArgs e)
    {
        Session["iDoctorID"] = null;
        Session["IsMoving"] = null;
        Session["iAppointmentID"] = null;
        Session["MoveTimeMinutsDifference"] = null;

        ModalPopupExtender3.TargetControlID = "HyperLink3";
        ModalPopupExtender3.CancelControlID = "btnCancelBooking";
        ModalPopupExtender3.Hide();
    }
}