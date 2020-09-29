<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateInfo.aspx.cs" Inherits="UpdateInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Edit or Delete Your Information Here!</h2>
    <section class="LoginIDsection">
        <asp:Label ID="UpdateProfileLoginID" runat="server" Text="" CssClass="LoginLabel"></asp:Label>
        <asp:button runat="server" text="Log Out" ID="LogOutButton" CssClass="LogOutButton" OnClick="LogOutButton_Click" Visible="False" />
    </section>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT UserID, UserLastName, UserFirstName, [Password], UserName FROM USERINFO
WHERE UserID = ?" UpdateCommand="UPDATE USERINFO SET UserLastName = ?, UserFirstName = ?, [Password] = ?, UserName = ? WHERE (UserID = ?)" DeleteCommand="DELETE FROM USERINFO WHERE (UserID = ?)" InsertCommand="INSERT INTO USERINFO
(UserLastName, UserFirstName, [Password], UserName) 
values (?,?,?,?)">
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="UpdateProfileDataView" runat="server" AutoGenerateRows="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1" CssClass="UpdateProfileDataView" OnItemUpdated="UpdateProfileDetailsView_ItemUpdated"  EnableModelValidation="False" OnItemDeleted="UpdateProfileDataView_ItemDeleted" OnItemInserted="UpdateProfileDataView_ItemInserted" DefaultMode="Edit">
        <Fields>
            <asp:TemplateField HeaderText="Last Name" SortExpression="UserLastName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserLastName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox1" CssClass="ValidationLabel" Display="Dynamic" ErrorMessage="Must enter a last name"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    
                   <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserLastName") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" CssClass="ValidationLabel" Display="Dynamic" ErrorMessage="Must enter a last name" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserLastName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Name" SortExpression="UserFirstName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UserFirstName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox2" CssClass="ValidationLabel" Display="Dynamic" ErrorMessage="Must enter a first name"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UserFirstName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox2" CssClass="ValidationLabel" Display="Dynamic" ErrorMessage="Must enter a first name"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserFirstName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password" SortExpression="Password">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox3" CssClass="ValidationLabel" Display="Dynamic" ErrorMessage="Must enter a password"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox3" CssClass="ValidationLabel" Display="Dynamic" ErrorMessage="Must enter a password"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UserName" SortExpression="UserName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox4" CssClass="ValidationLabel" Display="Dynamic" ErrorMessage="Must enter username"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBox4" CssClass="ValidationLabel" Display="Dynamic" ErrorMessage="Must enter username"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField >
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClientClick="return confirm('Are you sure?  You will be prompted to log back in to finalize changes.')"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Save" OnClientClick="return confirm('Are you sure?  You will be prompted to log in.')"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Do you really want to delete account?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>

    <section class="UpdateInfoControlsSection">
        <asp:Label ID="UpdateInfoErrorLabel" runat="server" Text="" CssClass="UpdateInfoControlErrorLabel"></asp:Label>
    </section>

    </asp:Content>

