<%@ Page Language="VB" AutoEventWireup="false" CodeFile="JobRemark.aspx.vb" Inherits="JobRemark" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    
   
     <script type ="text/javascript" language="javascript" src="javascript/Alphabet.js"></script>   
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
               
                <table id="tblSub" runat="server" align="center" style="border-right: #507cd1 1px solid;
                    border-top: #507cd1 1px solid; border-left: #507cd1 1px solid;
                    border-bottom: #507cd1 1px solid" visible="true">
                    <tr>
                        <td align="center" bgcolor="#b0c4de" style=" background-color: #507cd1; height: 20px; border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;">
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="11pt"
                                ForeColor="White" Text="Job remark" Width="536px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td bgcolor="#eff3fb" colspan="7" rowspan="1" style="background-color: #f7f6f3; font-size: 1pt; und-color: #f7f6f3;" align="left">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td bgcolor="#eff3fb" colspan="7" rowspan="3" align="center">
                            <asp:GridView ID="gvFind" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" CellPadding="4" Font-Names="Verdana" Font-Size="10pt"  Width="100%" AutoGenerateEditButton="True" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                <Columns>
                                    
                                    <asp:TemplateField HeaderText="keycode" SortExpression="keycode" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="keycode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"keycode")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  
                                                     <asp:TemplateField HeaderText="Staff" SortExpression="Employee">
                                        <ItemTemplate>
                                            <asp:Label ID="Employee" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"empid")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                                         
                                                     <asp:TemplateField HeaderText="Task" SortExpression="Task">
                                        <ItemTemplate>
                                            <asp:Label ID="Task" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Task")  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Date" SortExpression="dt">
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
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtremark" runat="server" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem,"Remark")  %>' Font-Names="Verdana" Font-Size="10pt"></asp:TextBox>
                                            </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="Status" >
                                        <ItemTemplate>
                                           <asp:CheckBox  ID="Status" runat="server" Checked='<%# DataBinder.Eval(Container.DataItem,"flag")  %>' Enabled="False"></asp:CheckBox>
                                     
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="chk" runat="server" Checked='<%# DataBinder.Eval(Container.DataItem,"flag")  %>' />
                                        </EditItemTemplate>
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