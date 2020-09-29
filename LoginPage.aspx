<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Log In Here!</h2>
    <section class="logincontrolssection">
    <ul class="logincontrolsul">
        <li class="logincontrolsli">
            <asp:Label ID="UserNameLabel" runat="server" Text="Username:" CssClass="logincontrollabel"></asp:Label>
            <asp:TextBox ID="UserNameTextBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserNameTextBox" CssClass="ValidationLabel" Display="Dynamic" ErrorMessage="Must Enter a Username"></asp:RequiredFieldValidator>
        </li>

        <li class="logincontrolsli">
            <asp:Label ID="UserPasswordLabel" runat="server" Text="Password:" CssClass="logincontrollabel"></asp:Label>
            <asp:TextBox ID="UserPasswordTextBox" runat="server" CssClass="UserPasswordTextBox" ViewStateMode="Inherit" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserPasswordTextBox" CssClass="ValidationLabel" Display="Dynamic" ErrorMessage="Must Enter a Password"></asp:RequiredFieldValidator>
            <asp:Button ID="LogInButton" runat="server" Text="Log In" OnClick="LogInButton_Click" />
        </li>

    </ul>
          </section>

     <section class="logincontrolssection">
         
         <asp:HyperLink ID="RegisterHyperLink" runat="server" NavigateUrl="UpdateInfo.aspx">Register Here!</asp:HyperLink>
       
    </section>

    <section class="logincontrolssection">
         
            <asp:Label ID="LabelResults" runat="server" CssClass="LabelResults"></asp:Label>
       
    </section>
    

</asp:Content>

