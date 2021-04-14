Imports System.Data
Imports System.Data.SqlClient

Public Class Checkout
    Inherits System.Web.UI.Page
    Public strCartNo As String = " "
    Dim CookieBack As HttpCookie = HttpContext.Current.Request.Cookies("CartNo")
    Public strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' get CartNo
        If Not CookieBack Is Nothing Then
            strCartNo = CookieBack.Value
        End If
        sqlDSCart1.SelectCommand = "Select * From Cart Where CartNo = '" & strCartNo & "'"
        ' get cart total
        Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString
        Dim conntp As SqlConnection
        Dim cmdtp As SqlCommand
        Dim drtp As SqlDataReader
        Dim strSQL As String = "Select sum(price*quantity) AS total From Cart Where CartNo = '" & strCartNo & "' "
        conntp = New SqlConnection(strConn)
        cmdtp = New SqlCommand(strSQL, conntp)
        conntp.Open()
        drtp = cmdtp.ExecuteReader(CommandBehavior.CloseConnection)
        If drtp.Read() Then
            lblTotal.Text = drtp.Item("total").ToString
        End If
    End Sub

End Class