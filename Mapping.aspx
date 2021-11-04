<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Mapping.aspx.vb" Inherits="Mapping" ValidateRequest="false" EnableEventValidation="false" %>

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
    function chksubject()
    {     
     if(window.event.keyCode==13)
     {
      var txtsubject = document.getElementById("txtsubject").value; 
      if(txtsubject=="")
      {
       alert("Enter Subject Name");
       document.getElementById("txtsubject").focus();  
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
      var txtsubject = document.getElementById("txtsubject").value; 
     if(txtsubject=="")
      {
       alert("Enter Subject Name");
       document.getElementById("txtsubject").focus();  
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
                                Text="Subject Teacher Mapping" ForeColor="White"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none">
                            <table>
                                <tr>
                                    <td colspan="5" style="background-color: #f7f6f3; border-top-width: 1px; border-left-width: 1px; border-left-color: #507cd1; border-bottom-width: 1px; border-bottom-color: #507cd1; border-top-color: #507cd1; border-right-width: 1px; border-right-color: #507cd1;">
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
                                        <asp:Label ID="Label7" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Subject"
                                            Width="128px"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ID="ddlsubject" runat="server" AutoPostBack="True" Font-Names="Verdana"
                                            Font-Size="10pt"  TabIndex="5"
                                            Width="166px" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged">
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
                                        </td>
                                    <td>
                                        </td>
                                    <td style="height: 30px">
                                    </td>
                                    <td>
                                        </td>
                                    <td align="right">
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td style="height: 30px">
                                    </td>
                                    <td>
                                    </td>
                                    <td align="right">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;<asp:GridView ID="gvFind" runat="server" AllowPaging="True" AllowSorting="True"
                                            AutoGenerateColumns="False" CellPadding="4" Font-Names="Verdana" Font-Size="10pt"
                                            ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvFind_SelectedIndexChanged"
                                            Width="100%">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" />
                                                <asp:TemplateField HeaderText="keycode" SortExpression="keycode" Visible="false" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="EID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"eid")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="FullName" SortExpression="FullName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="FullName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"FullName")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Designation" SortExpression="Designation">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Designation" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Designation")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               
                                            </Columns>
                                            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                            <EditRowStyle BackColor="#2461BF" />
                                            <AlternatingRowStyle BackColor="White" />
                                        </asp:GridView>
                                    </td>
                                    <td style="height: 30px">
                                    </td>
                                    <td>
                                    </td>
                                    <td align="right">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                    </td>
                                    <td style="height: 30px">
                                    </td>
                                    <td>
                                    </td>
                                    <td align="right">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                                            AutoGenerateColumns="False" CellPadding="4" Font-Names="Verdana" Font-Size="10pt"
                                            ForeColor="#333333" GridLines="None" 
                                            Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <Columns>
                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Remove</asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="keycode" SortExpression="keycode" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="EID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"eid")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="FullName" SortExpression="FullName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="FullName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"FullName")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Designation" SortExpression="Designation">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Designation" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Designation")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                            <EditRowStyle BackColor="#2461BF" />
                                            <AlternatingRowStyle BackColor="White" />
                                        </asp:GridView>
                                    </td>
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
            </ContentTemplate>
             
        </asp:UpdatePanel>
        <br />
                            <br />
    
    </div>
        <br />
    </form>
</body>
</html>
