<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Footer.aspx.vb" Inherits="Footer" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Footer</title>
</head>
<body leftmargin="0" rightmargin="2" topmargin="0">
    <form id="form1" runat="server">
    <div>
        <table align="center" bgcolor="#ccccff" border="0" width="100%" >
            <tr>
                <td style="background-color: #ffffcc;" bgcolor="#99ccff" width="40%">
                    <asp:Label ID="lbluser1" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                        ForeColor="ControlDarkDark" Text="Username" ></asp:Label></td>
                <td style="background-color: #ffffcc;" bgcolor="#99ccff">
                    <asp:Label ID="lbluser" runat="server" Font-Names="Verdana" Font-Size="8pt" ForeColor="ControlDarkDark"
                        Height="16px" Text="Label"  Font-Bold="True"></asp:Label></td>
            </tr>
        </table>
    
    </div>
        
    </form>
</body>
</html>
