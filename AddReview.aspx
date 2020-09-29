<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddReview.aspx.cs" Inherits="AddReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Add Review</h2>
     <section class="LoginIDsection">
        <asp:Label ID="AddReviewLoginID" runat="server" Text="" CssClass="LoginLabel"></asp:Label>
        <asp:button runat="server" text="Log Out" ID="LogOutButton" CssClass="LogOutButton" OnClick="LogOutButton_Click" Visible="False" />
     </section>
    <section class="AddReviewControlsSection">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [MediaID], [MediaName] FROM [MEDIA] ORDER BY [MediaName]"></asp:SqlDataSource>
        <asp:Label ID="FilmReviewDropDownLabel" runat="server" Text="Select a Film to Review" CssClass="AddReviewControlsLabel"></asp:Label>
        <asp:DropDownList ID="FilmReviewDropDownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="MediaName" DataValueField="MediaID" CssClass="FilmReviewDropDownList"></asp:DropDownList>
    </section>

    <section class="AddReviewControlsSection">
        <ul class="AddReviewControlsul">
            <li class="AddReviewControlsli">
                <asp:Label ID="ReviewTitleLabel" runat="server" Text="Review Title" CssClass="AddReviewControlsLabel"></asp:Label>
                <asp:TextBox ID="ReviewTitleTextBox" runat="server" CssClass="ReviewTitleTextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a title" ControlToValidate="ReviewTitleTextBox" CssClass="ValidationLabel" Display="Dynamic"></asp:RequiredFieldValidator>
            </li>
    

            <li class="AddReviewControlsli">
                <asp:Label ID="ReviewSummaryLabel" runat="server" Text="Review Summary" CssClass="AddReviewControlsLabel"></asp:Label>
                <asp:TextBox ID="ReviewSummaryTextBox" runat="server" CssClass="SummaryTextBox" TextMode="MultiLine" ControlToValidate="ReviewSummaryTextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a summary" ControlToValidate="ReviewSummaryTextBox" CssClass="ValidationLabel" Display="Dynamic"></asp:RequiredFieldValidator>
            </li>

            <li class="AddReviewControlsli">
                <asp:Label ID="NumberOfStarsLabel" runat="server" Text="Number Of Stars (0-5)" CssClass="AddReviewControlsLabel"></asp:Label>
                <asp:TextBox ID="NumberOfStarsTextBox" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="NumberOfStarsTextBox" CssClass="ValidationLabel" CultureInvariantValues="True" Display="Dynamic" ErrorMessage="Must be a number" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                <asp:Button ID="ReviewInsertButton" runat="server" Text="Insert" OnClick="ReviewInsertButton_Click" />
                
            </li>
        </ul>
                
    </section>

    <section class="AddReviewControlsSection">
        <asp:Label ID="ErrorLabel" runat="server" Text="" CssClass="AddReviewControlErrorLabel"></asp:Label>
    </section>


</asp:Content>

