<%@ Page Async="True" Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="ProductDetail.aspx.vb" Inherits="CIS4290SeniorProjectOnlineStore.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .gvDesign
        {
          width: 100%;
          background-color: #fff;
          margin: 5px 0 10px 0;
          border: solid 1px #525252;
          border-collapse:collapse;
        }
        /*data elements*/
        .gvDesign td {
          padding: 2px;
          border: solid 1px #c1c1c1;
          color: #717171;
        }

        /*header elements*/
        .gvDesign th {
          padding: 4px 2px;
          color: #fff;
          background: #424242;
          border-left: solid 1px #525252;
          font-size: 0.9em;
        }

        /*this will be the color of even row*/
        .gvDesign .myAltRowClass { background: #fcfcfc repeat-x top; }

        .alignCenter {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }

        .row {
            display: flex;
        }

        .column {
            flex: 50%;
            display: grid;
            grid-template-columns: 1fr 3fr;
        }

        .label{
            font-weight:bold;
        }
    </style>
        
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
                                            <asp:TextBox ID="tbQuantity" runat="server" CssClass="cart-plus-minus-box" Text="1"></asp:TextBox>
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

                <div class="row">
                    <div class="col-12">
                        <div class="product-details-tab section-space--pt_90">
                            <ul role="tablist" class=" nav">
                                <li class="active" role="presentation">
                                    <a data-toggle="tab" role="tab" href="#description" class="active">Reviews</a>
                                </li>
                                <li role="presentation">
                                    <a data-toggle="tab" role="tab" href="#sheet">Create a Review</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="product_details_tab_content tab-content mt-30">
                            <!-- Start Single Content -->
                            <div class="product_tab_content tab-pane active" id="description" role="tabpanel">
                            <asp:Repeater ID="rpReview" runat="server">
                                <ItemTemplate>
                                     <div class="product-details-wrap">
                                        <div class="row align-items-center">
                                            <div class="col-lg-7 order-md-1 order-2">
                                                <div class="details mt-30">
                                                    <h5 class="mb-10"> <%# Trim(Eval("userName"))%> </h5>
                                                    <p><%# Trim(Eval("userReview"))%></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                 </ItemTemplate>
                            </asp:Repeater>
                            </div>
                            <!-- End Single Content -->
                            <!-- Start Single Content -->
                            <div class="product_tab_content tab-pane" id="sheet" role="tabpanel">
                                
                                <h2 class="alignCenter">Create a review</h2>
                                <br />
                                     <div>
                                        <div class="column">
                                            <!---------------------Add and Update Review Inputs-------------------------->
                
                                            <label for="tbUserName" class="label">User Name:</label>
                                            <input type="text" id="tbUserName" runat="server" />

                                            <label for="tbRating" class="label">Rating:</label>
                                            <input type="text" id="tbRating" runat="server" />

                                            <label for="tbUserReview" class="label">User Review:</label>
                                            <input type="text" id="tbUserReview" runat="server" />

                                            <br />
                                            <br />
                                            <div class="alignCenter">
                                            <asp:Button ID="btnCreateReview" class="button" runat="server" Text="Add a Review"/>
                                            </div>
                            </div>
                            <!-- End Single Content -->
                            <!-- Start Single Content -->
                            <!-- End Single Content -->
                        </div>
                    </div>
                </div>
</asp:Content>
