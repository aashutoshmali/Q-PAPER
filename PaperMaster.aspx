<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PaperMaster.aspx.vb" Inherits="PaperMaster" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Untitled Page</title>
        <script language="javascript" src="javascript/Alphabet.js" type="text/javascript"  ></script>   
    <script language="javascript" type="text/javascript">
  
   
    function setsearch() 
     {

     if(window.event.keyCode==13)
      {
     var s=document.getElementById("txtSearch").value;
 
      if(s=="")
        { 
        document.getElementById("txtSearch").focus();
        window.event.keyCode=0;
        }
     if(s!="")
        { 
        document.getElementById("drpCriteria").focus();
        window.event.keyCode=0;
        return true;
        }
       }
        // fnUid(); 
        fnsingleUid();
     }
     
     function setdrpcriteria()
     {
     if(window.event.keyCode==13)
      {
      document.getElementById("lstCol").focus();
      window.event.keyCode=0;
      }
     } 
     
     function setlstcol()
     {
     if(window.event.keyCode==13)
      {
      document.getElementById("btnGo").focus();
      window.event.keyCode=0;
      }
     } 
        
       
    
       function setset() 
     {
 
     if(window.event.keyCode==13)
      {
    var s=document.getElementById("txtPageNo").value;
 
     if(s!="")
        { 
        document.getElementById("btnSet").focus();
        window.event.keyCode=0;
        return true;
         }
         }
         fnInt(); 
     }
   


//----------------------------------------------------------------
    function chkpaper()
    {     
     if(window.event.keyCode==13)
     {
      var txtpaper = document.getElementById("txtpaper").value; 
      if(txtpaper=="")
      {
       alert("Enter Paper Name");
       document.getElementById("txtpaper").focus();  
       window.event.keyCode=0;  
       return false;
      }
      else
	   {
        var s=document.getElementById("btnSaveuser");
        var u=document.getElementById("btnUpdateuser"); 
        if(s!=null)
        {
         document.getElementById("btnSaveuser").focus();
        }
        else if(u!=null)
        {
         document.getElementById("btnUpdateuser").focus();
        }
        window.event.keyCode=0;
	   }
     }
     fnUid(); 
    }
    
    function chkUserName()
    {
     if(window.event.keyCode==13)
     {
      var txtusername  = document.getElementById("txtusername").value; 
      if(txtusername=="")
      {
       alert("Enter Username");
       document.getElementById("txtusername").focus();
       window.event.keyCode=0;  
       return false;
      }
      else
      {
       document.getElementById("txtpassword").focus(); 
       window.event.keyCode=0;
      } 
     }
     fnCharSpace();
    }
    
    function chkPassword()
    {
     if(window.event.keyCode==13)
     {
      var txtpassword  = document.getElementById("txtpassword").value;  
      if(txtpassword=="")
      {
       alert("Enter Password");
       document.getElementById("txtpassword").focus();
       window.event.keyCode=0;  
       return false;
      }
      else
      { 
       document.getElementById("txtrpassword").focus(); 
       window.event.keyCode=0;
      }
     }
    }
    
    function chkRepeatPassword()
    {
     if(window.event.keyCode==13)
     {
      var txtpassword  = document.getElementById("txtpassword").value;  
      var txtrpassword = document.getElementById("txtrpassword").value; 
      if(txtrpassword=="")
      {
       alert("Re-enter Password");
       document.getElementById("txtrpassword").focus();
       window.event.keyCode=0;  
       return false;
      }
      else if(txtrpassword!=txtpassword)
      {
       alert("Repeat Password is not correct");
       document.getElementById("txtrpassword").focus();
       var txtpassword  = document.getElementById("txtpassword").value;  
       window.event.keyCode=0;
       return false;
      }
      else
      {
       document.getElementById("ddlRole").focus(); 
       window.event.keyCode=0;
      }
     }
    }
    
    function chkRole()
    {
     if(window.event.keyCode==13)
     {
      var ddlRole = document.getElementById("ddlRole").value;  
      if(ddlRole=="")
      {
       alert("Select Role");
       document.getElementById("ddlRole").focus();
       window.event.keyCode=0;  
       return false;
      }
      else
      {
       document.getElementById("txtemail").focus();
       window.event.keyCode=0;
      }
     }
    } 
     
   function chkRoleOnChange()
    { 
     document.getElementById("ddlRole").focus();  
    }
    
    function chkEmail()
    {
     if(window.event.keyCode==13)
     {
      var txtemail = document.getElementById("txtemail").value;  
      if(txtemail!="")
      {
       var myemailfilter =  /^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/i
       var returnval = myemailfilter.test(txtemail)
       if (returnval == false)
	   {
	    alert("This is an invalid E-mail address. ");
        window.event.keyCode=0;  
	    return false;
	   }
	   else
	   {
        var s=document.getElementById("btnSaveuser");
        var u=document.getElementById("btnUpdateuser"); 
        if(s!=null)
        {
         document.getElementById("btnSaveuser").focus();
        }
        else if(u!=null)
        {
         document.getElementById("btnUpdateuser").focus();
        }
        window.event.keyCode=0;
	   }
      }    
      else
      { 
        var s=document.getElementById("btnSaveuser");
        var u=document.getElementById("btnUpdateuser"); 
        if(s!=null)
        {
         document.getElementById("btnSaveuser").focus();
        }
        else if(u!=null)
        {
         document.getElementById("btnUpdateuser").focus();
        }
        window.event.keyCode=0;
      }
     }
     fnMySpace();
    }
    
    function gridDel()
     {
      var answer = confirm("Do you want to Delete?");
      if (answer)
      {
       document.forms[0]['hdnDelConfirm'].value = "True";
       return true;
      }
      else
      {
      document.forms[0]['hdnDelConfirm'].value = "False"
       return false;
      }
     }
    //--------------------------------------------------------------------------------------------------
     function chkAll()
     {
      var txtpaper = document.getElementById("txtpaper").value; 
     if(txtpaper=="")
      {
       alert("Enter Paper Name");
       document.getElementById("txtpaper").focus();  
       return false;
      }

    
      }     
      
       
        
  
     //--------------------------------------------------------------------------------------------------
     
           function fnsingleUid()
{
  if( !(fnAlphaNumericSpace4( window.event.keyCode, "txtFilename")))
  {
	fnDoNothing();	
  }
}
function fnAlphaNumericSpace4( chr, obj )
{
 if( fnSpace( chr, obj ) || fnAlpha( chr, obj ) || fnSingle( chr, obj ) && (fnSemicolon( chr, obj ) || fnNumeric(chr,obj)))
 { 
  return true; 
 }
 return false; 
}

