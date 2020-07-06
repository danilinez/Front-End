using System;
using System.Web;
using System.Linq;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using Linez.Library.PlayDate.BAL;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string fnLogin(string sUsername, string sPassword)
    {
        try
        {
            UserAccounts objUA = new UserAccounts();            
            objUA.Where.SUserName.Value = sUsername;
            objUA.Where.SPassword.Value = sPassword;
            objUA.Where.BtIsActive.Value = true;
            objUA.Where.BtIsDeleted.Value = false;

            objUA.Query.Load();
            
            if (objUA.RowCount == 1)
            {
                return objUA.s_IUserAccountID;
            }

            else
            {
                objUA = new UserAccounts();
                objUA.Where.SEmail.Value = sUsername;
                objUA.Where.SPassword.Value = sPassword;
                objUA.Where.BtIsActive.Value = true;
                objUA.Where.BtIsDeleted.Value = false;

                objUA.Query.Load();

                if (objUA.RowCount == 1)
                {
                    return objUA.s_IUserAccountID;
                }

                else
                {
                    return "0";
                }
            }
        }
        catch (Exception exc)
        {
            return exc.Message;
        }

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["UserID"] = hfUserID.Value;
        Response.Redirect("MyDashboard.aspx", false);
        Response.End();
    }
}