<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Cart_View.aspx.cs" Inherits="Foodie.User.Cart_View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Cart View</title>
    <style>
    /* Body styling */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }

    /* Cart container */
    center {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 30px;
    }

    /* GridView table styling */
    #gvCart {
        border-collapse: separate;
        border-spacing: 0;
        width: 95%;       /* make table bigger */
        max-width: 1200px; /* max width for large screens */
        box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        border-radius: 15px;
        overflow: hidden;
        background-color: #fff;
        font-size: 16px;
    }

    #gvCart th {
        background: linear-gradient(to right, #ff9800, #ffb74d); /* gradient header */
        color: #fff;
        padding: 15px;
        font-weight: bold;
        text-transform: uppercase;
        font-size: 16px;
    }

    #gvCart td {
        border-bottom: 1px solid #eee;
        padding: 15px;
        text-align: center;
        vertical-align: middle;
        background-color: #fff8e1; /* light cream/yellow row */
        transition: background 0.3s;
    }

    #gvCart tr:hover td {
        background-color: #fff3e0; /* hover effect */
    }

    /* Product images */
    #gvCart img {
        border-radius: 10px;
        width: 100px;
        height: 100px;
        object-fit: cover;
        transition: transform 0.3s;
    }

    #gvCart img:hover {
        transform: scale(1.05); /* slight zoom on hover */
    }

    /* Quantity input */
    #gvCart input[type="text"], #gvCart input[type="number"] {
        width: 70px;
        text-align: center;
        padding: 6px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    /* Buttons styling */
    input[type="submit"], .btn, .aspNetButton, .btn-update, #back_btn, #update_cart_btn {
        background-color: #ff9800; /* same as Book Order button */
        color: #fff;
        border: none;
        padding: 12px 25px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 8px;
        font-weight: bold;
        transition: all 0.3s;
        margin: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    input[type="submit"]:hover, .btn:hover, .aspNetButton:hover, #back_btn:hover, #update_cart_btn:hover {
        background-color: #fb8c00; /* slightly darker orange */
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(0,0,0,0.15);
    }

    /* Final total label */
    #lblFinalTotal {
        color: #d84315; /* dark orange/red */
        font-size: 22px;
        font-weight: bold;
        margin-top: 25px;
    }

    /* Remove link styling */
    #gvCart a {
        color: #f44336; /* red for remove */
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s;
    }

    #gvCart a:hover {
        text-decoration: underline;
        color: #d32f2f;
    }
</style>



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>

        <asp:GridView ID="gvCart" runat="server" DataKeyNames="Id" AutoGenerateColumns="False" OnRowCommand="gvCart_RowCommand" >
            <Columns>
                <asp:TemplateField HeaderText="Product Name">
                    <ItemTemplate>
                        <asp:Label ID="lblProdName" runat="server" Text='<%# Eval("Prod_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="imgProd" runat="server" Height="100" Width="100" ImageUrl='<%# Eval("Prod_Image") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Prod_Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Prod_Quantity") %>' Width="50px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Total">
                    <ItemTemplate>
                        <asp:Label ID="lblTotal" runat="server"
                            Text='<%# Convert.ToDecimal(Eval("Prod_Price")) * Convert.ToInt32(Eval("Prod_Quantity")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Remove">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkRemove" runat="server" CommandName="RemoveItem"
                            CommandArgument='<%# Eval("Id") %>' ForeColor="Red">Remove</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <br />
        <asp:Label ID="lblFinalTotal" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
        <br />
        <br />
        <asp:Button ID="update_cart_btn" runat="server" Text="Update Cart" OnClick="update_cart_btn_Click" />
        <asp:Button ID="back_btn" runat="server" Text="Back To Menu Page" OnClick="back_btn_Click" />
        <br />
        <br />
    </center>
</asp:Content>
