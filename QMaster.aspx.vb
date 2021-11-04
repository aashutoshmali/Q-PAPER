Imports System.Data
Imports System.Data.OleDb


Imports System.IO
Partial Class QMaster
    Inherits System.Web.UI.Page
    Dim cmd As OleDbCommand
    Dim adp, da As OleDbDataAdapter
    Dim ds As New DataSet
    Dim dt As New DataTable
    Dim drow As DataRow
    Dim dv As New DataView

    Dim ds1 As New DataSet
    'Dim dr As OleDbDataReader
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

        'txtdate.Attributes.Add("onactivate", "DisplayDate();")
        'txtdate.Attributes.Add("onkeypress", "fnDoNothing()")


        ddldept.Attributes.Add("onkeypress", "return chkdept()")
        'txtdate.Attributes.Add("onkeypress", "return chkdate()")
        txttitle.Attributes.Add("onkeypress", "return chktitle()")
        'ddlmaterial.Attributes.Add("onkeypress", "return chkmaterial()")
        ' txtpublisher.Attributes.Add("onkeypress", "return chkpub()")
        ddlsubject.Attributes.Add("onkeypress", "return chksub()")
        ' txtpage.Attributes.Add("onkeypress", "return chkpage()")
        ' txtcost.Attributes.Add("onkeypress", "return chkcost()")
        ' txtauthor.Attributes.Add("onkeypress", "return chkauthor()")
        'txtuserid.Attributes.Add("onkeypress", "return chkUserId()")
        'txtuserid.Attributes.Add("onfocus", "this.select()")
        'txtusername.Attributes.Add("onkeypress", "return chkUserName()")
        'txtusername.Attributes.Add("onfocus", "this.select()")
        'txtpassword.Attributes.Add("onkeypress", "return chkPassword()")
        ''txtpassword.Attributes.Add("onkeyup", "savePwd()")
        'txtpassword.Attributes.Add("onfocus", "this.select()")
        'txtrpassword.Attributes.Add("onkeypress", "return chkRepeatPassword()")
        'txtrpassword.Attributes.Add("onfocus", "this.select()")
        'ddlRole.Attributes.Add("onkeypress", "return chkRole()")
        'ddlRole.Attributes.Add("onchange", "chkRoleOnChange()")

        'txtemail.Attributes.Add("onkeypress", "return chkEmail()")
        'txtemail.Attributes.Add("onfocus", "this.select()")

        btnSaveuser.Attributes.Add("onclick", "return chkAll()")
        btnUpdateuser.Attributes.Add("onclick", "return chkAll()")

        'txtSearch.Attributes.Add("onkeypress", "fnCharIntSpace();")

        'If  IsNothing(Session("role")) Then
        'ViewState("key") = Request.QueryString("key").ToString
        ' End If



        'txtPageNo.Attributes.Add("onkeypress", "fnInt();")

        btndeleteuser.Attributes.Add("onclick", "if(!confirm('Do You Want To Delete?')){return false;}")
        If Not IsPostBack Then

           
           
            ViewState("count") = 0
            getddlsubject()
            getddlpaper()
            Call getquestion()

            Call getfirstq(0)
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

    Sub getfirstq(ByVal i As Integer)
        If IsNothing(ds.Tables("user")) Then
            Exit Sub
        End If
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
            '  txtuserid.Text = ds.Tables("user").Rows(i)(1)
            '  

            ddldept.SelectedItem.Value = ds.Tables("user").Rows(i)(1)
            ' ddldept.SelectedItem.Text = ds.Tables("user").Rows(i)(1)

            ddlsubject.SelectedItem.Value = ds.Tables("user").Rows(i)(6)
            ddlpaper.SelectedItem.Value = ds.Tables("user").Rows(i)(5)

            'ddlsubject.SelectedItem.Text = ds.Tables("user").Rows(i)(2)
            txttitle.Text = ds.Tables("user").Rows(i)(4)


            hdnUserKey.Value = ds.Tables("user").Rows(i)(0)




            btnEdituser.Enabled = True
            btndeleteuser.Enabled = True
        Else
            btnEdituser.Enabled = False
            btndeleteuser.Enabled = False

        End If


    End Sub
    Sub getddlsubject()
        ddlsubject.Items.Clear()
        cmd = New OleDbCommand
        cmd.CommandText = "SELECT        SubjectMaster.keycode, SubjectMaster.Subject FROM   ((SubjectMaster INNER JOIN papermap ON SubjectMaster.keycode = papermap.subjectcode) INNER JOIN  staff ON papermap.eid = staff.eid) WHERE        (staff.eid = " & Session("uid") & ")AND (SubjectMaster.department = '" & ddldept.SelectedItem.Text & "')"
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

    Sub setquestion()

        ds = Session("ds")
        gvFind.DataSource = ds.Tables("user")
        gvFind.DataBind()

    End Sub
    Sub getddlpaper()

        If ddlsubject.SelectedItem.Value = "Select" Then
            ddlpaper.Items.Clear()
            Exit Sub
        End If

        cmd = New OleDbCommand
        cmd.CommandText = "SELECT  Papermaster.keycode, Papermaster.paper FROM ((papermap INNER JOIN staff ON papermap.eid = staff.eid) INNER JOIN Papermaster ON papermap.subjectcode = Papermaster.Subject) WHERE  papermap.subjectcode = " & ddlsubject.SelectedItem.Value & ""
        cmd.CommandType = CommandType.Text
        cmd.Connection = path
        Try
            adp = New OleDbDataAdapter(cmd)
            adp.Fill(ds, "ddlpaper")
            If ds.Tables("ddlpaper").Rows.Count <> 0 Then
                ddlpaper.DataSource = ds.Tables("ddlpaper")
                ddlpaper.DataTextField = ds.Tables("ddlpaper").Columns(1).ToString
                ddlpaper.DataValueField = ds.Tables("ddlpaper").Columns(0).ToString
                ddlpaper.DataBind()
            Else
                ddlpaper.Items.Clear()
                ddlpaper.Items.Add("Select")
                ddlpaper.SelectedIndex = 0
            End If

        Catch ex As Exception
            ex.InnerException.ToString()
        End Try
        Session("ds") = ds
    End Sub
    Sub getquestion()
        If ds.Tables.Contains("user") Then
            ds.Tables("user").Clear()
        End If
        If ddlsubject.SelectedItem.Value = "Select" Then
            ddlpaper.Items.Clear()
            Exit Sub
        End If
        If ddlpaper.SelectedItem.Value = "Select" Then
            ddlpaper.Items.Clear()
            txttitle.Text = ""
            Exit Sub
        End If
        ViewState("sortflag") = 1

        cmd = New OleDbCommand

        If Session("userRole") = "ADMIN" Then
            cmd.CommandText = "SELECT qmaster.*FROM qmaster  order by keycode"
        Else
            cmd.CommandText = "SELECT qmaster.*FROM qmaster where  paper = " & ddlpaper.SelectedItem.Value & " order by keycode"

        End If


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
            ' getfirstq(0)
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
            'getfirstq(i)
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
            '  getfirstq(cnt)
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
            '   getfirstq(cnt)
        End If
    End Sub

    Sub emptytext()
        ddldept.SelectedIndex = 0

        '
        txttitle.Text = ""
        '
        '  ddlsubject.SelectedIndex = 0
        ' ddlpaper.SelectedIndex = 0

        '
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
        ' txtuserid.ReadOnly = True
        enabled()




        'ScriptManager1.SetFocus(txtuserid)
        btnView.Enabled = False
    End Sub

    Sub disabled()
        ddldept.Enabled = False
        '
        txttitle.Enabled = False
        '
        ddlsubject.Enabled = False
        ddlpaper.Enabled = False
        '

    End Sub

    Sub enabled()
        ddldept.Enabled = True
        '
        txttitle.Enabled = True
        '
        ddlsubject.Enabled = True
        ddlpaper.Enabled = True

    End Sub

    Protected Sub btndeleteuser_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        cmd = New OleDbCommand
        cmd.CommandText = "delete from qmaster where keycode = " & hdnUserKey.Value & ";"

        cmd.Connection = path

        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()
            Dim str As String = "<script language='javascript'>alert('Question Deleted Successfully!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "msg", str, False)
        Catch ex As Exception
            ex.InnerException.ToString()
        Finally
            path.Close()
        End Try
        getquestion()
        sortdatauser()
        ' bindGrid("1")
        Call btnfirst_Click(sender, e)
    End Sub

    Protected Sub btnUpdateuser_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If ddlpaper.SelectedItem.Value = "Select" Then
            Dim str As String = "<script language='javascript'>alert('Please select Paper!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "add", str, False)

            Exit Sub
        End If


        Dim i As String = Session("uname").ToString.Trim
        cmd = New OleDbCommand
        cmd.CommandText = "update qmaster set dept='" & ddldept.SelectedItem.Text.Trim & "',subject='" & ddlsubject.SelectedItem.Text.Trim & "',username='" & i & "',question='" & txttitle.Text.Trim & "' where keycode = " & hdnUserKey.Value & ""
        '   cmd.CommandText = "update qmaster set dept='" & ddldept.SelectedItem.Text.Trim & "',subject='" & ddlsubject.SelectedItem.Text.Trim & "',question='" & txttitle.Text.Trim & "' where keycode = " & hdnUserKey.Value & ""
        



        cmd.Connection = path
        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()
            Dim str As String = "<script language='javascript'>alert('Question Updated Successfully!');</script>"
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
        '  txtuserid.ReadOnly = False
        hdnNewPassword.Value = ""

        getquestion()
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

        If btnAddUser.Visible = True Then
            Call getquestion()
            Call getfirstq(ViewState("count"))
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
        If ddlpaper.SelectedItem.Value = "Select" Then
            Dim str As String = "<script language='javascript'>alert('Please select Paper!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "add", str, False)

            Exit Sub
        End If
        'Dim row() As DataRow
        'row = ds.Tables("user").Select("question='" & txttitle.Text & "'")
        'If row.Length <> 0 Then
        '    If (row(0)(0).ToString.ToLower = txttitle.Text.ToLower) Then
        '        Dim str As String = "<script language='javascript'>alert('Question Already Exists!');</script>"
        '        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "UserExist", str, False)
        '        txttitle.Text = ""
        '        ScriptManager1.SetFocus(txttitle)

        '        Exit Sub
        '    End If
        'End If




        cmd = New OleDbCommand
        cmd.CommandText = "insert into qmaster (dept, subject, username, question,paper,subjectcode,uid) values('" & ddldept.SelectedItem.Text & "','" & ddlsubject.SelectedItem.Text & "','" & Session("uname").ToString & "','" & txttitle.Text.Trim & "'," & ddlpaper.SelectedItem.Value & "," & ddlsubject.SelectedItem.Value & "," & Session("uid") & ");"
        cmd.Connection = path


        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()

            Dim str As String = "<script language='javascript'>alert('Question Added Successfully!');</script>"
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
        getquestion()
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
        getddlsubject()
        getddlpaper()

        btnView.Enabled = False
    End Sub





    Protected Sub gvFind_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = CType(Session("ds"), DataSet).Copy

        Dim dvFind As DataView
        dvFind = ds.Tables("user").DefaultView

        dvFind.Sort = "keycode"
        Dim findIndex = dvFind.Find(CType(gvFind.SelectedRow.FindControl("keycode"), Label).Text.Trim)

        getfirstq(findIndex)

        ScriptManager1.SetFocus(btnEdituser)

        tblMain.Visible = True
        tblSub.Visible = False

    End Sub

    Sub bindGrid(ByVal sortExp As String)

        If ds.Tables.Contains("Find") Then
            ds.Tables("Find").Clear()
        End If
        If ddlpaper.Items.Count = 0 Then
            Exit Sub
        End If
        If ddlpaper.SelectedItem.Value = "Select" Then
            ddlpaper.Items.Clear()
            txttitle.Text = ""
            Exit Sub
        End If
        Dim s As String
        If Session("userRole") = "ADMIN" Then
            s = "SELECT qmaster.*FROM qmaster order by keycode"
        Else
            s = "SELECT qmaster.*FROM qmaster where  paper = " & ddlpaper.SelectedItem.Value & " order by keycode"

        End If
        Dim fillGrid As New OleDbDataAdapter(s, path)

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
            CType(dgvRow.Cells(5).Controls(1), LinkButton).CommandArgument = rowCnt
            rowCnt = rowCnt + 1
        Next
    End Sub




    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        tblMain.Visible = True
        tblSub.Visible = False
        Call btnAddUser_Click(sender, e)
    End Sub

    Protected Sub gvFind_DeleteCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs)
        cmd = New OleDbCommand
        cmd.CommandText = "delete from qmaster where keycode=" & hdnUserKey.Value & ""

        cmd.Connection = path
        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()
            Dim str As String = "<script language='javascript'>alert('Question Deleted Successfully!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "msg", str, False)
        Catch ex As Exception
            ex.InnerException.ToString()
        Finally
            path.Close()
        End Try
        getquestion()
        'bindGrid("1")
        Call btnfirst_Click(source, e)
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
            ' setquestion()
            dv = Session("filter")
            gvFind.DataSource = dv
            gvFind.DataBind()
        End If

    End Sub






    Protected Sub ddldept_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        getddlsubject()
        getddlpaper()
        Call getquestion()
        bindGrid("null")
    End Sub

    Protected Sub ddlsubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        getddlpaper()
        Call getquestion()

        'Call getfirstq(0)


        bindGrid("null")
    End Sub

    Protected Sub ddlpaper_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Call getquestion()

        'Call getfirstq(0)


        bindGrid("null")
    End Sub
End Class
