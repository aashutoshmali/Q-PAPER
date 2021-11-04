<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SelectionForm.aspx.vb" Inherits="SelectionForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
 <title>DEPARTMENT OF COMPUTER</title>
 <script language="javascript" type ="text/jscript" src="javascript/Alphabet.js" >
 </script>
 <script language="javascript" type ="text/javascript"  src ="javascript/encrypt.js"></script>  
 <script language ="javascript" type ="text/javascript" >
 window.onload = maxWindow;

 function maxWindow()
 {
 window.moveTo(0,0);
 

 if (document.all)
 {
 top.window.resizeTo(screen.availWidth,screen.availHeight);
 }

 else if (document.layers||document.getElementById)
 {
 if (top.window.outerHeight<screen.availHeight||top.window.outerWidth<screen.availWidth)
 {
 top.window.outerHeight = screen.availHeight;
 top.window.outerWidth = screen.availWidth;
 }
 }
 }
 
 function abc()
 {
 var str="main1.html";
 var scr=screen.width-10;
 var sch=screen.height;
 window.open (str,"xxxx","width="+scr+",height="+sch+",top=0,left=0,toolbar=1,status bar=yes,resizable=yes");
 }
 
 
 function fnuser()
 {
 
 if( window.event.keyCode == 13)
	 {
	 if (document.forms[0]['txtuser'].value == "")
	 {
	 
		 alert("Username cannot be left blank");
		 document.forms[0]['txtuser'].focus();
		 fnDoNothing();
		 return false;
	 }
	 document.forms[0]['txtpwd'].focus();
	 fnDoNothing();
	 return true; 
	 }
	 fnCharInt();
	 
 }
 
 function fnpwd()
 {
 if( window.event.keyCode == 13)
	 {
	 if (document.forms[0]['txtpwd'].value == "")
	 {
		 alert("Password cannot be left blank");
		 document.forms[0]['txtpwd'].focus();
		 fnDoNothing();
		 return false;
	 }
	 document.getElementById( 'btnOK' ).focus(); 
	 }
 }
 
 function fnSubmit()
     {
      if (document.forms[0]['txtuser'].value == "")
	  {
		    alert("Username cannot be left blank");
		    document.forms[0]['txtuser'].focus();
		    fnCancelEvent();
		    return false;
	  }
	  if (document.forms[0]['txtpwd'].value == "")
	  {
		    alert("Password cannot be left blank");
		    document.forms[0]['txtpwd'].focus();
		    fnCancelEvent();
		    return false;
	   }
	   document.getElementById("hdnp").value=sha1Hash();
	   return true;
     }
 
 

// function fnAlphaNumericSpace( chr, obj )
//		{
//		 if( fnAlpha( chr, obj ) || fnNumeric( chr, obj ) )
//			{ 
//				return true; 
//			}
//			return false; 
//		}
// 
// 
//		function fnAlpha( chr, obj )
//		{
//			if( (parseInt(chr) >= 65 && parseInt(chr) <= 90) || (parseInt(chr) >= 97 && parseInt(chr) <= 122) )
//			{
//				return true;
//			}
//			return false;
//		}
//		function fnNumeric( chr, obj )
//		{
//			if( parseInt(chr) >= 48 && parseInt(chr) <= 57 )
//			{ 
//				return true;
//			}
//			return false;
//		}
//		function fnSpace( chr, obj )
//		{
//			if( parseInt(chr) == 32 )
//			{
//				return true;
//			}
//			return false;
//		}		
//		
// function fnDoNothing()
//		{
//			window.event.keyCode = 0;			
//		}
//		
//		function fnDrop()
//		{
//			event.returnValue = false;
//		}
//				
//		
		
 </script>
 
