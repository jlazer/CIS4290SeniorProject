Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Net.Http
Imports System.Net.Http.Headers
Imports Newtonsoft.Json

Public Class ProductDetail
    Inherits System.Web.UI.Page

    Dim httpClient As New HttpClient

    Protected Async Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("ProductID") <> "" Then

            Dim uri As String = "https://localhost:44368/api/product/" & CInt(Request.QueryString("ProductID"))
            Dim task = Await httpClient.GetAsync(uri)
            Dim jsonString = Await task.Content.ReadAsStringAsync()
            If task.IsSuccessStatusCode Then
                Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(jsonString)
                lblProductNo.Text = table.Rows(0)(1).ToString
                lblProductName.Text = table.Rows(0)(2).ToString
                lblProductNameHeader.Text = table.Rows(0)(2).ToString
                lblProductDescription.Text = table.Rows(0)(3).ToString
                imgProduct1.ImageUrl = "images/category/" + Trim(table.Rows(0)(1).ToString) + ".jpg"
                imgProduct2.ImageUrl = "images/product-detail/" + Trim(table.Rows(0)(1).ToString) + "1.jpg"
                productHL1.NavigateUrl = "images/category/" + Trim(table.Rows(0)(1).ToString) + ".jpg"
                productHL2.NavigateUrl = "images/product-detail/" + Trim(table.Rows(0)(1).ToString) + "1.jpg"
                productSmall1.ImageUrl = "images/product-detail/" + Trim(table.Rows(0)(1).ToString) + "Small1.jpg"
                productSmall2.ImageUrl = "images/product-detail/" + Trim(table.Rows(0)(1).ToString) + "Small2.jpg"
                lblPrice.Text = table.Rows(0)(4).ToString
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

        ' maybe needs edit
        ' set up ado objects and variables
        Dim strConnectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString
        Dim conn As New SqlConnection(strConnectionString)
        Dim drCheck As SqlDataReader
        Dim strSQLStatement As String
        Dim cmdSQL As SqlCommand

        ' needs edit
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