<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Foodie.User.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
center {
    width: 90%;
    margin: auto;
}

/* --- GridView Styling --- */
.fruit-grid {
    width: 80%;
    border-collapse: collapse;
    margin-bottom: 20px;
    font-family: 'Segoe UI';
    text-align: center;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
}

.fruit-grid th {
    background-color: #ffbe33;
    color: white;
    padding: 10px;
    font-size: 16px;
}

.fruit-grid td {
    border: 1px solid #ddd;
    padding: 10px;
    font-size: 15px;
}

/* --- Total Amount --- */
.total-label {
    font-size: 22px;
    color: #222;
    margin-top: 10px;
    display: inline-block;
}

/* --- Section Blocks --- */
.section {
    margin-top: 25px;
}

.textbox {
    width: 60%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #bbb;
    font-size: 14px;
}

/* --- Payment Options --- */
#rblPaymentMethod {
    font-family: 'Segoe UI';
    font-size: 15px;
}

/* --- Place Order Button --- */
.btn-primary {
    background-color: #ffbe33 !important;
    border: none !important;
    padding: 10px 25px;
    font-size: 18px;
    font-family: 'Segoe UI';
    border-radius: 25px;
    cursor: pointer;
    transition: 0.3s;
}

.btn-primary:hover {
    background-color: #ffbe33 !important;
}

/* --- Message Label --- */
.message {
    display: block;
    margin-top: 10px;
    font-weight: bold;
    color: green;
}

</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <h1>Order Summary</h1>
    <br />
    <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="fruit-grid">
        <Columns>
            <asp:TemplateField HeaderText="Product">
                <ItemTemplate>
                    <asp:Label ID="lblProdName" runat="server" Text='<%# Eval("Prod_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Prod_Price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Prod_Quantity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Total">
                <ItemTemplate>
                    <asp:Label ID="lblTotal" runat="server"
                        Text='<%# Convert.ToDecimal(Eval("Prod_Price")) * Convert.ToInt32(Eval("Prod_Quantity")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <div class="section">
        <asp:Label ID="lblFinalTotal" runat="server" CssClass="total-label" Font-Bold="true" Font-Size="Large"></asp:Label>
    </div>

    <div class="section">
        <h2>Shipping Address</h2>
        <asp:TextBox ID="txtShippingAddress" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="3"
            placeholder="Enter your shipping address"></asp:TextBox>
    </div>

    <div class="section">
        <h2>Payment Method</h2>
        <asp:RadioButtonList ID="rblPaymentMethod" runat="server">
            <asp:ListItem Text="Cash on Delivery" Value="Cash" Selected="True"></asp:ListItem>
            <asp:ListItem Text="Debit Card" Value="Debit"></asp:ListItem>
            <asp:ListItem Text="UPI" Value="UPI"></asp:ListItem>
        </asp:RadioButtonList>
    </div>

    <div class="section" style="text-align: center;">
        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="btn btn-primary" OnClick="btnPlaceOrder_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
    </div>
        </center>
</asp:Content>
