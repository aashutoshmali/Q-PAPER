<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StaffMaster.aspx.vb" Inherits="StaffMaster" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Untitled Page</title>
        <script language="javascript" src="javascript/Alphabet.js" type="text/javascript"  ></script>   
    <script type="text/javascript" src="javascript/aktcal.js"></script>
     <link rel="stylesheet" type="text/css" href="javascript/akt_styles.css" />
    <script language="javascript" type="text/javascript">
 
  function DisplayDate()
 {
		open_cal  = new Epoch('cal','popup',document.getElementById('txtdate'));
		close_cal  = new Epoch('cal','popup',document.getElementById('txtdate'));
		
}

function DisplayDate1()
 {
		open_cal  = new Epoch('cal','popup',document.getElementById('txtdoj'));
		close_cal  = new Epoch('cal','popup',document.getElementById('txtdoj'));
		
}
   
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
    
    
    
   
   
   function chktype()
    {
     if(window.event.keyCode==13)
     {
       document.getElementById("txtdate").focus(); 
       window.event.keyCode=0;
     }

    }    
    
    function chkName()
    {
     if(window.event.keyCode==13)
     {
      var txtfname  = document.getElementById("txtfname").value; 
      if(txtfname=="")
      {
       alert("Enter User name");
       document.getElementById("txtfname").focus();
       window.event.keyCode=0;  
       return false;
      }
      else
      {
       document.getElementById("ddltype").focus(); 
       window.event.keyCode=0;
      } 
     }
     fnCharSpace();
    }
    
   
  
    function chkdate()
    {
     if(window.event.keyCode==13)
     {
       document.getElementById("txtdoj").focus(); 
       window.event.keyCode=0;
     }

    }   
    
    function chkdoj()
    {
     if(window.event.keyCode==13)
     {
       document.getElementById("ddlsex").focus(); 
       window.event.keyCode=0;
     }

    }     
  
      function chksex()
    {
     if(window.event.keyCode==13)
     {
       document.getElementById("txtblood").focus(); 
       window.event.keyCode=0;
     }

    }    
   
  
    function chkaddress()
    {
     if(window.event.keyCode==13)
     {
      var txtaddress  = document.getElementById("txtaddress").value; 
      if(txtaddress=="")
      {
       alert("Enter User Address");
       document.getElementById("txtaddress").focus();
       window.event.keyCode=0;  
       return false;
      }
      else
      {
       document.getElementById("txtmobile").focus(); 
       window.event.keyCode=0;
      } 
     }
    
    }  
   
    
   function chkmob()
    {
     if(window.event.keyCode==13)
     {
       document.getElementById("txtlandline").focus(); 
       window.event.keyCode=0;
     }

    }     
   
      
    
   function chkland()
    {
     if(window.event.keyCode==13)
     {
       document.getElementById("txtemail").focus(); 
       window.event.keyCode=0;
     }

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
    
    
    function chkUserId()
    {     
     if(window.event.keyCode==13)
     {
      var txtuserid = document.getElementById("txtuserid").value; 
      if(txtuserid=="")
      {
       alert("Enter User ID");
       document.getElementById("txtuserid").focus();  
       window.event.keyCode=0;  
       return false;
      }
      else
      { 
       document.getElementById("txtusername").focus(); 
       window.event.keyCode=0;
      }
     }
     fnUid(); 
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
      var txtfname = document.getElementById("txtfname").value; 
      if(txtfname=="")
      {
       alert("Enter Staff Name");
       document.getElementById("txtfname").focus();  
       return false;
      }


var txtdate  = document.getElementById("txtdate").value; 
      if(txtdate=="")
      {
       alert("Enter Staff Date of Birth");
       document.getElementById("txtdate").focus();
       return false;
      }

 var txtdoj  = document.getElementById("txtdoj").value; 
      if(txtdoj=="")
      {
       alert("Enter Staff Date of Joining");
       document.getElementById("txtdoj").focus();
       return false;
      }
      
      var txtaddress  = document.getElementById("txtaddress").value; 
      if(txtaddress=="")
      {
       alert("Enter Staff Address");
       document.getElementById("txtaddress").focus();
       return false;
      }
     
      
          
var txtmobile  = document.getElementById("txtmobile").value; 
      if(txtmobile=="")
      {
       alert("Enter Staff Mobile number");
       document.getElementById("txtmobile").focus();
       return false;
      }
      
      
      var txtemail = document.getElementById("txtemail").value;  
      if(txtemail!="")
      {
       var myemailfilter =  /^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/i
       var returnval = myemailfilter.test(txtemail)
       if (returnval == false)
	   {
	    alert("This is an invalid E-mail address. ");
	    return false;
	   }
      }     
      
     var txtuserid = document.getElementById("txtuserid").value; 
      if(txtuserid=="")
      {
       alert("Enter User ID");
       document.getElementById("txtuserid").focus();  
       return false;
      }

        

      var txtpassword  = document.getElementById("txtpassword").value;  
      if(txtpassword=="")
      {
       alert("Enter Password");
       document.getElementById("txtpassword").focus();
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
                                Text="Staff  Master" ForeColor="White"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none">
                            <table>
                                <tr>
                                    <td colspan="5" style="background-color: #f7f6f3; border-top-width: 1px; border-left-width: 1px; border-left-color: #507cd1; border-bottom-width: 1px; border-bottom-color: #507cd1; border-top-color: #507cd1; border-right-width: 1px; border-right-color: #507cd1;">
                            <table>
                                <tr>
                                
                                    <td  >
                                        <asp:Button ID="btnAddUser" runat="server"  Text="Add" OnClick="btnAddUser_Click" Width="48px" /></td>
                                    <td>
                                        <asp:Button ID="btnSaveuser"  runat="server"  TabIndex="15" OnClick="btnSaveuser_Click" 
                                            Text="Save" Visible="False" Width="48px" /></td>
                                    <td>
                                        <asp:Button ID="btnEdituser" runat="server"  TabIndex="16" OnClick="btnEdituser_Click"
                                            Text="Edit" Width="48px" /></td>
                                    <td style="background-color: #eff3fb;">
                                        <asp:Button ID="btnUpdateuser" runat="server"  TabIndex="17" OnClick="btnUpdateuser_Click"
                                            Text="Update" Visible="False" Width="48px" /></td>
                                    <td>
                                        <asp:Button ID="btnCanceluser" runat="server"  TabIndex="18" OnClick="btnCanceluser_Click"
                                            Text="Cancel" Visible="False" Width="48px" /></td>
                                    <td>
                                        <asp:Button ID="btndeleteuser" runat="server"  TabIndex="19" OnClick="btndeleteuser_Click "
                                            Text="Delete" Width="48px" /></td>
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
                                        <asp:Button ID="btnView" runat="server" OnClick="btnView_Click" Text="Back" /></td>
                                </tr>
                            </table>
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
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Full name"
                                            Width="120px"></asp:Label></td>
                                    <td colspan="4">
                                        <asp:TextBox ID="txtfname" runat="server" Font-Names="Verdana" Font-Size="10pt" Height="16px"
                                            MaxLength="200" TabIndex="1" Width="468px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Designation"
                                            Width="120px"></asp:Label></td>
                                    <td colspan="4">
                                        <asp:DropDownList ID="ddltype" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                            TabIndex="5" Width="205px">
                                            <asp:ListItem>LECTURER</asp:ListItem>
                                            <asp:ListItem>HOD</asp:ListItem>
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="DOB"
                                            Width="60px"></asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="txtdate" runat="server" Font-Names="Verdana" Font-Size="10pt" Height="16px"
                                            MaxLength="30" TabIndex="2" Width="200px"></asp:TextBox></td>
                                    <td style="height: 30px">
                                        </td>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Date Of Joining"
                                            Width="120px"></asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="txtdoj" runat="server" Font-Names="Verdana" Font-Size="10pt" Height="16px"
                                            MaxLength="30" TabIndex="2" Width="200px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Sex"
                                            Width="120px"></asp:Label></td>
                                    <td><asp:DropDownList ID="ddlsex" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                            TabIndex="5" Width="205px">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList></td>
                                    <td style="height: 30px">
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Blood Groop"
                                            Width="120px"></asp:Label></td>
                                    <td align="right">
                                        <asp:TextBox ID="txtblood" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                            Height="16px" MaxLength="20" TabIndex="1" Width="200px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Address"
                                            Width="128px"></asp:Label></td>
                                    <td align="left" colspan="4">
                                        <asp:TextBox ID="txtaddress" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                            Height="40px" MaxLength="50" TabIndex="11" TextMode="MultiLine" Width="466px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="5" rowspan="3">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblmob" runat="server" Font-Names="Verdana" Font-Size="9.5pt" Text="Mobile No."
                                                        Width="120px"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="txtmobile" runat="server" Font-Names="Verdana" Font-Size="9.5pt"
                                                        Height="16px" MaxLength="50" TabIndex="28" Width="200px"></asp:TextBox></td>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblph2" runat="server" Font-Names="Verdana" Font-Size="9.5pt" Text="Direct Landline No."
                                                        Width="128px"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="txtlandline" runat="server" Font-Names="Verdana" Font-Size="9.5pt"
                                                        Height="16px" MaxLength="50" TabIndex="27" Width="200px"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td style="height: 26px">
                                        <asp:Label ID="Label11" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Email Id"
                                            Width="60px"></asp:Label></td>
                                                <td colspan="3" style="height: 26px">
                                                    <asp:TextBox ID="txtemail" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                            Height="16px" MaxLength="50" TabIndex="11" Width="337px"></asp:TextBox></td>
                                                <td>
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 26px">
                                                    <asp:Label ID="Label8" runat="server" Font-Names="Verdana" Font-Size="9.5pt" Text="Bus Point"
                                                        Width="128px"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="txtbus" runat="server" Font-Names="Verdana" Font-Size="10pt" Height="16px"
                                                        MaxLength="50" TabIndex="11" Width="200px"></asp:TextBox></td>
                                                <td>
                                                </td>
                                                <td style="height: 26px">
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 26px">
                                        <asp:Label ID="Label12" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="UID"
                                            Width="120px"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="txtuserid" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                                        Height="16px" MaxLength="20" TabIndex="1" Width="160px"></asp:TextBox></td>
                                                <td>
                                                </td>
                                                <td style="height: 26px">
                                                    <asp:Label ID="Label13" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Password"
                                                        Width="120px"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="txtpassword" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                                        Height="16px" MaxLength="12" TabIndex="3" Width="160px"></asp:TextBox></td>
                                            </tr>
                                        </table>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                            </table>
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
                &nbsp;
              
                <asp:HiddenField ID="hdnNewPassword" runat="server" />
                
                <table id="tblSub" runat="server" align="center" style="border-right: #507cd1 1px solid;
                    border-top: #507cd1 1px solid; border-left: #507cd1 1px solid; border-bottom: #507cd1 1px solid; width: 600px;"
                    visible="false">
                    <tr>
                        <td align="center" bgcolor="#b0c4de" style="width: 850px; height: 18px; background-color: #507cd1;">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="11pt"
                                ForeColor="White" Text="Staff  Master"></asp:Label></td>
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
                                    <asp:TemplateField HeaderText="keycode" SortExpression="keycode" Visible="false"  >
                                        <ItemTemplate>
                                            <asp:Label ID="EID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"eid")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FullName" SortExpression="FullName" >
                                        <ItemTemplate>
                                            <asp:Label ID="FullName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"FullName")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Designation" SortExpression="Designation" >
                                        <ItemTemplate>
                                            <asp:Label ID="Designation" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Designation")  %>'></asp:Label>
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
