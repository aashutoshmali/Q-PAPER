Imports System

Partial Class Footer
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       

        If Not IsPostBack Then
            'lbluser.Text = Session("uname").ToString
            'lbldt.Text = Date.Now.ToString("dd/MM/yyyy HH:mm:ss").ToString
            'lblrole.Text = Session("role").ToString
        End If
    End Sub

End Class
