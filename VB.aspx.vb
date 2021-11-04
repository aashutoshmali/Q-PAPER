Imports System.Data
Imports System.Data.OleDb
Imports System.Text
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser

Partial Class VB
    Inherits System.Web.UI.Page
    Dim cmd As OleDbCommand
    Dim adp, da As OleDbDataAdapter
    Dim ds As New DataSet
    Dim dt As New DataTable
    Dim path As New OleDbConnection(ConfigurationManager.AppSettings("path"))

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            getddlsubject()
            getddlpaper()
        End If


    End Sub

    Sub getddlsubject()
        'ds = Session("ds")
        'If ds.Tables.Contains("ddlsubject") Then
        '    ds.Tables("ddlsubject").Clear()
        'End If


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
    Sub getddlpaper()

        ds = Session("ds")
        If ds.Tables.Contains("ddlpaper") Then
            ds.Tables("ddlpaper").Clear()
        End If
        ddlpaper.Items.Clear()
        If ddlsubject.SelectedItem.Value = "Select" Then
            Exit Sub
        End If
        cmd = New OleDbCommand
        cmd.CommandText = "select keycode,paper from papermaster where subject=" & ddlsubject.SelectedItem.Value.Trim & ""
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
                ddlpaper.Items.Add("Select")
                ddlpaper.SelectedIndex = 0
            End If

        Catch ex As Exception
            ex.InnerException.ToString()
        End Try
        Session("ds") = ds
    End Sub

    Function getsubjectcode()
        Try
            cmd = New OleDbCommand

            cmd.Connection = path
            cmd.CommandText = "select subjectname from subjectmaster where keycode=" & ddlsubject.SelectedItem.Value.Trim & ""
            da = New OleDbDataAdapter(cmd)
            da.Fill(ds, "cnt")

            Return ds.Tables("cnt").Rows(0)(0).ToString
        Catch ex As Exception
            ex.InnerException.ToString()
        End Try
    End Function


    Private Function GetData() As DataTable
        Dim dt As New DataTable()
        Dim con As New OleDbConnection(ConfigurationManager.AppSettings("path"))
        Dim sda As New OleDbDataAdapter("SELECT TOP 10 question as [Paper Question] FROM qmaster  where paper=" & ddlpaper.SelectedItem.Value & " ORDER BY rnd(INT(NOW*keycode)-NOW*keycode)", con)

        Try
            con.Open()
            sda.Fill(dt)
            Return dt
        Catch ex As Exception
            Throw ex
        Finally
            con.Close()
            sda.Dispose()
            con.Dispose()
        End Try
    End Function


    Protected Sub ddldept_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddldept.SelectedIndexChanged
        getddlsubject()
        getddlpaper()
    End Sub

    Protected Sub ddlsubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlsubject.SelectedIndexChanged
        getddlpaper()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click


        If ddlsubject.SelectedItem.Value = "Select" Then

            Dim str As String = "<script language='javascript'>alert('Please select subject!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "add", str, False)

            Exit Sub
        End If


        If ddlpaper.SelectedItem.Value = "Select" Then
            Dim str As String = "<script language='javascript'>alert('Please select Paper!');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "add", str, False)

            Exit Sub
        End If

        Dim document As New Document(PageSize.A4, 10.0F, 10.0F, 10.0F, 0.0F)
        Dim p As New Paragraph
        Dim ch As New Chunk
        Dim strHTML As String
        Dim HTMLWorker As HTMLWorker
        Dim fname As String = ddlsubject.SelectedItem.Text + "_" + DateTime.Today.Day.ToString + DateTime.Today.Month.ToString + DateTime.Today.Year.ToString
        Dim dt As String = DateTime.Today.Day.ToString & "-" & DateTime.Today.Month.ToString & "-" & DateTime.Today.Year.ToString & ""
        Dim q As DataTable = GetData()

        If q.Rows.Count = 0 Then
            Dim str As String = "<script language='javascript'>alert('Please Check Paper has Questions !');</script>"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "add", str, False)

            Exit Sub
        End If

        Response.ContentType = "application/pdf"
        Response.AddHeader("content-disposition", "attachment;filename=" & fname & ".pdf")
        Response.Cache.SetCacheability(HttpCacheability.NoCache)

        PdfWriter.GetInstance(document, Response.OutputStream)
        document.Open()
        strHTML = ""
        strHTML = strHTML + "<body style='font-family: Times New Roman; text-align: left'>"
        strHTML = strHTML + "<span style='font-size: 48pt'><span style='font-size: 12pt'><span style='background-color: #f3e1fb'>"
        strHTML = strHTML + "  <div align='right' style='text-align: left'>"
        strHTML = strHTML + "   <i><span style='font-size: 12pt; line-height: 150%; font-family: 'Times New Roman','serif''>"
        strHTML = strHTML + "      <table style='color: blue; font-style: italic; font-family: 'Times New Roman'; background-color: #ffffff'>"
        strHTML = strHTML + "       <tr>"
        strHTML = strHTML + "           <td colspan='3' style='color: red; text-align: center'>"
        strHTML = strHTML + "               <strong><span style='font-size: 14pt'>Mahavir &nbsp;Polytechnic, Nashik</span></strong></td>"
        strHTML = strHTML + "      </tr>"
        strHTML = strHTML + "     <tr>"
        strHTML = strHTML + "         <td colspan='3' style='color: red; text-align: center'>"
        strHTML = strHTML + "         <strong><span style='font-size: 18pt'>Examination </span></strong>"
        strHTML = strHTML + "     </td>"
        strHTML = strHTML + "  </tr>"
        strHTML = strHTML + "  <tr>"
        strHTML = strHTML + "     <td colspan='3' style='text-align: right'>"
        strHTML = strHTML + "        <strong><span style='font-size: 14pt'>Marks: 40</span></strong></td>"
        strHTML = strHTML + "</tr>"
        strHTML = strHTML + " <tr>"
        strHTML = strHTML + "     <td colspan='3' style='text-align: left'>"
        strHTML = strHTML + "                 Subject: <b>" & ddlsubject.SelectedItem.Text & "<span style='mso-spacerun: yes'> </span></b>"
        strHTML = strHTML + "      </td>"
        strHTML = strHTML + " </tr>"
        strHTML = strHTML + " <tr>"
        strHTML = strHTML + "     <td colspan='3' style='color: blue; text-align: right'>"
        strHTML = strHTML + "     <strong>"
        strHTML = strHTML + "                Date:" & dt & " <span style='mso-tab-count: 3'></span></strong></td>"
        strHTML = strHTML + "</tr>"
        strHTML = strHTML + " <tr>"
        strHTML = strHTML + "      <td colspan='3' style='color: blue; text-align: right'>"
        strHTML = strHTML + "       <p class='MsoNormal' style='margin: 0in 0in 10pt; line-height: 150%; text-align: left;'>"
        strHTML = strHTML + "__________________________________________________________________________________</p>"
        strHTML = strHTML + "   </td>"
        strHTML = strHTML + "  </tr>"

        strHTML = strHTML + "  <tr style='font-style: italic'>"
        strHTML = strHTML + "      <td colspan='3' style='font-family: Times New Roman; "
        strHTML = strHTML + " Text(-align) : center() 'valign='top'>"
        strHTML = strHTML + "<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All Questions are Compulsory.(10 X 4 Marks)<br/> <br/><br/>"
        Dim r As DataRow
        Dim i As Integer = 1
        For Each r In q.Rows
            strHTML = strHTML + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & i & ") " & r(0).ToString & "                                         <br/> <br />"
            i = i + 1
        Next

        strHTML = strHTML + "            </td>"
        strHTML = strHTML + "         </tr>"
        strHTML = strHTML + "    </table>"
        strHTML = strHTML + " </span></i>"
        strHTML = strHTML + " </div>"
        strHTML = strHTML + "</span></span></span>"

        strHTML = strHTML + "</body>"









        HTMLWorker = New HTMLWorker(document)
        HTMLWorker.Parse(New StringReader(strHTML))
        document.Close()

        Response.Write(document)
        Response.End()
    End Sub

    Protected Sub ddlpaper_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlpaper.SelectedIndexChanged

    End Sub
End Class
