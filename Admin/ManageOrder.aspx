<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageOrder.aspx.cs" Inherits="Foodie.Admin.ManageOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        .main-section {
            padding: 30px 20px;
            background: #f4fbfb; /* Light teal background */
            min-height: 100vh;
        }

        h2 {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #39ADB5; /* Main theme color */
            margin-bottom: 25px;
            letter-spacing: 1px;
        }

        .order-grid {
            width: 100%;
            border-collapse: collapse;
            background: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            border: 2px solid #39ADB5; /* Theme border */
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

            .order-grid th {
                background: #39ADB5;
                color: #ffffff;
                padding: 12px;
                font-size: 15px;
                font-weight: 600;
                text-transform: uppercase;
            }

            .order-grid td {
                padding: 10px;
                font-size: 14px;
                color: #333;
                border-bottom: 1px solid #cdecef;
            }

            .order-grid tr:nth-child(even) {
                background: #e9f7f8; /* Soft teal */
            }

            .order-grid tr:hover {
                background: #d3f1f3;
                transition: 0.2s;
            }

        .order-container {
            width: 90%;
            margin: auto;
            padding-top: 20px;
        }
    </style>

    <div class="main-section">
        <div class="order-container">

            <h2>Manage Orders</h2>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="order-grid">
                <columns>

                    <asp:TemplateField HeaderText="Order ID">
                        <itemtemplate>
                            <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("Order_Id") %>'></asp:Label>
                        </itemtemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="User ID">
                        <itemtemplate>
                            <asp:Label ID="lblUserId" runat="server" Text='<%# Eval("User_Id") %>'></asp:Label>
                        </itemtemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Order Date">
                        <itemtemplate>
                            <asp:Label ID="lblOrderDate" runat="server" Text='<%# Eval("Order_Date", "{0:dd-MM-yyyy}") %>'></asp:Label>
                        </itemtemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Total Amount">
                        <itemtemplate>
                            <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Total_Amount") %>'></asp:Label>
                        </itemtemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Order Status">
                        <itemtemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Order_Status") %>'></asp:Label>
                        </itemtemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Shipping Address">
                        <itemtemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Shipping_Address") %>'></asp:Label>
                        </itemtemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Payment Method">
                        <itemtemplate>
                            <asp:Label ID="lblPayment" runat="server" Text='<%# Eval("Payment_Method") %>'></asp:Label>
                        </itemtemplate>
                    </asp:TemplateField>

                </columns>
            </asp:GridView>

        </div>
    </div>


</asp:Content>