</head> 
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" link="#6600ff" vlink="#6600ff" >
 <form id="form1" runat="server">
 <div>
 </div>
 <table cellpadding="0" cellspacing="0" style="width: 100%" align = "center">
 <tr>
 <td colspan="3">
     </td>
 </tr>
 <tr>
 <td colspan="3" valign="top" style="background-position-y: bottom; background-image: url(Images/SelectionForm/page-top.jpg); background-repeat: repeat-x; height: 5px;"><asp:Image ID="Image13" runat="server" Height="5px" ImageUrl="~/Images/SelectionForm/spacer.gif" Width="1px" /></td>
 </tr>
 </table>
 
 <table runat=server align=center width =100% id="TABLE1" >
 <tr>
     <td align="right" rowspan="5" style="background-image: url(Images/1.png)" valign="top">
     <br />
         &nbsp;<br />
         <br />
         <br />
         <br />
         <br />
         &nbsp;&nbsp;<br />
         &nbsp;&nbsp;
 <table border="0" cellspacing="0">
 <tr>
 <td id="t3" runat="server">
 </td>
 <td id="t4" runat="server">
 </td>
 <td id="t5" runat="server" align="right" height ="20">
 </td>
     <td runat="server" align="right" height="20">
     </td>
 </tr>
 <tr>
 <td id="t6" runat="server" align="right">
 <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Verdana"
 Font-Size="10pt" ForeColor="White" Text="Username :"></asp:Label></td>
 <td id="t7" runat="server" align="left">
 <asp:TextBox ID="txtuser" runat="server" AutoCompleteType="Disabled" BackColor="#BFD2D9"
 BorderColor="#0C4C68" BorderStyle="Solid" BorderWidth="1px" Font-Size="12pt" ForeColor="Black"
 Height="18px" MaxLength="20" TabIndex="1" Width="200px"></asp:TextBox></td>
 <td id="t10" runat="server" align="right" rowspan="2" valign="bottom">
 <asp:ImageButton ID="btnOK" runat="server" ImageUrl="~/Images/SelectionForm/enter.jpg" /></td>
     <td runat="server" align="right" rowspan="2" valign="bottom">
     </td>
 </tr>
 <tr>
 <td id="t8" runat="server" align="right">
 <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Verdana"
 Font-Size="10pt" ForeColor="White" Text="Password :"></asp:Label></td>
 <td id="t9" runat="server" align="left">
 <asp:TextBox ID="txtpwd" runat="server" AutoCompleteType="Disabled" BackColor="#BFD2D9"
 BorderColor="#0C4C68" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black"
 Height="18px" MaxLength="20" TabIndex="2" TextMode="Password" Width="200px" Font-Size="12pt">r</asp:TextBox></td>
 </tr>
 <tr>
 <td id="t11" runat="server" align="center" colspan="3" height ="20">
 <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Verdana"
 ForeColor="White"></asp:Label></td>
     <td runat="server" align="center" colspan="1" height="20">
         &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
     </td>
 </tr>
 <tr>
 <td runat="server" align="center" colspan="3" id="Td1">
 </td>
     <td runat="server" align="center" colspan="1">
     </td>
 </tr>
 </table>
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
 <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
         <br />
     </td>
 </tr>
     <tr>
     </tr>
     <tr>
     </tr>
     <tr>
     </tr>
 <tr>
 </tr>
 <tr>
 <td align="center" >
 <asp:Panel ID="regisPanel" runat="server" Height="50px" Width="125px" BorderColor="#7B7A7A" BorderStyle="Solid" BorderWidth="2px" Visible="False">
 </asp:Panel>
     <input id="hdnp" runat="server" style="width: 32px" type="hidden" />
 <br /><input id="Hidden1" runat="server" style="width: 32px" type="hidden" /></td>
 </tr>
 
 <tr>
 <td align="center" contenteditable="true">
     <asp:HiddenField ID="hdnFlag" runat="server" />
     <asp:HiddenField ID="hdnLogonAttempts" runat="server" />
     <input style="width: 32px" id="hdnpwd" runat="server" type="hidden"><br />
 
 </td>
 
 </tr>
 </table>
 
 
 
 </form>
</body>
</html>
