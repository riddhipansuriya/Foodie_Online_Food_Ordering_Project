<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Foodie.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="pcoded-inner-content">
        <div class="main-body">
            <div class="page-wrapper">

                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="sub-title">Add Product</h4>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-6 col-lg-6">

                                            <div class="form-group">
                                                <label>Select Category</label>
                                                <div>
                                                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label>Product Name</label>
                                                <div>
                                                    <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"
                                                        placeholder="Enter Product Name" required></asp:TextBox>
                                                    <asp:HiddenField ID="hdnProductId" runat="server" Value="0" />
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label>Price</label>
                                                <div>
                                                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"
                                                        placeholder="Enter Price" required></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label>Code</label>
                                                <div>
                                                    <asp:TextBox ID="txtCode" runat="server" CssClass="form-control"
                                                        placeholder="Enter Price" required></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label>Description</label>
                                                <div>
                                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"
                                                        TextMode="MultiLine" Rows="3" placeholder="Enter Description"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label>Product Image</label>
                                                <div>
                                                    <asp:FileUpload ID="fldProductImg" runat="server" CssClass="form-control" />
                                                </div>
                                            </div>

                                            <div class="pb-5">
                                                <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click1" />
                                            </div>


                                            <!-- DataList -->
                                            <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" CellPadding="5">
                                                <ItemTemplate>
                                                    <asp:Image ID="ProductImage" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="100px" Height="100px" /><br />
                                                    <b><%# Eval("Name") %>
                                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                    </b><br />
                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:DataList>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
