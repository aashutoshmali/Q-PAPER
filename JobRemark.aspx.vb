Imports System.Data

Imports System.Data.OleDb

Partial Class JobRemark
    Inherits System.Web.UI.Page

    ' Dim path As OleDbConnection
    Dim cmd As OleDbCommand
    Dim adp As OleDbDataAdapter
    Dim ds As New DataSet
    Dim tempDt As New DataTable
    Dim row() As DataRow
    Dim i As Integer
    Dim cnt As Integer
    Dim key As String

    Dim TABLENAME_TEMP As String
    Dim cmdAccess As OleDbCommand
    Dim strScript As String
    Dim dsTemp As New DataSet
    Dim constr As String
    Dim connAccess As OleDbConnection
    Dim fileSelect As Boolean = False
    Dim bsense As String
    Dim flag As String
    Dim dv As New DataView

    Dim arr As New ArrayList
    Dim path As New OleDbConnection(ConfigurationManager.AppSettings("path"))

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        path = New OleDbConnection(ConfigurationManager.AppSettings("path"))
      
        If Not Page.IsPostBack Then


            ViewState("page") = 1

            getjob()
       
            bindGrid("null")
           
            ViewState("count") = 0
        End If

    End Sub


    Sub setjob()

        ds = Session("ds")
        gvFind.DataSource = ds.Tables("job")
        gvFind.DataBind()

    End Sub

    Sub getjob()

        If ds.Tables.Contains("job") Then
            ds.Tables("job").Clear()
        End If

        ViewState("sortflag") = 1


        cmd = New OleDbCommand
        If Session("userrole").ToString.ToLower = "hod" Then
            cmd.CommandText = "Select * from job  order by keycode"

        Else
            cmd.CommandText = "Select * from job  where uid='" & Session("uid").ToString.Trim & "'order by keycode"

        End If
      
        'cmd.Parameters.Add(New SqlParameter("@issuekey", SqlDbType.NVarChar, 50, ParameterDirection.Input)).Value = Session("issuekey").ToString


        cmd.Connection = path

        Try
            adp = New OleDbDataAdapter(cmd)
            adp.Fill(ds, "job")
            Session("ds") = ds
            'gvFind.DataSource = ds.Tables("job")
            'gvFind.DataBind()
            dv.Table = ds.Tables("job")
            Session("dvjob") = dv.ToTable



        Catch ex As Exception
            ex.InnerException.ToString()
        End Try
    End Sub

    Sub sortdatajob()

        If ViewState("sortflag") = 1 Then
            Dim dv As New DataView
            dv.Table = Session("dvjob")
            gvFind.DataSource = dv.ToTable
            gvFind.DataBind()
        Else
            'setjob()
            dv = Session("filter")
            gvFind.DataSource = dv
            gvFind.DataBind()
        End If

    End Sub




    Sub bindGrid(ByVal sortExp As String)

        If ds.Tables.Contains("Find") Then
            ds.Tables("Find").Clear()
        End If
        Dim fillGrid As OleDbDataAdapter
        If Session("userrole").ToString.ToLower = "hod" Then
            fillGrid = New OleDbDataAdapter("Select * from job  order by keycode", path)

        Else
            fillGrid = New OleDbDataAdapter("Select * from job  where uid='" & Session("uid").ToString.Trim & "'order by keycode", path)

        End If
         fillGrid.Fill(ds, "Find")

        Dim dv As New DataView(ds.Tables("Find"))
        ' dv = ds.Tables("Find").DefaultView

        If sortExp = "1" Then
            If gvFind.PageIndex <> 0 Then
                gvFind.PageIndex = gvFind.PageIndex - 1
            End If
        ElseIf sortExp <> "null" Then
            dv.Sort = sortExp
        End If

        Session("Find") = ds.Tables("Find")


        gvFind.DataSource = dv
        gvFind.DataBind()



    End Sub



    Protected Sub gvFind_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvFind.PageIndexChanging

        gvFind.PageIndex = e.NewPageIndex
        bindGrid("null")


    End Sub



    Protected Function SortDataTable(ByVal dataTable As Data.DataTable, ByVal isPageIndexChanging As Boolean) As Data.DataView
        If dataTable IsNot Nothing Then
            Dim dataView As New Data.DataView(dataTable)
            If GridViewSortExpression <> String.Empty Then
                If isPageIndexChanging Then
                    dataView.Sort = String.Format("{0} {1}", GridViewSortExpression, GridViewSortDirection)
                Else

                    dataView.Sort = String.Format("{0} {1}", GridViewSortExpression, GetSortDirection())
                End If
            End If
            Return dataView
        Else
            Return New Data.DataView()
        End If
    End Function

    Private Property GridViewSortDirection() As String
        Get
            Return IIf(TryCast(ViewState("SortDirection"), String) Is Nothing, "ASC", TryCast(ViewState("SortDirection"), String))
        End Get
        Set(ByVal value As String)
            ViewState("SortDirection") = value
        End Set
    End Property

    Private Property GridViewSortExpression() As String
        Get
            Return IIf(TryCast(ViewState("SortExpression"), String) Is Nothing, String.Empty, TryCast(ViewState("SortExpression"), String))
        End Get
        Set(ByVal value As String)
            ViewState("SortExpression") = value
        End Set
    End Property

    Private Function GetSortDirection() As String
        Dim cnt As Integer
        For i As Integer = 0 To gvFind.Columns.Count - 1
            gvFind.Columns(i).HeaderStyle.CssClass = ""

        Next

        For i As Integer = 0 To gvFind.Columns.Count - 1
            If gvFind.Columns(i).HeaderText = ViewState("SortExpression") Then
                cnt = i
            End If
        Next

        Select Case GridViewSortDirection
            Case "ASC"
                GridViewSortDirection = "DESC"
                gvFind.Columns(cnt).HeaderStyle.CssClass = "sortascheader"
                Exit Select
            Case "DESC"
                GridViewSortDirection = "ASC"
                gvFind.Columns(cnt).HeaderStyle.CssClass = "sortdescheaderstyle"
                Exit Select
        End Select
        Return GridViewSortDirection
    End Function

   
    Protected Sub gvFind_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles gvFind.RowCancelingEdit
        gvFind.EditIndex = -1
        bindGrid("null")
    End Sub

    Protected Sub gvFind_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gvFind.RowEditing
        gvFind.EditIndex = e.NewEditIndex
        bindGrid("null")
    End Sub

    Protected Sub gvFind_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gvFind.RowUpdating
        ViewState("keycode") = CType(gvFind.Rows(e.RowIndex).FindControl("keycode"), Label).Text
        ViewState("remark") = CType(gvFind.Rows(e.RowIndex).FindControl("txtremark"), TextBox).Text
        If CType(gvFind.Rows(e.RowIndex).FindControl("chk"), CheckBox).Checked Then
            ViewState("app") = "1"
        Else
            ViewState("app") = "0"
        End If


        update(ViewState("keycode"), ViewState("remark"), ViewState("app"))
        gvFind.EditIndex = -1
        bindGrid("null")
    End Sub
    Sub update(ByVal keycode As String, ByVal remark As String, ByVal flag As String)
        Dim dt As String = DateTime.Today.Day.ToString & "/" & DateTime.Today.Month.ToString & "/" & DateTime.Today.Year.ToString

        cmd = New OleDbCommand
        cmd.CommandText = "Update  job set remark='" + remark + "',flag='" + flag + "',cdate='" + dt + "' where keycode=" + keycode

        cmd.Connection = path


        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()
            Dim str As String = "<script language='javascript'>alert('job Updated Successfully!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "add", str, False)
        Catch ex As Exception
            ex.InnerException.ToString()
        Finally
            path.Close()
        End Try
    End Sub

    Protected Sub gvFind_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
End Class
