Imports System.Data
Imports System.Data.oledb


Imports System.IO
Partial Class StaffMaster
    Inherits System.Web.UI.Page
    Dim cmd As oledbCommand
    Dim adp, da As oledbDataAdapter
    Dim ds As New DataSet
    Dim dt As New DataTable
    Dim drow As DataRow
    Dim dv As New DataView

    Dim ds1 As New DataSet
    'Dim dr As oledbDataReader
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


        txtdate.Attributes.Add("onactivate", "DisplayDate();")
        txtdoj.Attributes.Add("onactivate", "DisplayDate1();")
        txtuserid.Attributes.Add("onkeypress", "return chkUserId()")
        'ddldept.Attributes.Add("onkeypress", "return chkdept()")
        'dlclass.Attributes.Add("onkeypress", "return chkclass()")
        ddltype.Attributes.Add("onkeypress", "return chktype()")
        txtfname.Attributes.Add("onkeypress", "return chkname()")
        txtblood.Attributes.Add("onkeypress", "return chkblood()")
        txtdate.Attributes.Add("onkeypress", "return chkdate()")

        txtdoj.Attributes.Add("onkeypress", "return chkdate()")


        ddlsex.Attributes.Add("onkeypress", "return chksex()")
        txtaddress.Attributes.Add("onkeypress", "return chkadd()")
        txtmobile.Attributes.Add("onkeypress", "return chkmob()")
        'txtfax.Attributes.Add("onkeypress", "return chkfax()")
        txtlandline.Attributes.Add("onkeypress", "return chkland()")

        txtemail.Attributes.Add("onkeypress", "return chkEmail()")
        txtemail.Attributes.Add("onfocus", "this.select()")

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
            Call getstaff()

            Call getfirststaff(0)
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

    Sub getfirststaff(ByVal i As Integer)

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
            txtfname.Text = ds.Tables("user").Rows(i)(1)
            'txtusername.Text = ds.Tables("user").Rows(i)(2)


            'ddlRole.SelectedItem.Value = ds.Tables("user").Rows(i)(4)

            'If ds.Tables("user").Rows(i)(1).ToString.ToLower = "co" Then
            '    ddldept.SelectedIndex = 0
            'ElseIf ds.Tables("user").Rows(i)(1).ToString.ToLower = "if" Then
            '    ddldept.SelectedIndex = 1
            'ElseIf ds.Tables("user").Rows(i)(1).ToString.ToLower = "civil" Then
            '    ddldept.SelectedIndex = 2
            'ElseIf ds.Tables("user").Rows(i)(1).ToString.ToLower = "mech" Then
            '    ddldept.SelectedIndex = 3
            'ElseIf ds.Tables("user").Rows(i)(1).ToString.ToLower = "etc" Then
            '    ddldept.SelectedIndex = 4
            'ElseIf ds.Tables("user").Rows(i)(1).ToString.ToLower = "ee" Then
            '    ddldept.SelectedIndex = 5
            'End If



            If ds.Tables("user").Rows(i)(2).ToString.ToLower = "lecturer" Then
                ddltype.SelectedIndex = 0
            ElseIf ds.Tables("user").Rows(i)(2).ToString.ToLower = "hod" Then
                ddltype.SelectedIndex = 1
            ElseIf ds.Tables("user").Rows(i)(2).ToString.ToLower = "principal" Then
                ddltype.SelectedIndex = 2
            End If

            txtdate.Text = ds.Tables("user").Rows(i)(3)
            txtdoj.Text = ds.Tables("user").Rows(i)(4)


           

            If ds.Tables("user").Rows(i)(5).ToString.ToLower = "male" Then
                ddlsex.SelectedIndex = 0
            ElseIf ds.Tables("user").Rows(i)(5).ToString.ToLower = "female" Then
                ddlsex.SelectedIndex = 1
            End If


            If Not IsDBNull(ds.Tables("user").Rows(i)(6)) Then

                txtblood.Text = ds.Tables("user").Rows(i)(6)
            Else

                txtblood.Text = ""
            End If

           
            If Not IsDBNull(ds.Tables("user").Rows(i)(7)) Then

                txtaddress.Text = ds.Tables("user").Rows(i)(7)
            Else

                txtaddress.Text = ""
            End If


           

            If Not IsDBNull(ds.Tables("user").Rows(i)(8)) Then

                txtmobile.Text = ds.Tables("user").Rows(i)(8)
            Else

                txtmobile.Text = ""
            End If
           
            If Not IsDBNull(ds.Tables("user").Rows(i)(9)) Then

                txtlandline.Text = ds.Tables("user").Rows(i)(9)
            Else

                txtlandline.Text = ""
            End If
            If Not IsDBNull(ds.Tables("user").Rows(i)(10)) Then

                txtemail.Text = ds.Tables("user").Rows(i)(10)
            Else

                txtemail.Text = ""
            End If
            If Not IsDBNull(ds.Tables("user").Rows(i)(11)) Then

                txtbus.Text = ds.Tables("user").Rows(i)(11)
            Else

                txtbus.Text = ""
            End If


            If Not IsDBNull(ds.Tables("user").Rows(i)(12)) Then

                txtuserid.Text = ds.Tables("user").Rows(i)(12)
            Else

                txtuserid.Text = ""
            End If

            If Not IsDBNull(ds.Tables("user").Rows(i)(13)) Then

                txtpassword.Text = ds.Tables("user").Rows(i)(13)
            Else

                txtpassword.Text = ""
            End If






            hdnUserKey.Value = ds.Tables("user").Rows(i)(0)




            btnEdituser.Enabled = True
            btndeleteuser.Enabled = True
        Else
            btnEdituser.Enabled = False
            btndeleteuser.Enabled = False

        End If


    End Sub

    Sub setstaff()

        ds = Session("ds")
        gvFind.DataSource = ds.Tables("user")
        gvFind.DataBind()

    End Sub

    Sub getstaff()
        If ds.Tables.Contains("user") Then
            ds.Tables("user").Clear()
        End If

        ViewState("sortflag") = 1

        cmd = New OleDbCommand

        cmd.CommandText = "SELECT * FROM staff order by eid"


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
            getfirststaff(0)
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
            getfirststaff(i)
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
            getfirststaff(cnt)
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
            getfirststaff(cnt)
        End If
    End Sub

    Sub emptytext()
        'ddldept.SelectedIndex = 0
        'ddlclass.SelectedIndex = 0
        ddltype.SelectedIndex = 0
        txtfname.Text = ""
        txtblood.Text = ""
        txtdate.Text = ""
        ddlsex.SelectedIndex = 0
        txtaddress.Text = ""
        txtmobile.Text = ""
        'txtfax.Text = ""
        txtlandline.Text = ""
        txtemail.Text = ""

        txtbus.Text = ""
        txtdoj.Text = ""
        txtuserid.Text = ""
        txtpassword.Text = ""
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

        enabled()



        btnView.Enabled = False
    End Sub

    Sub disabled()
        'ddldept.Enabled = False
        'ddlclass.Enabled = False
        ddltype.Enabled = False
        txtfname.Enabled = False
        txtblood.Enabled = False
        txtdate.Enabled = False
        ddlsex.Enabled = False
        txtaddress.Enabled = False
        txtmobile.Enabled = False
        'txtfax.Enabled = False
        txtlandline.Enabled = False
        txtemail.Enabled = False

        txtbus.Enabled = False
        txtdoj.Enabled = False
        txtuserid.Enabled = False
        txtpassword.Enabled = False

    End Sub

    Sub enabled()
        'ddldept.Enabled = True
        'ddlclass.Enabled = True
        ddltype.Enabled = True
        txtfname.Enabled = True
        txtblood.Enabled = True
        txtdate.Enabled = True
        ddlsex.Enabled = True
        txtaddress.Enabled = True
        txtmobile.Enabled = True
        'txtfax.Enabled = True
        txtlandline.Enabled = True
        txtemail.Enabled = True
        txtbus.Enabled = True
        txtdoj.Enabled = True
        txtuserid.Enabled = True
        txtpassword.Enabled = True
    End Sub

    Protected Sub btndeleteuser_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        cmd = New oledbCommand
        cmd.CommandText = "delete from staff where eid = " & hdnUserKey.Value & ";"

        cmd.Connection = path

        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()
            Dim str As String = "<script language='javascript'>alert('staff Deleted Successfully!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "msg", str, False)
        Catch ex As Exception
            ex.InnerException.ToString()
        Finally
            path.Close()
        End Try
        getstaff()
        sortdatauser()
        ' bindGrid("1")
        Call btnfirst_Click(sender, e)
    End Sub

    Protected Sub btnUpdateuser_Click(ByVal sender As Object, ByVal e As System.EventArgs)



        currentdate = dat.ToString("dd/MM/yyyy HH:mm:ss")

        cmd = New oledbCommand
        '  cmd.CommandText = "update usermaster set uname='" & txtusername.Text.Trim & "',role='" & ddlRole.SelectedItem.Text.Trim & "',email='" & txtemail.Text.Trim & "' where uid='" & txtuserid.Text.Trim & "';"
        cmd.CommandText = "UPDATE staff SET fullname ='" & txtfname.Text.Trim & "', designation ='" & ddltype.SelectedItem.Text & "', dob ='" & txtdate.Text.Trim & "', doj ='" & txtdoj.Text.Trim & "', sex ='" & ddlsex.SelectedItem.Text.Trim & "', bg ='" & txtblood.Text.Trim & "', address ='" & txtaddress.Text.Trim & "', mno ='" & txtmobile.Text.Trim & "', lno ='" & txtlandline.Text.Trim & "', email ='" & txtemail.Text.Trim & "', bpoint ='" & txtbus.Text.Trim & "', uid ='" & txtuserid.Text.Trim & "', pass ='" & txtpassword.Text.Trim & "' where eid= " & hdnUserKey.Value & ";"

        
        cmd.Connection = path

        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()
            Dim str As String = "<script language='javascript'>alert('staff Updated Successfully!');</script>"
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

        getstaff()
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
        ' txtuserid.ReadOnly = False
        If btnAddUser.Visible = True Then
            Call getstaff()
            Call getfirststaff(ViewState("count"))
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

        Dim row() As DataRow
        row = ds.Tables("user").Select("fullname='" & txtfname.Text & "'")
        If row.Length <> 0 Then
            If (row(0)(0).ToString.ToLower = txtfname.Text.ToLower) Then
                Dim str As String = "<script language='javascript'>alert('staff Already Exists!');</script>"
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "UserExist", str, False)
                txtfname.Text = ""
                ScriptManager1.SetFocus(txtfname)

                Exit Sub
            End If
        End If




        cmd = New oledbCommand
        'cmd.CommandText = "INSERT INTO staffmaster (department, class, stafftype, fullname, bloodgroup, dob, sex, address, mobile, fax, landline, email) VALUES   ('" & ddldept.SelectedItem.Text & "','" & ddlclass.SelectedItem.Text & "','" & ddltype.SelectedItem.Text & "','" & txtfname.Text.Trim & "','" & txtblood.Text.Trim & "','" & txtdate.Text.Trim & "','" & ddlsex.SelectedItem.Text & "','" & txtaddress.Text.Trim & "','" & txtmobile.Text.Trim & "','" & txtfax.Text.Trim & "','" & txtlandline.Text.Trim & "','" & txtemail.Text.Trim & "');"
        cmd.CommandText = "INSERT INTO staff (fullname, designation, dob, doj, sex, bg, address, mno, lno, email, bpoint,uid,pass) VALUES     ('" & txtfname.Text.Trim & "','" & ddltype.SelectedItem.Text & "','" & txtdate.Text.Trim & "','" & txtdoj.Text.Trim & "','" & ddlsex.SelectedItem.Text & "','" & txtblood.Text.Trim & "','" & txtaddress.Text.Trim & "','" & txtmobile.Text.Trim & "','" & txtlandline.Text.Trim & "','" & txtemail.Text.Trim & "','" & txtbus.Text.Trim & "','" & txtuserid.Text.Trim & "','" & txtpassword.Text.Trim & "');"

        cmd.Connection = path


        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()

            Dim str As String = "<script language='javascript'>alert('staff Added Successfully!');</script>"
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
        getstaff()
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






        btnView.Enabled = False
    End Sub




    'Protected Sub btnactive_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnactive.Click
    '    'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "m", "window.parent.frames[1].location.href='ActivateUsers.aspx';", True)
    'End Sub

    Protected Sub gvFind_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = CType(Session("ds"), DataSet).Copy

        Dim dvFind As DataView
        dvFind = ds.Tables("user").DefaultView

        dvFind.Sort = "eid"
        Dim findIndex = dvFind.Find(CType(gvFind.SelectedRow.FindControl("eid"), Label).Text.Trim)

        getfirststaff(findIndex)

        ScriptManager1.SetFocus(btnEdituser)

        tblMain.Visible = True
        tblSub.Visible = False

    End Sub

    Sub bindGrid(ByVal sortExp As String)

        If ds.Tables.Contains("Find") Then
            ds.Tables("Find").Clear()
        End If

        Dim fillGrid As New OleDbDataAdapter("SELECT staff.* FROM staff order by eid", path)
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
            CType(dgvRow.Cells(4).Controls(1), LinkButton).CommandArgument = rowCnt
            rowCnt = rowCnt + 1
        Next
    End Sub

    Protected Sub gvFind_DeleteCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs)
        cmd = New OleDbCommand
        cmd.CommandText = "delete form staff where eid=" & hdnUserKey.Value & ""

        cmd.Connection = path
        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()
            Dim str As String = "<script language='javascript'>alert('staff Deleted Successfully!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "msg", str, False)
        Catch ex As Exception
            ex.InnerException.ToString()
        Finally
            path.Close()
        End Try
        getstaff()
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

        hdnUserKey.Value = CType(gvFind.Rows(r.RowIndex).FindControl("eid"), Label).Text
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
            ' setstaff()
            dv = Session("filter")
            gvFind.DataSource = dv
            gvFind.DataBind()
        End If

    End Sub






End Class
