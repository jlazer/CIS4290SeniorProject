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

    Private Async Sub btnAllReviews_ClickAsync(sender As Object, e As EventArgs) Handles btnAllReviews.Click
        Dim uri As String = "https://localhost:44338/api/review"
        Dim task = Await httpClient.GetAsync(uri)
        Dim jsonString = Await task.Content.ReadAsStringAsync()
        If task.IsSuccessStatusCode Then
            Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(jsonString)
            gvAllReviews.DataSource = table
            gvAllReviews.DataBind()
        End If

    End Sub

    Public Async Sub btnReviewID_ClickAsync(sender As Object, e As EventArgs) Handles btnReviewID.Click

        Dim uri As String = "https://localhost:44338/api/review/" & tbReviewID.Value
        Dim task = Await httpClient.GetAsync(uri)
        Dim jsonString As String = Await task.Content.ReadAsStringAsync()
        If task.IsSuccessStatusCode Then
            Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(jsonString)
            gvReviewID.DataSource = table
            gvReviewID.DataBind()
        End If

    End Sub

    Private Async Sub btnCreateReview_ClickAsync(sender As Object, e As EventArgs) Handles btnCreateReview.Click
        Dim myJson As String = ("{'ProductID': '" & tbRProductId.Value & "', 'UserName': '" & tbUserName.Value & "', 'Rating': '" _
            & tbRating.Value & "', 'UserReview': '" & tbUserReview.Value & "'}")

        httpClient.DefaultRequestHeaders.Authorization = New AuthenticationHeaderValue("Bearer", getToken())
        Dim uri As String = "https://localhost:44338/api/review/"
        Dim response = Await httpClient.PostAsync(uri, New StringContent(myJson, Encoding.UTF8, "application/json"))
        btnAllReviews_ClickAsync(btnAllReviews, EventArgs.Empty)
    End Sub

    Private Async Sub btnUpdateReview_ClickAsync(sender As Object, e As EventArgs) Handles btnUpdateReview.Click
        Dim myJson As String = ("{'ProductID': '" & tbRProductId.Value & "', 'UserName': '" & tbUserName.Value & "', 'Rating': '" _
            & tbRating.Value & "', 'UserReview': '" & tbUserReview.Value & "'}")

        httpClient.DefaultRequestHeaders.Authorization = New AuthenticationHeaderValue("Bearer", getToken())
        Dim uri As String = "https://localhost:44338/api/review/" & tbUpdateReviewID.Value
        Dim response = Await httpClient.PutAsync(uri, New StringContent(myJson, Encoding.UTF8, "application/json"))
        btnAllReviews_ClickAsync(btnAllReviews, EventArgs.Empty)
        btnReviewID_ClickAsync(btnReviewID, EventArgs.Empty)
    End Sub

    Private Async Sub btnDeleteReviewID_ClickAsync(sender As Object, e As EventArgs) Handles btnDeleteReviewID.Click
        httpClient.DefaultRequestHeaders.Authorization = New AuthenticationHeaderValue("Bearer", getToken())
        Dim uri As String = "https://localhost:44338/api/review/" & tbDeleteReviewID.Value
        Await httpClient.DeleteAsync(uri)
        btnAllReviews_ClickAsync(btnAllReviews, EventArgs.Empty)
        btnReviewID_ClickAsync(btnReviewID, EventArgs.Empty)
    End Sub

    Private Async Sub btnImportAllReviews_ClickAsync(sender As Object, e As EventArgs) Handles btnImportAllReviews.Click
        Dim uri As String = "https://localhost:44338/api/review"
        Dim task = Await httpClient.GetAsync(uri)
        Dim jsonString = Await task.Content.ReadAsStringAsync()

        Dim sqlDr As SqlDataReader
        Dim strSQLStatement As String
        Dim cmdSQL As SqlCommand
        Dim strConnectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString
        Dim conn As New SqlConnection(strConnectionString)
        conn.Open()
        strSQLStatement = "DECLARE @json NVARCHAR(max) SET @json = N'" & jsonString & "'; INSERT INTO Review  SELECT * FROM OPENJSON(@json) WITH (productID int, userName varchar(30), rating int, userReview varchar(300))"
        cmdSQL = New SqlCommand(strSQLStatement, conn)
        sqlDr = cmdSQL.ExecuteReader()
        conn.Close()
    End Sub
    Function getToken() As String
        Dim jwtToken As String
        If (Request.Cookies("JwtCookie") IsNot Nothing) Then
            If (Request.Cookies("JwtCookie")("JWT") IsNot Nothing) Then
                jwtToken = Request.Cookies("JwtCookie")("JWT")
                Return jwtToken
            End If
        End If
        Return Nothing
    End Function


End Class