<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="viewDetails.aspx.cs" Inherits="Foodie.User.viewDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Both">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <ItemStyle ForeColor="#000066" />
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Height="100" Width="100" />
                    <br>
                    <br>
                    <br>
                    <br></br>
                    Product Name:
                     <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    <br>
                    <br>
                    Product Description:
                     <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    <br>
                    <br>
                    Price:
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                    <br>
                    <br>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
        </center>
    </div>

</asp:Content>
