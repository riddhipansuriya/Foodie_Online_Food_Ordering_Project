<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Foodie.User.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="book_section layout_padding">
    <div class="container">
        <div class="heading container">
            <div class="align-self-end">
                <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
            </div>
            <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
        </div>

        <div class="form_container">
            <!-- Column 1 -->
            <div class="col-md-6">
                <div>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                        placeholder="Enter Full Name" ToolTip="Full Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server"
                        ErrorMessage="Name is required" ControlToValidate="txtName"
                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revName" runat="server"
                        ErrorMessage="Name must be in characters only"
                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                        ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtName"></asp:RegularExpressionValidator>
                </div>

                <div>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"
                        placeholder="Enter Username" ToolTip="Username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                        ErrorMessage="Username is required" ControlToValidate="txtUsername"
                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>

                <div>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"
                        placeholder="Enter Email" ToolTip="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ErrorMessage="Email is required" ControlToValidate="txtEmail"
                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>

                <div>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"
                        placeholder="Enter Mobile Number" ToolTip="Mobile Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server"
                        ErrorMessage="Mobile No. is required" ControlToValidate="txtMobile"
                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revMobile" runat="server"
                        ErrorMessage="Mobile No. must have 10 digits"
                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                        ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                </div>
            </div>

            <!-- Column 2 -->
            <div class="col-md-6">
                <div>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"
                        placeholder="Enter Address" ToolTip="Address" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                        ErrorMessage="Address is required" ControlToValidate="txtAddress"
                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>

                <div>
                    <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control"
                        placeholder="Enter Post/Zip Code" ToolTip="Post/Zip Code"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPostCode" runat="server"
                        ErrorMessage="Post/Zip Code is required" ControlToValidate="txtPostCode"
                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPostCode" runat="server"
                        ErrorMessage="Post/Zip Code must be of 6 digits"
                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                        ValidationExpression="^[0-9]{6}$" ControlToValidate="txtPostCode"></asp:RegularExpressionValidator>
                </div>

                <div>
                    <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control"
                        ToolTip="User Image" onchange="ImagePreview(this);" />
                </div>

                <div>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"
                        placeholder="Enter Password" ToolTip="Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ErrorMessage="Password is required" ControlToValidate="txtPassword"
                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!-- Buttons -->
            <div class="row pl-4">
                <div class="btn_box">
                    <asp:Button ID="btnRegister" runat="server"
                        Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                        OnClick="btnRegister_Click" />
                    <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100"
                        Text="Already registered? &lt;a href='Login.aspx' class='badge badge-info'&gt;Login here..&lt;/a&gt;"></asp:Label>
                </div>
            </div>

            <!-- Image Preview -->
            <div class="row p-5">
                <div style="align-items: center">
                    <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                </div>
            </div>
        </div>
    </div>
</section>

</asp:Content>
