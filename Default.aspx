<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="Default.aspx.vb" Inherits="CIS4290SeniorProjectOnlineStore._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLDatabaseConnection %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
            <!-- About Us Area Start -->
        <div class="about-us-area section-space--ptb_120">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="about-us-content_6 text-center">
                            <h2>CIS 4290 Coffee Store</h2>
                            <%-- Test comment --%>
                            <p>An online store project with the minimalist and simple state of mind taken in the production and distribution of our items. When having a cup of hot coffee or a glass of iced tea, 
                                we aim to provide a sense of meaning in not just the experience, but also in the simplicity.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About Us Area End -->
</asp:Content>
