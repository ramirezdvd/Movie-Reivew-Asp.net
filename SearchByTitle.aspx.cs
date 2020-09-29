using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchByTitle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserFirstName"] == null)
        {
            SearchByTitleLoginID.Text = "";
        }

        else
        {
            SearchByTitleLoginID.Text = "Logged in as: " + Session["UserFirstName"].ToString();
            LogOutButton.Visible = true;
        }
    }

    protected void SearchForFilmByTitleButton_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }

    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
}

