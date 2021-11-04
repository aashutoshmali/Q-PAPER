Imports System
Imports System.Data
Imports System.Data.OleDb

Imports System.IO

Partial Class StaffReport
    Inherits System.Web.UI.Page
    Dim cmd As OleDbCommand
    Dim da, adp As New OleDbDataAdapter
    Dim ds As New DataSet

    Dim path As New OleDbConnection(ConfigurationManager.AppSettings("path"))
    Dim dv As New DataView

    Dim str2 As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        If Not Page.IsPostBack Then



            getreport()



        End If

    End Sub
    Sub getreport()
        If ds.Tables.Contains("sbrokers") Then
            ds.Tables("sbrokers").Clear()
        End If
        Session("dt") = Nothing

        cmd = New OleDbCommand
        ViewState("sortflag") = 1


        cmd.CommandText = "SELECT        fullname AS StaffName, designation AS Designation, dob AS DateOfBirth, doj AS DateOfJoining, sex AS Sex, bg AS BloodGroup, address AS Address, mno AS Mobile, lno AS LandLine, email AS Email, bpoint AS BusPoint FROM  staff ORDER BY eid;"

        cmd.Connection = path

        adp = New OleDbDataAdapter(cmd)
        adp.Fill(ds, "rpt")

        Session("ds") = ds
        Try
            gvreport.DataSource = ds.Tables("rpt")
            gvreport.DataBind()

            dv.Table = ds.Tables("rpt")

        Catch ex As Exception
            ex.InnerException.ToString()
        End Try
    End Sub


    Protected Sub btndownload_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub



    Protected Sub gvreport_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvreport.PageIndexChanging
        gvreport.PageIndex = e.NewPageIndex
        ViewState("page") = gvreport.PageIndex

        sortdatauser()
    End Sub
    Protected Sub gvreport_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles gvreport.Sorting

        If ViewState("sortflag") = 1 Then
            '  bindGrid(e.SortExpression.ToString())
            ds = Session("ds")
            Dim dtData As Data.DataTable = ds.Tables("rpt")
            GridViewSortExpression = e.SortExpression

            'get the pageindex of the grid. 
            Dim pageIndex As Integer = gvreport.PageIndex

            Dim dv As New DataView
            dv = SortDataTable(dtData, False)
            gvreport.DataSource = dv
            gvreport.DataBind()
            gvreport.PageIndex = pageIndex
            Session("dvuser") = dv.ToTable

        End If


        If ViewState("sortflag") = 0 Then
            Dim dv As New DataView
            dv = Session("filter")
            Dim pageIndex As Integer = gvreport.PageIndex
            gvreport.DataSource = dv
            gvreport.DataBind()
            gvreport.PageIndex = pageIndex
            Session("filter") = dv
        End If


    End Sub
    Sub sortdatauser()

        If ViewState("sortflag") = 1 Then
            Dim dv As New DataView
            dv.Table = Session("dvuser")
            gvreport.DataSource = dv.ToTable
            gvreport.DataBind()
        Else
            ' setuser()
            dv = Session("filter")
            gvreport.DataSource = dv
            gvreport.DataBind()
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


End Class
