<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="ViewCartTest.aspx.vb" Inherits="CIS4290SeniorProjectOnlineStore.ViewCartTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<asp:SqlDataSource ID="sqlDSCart1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringOnlineStore %>"> 
</asp:SqlDataSource>
    <div id="content" class="site-content"><div id="primary" class="content-area width-normal">
        <main id="main" class="site-main">
            <div class="cont maincont">
                <h1 class="maincont-ttl">Cart</h1>
                <ul class="b-crumbs">
                    <li><a href="index.html">Home</a></li>
                    <li>Cart</li>
                </ul>
<asp:ListView ID="lvCart" runat="server" DataSourceID="sqlDSCart1"
OnItemCommand="lvCart_OnItemCommand" CellPadding="3" DataKeyField="CartNo"
CellSpacing="0" RepeatColumns="1" DataKeyNames="ID">
<LayoutTemplate>
                <div style="float: left;">
                     ``<asp:Label ID="lblPage" runat="server" Text="" Font-Size="14px"></asp:Label>
              ``</div><br />
                <div class="page-styling">

                <div class="woocommerce prod-litems section-list">
                    <asp:PlaceHolder runat="server" id="itemPlaceholder"></asp:PlaceHolder>
                </div>
</LayoutTemplate>
<ItemTemplate>
    <article class="prod-li sectls">
                        <div class="prod-li-inner">
                            <a href="product.html" class="prod-li-img">
                                <img src="http://placehold.it/290x258" alt="">
                            </a>
                            <div class="prod-li-cont">
                                <div class="prod-li-ttl-wrap">
                                    <p>
                                        <a href="#">Lighting</a>
                                    </p>
                                    <h3><a href="product.html">Searchlight Portable</a></h3>
                                </div><!--
                No Space
                --><div class="prod-li-prices">
                                <div class="prod-li-price-wrap">
                                    <p>Price</p>
                                    <p class="prod-li-price">$120.00</p>
                                </div>
                                <div class="prod-li-qnt-wrap">
                                    <p class="qnt-wrap prod-li-qnt">
                                        <a href="#" class="qnt-plus prod-li-plus"><i class="icon ion-arrow-up-b"></i></a>
                                        <input type="text" value="1">
                                        <a href="#" class="qnt-minus prod-li-minus"><i class="icon ion-arrow-down-b"></i></a>
                                    </p>
                                </div>
                                <div class="prod-li-total-wrap">
                                    <p>Total</p>
                                    <p class="prod-li-total">$120.00</p>
                                </div>
                            </div><!--
        No Space
    --></div>
                            <div class="prod-li-info">
                                <div class="prod-li-rating-wrap">
                                    <p data-rating="5" class="prod-li-rating">
                                        <i class="rating-ico" title="1"></i><i class="rating-ico" title="2"></i><i class="rating-ico" title="3"></i><i class="rating-ico" title="4"></i><i class="rating-ico" title="5"></i>
                                    </p>
                                    <p class="prod-li-rating-count">12</p>
                                </div>
                                <p class="prod-li-add">
                                    <a href="#" class="button hover-label prod-addbtn"><i class="icon ion-close-round"></i><span>Remove</span></a>
                                </p>
                                <p class="prod-li-compare">
                                    <a href="compare.html" class="hover-label prod-li-compare-btn"><span>Compare</span><i class="icon ion-arrow-swap"></i></a>
                                </p>
                                <p class="prod-quickview">
                                    <a href="#" class="hover-label quick-view"><i class="icon ion-plus"></i><span>Quick View</span></a>
                                </p>
                                <div class="prod-li-favorites">
                                    <a href="wishlist.html" class="hover-label add_to_wishlist"><i class="icon ion-heart"></i><span>Add to Wishlist</span></a>
                                </div>
                                <p class="prod-li-information">
                                    <a href="#" class="hover-label"><i class="icon ion-more"></i><span>Show Information</span></a>
                                </p>
                            </div>
                        </div>

                    </article>
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
                <div class="cart-actions">
                    <div class="coupon">
                        <input type="text" placeholder="Coupon code">
                        <input type="submit" class="button" value="Apply">
                    </div>
                    <div class="cart-collaterals">
                        <a href="#" class="checkout-button button">Proceed to checkout</a>
                        <div class="order-total">
                            <p class="cart-totals-ttl">Total</p>
                            <p class="cart-totals-val">$510.00</p>
                        </div>
                    </div>
                </div>


            </div>
            </div>
        </main><!-- #main -->
    </div><!-- #primary -->    </div>
</asp:Content>
