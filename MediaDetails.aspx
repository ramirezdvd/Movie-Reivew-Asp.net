<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MediaDetails.aspx.cs" Inherits="FilmDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section class="LoginIDsection">
        <asp:Label ID="MediaDetailsLoginID" runat="server" Text="" CssClass="LoginLabel"></asp:Label>
        <asp:button runat="server" text="Log Out" ID="LogOutButton" CssClass="LogOutButton" OnClick="LogOutButton_Click" Visible="False" />
    </section>
    <link href="desktop.css" rel="stylesheet" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [MediaID], [MediaName] FROM [MEDIA] WHERE ([MediaID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MediaID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <section>
            <asp:GridView ID="GridView2" runat="server" CssClass="TitleGridview" AutoGenerateColumns="False" DataKeyNames="MediaID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="MediaName" HeaderText="MediaName" SortExpression="MediaName" />
                </Columns>
    </asp:GridView>
</section>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [MediaImage], [YearReleased], [MediaID], [Summary] FROM [MEDIA] WHERE ([MediaID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MediaID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <section>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MediaID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:ImageField DataAlternateTextField="MediaImage" DataAlternateTextFormatString="Images of {0}" DataImageUrlField="MediaImage" DataImageUrlFormatString="images/{0}" >
            </asp:ImageField>
            <asp:BoundField DataField="YearReleased" HeaderText="Year Released" SortExpression="YearReleased" />
            <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary" />
        </Columns>
    </asp:GridView>
    </section>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT AVG(NumberOfStars)
FROM REVIEW
WHERE MediaID_FK=?">
        <SelectParameters>
            <asp:QueryStringParameter Name="?" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
   <section>
    <asp:GridView ID="RatingGridView" runat="server" CssClass="RatingGridView" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:BoundField DataField="Expr1000" HeaderText="Average Number of Stars" ReadOnly="True" SortExpression="Expr1000" DataFormatString="{0:F1}" />
        </Columns>
    </asp:GridView>
</section>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ACTOR.ActorID, ACTOR.ActorName, ACTOR.ActorImage, MEDIA.MediaID, MEDIA.MediaName, MOVIE_TVSHOW_ACTOR.MediaID AS Expr1, MOVIE_TVSHOW_ACTOR.ActorID AS Expr2 FROM ((ACTOR INNER JOIN MOVIE_TVSHOW_ACTOR ON ACTOR.ActorID = MOVIE_TVSHOW_ACTOR.ActorID) INNER JOIN MEDIA ON MOVIE_TVSHOW_ACTOR.MediaID = MEDIA.MediaID) WHERE (MOVIE_TVSHOW_ACTOR.MediaID = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="?" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>

      
    <section>
         <asp:GridView ID="GridView4" runat="server" CssClass="RatingGridView" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
        <Columns>
            <asp:BoundField DataField="ActorName" SortExpression="ActorName" HeaderText="Starring:" />
            <asp:ImageField DataAlternateTextField="ActorImage" DataAlternateTextFormatString="Image of {0}" DataImageUrlField="ActorImage" DataImageUrlFormatString="ActorsImages/{0}" ControlStyle-CssClass="actorimage">
            </asp:ImageField>
        </Columns>
    </asp:GridView>
    </section>
       <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT MEDIA.MediaID, MEDIA.MediaName, REVIEW.ReviewID, REVIEW.ReviewTitle, REVIEW.ReviewSummary, REVIEW.NumberOfStars, REVIEW.UserID_FK, REVIEW.MediaID_FK, USERINFO.UserID, USERINFO.UserName FROM (MEDIA INNER JOIN REVIEW ON MEDIA.MediaID = REVIEW.MediaID_FK), USERINFO
WHERE  MediaID = ? AND USERINFO.UserID = REVIEW.UserID_FK">
           <SelectParameters>
               <asp:QueryStringParameter Name="?" QueryStringField="id" />
           </SelectParameters>
        </asp:SqlDataSource>

      
    <section>
         <asp:GridView ID="ReviewGridView" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" CssClass="ReviewGridView">
            <Columns>
                <asp:BoundField DataField="MediaName" HeaderText="Title" SortExpression="MediaName" />
                <asp:BoundField DataField="ReviewTitle" HeaderText="Review Title" SortExpression="ReviewTitle" />
                <asp:BoundField DataField="ReviewSummary" HeaderText="Review Summary" SortExpression="ReviewSummary" />
                <asp:BoundField DataField="NumberOfStars" HeaderText="Number Of Stars" SortExpression="NumberOfStars" />
                <asp:BoundField DataField="UserName" HeaderText="User" SortExpression="UserName" />
            </Columns>
        </asp:GridView>
    </section>
    <section>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="AddReview.aspx" CssClass="hyperlink">Add Review</asp:HyperLink>
    </section>
</asp:Content>

