<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="Checkout.aspx.vb" Inherits="CIS4290SeniorProjectOnlineStore.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:SqlDataSource ID="sqlDSCart1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringOnlineStore %>"> 
    </asp:SqlDataSource>
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
                                <li class="breadcrumb-item"><a href="/"">Home</a></li>
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


                <form id="checkoutwrap" method="post">
                <div class="checkout-wrap">
                    <div class="row">
                        <div class="col-lg-7">
                            
                            <div class="billing-info-wrap mr-100">
                                <h6 class="mb-20">Billing Details</h6>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <div class="billing-info mb-25">
                                            <label>First name <span class="required" title="required">*</span></label>
                                            <asp:TextBox ID="tbFName" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="billing-info mb-25">
                                            <label>Last name <span class="required" title="required">*</span></label>
                                            <asp:TextBox ID="tbLName" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="billing-info mb-25">
                                            <label>Company name (optional) </label>
                                            <asp:TextBox ID="tbCName" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="billing-select mb-25">
                                            <label>Pick Up Location: <span class="required" title="required">*</span></label>
                                            <asp:DropDownList CssClass="select-active" ID="ddPickup" runat="server">
                                                <asp:ListItem Selected="True" Value="Diamond Bar">Diamond Bar</asp:ListItem>
                                                <asp:ListItem Value="Eastvale">Eastvale</asp:ListItem>
                                                <asp:ListItem Value="Glendora">Glendora</asp:ListItem>
                                                <asp:ListItem Value="Rowland Heights">Rowland Heights</asp:ListItem>
                                                <asp:ListItem Value="West Covina">West Covina</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="billing-info mb-25">
                                            <label>Phone <span class="required" title="required">*</span></label>
                                            <asp:TextBox ID="tbPhone" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="billing-info mb-25">
                                            <label>Email Address <span class="required" title="required">*</span></label>
                                            <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                <div class="col-lg-6 col-md-6">
                                        <div class="billing-info mb-25">
                                            <label>Credit/Debit Card Number: <span class="required" title="required">*</span></label>
                                            <asp:TextBox ID="tbCardNo" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="billing-info mb-25">
                                            <label>Expiration Date (mm/yy): <span class="required" title="required">*</span></label>
                                            <asp:TextBox ID="tbDate" runat="server"></asp:TextBox>
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
                                                    <asp:ListView ID="lvCart" runat="server" DataSourceID="sqlDSCart1"
                                                    OnItemCommand="lvCart_OnItemCommand" CellPadding="3" DataKeyField="CartNo"
                                                    CellSpacing="0" RepeatColumns="1" DataKeyNames="ID">

                                                    <ItemTemplate>
                                                    <li><%# Trim(Eval("ProductName")) %> X <%# Eval("Quantity")%> <span>$<%# Eval("Price") %></span></li>
                                                    </ItemTemplate>
                                                    </asp:ListView>
                                                </ul>
                                            </div>
                                            <div class="your-order-info order-total">
                                                <ul>
                                                    <li><strong>Total</strong> <span>$<asp:Label ID="lblTotal" runat="server"></asp:Label></span></li>
                                                </ul>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <div class="place-order mt-30">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Place Order" CssClass="btn--full btn--black btn--lg text-center" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    <asp:Label ID="lblReturnArray" runat="server" Text=""></asp:Label>
            </form>
            </div>
        </div>
        <!-- checkout end -->

    </div>
</asp:Content>
