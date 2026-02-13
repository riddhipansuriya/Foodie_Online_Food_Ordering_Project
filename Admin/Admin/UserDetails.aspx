<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="Foodie.Admin.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

<style>
    .main-section {
        padding: 30px 20px;
        background: #f4fbfb; /* Light teal white background */
        min-height: 100vh;
    }

    h2.text-center {
        text-align: center;
        font-size: 28px;
        font-weight: bold;
        color: #39ADB5; /* Main theme color */
        margin-bottom: 25px;
        letter-spacing: 1px;
    }

    .gridview {
        width: 100%;
        border-collapse: collapse;
        background: #ffffff;
        border-radius: 10px;
        overflow: hidden;
        border: 2px solid #39ADB5; /* Theme border */
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    }

    .gridview th {
        background: #39ADB5;  /* Theme header */
        color: #ffffff;
        padding: 12px;
        font-size: 15px;
        font-weight: 600;
        text-transform: uppercase;
    }

    .gridview td {
        padding: 10px;
        font-size: 14px;
        color: #333;
        border-bottom: 1px solid #cdecef;
    }

    .gridview tr:nth-child(even) {
        background: #e9f7f8; /* Soft teal */
    }

    .gridview tr:hover {
        background: #d3f1f3; /* Slightly darker teal on hover */
        transition: 0.2s;
    }

    .img-box {
        width: 55px;
        height: 55px;
        border-radius: 50%;
        overflow: hidden;
        border: 2px solid #ffbe33; /* Keeping your existing premium yellow */
    }

    .img-box img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .gridview a {
        color: red;
        text-decoration: none;
        font-weight: 600;
    }

    .gridview a:hover {
        text-decoration: underline;
    }
</style>



<div class="main-section">
    <h2 class="text-center">Registered Users</h2>

    <asp:GridView ID="GridView1" runat="server"
        AutoGenerateColumns="False"
        CssClass="gridview"
        Width="100%"
        CellPadding="8"
        OnRowCommand="GridView1_RowCommand">

        <Columns>

            

            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Username">
                <ItemTemplate>
                    <asp:Label ID="lblUsername" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Mobile">
                <ItemTemplate>
                    <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Address">
                <ItemTemplate>
                    <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="PostCode">
                <ItemTemplate>
                    <asp:Label ID="lblPostCode" runat="server" Text='<%# Eval("PostCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Password">
                <ItemTemplate>
                    <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="btnDelete" runat="server"
                        CommandName="cmd_dlt"
                        CommandArgument='<%# Eval("Id") %>'
                        OnClientClick="return confirm('Do you want to delete this user?');"
                        ForeColor="Red">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>

    </asp:GridView>
</div>

</asp:Content>
