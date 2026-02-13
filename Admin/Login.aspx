<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Foodie.Admin.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4fbfb;
        }
        .login-container {
            width: 400px;
            margin: 100px auto;
            border: 1px solid #39ADB5;
            padding: 30px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }
        .login-container h2 {
            text-align: center;
            color: #39ADB5;
            margin-bottom: 25px;
        }
        .login-container label {
            font-weight: bold;
        }
        .login-container .form-control {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .login-container .btn-login {
            width: 100%;
            padding: 10px;
            background-color: #39ADB5;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .login-container .btn-login:hover {
            background-color: #2f8b97;
        }
        .login-container .error-msg {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container" >
            <h2>Admin Login</h2>

            <asp:Label ID="lblMsg" runat="server" CssClass="error-msg" Visible="false"></asp:Label>

            <label>Username</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>

            <label>Password</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
