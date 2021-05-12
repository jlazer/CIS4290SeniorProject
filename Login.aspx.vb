Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.Http
Imports System.Net.Http.Headers
Imports Newtonsoft.Json

Public Class Login
    Inherits System.Web.UI.Page
    Dim httpClient As New HttpClient

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Async Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        If tbEmail.Text <> "" Then
            ' Session("Customer") = Trim(tbEmail.Text)
            ' Response.Redirect("Default.aspx")

            Dim uri As String = "https://localhost:44368/api/customer/Email?Email=" & tbEmail.Text
            Dim task = Await httpClient.GetAsync(uri)
            Dim jsonString = Await task.Content.ReadAsStringAsync()
            If task.IsSuccessStatusCode Then
                Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(jsonString)
                If table.Rows.Count > 0 Then
                    If Trim(tbEmail.Text) = table.Rows(0)(1).ToString And Trim(tbPassword.Text) = table.Rows(0)(2).ToString Then
                        If table.Rows(0)(3).ToString = 0 Then
                            Session("Customer") = Trim(tbEmail.Text)
                            Response.Redirect("Default.aspx", False)
                        Else
                            Session("Admin") = Trim(tbEmail.Text)
                            Response.Redirect("Default.aspx", False)
                        End If
                    Else
                        lblMessage.Visible = True
                    End If
                ElseIf table.Rows.Count = 0 Then
                        lblMessage.Visible = True
                End If
            Else
                lblMessage.Visible = True
            End If


            'Dim uri As String = "https://localhost:44368/api/customer/"
            'Dim task = Await httpClient.GetAsync(uri)
            'Dim email1 As String = ""
            'Dim email2 As String = ""

            'Dim jsonString = Await task.Content.ReadAsStringAsync()
            'If task.IsSuccessStatusCode Then
            '    Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(jsonString)
            '    email1 = table.Rows(0)(1).ToString
            '    email2 = table.Rows(1)(1).ToString

            'End If

        End If
        '    System.Diagnostics.Debug.WriteLine("email1: " + email1)
        '    System.Diagnostics.Debug.WriteLine("email2: " + email2)
        '    System.Diagnostics.Debug.WriteLine(tbEmail.Text)

        '    If Trim(tbEmail.Text) = Trim(email1) Then
        '        Session("Customer") = Trim(tbEmail.Text)
        '        Response.Redirect("Default.aspx")
        '    ElseIf Trim(tbEmail.Text) = Trim(email2) Then
        '        Session("Customer") = Trim(tbEmail.Text)
        '        Response.Redirect("Default.aspx")
        '    Else
        '        lblMessage.Visible = True
        '        lblMessage.Text = "Please enter a valid Email or Password."
        '    End If
        'Else
        '    lblMessage.Visible = True
        '    lblMessage.Text = "Please enter something."
        'End If
    End Sub
End Class