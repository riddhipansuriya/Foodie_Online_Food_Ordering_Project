<%@ Page Title="Menu" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Foodie.User.Menu" %>

<%--<form id="form1" runat="server">--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #welcome-box {
            padding: 12px 20px;
            background: #fff3e0;
            border-left: 5px solid #ff9800;
            width: fit-content;
            border-radius: 10px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 15px;
        }

            /* Welcome text */
            #welcome-box .welcome-text {
                font-size: 18px;
                font-weight: 600;
                color: #444;
            }

            /* View Cart button */
            #welcome-box .view-cart-btn {
                padding: 10px 20px;
                background: #ff9800;
                color: white !important;
                border-radius: 8px;
                text-decoration: none;
                font-weight: 600;
                border: none;
                cursor: pointer;
                transition: 0.25s;
            }

                #welcome-box .view-cart-btn:hover {
                    background: #e68900;
                    transform: scale(1.05);
                }

        /* ---------------------------
   REMOVE OUTLINE FROM DATALIST
---------------------------- */
        #DataList1 table {
            border: none !important;
            background: transparent !important;
            box-shadow: none !important;
            width: 100% !important;
        }

        #DataList1 td {
            border: none !important;
            background: transparent !important;
            padding: 18px !important;
        }

        /* ---------------------------
   PRODUCT CARD
---------------------------- */
        .product-box {
            background: white;
            width: 250px;
            padding: 20px;
            border-radius: 18px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            text-align: center;
            transition: 0.25s ease;
        }

            .product-box:hover {
                transform: translateY(-6px);
                box-shadow: 0 8px 18px rgba(0,0,0,0.18);
            }

            .product-box img {
                border-radius: 12px;
                width: 120px !important;
                height: 120px !important;
                object-fit: cover;
                margin-bottom: 8px;
            }

        strong {
            color: #444;
            font-size: 15px;
        }

        /* Buttons inside product card */
        .product-box a,
        .product-box .aspNetLinkButton,
        #LinkButton3,
        #btnViewDetails {
            text-decoration: none !important;
            background: #ff9800;
            padding: 8px 16px;
            color: white !important;
            border-radius: 8px;
            display: inline-block;
            margin-top: 8px;
            transition: 0.25s;
            font-weight: 600;
        }

            .product-box a:hover,
            #btnViewDetails:hover,
            #LinkButton3:hover {
                background: #e68900;
                transform: scale(1.05);
            }

        /* ---------------------------
   PAGINATION BUTTONS
---------------------------- */
        #LinkButton1,
        #LinkButton2 {
            background: #ffcc00 !important;
            color: black !important;
            font-weight: 700;
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            transition: 0.25s;
        }

            #LinkButton1:hover,
            #LinkButton2:hover {
                background: #e6b800 !important;
                transform: translateY(-2px);
            }

        .pagination-wrap {
            width: 99%;
            padding: 10px;
            display: flex;
            justify-content: space-between; /* pushes prev to left, next to right */
            align-items: center;
            box-sizing: border-box;
        }

        .pag-btn {
            background: #ffcc00;
            color: #111 !important;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 700;
            text-decoration: none !important;
            border: none;
            cursor: pointer;
            transition: transform .18s ease, background .18s ease;
            display: inline-block;
        }

            .pag-btn:hover {
                background: #e6b800;
                transform: translateY(-2px);
            }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1>Our Menu</h1>


        <div>
            <center>
                <h1>Available Product In store</h1>

                <div id="welcome-box">
                    <span class="welcome-text">
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </span>

                    <asp:Button ID="Button1" runat="server"
                        Text="View Cart" CssClass="view-cart-btn"
                        OnClick="Button1_Click1" />
                </div>

                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal" CellPadding="3" Height="50px" Width="900px">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <ItemStyle ForeColor="#000066" />
                    <ItemTemplate>
                        <div class="product-box">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="100" Height="100" />
                            <br />
                            <strong>Product Name:</strong>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' />
                            <%--<br />
                            <strong>Description:</strong>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>' />--%>
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
        <div class="pagination-wrap">
            <div class="pagination-wrap">
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="pag-btn" OnClick="LinkButton1_Click1">Previous</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="pag-btn" OnClick="LinkButton2_Click1">Next</asp:LinkButton>
            </div>

        </div>
        <br />
        <br />

    </center>
</asp:Content>
<%--   </form>--%>