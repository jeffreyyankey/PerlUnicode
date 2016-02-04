#!/usr/bin/perlml

#SATTS to Arabic HTML Converter written by Jeff Yankey and Larry Sebastian

use strict;
use CGI;
print "Content-type: text/html\n\n";
my $query = new CGI;
my $pageaction = $query->param("pageaction");
my $instring = $query->param("instring");
my ($string,$outstring,$item,$outstring2,$xmloutstring);

my %letters=(	"," =>	"&#1548",
		"E" =>	"&#1569",
		"A" =>	"&#1575",
		"B" =>	"&#1576",
		"P" =>	"&#1577",
		"T" =>	"&#1578",
		"C" =>	"&#1579",
		"J" =>	"&#1580",
		"H" =>	"&#1581",
		"O" =>	"&#1582",
		"D" =>	"&#1583",
		"Z" =>	"&#1584",
		"R" =>	"&#1585",
		";" =>	"&#1586",
		"S" =>	"&#1587",
		":" =>	"&#1588",
		"X" =>	"&#1589",
		"V" =>	"&#1590",
		"U" =>	"&#1591",
		"Y" =>	"&#1592",
		"\"" =>	"&#1593",
		"G" =>	"&#1594",
		"F" =>	"&#1601",
		"Q" =>	"&#1602",
		"K" =>	"&#1603",
		"L" =>	"&#1604",
		"M" =>	"&#1605",
		"N" =>	"&#1606",
		"?" =>	"&#1607",
		"W" =>	"&#1608",
		"y" =>	"&#1609",
		"I" =>	"&#1610",
		"f" =>	" &#1611",
		"d" =>	" &#1612",
		"k" =>	" &#1613",
		"a" =>	"&#1614",
		"w" =>	"&#1615",
		"i" =>	"&#1616",
		"e" =>	"&#1617",
		"o" =>	"&#1618",
		"0" =>	"&#1632",
		"1" =>	"&#1633",
		"2" =>	"&#1634",
		"3" =>	"&#1635",
		"4" =>	"&#1636",
		"5" =>	"&#1637",
		"6" =>	"&#1638",
		"7" =>	"&#1639",
		"8" =>	"&#1640",
		"9" =>	"&#1641",
		"." =>	"&#0046",
		" " =>	" "
		);
		
		
my %xmlletters=(	"," =>	"&#x60C",
		"E" =>	"&#x621;",
		"A" =>	"&#x627;",
		"B" =>	"&#x628;",
		"P" =>	"&#x629;",
		"T" =>	"&#x62A;",
		"C" =>	"&#x62B;",
		"J" =>	"&#x62C;",
		"H" =>	"&#x62D;",
		"O" =>	"&#x62E;",
		"D" =>	"&#x62F;",
		"Z" =>	"&#x630;",
		"R" =>	"&#x631;",
		";" =>	"&#x632;",
		"S" =>	"&#x633;",
		":" =>	"&#x634;",
		"X" =>	"&#x635;",
		"V" =>	"&#x636;",
		"U" =>	"&#x637;",
		"Y" =>	"&#x638;",
		"\"" =>	"&#x639;",
		"G" =>	"&#x63A;",
		"F" =>	"&#x641;",
		"Q" =>	"&#x642;",
		"K" =>	"&#x643;",
		"L" =>	"&#x644;",
		"M" =>	"&#x645;",
		"N" =>	"&#x646;",
		"?" =>	"&#x647;",
		"W" =>	"&#x648;",
		"y" =>	"&#x649;",
		"I" =>	"&#x64A;",
		"f" =>	" &#1611",
		"d" =>	" &#1612",
		"k" =>	" &#1613",
		"a" =>	"&#1614",
		"w" =>	"&#1615",
		"i" =>	"&#1616",
		"e" =>	"&#1617",
		"o" =>	"&#1618",
		"0" =>	"&#x660;",
		"1" =>	"&#x661;",
		"2" =>	"&#x662;",
		"3" =>	"&#x663;",
		"4" =>	"&#x664;",
		"5" =>	"&#x665;",
		"6" =>	"&#x666;",
		"7" =>	"&#x667;",
		"8" =>	"&#x668;",
		"9" =>	"&#x669;",
		"." =>	"&#x02E;",
		" " =>	" "
		);		
		

if ($pageaction eq "translate"){
	&translate();
}
else {
	&form();
}	

		
		
sub translate()

