using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginPage : System.Web.UI.Page
{
    public object LogInResultsLabel { get; private set; }


    protected void LogInButton_Click(object sender, EventArgs e)
    {
        //create sql data source object...
        //object we use to perform query
        SqlDataSource objDS = new SqlDataSource();

        //look in web config, and pull 2 parameters needed
        // to connect to out database
        objDS.ProviderName = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ProviderName;
        objDS.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //define sql statement - query with parameters
        objDS.SelectCommand = "select UserID, UserLastName, UserFirstName from UserInfo where UserName=? and Password=?";

        //tell where to get the values of the parameters
        objDS.SelectParameters.Add("UserName", UserNameTextBox.Text);
        objDS.SelectParameters.Add("Password", UserPasswordTextBox.Text);

        //sets mode of how we are going to use data... simpler option
        objDS.DataSourceMode = SqlDataSourceMode.DataReader;

        //executes the query - stores the results - in sort of an array = read sequentially
        System.Data.IDataReader myData = (System.Data.IDataReader)objDS.Select(DataSourceSelectArguments.Empty);

        //read the next row - since his is the first read
        //it reads the first row in the result set...
        if (myData.Read())
        {
            // the first read found a row, and returned true
            //therefore
            //successful logon!

            Session["UserID"] = myData[0];
            Session["UserLastName"] = myData[1];
            Session["UserFirstName"] = myData[2];
            LabelResults.Text = " Welcome " + "" + Session["UserFirstName"].ToString() + "!";
            LabelResults.ForeColor = System.Drawing.Color.Black;
            //redirect to default.aspx
            Response.Redirect("default.aspx");


        }
        else
        {
            // the first read did not find a row, and returned false
            //therefore
            //unsuccessful logon!
            //set message
            LabelResults.Text = "Log In Attempt Failed, Please Enter Correct Username and Password";
            LabelResults.ForeColor = System.Drawing.Color.Red;
        }


    }

}