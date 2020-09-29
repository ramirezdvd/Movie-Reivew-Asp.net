<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReviewConfirmationPage.aspx.cs" Inherits="ReviewConfirmationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Congratulations!</h2>
     <section class="LoginIDsection">
        <asp:Label ID="ReviewConfirmationPageID" runat="server" Text="" CssClass="LoginLabel"></asp:Label>
        <asp:button runat="server" text="Log Out" ID="LogOutButton" CssClass="LogOutButton" OnClick="LogOutButton_Click" Visible="False" />
     </section>
   
       <p>Your Review Has Been Submitted!</p>
       



</asp:Content>

