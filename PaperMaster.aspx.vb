Imports System.Data
Imports System.Data.OleDb


Imports System.IO
Partial Class PaperMaster
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


        txtpaper.Attributes.Add("onkeypress", "return chkpaper()")

        btndeleteuser.Attributes.Add("onclick", "if(!confirm('Do You Want To Delete?')){return false;}")
        btnSaveuser.Attributes.Add("onclick", "return chkAll()")
        btnUpdateuser.Attributes.Add("onclick", "return chkAll()")

        If Not IsPostBack Then



            ViewState("count") = 0
            getddlsubject()
            Call getpaper()

            Call getfirstusers(0)
            Call disabled()

            bindGrid("null")


            If gvFind.Rows.Count > 0 Then
                tblMain.Visible = False
                tblSub.Visible = True
            End If
        End If
        If ViewState("key") = "home" Then
            Call btnAdd_Click(sender, e)
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
    Sub getfirstusers(ByVal i As Integer)

        ViewState("AdminAreas") = ""

        ds = Session("ds")


        If ViewState("Search") = "True" Then
            Dim user As New DataTable
            user = CType(ViewState("UserSelection"), DataTable)
            '  ds.Tables("user").Clear()
            ds.Tables("user").Merge(user)
            ViewState("Search") = "False"

            Dim selectedUser = ds.Tables("user").Rows(i)(0).ToString

            Dim dv As New DataView(CType(Session("ds"), DataSet).Tables("user"))

            dv.Sort = "keycode"

            ViewState("count") = dv.Find(selectedUser)
        End If


        If ds.Tables("user").Rows.Count >= 1 Then


            ddldept.SelectedItem.Value = ds.Tables("user").Rows(i)(1)
            ddlsubject.SelectedItem.Value = ds.Tables("user").Rows(i)(2)


            If Not IsDBNull(ds.Tables("user").Rows(i)(3)) Then
                txtpaper.Text = ds.Tables("user").Rows(i)(3)
            Else

                txtpaper.Text = ""
            End If


            hdnUserKey.Value = ds.Tables("user").Rows(i)(0)




            btnEdituser.Enabled = True
            btndeleteuser.Enabled = True
        Else
            btnEdituser.Enabled = False
            btndeleteuser.Enabled = False

        End If


    End Sub

   
    Sub getpaper()
        If ds.Tables.Contains("user") Then
            ds.Tables("user").Clear()
        End If

        ViewState("sortflag") = 1

        cmd = New OleDbCommand

        cmd.CommandText = "SELECT * FROM papermaster order by keycode"


        cmd.Connection = path
        Try
            da = New OleDbDataAdapter(cmd)
            da.Fill(ds, "user")
            'Session("ds") = ds
            dv.Table = ds.Tables("user")
            Session("dvuser") = dv.ToTable

            ' gvFind.DataSource = ds.Tables("user")
            ' gvFind.DataBind()

        Catch ex As Exception
            ex.InnerException.ToString()
        End Try
        Session("ds") = ds

    End Sub



    Protected Sub btnfirst_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = Session("ds")
        If ds.Tables("user").Rows.Count >= 1 Then
            getfirstusers(0)
            ViewState("count") = 0
        Else
            emptytext()
            btnEdituser.Enabled = False
            btndeleteuser.Enabled = False
            gvFind.DataSource = Nothing
            gvFind.DataBind()
            tblMain.Visible = True
            tblSub.Visible = False
        End If
    End Sub

    Protected Sub btnlast_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = Session("ds")
        If ds.Tables("user").Rows.Count >= 1 Then
            Dim i As Integer = ds.Tables("user").Rows.Count - 1
            getfirstusers(i)
            ViewState("count") = i
        End If
    End Sub

    Protected Sub btnprevious_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = Session("ds")
        Dim i As Integer = ds.Tables("user").Rows.Count - 1
        cnt = ViewState("count")

        If cnt = 0 Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "mykey1", "alert('First Record');", True)
        Else
            cnt = cnt - 1
            ViewState("count") = cnt
            getfirstusers(cnt)
        End If
    End Sub

    Protected Sub btnnext_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = Session("ds")
        Dim i As Integer = ds.Tables("user").Rows.Count - 1
        cnt = ViewState("count")

        If cnt = i Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "mykey2", "alert('Last Record');", True)
        Else
            cnt = cnt + 1
            ViewState("count") = cnt
            getfirstusers(cnt)
        End If
    End Sub

    Sub emptytext()

        txtpaper.Text = ""
        ddldept.SelectedIndex = 0
        ddlsubject.SelectedIndex = 0
    End Sub

    Sub disablemovebutton()
        btnfirst.Enabled = False
        btnnext.Enabled = False
        btnprevious.Enabled = False
        btnlast.Enabled = False


    End Sub

    Sub enablemovebutton()
        btnfirst.Enabled = True
        btnnext.Enabled = True
        btnprevious.Enabled = True
        btnlast.Enabled = True



    End Sub



    Protected Sub btnEdituser_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("SaveType") = "edit"

        disablemovebutton()
        btnEdituser.Visible = False
        btnUpdateuser.Visible = True
        btndeleteuser.Visible = False
        btnCanceluser.Visible = True
        btnAddUser.Visible = False

        '  btnactive.Visible = False
        '   txtuserid.ReadOnly = True
        enabled()





        ScriptManager1.SetFocus(ddldept)
        btnView.Enabled = False
    End Sub

    Sub disabled()

        ddldept.Enabled = False
        txtpaper.Enabled = False
        ddlsubject.Enabled = False
    End Sub

    Sub enabled()
        ddlsubject.Enabled = True
        ddldept.Enabled = True
        txtpaper.Enabled = True
    End Sub

    Protected Sub btndeleteuser_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        cmd = New OleDbCommand
        cmd.CommandText = "delete from papermaster where keycode = " & hdnUserKey.Value & ";"

        cmd.Connection = path

        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()
            Dim str As String = "<script language='javascript'>alert('Paper Deleted Successfully!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "msg", str, False)
        Catch ex As Exception
            ex.InnerException.ToString()
        Finally
            path.Close()
        End Try
        getpaper()
        sortdatauser()
        ' bindGrid("1")
        Call btnfirst_Click(sender, e)
    End Sub

    Protected Sub btnUpdateuser_Click(ByVal sender As Object, ByVal e As System.EventArgs)



        currentdate = dat.ToString("dd/MM/yyyy HH:mm:ss")

        cmd = New OleDbCommand
        cmd.CommandText = "update papermaster set Department='" & ddldept.SelectedItem.Text.Trim & "',subject='" & ddlsubject.SelectedItem.Value.Trim & "',paper='" & txtpaper.Text.Trim & "' where keycode=" & hdnUserKey.Value & ";"

        cmd.Connection = path

        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()
            Dim str As String = "<script language='javascript'>alert('Paper Updated Successfully!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "msg", str, False)
        Catch ex As Exception
            ex.InnerException.ToString()
        Finally
            path.Close()
        End Try
        btnAddUser.Visible = True
        btnCanceluser.Visible = False
        btnUpdateuser.Visible = False
        btnEdituser.Visible = True
        btndeleteuser.Visible = True

        '  btnactive.Visible = True
        ' txtuserid.ReadOnly = False
        hdnNewPassword.Value = ""

        getpaper()
        enablemovebutton()
        disabled()
        Call btnlast_Click(sender, e)
        btnView.Enabled = True
    End Sub

    Protected Sub btnCanceluser_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        enablemovebutton()
        btnEdituser.Visible = True
        btnSaveuser.Visible = False
        btndeleteuser.Visible = True
        btnUpdateuser.Visible = False
        btnCanceluser.Visible = False
        btnAddUser.Visible = True

        ' btnactive.Visible = True
        'txtuserid.ReadOnly = False
        If btnAddUser.Visible = True Then
            Call getpaper()
            Call getfirstusers(ViewState("count"))
            Call disabled()
        End If
        disabled()
        btnView.Enabled = True
        If ViewState("key") = "home" Then
            Response.Redirect("main.aspx")

        End If

    End Sub

    Protected Sub btnSaveuser_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = Session("ds")


        If ddlsubject.SelectedItem.Value = "Select" Then
            Dim str As String = "<script language='javascript'>alert('Please select Subject!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "add", str, False)
            Exit Sub
        End If
        Dim row() As DataRow
        row = ds.Tables("user").Select("paper='" & txtpaper.Text & "'")
        If row.Length <> 0 Then
            If (row(0)(0).ToString.ToLower = txtpaper.Text.ToLower) Then
                Dim str As String = "<script language='javascript'>alert('Paper Already Exists!');</script>"
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "UserExist", str, False)
                txtpaper.Text = ""
                ScriptManager1.SetFocus(txtpaper)

                Exit Sub
            End If
        End If




        cmd = New OleDbCommand
        cmd.CommandText = "insert into Papermaster (department,subject,paper) values('" & ddldept.SelectedItem.Text & "','" & ddlsubject.SelectedItem.Value & "','" & txtpaper.Text.Trim & "');"
        cmd.Connection = path


        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()


            Dim str As String = "<script language='javascript'>alert('Paper Added Successfully!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "add", str, False)



        Catch ex As Exception
            ex.InnerException.ToString()
        Finally
            path.Close()
        End Try
        btnAddUser.Visible = True
        btnCanceluser.Visible = False
        btnSaveuser.Visible = False
        btnEdituser.Visible = True
        btndeleteuser.Visible = True

        ' btnactive.Visible = True
        hdnNewPassword.Value = ""

        disabled()
        getpaper()
        enablemovebutton()
        Call btnlast_Click(sender, e)

        bindGrid("null")
        tblMain.Visible = False
        tblSub.Visible = True
        btnView.Enabled = True
        If ViewState("key") = "home" Then
            Response.Redirect("main.aspx")

        End If
        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "m", "window.parent.frames[2].location.href='Status.aspx';", True)
    End Sub

    Protected Sub btnAddUser_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("SaveType") = "add"

        disablemovebutton()
        btnEdituser.Visible = False
        btnSaveuser.Visible = True
        btndeleteuser.Visible = False
        btnCanceluser.Visible = True
        btnAddUser.Visible = False


        emptytext()
        enabled()

        Dim i As Integer
        Dim strRole As String




        ScriptManager1.SetFocus(txtpaper)
        btnView.Enabled = False
    End Sub




    'Protected Sub btnactive_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnactive.Click
    '    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "m", "window.parent.frames[1].location.href='ActivateUsers.aspx';", True)
    'End Sub

    Protected Sub gvFind_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = CType(Session("ds"), DataSet).Copy

        Dim dvFind As DataView
        dvFind = ds.Tables("user").DefaultView

        dvFind.Sort = "keycode"
        Dim findIndex = dvFind.Find(CType(gvFind.SelectedRow.FindControl("keycode"), Label).Text.Trim)

        getfirstusers(findIndex)

        ScriptManager1.SetFocus(btnEdituser)

        tblMain.Visible = True
        tblSub.Visible = False

    End Sub

    Sub bindGrid(ByVal sortExp As String)

        If ds.Tables.Contains("Find") Then
            ds.Tables("Find").Clear()
        End If

        Dim fillGrid As New OleDbDataAdapter("SELECT * FROM papermaster order by keycode", path)
        fillGrid.Fill(ds, "Find")

        Dim dv As DataView
        dv = ds.Tables("Find").DefaultView

        'If sortExp <> "null" Then
        '    dv.Sort = sortExp
        'End If
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


        Dim rowCnt As Integer = 0
        For Each dgvRow As GridViewRow In gvFind.Rows
            CType(dgvRow.Cells(3).Controls(1), LinkButton).CommandArgument = rowCnt
            rowCnt = rowCnt + 1
        Next
    End Sub

    Protected Sub gvFind_DeleteCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs)
        cmd = New OleDbCommand
        cmd.CommandText = "delete form papermaster where keycode=" & hdnUserKey.Value & ""

        cmd.Connection = path
        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()
            Dim str As String = "<script language='javascript'>alert('User Deleted Successfully!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "msg", str, False)
        Catch ex As Exception
            ex.InnerException.ToString()
        Finally
            path.Close()
        End Try
        getpaper()
        'bindGrid("1")
        Call btnfirst_Click(source, e)
    End Sub



    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        tblMain.Visible = True
        tblSub.Visible = False
        Call btnAddUser_Click(sender, e)
    End Sub



    Protected Sub btnDelete_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)


        Dim r As GridViewRow = TryCast(DirectCast(sender, LinkButton).Parent.Parent, GridViewRow)
        Dim rindex As Integer = r.RowIndex

        hdnUserKey.Value = CType(gvFind.Rows(r.RowIndex).FindControl("keycode"), Label).Text
        Call btndeleteuser_Click(sender, e)
    End Sub

    Protected Sub btnView_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Call btnCanceluser_Click(sender, e)
        bindGrid("null")
        If gvFind.Rows.Count > 0 Then

            tblMain.Visible = False
            tblSub.Visible = True

        Else
            Dim str As String = "<script language='javascript'>alert('No records Found!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "msg132", str, False)
        End If
        ' btnactive.Visible = False
        '  btnupload.Visible = False
    End Sub



    Protected Sub gvFind_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvFind.PageIndexChanging

        gvFind.PageIndex = e.NewPageIndex
        ViewState("page") = gvFind.PageIndex
        ' bindGrid("null")
        sortdatauser()

    End Sub




    Private Function Emailvalidation(ByVal txt As String) As Boolean
        Dim eex As System.Text.RegularExpressions.Match
        Dim validexprn As String = "^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,3})$"
        eex = System.Text.RegularExpressions.Regex.Match(Trim(txt), validexprn, System.Text.RegularExpressions.RegexOptions.IgnoreCase)
        If eex.Success = False Then
            Return False
        End If
        Return True
    End Function



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






    Protected Sub ddlsubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        getpaper()
    End Sub

    Protected Sub ddldept_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        getddlsubject()
        getpaper()
    End Sub
End Class
