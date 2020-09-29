<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchByCategory.aspx.cs" Inherits="SearchByCategorie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h2>Entertainment Search</h2>
    <h3>by Category</h3>
    <section class="LoginIDsection">
        <asp:Label ID="SearchByCategoryLoginID" runat="server" Text="" CssClass="LoginLabel"></asp:Label>
        <asp:button runat="server" text="Log Out" ID="LogOutButton" CssClass="LogOutButton" OnClick="LogOutButton_Click" Visible="False" />
    </section>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT CategoryID, CategoryName FROM CATEGORY ORDER BY CategoryName"></asp:SqlDataSource>
    <label for="CategoryDropDownList">Please Choose a Category:</label>
    <asp:DropDownList ID="CategoryDropDownList" runat="server" CssClass="ddList" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryID">
        <asp:ListItem Value="0">Choose a categorie:</asp:ListItem>
     </asp:DropDownList>
    <asp:Button ID="SearchForFilmByCategoryButton" runat="server" CssClass="searchbuttonCategory" Text="Search" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT CATEGORY.*, MEDIA.*, MEDIA_CATEGORY.* FROM ((CATEGORY INNER JOIN MEDIA_CATEGORY ON CATEGORY.CategoryID = MEDIA_CATEGORY.CategoryID) INNER JOIN MEDIA ON MEDIA_CATEGORY.MediaID = MEDIA.MediaID)
WHERE (CATEGORY.CategoryID=?) 
ORDER BY Media.MediaName">
        <SelectParameters>
            <asp:ControlParameter ControlID="CategoryDropDownList" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
            <asp:HyperLinkField DataNavigateUrlFields="MEDIA.MediaID" DataNavigateUrlFormatString="MediaDetails.aspx?id={0}" DataTextField="MediaName" HeaderText="Title" />
        </Columns>
    </asp:GridView>
</asp:Content>

