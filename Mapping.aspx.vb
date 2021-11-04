Imports System.Data
Imports System.Data.OleDb


Imports System.IO
Partial Class Mapping
    Inherits System.Web.UI.Page
    Dim cmd As OleDbCommand
    Dim adp, da As OleDbDataAdapter
    Dim ds As New DataSet
    Dim dt As New DataTable
    Dim drow As DataRow
    Dim dv As New DataView

    Dim ds1 As New DataSet
    'Dim dr As SqlDataReader
    Dim issuekey, pwd As String

    Dim key As String
    Dim usercode As String
    Dim dat As DateTime = DateTime.Now
    Dim currentdate As String
    Dim cnt As Integer

    Private Const saltByteSize As Integer = 16
    Dim scriptString As String
    Dim strMapping, strMessage, strFilename, strRegLM, strFileColumns, strSystemColumns, RegLM, fileConn, strScript, str As String
    Dim chkFileFlag As Boolean = False
    Dim chkformatflag As Boolean = False
    Dim path As New OleDbConnection(ConfigurationManager.AppSettings("path"))

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load




        ddldept.Attributes.Add("onkeypress", "return chkdept()")


        '  txtsubject.Attributes.Add("onkeypress", "return chksubject()")

      

        If Not IsPostBack Then



            ViewState("count") = 0
            Call getddlsubject()
            getstaff()
            getselectedstaff()
          
        End If
       


    End Sub
    Sub getddlsubject()
        ddlsubject.Items.Clear()
        cmd = New OleDbCommand
        cmd.CommandText = "select keycode,subject from subjectmaster where department='" & ddldept.SelectedItem.Text.Trim & "'"
        cmd.CommandType = CommandType.Text
        cmd.Connection = path
        Try
            adp = New OleDbDataAdapter(cmd)
            adp.Fill(ds, "ddlsubject")
            If ds.Tables("ddlsubject").Rows.Count <> 0 Then
                ddlsubject.DataSource = ds.Tables("ddlsubject")
                ddlsubject.DataTextField = ds.Tables("ddlsubject").Columns(1).ToString
                ddlsubject.DataValueField = ds.Tables("ddlsubject").Columns(0).ToString
                ddlsubject.DataBind()
            Else
                ddlsubject.Items.Add("Select")
                ddlsubject.SelectedIndex = 0
            End If

        Catch ex As Exception
            ex.InnerException.ToString()
        End Try
        Session("ds") = ds
    End Sub
    Sub getstaff()
        If ddlsubject.SelectedItem.Value = "Select" Then
            If ds.Tables.Contains("user") Then
                ds.Tables("user").Clear()
            End If
            gvFind.DataSource = ds.Tables("user")
            gvFind.DataBind()

            Exit Sub
        End If

        ds = Session("ds")
        If ds.Tables.Contains("user") Then
            ds.Tables("user").Clear()
        End If

        ViewState("sortflag") = 1

        cmd = New OleDbCommand

        cmd.CommandText = "SELECT  *   FROM(staff) WHERE (eid NOT IN(SELECT eid FROM(papermap)WHERE (subjectcode = " & ddlsubject.SelectedItem.Value & ")))"


        cmd.Connection = path
        Try
            da = New OleDbDataAdapter(cmd)
            da.Fill(ds, "user")
            'Session("ds") = ds
            dv.Table = ds.Tables("user")
            Session("dvuser") = dv.ToTable

            gvFind.DataSource = ds.Tables("user")
            gvFind.DataBind()

        Catch ex As Exception
            ex.InnerException.ToString()
        End Try
        Session("ds") = ds
    End Sub
    Sub getselectedstaff()
        If ddlsubject.SelectedItem.Value = "Select" Then
            If ds.Tables.Contains("user1") Then
                ds.Tables("user1").Clear()
            End If
            GridView1.DataSource = ds.Tables("user1")
            GridView1.DataBind()

            Exit Sub
        End If
        ds = Session("ds")
        If ds.Tables.Contains("user1") Then
            ds.Tables("user1").Clear()
        End If

        ViewState("sortflag") = 1

        cmd = New OleDbCommand

        cmd.CommandText = "SELECT  *   FROM(staff) WHERE (eid IN(SELECT eid FROM(papermap)WHERE (subjectcode = " & ddlsubject.SelectedItem.Value & ")))"


        cmd.Connection = path
        Try
            da = New OleDbDataAdapter(cmd)
            da.Fill(ds, "user1")
            'Session("ds") = ds
            dv.Table = ds.Tables("user1")
            Session("dvuser") = dv.ToTable

            GridView1.DataSource = ds.Tables("user1")
            GridView1.DataBind()

        Catch ex As Exception
            ex.InnerException.ToString()
        End Try
        Session("ds") = ds
    End Sub

  
    Protected Sub gvFind_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = CType(Session("ds"), DataSet).Copy

        Dim dvFind As DataView
        dvFind = ds.Tables("user").DefaultView

        dvFind.Sort = "eid"
        Dim findIndex = CType(gvFind.SelectedRow.FindControl("eid"), Label).Text.Trim

        cmd = New OleDbCommand
        cmd.CommandText = "insert into papermap (subjectcode,eid) values('" & ddlsubject.SelectedItem.Value & "'," & findIndex & ");"
        cmd.Connection = path


        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()


            Dim str As String = "<script language='javascript'>alert('Staff Mapped Successfully!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "add", str, False)


        Catch ex As Exception
            ex.InnerException.ToString()
        Finally
            path.Close()
        End Try
        getstaff()
        getselectedstaff()
    End Sub


    Protected Sub gvFind_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvFind.PageIndexChanging

        gvFind.PageIndex = e.NewPageIndex
        ViewState("page") = gvFind.PageIndex
        ' bindGrid("null")
        sortdatauser()

    End Sub







    Protected Sub gvFind_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles gvFind.Sorting

        If ViewState("sortflag") = 1 Then
            '  bindGrid(e.SortExpression.ToString())
            ds = Session("ds")
            Dim dtData As Data.DataTable = ds.Tables("user")
            GridViewSortExpression = e.SortExpression

            'get the pageindex of the grid. 
            Dim pageIndex As Integer = gvFind.PageIndex

            'gvFind.DataSource = SortDataTable(dtData, False)
            'gvFind.DataBind()
            'gvFind.PageIndex = pageIndex

            Dim dv As New DataView
            dv = SortDataTable(dtData, False)
            gvFind.DataSource = dv
            gvFind.DataBind()
            gvFind.PageIndex = pageIndex
            Session("dvuser") = dv.ToTable
            'ViewState("sortflag") = 1
        End If


        If ViewState("sortflag") = 0 Then
            Dim dv As New DataView
            dv = Session("filter")
            Dim pageIndex As Integer = gvFind.PageIndex
            gvFind.DataSource = dv
            gvFind.DataBind()
            gvFind.PageIndex = pageIndex
            Session("filter") = dv
        End If


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
        Select Case GridViewSortDirection
            Case "ASC"
                GridViewSortDirection = "DESC"
                Exit Select
            Case "DESC"
                GridViewSortDirection = "ASC"
                Exit Select
        End Select
        Return GridViewSortDirection
    End Function



    Sub sortdatauser()

        If ViewState("sortflag") = 1 Then
            Dim dv As New DataView
            dv.Table = Session("dvuser")
            gvFind.DataSource = dv.ToTable
            gvFind.DataBind()
        Else
            ' setsubject()
            dv = Session("filter")
            gvFind.DataSource = dv
            gvFind.DataBind()
        End If

    End Sub






    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)


    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = CType(Session("ds"), DataSet).Copy

        Dim dvFind As DataView
        dvFind = ds.Tables("user").DefaultView

        dvFind.Sort = "eid"


        Dim r As GridViewRow = TryCast(DirectCast(sender, LinkButton).Parent.Parent, GridViewRow)
        Dim rindex As Integer = r.RowIndex
        Dim pk As String = CType(GridView1.Rows(rindex).FindControl("eid"), Label).Text






        cmd = New OleDbCommand
        cmd.CommandText = "delete from papermap where subjectcode =" & ddlsubject.SelectedItem.Value & "and eid =" & pk & ";"
        cmd.Connection = path


        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()


            Dim str As String = "<script language='javascript'>alert('Staff Removed Successfully!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "add", str, False)


        Catch ex As Exception
            ex.InnerException.ToString()
        Finally
            path.Close()
        End Try
        getstaff()
        getselectedstaff()
    End Sub

    Protected Sub ddldept_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Call getddlsubject()
        getstaff()
        getselectedstaff()
    End Sub

    Protected Sub ddlsubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        getstaff()
        getselectedstaff()
    End Sub
End Class
