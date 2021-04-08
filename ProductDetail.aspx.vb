﻿Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing

Public Class ProductDetail
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("ProductID") <> "" Then
            Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString
            Dim connProduct As SqlConnection
            Dim cmdProduct As SqlCommand
            Dim drProduct As SqlDataReader
            Dim strSQL As String = "Select * from Product Where ProductID = " & CInt(Request.QueryString("ProductID"))
            connProduct = New SqlConnection(strConn)
            cmdProduct = New SqlCommand(strSQL, connProduct)
            connProduct.Open()
            drProduct = cmdProduct.ExecuteReader(CommandBehavior.CloseConnection)
            If drProduct.Read() Then
                lblProductNo.Text = drProduct.Item("ProductNo")
                lblProductName.Text = drProduct.Item("ProductName")
                lblProductNameHeader.Text = drProduct.Item("ProductName")
                lblProductDescription.Text = drProduct.Item("ProductDescription")
                ' implement image control on productdetail.aspx
                imgProduct1.ImageUrl = "images/category/" + Trim(drProduct.Item("ProductNo")) + ".jpg"
                imgProduct2.ImageUrl = "images/product-detail/" + Trim(drProduct.Item("ProductNo")) + "1.jpg"
                productHL1.NavigateUrl = "images/category/" + Trim(drProduct.Item("ProductNo")) + ".jpg"
                productHL2.NavigateUrl = "images/product-detail/" + Trim(drProduct.Item("ProductNo")) + "1.jpg"
                productSmall1.ImageUrl = "images/product-detail/" + Trim(drProduct.Item("ProductNo")) + "Small1.jpg"
                productSmall2.ImageUrl = "images/product-detail/" + Trim(drProduct.Item("ProductNo")) + "Small2.jpg"
                If Session("Customer") <> "" Then
                    lblPrice.Text = drProduct.Item("UnitPrice") * 0.8
                    lblPrice.ForeColor = Color.Blue
                Else
                    lblPrice.Text = drProduct.Item("UnitPrice")
                End If
            End If
        End If
    End Sub

    Private Sub btnAddtoCart_Click(sender As Object, e As EventArgs) Handles btnAddtoCart.Click
        '*** get CartNo
        Dim strCartNo As String
        If HttpContext.Current.Request.Cookies("CartNo") Is Nothing Then
            strCartNo = GetRandomCartNoUsingGUID(10)
            Dim CookieTo As New HttpCookie("CartNo", strCartNo)
            HttpContext.Current.Response.AppendCookie(CookieTo)
        Else
            Dim CookieBack As HttpCookie
            CookieBack = HttpContext.Current.Request.Cookies("CartNo")
            strCartNo = CookieBack.Value
        End If

        ' set up ado objects and variables
        Dim strConnectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString
        Dim conn As New SqlConnection(strConnectionString)
        Dim drCheck As SqlDataReader
        Dim strSQLStatement As String
        Dim cmdSQL As SqlCommand

        ' get product price
        strSQLStatement = "Select * From Product Where ProductNo = '" & lblProductNo.Text & "'"
        cmdSQL = New SqlCommand(strSQLStatement, conn)
        conn.Open()
        drCheck = cmdSQL.ExecuteReader()
        Dim sngPrice As Single = 0.00
        If drCheck.Read() Then
            If Session("Customer") <> "" Then
                sngPrice = drCheck.Item("UnitPrice") * 0.8
            Else
                sngPrice = drCheck.Item("UnitPrice")
            End If
        End If
        drCheck.Close()

        ' check if this product already exits in the cart
        strSQLStatement = "SELECT * FROM Cart WHERE CartNo = '" & strCartNo & "' and ProductNo = '" & Trim(lblProductNo.Text) & "'"
        cmdSQL.CommandText = strSQLStatement
        drCheck = cmdSQL.ExecuteReader()
        If drCheck.Read() Then
            ' updat the quantity
            strSQLStatement = "Update Cart set Quantity = '" & CInt(tbQuantity.Text) & "' + Quantity where ProductNo = '" & Trim(lblProductNo.Text) & "' and CartNo = '" & strCartNo & "'"

        Else
            strSQLStatement = "INSERT INTO Cart (CartNo, ProductNo, ProductName, Quantity, Price) values('" & strCartNo & "', '" & lblProductNo.Text & "', '" & lblProductName.Text & "', " & CInt(tbQuantity.Text) & ", " & sngPrice & ")"
        End If
        drCheck.Close() ' When a DataReader is open, its Connection is dedicated to the its associated SQLcommand.
        cmdSQL.CommandText = strSQLStatement
        Dim drCart As SqlDataReader
        drCart = cmdSQL.ExecuteReader(CommandBehavior.CloseConnection)
        Response.Redirect("ViewCart.aspx")
    End Sub

    Public Function GetRandomCartNoUsingGUID(ByVal length As Integer) As String
        'Get the GUID
        Dim guidResult As String = System.Guid.NewGuid().ToString()
        'Remove the hyphens
        guidResult = guidResult.Replace("-", String.Empty)
        'Make sure length is valid
        If length <= 0 OrElse length > guidResult.Length Then
            Throw New ArgumentException("Length must be between 1 and " & guidResult.Length)
        End If
        'Return the first length bytes
        Return guidResult.Substring(0, length)
    End Function
End Class