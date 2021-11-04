Imports System.Data
Imports System.Data.oledb
Imports System.IO


Partial Class SelectionForm
    Inherits System.Web.UI.Page
    Private Const SaltByteSize As Integer = 16
    Dim cmd As oledbCommand
    Dim da As oledbDataAdapter
    Dim ds As New DataSet
    Dim dv As DataView
    Dim ipopath As String = ""
    Dim selPwd As New oledbCommand
    Dim readPwd As oledbDataReader
    Dim chkFlag As Boolean = True
    Dim dt As New DataTable
    Dim scriptString As String
    Dim adp As oledbDataAdapter
    Dim conn As New OleDbConnection(ConfigurationManager.AppSettings("path"))

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Me.txtuser.Attributes.Add("onkeypress", "fnuser();")
        Me.txtpwd.Attributes.Add("onkeypress", "fnpwd();")
        Me.btnOK.Attributes.Add("onclick", "return fnSubmit();")


        Dim str As String = "<script language='javascript'>window.history.forward();</script>"
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "delete", str, False)

        '-------------------------------change---------------------
        If Not IsPostBack Then
            txtuser.Focus()
            '-------------------------------------------------------
        End If
    End Sub







    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnOK.Click
        If txtuser.Text.ToString.Contains(";") = True Or txtuser.Text.ToString.Contains("'") = True Or txtuser.Text.ToString.Contains(",") = True Then
            lblmsg.Text = "Invalid User Id & Password"
            lblmsg.Visible = True
            txtuser.Focus()
            Exit Sub
        End If

        Dim fillGrid As New OleDbDataAdapter("select * from staff where uid='" & txtuser.Text.Trim & "'", conn)
        fillGrid.Fill(ds, "Find")

        Dim row() As DataRow
        row = ds.Tables("Find").Select("pass='" & txtpwd.Text.Trim & "'")
        If row.Length <> 0 Then

            Session("uname") = txtuser.Text
            Session("uid") = row(0).Item(0).ToString
            Session("userRole") = row(0).Item(2).ToString
            Server.Transfer("main1.html")

            txtuser.Text = ""
            txtpwd.Text = ""

        Else
            lblmsg.Text = "Invalid User Id & Password"
            lblmsg.Visible = True
            txtuser.Focus()


            '----------------------------------------------------

        End If



        conn.Close()
    End Sub



    




End Class
