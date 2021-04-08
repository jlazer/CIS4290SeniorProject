Imports System.Data
Imports System.Data.SqlClient
Public Class Category
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
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
            SqlDSSubCategory.SelectCommand = "Select * From Category Where parent = " & CInt(Request.QueryString("MainCategoryID"))
            lblMainCategoryName.Text = Request.QueryString("MainCategoryName")
            ' assign selectcommand to SqlDSProductList for the featured products of the Main Category
            SqlDSProductList.SelectCommand = "Select * From Product Where productfeature = 1 and maincategoryid = " & CInt(Request.QueryString("MainCategoryID"))
        End If
        If Request.QueryString("SubCategoryID") <> "" Then
            SqlDSProductList.SelectCommand = "Select * From Product Where subcategoryid = " & CInt(Request.QueryString("SubCategoryID"))
            lblProductList.Text = Request.QueryString("SubCategoryName")
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