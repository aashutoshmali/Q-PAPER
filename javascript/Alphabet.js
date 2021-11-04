// JScript File

function fnCharInt()
{
  if( !(fnAlphaNumericSpace( window.event.keyCode, "txtFilename")) )
  {
	fnDoNothing();	
  }
}

      function fnAlphaNumericSpace( chr, obj )
		{
		    if( fnAlpha( chr, obj ) || fnNumeric( chr, obj ) )
			{ 
				return true; 
			}
			return false; 
		}
     
     
		function fnAlpha( chr, obj )
		{
			if( (parseInt(chr) >= 65 && parseInt(chr) <= 90) || (parseInt(chr) >= 97 && parseInt(chr) <= 122) )
			{
			  if((window.event.keyCode>=97) && (window.event.keyCode<=122))
               {
                window.event.keyCode =  window.event.keyCode-32;
               }
			  return true;
			}
			return false;
		}
		function fnNumeric( chr, obj )
		{
			if( parseInt(chr) >= 48 && parseInt(chr) <= 57  )
			{ 
				return true;
			}
			return false;
		}
		function fnSpace( chr, obj )
		{
			if( parseInt(chr) == 32 )
			{
				return true;
			}
			return false;
		}		
		
        function fnDoNothing()
		{
			window.event.keyCode = 0;			
		}
	
function fnInt()
{
  if( !(fnNumericSpace( window.event.keyCode, "txtFilename")) )
  {
	fnDoNothing();	
  }
}
	
function fnNumericSpace( chr, obj )
		{
		    if(fnNumeric( chr, obj ) )
			{ 
				return true; 
			}
			return false; 
		}
     	
function fnChar()
{
  if( !(fnAlphaSpace( window.event.keyCode, "txtFilename")))
  {
	fnDoNothing();	
  }
}	
	
	function fnAlphaSpace( chr, obj )
		{
		    if( fnAlpha( chr, obj ))
			{ 
				return true; 
			}
			return false; 
		}

	
function fnCharIntSpace()
{
  if( !(fnAlphaNumericSpace2( window.event.keyCode, "txtFilename")))
  {
	fnDoNothing();	
  }
}	
	
function fnAlphaNumericSpace2( chr, obj )
{
 if( fnSpace( chr, obj ) || fnAlpha( chr, obj ) || fnNumeric( chr, obj ))
 { 
  return true; 
 }
 return false; 
}
			
function fnCharSpace()
{
  if( !(fnAlphaNumericSpace1( window.event.keyCode, "txtFilename")))
  {
	fnDoNothing();	
  }
}	
	
function fnAlphaNumericSpace1( chr, obj )
{
 if( fnSpace( chr, obj ) || fnAlpha( chr, obj ))
 { 
  return true; 
 }
 return false; 
}

function fnadd()
{
  if( !(fnAddress( window.event.keyCode, "txtFilename")))
  {
	fnDoNothing();	
  }
}	
	
function fnAddress( chr, obj )
{
 if( fnSpace( chr, obj ) || fnAlpha( chr, obj ) || fnDot( chr, obj ) || fnHyphen( chr, obj ) || fnscolon( chr, obj ))
 { 
  return true; 
 }
 return false; 
}

function fnscolon( chr, obj )
{//debugger;
 if( parseInt(chr) == 59 || parseInt(chr) == 95 || parseInt(chr) == 47 || parseInt(chr) == 40 || parseInt(chr) == 41 || parseInt(chr) == 91 || parseInt(chr) ==93 || parseInt(chr) == 44 )
  {
  return true;
 }
 return false;
}

function fnlonlat()
{
  if(!(fnlongitude(window.event.keyCode, "txtFilename")))
  {
	fnDoNothing();	
  }
}	
	
function fnlongitude( chr, obj )
{
 if( fnDot( chr, obj ) ||  fnNumeric( chr, obj ) )
 { 
  return true; 
 }
 return false; 
}		

//---------------------------------------------------------------------------------------------------

function fnUid()
{
  if( !(fnAlphaNumericSpace3( window.event.keyCode, "txtFilename")))
  {
	fnDoNothing();	
  }
}	
	
function fnAlphaNumericSpace3( chr, obj )
{
 if( fnSpace( chr, obj ) || fnAlpha( chr, obj ) || fnDot( chr, obj ) || fnHyphen( chr, obj ) || fnNumeric(chr,obj))
 { 
  return true; 
 }
 return false; 
}

function fnDot( chr, obj )
{
 if( parseInt(chr) == 190 || parseInt(chr) == 46)
 {
  return true;
 }
 return false;
}		
			
function fnHyphen( chr, obj )
{
 if( parseInt(chr) == 189 || parseInt(chr) == 45 )
  {
  return true;
 }
 return false;
}		

function fnMySpace()
{
 if(window.event.keyCode==32)
  {
  fnDoNothing();
  }
}	

 function fnUnselect()
 {
  document.selection.empty ();
 }



 function fnFloat(id)
  {
   
    var v1 = document.forms[0][id].value 
    if (v1.search(/\./i) != -1)
    {
     if( !(fnNosOnly( window.event.keyCode, id )) )
	 {
	  fnDoNothing();	
	 }
    }
    
    if( !(fnDecNumeric( window.event.keyCode, id )) )
	{
	  fnDoNothing();	
	}
    
  }
  
  function fnNosOnly( chr, obj )
	{
		if( parseInt(chr) >= 48 && parseInt(chr) <= 57  )
		{ 
			return true;
		}
			return false;
	}
  
  function fnDecNumeric( chr, obj )
	{
	   if( (parseInt(chr) >= 48 && parseInt(chr) <= 57)  ||  parseInt(chr) == 46)
		{ 
		 return true;
		}
		return false;
	}	
//---------------------------------------------------------------------------------------------------

