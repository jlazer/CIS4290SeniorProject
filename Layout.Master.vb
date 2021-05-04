Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Net.Http
Imports System.Net.Http.Headers
Imports Newtonsoft.Json
Public Class Layout
    Inherits System.Web.UI.MasterPage

    Dim httpClient As New HttpClient

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Customer") <> "" Then
            hlLogin.Visible = False
            hlLogout.Visible = True
            lblCustomer.Text = Session("Customer")
            lblCustomer.Visible = True
        End If
    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If tbSearch.Text <> "" Then
            Dim strURL As String = ""
            ' check the number of works in the textbox
            Dim strCheck As String = " "
            If Not Trim(tbSearch.Text).Contains(strCheck) Then
                ' check if there is a match in the Product table
                ' all the database objects declared and instantiated 
                ' Dim strSQL As String = "Select * from Product Where ProductID = '" & Trim(tbSearch.Text) & "'"
                ' assign a dynamic value for strURL
                strURL = "Category.aspx?SearchString=" & Trim(tbSearch.Text)
                Response.Redirect(strURL)
            Else
                strURL = "Category.aspx?SearchString=" & Trim(tbSearch.Text)
                Response.Redirect(strURL)
            End If
        End If
    End Sub

End Class