using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPanels_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            idiAdminCompanyID.Value = Session["iAdminCompanyID"].ToString();

            hfPostCode.Value = "";

            // idiAdminCompanyID.Value = Session["iAdminCompanyID"].ToString();
            if (Session["UserID"] != null && Session["iAdminCompanyID"] != null)
            {
                idiAdminCompanyID.Value = Session["iAdminCompanyID"].ToString();
                fnLoadNewsFeeds();
            }
        } 

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

        ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:fnLoadMarkers(); ", true);

    }
    private void fnLoadNewsFeeds()
    {
        LinezWS_WHCS objWS = new LinezWS_WHCS();

        lstNewsFeeds.Items.Clear();
        lstNewsFeeds.DataSource = objWS.fnLoadNewsFeedsForDoctors(Session["iAdminCompanyID"].ToString());  //
        lstNewsFeeds.DataBind();

    }
    
}