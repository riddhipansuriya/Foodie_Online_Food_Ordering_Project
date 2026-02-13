<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Cart_View.aspx.cs" Inherits="Foodie.User.Cart_View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Cart View</title>
    <style>
  
/* Cart container */
center {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 30px;
}

/* GridView table styling */
#gvCart {
    border-collapse: collapse !important;  /* Remove all borders */
    width: 95%;
    max-width: 1200px;
    background-color: #fff;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 6px 20px rgba(0,0,0,0.12);
    font-size: 16px;
    border: none !important; /* Extra safety */
}

/* Header Styling */
#gvCart th {
    background: linear-gradient(to right, #ff9800, #ffa726);
    color: #fff;
    padding: 15px;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 16px;
    border: none !important;
}

/* Table Body Styling */
#gvCart td {
    padding: 15px;
    text-align: center;
    vertical-align: middle;
    background-color: #fffdf3;
    border: none !important;
    transition: background 0.3s;
}

/* Hover effect */
#gvCart tr:hover td {
    background-color: #fff7e6;
}

/* Product images */
#gvCart img {
    border-radius: 10px;
    width: 100px;
    height: 100px;
    object-fit: cover;
    transition: transform 0.3s;
    border: none;
}

#gvCart img:hover {
    transform: scale(1.05);
}

/* Quantity input */
#gvCart input[type="text"], 
#gvCart input[type="number"] {
    width: 70px;
    text-align: center;
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
}

/* Buttons */
input[type="submit"], 
.btn, 
.aspNetButton, 
#back_btn, 
#update_cart_btn, 
#checkout_btn {
    background-color: #ff9800;
    color: #fff;
    border: none;
    padding: 12px 25px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 8px;
    font-weight: bold;
    transition: 0.3s;
    margin: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

input[type="submit"]:hover, 
.btn:hover, 
.aspNetButton:hover, 
#back_btn:hover, 
#update_cart_btn:hover, 
#checkout_btn:hover {
    background-color: #fb8c00;
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(0,0,0,0.15);
}

/* Final total label */
#lblFinalTotal {
    color: #e65100;
    font-size: 22px;
    font-weight: bold;
    margin-top: 25px;
}

/* Remove link */
#gvCart a {
    color: #e53935;
    text-decoration: none;
    font-weight: bold;
    transition: 0.3s;
    border: none;
}

#gvCart a:hover {
    color: #b71c1c;
    text-decoration: underline;
}

/* Make all buttons stay in one horizontal line */
.button-row {
    display: flex;
    gap: 15px;
    justify-content: center;
    margin-top: 20px;
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
        <div class="button-row">
        <asp:Button ID="update_cart_btn" runat="server" Text="Update Cart" OnClick="update_cart_btn_Click" />
        <asp:Button ID="checkout_btn" runat="server" Text="Checkout" OnClick="checkout_btn_Click"  />
        <asp:Button ID="back_btn" runat="server" Text="Back To Menu Page" OnClick="back_btn_Click" />
            </div>
        <br />
        <br />
    </center>
</asp:Content>
