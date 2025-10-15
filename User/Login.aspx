<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Foodie.User.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .login_section {
    min-height: 80vh; /* almost full viewport height */
    display: flex;
    justify-content: center; /* horizontal center */
    align-items: center;     /* vertical center */
    background-color: #f8f9fa; /* light background */
    padding: 50px 0;
}

.form_container {
    background: #fff; /* white form background */
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
}

    </style>
    <section class="login_section layout_padding" runat="server">
    <div class="container" runat="server">
        <div class="heading_container" runat="server">
            <h2>User Login</h2>
        </div>

        <div class="row justify-content-center" runat="server">
            <div class="col-md-6">
                <div class="form_container" runat="server">
                    <!-- Email -->
                    <div class="form-group" runat="server">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                            placeholder="Enter Email" ToolTip="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ErrorMessage="Email is required" ControlToValidate="txtEmail"
                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </div>

                    <!-- Password -->
                    <div class="form-group" runat="server">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" 
                            placeholder="Enter Password" TextMode="Password" ToolTip="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                            ErrorMessage="Password is required" ControlToValidate="txtPassword"
                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                        </asp:RequiredFieldValidator>
                    </div>

                    <!-- Message -->
                    <div class="form-group" runat="server">
                        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                    </div>

                    <!-- Button -->
                    <div class="form-group" runat="server">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary"
                            OnClick="btnLogin_Click" />
                    </div>

                    <!-- Register link -->
                    <div class="form-group" runat="server">
                        <span>Don't have an account? 
                            <a href="Registration.aspx" class="badge badge-info">Register here</a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</asp:Content>
