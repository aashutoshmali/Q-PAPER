Imports System.Data
Imports System.Data.OleDb
Partial Class Menu1
    Inherits System.Web.UI.Page
    Dim conn As OleDbConnection
    Dim cmd, selPerm As OleDbCommand
    Dim ds, dst As New DataSet
    Dim dr, readPerm As OleDbDataReader
    Dim dt, dt1 As New DataTable
    Dim cnt As Integer
    Dim dv As DataView
    Dim key, usercode As String
    Dim da As New OleDbDataAdapter

    Dim path As New OleDbConnection(ConfigurationManager.AppSettings("path"))

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        '--------Main Menu------------
        getmainmenu()
        getsubmenu()
       
        
     

        setMainMenu()



    End Sub
    Sub getmainmenu()
        If ds.Tables.Contains("main") Then
            ds.Tables("main").Clear()
        End If
        cmd = New OleDbCommand
        cmd.CommandText = "SELECT mid,pid,name FROM menu where pid=0 order by mid"
        cmd.Connection = path
        Try
            da = New OleDbDataAdapter(cmd)
            da.Fill(ds, "mainMenu")
            Session("ds") = ds

        Catch ex As Exception
            ex.InnerException.ToString()
        End Try
    End Sub
    Sub getsubmenu()
        If ds.Tables.Contains("subMenu") Then
            ds.Tables("subMenu").Clear()
        End If
        cmd = New OleDbCommand
        cmd.CommandText = "SELECT mid,name,pid,formname,target FROM menu where pid<>0 order by mid"
        cmd.Connection = path
        Try
            da = New OleDbDataAdapter(cmd)
            da.Fill(ds, "subMenu")
            Session("ds") = ds
        Catch ex As Exception
            ex.InnerException.ToString()
        End Try
    End Sub
    Sub setMainMenu()
        Dim i As Integer

        For i = 0 To ds.Tables("mainMenu").Rows.Count - 1
            Dim trnode As New TreeNode
            If Session("userRole") <> "HOD" Then
                If ds.Tables("mainMenu").Rows(i)(2).ToString <> "Master" Then
                    trnode.Text = ds.Tables("mainMenu").Rows(i)(2)
                    trnode.Value = ds.Tables("mainMenu").Rows(i)(0)
                    trnode.SelectAction = TreeNodeSelectAction.Expand
                    treeMenu.Nodes.Add(trnode)
                    setSubMenu(trnode)
                End If
            Else
                trnode.Text = ds.Tables("mainMenu").Rows(i)(2)
                trnode.Value = ds.Tables("mainMenu").Rows(i)(0)
                trnode.SelectAction = TreeNodeSelectAction.Expand
                treeMenu.Nodes.Add(trnode)
                setSubMenu(trnode)
            End If

        Next
    End Sub

    Sub setSubMenu(ByVal trnode As TreeNode)
        Dim i As Integer
        For i = 0 To ds.Tables("subMenu").Rows.Count - 1
            If (trnode.Value = ds.Tables("subMenu").Rows(i)(2)) Then
                Dim childtrnode As New TreeNode
                Dim str As String = ds.Tables("subMenu").Rows(i)(1)

                trnode.ChildNodes.Add(childtrnode)

                childtrnode.Text = str 'ds.Tables("subMenu").Rows(i)(2)
                childtrnode.Value = ds.Tables("subMenu").Rows(i)(0)

                childtrnode.NavigateUrl = ds.Tables("subMenu").Rows(i)(3) ' + ".aspx"
                childtrnode.Target = ds.Tables("subMenu").Rows(i)(4)


            End If
        Next
    End Sub

    
    Protected Sub treeLogOut_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles treeLogOut.SelectedNodeChanged
        Session.Abandon()

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "mykey3", "window.parent.location= 'SelectionForm.aspx';", True)
    End Sub
End Class
