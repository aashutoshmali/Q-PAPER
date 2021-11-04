Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class userbtnper
    Dim conn As SqlConnection
    Dim cmd As SqlCommand
    Dim adp As SqlDataAdapter
    Dim ds As New DataSet
    Dim tempDt As New DataTable
    Dim row() As DataRow
    Dim i As Integer
    Dim da As SqlDataAdapter
    Dim dv As DataView
    Dim arr As New ArrayList

    Function getuserbtnstatus(ByVal ukey As String, ByVal formname As String, ByVal conn As SqlConnection)

        cmd = New SqlCommand
        cmd.CommandText = "Payout_SelectUserButtonPer"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Connection = conn
        cmd.Parameters.Add("@ukey", SqlDbType.NVarChar, 50).Value = ukey
        da = New SqlDataAdapter(cmd)
        da.Fill(ds, "btnper")
        dv = New DataView
        dv = ds.Tables("btnper").DefaultView
        Dim str As String = "formname='" & formname & "' and [00000011]='" & ukey & "'"
        dv.RowFilter = str
        If dv.Count > 0 Then
            arr.Add(dv.Item(0)(5).ToString)
            arr.Add(dv.Item(0)(6).ToString)
            arr.Add(dv.Item(0)(7).ToString)
            arr.Add(dv.Item(0)(8).ToString)
        End If
        If dv.Count > 0 Then
            Return arr
        Else
            Return Nothing
        End If
    End Function
End Class