function fnSingle( chr, obj )

{

 if(parseInt(chr) == 59 )
 {
  return false;
 }
 return true;
}		
function fnSemicolon( chr, obj )
{

 if(parseInt(chr)==39)
 {
  return false;
 }
 return true;
}
 
 //--------------------------------------------------
      
   </script>    
</head>
<body >
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table align ="center"   border="1" bordercolor="#507cd1" id="tblMain" runat="server" style="background-color: #eff3fb;">
                    <tr>
                        <td align="center" style="background-color: #507cd1; border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none; height: 20px;">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="11pt"
                                Text="Paper Master" ForeColor="White"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none">
                            <table>
                                <tr>
                                    <td colspan="5" style="background-color: #f7f6f3; border-top-width: 1px; border-left-width: 1px; border-left-color: #507cd1; border-bottom-width: 1px; border-bottom-color: #507cd1; border-top-color: #507cd1; border-right-width: 1px; border-right-color: #507cd1;">
                            <table>
                                <tr>
                                
                                    <td  >
                                        <asp:Button ID="btnAddUser" runat="server"  Text="Add" OnClick="btnAddUser_Click" Width="56px" Height="20px" /></td>
                                    <td>
                                        <asp:Button ID="btnSaveuser"  runat="server"  TabIndex="15" OnClick="btnSaveuser_Click" 
                                            Text="Save" Visible="False" Width="56px" Height="20px" /></td>
                                    <td>
                                        <asp:Button ID="btnEdituser" runat="server"  TabIndex="16" OnClick="btnEdituser_Click"
                                            Text="Edit" Width="56px" Height="20px" /></td>
                                    <td style="background-color: #eff3fb;">
                                        <asp:Button ID="btnUpdateuser" runat="server"  TabIndex="17" OnClick="btnUpdateuser_Click"
                                            Text="Update" Visible="False" Width="56px" Height="20px" /></td>
                                    <td>
                                        <asp:Button ID="btnCanceluser" runat="server"  TabIndex="18" OnClick="btnCanceluser_Click"
                                            Text="Cancel" Visible="False" Width="56px" Height="20px" /></td>
                                    <td>
                                        <asp:Button ID="btndeleteuser" runat="server"  TabIndex="19" OnClick="btndeleteuser_Click "
                                            Text="Delete" Width="56px" Height="20px" /></td>
                                    <td>
                            </td>
                                    <td>
                                        <asp:Button ID="btnfirst" runat="server"  TabIndex="20" Text="|<<" OnClick="btnfirst_Click"
                                            Width="32px" /></td>
                                    <td>
                                        <asp:Button ID="btnprevious" runat="server"  TabIndex="21" OnClick="btnprevious_Click"
                                            Text="<<" Width="32px" /></td>
                                    <td>
                                        <asp:Button ID="btnnext" runat="server"  TabIndex="22" Text=">>" OnClick="btnnext_Click"
                                            Width="32px" /></td>
                                    <td>
                                        <asp:Button ID="btnlast" runat="server"  TabIndex="23" Text=">>|" OnClick="btnlast_Click"
                                            Width="32px" /></td>
                                    <td style="width: 3px">
                                        <asp:Button ID="btnView" runat="server" OnClick="btnView_Click" Text="Back" Height="20px" Width="53px" /></td>
                                </tr>
                            </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Department"
                                            Width="120px"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ID="ddldept" runat="server" Font-Names="Verdana" 
                                            Font-Size="10pt"  TabIndex="5"
                                            Width="166px" OnSelectedIndexChanged="ddldept_SelectedIndexChanged" AutoPostBack="True">
                                            <asp:ListItem>CO</asp:ListItem>
                                            <asp:ListItem>IF</asp:ListItem>
                                            <asp:ListItem>CIVIL</asp:ListItem>
                                            <asp:ListItem>MECH</asp:ListItem>
                                            <asp:ListItem>ETC</asp:ListItem>
                                            <asp:ListItem>EE</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="height: 30px">
                                        </td>
                                    <td>
                                        </td>
                                    <td>
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Subject"
                                            Width="120px"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ID="ddlsubject" runat="server" AutoPostBack="True" Font-Names="Verdana"
                                            Font-Size="10pt" TabIndex="5" Width="166px" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged">
                                        </asp:DropDownList></td>
                                    <td style="height: 30px">
                                    </td>
                                    <td>
                                        </td>
                                    <td align="right">
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Paper Name"
                                            Width="120px"></asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="txtpaper" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                            Height="16px" MaxLength="12" TabIndex="3" Width="160px"></asp:TextBox></td>
                                    <td style="height: 30px">
                                    </td>
                                    <td>
                                    </td>
                                    <td align="right">
                                    </td>
                                </tr>
                            </table>
                        </td>
                                </tr>
                            </table>
                <asp:HiddenField ID="hdnUserKey" runat="server" />
                <asp:HiddenField ID="hdnUDE" runat="server" />
                <asp:HiddenField ID="hdnOldSalt" runat="server" />
                <asp:HiddenField ID="hdnselect" runat="server" />
                <asp:HiddenField ID="hdnOldPassword" runat="server" />
                <asp:HiddenField ID="hdnPreferPassword" runat="server" />
              
                <asp:HiddenField ID="hdnNewPassword" runat="server" />
                
                <table id="tblSub" runat="server" align="center" style="border-right: #507cd1 1px solid;
                    border-top: #507cd1 1px solid; border-left: #507cd1 1px solid; border-bottom: #507cd1 1px solid; width: 600px;"
                    visible="false">
                    <tr>
                        <td align="center" bgcolor="#b0c4de" style="width: 850px; height: 18px; background-color: #507cd1;">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="11pt"
                                ForeColor="White" Text="Paper Master"></asp:Label></td>
                    </tr>
                    <tr>
                        <td bgcolor="#eff3fb" colspan="7" rowspan="1" style="background-color: #f7f6f3; font-size: 1pt;" align="left">
                                        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" TabIndex="4" Text="Add New"
                                            Width="88px" />
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#eff3fb" colspan="7" rowspan="3">
                            <asp:GridView ID="gvFind" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                CellPadding="4" Font-Names="Verdana" Font-Size="10pt"
                                Width="100%" OnSelectedIndexChanged="gvFind_SelectedIndexChanged" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:TemplateField HeaderText="keycode" SortExpression="keycode" visible="false" >
                                        <ItemTemplate>
                                            <asp:Label ID="keycode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"keycode")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                    <asp:TemplateField HeaderText="Paper" SortExpression="Paper" >
                                        <ItemTemplate>
                                            <asp:Label ID="Paper" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Paper")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                    
                                    
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="Btndelete" runat="server" OnClientClick="if(!confirm('Do you want to Delete?')){return false;}"
                                                                OnCommand="btnDelete_Command">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                </Columns>
                                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                    </tr>
                </table>
            </ContentTemplate>
             
        </asp:UpdatePanel>
        <br />
                            <br />
    
    </div>
        <br />
    </form>
</body>
</html>
