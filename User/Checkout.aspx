<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Foodie.User.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Order Summary</h1>
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

</asp:Content>
