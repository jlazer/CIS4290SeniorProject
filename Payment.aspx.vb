Imports System.Net
Imports System.IO
Public Class Payment
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAPI_Click(sender As Object, e As EventArgs) Handles btnAPI.Click
        ' test server
        Dim post_url As String = "https://test.authorize.net/gateway/transact.dll"
        ' name/value pairs
        Dim post_values As New Dictionary(Of String, String)
        post_values.Add("x_login", "9bB6pfr68F62UE9W") ' your login ID 2JZ4xm8hQXw
        post_values.Add("x_tran_key", "9bB6pfr68F62UE9W") ' your transaction key 5V4WyZ9a8p826w9T
        post_values.Add("x_delim_data", "TRUE")
        post_values.Add("x_delim_char", ",")
        post_values.Add("x_relay_response", "FALSE")
        post_values.Add("x_type", "AUTH_ONLY")
        post_values.Add("x_method", "CC")
        post_values.Add("x_card_num", tbCreditCard.Text)
        post_values.Add("x_exp_date", "0122")
        post_values.Add("x_amount", "19.99")
        post_values.Add("x_description", "Sample Transaction")
        post_values.Add("x_first_name", "John")
        post_values.Add("x_last_name", "Doe")
        post_values.Add("x_address", "1234 Street")
        post_values.Add("x_state", "WA")
        post_values.Add("x_zip", "98004")
        ' converts them to the proper format "x_login=username&x_tran_key=a1B2c3D4"
        Dim post_string As String = ""
        For Each field As KeyValuePair(Of String, String) In post_values
            post_string &= field.Key & "=" & HttpUtility.UrlEncode(field.Value) & "&"
        Next
        post_string = Left(post_string, Len(post_string) - 1)
        ' create an HttpWebRequest object to communicate with Authorize.net
        Dim objRequest As HttpWebRequest = CType(WebRequest.Create(post_url),
        HttpWebRequest)
        objRequest.Method = "POST"
        objRequest.ContentLength = post_string.Length
        objRequest.ContentType = "application/x-www-form-urlencoded"
        ' send the data in a stream
        Dim myWriter As StreamWriter = Nothing
        myWriter = New StreamWriter(objRequest.GetRequestStream())
        myWriter.Write(post_string)
        myWriter.Close()
        ' create an HttpWebResponse object to process the returned values in a stream and Convert it into a string
        Dim objResponse As HttpWebResponse = CType(objRequest.GetResponse(),
        HttpWebResponse)
        Dim responseStream As New StreamReader(objResponse.GetResponseStream())
        Dim post_response As String = responseStream.ReadToEnd()
        responseStream.Close()
        ' break the response string into an array
        Dim response_array As Array = Split(post_response, post_values("x_delim_char"), -1)
        ' the results are output to the screen in the form of an html numbered list.
        Dim strReturnArray As String = "<OL>"
        For Each value In response_array
            strReturnArray = strReturnArray + "<LI>" & value & "&nbsp;</LI>" & vbCrLf
        Next
        strReturnArray = strReturnArray + "</OL>"
        lblReturnArray.Text = strReturnArray
    End Sub
End Class