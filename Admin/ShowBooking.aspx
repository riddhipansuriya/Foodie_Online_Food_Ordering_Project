<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ShowBooking.aspx.cs" Inherits="Foodie.Admin.ShowBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Container for all bookings */
        #DataList1 {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* center cards horizontally */
            gap: 20px; /* space between cards */
            margin: 30px; /* space around container */
        }

        /* Individual booking card */
        .details-box {
            width: 120%; /* ~2 cards per row */
            min-width: 250px; /* prevents too small on smaller screens */
            background: #cdecef; /* light aqua background */
            color: #39ADB5; /* text color */


            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            text-align: left;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative; /* important: not absolute */
            padding: 12px 20px;
            border-left: 5px solid #ff9800;
            /*width: fit-content;*/
            border-radius: 10px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 15px;
        }

            /* Hover effect */
            .details-box:hover {
                transform: translateY(-5px);
                box-shadow: 0 12px 25px rgba(0,0,0,0.2);
            }

            /* Labels */
            .details-box strong {
                display: block;
                margin-bottom: 3px;
                font-size: 13px;
                opacity: 0.8;
            }

            /* Values */
            .details-box .value {
                display: block; /* ensures each value is on a new line */
                font-size: 15px;
                font-weight: 600;
                margin-bottom: 8px;
            }

            /* Paragraph spacing */
            .details-box p {
                margin: 8px 0;
                line-height: 1.3;
                word-break: break-word; /
            }

        /* Responsive: stack 1 card per row on mobile */
        @media (max-width: 768px) {
            .details-box {
                width: 90%; /* full width on small screens */
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div>
        <center>
            <asp:DataList ID="DataList1" runat="server"
                RepeatDirection="Horizontal"
                RepeatLayout="Flow"
                BorderStyle="None" CellPadding="1">


                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <ItemStyle ForeColor="#000066" />
                <ItemTemplate>
                    <div class="details-box">


                        <p>
                            <strong>Name:</strong><br>
                            <span class="value"><%# Eval("Name") %></span>
                        </p>

                        <p>
                            <strong>Mobile Number:</strong><br>
                            <span class="value"><%# Eval("Number") %></span>
                        </p>

                        <p>
                            <strong>Email:</strong><br>
                            <span class="value"><%# Eval("Email") %></span>
                        </p>

                        <p>
                            <strong>Members:</strong><br>
                            <span class="value"><%# Eval("Member") %></span>
                        </p>

                        <p>
                            <strong>Date:</strong><br>
                            <span class="value"><%# Eval("Date") %></span>
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
