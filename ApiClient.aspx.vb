Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Net.Http
Imports System.Net.Http.Headers
Imports Newtonsoft.Json

Public Class ApiClient
    Inherits System.Web.UI.Page

    Dim httpClient As New HttpClient
    Dim strCartID As String
    Private Async Sub btnAllProducts_ClickAsync(sender As Object, e As EventArgs) Handles btnAllProducts.Click
        Dim uri As String = "https://localhost:44368/api/product"
        Dim task = Await httpClient.GetAsync(uri)
        Dim jsonString = Await task.Content.ReadAsStringAsync()
        If task.IsSuccessStatusCode Then
            Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(jsonString)
            gvAllProducts.DataSource = table
            gvAllProducts.DataBind()
        End If

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

End Class