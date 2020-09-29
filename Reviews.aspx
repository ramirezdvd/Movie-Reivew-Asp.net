<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reviews.aspx.cs" Inherits="Reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Entertainment Reviews</h2>
     <section class="LoginIDsection">
        <asp:Label ID="ReviewsLoginID" runat="server" CssClass="LoginLabel"></asp:Label>
        <asp:button runat="server" text="Log Out" ID="LogOutButton" CssClass="LogOutButton" OnClick="LogOutButton_Click" Visible="False" />
    </section>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT MEDIA.MediaID, MEDIA.MediaName, USERINFO.UserID, USERINFO.UserLastName, REVIEW.ReviewID, REVIEW.ReviewTitle, REVIEW.ReviewSummary, REVIEW.NumberOfStars FROM (MEDIA INNER JOIN REVIEW ON MEDIA.MediaID = REVIEW.MediaID_FK), USERINFO
WHERE USERINFO.UserID=REVIEW.UserID_FK
ORDER BY MEDIA.MediaName
"></asp:SqlDataSource>
    <section>
        <asp:GridView ID="ReviewGridView" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="ReviewGridView">
            <Columns>
                <asp:BoundField DataField="MediaName" HeaderText="MediaName" SortExpression="MediaName" />
                <asp:BoundField DataField="UserLastName" HeaderText="UserLastName" SortExpression="UserLastName" />
                <asp:BoundField DataField="ReviewTitle" HeaderText="ReviewTitle" SortExpression="ReviewTitle" />
                <asp:BoundField DataField="ReviewSummary" HeaderText="ReviewSummary" SortExpression="ReviewSummary" />
                <asp:BoundField DataField="NumberOfStars" HeaderText="NumberOfStars" SortExpression="NumberOfStars" />
            </Columns>
        </asp:GridView>
    </section>

    <section>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="AddReview.aspx" CssClass="hyperlink">Add Review</asp:HyperLink>
    </section>
</asp:Content>

