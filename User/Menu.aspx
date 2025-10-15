<%@ Page Title="Menu" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Foodie.User.Menu" %>

<%--<form id="form1" runat="server">--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1>Our Menu</h1>


        <div>
            <center>
                <h1>Available Product In store</h1>
                <p>
                    <asp:Button ID="Button1" runat="server" Text="View Cart" OnClick="Button1_Click1" />
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </p>
                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Both" Height="50px" Width="900px">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <ItemStyle ForeColor="#000066" />
                    <ItemTemplate>
                        <div class="product-box">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="100" Height="100" />
                            <br />
                            <strong>Product Name:</strong>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' />
                            <br />
                            <strong>Description:</strong>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>' />
                            <br />
                            <strong>Price:</strong>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>' />
                            <br />
                            <asp:LinkButton ID="btnViewDetails" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_view" Text="View Details" />
                            <br />
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_add" Text="Add to Cart" />
                        </div>
                    </ItemTemplate>


                    <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
            </center>
        </div>
        <div style="width: 99%; padding: 10px;">
            <asp:LinkButton ID="LinkButton1" runat="server" Style="float: left;" OnClick="LinkButton1_Click1" BackColor="#FFCC00">Previous</asp:LinkButton>
            <asp:LinkButton ID="LinkButton2" runat="server" Style="float: right;" OnClick="LinkButton2_Click1" BackColor="#FFCC00">Next</asp:LinkButton>
        </div>
        <br />
        <br />

    </center>
</asp:Content>
<%--   </form>--%>