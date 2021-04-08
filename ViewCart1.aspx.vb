Public Class ViewCart1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '*** get CartNo
        Dim strCartNo As String
        If Not HttpContext.Current.Request.Cookies("CartNo") Is Nothing Then
            Dim CookieBack As HttpCookie
            CookieBack = HttpContext.Current.Request.Cookies("CartNo")
            strCartNo = CookieBack.Value
            SqlDSCart.SelectCommand = "Select * from Cart Where CartNo = '" & strCartNo & "'"
        End If
    End Sub

End Class