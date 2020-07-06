using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Linez.Library.WHCS.BAL;
using Linez.Library.WHCS.SecurityManager;

public partial class ControlPanel_ManagePharmasists : ControlPanelSessionManager
{

    Users objUser;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null && Session["iAdminCompanyID"] != null)
        {
            if (!IsPostBack)
            {
                hfAdminCompanyID.Value = Session["iAdminCompanyID"].ToString();

                objUser = (Users)Session["UserID"];

                hfUserID.Value = objUser.s_IUserID;
                fnLoadDropDown();
                //fnLoadCompanyTypes();
            }
        }
        else
        {
            Response.Redirect("~/LogOut.aspx", false);
            return;
        }
    }

    private void fnLoadDropDown()
    {
        Company objCompany = new Company();
        objCompany.Where.IAdminCompanyID.Value = Convert.ToInt32(Session["iAdminCompanyID"]);
        objCompany.Query.Load();
        CommonMethods.FillDropDownList(ddlCompanies, objCompany.DefaultView, Company.ColumnNames.SCompanyName, Company.ColumnNames.ICompanyID);
    }

    private void fnLoadPharmasists()
    {
        LinezWS_WHCS objWS = new LinezWS_WHCS();

        lstUsers.Items.Clear();
        lstUsers.DataSource = objWS.fnLoadPharmasists(Session["iAdminCompanyID"].ToString());
        lstUsers.DataBind();
    }

    protected void dtpUsers_PreRender(object sender, EventArgs e)
    {
        if (Session["UserID"] != null && Session["iAdminCompanyID"] != null)
        {
            fnLoadPharmasists();
        }
    }

}