<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Payment Information</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Customers payment information for coaching services" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

<script type="text/javascript">
$(document).ready(function () {
	$('#creditCardType').change(function() {
	    var selectedVal = $('#creditCardType option:selected').text();
	    $('#creditCardTypeValue').val(selectedVal);
	});
	
	$('#expirationMonth').change(function() {
	    var selectedVal = $('#expirationMonth option:selected').text();
	    $('#expirationMonthValue').val(selectedVal);
	
	});
	
	$('#expirationYear').change(function() {
	    var selectedVal = $('#expirationYear option:selected').text();
	    $('#expirationYearValue').val(selectedVal);
	
	});
	
	$('#state').change(function() {
	    var selectedVal = $('#state option:selected').text();
	    $('#stateValue').val(selectedVal);
	    
	});
	
	$('.numberInput').keyup(function () {
	    s=$(this).val();
	    if (!/^\d*\.?\d*$/.test(s)) {
	    	alert("Only numeric values allowed in this field");
	    	$(this).val(s.substr(0,s.length-1));
	    }	
	    
	});
	
	
});
</script>


<style>
label {font-size:14px;}

input.error {
    background-color:red;
    border: 1px solid red;
}
select.error {
    border: 1px solid red;
}

</style>
	
</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

	<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a> &gt;&gt;<a href="${pageContext.request.contextPath}/public/coachSelection">New Search</a>
