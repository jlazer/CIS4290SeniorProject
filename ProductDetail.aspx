<%@ Page Async="True" Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="ProductDetail.aspx.vb" Inherits="CIS4290SeniorProjectOnlineStore.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <!-- breadcrumb-area start -->
    <div class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row breadcrumb_box  align-items-center">
                        <div class="col-lg-6 col-md-6 col-sm-6 text-center text-sm-left">
                            <h2 class="breadcrumb-title"><asp:Label ID="lblProductNameHeader" runat="server" Text=""></asp:Label></h2>
                        </div>
                        <div class="col-lg-6  col-md-6 col-sm-6">
                            <!-- breadcrumb-list start -->
                            <ul class="breadcrumb-list text-center text-sm-right">
                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                <li class="breadcrumb-item active">Product</li>
                            </ul>
                            <!-- breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb-area end -->






    <div class="site-wrapper-reveal">

        <div class="single-product-wrap section-space--pt_90 border-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-6 col-sm-12 col-xs-12">

                        <!-- Product Details Left -->
                        <div class="product-details-left">
                            <div class="product-details-images-2 slider-lg-image-2">

                                <div class="easyzoom-style">
                                    <div class="easyzoom easyzoom--overlay">
                                        <asp:HyperLink ID="productHL1" runat="server" CssClass="poppu-img">
                                        <asp:Image ID="imgProduct1" runat="server" CssClass="img-fluid" />
                                        </asp:HyperLink>
                                    </div>
                                </div>
                                <div class="easyzoom-style">
                                    <div class="easyzoom easyzoom--overlay">
                                        <asp:HyperLink ID="productHL2" runat="server" CssClass="poppu-img">
                                        <asp:Image ID="imgProduct2" runat="server" CssClass="img-fluid" />
                                        </asp:HyperLink>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="product-details-thumbs-2 slider-thumbs-2">
                                <div class="sm-image"><asp:Image ID="productSmall1" runat="server" /></div>
                                <div class="sm-image"><asp:Image ID="productSmall2" runat="server" /></div>
                            </div>
                        </div>
                        <!--// Product Details Left -->

                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-12 col-xs-12">
                        <div class="product-details-content ">

                            <h5 class="font-weight--reguler mb-10"><asp:Label ID="lblProductName" runat="server" Text=""></asp:Label></h5>
                            <h3 class="price"><h5 class="font-weight--reguler mb-10">$<asp:Label ID="lblPrice" runat="server" Text=""></asp:Label></h5></h3>

                            <div class="quickview-ratting">
                            </div>

                            <div class="quickview-peragraph mt-10">
                                <p><asp:Label ID="lblProductDescription" runat="server" Text=""></asp:Label></p>
                            </div>

                            <div class="quickview-action-wrap mt-30">
                                <div class="quickview-cart-box">
                                    <div class="quickview-quality">
                                        <div class="cart-plus-minus">
                                            <asp:TextBox ID="tbQuantity" runat="server" CssClass="cart-plus-minus-box" Text="0"></asp:TextBox>
                                            <asp:RangeValidator ID="rvQuantity" runat="server" Type="Integer" MinimumValue="1" MaximumValue="50" ControlToValidate="tbQuantity" ErrorMessage="Please enter a whole number from 1-50." Display="Dynamic">Please enter a whole number from 1-50.</asp:RangeValidator>
                                            <!-- <input class="cart-plus-minus-box" type="text" name="qtybutton" value="0"> -->
                                        </div>
                                    </div>

                                    <div class="quickview-button">
                                        <div class="quickview-cart button">
                                            <asp:Button ID="btnAddtoCart" runat="server" Text="Add to cart" CssClass="btn--lg btn--black font-weight--reguler text-white" />
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="product_meta mt-30">
                                <div class="sku_wrapper item_meta">
                                    <asp:ValidationSummary ID="vsQuantity" runat="server" CssClass="sku" />
                                    <span class="label"> SKU: </span>
                                    <span class="sku"> <asp:Label ID="lblProductNo" runat="server" Text=""></asp:Label> </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-12">
                    </div>
                    <div class="col-12">
                    </div>
                </div>
                <br />
</asp:Content>
