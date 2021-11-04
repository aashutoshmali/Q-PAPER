<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Not IsPostBack Then
            hdncval.Value = Request.QueryString("id1").ToString()
            hdntval.Value = Request.QueryString("id2").ToString()
            hdnt2val.Value = Request.QueryString("id3").ToString()
            hdnfb.Value = Request.QueryString("id4").ToString()
        End If
    End Sub
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Choose Color</title>

<style>

input {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	padding-top: 1px;	
	padding-bottom: 1px;	
	padding-left: 3px;	
	padding-right: 3px;	
	color: #666666;
	border: 1px solid #666666;	
}

span {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	padding-top: 1px;	
	padding-bottom: 1px;	
	padding-left: 3px;	
	padding-right: 3px;	
	color: #666666;
}

button{
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	background: #CCCCCC;
	color: #FFFFFF;
	padding-top: 1px;	
	padding-bottom: 1px;	
	padding-left: 3px;	
	padding-right: 3px;	
	text-align: center;
	height: 16px;
	width: 90px;
	cursor:pointer;
	cursor: hand;
	border: 0px solid #000000;
	font-variant: small-caps;	
}
</style>

<script language="javascript" src="color_conv.js"></script>
<script language="javascript">
var bgcolor = "#000000";
var RGB = new Array(256);
var k = 0;
var hex = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F");

for (i = 0; i < 16; i++) {	
	for (j = 0; j < 16; j++) {		
		RGB[k] = hex[i] + hex[j];
		k++;
	}
}

function dropLeadingZeros(num){
	while (num.charAt(0) == "0") {
		newTerm = num.substring(1, num.length);
		num = newTerm;
	}
	if (num == "") 
		num = "0";
	return num;
}

    function convert(){
     var r=document.getElementById("R_id").value;
    var g=document.getElementById("G_id").value;
    var b=document.getElementById("B_id").value;
    if (r!=0 || g!=0 || b!=0)
    {
	while ((r > 255) || (r < 0)) {
		alert("All RGB values must be between 0 and 255.")
		r = 0;
		//form.red.focus();
	}
	while ((g > 255) || (g < 0)) {
		alert("All RGB values must be between 0 and 255.")
		g = 0;
		//form.green.focus();
	}		
	while ((b > 255) || (b < 0)) {
		alert("All RGB values must be between 0 and 255.")
		b= 0;
		//form.blue.focus();
	}
	if (r == "")
		r = 0;
	if (g == "")
		g = 0;
	if (b == "")
		b = 0;
	r= dropLeadingZeros(r);
	g = dropLeadingZeros(g);
	b = dropLeadingZeros(b);
	rr = RGB[r]
	gg = RGB[g]
	bb = RGB[b]
	bgcolor = "#" + rr + gg + bb;	
	var hexval = bgcolor;
	}
	else
	{
	 var hexval ="#000000";
	}
	
	//alert(hexval); 
	var hval=hdncval.value;
	var tval=hdntval.value;
	var t2val=hdnt2val.value 
	
	window.opener.document.getElementById(hval).value=hexval;
	window.opener.document.getElementById(tval).style.backgroundColor=hexval;
	//debugger;
	if(hdnfb.value =="Fore")
	{
	 window.opener.document.getElementById(t2val).style.color=hexval; 
	} 
	else if(hdnfb.value =="Back")
	{
	 window.opener.document.getElementById(t2val).style.backgroundColor=hexval; 
	} 
//	window.opener.document.getElementById("hdncolor").value=hexval;
//	window.opener.document.getElementById("txtcolor").style.backgroundColor=hexval; 
	window.close();   
  }
//else
//{
//                  window.opener.document.getElementById("txtcolor").style.backgroundColor="#000000"; 
//	window.close();    
//}



</script>
</head>

<body onLoad="fnOnLoad();"  bgcolor="#CCCCCC">

<div id='div_colors' style="position:absolute; display:none;">
<span>Basic colors:</span>
<br/>
</div>


<div id='div_cust_colors' style="position:absolute; display:none;">
<span></span>
<br/>
</div>