&gt;&gt;<a href="${pageContext.request.contextPath}/public/coachSelection?BREADCRUMB=y">Coach List</a>
&gt;&gt;<a href="${pageContext.request.contextPath}/public/profile?BREADCRUMB=y">Coach Profile</a><br><br>

		<!-- CONTACT FORM -->
		<form:form method="post" commandName="paymentInformation" >
			<%-- <p><h1>${paymentResponse}</h1></p>
			<p align="center" ><h2>${paymentResponse}</h2></p>
			<p align="center" ><h3>${paymentResponse}</h3></p>
			<p align="center" ><h4>${paymentResponse}</h4></p>
			 --%>
			 <table>
			  	<tbody >
			    <tr>
			      <td class="centeralign"><label style="font:bold 18px/30px Georgia, serif;">Please complete your order</label>
				</td></tr>
			  	</tbody >
			  	</table>
			  	<br>
			  	
			<b> <span style="font-size: 1.25em; text-align:center; color:red">
			<c:if test="${not empty paymentResponse}">Error processing your credit card. <c:out value="${paymentResponse}"/>  
		  	<br> <br>
			</c:if>
			</span></b>
			
			  	<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span>									
			  	
			 <p style="text-decoration:underline; font:italic bold 16px/30px Georgia, serif;">Order Details</p> 
			 <table>
			  	<tbody >
				    <tr>
				      <td class="leftalign"><label>Package Name: ${paymentInformation.packageName}</label>
					</td></tr>
				    <tr>
				      <td class="leftalign"><label>Package Price: ${paymentInformation.packagePrice}</label>
					</td></tr>
				</tbody >
			  </table>
			 <br>
			 <p style="text-decoration:underline; font:italic bold 16px/30px Georgia, serif;">Register or Sign-in</p> 
			 <table>
				<tr>
			      <td class="leftalign"><label>*Email: </label>
				        <form:input size="40" path="email" /><span style='color:red'><form:errors path="email" cssClass="error" /></span>
			        </td>
				</tr>

				<tr>
			      <td class="leftalign"><label>*Password: </label>
				        <form:password size="20" path="password" /><span style='color:red'><form:errors path="password" cssClass="error" /></span>
			        </td>
				</tr>
				<tr>
			      <td class="leftalign"><label>*Verify Password: </label>
				        <form:password size="40" path="confirmedpassword" /><span style='color:red'><form:errors path="confirmedpassword" cssClass="error" /></span>
			        </td>
				</tr>
			 </table>
			  
			<br>	
			 <p style="text-decoration:underline; font:italic bold 16px/30px Georgia, serif;">Payment Information</p> 
			 <table>
			  	<tbody >
    			<form:hidden path="creditCardTypeValue" id="creditCardTypeValue" value=""/>
			    <tr>
			      <td class="leftalign"><label>*Card Type: </label>
			        <form:select size="1" path="creditCardType" id="creditCardType" name="creditCardType">
						<option value="none"  selected="selected">Select your card</option>
						<option value="RAPID_REWARDS_VISA">Rapid Rewards Visa</option>
						<option value="VISA" >Visa</option>
						<option value="MasterCard">MasterCard</option>
						<option value="DISCOVER_NETWORK">Discover Network</option>
						<option value="Amex">American Express</option>
						<option value="UATP">UATP</option>
						<option value="DINERS_CLUB">Diners Club</option>
			        </form:select><span style='color:red'> <form:errors path="creditCardType" cssClass="error" nowrap="true" /></span>
				</td></tr>
				
				<tr>
				      <td class="leftalign"><label>*Card Number: </label>
				        <form:input background-color="blue" maxlength="4" size="4" path="creditCardNumber1" />
				        <form:input size="4" maxlength="4"  path="creditCardNumber2" />
				        <form:input size="4" maxlength="4"  path="creditCardNumber3" />
				        <form:input size="4" maxlength="4"  path="creditCardNumber4" /> <span style='color:red'><form:errors path="creditCardNumber1" cssClass="error" /></span>
				        </td>
				</tr>
   				<form:hidden path="expirationMonthValue" id="expirationMonthValue" value="January"/>
   				<form:hidden path="expirationYearValue" id="expirationYearValue" value="2013"/>
			    <tr>
			      <td class="leftalign"><label>*Expiration Date: </label>
			        <form:select readonly="true" size="1" path="expirationMonth" id="expirationMonth" >
					<option value="-1" selected="selected">Select Month</option>
					<option value="01">01-January</option>
					<option value="02">02-February</option>
					<option value="03">03-March</option>
					<option value="04">04-April</option>
					<option value="05">05-May</option>
					<option value="06">06-June</option>
					<option value="07">07-July</option>
					<option value="08">08-August</option>
					<option value="09">09-September</option>
					<option value="10">10-October</option>
					<option value="11">11-November</option>
					<option value="12">12-December</option>			        
					</form:select>

					<!--  Add Code to generate the year dynamically -->
			        <form:select size="1" path="expirationYear" id="expirationYear" >
					<option value="-1" selected="selected">Select Year</option>
							<option value="13" >2013</option>
							<option value="14" >2014</option>
							<option value="15">2015</option>
							<option value="16">2016</option>
							<option value="17">2017</option>
							<option value="18">2018</option>
							<option value="19">2019</option>
							<option value="20">2020</option>
							<option value="21">2021</option>
							<option value="22">2022</option>
							<option value="23">2023</option>
							<option value="24">2024</option>
							<option value="25">2025</option>
							<option value="26">2026</option>
							<option value="27">2027</option>
							<option value="28">2028</option>
					</form:select> <span style='color:red'><form:errors path="expirationYear" cssClass="error" nowrap="true" /></span>
				</td></tr>
				<tr>
			      <td class="leftalign"><label>*Security Code: </label>
				        <form:input size="4" path="cvv2" maxlength="4"  /><span style='color:red'><form:errors path="cvv2" cssClass="error" /></span>
			        </td>
				</tr>
				</tbody>
			 </table>
			 	
			<br>
			 <p style="text-decoration:underline; font:italic bold 16px/30px Georgia, serif;">Billing Details</p> 
			 <table>
			  	<tbody >
				<tr>
			      <td class="leftalign"><label>*First Name: </label>
				        <form:input size="20" path="firstName" /><span style='color:red'><form:errors path="firstName" cssClass="error" /></span>
			        </td>
				</tr>
				<tr>
			      <td class="leftalign"><label>*Last Name: </label>
				        <form:input size="20" path="lastName" /><span style='color:red'><form:errors path="lastName" cssClass="error" /></span>
			        </td>
				</tr>

				<tr>
				      <td class="leftalign"><label>*Phone Number: </label>
				        <form:input size="4" maxlength="3" path="phoneNumber1" />
				        <form:input size="4" maxlength="3" path="phoneNumber2" />
				        <form:input size="5" maxlength="4" path="phoneNumber3" /><span style='color:red'><form:errors path="phoneNumber3" cssClass="error" /></span>
				        </td>
				</tr>
				<tr>
			      <td class="leftalign"><label>*Billing Street Address 1: </label>
				        <form:input size="30" path="street1" /><span style='color:red'><form:errors path="street1" cssClass="error" /></span>
			        </td>
				</tr>
				<tr>
			      <td class="leftalign"><label>Billing Street Address 2: </label>
				        <form:input size="30" path="street2" />
			        </td>
				</tr>
				<tr>
			      <td class="leftalign"><label>*City: </label>
				        <form:input size="8" path="city" /><span style='color:red'><form:errors path="city" cssClass="error" /></span>
			        </td>
				</tr>
      			<form:hidden path="stateValue" id="stateValue" value="Alabama"/>
			    <tr>
			      <td class="leftalign"><label>*State: </label>
			        <form:select size="1" path="state" id="state" >
					<option value="-1" selected="selected">Select State</option>
						<option value="AL" >Alabama</option>
						<option value="AK">Alaska</option>
						<option value="AS">American Somoa</option>
						<option value="AZ">Arizona</option>
						<option value="AR">Arkansas</option>
						<option value="AA">Armed Forces Americas (except Canada)</option>
						<option value="AE">Armed Forces</option>
						<option value="AP">Armed Forces Pacific</option>
						<option value="CA">California</option>
						<option value="CO">Colorado</option>
						<option value="CT">Connecticut</option>
						<option value="DE">Delaware</option>
						<option value="DC">District of Columbia</option>
						<option value="FM">Federated States of Micronesia</option>
						<option value="FL">Florida</option>
						<option value="GA">Georgia</option>
						<option value="GU">Guam</option>
						<option value="HI">Hawaii</option>
						<option value="ID">Idaho</option>
						<option value="IL">Illinois</option>
						<option value="IN">Indiana</option>
						<option value="IA">Iowa</option>
						<option value="KS">Kansas</option>
						<option value="KY">Kentucky</option>
						<option value="LA">Louisiana</option>
						<option value="ME">Maine</option>
						<option value="MH">Marshall Islands</option>
						<option value="MD">Maryland</option>
						<option value="MA">Massachusetts</option>
						<option value="MI">Michigan</option>
						<option value="MN">Minnesota</option>  
						<option value="MS">Mississippi</option>
						<option value="MO">Missouri</option>
						<option value="MT">Montana</option>
						<option value="NE">Nebraska</option>
						<option value="NV">Nevada</option>
						<option value="NH">New Hampshire</option>
						<option value="NJ">New Jersey</option>
						<option value="NM">New Mexico</option>
						<option value="NY">New York</option>
						<option value="NC">North Carolina</option>
						<option value="ND">North Dakota</option>
						<option value="MP">Northern Mariana Islands</option>
						<option value="OH">Ohio</option>
						<option value="OK">Oklahoma</option>
						<option value="OR">Oregon</option>
						<option value="PW">Palau</option>
						<option value="PA">Pennsylvania</option>
						<option value="PR">Puerto Rico</option>
						<option value="RI">Rhode Island</option>
						<option value="SC">South Carolina</option>
						<option value="SD">South Dakota</option>
						<option value="TN">Tennessee</option>
						<option value="TX">Texas</option>
						<option value="UT">Utah</option>
						<option value="VT">Vermont</option>
						<option value="VI">Virgin Islands</option>
						<option value="VA">Virginia</option>
						<option value="WA">Washington</option>
						<option value="WV">West Virginia</option>
						<option value="WI">Wisconsin</option>
						<option value="WY">Wyoming</option>
					</form:select><span style='color:red'><form:errors path="state" cssClass="error" nowrap="true" /></span>
				</td></tr>

				<tr>
			      <td class="leftalign"><label>*Zip Code: </label>
				        <form:input size="8" path="zip" /><span style='color:red'><form:errors path="zip" cssClass="error" /></span>
			        </td>
				</tr>
