<%@ Page Async="True" Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="Login.aspx.vb" Inherits="CIS4290SeniorProjectOnlineStore.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact-form-wrap  section-space--mt_60">
    <h5 class="mb-10" style="text-align:center">Login your account</h5>
    <asp:Label ID="lblMessage" runat="server" Text="Login Failed" Visible="false" CssClass="mb-10" style="text-align: center"></asp:Label>
    <form id="contact-form" class="mt-30" method="post">
    <div class="contact-form">
        <div class="contact-input">
            <div class="contact-inner">
                <asp:TextBox ID="tbEmail" runat="server" placeholder="Email"></asp:TextBox>
            </div>
            <div class="contact-inner">
                <asp:TextBox ID="tbPassword" runat="server" placeholder="Password"></asp:TextBox>
            </div>
        </div>
        <div class="button-box mt-25">
            <asp:Button ID="btnLogin" runat="server" Text="Log in" CssClass="btn btn--full btn--black" />
        </div>
    </div>
    </form>
</div>
</asp:Content>
