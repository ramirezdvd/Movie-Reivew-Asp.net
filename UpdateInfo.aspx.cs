using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserFirstName"] == null)
        {
            UpdateProfileDataView.DefaultMode = DetailsViewMode.Insert;
        }

        else
        {
            UpdateProfileDataView.DefaultMode = DetailsViewMode.ReadOnly;
            UpdateProfileLoginID.Text = "Logged in as: " + Session["UserFirstName"].ToString();
            LogOutButton.Visible = true;
        }
    }

    protected void UpdateProfileDetailsView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            UpdateInfoErrorLabel.Text = "Cannot update at this time.  Possible errors include Username is already taken or Database is down.  Try again Later.";
            e.ExceptionHandled = true;
        }
        else
        {

            Session.Abandon();
            Response.Redirect("LoginPage.aspx");

        }
    }



    protected void UpdateProfileDataView_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            UpdateInfoErrorLabel.Text = "Cannot delete account.  Possible errors include Database is down for maintenence or server is not responding.  Try again Later.";
            e.ExceptionHandled = true;
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }

    }

    protected void UpdateProfileDataView_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            UpdateInfoErrorLabel.Text = "Cannot save data at this time.  Possible errors include Username is already taken or Database is down.  Try again Later.";
            e.ExceptionHandled = true;
        }
        else


        {
            Response.Redirect("LoginPage.aspx");
        }
    }

    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
}