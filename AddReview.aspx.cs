using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddReview : System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserFirstName"] == null)
        {
            Response.Redirect("LoginPage.aspx");
        }
        
         else
        {
             AddReviewLoginID.Text = "Logged in as: " + Session["UserFirstName"].ToString();
        }
     }
   


    protected void ReviewInsertButton_Click(object sender, EventArgs e)
    {
        //create sql data source object...
        //object we use to perform query
        SqlDataSource objDS = new SqlDataSource();

        //look in web config, and pull 2 parameters needed
        // to connect to out database
        objDS.ProviderName = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ProviderName;
        objDS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //define sql statement - query with parameters
        objDS.InsertCommand = "insert into Review (ReviewTitle, ReviewSummary, NumberOfStars, UserID_FK, MediaID_FK) values (?,?,?,?,?)";

        //tell where to get the values of the parameters
        objDS.InsertParameters.Add("ReviewTitle", ReviewTitleTextBox.Text);
        objDS.InsertParameters.Add("ReviewSummary", ReviewSummaryTextBox.Text);
        objDS.InsertParameters.Add("NumberOfStars", NumberOfStarsTextBox.Text);
        objDS.InsertParameters.Add("UserID_FK", Session["UserID"].ToString());
        objDS.InsertParameters.Add("MediaID_FK", FilmReviewDropDownList.SelectedItem.Value);

        try
        {
            int numberOfStars;
            numberOfStars= int.Parse(NumberOfStarsTextBox.Text);
            if (numberOfStars < 0 || numberOfStars > 5) 
            {
                ErrorLabel.Text = "Enter a number between 0-5 for Number of Stars";
            }
            else {
                objDS.Insert();
                Response.Redirect("ReviewConfirmationPage.aspx");
           }
        }

        catch (Exception exc)
        {
            ErrorLabel.Text = "Unable to insert data.  Possible errors include: invalid data or database is down for maintenence.  Please try again.";
            LogOutButton.Visible = true;
        }
    }

    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
}
