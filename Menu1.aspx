<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Menu1.aspx.vb" Inherits="Menu1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Menu</title>
</head>
<body alink="#6600ff" vlink="#6600ff" bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" >
    <form id="form1" runat="server" method= "post">
    <div>
        <div>
            <div>  <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td colspan="3" rowspan="3">
                                        </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td align="center" colspan="3" rowspan="1" >
                                        <table id="Table1" runat="server" align="center" border="0" bordercolor="#535353"
                                            cellpadding="0" cellspacing="0">
                                            <tr style="color: #000000; font-family: Times New Roman">
                                                <td align="center" valign="top">
                                                    <img src="Images/HEADER/kk.jpg" width="0" />&nbsp;<img src="Images/SelectionForm/SMES.JPG" /></td>
                                            </tr>
                                            <tr style="color: #000000; font-family: Times New Roman">
                                                <td align="center" style="width: 201px; height: 50px" valign="top">
                                                    <asp:Image ID="imgMenu" runat="server" ImageUrl="~/Images/Menu/menu_top_master.bmp" /></td>
                                            </tr>
                                            <tr style="color: #000000; font-family: Times New Roman">
                                                <td align="center" bgcolor="#d8dfe9" style="font-size: 1pt; background-image: url(Images/Menu/menu_center.bmp)"
                                                    valign="top">
                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 128px;">
                                                        <tr>
                                                            <td align="left" style="width: 128px">
                                                                <asp:TreeView ID="treeMenu" runat="server" ExpandDepth="0" Font-Bold="True" Font-Names="Arial"
                                                                    Font-Size="10pt" ForeColor="White" ImageSet="Arrows">
                                                                    <ParentNodeStyle Font-Bold="False" />
                                                                    <LevelStyles>
                                                                        <asp:TreeNodeStyle Font-Bold="True" Font-Names="Verdana" Font-Underline="False" ForeColor="#676767" />
                                                                        <asp:TreeNodeStyle Font-Bold="False" Font-Names="Verdana" Font-Underline="False"
                                                                            ForeColor="#676767" />
                                                                    </LevelStyles>
                                                                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                                                                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px"
                                                                        VerticalPadding="0px" />
                                                                    <LeafNodeStyle Font-Bold="False" Font-Names="Verdana" ForeColor="Black" />
                                                                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Gold" HorizontalPadding="5px"
                                                                        VerticalPadding="0px" NodeSpacing="0px" />
                                                                    <RootNodeStyle ForeColor="Red" />
                                                                </asp:TreeView>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="width: 128px">
                                                                <asp:TreeView ID="treeLogOut" runat="server" ExpandDepth="0" Font-Bold="True" Font-Names="Arial"
                                                                    Font-Size="10pt" ForeColor="White" ImageSet="Arrows">
                                                                    <ParentNodeStyle Font-Bold="False" />
                                                                    <LevelStyles>
                                                                        <asp:TreeNodeStyle Font-Bold="True" Font-Names="Verdana" Font-Underline="False" ForeColor="#676767" />
                                                                        <asp:TreeNodeStyle Font-Bold="False" Font-Names="Verdana" Font-Underline="False"
                                                                            ForeColor="#676767" />
                                                                    </LevelStyles>
                                                                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                                                                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px"
                                                                        VerticalPadding="0px" />
                                                                    <Nodes>
                                                                        <asp:TreeNode Text="LogOut" Value="LogOut"></asp:TreeNode>
                                                                    </Nodes>
                                                                    <LeafNodeStyle Font-Bold="True" Font-Names="Verdana" ForeColor="#A70A0A" />
                                                                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px"
                                                                        VerticalPadding="5px" />
                                                                </asp:TreeView>
                                                                v</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr style="color: #000000; font-family: Times New Roman">
                                                <td align="left" bgcolor="#d8dfe9" style="font-size: 1pt; background-image: url(Images/Menu/menu_center.bmp);
                                                    width: 201px" valign="top">
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Menu/menu_bottom.bmp" /></td>
                                </tr>
                            </table>
                            <img src="Images/6.png" style="width: 202px; height: 191px" /><br />
                            <img src="Images/5.png" style="width: 201px; height: 175px" />
                        </ContentTemplate>
                     
                    </asp:UpdatePanel>
                &nbsp;
                <div>
                              
                   </div>
            </div>
           
         </div>
         
    </div>
    </form>
</body>
</html>

