<%@ Page Async="true" Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="Category.aspx.vb" Inherits="CIS4290SeniorProjectOnlineStore.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="product-wrapper section-space--ptb_120">
<div class="breadcrumb-area">
    <div class="container-fluid container-fluid--cp-100">
        <div class="row">
            <div class="col-12">
                <div class="row breadcrumb_box  align-items-center">
                    <div class="col-lg-6 col-md-6 col-sm-6 text-center text-sm-left">
                        <h3 class="breadcrumb-title">
                            <asp:Label ID="lblProductList" runat="server" Text="Featured Products"></asp:Label>
                        </h3>
                    </div>
                <div class="col-lg-6  col-md-6 col-sm-6">
                            <!-- breadcrumb-list start -->
                    <ul class="breadcrumb-list text-center text-sm-right">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active">Shop</li>
                    </ul>
                            <!-- breadcrumb-list end -->
                </div>
            </div>
        </div>
        </div>
        </div>
</div><br />      
    <div class="container">

                <div class="row">
                    <div class="col-lg-3 col-md-3 order-md-1 order-2  small-mt__40">
                        <div class="shop-widget widget-shop-categories">
                            <div class="product-filter">
                                <h6 class="mb-20">
                                    <asp:Label ID="lblMainCategoryName" runat="server" Text=""></asp:Label>
                                </h6>
                                <ul class="widget-nav-list">
                                   <asp:SqlDataSource ID="SqlDSSubCategory" ConnectionString="<%$ ConnectionStrings:ConnectionStringOnlineStore %>" SelectCommand="" runat="server"></asp:SqlDataSource>
                                   <asp:Repeater ID="rpSubCategory" runat="server">
                                        <ItemTemplate>
                                            <li><a href="Category.aspx?SubCategoryId=<%# Eval("ID")%>&SubCategoryName=<%# Trim(Eval("CategoryName"))%>&MainCategoryID=<% = Request.QueryString("MainCategoryID")%>&&MainCategoryName=<% = Request.QueryString("MainCategoryName")%>"><%# Trim(Eval("CategoryName"))%></a></li>
                                        </ItemTemplate>
                                   </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9  order-md-2 order-1">
                        <div class="row">
                            <div class="col-lg-6 col-md-8">
                                <div class="shop-toolbar__items shop-toolbar__item--left">
                                    <div class="shop-toolbar__item shop-toolbar__item--result">
                                    </div>

                                    <div class="shop-toolbar__item shop-short-by">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-4">
                                <div class="shop-toolbar__items shop-toolbar__item--right">
                                    <div class="shop-toolbar__items-wrapper">

                                        <div class="shop-toolbar__item">
                                            <ul class="nav toolber-tab-menu justify-content-start" role="tablist">
                                                <li class="tab__item nav-item active">
                                                    <a class="nav-link active" data-toggle="tab" href="#tab_columns_01" role="tab">
                                                        <img src="assets/images/svg/column-03.svg" class="img-fluid" alt="Columns 03">
                                                    </a>
                                                </li>
                                                <li class="tab__item nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#tab_columns_02" role="tab"><img src="assets/images/svg/column-04.svg" class="img-fluid" alt="Columns 03"> </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="tab_columns_01">
                                <div class="row">
                                   <asp:SqlDataSource ID="SqlDSProductList" ConnectionString="<%$ ConnectionStrings:ConnectionStringOnlineStore %>" SelectCommand="" runat="server"></asp:SqlDataSource>
                                   <asp:Repeater ID="rpProductList" runat="server">
                                        <ItemTemplate>
                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                            <!-- Single Product Item Start -->
                                            <div class="single-product-item text-center">
                                            <div class="products-images">
                                                <a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>" class="product-thumbnail">
                                                    <img src="images/category/<%# Trim(Eval("ProductNO"))%>.jpg" class="img-fluid" alt="Product Images">
                                                </a>
                                                <div class="product-actions">
                                                    <a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>"><i class="p-icon icon-plus"></i><span class="tool-tip">View Details</span></a>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h6 class="prodect-title"><a href="product-details.html"><%# Trim(Eval("ProductName"))%></a></h6>
                                                <div class="prodect-price">

                                                    <span class="new-price">$<%# GetWholesalePrice(Trim(Eval("UnitPrice")))%></span>
                                                </div>
                                            </div>
                                        </div>
                                            <!-- Single Product Item End -->
                                        </div>
                                        </ItemTemplate>
                                   </asp:Repeater>

                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab_columns_02">
                                <div class="row">
                                   <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:ConnectionStringOnlineStore %>" SelectCommand="" runat="server"></asp:SqlDataSource>
                                   <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                        <div class="col-lg-3 col-md-4 col-sm-6">
                                            <!-- Single Product Item Start -->
                                            <div class="single-product-item text-center">
                                            <div class="products-images">
                                                <a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>" class="product-thumbnail">
                                                    <img src="images/category/<%# Trim(Eval("ProductNO"))%>.jpg" class="img-fluid" alt="Product Images">
                                                </a>
                                                <div class="product-actions">
                                                    <a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>"><i class="p-icon icon-plus"></i><span class="tool-tip">View Details</span></a>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h6 class="prodect-title"><a href="product-details.html"><%# Trim(Eval("ProductName"))%></a></h6>
                                                <div class="prodect-price">
                                                    <span class="new-price">$<%# Trim(Eval("UnitPrice"))%></span>
                                                </div>
                                            </div>
                                        </div>
                                            <!-- Single Product Item End -->
                                        </div>
                                        </ItemTemplate>
                                   </asp:Repeater>
                                        <asp:Repeater ID="Repeater2" runat="server" Visible="False">
                                        <ItemTemplate>
                                        <div class="col-lg-3 col-md-4 col-sm-6">
                                            <!-- Single Product Item Start -->
                                            <div class="single-product-item text-center">
                                            <div class="products-images">
                                                <a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>" class="product-thumbnail">
                                                    <img src="images/category/<%# Trim(Eval("ProductNO"))%>.jpg" class="img-fluid" alt="Product Images">
                                                </a>
                                                <div class="product-actions">
                                                    <a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>"><i class="p-icon icon-plus"></i><span class="tool-tip">View Details</span></a>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h6 class="prodect-title"><a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>"><%# Trim(Eval("ProductName"))%></a></h6>
                                                <div class="prodect-price">
                                                        <%
                                                            If Session("Customer") <> "" Then

                                                            End If
                                                         %>
                                                    <span class="new-price">$<%# Trim(Eval("UnitPrice")) * 0.8 %></span>
                                                </div>
                                            </div>
                                        </div>
                                            <!-- Single Product Item End -->
                                        </div>
                                        </ItemTemplate>
                                   </asp:Repeater>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
</asp:Content>
