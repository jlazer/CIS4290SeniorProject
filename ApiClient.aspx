<%@ Page Async="true" Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="ApiClient.aspx.vb" Inherits="CIS4290SeniorProjectOnlineStore.ApiClient" %>
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
        .button {
	    box-shadow: 1px 2px 0px 1px #706770;
	    background:linear-gradient(to bottom, #e6e6e6 5%, #e8ddbe 100%);
	    background-color:#e6e6e6;
	    border-radius:9px;
	    border:1px solid #524d43;
	    display:inline-block;
	    cursor:pointer;
	    color:#64665e;
	    font-family:Trebuchet MS;
	    font-size:20px;
	    font-weight:bold;
	    padding:10px 27px;
	    text-decoration:none;
	    text-shadow:0px 0px 0px #dbd2db;
        }
        .button:hover {
	        background:linear-gradient(to bottom, #e8ddbe 5%, #e6e6e6 100%);
	        background-color:#e8ddbe;
        }
        .button:active {
	        position:relative;
	        top:1px;
        }
        .label{
            font-weight:bold;
        }
    </style>

<div class="breadcrumb-area">
    <div class="container-fluid container-fluid--cp-100">
        <div class="row">
            <div class="col-12">
                <div class="row breadcrumb_box  align-items-center">
                    <div class="col-lg-6 col-md-6 col-sm-6 text-center text-sm-left">
                        <h3 class="breadcrumb-title">
                            <asp:Label ID="lblProductList" runat="server" Text="Admin Panel"></asp:Label>
                        </h3>
                    </div>
                <div class="col-lg-6  col-md-6 col-sm-6">
                            <!-- breadcrumb-list start -->
                    <ul class="breadcrumb-list text-center text-sm-right">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active">Admin Panel</li>
                    </ul>
                            <!-- breadcrumb-list end -->
                </div>
            </div>
        </div>
        </div>
        </div>
</div><br />  

        <!-- API Login Credentials
        <h2 class="alignCenter">Login for access:</h2>
        <br />
      <div>
        <div id="loginDiv" runat="server">
            <div class="alignCenter">
            <label class="label">Email:</label>&emsp;&emsp;
            <input type="text" id="tbEmail" runat="server"/>
                &emsp;&emsp;&emsp;
            <label class="label">Password:</label>&emsp;&emsp;
            <input type="password" id="tbPassword" runat="server"/>
            </div>
            <br />
            <div class="alignCenter">
            <asp:Button ID="btnApiLogin" runat="server" Text="Login" class="button"/>
            </div>
        </div>

        <a class="alignCenter" style="font-weight: bold" href="Register.aspx">Register for API Access</a>
            <asp:Label ID="lblLoginResult" runat="server" Font-Bold="true" Text="" Visible="false" CssClass="alignCenter"></asp:Label>
            <asp:Button ID="btnApiLogout" runat="server" Text="Logout" Visible="false"/>
        -->

        <br />
        <br />

        <!---------------------------------Get All Products/Reviews--------------------------------------->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title text-center mb-20">
                            <h2 class="section-title--one section-title--center">View all Products/Reviews</h2>
                    </div>
                </div>
            </div>
        <div class="alignCenter">
        <asp:Button ID="btnAllProducts" Cssclass="btn--lg btn--black font-weight--reguler text-white" runat="server" Text="Products" />
        <asp:Button ID="btnAllReviews" Cssclass="btn--lg btn--black font-weight--reguler text-white" runat="server" Text="Reviews" />
        <asp:Button ID="btnAllCategory" Cssclass="btn--lg btn--black font-weight--reguler text-white" runat="server" Text="Categories" />
        </div>

        <!---------------------------------Table Display--------------------------------------->
        <div class="alignCenter">
        <asp:GridView ID="gvAllProducts" CssClass="gvDesign" runat="server" HorizontalAlign="Center" autogeneratecolumns="False">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID"/>
                <asp:BoundField DataField="ProductNo" HeaderText="Product No" SortExpression="ProductNo"/>
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName"/>
                <asp:BoundField DataField="ProductDesc" HeaderText="Product Description" SortExpression="ProductDescription"/>
                <asp:BoundField DataField="UnitPrice" HeaderText="Price" SortExpression="Price"/>
                <asp:BoundField DataField="SubCategoryID" HeaderText="Sub Category ID" SortExpression="SubCategoryID"/>
                <asp:BoundField DataField="FeaturedProduct" HeaderText="Featured" SortExpression="Featured"/>
                <asp:BoundField DataField="MainCategoryID" HeaderText="Main Category ID" SortExpression="MainCategoryID"/>
            </Columns>
            <AlternatingRowStyle CssClass="myAltRowClass" />
        </asp:GridView>
        <br />
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
        <br />
        <asp:GridView ID="gvAllCategory" CssClass="gvDesign" runat="server" HorizontalAlign="Center" autogeneratecolumns="False">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id"/>
                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID"/>
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName"/>
                    <asp:BoundField DataField="Parent" HeaderText="Parent" SortExpression="Parent"/>
                </Columns>
                <AlternatingRowStyle CssClass="myAltRowClass" />
            </asp:GridView>
        </div>
        </div>

        <br />
        <br />

        <!------------------------------Get Product by ID----------------------------------->
         <div class="row">
                <div class="col-lg-12">
                    <div class="section-title text-center mb-20">
                            <h2 class="section-title--one section-title--center">Search by ID</h2>
                    </div>
                </div>
         </div>

        <nav class="offcanvas-navigation">
                <ul>
                    <li class="has-children, alignCenter"><span class="menu-expand"><i></i></span>
                        <a class="btn--lg btn--black font-weight--reguler text-white" href="#">Hide/Unhide</a>
                        <ul class="sub-menu" style="display: none;">

        <div class="container">
        <div class="column, alignCenter">
            <label class="label">Product ID:</label>&emsp;&emsp;
            <input type="text" id="tbProductID" runat="server" />&emsp;
            <asp:Button ID="btnProductID" runat="server" Text="Get Product" Cssclass="btn--lg btn--black font-weight--reguler text-white"/>
        </div>
        <asp:GridView ID="gvProductID" CssClass="gvDesign" runat="server" HorizontalAlign="Center" autogeneratecolumns="False">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="DateField" />
                <asp:BoundField DataField="ProductNo" HeaderText="Product No" SortExpression="ProductNo" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                <asp:BoundField DataField="ProductDesc" HeaderText="Product Description" SortExpression="ProductDescription" />
                <asp:BoundField DataField="UnitPrice" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="SubCategoryID" HeaderText="Sub Category ID" SortExpression="SubCategoryID" />
                <asp:BoundField DataField="FeaturedProduct" HeaderText="Featured" SortExpression="Featured" />
                <asp:BoundField DataField="MainCategoryID" HeaderText="Main Category ID" SortExpression="MainCategoryID" />
            </Columns>
        <AlternatingRowStyle CssClass="myAltRowClass" />
        </asp:GridView>
        </div>
        <!---------------------------------------------------------------------------------------->

        <br />

        <!---------------------------------Get Review by ID---------------------------------->
        <div class="column, alignCenter">
            <label class="label">Review ID:</label>&emsp;&emsp;
            <input type="text" id="tbReviewID" runat="server" />&emsp;
            <asp:Button ID="btnReviewID" runat="server" Text="Get Review" Cssclass="btn--lg btn--black font-weight--reguler text-white"/>
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
        
        <!---------------------------------Get Category by ID---------------------------------->
        <div class="column, alignCenter">
            <label class="label">Category ID:</label>&emsp;&emsp;
            <input type="text" id="tbCategoryID" runat="server" />&emsp;
            <asp:Button ID="btnCategoryID" runat="server" Text="Get Category" Cssclass="btn--lg btn--black font-weight--reguler text-white"/>
        </div>
            <asp:GridView ID="gvCategoryID" CssClass="gvDesign" runat="server" HorizontalAlign="Center" autogeneratecolumns="False">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id"/>
                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID"/>
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName"/>
                    <asp:BoundField DataField="Parent" HeaderText="Parent" SortExpression="Parent"/>
                </Columns>
                <AlternatingRowStyle CssClass="myAltRowClass" />
            </asp:GridView>
        </nav>
        <!---------------------------------------------------------------------------------------->

        <br />
        <br />

        <!------------------------------------Create a Product------------------------------------->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title text-center mb-20">
                            <h2 class="section-title--one section-title--center">Create a Product</h2>
                    </div>
                </div>
            </div>
        <div>
            <div class="column">

                <%--<label for="tbCreateProductId" class="label">ProductId:</label>
                <input type="number" id="tbCreateProductId" runat="server" />--%>

                <label for="tbProductNo" class="label">ProductNo:</label>
                <input type="text" id="tbProductNo" runat="server" />

                <label for="tbProductName" class="label">ProductName:</label>
                <input type="text" id="tbProductName" runat="server" />

                <label for="tbProductDescription" class="label">ProductDescription:</label>
                <input type="text" id="tbProductDescription" runat="server" />

                <label for="tbPrice" class="label">Price:</label>
                <input type="number" id="tbPrice" runat="server" />

                <label for="tbMainCategoryID" class="label">MainCategoryID:</label>
                <input type="number" id="tbMainCategoryID" runat="server" />

                <label for="tbSubCategoryID" class="label">SubCategoryID:</label>
                <input type="number" id="tbSubCategoryID" runat="server" />

                <label for="tbMainCategoryName" class="label">MainCategoryName:</label>
                <input type="text" id="tbMainCategoryName" runat="server" />

                <label for="tbSubCategoryName" class="label">SubCategoryName:</label>
                <input type="text" id="tbSubCategoryName" runat="server" />

                <label for="tbProductCaption" class="label">ProductCaption:</label>
                <input type="text" id="tbProductCaption" runat="server" />

                <label for="tbProductRating" class="label">ProductRating:</label>
                <input type="number" id="tbProductRating" runat="server" />

                <label for="tbFeatured" class="label">Featured:</label>
                <input type="number" id="tbFeatured" runat="server" />

                <label for="tbProductInfo" class="label">ProductInfo:</label>
                <input type="text" id="tbProductInfo" runat="server" />

                
                <br />
                <br />

                <div class="alignCenter">
                <asp:Button ID="btnCreateProduct" Cssclass="btn--lg btn--black font-weight--reguler text-white" runat="server" Text="Create a Product"/>
                </div>
                </div>
                </div>

            <!---------------------------------------------------------------------------------------->

                <br />
                <br />

            <!----------------------------Update Product by ID-------------------------->
            <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title text-center mb-20">
                            <h2 class="section-title--one section-title--center">Update Product by ID</h2>
                    </div>
                </div>
            </div>
                <div class="column, alignCenter">
                    <label for="tbUpdateProductID" class="label">Product ID:</label>&emsp;&emsp;
                    <input type="text" id="tbUpdateProductID" runat="server" />&emsp;
                    <asp:Button ID="btnUpdateProduct" runat="server" Text="Update" Cssclass="btn--lg btn--black font-weight--reguler text-white"/>
                </div>
            </div>
            
        </div> 
        <!---------------------------------------------------------------------------------------->
        <br />
        <br />

        <!-----------------------------------Create a review-------------------------------->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title text-center mb-20">
                            <h2 class="section-title--one section-title--center">Create a Review</h2>
                    </div>
                </div>
            </div>
         <div>
            <div class="column">
                <!---------------------Add and Update Review Inputs-------------------------->
                
                <label for="tbRProductID" class="label">ProductID:</label>
                <input type="text" id="tbRProductId" runat="server" />

                <label for="tbUserName" class="label">User Name:</label>
                <input type="text" id="tbUserName" runat="server" />

                <label for="tbRating" class="label">Rating:</label>
                <input type="text" id="tbRating" runat="server" />

                <label for="tbUserReview" class="label">User Review:</label>
                <input type="text" id="tbUserReview" runat="server" />

                <br />
                <br />
                <div class="alignCenter">
                <asp:Button ID="btnCreateReview" Cssclass="btn--lg btn--black font-weight--reguler text-white" runat="server" Text="Add a Review"/>
                </div>
            </div>
             </div>
                <!---------------------------------------------------------------------------------------->

                <br />
                <br />

            

                <!------------------------------Update Review by ID-------------------------------->
            <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title text-center mb-20">
                            <h2 class="section-title--one section-title--center">Update Review by ID</h2>
                    </div>
                </div>
            </div>
                <br />
                <div class="column, alignCenter">
                    <label for="tbUpdateReviewID" class="label">Update Review ID:</label>&emsp;&emsp;
                    <input type="text" id="tbUpdateReviewID" runat="server" />&emsp;
                    <asp:Button ID="btnUpdateReview" runat="server" Text="Update" Cssclass="btn--lg btn--black font-weight--reguler text-white"/>
                </div>
            </div> 
        <!---------------------------------------------------------------------------------------------------->

        <br />
        <br />

        <!---------------------------------Delete Product or Review by ID---------------------------------->
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title text-center mb-20">
                            <h2 class="section-title--one section-title--center">Delete by ID</h2>
                    </div>
                </div>
            </div>

        <nav class="offcanvas-navigation">
            <ul>
                <li class="has-children, alignCenter"><span class="menu-expand"><i></i></span>
                    <a class="btn--lg btn--black font-weight--reguler text-white" href="#">Hide/Unhide</a>
                    <ul class="sub-menu" style="display: none;">

        <div class="container">
        <!---------------------------------Delete Product by ID------------------------------------------>
        <div class="column, alignCenter">
            <label class="label">Product ID:</label>&emsp;&emsp;
            <input type="text" id="tbDeleteProductID" runat="server" />&emsp;
            <asp:Button ID="btnDeleteProductID" runat="server" Text="Delete" Cssclass="btn--lg btn--black font-weight--reguler text-white"/>
        </div>
        <!-------------------------------------------------------------------------------------------->

        <br />

        <!------------------------------------Delete Review by ID---------------------------------->
        <div class="column, alignCenter">
            <label class="label">Review ID:</label>&emsp;&emsp;
            <input type="text" id="tbDeleteReviewID" runat="server" />&emsp;
            <asp:Button ID="btnDeleteReviewID" runat="server" Text="Delete" Cssclass="btn--lg btn--black font-weight--reguler text-white"/>
        </div>
        </div>
        </nav>
        <!---------------------------------------------------------------------------------------->

        <br />
        <br />

          <%--<!--Get All Reviews-->
        <asp:Button ID="Button1" CssClass="alignCenter" runat="server" Text="Get All Reviews" />
        <asp:GridView ID="GridView1" CssClass="gvDesign" runat="server" HorizontalAlign="Center" autogeneratecolumns="False">
            <Columns>
                <asp:BoundField DataField="ReviewID" HeaderText="ReviewID" SortExpression="ReviewID"/>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProdcutID"/>
                <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName"/>
                <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating"/>
                <asp:BoundField DataField="UserReview" HeaderText="UserReview" SortExpression="UserRview"/>
            </Columns>
            <AlternatingRowStyle CssClass="myAltRowClass" />
        </asp:GridView>--%>


        <!----------------------------Imports all products and reviews---------------------------->
        <%--<h2 class="alignCenter">Import all products or reviews to database</h2>
        <br />
        <!----------------------------------Import All Products----------------------------->
        <div class="alignCenter">
            <asp:button runat="server" id="btnImportAllProducts" text="Products" class="button"/>
        </div>
        <br />
        <!------------------------------- --Import All Reviews------------------------------>
        <div class="alignCenter">
            <asp:button runat="server" id="btnImportAllReviews" text="Reviews" class="button"/>
        </div>

        <br />
        <br />

        <!---------------------------------Import Product by ID----------------------------->
        <h2 class="alignCenter">Import a product by ID</h2>
        <br />
        <div class="alignCenter">
            <label class="label">Product ID:</label>&emsp;&emsp;
            <input type="text" id="tbImportProductID" runat="server" />&emsp;
            <asp:button runat="server" id="btnImportProductID" text="Import" class="button"/>
        </div>--%>

    </div>
</asp:Content>
