<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="ViewCart.aspx.vb" Inherits="CIS4290SeniorProjectOnlineStore.ViewCart" %>
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
                            <h2 class="breadcrumb-title">Cart</h2>
                        </div>
                        <div class="col-lg-6  col-md-6 col-sm-6">
                            <!-- breadcrumb-list start -->
                            <ul class="breadcrumb-list text-center text-sm-right">
                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                <li class="breadcrumb-item active">Cart</li>
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

        <!-- cart start -->
    <asp:SqlDataSource ID="sqlDSCart1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringOnlineStore %>"> 
    </asp:SqlDataSource>
        <div class="cart-main-area  section-space--ptb_90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                       <asp:ListView ID="lvCart" runat="server" DataSourceID="sqlDSCart1"
                          OnItemCommand="lvCart_OnItemCommand" CellPadding="3" DataKeyField="CartNo"
                          CellSpacing="0" RepeatColumns="1" DataKeyNames="ID">
                       <LayoutTemplate>
                        <div style="float: left;">
                            <asp:Label ID="lblPage" runat="server" Text="" Font-Size="14px"></asp:Label>
                        </div><br />
                            <div class="table-content table-responsive cart-table-content header-color-gray">
                                <table>
                                    <thead>
                                        <tr class="bg-gray">
                                            <th></th>
                                            <th></th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price"> Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:PlaceHolder runat="server" id="itemPlaceholder"></asp:PlaceHolder>
                                    </tbody>
                                </table>
                            </div>
                        </LayoutTemplate>
                        <EmptyDataTemplate>
                            <div class="error-page-content text-center section-space--ptb_90">
                                <i class="icon icon-confused"></i>
                                    <h1 class="mb-20">Shopping Cart is empty</h1>
                                    <p class="description">You can't checkout if there's nothing to buy. Try adding items to your cart! <a href="/">Homepage</a></p>

                        </div>
                        </EmptyDataTemplate>
                      <ItemTemplate>
                            <tr>

                                <td></td>
                                <td class="product-img">
                                    <a href="#"><img src="images/product-detail/<%# Trim(Eval("ProductNo")) %>Small1.jpg" alt=""></a>
                                </td>
                                    <td class="product-name"><a href=""><%# Trim(Eval("ProductName")) %></a></td>

                                    <td class="product-price"><span class="amount">$<%# Eval("Price") %></span></td>

                                    <td class="cart-quality">
                                        <div class="quickview-quality quality-height-dec2">
                                            <div class="cart-plus-minus">
                                                <asp:TextBox ID="tbQuantity" Text='<%# Eval("Quantity")%>' CssClass="cart-plus-minus-box" runat="server"></asp:TextBox>
                                                <asp:CompareValidator ID="cvCartQuantity" runat="server" Operator="DataTypeCheck" ControlToValidate="tbQuantity" Type="Integer" ErrorMessage="Please input only integers in quantity."></asp:CompareValidator>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="price-total">
                                        <span class="amount">$<%# Eval("Price") * Eval("Quantity")%></span>
                                    </td>
                                    <td class="product-remove">
                                        <asp:LinkButton runat="server" ID="lbUpdate" Text='Update' CommandName="cmdUpdate" CommandArgument='<%# Eval("ProductNo")%>' ToolTip ="Update Cart">
                                            <i class="icon-bag2"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="lbDelete" CommandName="cmdDelete" CommandArgument='<%# Eval("ProductNo")%>' ToolTip ="Delete Item">
                                            <i class="icon-cross2"></i>
                                        </asp:LinkButton>
                                    </td>
                             </tr>
                        </ItemTemplate>
                        </asp:ListView>
                        <div style="padding: 8px;width: 100%;text-align: center;">
                            <div style="display: inline-block; margin-top: 5px">
                                <asp:Button runat="server" Text="&laquo;" id="show_prev" CssClass="show_prevx"></asp:Button>
                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvCart" PageSize="3">
                                <Fields>        
                                    <asp:NumericPagerField NextPageText='&raquo;' PreviousPageText='&laquo;' ButtonCount="5" 
                                    ButtonType="Button" NextPreviousButtonCssClass="next_prevx" NumericButtonCssClass="numericx" 
                                    CurrentPageLabelCssClass="currentx" RenderNonBreakingSpacesBetweenControls="False" />
                                </Fields>
                                </asp:DataPager>
                        <asp:Button runat="server" Text="&raquo;" id="show_next" CssClass="show_nextx"></asp:Button>
                            </div>
                        </div>
                        <div style="text-align: center;">
                        <asp:ValidationSummary ID="vsQuantity" runat="server" CssClass="sku" />
                        </div>
                        <div class="shoping-update-area row">
                            <div class="continue-shopping-butotn col-6 mt-30">
                                <a href="/" class="btn btn--lg btn--black"><i class="icon-arrow-left"></i> Continue Shopping </a>
                            </div>
                            <div class="update-cart-button col-6 text-right mt-30">
                                <asp:Button ID="btnEmptyCart" runat="server" Text="Empty Cart" CssClass="btn btn--lg btn--border_1" />
                            </div>
                        </div>
                        <div class="cart-buttom-area">
                            <div class="row">
                                    <div class="col-lg-6">
                                    <div class="discount-code section-space--mt_60">
                                        <h6 class="mb-30">Coupon Discount</h6>
                                        <p>Enter your coupon code if you have one.</p>
                                        <input type="text" name="name" placeholder="Coupon code">
                                        <button class="coupon-btn btn btn--lg btn--border_1" type="submit">Apply coupon</button>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="cart_totals section-space--mt_60 ml-md-auto">
                                        <div class="grand-total-wrap">
                                            <div class="grand-total-content">
                                                <ul>
                                                    <li>Total <span>$<asp:Label ID="lblTotal" runat="server"></asp:Label></span> </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="grand-btn mt-30">
                                            <a href="#" class="btn--black btn--full text-center btn--lg">Proceed to checkout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- cart end -->

    </div>
</asp:Content>
