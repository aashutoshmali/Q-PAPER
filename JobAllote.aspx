<%@ Page Language="VB" AutoEventWireup="false" CodeFile="JobAllote.aspx.vb" Inherits="JobAllote" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    
   
     <script type ="text/javascript" language="javascript" src="javascript/Alphabet.js"></script>  
      <script type="text/javascript" src="javascript/aktcal.js"></script>
     <link rel="stylesheet" type="text/css" href="javascript/akt_styles.css" />
      
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
     
//--------------------------------------------------------


 function DisplayDate()
 {
		open_cal  = new Epoch('cal','popup',document.getElementById('txtdate'));
		close_cal  = new Epoch('cal','popup',document.getElementById('txtdate'));
		
}

    function chkdate()
    {
     if(window.event.keyCode==13)
     {
       document.getElementById("txtdoj").focus(); 
       window.event.keyCode=0;
     }
    } 
    
    

     
    function chkUserName()
    {  
 
     if(window.event.keyCode==13)
     {
      var txtuserid = document.getElementById("txtcategory").value; 
       txtuserid=txtuserid.replace(/^\s+|\s+$/g,'');

      if(txtuserid=="")
      {
       alert("Enter Category Name");
       document.getElementById("txtcategory").focus();  
       window.event.keyCode=0;  
       return false;
      }
     
     }
     fnCharSpace(); 
    }
    
   
   
    
  

    function chkAll()
    {
     
      
      var txtusername = document.getElementById("txtcategory").value; 
      if(txtusername=="")
      {
       alert("Enter Category Name");
       document.getElementById("txtcategory").focus();  
       window.event.keyCode=0;  
       return false;
      }    
     
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
    
   
      //--------------------------------------------------   
   
//--------------------------------------------------   
   
   
function fnSemicolon2( chr, obj )
{

 if(parseInt(chr)==39)
 {
  return true;
 }
 return true;
}

   
    function setCategory()
   {     
        if(window.event.keyCode==13)
        {
       
        var txtusername = document.getElementById("txtcategory").value; 
         txtusername=txtusername.replace(/^\s+|\s+$/g,'');

      if(txtusername=="")
      {
       alert("Enter Category Name");
       document.getElementById("txtcategory").focus();  
       window.event.keyCode=0;  
       return false;
      }
        
            document.getElementById("txtadd1").focus(); 
            window.event.keyCode=0;
        }
       fnCharSpace(); 
      
   }      
   function setmobile()
   {     
        if(window.event.keyCode==13)
        {
            var s =document.getElementById("btnsaveuser");
            var u= document.getElementById("btnupdateuser");
            if(s!=null)
            { 
                document.getElementById("btnsaveuser").focus(); 
                window.event.keyCode=0;
            }
            if(u!=null)
            { 
                document.getElementById("btnupdateuser").focus(); 
                window.event.keyCode=0;
            }
        }
        fnInt(); 
   }      
//--------------------------------------------------   
    function save()
     {
   //    var c=document.getElementById('txtpayble').value;
//        var c1=document.getElementById('txtid').value;
    //c2=document.getElementById('txtusername').value;
           // var c1=document.getElementById('txtpin').value;
            //var c2=document.getElementById('txtphoneoff').value;
            //var c3=document.getElementById('txtfax').value;
            //var c4=document.getElementById('txtcontactper').value; 
           // var c5=document.getElementById('txtphoneres').value;
     
    //   var c6=document.getElementById('txtmobile').value;
     
        var txtusername = document.getElementById("txtcategory").value; 
      if(txtusername=="")
      {
       alert("Enter Category Name");
       document.getElementById("txtcategory").focus();  
       window.event.keyCode=0;  
       return false;
      }    
      
                   var s =document.getElementById("btnsaveuser");
                var u= document.getElementById("btnupdateuser");
            if(s!=null)
            { 
                document.getElementById("btnsaveuser").focus(); 
                window.event.keyCode=0;
            }
            if(u!=null)
            { 
                document.getElementById("btnupdateuser").focus(); 
                window.event.keyCode=0;
            }
     
     }
   

     //-----------------------------------
     function savermaster()
     {
    
     
        var c=document.getElementById('txtcategory').value;
         c=c.replace(/^\s+|\s+$/g,'');

       // var c3=document.getElementById('txtpin').value;
        // c3=c3.replace(/^\s+|\s+$/g,'');

        //var c4=document.getElementById('txtphoneres').value;
         //c4=c4.replace(/^\s+|\s+$/g,'');

       // var c5=document.getElementById('txtfax').value;
        // c5=c5.replace(/^\s+|\s+$/g,'');

        //var c6=document.getElementById('txtcontactper').value;
         //c6=c6.replace(/^\s+|\s+$/g,'');

        //var c7=document.getElementById('txtphoneoff').value;
         //c7=c7.replace(/^\s+|\s+$/g,'');

        //var c8=document.getElementById('txtmobile').value;
         //c8=c8.replace(/^\s+|\s+$/g,'');

     
        if(c=="")
            {
                alert("Enter Category Name");
                document.getElementById('txtcategory').focus();
                window.event.keyCode=0;
                return false;
            } 
         
        
           
        
//           if(c6!="")
//        {
//            if(c6.length<10)
//                {
//                    alert("Contact Number could not be less than 10 digit");
//                    document.getElementById('txtcontactper').focus(); 
//                    window.event.keyCode=0;
//                    return false;
//                }
//        }
//        if(parseInt(c6)==0)
//        {
//                alert("Contact Number Can't be zero");
//                  document.getElementById('txtcontactper').focus(); 
//                window.event.keyCode=0;
//                return false;
//        }  
        
 //         if(c7!="")
  //      {
    //     if(c7.length<10)
      //      {
        //        alert("Direct Landline Number could not be less than 10 digit");
          //      document.getElementById('txtphoneoff').focus(); 
       //         window.event.keyCode=0;
        //        return false;
        //    }
       // }
       
     
       
       
       //change remain..
          
            
     
      
             var s =document.getElementById("btnsaveuser");
                var u= document.getElementById("btnupdateuser");
            if(s!=null)
            { 
                document.getElementById("btnsaveuser").focus(); 
                window.event.keyCode=0;
            }
            if(u!=null)
            { 
                document.getElementById("btnupdateuser").focus(); 
                window.event.keyCode=0;
            }
   }
   
   //-------------------------------------------------------
   
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
 
 
 function  dele()

 {

var q=document.getElementById("hdnbtnper").value; 
if (q=="1")
{

return false;
}
else
{

if(!confirm('Do you want to Delete?'))
    {
        return false;
    } 

}

}  
  
      
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
           <table align="center">
            <tr>
                <td>
                <table border="1" bordercolor="#000000" id="tblMain" runat="server" style="border-right: #507cd1 1px solid; border-top: #507cd1 1px solid; border-left: #507cd1 1px solid; border-bottom: #507cd1 1px solid" width="100%">
                    <tr>
                        <td align="center" style="background-color: #507cd1;  border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none; height: 20px;">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="11pt"
                                ForeColor="White" Text="Job Allotment" Width="368px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-size: 1pt;  background-color: #f7f6f3; border-top-style: none; border-right-style: none; border-left-style: none;  border-bottom-style: none; height: 36px;">
                            <table>
                                <tr>
                                    <td >
                            <asp:Button ID="btnAddUser" runat="server" OnClick="btnAddUser_Click" Text="Add"
                                Width="48px" /></td>
                                    <td >
                            <asp:Button ID="btnSaveuser" runat="server" OnClick="btnSaveuser_Click" TabIndex="15"
                                Text="Save" Visible="False" Width="48px" /></td>
                                    <td >
                            <asp:Button ID="btnEdituser" runat="server" OnClick="btnEdituser_Click" TabIndex="16"
                                Text="Edit" Width="48px" /></td>
                                    <td >
                            <asp:Button ID="btnUpdateuser" runat="server" OnClick="btnUpdateuser_Click" TabIndex="17"
                                Text="Update" Visible="False" Width="48px" /></td>
                                    <td >
                            <asp:Button ID="btnCanceluser" runat="server" OnClick="btnCanceluser_Click" TabIndex="18"
                                Text="Cancel" Visible="False" Width="48px" /></td>
                                    <td >
                            <asp:Button ID="btndeleteuser" runat="server" OnClick="btndeleteuser_Click" TabIndex="19"
                                Text="Delete" Width="48px" OnClientClick="return gridDel()"/></td>
                                    <td >
                            <asp:Button ID="btnfirst" runat="server" OnClick="btnfirst_Click" TabIndex="20" Text="|<<"
                                Width="32px" /></td>
                                    <td >
                            <asp:Button ID="btnprevious" runat="server" OnClick="btnprevious_Click" TabIndex="21"
                                Text="<<" Width="32px" /></td>
                                    <td >
                            <asp:Button ID="btnnext" runat="server" OnClick="btnnext_Click" TabIndex="22" Text=">>"
                                Width="32px" /></td>
                                    <td >
                            <asp:Button ID="btnlast" runat="server" OnClick="btnlast_Click" TabIndex="23" Text=">>|"
                                Width="32px" /></td>
                                    <td ><asp:Button ID="btnview" runat="server"  TabIndex="19"
                                Text="View" Width="48px" OnClick="btnview_Click"/></td>
                                    <td>
                                        </td>
                                </tr>
                                <tr>
                                    <td colspan="12" style="height: 4px">
                                        </td>
                                </tr>
                            </table>
                           </td>
                    </tr>
                    <tr>
                        <td style="background-color: #eff3fb;   border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;" align="center">
              <table>
                  <tr>
                      <td align="left">
                          <asp:Label ID="Label7" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Staff"
                              Width="152px"></asp:Label></td>
                      <td align="left">
                          <asp:DropDownList ID="ddlemp" runat="server" Width="160px">
                          </asp:DropDownList></td>
                      <td>
                      </td>
                  </tr>
                    <tr>
                        <td align="left" >
                            <asp:Label ID="Label1" runat="server" Text="TASK" Width="152px" Font-Names="Verdana" Font-Size="10pt"></asp:Label></td>
                        <td align="left" >
                            <asp:TextBox ID="txtuserid" runat="server" Width="344px" Font-Names="Verdana" MaxLength="50" Height="88px" TextMode="MultiLine"></asp:TextBox></td>
                        <td ></td>
                    </tr>
                  <tr>
                      <td align="left">
                          <asp:Label ID="Label2" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Date"
                              Width="152px"></asp:Label></td>
                      <td align="left">
                          <asp:Label ID="Label6" runat="server" Font-Names="Verdana" Font-Size="10pt" Width="152px" Font-Bold="True"></asp:Label></td>
                      <td>
                      </td>
                  </tr>
                  <tr>
                      <td align="left" style="height: 21px">
                          <asp:Label ID="Label8" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Deadline"
                              Width="152px"></asp:Label></td>
                      <td style="height: 21px" align="left">
                          <asp:TextBox ID="txtdate" runat="server" Font-Names="Verdana" Font-Size="10pt" Height="16px"
                              MaxLength="30" TabIndex="2" Width="152px"></asp:TextBox></td>
                      <td style="height: 21px">
                      </td>
                  </tr>
                  <tr>
                      <td align="left">
                          </td>
                      <td>
                          </td>
                      <td>
                      </td>
                  </tr>
                </table>
                            <asp:Button ID="btnFSelect" runat="server" Height="0px" 
                                Width="0px" /></td>
                    </tr>
                </table>
               
                <table id="tblSub" runat="server" align="center" style="border-right: #507cd1 1px solid;
                    border-top: #507cd1 1px solid; border-left: #507cd1 1px solid;
                    border-bottom: #507cd1 1px solid" visible="false">
                    <tr>
                        <td align="center" bgcolor="#b0c4de" style=" background-color: #507cd1; height: 20px; border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;">
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="11pt"
                                ForeColor="White" Text="Job Allotement" Width="536px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td bgcolor="#eff3fb" colspan="7" rowspan="1" style="background-color: #f7f6f3; font-size: 1pt; und-color: #f7f6f3;" align="left">
                                        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" TabIndex="4" Text="Add New"
                                            Width="88px" Font-Names="Verdana" />
                            </td>
                    </tr>
                    <tr>
                        <td bgcolor="#eff3fb" colspan="7" rowspan="3" align="center">
                            <asp:GridView ID="gvFind" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" CellPadding="4" Font-Names="Verdana" Font-Size="10pt" OnSelectedIndexChanged="gvFind_SelectedIndexChanged" Width="100%" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:TemplateField HeaderText="keycode" SortExpression="keycode" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="keycode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"keycode")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Complentcode" SortExpression="ccode">
                                        <ItemTemplate>
                                            <asp:Label ID="Complentcode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ccode")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                     <asp:TemplateField HeaderText="Task" SortExpression="Task">
                                        <ItemTemplate>
                                            <asp:Label ID="Task" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Task")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Staff" SortExpression="Employee">
                                        <ItemTemplate>
                                            <asp:Label ID="Employee" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"empid")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date" SortExpression="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="Date" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"dt")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    
                                   
                                   
                                                 <asp:TemplateField HeaderText="ToDate" SortExpression="tdt">
                                        <ItemTemplate>
                                            <asp:Label ID="ToDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"tdt")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                             
                                        
                                        <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                                        <ItemTemplate>
                                           <asp:Label ID="Remark" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Remark")  %>'></asp:Label>
                                         
                                           </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="flag">
                                        <ItemTemplate>
                                           <asp:CheckBox  ID="Status" runat="server" Checked='<%# DataBinder.Eval(Container.DataItem,"flag")  %>' Enabled="False"></asp:CheckBox>
                                     
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                           <asp:TemplateField HeaderText="CompletedDate" SortExpression="cdate">
                                        <ItemTemplate>
                                            <asp:Label ID="CompletedDate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"cdate")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDelete" runat="server" OnClientClick="return dele();"
                                                                OnCommand="btnDelete_Command"  >Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                </Columns>
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
                    <asp:HiddenField ID="hdn1" runat="server" />
                <asp:HiddenField ID="hdnUserId" runat="server" />
                            <asp:HiddenField ID="hdnrmname" runat="server" />
                <asp:HiddenField ID="hdnBrokerKey" runat="server" />
                            <input id="hdnDelConfirm" runat="server" style="width: 1px" type="hidden" /></td>
            </tr>
        </table>
                <asp:HiddenField ID="hdnbtnper" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    
    </div>
       <br />
        <br />
    </form>
</body>
</html>


 <%--<Columns>
                                    <asp:ButtonColumn CommandName="Select" Text="Select" >
                                        <ItemStyle ForeColor="Blue" />
                                    </asp:ButtonColumn>
                                    <asp:BoundColumn DataField="Registrarkey" HeaderText="Registrarkey" SortExpression="Registrarkey"
                                        Visible="False"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="RegistrarName" HeaderText="RegistrarName" SortExpression="RegistrarName">
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="Default">
                                        <ItemTemplate>
                                            <asp:RadioButton ID="rbtnreg" runat="server" GroupName="grp1" AutoPostBack="True" />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn >
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDelete" runat="server" ForeColor="red" OnClientClick="if(!confirm('Do you want to Delete?')){return false;}"
                                                OnCommand="btnDelete_Command" Text="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Right" />
                                        <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Right" />
                                    </asp:TemplateColumn>
                                </Columns>--%>