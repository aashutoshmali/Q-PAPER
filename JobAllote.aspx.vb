Imports System.Data
Imports System.Net.Mail
Imports System.Data.OleDb
Imports System.Net
Partial Class JobAllote
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
            txtdate.Attributes.Add("onactivate", "DisplayDate();")
            txtdate.Attributes.Add("onkeypress", "return chkdate()")

            'btnSaveuser.Attributes.Add("onclick", "return savermaster()")
            'btnUpdateuser.Attributes.Add("onclick", "return savermaster()")

            '---------------------------------------------------------

            ' txtuserid.Attributes.Add("OnKeypress", "setjob()")
            Dim dt As String = DateTime.Today.Day.ToString & "/" & DateTime.Today.Month.ToString & "/" & DateTime.Today.Year.ToString

            Label6.Text = dt
            ViewState("page") = 1
            getemp()
            getjob()
            getFirstjob(0)

            disabled()

            bindGrid("null")
            If gvFind.Rows.Count > 0 Then
                tblMain.Visible = False
                tblSub.Visible = True
            End If
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
        cmd.CommandText = "Select * from job order by keycode"
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


    Sub getFirstjob(ByVal i As Integer)
        ds = Session("ds")
        If ds.Tables("job").Rows.Count >= 1 Then
            hdnBrokerKey.Value = ds.Tables("job").Rows(i)(0)
            hdnUserId.Value = ds.Tables("job").Rows(i)(2)
            ddlemp.SelectedItem.Value = ds.Tables("job").Rows(i)(1)
            ddlemp.SelectedItem.Text = ds.Tables("job").Rows(i)(1)
            txtuserid.Text = ds.Tables("job").Rows(i)(3).ToString.Trim
            Label6.Text = ds.Tables("job").Rows(i)(4).ToString.Trim
            txtdate.Text = ds.Tables("job").Rows(i)(5).ToString.Trim


            btnEdituser.Enabled = True
            btndeleteuser.Enabled = True
        Else
            btnEdituser.Enabled = False
            btndeleteuser.Enabled = False
        End If
    End Sub

    Protected Sub btnAddUser_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        disablemovebutton()
        btnEdituser.Visible = False
        btnSaveuser.Visible = True
        btndeleteuser.Visible = False
        btnCanceluser.Visible = True
        btnAddUser.Visible = False
        Dim dt As String = DateTime.Today.Day.ToString & "/" & DateTime.Today.Month.ToString & "/" & DateTime.Today.Year.ToString
        Label6.Text = dt
        emptytext()
        enabled()
        ScriptManager1.SetFocus(txtuserid)
    End Sub

    Protected Sub btnSaveuser_Click(ByVal sender As Object, ByVal e As System.EventArgs)


        
        Dim ccode As String = DateTime.Today.Day.ToString & DateTime.Today.Month.ToString & DateTime.Today.Year.ToString & Now.Hour & Now.Minute & Now.Second
        Dim dt As String = DateTime.Today.Day.ToString & "/" & DateTime.Today.Month.ToString & "/" & DateTime.Today.Year.ToString
        cmd = New OleDbCommand
        '  cmd.CommandText = "Insert into job (empid,uid,uaddress,ufault,timefrom,timeto,dt,ccode,uemail) values ('" + ddlemp.SelectedItem.Text + "','" & txtuserid.Text.Trim & "','" & txtadress.Text.Trim & "','" & ddlfault.SelectedItem.Text & "','" & txtfrmtime.Text.Trim & "','" & txttotime.Text.Trim & "','" & dt & "','" & ccode & "','" & txtemail.Text.Trim & "');"
        cmd.CommandText = "Insert into job (empid,task,dt,tdt,ccode,UID) values ('" + ddlemp.SelectedItem.Text + "','" & txtuserid.Text.Trim & "','" & Label6.Text.Trim & "','" & txtdate.Text.Trim & "','" & ccode & "','" & ddlemp.SelectedValue.ToString & "');"

        cmd.Connection = path

        Try
            If path.State = ConnectionState.Open Then
                path.Close()
            End If
            path.Open()
            cmd.ExecuteNonQuery()
            'sendmail(ccode, txtemail.Text.Trim)
            Dim str As String = "<script language='javascript'>alert('job Added Successfully!');</script>"
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
        disabled()
        getjob()
        enablemovebutton()
        Call btnlast_Click(sender, e)



        bindGrid("null")
        tblMain.Visible = False
        tblSub.Visible = True
    End Sub

    Protected Sub btnEdituser_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = Session("ds")
        If ds.Tables("job").Rows.Count >= 1 Then
            disablemovebutton()
            btnEdituser.Visible = False
            btnUpdateuser.Visible = True
            btndeleteuser.Visible = False
            btnCanceluser.Visible = True
            btnAddUser.Visible = False



            enabled()
            ScriptManager1.SetFocus(txtuserid)
        End If
    End Sub

    Protected Sub btnUpdateuser_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        cmd = New OleDbCommand

        cmd.CommandText = "Update  job set empid='" + ddlemp.SelectedItem.Text + "',task='" + txtuserid.Text.Trim + "',tdt='" + txtdate.Text.Trim + "' where keycode=" + hdnBrokerKey.Value
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

        btnAddUser.Visible = True
        btnCanceluser.Visible = False
        btnUpdateuser.Visible = False
        btnEdituser.Visible = True
        btndeleteuser.Visible = True
        getjob()
        enablemovebutton()
        disabled()


    End Sub

    Protected Sub btnCanceluser_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("page") = gvFind.PageIndex + 1


        enablemovebutton()
        btnEdituser.Visible = True
        btnSaveuser.Visible = False
        btndeleteuser.Visible = True
        btnUpdateuser.Visible = False
        btnCanceluser.Visible = False
        btnAddUser.Visible = True
        If btnAddUser.Visible = True Then
            ds = Session("ds")
            If ds.Tables("job").Rows.Count >= 1 Then
                Call getjob()
                Call getFirstjob(ViewState("count"))
                Call disabled()
            End If
        End If
        disabled()


        btnAddUser.Visible = True
    End Sub

    Protected Sub btndeleteuser_Click(ByVal sender As Object, ByVal e As System.EventArgs)


        getjob()

        ds = Session("ds")

        If ds.Tables("job").Rows.Count >= 1 Then
            cmd = New OleDbCommand
            cmd.CommandText = "Delete from job  where keycode=" & hdnBrokerKey.Value & ""

            cmd.Connection = path
            Try
                If path.State = ConnectionState.Open Then
                    path.Close()
                End If
                path.Open()
                cmd.ExecuteNonQuery()
                Dim str As String = "<script language='javascript'>alert('job Deleted Successfully!');</script>"
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "msg", str, False)
                txtuserid.Text = ""
            Catch ex As Exception
                ex.InnerException.ToString()
            Finally
                path.Close()
            End Try
            ViewState("page") = gvFind.PageIndex + 1
            getjob()
            sortdatajob()
            Call btnfirst_Click(sender, e)

        End If
    End Sub

    'Sub sendmail(ByVal ccode As String, ByVal uemail As String)
    '    Dim msg As New MailMessage

    '    Dim emailClient As New SmtpClient("smtp.mail.yahoo.com.sg", 465)
    '    emailClient.EnableSsl = True
    '    emailClient.Credentials = New NetworkCredential("gmail_id", "password")
    '    Dim str As String = "<style type ='text/css' >.getalign{	text-align :justify ;}</style><body bgcolor='#eff3fb'><table cellpadding ='0' cellspacing ='0' border ='0'>"

    '    str = str + "<tr><td valign ='top' ><table cellpadding ='0' cellspacing ='0' border ='0'><tr> <td><tr><td align='center'>COMPLENT LETTER</td>  </tr>     <br /><br /><br /><br />  <br /><br /><br /><br /><br /><br />"
    '    str = str + "</td> </tr></tr><tr></tr><tr><td  height ='20'></td><tr><td>To,</td></tr><tr><td>Customer  </td> </tr><tr><td><strong > Complent Id:UASDAS234234</strong> </td> </tr>                           <tr>"
    '    str = str + "<td height ='20'></td></tr><tr><td  height ='20'></td></tr><tr> <td class ='getalign'> Dear Customer,</br>   with reference to your request dated 20Mar09 we  would like to inform you that our technician will visit your place as soon as possible.</br>   we hope that are experieced & professional team members will help you best effort basis.  </br>"
    '    str = str + "</br></br>  Yours Sincerly, <tr><td>  ABC Ltd.<br />        MG Road,Main road<br />       422003      </td>          </tr>     </td>     </tr>"
    '    str = str + "</table></td></tr></table></body>"
    '    With msg

    '        .From = New MailAddress("gmailid")
    '        .To.Add("gauri_khot1@rediffmail.com")

    '        .Subject = str
    '        .Priority = MailPriority.High
    '        .DeliveryNotificationOptions = DeliveryNotificationOptions.OnSuccess
    '        .IsBodyHtml = True
    '        .Body = "this mail from yahoo" 'dtsend.Rows(i).Item("bodymsg").ToString

    '    End With

    '    Try
    '        emailClient.Send(msg)

    '    Catch ex As Exception

    '    Finally

    '    End Try
    'End Sub

    Sub disabled()
        txtuserid.Enabled = False
        ddlemp.Enabled = False
        txtdate.Enabled = False
        Label6.Enabled = False
        '  ddlfault.Enabled = False
        '   txttotime.Enabled = False
        '   txtfrmtime.Enabled = False
        '  Button1.Enabled = False


    End Sub

    Sub enabled()
        txtuserid.Enabled = True
        ddlemp.Enabled = True
        txtdate.Enabled = True
        Label6.Enabled = True
        '  ddlfault.Enabled = True
        ' txttotime.Enabled = True
        ' txtfrmtime.Enabled = True
        '   Button1.Enabled = True

    End Sub

    Sub emptytext()
        txtuserid.Text = ""
        txtdate.Text = ""

        Dim dt As String = DateTime.Today.Day.ToString & "/" & DateTime.Today.Month.ToString & "/" & DateTime.Today.Year.ToString
        Label6.Text = dt
        '  txttotime.Text = ""
        '  txtfrmtime.Text = ""

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

    Protected Sub btnfirst_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = Session("ds")
        If ds.Tables("job").Rows.Count >= 1 Then
            getFirstjob(0)
            ViewState("count") = 0
            btnEdituser.Enabled = True
            btndeleteuser.Enabled = True
        Else
            btnEdituser.Enabled = False
            btndeleteuser.Enabled = False
        End If
    End Sub

    Protected Sub btnprevious_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = Session("ds")
        If ds.Tables("job").Rows.Count >= 1 Then
            i = ds.Tables("job").Rows.Count - 1
            cnt = ViewState("count")

            If cnt = 0 Then
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "mykey1", "alert('First Record');", True)
            Else
                cnt = cnt - 1
                ViewState("count") = cnt
                getFirstjob(cnt)
            End If
        End If
    End Sub

    Protected Sub btnnext_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = Session("ds")
        If ds.Tables("job").Rows.Count >= 1 Then
            Dim i As Integer = ds.Tables("job").Rows.Count - 1
            cnt = ViewState("count")

            If cnt = i Then
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "mykey2", "alert('Last Record');", True)
            Else
                cnt = cnt + 1
                ViewState("count") = cnt
                getFirstjob(cnt)
            End If
        End If
    End Sub

    Protected Sub btnlast_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = Session("ds")
        If ds.Tables("job").Rows.Count >= 1 Then
            i = ds.Tables("job").Rows.Count - 1
            getFirstjob(i)
            ViewState("count") = i
        End If
    End Sub

    Sub bindGrid(ByVal sortExp As String)

        If ds.Tables.Contains("Find") Then
            ds.Tables("Find").Clear()
        End If

        Dim fillGrid As New OleDbDataAdapter("Select * from job order by keycode", path)
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



        Dim rowCnt As Integer = 0
        For Each dgvRow As GridViewRow In gvFind.Rows
            CType(dgvRow.Cells(10).Controls(1), LinkButton).CommandArgument = rowCnt
            rowCnt = rowCnt + 1
        Next
    End Sub

    Protected Sub gvFind_DeleteCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs)

    End Sub



    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        tblMain.Visible = True
        tblSub.Visible = False
        Call btnAddUser_Click(sender, e)
    End Sub

    Protected Sub btnDelete_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)

        'If e.CommandArgument = "" Then
        '  hdnBrokerKey.Value = CType(gvFind.Rows().FindControl("lblregkey"), Label).Text.Trim
        'Else
        Dim r As GridViewRow = TryCast(DirectCast(sender, LinkButton).Parent.Parent, GridViewRow)
        Dim rindex As Integer = r.RowIndex


        hdnBrokerKey.Value = CType(gvFind.Rows(r.RowIndex).FindControl("keycode"), Label).Text.Trim

        Call btndeleteuser_Click(sender, e)

    End Sub

    Protected Sub gvFind_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ds = CType(Session("ds"), DataSet).Copy

        Dim dvFind As DataView
        dvFind = ds.Tables("job").DefaultView

        dvFind.Sort = "keycode"
        Dim findIndex = dvFind.Find(CType(gvFind.SelectedRow.FindControl("keycode"), Label).Text.Trim)
        hdnBrokerKey.Value = dvFind.Find(CType(gvFind.SelectedRow.FindControl("keycode"), Label).Text.Trim)
        hdnrmname.Value = CType(gvFind.SelectedRow.FindControl("keycode"), Label).Text.Trim

        getFirstjob(findIndex)

        ScriptManager1.SetFocus(btnEdituser)

        tblMain.Visible = True
        tblSub.Visible = False
        btnAddUser.Visible = True
        btnCanceluser.Visible = False

    End Sub

    Protected Sub gvFind_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvFind.PageIndexChanging

        gvFind.PageIndex = e.NewPageIndex
        bindGrid("null")


    End Sub
    
    Protected Sub gvFind_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles gvFind.Sorting

        If ViewState("sortflag") = 1 Then
            ds = Session("ds")
            Dim dtData As Data.DataTable = ds.Tables("job")
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
            Session("dvjob") = dv.ToTable
            ' ViewState("sortflag") = 1
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

    

    Protected Sub btnupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        'If hdn1.Value = "" Then
        '    Dim str As String = "<script language='javascript'>alert(' job Not Selected!');</script>"
        '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "msg3", str, False)
        '    Exit Sub
        'End If
        'Dim registrarname As String = CType(gvFind.Rows(hdn1.Value).FindControl("lblreg"), Label).Text


        'cmd = New SqlCommand
        'cmd.CommandText = "Payout_EditIssueRegistrar"
        'cmd.CommandType = CommandType.StoredProcedure
        'cmd.Connection = path
        'cmd.Parameters.Add(New SqlParameter("@Issuekey", SqlDbType.NVarChar, 50, ParameterDirection.Input)).Value = Session("issuekey").ToString
        'cmd.Parameters.Add(New SqlParameter("@Registrarname", SqlDbType.NVarChar, 200, ParameterDirection.Input)).Value = registrarname


        'Try
        '    If path.State = ConnectionState.Open Then
        '        path.Close()
        '    End If
        '    path.Open()
        '    cmd.ExecuteNonQuery()

        '    Dim str As String = "<script language='javascript'>alert('Issue Registrar Set Successfully!');</script>"
        '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "msg3", str, False)

        'Catch ex As Exception
        '    ex.InnerException.ToString()
        'Finally
        '    path.Close()
        'End Try
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

    Protected Sub BtnAll_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("sortflag") = 1
        sortdatajob()
    End Sub

    Protected Sub btnview_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        emptytext()
        bindGrid("null")
        If gvFind.Rows.Count > 0 Then
            tblMain.Visible = False
            tblSub.Visible = True
        End If
    End Sub

    'Sub getaddress()
    '    If txtuserid.Text.Trim = "" Then
    '        Exit Sub
    '    End If
    '    If ds.Tables.Contains("address") Then
    '        ds.Tables("address").Clear()
    '    End If

    '    cmd = New OleDbCommand
    '    cmd.CommandText = "Select address,email from usermaster where uid='" & txtuserid.Text.Trim & "'"
    '    cmd.Connection = path
    '    Try
    '        adp = New OleDbDataAdapter(cmd)
    '        adp.Fill(ds, "address")
    '        If ds.Tables("address").Rows.Count > 0 Then
    '            txtadress.Text = ds.Tables("address").Rows(0)(0).ToString.Trim
    '            txtemail.Text = ds.Tables("address").Rows(0)(1).ToString.Trim
    '        End If

    '    Catch ex As Exception
    '        ex.InnerException.ToString()
    '    End Try
    'End Sub
    Sub getemp()
        If ds.Tables.Contains("emp") Then
            ds.Tables("emp").Clear()
        End If

        cmd = New OleDbCommand
        cmd.CommandText = "Select fullname,UID from staff where designation='LECTURER'"
        cmd.Connection = path
        Try
            adp = New OleDbDataAdapter(cmd)
            adp.Fill(ds, "emp")
            ddlemp.DataSource = ds.Tables("emp")
            ddlemp.DataTextField = ds.Tables("emp").Columns(0).ToString
            ddlemp.DataValueField = ds.Tables("emp").Columns(1).ToString
            ddlemp.DataBind()
        Catch ex As Exception
            ex.InnerException.ToString()
        End Try
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ' getaddress()
    End Sub
End Class
