<%@ Page Language="VB" AutoEventWireup="false" CodeFile="VB.aspx.vb" Inherits="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="tblMain" runat="server" align="center" border="1" bordercolor="#507cd1"
            style="background-color: #eff3fb">
            <tr>
                <td align="center" style="border-top-style: none; border-right-style: none; border-left-style: none;
                    height: 20px; background-color: #507cd1; border-bottom-style: none">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="11pt"
                        ForeColor="White" Text="Question Paper Generation"></asp:Label></td>
            </tr>
            <tr>
                <td style="border-top-style: none; border-right-style: none; border-left-style: none;
                    border-bottom-style: none">
                    <table>
                        <tr>
                            <td colspan="2" style="border-top-width: 1px; border-left-width: 1px; border-left-color: #507cd1;
                                border-bottom-width: 1px; border-bottom-color: #507cd1; border-top-color: #507cd1;
                                background-color: #f7f6f3; border-right-width: 1px; border-right-color: #507cd1">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Department"
                                    Width="120px"></asp:Label></td>
                            <td style="width: 169px">
                                <asp:DropDownList ID="ddldept" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                    TabIndex="5" Width="166px" AutoPostBack="True">
                                    <asp:ListItem>CO</asp:ListItem>
                                    <asp:ListItem>IF</asp:ListItem>
                                    <asp:ListItem>CIVIL</asp:ListItem>
                                    <asp:ListItem>MECH</asp:ListItem>
                                    <asp:ListItem>ETC</asp:ListItem>
                                    <asp:ListItem>EE</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Subject"
                                    Width="128px"></asp:Label></td>
                            <td style="width: 169px">
                                <asp:DropDownList ID="ddlsubject" runat="server" Font-Names="Verdana"
                                    Font-Size="10pt" TabIndex="5" Width="166px" AutoPostBack="True">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Paper"
                                    Width="128px"></asp:Label></td>
                            <td style="width: 169px">
                                <asp:DropDownList ID="ddlpaper" runat="server" Font-Names="Verdana"
                                    Font-Size="10pt" TabIndex="5" Width="166px" AutoPostBack="True">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                                    Height="45px" Text="Generate Question Paper" Width="275px" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
       
        <br />
        &nbsp;<br />
        <br />
        
    </div>
    </form>
</body>
</html>
