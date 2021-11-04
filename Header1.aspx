<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Header1.aspx.vb" Inherits="Header1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Header</title>
    
</head>
<body alink="#6600ff" vlink="#6600ff" bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" style="vertical-align: middle; text-align: right">
    <form id="form1" runat="server">
    <div>
         <table width ="100%" cellpadding ="0" cellspacing ="0" id = "IPOname" runat="server" >
            <tr>
                <td colspan="3" align ="center"  >      </td>

               </tr>
        </table>
        </div>
        <asp:Timer ID="Timer1" runat="server">
        </asp:Timer>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <table style="text-align: center">
            <tr>
                <td align="center" style="width: 100px">
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td style="width: 100px">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp;
                </td>
                <td align="center" style="width: 100px">
                    <asp:Label ID="Label1" runat="server" Font-Names="Verdana" Font-Size="25pt" ForeColor="Red"
                        Text="DEPARTMENT OF COMPUTER" Width="850px" Font-Bold="True" style="color: #33ffff; background-color: #000000"></asp:Label></td>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
      </form>
</body>
</html>