using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Linez.Library.PlayDate.BAL;
using Newtonsoft.Json;
using System.Globalization;
using System.Text;

public partial class KidsSchedule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [System.Web.Services.WebMethod()]
    public static string fnEditEvent(string sSchID)
    {
        UserAccounts objQuery = new UserAccounts();
        objQuery.ExecuteSql("exec [sp_EditSchedule] " + sSchID + "");

        string json = JsonConvert.SerializeObject(objQuery.DefaultView.Table, Formatting.Indented);
        return json;
    }
    [System.Web.Services.WebMethod()]
    public static string fnLoadAllScheulesAndEvents(string sUserID)
    {
        UserAccounts objQuery = new UserAccounts();
        objQuery.ExecuteSql("exec sp_LoadAllSchedulesAndEvents_Client '" + sUserID + "'");

        string json = JsonConvert.SerializeObject(objQuery.DefaultView.Table, Formatting.Indented);
        return json;
    }
    [System.Web.Services.WebMethod()]
    public static string fnSaveSchedule(string sUserID, string iScheduleID, string sKidID, string sStartDate, string sEndDate, string sStatus)
    {
        try
        {
            DateTime dtStartDate = DateTime.ParseExact(sStartDate, "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture);
            DateTime dtEndStartDate = DateTime.ParseExact(sEndDate, "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture);

            if (dtStartDate >= dtEndStartDate)
                return "-2";


            Schedules objSchedule = new Schedules();

            if (iScheduleID != "")
            {
                objSchedule.LoadByPrimaryKey(Convert.ToInt32(iScheduleID));
            }
            else
            {
                objSchedule.AddNew();
                objSchedule.DtCreatedDate = System.DateTime.Now;
            }

            objSchedule.s_IUserAccountID = sUserID;
            objSchedule.DtStartDateTime = dtStartDate;
            objSchedule.DtEndDateTime = dtEndStartDate;
            objSchedule.s_IKidID = sKidID;
            if (sStatus == "1")
                objSchedule.BtActive = true;
            else if (sStatus == "0")
                objSchedule.BtActive = false;


            objSchedule.Save();


            return objSchedule.s_IScheduleID;
        }
        catch (Exception)
        {

            return "-1";
        }


    }
    [System.Web.Services.WebMethod()]
    public static string fnDeleteSchedule(string iScheduleID)
    {
        try
        {
            UserAccounts objQuery = new UserAccounts();
            objQuery.ExecuteSql("select iScheduleID from Schedules objsch where exists(select * from Appointments where iScheduleID = objsch.iScheduleID) and iScheduleID = " + iScheduleID + "");
            Schedules objSch = new Schedules();
            objSch.LoadByPrimaryKey(Convert.ToInt32(iScheduleID));

            if (objQuery.RowCount > 0)
            {
                objSch.BtActive = false;
                objSch.Save();
            }
            else
            {
                objSch.MarkAsDeleted();
                objSch.Save();
            }
            return "1";
        }
        catch (Exception)
        {
            return "0";
        }

    }

    [System.Web.Services.WebMethod()]
    public static string fnLoadKids(string sUserID)
    {
        try
        {
            Kids objKids = new Kids();
            objKids.Where.IUserAccountID.Value = Convert.ToInt32(sUserID);
            objKids.Query.AddResultColumn(Kids.ColumnNames.IKidID);
            objKids.Query.AddResultColumn(Kids.ColumnNames.SKidName);
            objKids.Query.Load();

            string json = JsonConvert.SerializeObject(objKids.DefaultView.Table, Formatting.Indented);
            return json;
        }
        catch (Exception)
        {
            return "-1";
        }

    }
}