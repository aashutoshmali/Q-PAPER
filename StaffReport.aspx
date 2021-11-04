<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StaffReport.aspx.vb" Inherits="StaffReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table id="tblMain" runat="server" align="center" border="1" bordercolor="#507cd1"
                    style="background-color: #eff3fb">
                    <tr>
                        <td align="center" style="border-top-style: none; border-right-style: none; border-left-style: none;
                            height: 20px; background-color: #507cd1; border-bottom-style: none">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="11pt"
                                ForeColor="White">Staff Report</asp:Label></td>
                    </tr>
                    <tr>
                        <td rowspan="2" style="border-top-style: none; border-right-style: none; border-left-style: none;
                            border-bottom-style: none">
                            </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td align="right" rowspan="1" style="border-top-style: none; border-right-style: none;
                            border-left-style: none; border-bottom-style: none">
                            <asp:Button ID="btndownload" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                OnClick="btndownload_Click" Text="Download" Visible="False" /></td>
                    </tr>
                    <tr>
                        <td rowspan="1" style="border-top-style: none; border-right-style: none; border-left-style: none;
                            border-bottom-style: none">
                            <asp:GridView ID="gvreport" runat="server" CellPadding="4" Font-Names="Verdana"
                                Font-Size="10pt" AllowSorting="True" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-top-style: none; border-right-style: none; border-left-style: none;
                            border-bottom-style: none">
                            &nbsp;</td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
           
            </Triggers>  
        </asp:UpdatePanel>
    
    </div>
    </form>
</body>
</html>
