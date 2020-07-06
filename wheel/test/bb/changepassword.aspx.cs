using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Linez.Library.WHCS.BAL;
public partial class changepassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["requestID"] == null)
        {
            Response.Redirect("index.html", false);
            Response.End();
        }
    }
    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["requestID"] != null)
        {
            Users objUserTmp = new Users();
            objUserTmp.Where.SPasswordChangeGUID.Value = Request.QueryString["requestID"].ToString();
            objUserTmp.Query.Load();

            if (objUserTmp.RowCount == 1)
            {
                Users objUser = new Users();
                objUser.LoadByPrimaryKey(objUserTmp.IUserID);

                objUser.s_SPassword = txtNewPassword.Text;
                objUser.s_SPasswordChangeGUID = "";
                objUser.Save();
                Response.Redirect("login.html", false);
                Response.End();
            }
            else
            {
                Response.Redirect("login.html", false);
                Response.End();
            }
        }
        else
        {
            Response.Redirect("login.html", false);
            Response.End();
        }
    }
}