<%@ Page Language="VB" AutoEventWireup="false" CodeFile="QMaster.aspx.vb" Inherits="QMaster" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Untitled Page</title>
           <script language="javascript" type ="text/jscript" src="javascript/Alphabet.js" >
    </script>
     <script language="javascript" src="javascript/color_conv.js" type="text/javascript"></script> 
      <link rel="stylesheet" type="text/css" href="javascript/akt_styles.css" />
    <script type="text/javascript" src="javascript/aktcal.js"></script>
   <script type="text/javascript">
	     var open_cal,close_cal,as_cal,ac_cal; 
window.onload = function () {
		open_cal  = new Epoch('cal','popup',document.getElementById('txtdate'));
		close_cal  = new Epoch('cal','popup',document.getElementById('txtdate'));
		

};
  
   function DisplayDate() {
		open_cal  = new Epoch('cal','popup',document.getElementById('txtdate'));
		close_cal  = new Epoch('cal','popup',document.getElementById('txtdate'));
		
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
    function chkdate()
    {     
     if(window.event.keyCode==13)
     {
      var txtdate = document.getElementById("txtdate").value; 
      if(txtdate=="")
      {
       alert("Enter Date");
       document.getElementById("txtdate").focus();  
       window.event.keyCode=0;  
       return false;
      }
      else
      { 
       document.getElementById("ddlsubject").focus(); 
       window.event.keyCode=0;
      }
     }
     }
    
    function chktitle()
    {
     if(window.event.keyCode==13)
     {
      var txttitle  = document.getElementById("txttitle").value; 
      if(txttitle=="")
      {
       alert("Enter Title");
       document.getElementById("txttitle").focus();
       window.event.keyCode=0;  
       return false;
      }
      else
      {
       document.getElementById("txtpublisher").focus(); 
       window.event.keyCode=0;
      } 
     }
     fnCharSpace();
    }
    
         function chkpub()
    {
     if(window.event.keyCode==13)
     {
       document.getElementById("txtpage").focus(); 
       window.event.keyCode=0;
   
     }
     fnCharSpace();
    }
   
    function chkdept()
    {
     if(window.event.keyCode==13)
     {
       document.getElementById("txtdate").focus(); 
       window.event.keyCode=0;
     }

    }   
   
   function chksub()
    {
     if(window.event.keyCode==13)
     {
       document.getElementById("ddlmaterial").focus(); 
       window.event.keyCode=0;
     }

    }     
     function chkmaterial()
    {
     if(window.event.keyCode==13)
     {
       document.getElementById("txttitle").focus(); 
       window.event.keyCode=0;
     }

    }      
   function chkpage()
    {
     if(window.event.keyCode==13)
     {
       document.getElementById("txtcost").focus(); 
       window.event.keyCode=0;
   
     }
     fnInt();
    }  
  
   function chkcost()
    {
     if(window.event.keyCode==13)
     {
       document.getElementById("txtauthor").focus(); 
       window.event.keyCode=0;
   
     }
     
      fnInt();
    }  
   
  function chkauthor()
    {
     if(window.event.keyCode==13)
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
     
     fnCharSpace();
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
      var txttitle = document.getElementById("txttitle").value; 
      if(txttitle=="")
      {
       alert("Enter Question");
       document.getElementById("txttitle").focus();  
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
                                Text="Question Master" ForeColor="White"></asp:Label></td>
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
                                        <asp:Label ID="Label2" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Department"
                                            Width="120px"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ID="ddldept" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                            TabIndex="5" Width="166px" AutoPostBack="True" OnSelectedIndexChanged="ddldept_SelectedIndexChanged">
                                            <asp:ListItem>CO</asp:ListItem>
                                            <asp:ListItem>IF</asp:ListItem>
                                            <asp:ListItem>CIVIL</asp:ListItem>
                                            <asp:ListItem>MECH</asp:ListItem>
                                            <asp:ListItem>ETC</asp:ListItem>
                                            <asp:ListItem>EE</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td >
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
                                        <asp:DropDownList ID="ddlsubject" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                            TabIndex="5" Width="166px" AutoPostBack="True" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged">
                                        </asp:DropDownList></td>
                                    <td >
                                    </td>
                                    <td>
                                        </td>
                                    <td>
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Paper"
                                            Width="128px"></asp:Label></td>
                                    <td align="left" colspan="4">
                                        <asp:DropDownList ID="ddlpaper" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                            TabIndex="5" Width="166px" AutoPostBack="True" OnSelectedIndexChanged="ddlpaper_SelectedIndexChanged" >
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Question"
                                            Width="120px"></asp:Label></td>
                                    <td align="left" colspan="4">
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td align="left" colspan="4">
                                    </td>
                                </tr>
                            </table>
                                        <asp:TextBox ID="txttitle" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                            Height="50px" MaxLength="12" TabIndex="3" Width="521px" TextMode="MultiLine"></asp:TextBox></td>
                                </tr>
                    <tr>
                        <td style="border-top-style: none; border-right-style: none; border-left-style: none;
                            border-bottom-style: none">
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
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="11pt"
                                ForeColor="White" Text="Question Master"></asp:Label></td>
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
                                    <asp:TemplateField HeaderText="keycode" SortExpression="keycode" >
                                        <ItemTemplate>
                                            <asp:Label ID="keycode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"keycode")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Subject" SortExpression="Subject" >
                                        <ItemTemplate>
                                            <asp:Label ID="Subject" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Subject")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                            
                                    
                                   
                                    <asp:TemplateField HeaderText="Department" SortExpression="Dept" >
                                        <ItemTemplate>
                                            <asp:Label ID="Department" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Dept")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Question" SortExpression="Question"  >
                                        <ItemTemplate>
                                            <asp:Label ID="Question" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Question")  %>'></asp:Label>
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
