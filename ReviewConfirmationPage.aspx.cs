using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReviewConfirmationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserFirstName"] == null)
        {
            ReviewConfirmationPageID.Text = "";
        }

        else
        {
            ReviewConfirmationPageID.Text = "Logged in as: " + Session["UserFirstName"].ToString();
            LogOutButton.Visible = true;
        }
    }

    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
}