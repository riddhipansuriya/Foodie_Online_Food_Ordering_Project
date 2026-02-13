<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="viewDetails.aspx.cs" Inherits="Foodie.User.viewDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* MAIN PRODUCT DETAILS BOX */
        .details-box {
            width: 450px;
            background: #fff;
            padding: 30px;
            margin-top: 40px;
            border-radius: 18px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
            text-align: center;
        }

            /* PRODUCT IMAGE */
            .details-box img {
                width: 180px !important;
                height: 180px !important;
                border-radius: 14px;
                object-fit: cover;
                margin-bottom: 20px;
            }

            /* LABEL TITLES */
            .details-box strong {
                font-size: 17px;
                color: #333;
            }

            /* PRODUCT TEXT */
            .details-box .value {
                font-size: 16px;
                color: #444;
                font-weight: 600;
            }

            /* SPACING */
            .details-box p {
                margin: 10px 0;
                line-height: 1.4;
            }

        /* REMOVE DEFAULT DATALIST TABLE LOOK */
        #DataList1 table {
            background: transparent !important;
            border: none !important;
            width: 100% !important;
        }

        #DataList1 td {
            border: none !important;
            background: transparent !important;
        }

        /* OPTIONAL: BACK BUTTON STYLE (if you add one later) */
        .btn-back {
            margin-top: 20px;
            display: inline-block;
            background: #ff9800;
            padding: 10px 18px;
            color: white;
            font-weight: 700;
            border-radius: 10px;
            text-decoration: none;
            transition: .25s;
        }

            .btn-back:hover {
                background: #e68900;
                transform: scale(1.05);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>
            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" >
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <ItemStyle ForeColor="#000066" />
                <ItemTemplate>
                    <div class="details-box">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' />

                        <p>
                            <strong>Product Name:</strong><br>
                            <span class="value"><%# Eval("Name") %></span>
                        </p>

                        <p>
                            <strong>Description:</strong><br>
                            <span class="value"><%# Eval("Description") %></span>
                        </p>

                        <p>
                            <strong>Price:</strong><br>
                            <span class="value">₹ <%# Eval("Price") %></span>
                        </p>
                    </div>
                </ItemTemplate>

                <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                
            </asp:DataList>
            <br>
            <br>
        </center>
    </div>

</asp:Content>
