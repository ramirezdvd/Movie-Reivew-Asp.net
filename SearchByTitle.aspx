<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchByTitle.aspx.cs" Inherits="SearchByTitle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id ="titleBox">
    <h2>Search by Title</h2>
    
    <section class="LoginIDsection">
        <asp:Label ID="SearchByTitleLoginID" runat="server" CssClass="LoginLabel"></asp:Label>
        <asp:button runat="server" text="Log Out" ID="LogOutButton" CssClass="LogOutButton" OnClick="LogOutButton_Click" Visible="False" />
    </section>

    <label for="SearchByTitleTextBox"></label>
    <asp:TextBox ID="SearchByTitleTextBox" runat="server" CssClass="textbox"></asp:TextBox>
    <asp:Button ID="SearchForFilmByTitleButton" runat="server" CssClass="searchbuttonTitle" Text="Search" OnClick="SearchForFilmByTitleButton_Click"/>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select * from MEDIA where MediaName like &quot;%&quot; + ? + &quot;%&quot;">
        <SelectParameters>
            <asp:ControlParameter ControlID="SearchByTitleTextBox" Name="?" PropertyName="Text" DefaultValue="Army Of Darkness" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MediaID" DataSourceID="SqlDataSource1" EmptyDataText="No Results Found" Visible="False">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="MediaID" DataNavigateUrlFormatString="MediaDetails.aspx?id={0}" DataTextField="MediaName" HeaderText="Media Name" />
        </Columns>
    </asp:GridView>
        </div>

</asp:Content>