<div id='div_buttons' style="position:absolute; top:300px; display:none;">
	<table>
		<tr>
			<td align = "center" colspan = "2">
			<input type="button" id="DefineCustomColors" name="DefineCustomColors" value = "Define Custom Colors >>"
				onClick="ShowHideCustColors();"
			>
			</td>
		</tr>
		<tr>
			<td align = "center">
				<input style="width:70px" type="button" id="btn_OK" name="btn_OK" value = "OK" 
onClick="convert();">
			</td>
			<td align = "center">				
				<input style="width:70px"  type="button" id="btn_Cancel" name="btn_Cancel" value = "Cancel" onClick="window.close();" >
			</td>
		</tr>
	</table>
    <input id="hdncval" runat="server" style="width: 16px" type="hidden" />
    <input id="hdntval" runat="server" style="width: 16px" type="hidden" />
    <input id="hdnt2val" runat="server" style="width: 16px" type="hidden" />
    <input id="hdnfb" runat="server" style="width: 16px" type="hidden" /></div>



<div id='div_graphics' style="position:absolute; display:none">
	<div id = "HSTable" style="position:absolute; " onclick="CalcSelectPos(event);">
		<div  id = "div_select" style="position:absolute; padding:0px; margin:0px; outline:0px" >
			<img id = "img_select" src="pix/select.GIF"></img>
		</div>
	</div>
	
	<div id = "LTable" style="position:absolute;" onClick="CalcSliderPos(event);">
		<div  id = "div_slider" style="position:absolute; padding:0px; margin:0px; outline:0px;">
			<img id = "img_slide" src="pix/slide.GIF"></img>
		</div>
	</div>
</div>



<div id="div_values" style="position:absolute; display:none;">
<table cellpadding="0" cellspacing="0">
<tr>
<!------------------------------------------------------------->
	<td>
		<table cellpadding="0" cellspacing="0" >
			<tr height="40">
				<td id="previewColor">
				</td>
			</tr>
			<tr>
				<td>
				<span>Color|Solid</span>
				</td>
			</tr>
		</table>
	</td>
<!------------------------------------------------------------->
	<td>
		<table>
			<tr>
				<td align="right"><span>Hue:</span></td>
				<td><input maxlength="3" size="3" type="text" id="H_id" name="H_id" value = "2" onKeyUp="fnVerifyNumber('H_id',240);CalcPosByHue();"/></td>
			</tr>
			<tr>
				<td align="right"><span>Sat:</span></td>
				<td><input maxlength="3"size="3" type="text" id="S_id" name="S_id" value = "2" onKeyUp="fnVerifyNumber('S_id',240);CalcPosBySat();" language="javascript" onafterupdate="return S_id_onafterupdate()"/></td>
			</tr>
			<tr>
				<td align="right"><span>Lum:</span></td>
				<td><input maxlength="3" size="3" type="text" id="L_id" name="L_id" value = "2" onKeyUp="fnVerifyNumber('L_id',240);CalcPosByLum();"/></td>
			</tr>
		</table>
	</td>
<!------------------------------------------------------------->
	<td>
		<table>
			<tr>
				<td align="right"><span>Red:</span></td>
				<td><input maxlength="3" size="3" type="text" id="R_id" name="R_id" value = "1" onKeyUp="fnVerifyNumber('R_id',255);OnChangeRGB();"/></td>
			</tr>
			<tr>
				<td align="right"><span>Green:</span></td>
				<td><input maxlength="3" size="3" type="text" id="G_id" name="G_id" value = "1" onKeyUp="fnVerifyNumber('G_id',255);OnChangeRGB();"/></td>
			</tr>
			<tr>
				<td align="right"><span>Blue:</span></td>
				<td><input maxlength="3" size="3" type="text" id="B_id" name="B_id" value = "1" onKeyUp="fnVerifyNumber('B_id',255);OnChangeRGB();"/></td>
			</tr>
		</table>
	</td>

</tr>
<tr>
	<td colspan="3" align="center">
		<input type="button" id="AddCustomColor" name="AddCustomColor" value = "Add Custom Color" 
			onClick="
				R = parseInt(document.getElementById('R_id').value);
				G = parseInt(document.getElementById('G_id').value);
				B = parseInt(document.getElementById('B_id').value);
				fnAddCustColorClick(R,G,B);
			"
		/>
	</td>
</tr>
</table>
</div>
</body>

</html>