<%-- 
			    <tr>
      				<form:hidden path="countryCodeValue" id="countryCodeValue" value=""/>
			      <td class="leftalign">*Country: <form:errors path="countryCode" cssClass="error" nowrap="true" />
			        <form:select size="1" path="countryCode" id="countryCode" >
						<option value="US" selected="selected">UNITED STATES OF AMERICA - (US)</option>
						<option value="AF">AFGHANISTAN - (AF)</option>
						<option value="AX">ALAND ISLANDS - (AX)</option>
						<option value="AL">ALBANIA - (AL)</option>
						<option value="DZ">ALGERIA - (DZ)</option>
						<option value="AS">AMERICAN SAMOA - (AS)</option>
						<option value="AD">ANDORRA - (AD)</option>
						<option value="AO">ANGOLA - (AO)</option>
						<option value="AI">ANGUILLA - (AI)</option>
						<option value="AQ">ANTARCTICA - (AQ)</option>
						<option value="AG">ANTIGUA AND BARBUDA - (AG)</option>
						<option value="AR">ARGENTINA - (AR)</option>
						<option value="AM">ARMENIA - (AM)</option>
						<option value="AW">ARUBA - (AW)</option>
						<option value="AU">AUSTRALIA - (AU)</option>
						<option value="AT">AUSTRIA - (AT)</option>
						<option value="AZ">AZERBAIJAN - (AZ)</option>
						<option value="BS">BAHAMAS - (BS)</option>
						<option value="BH">BAHRAIN - (BH)</option>
						<option value="BD">BANGLADESH - (BD)</option>
						<option value="BB">BARBADOS - (BB)</option>
						<option value="BY">BELARUS - (BY)</option>
						<option value="BE">BELGIUM - (BE)</option>
						<option value="BZ">BELIZE - (BZ)</option>
						<option value="BJ">BENIN - (BJ)</option>
						<option value="BM">BERMUDA - (BM)</option>
						<option value="BT">BHUTAN - (BT)</option>
						<option value="BO">BOLIVIA - (BO)</option>
						<option value="BA">BOSNIA AND HERZEGOVINA - (BA)</option>
						<option value="BW">BOTSWANA - (BW)</option>
						<option value="BV">BOUVET ISLAND - (BV)</option>
						<option value="BR">BRAZIL - (BR)</option>
						<option value="IO">BRITISH INDIAN OCEAN TERRITORY - (IO)</option>
						<option value="BN">BRUNEI DARUSSALAM - (BN)</option>
						<option value="BG">BULGARIA - (BG)</option>
						<option value="BF">BURKINA FASO - (BF)</option>
						<option value="BI">BURUNDI - (BI)</option>
						<option value="KH">CAMBODIA - (KH)</option>
						<option value="CM">CAMEROON - (CM)</option>
						<option value="CA">CANADA - (CA)</option>
						<option value="CV">CAPE VERDE - (CV)</option>
						<option value="KY">CAYMAN ISLANDS - (KY)</option>
						<option value="CF">CENTRAL AFRICAN REPUBLIC - (CF)</option>
						<option value="TD">CHAD - (TD)</option>
						<option value="CL">CHILE - (CL)</option>
						<option value="CN">CHINA - (CN)</option>
						<option value="CX">CHRISTMAS ISLAND - (CX)</option>
						<option value="CC">COCOS (KEELING) ISLANDS - (CC)</option>
						<option value="CO">COLOMBIA - (CO)</option>
						<option value="KM">COMOROS - (KM)</option>
						<option value="CD">THE DEMOCRATIC REPUBLIC OF THE CONGO - (CD)</option>
						<option value="CG">CONGO - (CG)</option>
						<option value="CK">COOK ISLANDS - (CK)</option>
						<option value="CR">COSTA RICA - (CR)</option>
						<option value="CI">COTE D IVOIRE (Ivory Coast) - (CI)</option>
						<option value="HR">CROATIA (LOCAL NAME - HRVATSKA) - (HR)</option>
						<option value="CU">CUBA - (CU)</option>
						<option value="CY">CYPRUS - (CY)</option>
						<option value="CZ">CZECH REPUBLIC - (CZ)</option>
						<option value="DK">DENMARK - (DK)</option>
						<option value="DJ">DJIBOUTI - (DJ)</option>
						<option value="DM">DOMINICA - (DM)</option>
						<option value="DO">DOMINICAN REPUBLIC - (DO)</option>
						<option value="EC">ECUADOR - (EC)</option>
						<option value="EG">EGYPT - (EG)</option>
						<option value="SV">EL SALVADOR - (SV)</option>
						<option value="GQ">EQUATORIAL GUINEA - (GQ)</option>
						<option value="ER">ERITREA - (ER)</option>
						<option value="EE">ESTONIA - (EE)</option>
						<option value="ET">ETHIOPIA - (ET)</option>
						<option value="FK">FALKLAND ISLANDS (MALVINAS) - (FK)</option>
						<option value="FO">FAROE ISLANDS - (FO)</option>
						<option value="FJ">FIJI - (FJ)</option>
						<option value="FI">FINLAND - (FI)</option>
						<option value="FR">FRANCE - (FR)</option>
						<option value="GF">FRENCH GUIANA - (GF)</option>
						<option value="PF">FRENCH POLYNESIA - (PF)</option>
						<option value="TF">FRENCH SOUTHERN TERRITORIES - (TF)</option>
						<option value="GA">GABON - (GA)</option>
						<option value="GM">GAMBIA - (GM)</option>
						<option value="GE">GEORGIA - (GE)</option>
						<option value="DE">GERMANY - (DE)</option>
						<option value="GH">GHANA - (GH)</option>
						<option value="GI">GIBRALTAR - (GI)</option>
						<option value="GR">GREECE - (GR)</option>
						<option value="GL">GREENLAND - (GL)</option>
						<option value="GD">GRENADA - (GD)</option>
						<option value="GP">GUADELOUPE - (GP)</option>
						<option value="GU">GUAM - (GU)</option>
						<option value="GT">GUATEMALA - (GT)</option>
						<option value="GN">GUINEA - (GN)</option>
						<option value="GW">GUINEA - BISSAU - (GW)</option>
						<option value="GY">GUYANA - (GY)</option>
						<option value="HT">HAITI - (HT)</option>
						<option value="HM">HEARD AND MC DONALD ISLANDS - (HM)</option>
						<option value="HN">HONDURAS - (HN)</option>
						<option value="HK">HONG KONG - (HK)</option>
						<option value="HU">HUNGARY - (HU)</option>
						<option value="IS">ICELAND - (IS)</option>
						<option value="IN">INDIA - (IN)</option>
						<option value="ID">INDONESIA - (ID)</option>
						<option value="IR">IRAN (ISLAMIC REPUBLIC OF) - (IR)</option>
						<option value="IQ">IRAQ - (IQ)</option>
						<option value="IE">IRELAND - (IE)</option>
						<option value="IL">ISRAEL - (IL)</option>
						<option value="IT">ITALY - (IT)</option>
						<option value="JM">JAMAICA - (JM)</option>
						<option value="JP">JAPAN - (JP)</option>
						<option value="JO">JORDAN - (JO)</option>
						<option value="KZ">KAZAKHSTAN - (KZ)</option>
						<option value="KE">KENYA - (KE)</option>
						<option value="KI">KIRIBATI - (KI)</option>
						<option value="KP">DEMOCRATIC PEOPLE&#039;S REPUBLIC OF KOREA - (KP)</option>
						<option value="KR">REPUBLIC OF KOREA - (KR)</option>
						<option value="KW">KUWAIT - (KW)</option>
						<option value="KG">KYRGYZSTAN - (KG)</option>
						<option value="LA">LAO PEOPLES DEMOCRATIC REPUBLIC - (LA)</option>
						<option value="LV">LATVIA - (LV)</option>
						<option value="LB">LEBANON - (LB)</option>
						<option value="LS">LESOTHO - (LS)</option>
						<option value="LR">LIBERIA - (LR)</option>
						<option value="LY">LIBYAN ARAB JAMAHIRIYA (Libya) - (LY)</option>
						<option value="LI">LIECHTENSTEIN - (LI)</option>
						<option value="LT">LITHUANIA - (LT)</option>
						<option value="LU">LUXEMBOURG - (LU)</option>
						<option value="MO">MACAU - (MO)</option>
						<option value="MK">MACEDONIA - THE FORMER YUGOSLAV REPUBLIC OF - (MK)</option>
						<option value="MG">MADAGASCAR - (MG)</option>
						<option value="MW">MALAWI - (MW)</option>
						<option value="MY">MALAYSIA - (MY)</option>
						<option value="MV">MALDIVES - (MV)</option>
						<option value="ML">MALI - (ML)</option>
						<option value="MT">MALTA - (MT)</option>
						<option value="MH">MARSHALL ISLANDS - (MH)</option>
						<option value="MQ">MARTINIQUE - (MQ)</option>
						<option value="MR">MAURITANIA - (MR)</option>
						<option value="MU">MAURITIUS - (MU)</option>
						<option value="YT">MAYOTTE - (YT)</option>
						<option value="MX">MEXICO - (MX)</option>
						<option value="FM">MICRONESIA - FEDERATED STATES OF - (FM)</option>
						<option value="MD">REPUBLIC OF MOLDOVA - (MD)</option>
						<option value="MC">MONACO - (MC)</option>
						<option value="MN">MONGOLIA - (MN)</option>
						<option value="ME">MONTENEGRO - (ME)</option>
						<option value="MS">MONTSERRAT - (MS)</option>
						<option value="MA">MOROCCO - (MA)</option>
						<option value="MZ">MOZAMBIQUE - (MZ)</option>
						<option value="MM">MYANMAR - (MM)</option>
						<option value="NA">NAMIBIA - (NA)</option>
						<option value="NR">NAURU - (NR)</option>
						<option value="NP">NEPAL - (NP)</option>
						<option value="NL">NETHERLANDS - (NL)</option>
						<option value="AN">NETHERLANDS ANTILLES - (AN)</option>
						<option value="NC">NEW CALEDONIA - (NC)</option>
						<option value="NZ">NEW ZEALAND - (NZ)</option>
						<option value="NI">NICARAGUA - (NI)</option>
						<option value="NE">NIGER - (NE)</option>
						<option value="NG">NIGERIA - (NG)</option>
						<option value="NU">NIUE - (NU)</option>
						<option value="NF">NORFOLK ISLAND - (NF)</option>
						<option value="MP">NORTHERN MARIANA ISLANDS - (MP)</option>
						<option value="NO">NORWAY - (NO)</option>
						<option value="OM">OMAN - (OM)</option>
						<option value="PK">PAKISTAN - (PK)</option>
						<option value="PW">PALAU - (PW)</option>
						<option value="PS">PALESTINIAN TERRITORY, OCCUPIED - (PS)</option>
						<option value="PA">PANAMA - (PA)</option>
						<option value="PG">PAPUA NEW GUINEA - (PG)</option>
						<option value="PY">PARAGUAY - (PY)</option>
						<option value="PE">PERU - (PE)</option>
						<option value="PH">PHILIPPINES - (PH)</option>
						<option value="PN">PITCAIRN - (PN)</option>
						<option value="PL">POLAND - (PL)</option>
						<option value="PT">PORTUGAL - (PT)</option>
						<option value="PR">PUERTO RICO - (PR)</option>
						<option value="QA">QATAR - (QA)</option>
						<option value="RE">REUNION - (RE)</option>
						<option value="RO">ROMANIA - (RO)</option>
						<option value="RU">RUSSIAN FEDERATION - (RU)</option>
						<option value="RW">RWANDA - (RW)</option>
						<option value="SH">SAINT HELENA - (SH)</option>
						<option value="KN">SAINT KITTS AND NEVIS - (KN)</option>
						<option value="LC">SAINT LUCIA - (LC)</option>
						<option value="PM">SAINT PIERRE AND MIQUELON - (PM)</option>
						<option value="VC">SAINT VINCENT AND THE GRENADINES - (VC)</option>
						<option value="WS">SAMOA - (WS)</option>
						<option value="SM">SAN MARINO - (SM)</option>
						<option value="ST">SAO TOME AND PRINCIPE - (ST)</option>
						<option value="SA">SAUDI ARABIA - (SA)</option>
						<option value="SN">SENEGAL - (SN)</option>
						<option value="RS">SERBIA - (RS)</option>
						<option value="SC">SEYCHELLES - (SC)</option>
						<option value="SL">SIERRA LEONE - (SL)</option>
						<option value="SG">SINGAPORE - (SG)</option>
						<option value="SK">SLOVAKIA (SLOVAK REPUBLIC) - (SK)</option>
						<option value="SI">SLOVENIA - (SI)</option>
						<option value="SB">SOLOMON ISLANDS - (SB)</option>
						<option value="SO">SOMALIA - (SO)</option>
						<option value="ZA">SOUTH AFRICA - (ZA)</option>
						<option value="GS">SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS - (GS)</option>
						<option value="ES">SPAIN - (ES)</option>
						<option value="LK">SRI LANKA - (LK)</option>
						<option value="SD">SUDAN - (SD)</option>
						<option value="SR">SURINAME - (SR)</option>
						<option value="SJ">SVALBARD AND JAN MAYEN ISLANDS - (SJ)</option>
						<option value="SZ">SWAZILAND - (SZ)</option>
						<option value="SE">SWEDEN - (SE)</option>
						<option value="CH">SWITZERLAND - (CH)</option>
						<option value="SY">SYRIAN ARAB REPUBLIC - (SY)</option>
						<option value="TW">CHINESE TAIPEI - (TW)</option>
						<option value="TJ">TAJIKISTAN - (TJ)</option>
						<option value="TZ">UNITED REPUBLIC OF TANZANIA - (TZ)</option>
						<option value="TH">THAILAND - (TH)</option>
						<option value="TL">TIMOR-LIESTE - (TL)</option>
						<option value="TG">TOGO - (TG)</option>
						<option value="TK">TOKELAU - (TK)</option>
						<option value="TO">TONGA - (TO)</option>
						<option value="TT">TRINIDAD AND TOBAGO - (TT)</option>
						<option value="TN">TUNISIA - (TN)</option>
						<option value="TR">TURKEY - (TR)</option>
						<option value="TM">TURKMENISTAN - (TM)</option>
						<option value="TC">TURKS AND CAICOS ISLANDS - (TC)</option>
						<option value="TV">TUVALU - (TV)</option>
						<option value="UG">UGANDA - (UG)</option>
						<option value="UA">UKRAINE - (UA)</option>
						<option value="AE">UNITED ARAB EMIRATES - (AE)</option>
						<option value="GB">UNITED KINGDOM - (GB)</option>
						<option value="UM">UNITED STATES MINOR OUTLYING ISLANDS - (UM)</option>
						<option value="UY">URUGUAY - (UY)</option>
						<option value="UZ">UZBEKISTAN - (UZ)</option>
						<option value="VU">VANUATU - (VU)</option>
						<option value="VA">VATICAN CITY STATE (HOLY SEE) - (VA)</option>
						<option value="VE">VENEZUELA - (VE)</option>
						<option value="VN">VIET NAM - (VN)</option>
						<option value="VG">BRITISH VIRGIN ISLANDS - (VG)</option>
						<option value="VI">U.S. VIRGIN ISLANDS - (VI)</option>
						<option value="WF">WALLIS AND FUTUNA ISLANDS - (WF)</option>
						<option value="EH">WESTERN SAHARA - (EH)</option>
						<option value="YE">REPUBLIC OF YEMEN - (YE)</option>
						<option value="ZM">ZAMBIA - (ZM)</option>
						<option value="ZW">ZIMBABWE - (ZW)</option>
					</form:select>
				</td></tr>
