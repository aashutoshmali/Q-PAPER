Imports System.Data
Imports System.Data.SqlClient
Partial Class Header1
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection
    Dim cmd As SqlCommand
    Dim adp As SqlDataAdapter
    Dim da As SqlDataAdapter
    Dim dspop As New DataSet
    Dim tempDt As New DataTable
    Dim str, strScript, strCategory, strLMKey, key, lumSumAmt, baseBrokerage, addBrokerage, slabRate, LM, received, type As String
    Dim cnt As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("ucode") = "" Then
            '   Response.Write("<script language = 'javascript'> window.parent.location= 'SelectionForm.aspx';</script>")
            Exit Sub
        Else
            conn = New SqlConnection(Session("connection").ToString)

           
        End If
    End Sub
    Sub remainder()
        If IsNothing(Session("issuekey")) Then
            Exit Sub
        End If
        cmd = New SqlCommand
        cmd.CommandText = "Payout_SelectReceivablePopup"
        cmd.Parameters.Add(New SqlParameter("@issuekey", SqlDbType.NVarChar, 50, ParameterDirection.Input)).Value = Session("issuekey")
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Connection = conn
        Try
            da = New SqlDataAdapter(cmd)
            da.Fill(dspop, "pop")
            If dspop.Tables("pop").Rows.Count = 0 Then
                Exit Sub
            End If
        Catch ex As Exception
            ex.InnerException.ToString()
        End Try
        Dim scriptString As String = "var str =window.open('PO_PopupReceivable.aspx',null,'height=370,width=600,status=no,resizable =no,scrollbars = no,toolbar= no,menubar=no,titlebar=no').moveTo(250,250);"
        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType, "keyOpenWindow", scriptString, True)
    End Sub
    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        remainder()
    End Sub
End Class



