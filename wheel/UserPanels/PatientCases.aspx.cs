using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Linez.Library.WHCS.BAL;
using Linez.Library.WHCS.SecurityManager;
using System.Data;

public partial class UserPanels_PatientCases : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDataIntoListView();

        }
    }

    protected void LoadDataIntoListView()
    {
        Users objQuery = new Users();
        string adminID = (string)Session["iAdminCompanyID"];
        string patientID = Session["iContactID"].ToString();
        string str = " select * from (select (Case when 1=1 then (select top 1 Contacts.sFirstName from Contacts where Contacts.iContactID=objCases.iExpretID)else '' end) as DoctorName,(Case when 1=1 then (select LinkedVenue.sLocationName from LinkedVenue where LinkedVenue.iVenueID=objCases.iVenueID)else '' end )as LocationName,(Case when 1=1 then (select CONVERT(varchar(10),ExpertAppointments.dtAppointmentDate,101) from ExpertAppointments where ExpertAppointments.iAppointmentID=objCases.iAppointmentID)else '' end)as AppointmentDate,(Case when 1=1 then (select ExpertAppointments.sTimeFrom from ExpertAppointments where ExpertAppointments.iAppointmentID=objCases.iAppointmentID)else '' end)as TimeFrom,(Case when 1=1 then (select ExpertAppointments.sTimeTo from ExpertAppointments where ExpertAppointments.iAppointmentID=objCases.iAppointmentID)else '' end)as TimeTo, objCases.sCaseStatus as CaseStatus, objCases.iCaseID as caseID from Cases objCases where iAdminCompanyID= '" + adminID + "'   and iPatientID='" + patientID + "'  ) as t1 where t1.AppointmentDate<getdate()  ";
        // string str = "select (Case when 1=1 then (select top 1 Contacts.sFirstName from Contacts where Contacts.iContactID=objCases.iExpretID)else '' end) as DoctorName,(Case when 1=1 then (select LinkedVenue.sLocationName from LinkedVenue where LinkedVenue.iVenueID=objCases.iVenueID)else '' end )as LocationName,(Case when 1=1 then (select CONVERT(varchar(10),ExpertAppointments.dtAppointmentDate,101) from ExpertAppointments where ExpertAppointments.iAppointmentID=objCases.iAppointmentID)else '' end)as AppointmentDate,(Case when 1=1 then (select ExpertAppointments.sTimeFrom from ExpertAppointments where ExpertAppointments.iAppointmentID=objCases.iAppointmentID)else '' end)as TimeFrom,(Case when 1=1 then (select ExpertAppointments.sTimeTo from ExpertAppointments where ExpertAppointments.iAppointmentID=objCases.iAppointmentID)else '' end)as TimeTo, objCases.sCaseStatus as CaseStatus, objCases.iCaseID as caseID from Cases objCases where iAdminCompanyID= '" + adminID + "'  and iPatientID='" + patientID + "'AND dtCaseDate<=getdate()";
        objQuery.ExecuteSql(str);
        if (objQuery.RowCount > 0)
        {
            Title = "Row affected";
            lstCases.Items.Clear();
            lstCases.DataSource = objQuery.DefaultView;
            lstCases.DataBind();
        }
        else
        {
            Title = "None Row affected";
        }
    }

    protected void lstAppointments_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
    protected void lstAppointments_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {

    }
    protected void lstCases_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "ViewCase")
        {
            Session["CaseID"] = e.CommandArgument.ToString();
            Response.Redirect("PatientCaseDetails.aspx", true);
            Response.End();
        }

        if (String.Equals(e.CommandName, "popup"))
        {
            ModalPopupExtender1.TargetControlID = btnForPopupModal.ID;
            Session["caseID"] = e.CommandArgument.ToString();
            Page.Title = (string)Session["caseID"];
            pnlDeleteAppointment.Visible = true;
            ModalPopupExtender1.Show();
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string caseID = (string)Session["caseID"];

        Cases objCases = new Cases();
        objCases.LoadByPrimaryKey(Convert.ToInt32(caseID));
        if (String.Equals(objCases.SCaseStatus, "cancel"))
        {
            Page.Title = "No Update";
            pnlDeleteAppointment.Visible = false;
            ModalPopupExtender1.Hide();

        }
        else
        {
            objCases.SCaseStatus = "cancel";
            objCases.Save();
            Page.Title = "No Update";

            ModalPopupExtender1.Hide();
            lstCases.Items.Clear();
            LoadDataIntoListView();
            Response.Redirect(Request.RawUrl);
        }


    }
    protected void dtpCases_PreRender(object sender, EventArgs e)
    {
        LoadDataIntoListView();
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlDeleteAppointment.Visible = false;
        ModalPopupExtender1.Hide();
    }

}