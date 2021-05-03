<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="ApiClient.aspx.vb" Inherits="CIS4290SeniorProjectOnlineStore.ApiClient" %>
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
    </style>

        <!---------------------------------------Header------------------------------------------>
        <h1 class="alignCenter">Admin Access Panel for WebAPI</h1>
        <!---------------------------------------------------------------------------------------->

        <br />
        <br />

        <!-------------------------------API Login Credentials------------------------------------>
        <h3 class="alignCenter">Login for access:</h3>
        <br />
      <div>
        <div id="loginDiv" runat="server">
            <div class="alignCenter">
            <label>Email:</label>&emsp;&emsp;
            <input type="text" id="tbEmail" runat="server"/>
                &emsp;&emsp;&emsp;
            <label>Password:</label>&emsp;&emsp;
            <input type="password" id="tbPassword" runat="server"/>
            </div>
            <br />
            <asp:Button ID="btnApiLogin" runat="server" Text="Login" class="alignCenter"/>     
        </div>

        <a class="alignCenter" href="Register.aspx">Register for API Access</a>
            <asp:Label ID="lblLoginResult" runat="server" Font-Bold="true" Text="" Visible="false" CssClass="alignCenter"></asp:Label>
            <asp:Button ID="btnApiLogout" runat="server" Text="Logout" Visible="false"/>
        <!---------------------------------------------------------------------------------------->

        <br />
        <br />

        <!---------------------------------Get All Products--------------------------------------->
        <h3 class="alignCenter">Get all products or reviews!</h3>
        <br />
        <asp:Button ID="btnAllProducts" CssClass="alignCenter" runat="server" Text="All Products" />
        <asp:GridView ID="gvAllProducts" CssClass="gvDesign" runat="server" HorizontalAlign="Center" autogeneratecolumns="False">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID"/>
                <asp:BoundField DataField="ProductNo" HeaderText="Product No" SortExpression="ProductNo"/>
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName"/>
                <asp:BoundField DataField="ProductDescription" HeaderText="Product Description" SortExpression="ProductDescription"/>
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"/>
                <asp:BoundField DataField="SubCategoryID" HeaderText="Sub Category ID" SortExpression="SubCategoryID"/>
                <asp:BoundField DataField="Featured" HeaderText="Featured" SortExpression="Featured"/>
                <asp:BoundField DataField="MainCategoryID" HeaderText="Main Category ID" SortExpression="MainCategoryID"/>
            </Columns>
            <AlternatingRowStyle CssClass="myAltRowClass" />
        </asp:GridView>

        <!-----------------------------Get All Reviews----------------------------------->
        <asp:Button ID="btnAllReviews" CssClass="alignCenter" runat="server" Text="All Reviews" />
        <asp:GridView ID="gvAllReviews" CssClass="gvDesign" runat="server" HorizontalAlign="Center" autogeneratecolumns="False">
            <Columns>
                <asp:BoundField DataField="ReviewID" HeaderText="ReviewID" SortExpression="ReviewID"/>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProdcutID"/>
                <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName"/>
                <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating"/>
                <asp:BoundField DataField="UserReview" HeaderText="UserReview" SortExpression="UserRview"/>
            </Columns>
            <AlternatingRowStyle CssClass="myAltRowClass" />
        </asp:GridView>
        <!---------------------------------------------------------------------------------------->

        <br />
        <br />

        <!------------------------------Get Product by ID----------------------------------->
        <h3 class="alignCenter">Get product or review by ID:</h3>
        <br />
        <div class="column, alignCenter">
            <label>Product ID:</label>&emsp;&emsp;
            <input type="text" id="tbProductID" runat="server" />
            <asp:Button ID="btnProductID" runat="server" Text="Get Product" />
        </div>
        <asp:GridView ID="gvProductID" CssClass="gvDesign" runat="server" HorizontalAlign="Center" autogeneratecolumns="False">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="DateField" />
                <asp:BoundField DataField="ProductNo" HeaderText="Product No" SortExpression="ProductNo" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                <asp:BoundField DataField="ProductDescription" HeaderText="Product Description" SortExpression="ProductDescription" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="SubCategoryID" HeaderText="Sub Category ID" SortExpression="SubCategoryID" />
                <asp:BoundField DataField="Featured" HeaderText="Featured" SortExpression="Featured" />
                <asp:BoundField DataField="MainCategoryID" HeaderText="Main Category ID" SortExpression="MainCategoryID" />
            </Columns>

        <AlternatingRowStyle CssClass="myAltRowClass" />
        </asp:GridView>
        <!---------------------------------------------------------------------------------------->

        <br />

        <!---------------------------------Get Review by ID---------------------------------->
        <div class="column, alignCenter">
            <label>Review ID:</label>&emsp;&emsp;
            <input type="text" id="tbReviewID" runat="server" />
            <asp:Button ID="btnReviewID" runat="server" Text="Get Review" />
        </div>
        <asp:GridView ID="gvReviewID" CssClass="gvDesign" runat="server" HorizontalAlign="Center" autogeneratecolumns="False">
            <Columns>
                <asp:BoundField DataField="ReviewID" HeaderText="ReviewID" SortExpression="ReviewID"/>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProdcutID"/>
                <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName"/>
                <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating"/>
                <asp:BoundField DataField="UserReview" HeaderText="UserReview" SortExpression="UserReview"/>
            </Columns>

            <AlternatingRowStyle CssClass="myAltRowClass" />
        </asp:GridView>
        <!---------------------------------------------------------------------------------------->

        <br />
        <br />

        <!------------------------------------Create a Product------------------------------------->
        <h3 class="alignCenter">Create a product</h3>
        <br />
        <div>
            <div class="column">
                <label for="tbProductNo">ProductNo:</label>
                <input type="text" id="tbProductNo" runat="server" />

                <label for="tbProductName">ProductName:</label>
                <input type="text" id="tbProductName" runat="server" />

                <label for="tbProductDescription">ProductDescription:</label>
                <input type="text" id="tbProductDescription" runat="server" />

                <label for="tbPrice">Price:</label>
                <input type="text" id="tbPrice" runat="server" />

                <label for="tbSubCategoryID">SubCategoryID:</label>
                <input type="text" id="tbSubCategoryID" runat="server" />

                <label for="tbFeatured">Featured:</label>
                <input type="text" id="tbFeatured" runat="server" />

                <label for="tbMainCategoryID">MainCategoryID:</label>
                <input type="text" id="tbMainCategoryID" runat="server" />

                <br />
                <br />
                <asp:Button ID="btnCreateProduct" CssClass="alignCenter" runat="server" Text="Create a Product"/>
            </div>
                <!---------------------------------------------------------------------------------------->

                <br />
                <br />

            <!----------------------------Update Product by ID-------------------------->
            <div>
                <h3 class="alignCenter">Update product by ID</h3>
                <br />
                <div class="column, alignCenter">
                    <label for="tbUpdateProductID">Product ID:</label>&emsp;&emsp;
                    <input type="text" id="tbUpdateProductID" runat="server" />
                    <asp:Button ID="btnUpdateProduct" runat="server" Text="Update"/>
                </div>
            </div>
            <!---------------------------------------------------------------------------------------->
        </div> 
        
        <br />
        <br />

        <!-----------------------------------Create a review-------------------------------->
        <h3 class="alignCenter">Create a review</h3>
        <br />
         <div>
            <div class="column">
                <!---------------------Add and Update Review Inputs-------------------------->
                <label for="tbRProductID">ProductID:</label>
                <input type="text" id="tbRProductId" runat="server" />

                <label for="tbUserName">User Name:</label>
                <input type="text" id="tbUserName" runat="server" />

                <label for="tbRating">Rating:</label>
                <input type="text" id="tbRating" runat="server" />

                <label for="tbUserReview">User Review:</label>
                <input type="text" id="tbUserReview" runat="server" />

                <br />
                <br />
                <asp:Button ID="btnCreateReview" CssClass="alignCenter" runat="server" Text="Add a Review"/>
            </div>
                <!---------------------------------------------------------------------------------------->

                <br />
                <br />

                <!------------------------------Update Review by ID-------------------------------->
                <h3 class="alignCenter">Update review by ID</h3>
                <br />
                <div class="column, alignCenter">
                    <label for="tbUpdateReviewID">Update Review ID:</label>&emsp;&emsp;
                    <input type="text" id="tbUpdateReviewID" runat="server" />
                    <asp:Button ID="btnUpdateReview" runat="server" Text="Update"/>
                </div>
        </div> 
        <!---------------------------------------------------------------------------------------------------->

        <br />
        <br />

        <!---------------------------------Delete Product or Review by ID---------------------------------->
        <h3 class="alignCenter">Delete a product or review by ID</h3>
        <br />
        <!---------------------------------Delete Product by ID------------------------------------------>
        <div class="column, alignCenter">
            <label>Product ID:</label>&emsp;&emsp;
            <input type="text" id="tbDeleteProductID" runat="server" />
            <asp:Button ID="btnDeleteProductID" runat="server" Text="Delete" />
        </div>
        <!-------------------------------------------------------------------------------------------->

        <br />

        <!------------------------------------Delete Review by ID---------------------------------->
        <div class="column, alignCenter">
            
            <label>Review ID:</label>&emsp;&emsp;
            <input type="text" id="tbDeleteReviewID" runat="server" />
            <asp:Button ID="btnDeleteReviewID" runat="server" Text="Delete" />
        </div>
        <!---------------------------------------------------------------------------------------->
     
        <br />
        <br />

        <!-----------------------------------Get All Cart Info------------------------------------->
        <h3 class="alignCenter">Get all Cart Info</h3>
        <br />
        <asp:Button ID="btnAllCarts" class="alignCenter" runat="server" Text="Cart Info" />
        <asp:GridView ID="gvAllCarts" CssClass="gvDesign" runat="server" HorizontalAlign="Center" autogeneratecolumns="False">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:BoundField DataField="CartID" HeaderText="Cart ID" SortExpression="CartID" />
                <asp:BoundField DataField="ProductID" HeaderText="Product ID" SortExpression="ProductID" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="LineTotal" HeaderText="Line Total" SortExpression="LineTotal" />
            </Columns>

            <AlternatingRowStyle CssClass="myAltRowClass" />
        </asp:GridView>
        <!---------------------------------------------------------------------------------------->

        <br />
        <br />

        <!-------------------------------Delete Cart Line----------------------------------------->
        <h3 class="alignCenter">Delete cart item or get entire cart</h3>
        <br />
        <div class="column, alignCenter">
            <label>Cart Row (ID):</label>&emsp;&emsp;
            <input type="text" id="tbDeleteCartLineID" runat="server" />
            <asp:Button ID="btnDeleteCartLineID" runat="server" Text="Delete" />
        </div>
        <!---------------------------------------------------------------------------------------->

        <br />

        <!-------------------------Get Entire Cart by CartID-------------------------------------->
        <div class="column, alignCenter">
            <label>Get Entire Cart (CartID):</label>&emsp;&emsp;
            <input type="text" id="tbGetCartID" runat="server" />
            <asp:Button ID="btnCartByID" runat="server" Text="Get Cart" />
        </div>

        <asp:GridView ID="gvCartByID" CssClass="gvDesign" runat="server" HorizontalAlign="Center" autogeneratecolumns="False">
            <Columns>
                <asp:BoundField DataField="CartID" HeaderText="Cart ID" SortExpression="CartID" />
                <asp:BoundField DataField="ProductID" HeaderText="Product ID" SortExpression="ProductID" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:BoundField DataField="LineTotal" HeaderText="Line Total" SortExpression="LineTotal" />
            </Columns>

            <AlternatingRowStyle CssClass="myAltRowClass" />
        </asp:GridView>
        <!---------------------------------------------------------------------------------------->

        <br />
        <br />

        <!----------------------------Get Current Cart using Cookie------------------------------>
        <h3 class="alignCenter">Get the current cart</h3>
        <br />
        <asp:Button ID="btnCurrentCart" CssClass="alignCenter" runat="server" Text="Cart" />
        <asp:GridView ID="gvCurrentCart" CssClass="gvDesign" runat="server" HorizontalAlign="Center" autogeneratecolumns="False">
                        <Columns>
                <asp:BoundField DataField="CartID" HeaderText="Cart ID" SortExpression="CartID" />
                <asp:BoundField DataField="ProductID" HeaderText="Product ID" SortExpression="ProductID" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:BoundField DataField="LineTotal" HeaderText="Line Total" SortExpression="LineTotal" />
            </Columns>
            <AlternatingRowStyle CssClass="myAltRowClass" />
        </asp:GridView>
        <!---------------------------------------------------------------------------------------->

        <br />
        <br />

        <!------------------------------------Edit Cart Item------------------------------------->
        <h3 class="alignCenter">Edit Cart item</h3>
        <br />
        <div class="column, alignCenter">
            <label>Cart Line to Update (ID):</label>&emsp;&emsp;
            <input type="text" id="tbUpdateQtyCartLineID" runat="server" />
        </div>
        <br />
        <div class="column, alignCenter">
            <label>New Quantity:</label>&emsp;&emsp;
            <input type="text" id="tbUpdateQtyAmt" runat="server" />
        </div>
          <br />
        <div class="alignCenter">
            <asp:Button ID="btnUpdateCartQty" runat="server" Text="Update Quantity" />
        </div>
        <!---------------------------------------------------------------------------------------->

        <br />
        <br />

        <!----------------------------Imports all products and reviews---------------------------->
        <h3 class="alignCenter">Import all products or reviews to database</h3>
        <br />
        <!----------------------------------Import All Products----------------------------->
        <div class="alignCenter">
            <asp:button runat="server" id="btnImportAllProducts" text="Products" />
        </div>
        <!------------------------------- --Import All Reviews------------------------------>
        <div class="alignCenter">
            <asp:button runat="server" id="btnImportAllReviews" text="Reviews" />
        </div>

        <br />
        <br />

        <!---------------------------------Import Product by ID----------------------------->
        <h3 class="alignCenter">Import a product by ID</h3>
        <br />
        <div class="alignCenter">
            <label>Product ID:</label>&emsp;&emsp;
            <input type="text" id="tbImportProductID" runat="server" />
            <asp:button runat="server" id="btnImportProductID" text="Import" />
        </div>
    </div>
</asp:Content>
