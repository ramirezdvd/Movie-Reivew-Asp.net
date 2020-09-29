<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
     <section class="LoginIDsection">
        <asp:Label ID="DefaultID" runat="server" Text="" CssClass="LoginLabel"></asp:Label>
        <asp:button runat="server" text="Log Out" ID="LogOutButton" CssClass="LogOutButton" OnClick="LogOutButton_Click" Visible="False" />
    </section>

   
</asp:Content>

