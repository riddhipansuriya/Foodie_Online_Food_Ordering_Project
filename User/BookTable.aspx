<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="BookTable.aspx.cs" Inherits="Foodie.User.BookTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        /* Form container */
        .form-group {
            max-width: 1000px;
            margin: 0 auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
        }

        /* All inputs */
        .form-control {
            width: 100%;
            padding: 12px 15px;
            margin: 12px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
            transition: 0.3s;
        }

            /* Focus effect */
            .form-control:focus {
                border-color: #ffbe33;
                outline: none;
                box-shadow: 0 0 5px rgba(255,190,51,0.5);
            }

        /* Dropdown special styling */
        .nice-select.wide {
            background-color: #fff;
            height: 45px;
        }

        /* Button */
        .btn_box {
            text-align: center;
            margin-top: 15px;
        }

        .btn-primary {
            background: #ffbe33 !important;
            border: none !important;
            padding: 12px 30px;
            font-size: 16px;
            border-radius: 30px;
            cursor: pointer;
            transition: .3s;
            color: white;
            font-weight: 600;
        }

            .btn-primary:hover {
                background: #e0a400 !important;
                transform: scale(1.05);
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1>Book A Table</h1>
    </center>
    <div class="form-group">
        <div>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Your Name"></asp:TextBox>
        </div>

        <div>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Phone Number"></asp:TextBox>
        </div>

        <div>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" Placeholder="Your Email"></asp:TextBox>
        </div>

        <div>
            <asp:DropDownList ID="ddlPersons" runat="server" CssClass="form-control nice-select wide">
                <asp:ListItem Text="How many persons?" Value="" Selected="True" Disabled="True"></asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div>
            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>

        <div class="btn_box">
            <asp:Button ID="btnBook" runat="server" Text="Book Now" CssClass="btn btn-primary" OnClick="btnBook_Click" />
        </div>

        
    </div>
    <br />
</asp:Content>