{		
		
	foreach $item( split(//,$instring) ){
		$outstring .= qq|$letters{$item}|;
	}
	
	
	$outstring =~ s/\&#1575\&#1569/\&#1571/gi; #AE is Alif Fatha Hamza
	$outstring =~ s/\&#1610\&#1569/\&#1574/gi; #IE is Yaa Hamza
	$outstring =~ s/\&#1569\&#1575/\&#1573/gi; #EA is Alif Kasra Hamza
	$outstring =~ s/\&#1608\&#1569/\&#1572/gi; #WE is Wa Hamza
	$outstring =~ s/\&#1575\&#1575/\&#1570/gi; #AA is Alif Medda
	$outstring =~ s/\&#1575 \&#1569/\&#1575\&#1569/gi; #A E Should have no space
	
	$outstring =~ s/\&#1614\&/\&#1600\&#1614\&/gi; #Add extension 1600 to fatha 
	$outstring =~ s/\&#1615\&/\&#1600\&#1615\&/gi; #Add extension 1600 to dumma
	$outstring =~ s/\&#1616\&/\&#1600\&#1616\&/gi; #Add extension 1600 to kasra
	$outstring =~ s/\&#1617\&/\&#1600\&#1617\&/gi; #Add extension 1600 to shedda
	$outstring =~ s/\&#1618\&/\&#1600\&#1618\&/gi; #Add extension 1600 to sukuun
	
	$outstring =~ s/\&#1575\&#1600\&#1614/\&#1575 \&#1614/gi; #Alif-Fatha does not get 1600
	$outstring =~ s/\&#1583\&#1600\&#1614/\&#1583 \&#1614/gi; #Daal-Fatha does not get 1600
	$outstring =~ s/\&#1584\&#1600\&#1614/\&#1584 \&#1614/gi; #Thaal-Fatha does not get 1600
	$outstring =~ s/\&#1585\&#1600\&#1614/\&#1585 \&#1614/gi; #Raa-Fatha does not get 1600
	$outstring =~ s/\&#1586\&#1600\&#1614/\&#1586 \&#1614/gi; #Dhaal-Fatha does not get 1600
	$outstring =~ s/\&#1608\&#1600\&#1614/\&#1608 \&#1614/gi; #Wa-Fatha does not get 1600
	
	$outstring =~ s/\&#1575\&#1600\&#1615/\&#1575 \&#1615/gi; #Alif-Dumma does not get 1600
	$outstring =~ s/\&#1583\&#1600\&#1615/\&#1583 \&#1615/gi; #Daal-Dumma does not get 1600
	$outstring =~ s/\&#1584\&#1600\&#1615/\&#1584 \&#1615/gi; #Thaal-Dumma does not get 1600
	$outstring =~ s/\&#1585\&#1600\&#1615/\&#1585 \&#1615/gi; #Raa-Dumma does not get 1600
	$outstring =~ s/\&#1586\&#1600\&#1615/\&#1586 \&#1615/gi; #Dhaal-Dumma does not get 1600
	$outstring =~ s/\&#1608\&#1600\&#1615/\&#1608 \&#1615/gi; #Wa-Dumma does not get 1600
	
	$outstring =~ s/\&#1575\&#1600\&#1616/\&#1575 \&#1616/gi; #Alif-Kasra does not get 1600
	$outstring =~ s/\&#1583\&#1600\&#1616/\&#1583 \&#1616/gi; #Daal-Kasra does not get 1600
	$outstring =~ s/\&#1584\&#1600\&#1616/\&#1584 \&#1616/gi; #Thaal-Kasra does not get 1600
	$outstring =~ s/\&#1585\&#1600\&#1616/\&#1585 \&#1616/gi; #Raa-Kasra does not get 1600
	$outstring =~ s/\&#1586\&#1600\&#1616/\&#1586 \&#1616/gi; #Dhaal-Kasra does not get 1600
	$outstring =~ s/\&#1608\&#1600\&#1616/\&#1608 \&#1616/gi; #Wa-Kasra does not get 1600
	
	$outstring =~ s/\&#1575\&#1600\&#1617/\&#1575 \&#1617/gi; #Alif-Shedda does not get 1600
	$outstring =~ s/\&#1583\&#1600\&#1617/\&#1583 \&#1617/gi; #Daal-Shedda does not get 1600
	$outstring =~ s/\&#1584\&#1600\&#1617/\&#1584 \&#1617/gi; #Thaal-Shedda does not get 1600
	$outstring =~ s/\&#1585\&#1600\&#1617/\&#1585 \&#1617/gi; #Raa-Shedda does not get 1600
	$outstring =~ s/\&#1586\&#1600\&#1617/\&#1586 \&#1617/gi; #Dhaal-Shedda does not get 1600
	$outstring =~ s/\&#1608\&#1600\&#1617/\&#1608 \&#1617/gi; #Wa-Shedda does not get 1600
	
	$outstring =~ s/\&#1575\&#1600\&#1618/\&#1575 \&#1618/gi; #Alif-Sukuun does not get 1600
	$outstring =~ s/\&#1583\&#1600\&#1618/\&#1583 \&#1618/gi; #Daal-Sukuun does not get 1600
	$outstring =~ s/\&#1584\&#1600\&#1618/\&#1584 \&#1618/gi; #Thaal-Sukuun does not get 1600
	$outstring =~ s/\&#1585\&#1600\&#1618/\&#1585 \&#1618/gi; #Raa-Sukuun does not get 1600
	$outstring =~ s/\&#1586\&#1600\&#1618/\&#1586 \&#1618/gi; #Dhaal-Sukuun does not get 1600
	$outstring =~ s/\&#1608\&#1600\&#1618/\&#1608 \&#1618/gi; #Wa-Sukuun does not get 1600
	
	
	$outstring2 = $outstring;
	$outstring2 =~ s/\&/\&amp/gi; #Create HTML code for letters.
	
	foreach $item( split(//,$instring) ){
		$xmloutstring .= qq|$xmlletters{$item}|;
	}
	$xmloutstring =~ s/\&/\&amp/gi;
	
	&form();
}

sub form(){

print qq|
	
<HTML>
<Title>SATTS to Arabic Unicode Converter</TITLE>
	
<STYLE type="text/css">
SPAN.arabic
   { font-face: Traditional Arabic;
    font-size: 140%; }

</STYLE>
	
	
<BODY>
<center>
<table width="50%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="25%" align="center">SATTS : </td>
    <td width="75%"><p>$instring</td>
  </tr>
  <tr>
    <td align="center">Arabic script: </td>
    <td><p dir="rtl"><SPAN class="arabic">$outstring</span></p></td>
  </tr>
  <tr >
    <td align="center">Unicode HTML: </td>
    <td><p>$outstring2</td>
  </tr>
  <code>
  <tr>
    <td align="center">Unicode Hex: </td>
    <td><p>$xmloutstring</td>
  </tr>
  </code>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr align="center">
    <td colspan="2"><b>Enter text to convert below:</b></td>
  </tr>
  <tr align="center">
    <td colspan="2"><form METHOD="post" name="preferenceform" action="/cgi-bin/satts2.pl">
				
		<textarea wrap=virtual name="instring" cols=50 row=1></textarea>
		<input type="hidden" name="pageaction" value="translate">
				
		<input type="submit" name="s1" value="Submit" class="formbutton">
			  </p>
		</form></td>
  </tr>
</table>


  <table width="500"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="100"><div align="center">A <SPAN class="arabic">\&#1575</span></div></td>
      <td width="100"><div align="center">B <SPAN class="arabic">\&#1576</span></div></td>
	  <td width="100"><div align="center">T <SPAN class="arabic">\&#1578</span></div></td>
	  <td width="100"><div align="center">C <SPAN class="arabic">\&#1579</span></div></td>
	  <td width="100"><div align="center">J <SPAN class="arabic">\&#1580</span></div></td>
	  <td width="100"><div align="center">H <SPAN class="arabic">\&#1581</span></div></td>
	  <td width="100"><div align="center">O <SPAN class="arabic">\&#1582</span></div></td>
	</tr>  
	<tr>
	  <td width="100"><div align="center">D <SPAN class="arabic">\&#1583</span></div></td>
	  <td width="100"><div align="center">Z <SPAN class="arabic">\&#1584</span></div></td>
	  <td width="100"><div align="center">R <SPAN class="arabic">\&#1585</span></div></td>
	  <td width="100"><div align="center">; <SPAN class="arabic">\&#1586</span></div></td>
	  <td width="100"><div align="center">S <SPAN class="arabic">\&#1587</span></div></td>  
	  <td width="100"><div align="center">: <SPAN class="arabic">\&#1588</span></div></td>
	  <td width="100"><div align="center">X <SPAN class="arabic">\&#1589</span></div></td>
	</tr>  
	<tr>
	  <td width="100"><div align="center">V <SPAN class="arabic">\&#1590</span></div></td>   
	  <td width="100"><div align="center">U <SPAN class="arabic">\&#1591</span></div></td>
	  <td width="100"><div align="center">Y <SPAN class="arabic">\&#1592</span></div></td>
      <td width="100"><div align="center">&quot; <SPAN class="arabic">\&#1593</span></div></td>
	  <td width="100"><div align="center">G <SPAN class="arabic">\&#1594</span></div></td>
	  <td width="100"><div align="center">F <SPAN class="arabic">\&#1601</span></div></td>
	  <td width="100"><div align="center">Q <SPAN class="arabic">\&#1602</span></div></td>
	</tr>  
    <tr>
	  <td width="100"><div align="center">K <SPAN class="arabic">\&#1603</span></div></td>
	  <td width="100"><div align="center">L <SPAN class="arabic">\&#1604</span></div></td>  
      <td width="100"><div align="center">M <SPAN class="arabic">\&#1605</span></div></td>
	  <td width="100"><div align="center">N <SPAN class="arabic">\&#1606</span></div></td>
	  <td width="100"><div align="center">? <SPAN class="arabic">\&#1607</span></div></td>
	  <td width="100"><div align="center">P <SPAN class="arabic">\&#1577</span></div></td>
	  <td width="100"><div align="center">W <SPAN class="arabic">\&#1608</span></div></td>
	</tr>  
	<tr>  
	  <td width="100"><div align="center">I <SPAN class="arabic">\&#1610</span></div></td>	  
      <td width="100"><div align="center">y <SPAN class="arabic">\&#1609</span></div></td>
	  <td width="100"><div align="center">E <SPAN class="arabic">\&#1569</span></div></td>
	  <td width="100"><div align="center"></div></td>
	  <td width="100"><div align="center"></div></td>
	  <td width="100"><div align="center"></div></td>
	  <td width="100"><div align="center"></div></td>
    </tr>
    <tr>
      <td width="100"><div align="center">AA <SPAN class="arabic">\&#1570</span></div></td>
	  <td width="100"><div align="center">AE <SPAN class="arabic">\&#1571</span></div></td>
	  <td width="100"><div align="center">EA <SPAN class="arabic">\&#1573</span></div></td>
	  <td width="100"><div align="center">WE <SPAN class="arabic">\&#1572</span></div></td>
	  <td width="100"><div align="center">IE <SPAN class="arabic">\&#1574</span></div></td>
      <td width="100"><div align="center"></div></td>
      <td width="100"><div align="center"></div></td>
    </tr>
  
     
  </table>
  <p>&nbsp;</p>
  <table width="500"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td colspan="7"><div align="center">Short vowels and marks </div></td>
    </tr>
    <tr>
      <td width="100"><div align="center">a <SPAN class="arabic">\&#1614</span></div></td>
      <td width="100"><div align="center">f <SPAN class="arabic">\&#1611</span></div></td>
      <td width="100"><div align="center">e <SPAN class="arabic">\&#1617</span></div></td>
      <td width="100"><div align="center"></div></td>
      <td width="100"><div align="center"></div></td>
      <td width="100"><div align="center"></div></td>
      <td width="100"><div align="center"></div></td>
    </tr>
    <tr>
      <td width="100"><div align="center">i <SPAN class="arabic">\&#1616</span></div></td>
      <td width="100"><div align="center">k <SPAN class="arabic">\&#1613</span></div></td>
      <td width="100"><div align="center">o <SPAN class="arabic">\&#1618</span></div></td>
      <td width="100"><div align="center"></div></td>
      <td width="100"><div align="center"></div></td>
      <td width="100"><div align="center"></div></td>
      <td width="100"><div align="center"></div></td>
    </tr>
    <tr>
      <td width="100"><div align="center">w <SPAN class="arabic">\&#1615</span></div></td>
      <td width="100"><div align="center">d <SPAN class="arabic">\&#1612</span></div></td>
      <td width="100"><div align="center"></div></td>
      <td width="100"><div align="center"></div></td>
      <td width="100"><div align="center"></div></td>
      <td width="100"><div align="center"></div></td>
      <td width="100"><div align="center"></div></td>
    </tr>
  </table>

</center>
</BODY>
</HTML>		
	
|;
}



