--%>
				<tr>
			      <td class="leftalign"><label>Order Description: </label>
				        <form:input size="40" path="orderDescription" />
			        </td>
				</tr>
				<tr>
			      <td class="leftalign"><label>Currency Code: USD</label>
				        <form:hidden id="currencyCode" value="USD" path="currencyCode" />
			        </td>
				</tr>
				
				<form:hidden path="packageId" id="packageId" value="${paymentInformation.packageId}"/>
				<form:hidden path="packageName" id="packageName" value="${paymentInformation.packageName}"/>
				<form:hidden path="packagePrice" id="packagePrice" value="${paymentInformation.packagePrice}"/>
				<tr><td></td></tr>
				<tr>
					<td>
	                	By clicking Submit Payment Information below, you agree to our <a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/information?type=tu">Terms of Service</a> and <a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/information?type=pp">Privacy Policy</a> 
					</td>
				</tr>
				
				<tr>
					<td style="text-align: left; width: 150px;"><input
						type="submit" value="Submit Payment Information" name="submitPayment" id="submitPayment"
						style="text-decoration: none; font-size: 14px; background-color: lightblue;" />
					</td>
				</tr>
				</tbody>	
			</table>
		<!--  This section is opened in header_no_side.jsp -->
		<input type="hidden" name="processPayment" value="processPaymentNO"/>
		<input type="hidden" name="coachEmail" value="coachEmail" value="${coachEmail}"/>
		
	</form:form>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
