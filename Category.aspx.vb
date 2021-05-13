﻿Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Net.Http
Imports System.Net.Http.Headers
Imports Newtonsoft.Json

Public Class Category
    Inherits System.Web.UI.Page

    Dim httpClient As New HttpClient

    Protected Async Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("SearchString") <> "" Then
            ' all the database objects declared and instantiated 
            Dim strSQL As String = "Select * from Product Where ProductName LIKE '%" & Request.QueryString("SearchString") & "%'"
            SqlDSProductList.SelectCommand = strSQL
            lblProductList.Text = "Search Results for " & Request.QueryString("SearchString")
        End If
        If Request.QueryString("MainCategoryID") <> "" Then
            If Session("Customer") <> "" Then
                Repeater1.Visible = False
                Repeater2.Visible = True
            End If
            Dim uri As String = "https://localhost:44368/api/category/Parent?Parent=" & CInt(Request.QueryString("MainCategoryID"))
            Dim task = Await httpClient.GetAsync(uri)
            Dim jsonString = Await task.Content.ReadAsStringAsync()
            If task.IsSuccessStatusCode Then
                Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(jsonString)
                rpSubCategory.DataSource = table
                rpSubCategory.DataBind()
            End If

            lblMainCategoryName.Text = Request.QueryString("MainCategoryName")
            ' assign selectcommand to SqlDSProductList for the featured products of the Main Category
            ' SqlDSProductList.SelectCommand = "Select * From Product Where productfeature = 1 and maincategoryid = " & CInt(Request.QueryString("MainCategoryID"))
            Dim url As String = "https://localhost:44368/api/product/Featured?MainCategory=" & CInt(Request.QueryString("MainCategoryID"))
            Dim featuredtask = Await httpClient.GetAsync(url)
            Dim featuredjsonString = Await featuredtask.Content.ReadAsStringAsync()
            If featuredtask.IsSuccessStatusCode Then
                Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(featuredjsonString)
                rpProductList.DataSource = table
                rpProductList.DataBind()
                Repeater1.DataSource = table
                Repeater1.DataBind()
                Repeater2.DataSource = table
                Repeater2.DataBind()
            End If
        End If
        If Request.QueryString("SubCategoryID") <> "" Then
            lblProductList.Text = Request.QueryString("SubCategoryName")

            Dim uri As String = "https://localhost:44368/api/product/SubCategoryID?SubCategory=" & CInt(Request.QueryString("SubCategoryID"))
            Dim task = Await httpClient.GetAsync(uri)
            Dim jsonString = Await task.Content.ReadAsStringAsync()
            If task.IsSuccessStatusCode Then
                Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(jsonString)
                rpProductList.DataSource = table
                rpProductList.DataBind()
                Repeater1.DataSource = table
                Repeater1.DataBind()
                Repeater2.DataSource = table
                Repeater2.DataBind()
            End If
        End If
    End Sub

    Private Sub SqlDSProductList_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDSProductList.Selected
        If e.AffectedRows = 0 Then
            lblProductList.Text = "Not Found"
        End If
    End Sub

    Public Function GetWholesalePrice(ByVal OriginalPrice As Decimal) As String
        Dim decWholesalePrice As Decimal = 0.00
        If Session("Customer") <> "" Then
            decWholesalePrice = OriginalPrice * 0.8
        Else
            decWholesalePrice = OriginalPrice
        End If
        Return decWholesalePrice
    End Function
End Class