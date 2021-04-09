<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="Checkout.aspx.vb" Inherits="CIS4290SeniorProjectOnlineStore.Checkout" %>
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
                            <h2 class="breadcrumb-title">Checkout</h2>
                        </div>
                        <div class="col-lg-6  col-md-6 col-sm-6">
                            <!-- breadcrumb-list start -->
                            <ul class="breadcrumb-list text-center text-sm-right">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item active">Checkout</li>
                            </ul>
                            <!-- breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb-area end -->






    <div class="site-wrapper-reveal border-bottom">

        <!-- checkout start -->
        <div class="checkout-main-area section-space--ptb_90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="customer-zone mb-30">
                            <p class="cart-page-title">Have a coupon? <a class="checkout-click" href="#">Click here to enter your code</a></p>
                            <div class="checkout-coupon-info">
                                <p>If you have a coupon code, please apply it below.</p>
                                <form action="#">
                                    <input type="text" placeholder="Coupon code">
                                    <input type="submit" value="Apply Coupon">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="checkout-wrap">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="billing-info-wrap mr-100">
                                <h6 class="mb-20">Billing Details</h6>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <div class="billing-info mb-25">
                                            <label>First name <span class="required" title="required">*</span></label>
                                            <input type="text">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="billing-info mb-25">
                                            <label>Last name <span class="required" title="required">*</span></label>
                                            <input type="text">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="billing-info mb-25">
                                            <label>Company name (optional) <span class="required" title="required">*</span></label>
                                            <input type="text">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="billing-select mb-25">
                                            <label>Country <span class="required" title="required">*</span></label>
                                            <select class="select-active">
                                                <option>Azerbaijan</option>
                                                <option>Bahamas</option>
                                                <option>Bahrain</option>
                                                <option>Bangladesh</option>
                                                <option>Barbados</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="billing-info mb-25">
                                            <label>Street address <span class="required" title="required">*</span></label>
                                            <input class="billing-address" placeholder="House number and street name" type="text">
                                            <input placeholder="Apartment, suite, unit etc. (optional)" type="text">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="billing-info mb-25">
                                            <label>Town / City <span class="required" title="required">*</span></label>
                                            <input type="text">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="billing-info mb-25">
                                            <label>ZIP <span class="required" title="required">*</span></label>
                                            <input type="text">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="billing-info mb-25">
                                            <label>Phone <span class="required" title="required">*</span></label>
                                            <input type="text">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="billing-info mb-25">
                                            <label>Email Address <span class="required" title="required">*</span></label>
                                            <input type="text">
                                        </div>
                                    </div>
                                </div>
                                <div class="additional-info-wrap">
                                    <h6 class="mb-10">Additional information</h6>
                                    <label>Order notes (optional)</label>
                                    <textarea placeholder="Notes about your order, e.g. special notes for delivery. " name="message"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="your-order-wrappwer tablet-mt__60 small-mt__60">
                                <h6 class="mb-20">Your order</h6>
                                <div class="your-order-area">
                                    <div class="your-order-wrap gray-bg-4">
                                        <div class="your-order-info-wrap">
                                            <div class="your-order-info">
                                                <ul>
                                                    <li>Product <span>Total</span></li>
                                                </ul>
                                            </div>
                                            <div class="your-order-middle">
                                                <ul>
                                                    <li>Product Name X 1 <span>£329 </span></li>
                                                    <li>Product Name X 3 <span>£39 </span></li>
                                                </ul>
                                            </div>
                                            <div class="your-order-info order-subtotal">
                                                <ul>
                                                    <li><strong>Subtotal</strong> <span>£369 </span></li>
                                                </ul>
                                            </div>
                                            <div class="your-order-info order-total">
                                                <ul>
                                                    <li><strong>Total</strong> <span>£369.00 </span></li>
                                                </ul>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <div class="place-order mt-30">
                                    <a href="#" class="btn--full btn--black btn--lg text-center">Place Order</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- checkout end -->

    </div>
</asp:Content>
