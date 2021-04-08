<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="Logout.aspx.vb" Inherits="CIS4290SeniorProjectOnlineStore.Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h5 class="mb-10" style="text-align:center">
            <asp:Label ID="lblAccount" runat="server" Text=""></asp:Label></h5>
        <div class="button-box mt-25">
            <asp:Button ID="btnLogout" runat="server" Text="Log out" CssClass="btn btn--full btn--black" />
        </div>
</asp:Content>
