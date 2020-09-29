<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Your Profile</h2>
    <section class="LoginIDsection">
        <asp:Label ID="ProfileLoginID" runat="server" Text="" CssClass="LoginLabel"></asp:Label>
        <asp:button runat="server" text="Log Out" ID="LogOutButton" CssClass="LogOutButton" OnClick="LogOutButton_Click" Visible="False" />
    </section>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT UserFirstName, UserLastName, [Password], UserName, UserID FROM USERINFO WHERE (UserID = ?)">
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="ProfileGridView" runat="server" CssClass="ProfileGridView" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="UserID">
        <Columns>
            <asp:BoundField DataField="UserFirstName" HeaderText="UserFirstName" SortExpression="UserFirstName" />
            <asp:BoundField DataField="UserLastName" HeaderText="UserLastName" SortExpression="UserLastName" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
        </Columns>
    </asp:GridView>

    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="hyperlink" NavigateUrl="UpdateInfo.aspx">Edit or Delete Information</asp:HyperLink>
    
</asp:Content>

