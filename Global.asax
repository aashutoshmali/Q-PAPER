<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
        'Application("issuekey") = "IPO07210101100000"
        'Application("issuekey") = "IPO07220101100000"
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
        'Dim err As Exception = Server.GetLastError()
        'Response.Clear()
        'Response.Write("<h1>" & err.InnerException.Message & "</h1>")
        'Response.Write("<pre>" & err.ToString & "</pre>")
        'Server.ClearError()
        'Response.Redirect("ErrorPage.aspx")
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
        
        'Message Popup
        Session("MessageTimerInterval") = "3600000"
        Session("DefaultTimerInterval") = "1" 
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
        Session("issuekey") = ""
        Session("issuecode") = ""
        Session("issuename") = ""
        Session("issuecdate") = ""
        Session("IPOColor") = ""
        Session("ucode") = ""
        Session("uname") = ""
        Session("dt") = ""
        Session("issuecreate") = ""
        Session("nonissue") = ""
        Session("pwd") = ""
        Session("connection") = ""
    End Sub
       
</script>