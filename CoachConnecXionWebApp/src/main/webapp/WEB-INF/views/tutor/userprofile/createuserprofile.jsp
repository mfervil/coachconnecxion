<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Create user profile</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Create a profile to become a Coach or Trainer" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

<link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css" />
<script type="text/javascript" src="jquery/jquery.wysiwyg.js"></script>
 
<script type="text/javascript">
	$(function()

	{

		$('#wysiwyg').wysiwyg();

	});
</script>
<script type="text/javascript">
	$(function()

	{

		$('#wysiwyg1').wysiwyg();

	});
	$(function()

			{

				$('#wysiwygskills').wysiwyg();

			});
</script>
<script type="text/javascript">
			$(function()

			{

				$('#wysiwygkeywords').wysiwyg();

			});
</script>

<script>
    $(document).ready(function(){
            $('#form').validate();
    })
</script>

<style>
label {font-size:14px;}
</style>
	
</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>
	
	<table>
	<tr>
	<td style="text-align: left;"><a href="https://www.coachconnecxion.com">&gt;&gt;Home</a></td>
	<td style="text-align: right;">
		                     <span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span>
	<%-- 
	<span id="siteseal" style="text-align:right"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span>
	--%>
	</td>
	</tr>
	</table>
			<br>
		<!-- CONTACT FORM -->
		<form:form method="post"  id="form" commandName="userProfile" enctype="multipart/form-data">
		<!-- <form action="#" id="page_user_profile_form" method="post"> -->
		<h3 style="color:red"> ${errorMessage} </h3>

	<h2 style="text-align: center;">Create/Update Your Profile</h2>									
	<table style="width: 900px;">
		<tr>
			<td style="width: 730px; padding: 5px;">
				<table>
					<tr>
						<td style="margin-top: 4px;"> <!-- style="margin-top -->
						

	<table style="border:1px solid black; width:100%; border-spacing: 40px 10px;" >	
				<tr><td class="leftalign" nowrap colspan="2" ><label>Upload Image/Logo: <b>${userProfile.profile_picture_name}</b></label> <input type="file" name="frmprofilepicture"
					id="frmprofilepicture" ></input></td> 
					<td class="leftalign" nowrap ><label>YouTube Video Link </label> <form:input size="25" path="video_url" /><br> <b>Link ex.: https://www.youtube.com/watch?v=1234 </b></td>
				</tr>
				<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
				<tr><td class="leftalign" nowrap><form:errors path="firstname"><br><form:errors path="firstname" cssClass="error" /><br></form:errors><label>*First Name:</label> <form:input size="25" path="firstname" /> </td> 
					<td class="leftalign" nowrap><form:errors path="middleinitial"><form:errors path="middleinitial" cssClass="error" /><br></form:errors><label>Middle Initial:</label> <form:input size="2" path="middleinitial" /> </td>
					<td class="leftalign" nowrap><form:errors path="lastname"><form:errors path="lastname" cssClass="error" /><br></form:errors><label>*Last Name:</label> <form:input size="25" path="lastname" /> </td>
				</tr>
				<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
				<tr><td class="leftalign" nowrap><form:errors path="displayName"><br><form:errors path="displayName" cssClass="error" /><br></form:errors><span class="required">*</span> <label>Display Name:</label> <form:input size="20" path="displayName" /> </td> 
					<td class="leftalign" nowrap><form:errors path="email"><form:errors path="email" cssClass="error" /><br></form:errors><span class="required">*</span> <label>Email:</label> <form:input size="25" path="email" /> </td>
					<td class="leftalign" nowrap><form:errors path="phone"><form:errors path="phone" cssClass="error" /><br></form:errors><span class="required">*</span><label>Phone:</label> <form:input size="25" path="phone" /> </td>
				</tr>
				<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
				<tr><td class="leftalign" nowrap colspan="2"><form:errors path="address"><br><form:errors path="address" cssClass="error" /><br></form:errors><span class="required">*</span><label>Address:</label> <form:input size="50" path="address" /> </td> 
					<td class="leftalign" nowrap><label>Suite/Apt #:</label> <form:input size="25" path="apartment" /> </td>
				</tr>
				<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
				<tr><td class="leftalign" nowrap><form:errors path="city"><br><form:errors path="city" cssClass="error" /><br></form:errors><span class="required">*</span><label>City:</label> <form:input size="25" path="city" /> </td> 
					<td class="leftalign" nowrap><form:errors path="state"><form:errors path="state" cssClass="error" /><br></form:errors><span class="required">*</span><label>State/Prov:</label> <%-- <form:input size="20" path="state" /> --%>
							<form:select size="1" path="state" id="state" ><option value="">SELECT YOUR STATE</option>
								${userProfile.state =='AL' ? "<option value='AL' selected>ALABAMA</option>" : "<option value='AL' >ALABAMA</option>"}
								${userProfile.state =='AK' ? "<option value='AK' selected>ALASKA</option>" :  "<option value='AK' >ALASKA</option>"}
								${userProfile.state =='AZ' ? "<option value='AZ' selected>ARIZONA</option>" :  "<option value='AZ' >ARIZONA</option>"}
								${userProfile.state =='AR' ? "<option value='AR' selected>ARKANSAS</option>" :  "<option value='AR' >ARKANSAS</option>"}
								${userProfile.state =='CA' ? "<option value='CA' selected>CALIFORNIA</option>" :  "<option value='CA' >CALIFORNIA</option>"}
								${userProfile.state =='CO' ? "<option value='CO' selected>COLORADO</option>" :  "<option value='CO' >COLORADO</option>"}
								${userProfile.state =='CT' ? "<option value='CT' selected>CONNECTICUT</option>" :  "<option value='CT' >CONNECTICUT</option>"}
								${userProfile.state =='DE' ? "<option value='DE' selected>DELAWARE</option>" :  "<option value='DE' >DELAWARE</option>"}
								${userProfile.state =='DC' ? "<option value='DC' selected>DISTRICT OF COLUMBIA</option>" :  "<option value='DC' >DISTRICT OF COLUMBIA</option>"}
								${userProfile.state =='FL' ? "<option value='FL' selected>FLORIDA</option>" :  "<option value='FL' >FLORIDA</option>"}
								${userProfile.state =='GA' ? "<option value='GA' selected>GEORGIA</option>" :  "<option value='GA' >GEORGIA</option>"}
								${userProfile.state =='HI' ? "<option value='HI' selected>HAWAII</option>" :  "<option value='HI' >HAWAII</option>"}
								${userProfile.state =='IL' ? "<option value='IL' selected>ILLINOIS</option>" :  "<option value='IL' >ILLINOIS</option>"}
								${userProfile.state =='ID' ? "<option value='ID' selected>IDAHO</option>" :  "<option value='ID' >IDAHO</option>"}
								${userProfile.state =='IN' ? "<option value='IN' selected>INDIANA</option>" :  "<option value='IN' >INDIANA</option>"}
								${userProfile.state =='IA' ? "<option value='IA' selected>IOWA</option>" :  "<option value='IA' >IOWA</option>"}
								${userProfile.state =='KS' ? "<option value='KS' selected>KANSAS</option>" :  "<option value='KS' >KANSAS</option>"}
								${userProfile.state =='KY' ? "<option value='KY' selected>KENTUCKY</option>" :  "<option value='KY' >KENTUCKY</option>"}
								${userProfile.state =='LA' ? "<option value='LA' selected>LOUISIANA</option>" :  "<option value='LA' >LOUISIANA</option>"}
								${userProfile.state =='ME' ? "<option value='ME' selected>MAINE</option>" :  "<option value='ME' >MAINE</option>"}
								${userProfile.state =='MD' ? "<option value='MD' selected>MARYLAND</option>" :  "<option value='MD' >MARYLAND</option>"}
								${userProfile.state =='MA' ? "<option value='MA' selected>MASSACHUSETTS</option>" :  "<option value='MA' >MASSACHUSETTS</option>"}
								${userProfile.state =='MI' ? "<option value='MI' selected>MICHIGAN</option>" :  "<option value='MI' >MICHIGAN</option>"}
								${userProfile.state =='MN' ? "<option value='MN' selected>MINNESOTA</option>" :  "<option value='MN' >MINNESOTA</option>"}
								${userProfile.state =='MS' ? "<option value='MS' selected>MISSISSIPPI</option>" :  "<option value='MS' >MISSISSIPPI</option>"}
								${userProfile.state =='MO' ? "<option value='MO' selected>MISSOURI</option>" :  "<option value='MO' >MISSOURI</option>"}
								${userProfile.state =='MI' ? "<option value='MT' selected>MONTANA</option>" :  "<option value='MI' >MONTANA</option>"}
								${userProfile.state =='NE' ? "<option value='NE' selected>NEBRASKA</option>" :  "<option value='NE' >NEBRASKA</option>"}
								${userProfile.state =='NV' ? "<option value='NV' selected>NEVADA</option>" :  "<option value='NV' >NEVADA</option>"}
								${userProfile.state =='NH' ? "<option value='NH' selected>NEW HAMPSHIRE</option>" :  "<option value='NH' >NEW HAMPSHIRE</option>"}
								${userProfile.state =='NJ' ? "<option value='NJ' selected>NEW JERSEY</option>" :  "<option value='NJ' >NEW JERSEY</option>"}
								${userProfile.state =='NM' ? "<option value='NM' selected>NEW MEXICO</option>" :  "<option value='MN' >NEW MEXICO</option>"}
								${userProfile.state =='NY' ? "<option value='NY' selected>NEW YORK</option>" :  "<option value='NY' >NEW YORK</option>"}
								${userProfile.state =='NC' ? "<option value='NC' selected>NORTH CAROLINA</option>" :  "<option value='NC' >NORTH CAROLINA</option>"}
								${userProfile.state =='ND' ? "<option value='ND' selected>NORTH DAKOTA</option>" :  "<option value='ND' >NORTH DAKOTA</option>"}
								${userProfile.state =='OH' ? "<option value='OH' selected>OHIO</option>" :  "<option value='OH' >OHIO</option>"}
								${userProfile.state =='OK' ? "<option value='OK' selected>OKLAHOMA</option>" :  "<option value='OK' >OKLAHOMA</option>"}
								${userProfile.state =='OR' ? "<option value='OR' selected>OREGON</option>" :  "<option value='OR' >OREGON</option>"}
								${userProfile.state =='PA' ? "<option value='PA' selected>PENNSYLVANIA</option>" :  "<option value='PA' >PENNSYLVANIA</option>"}
								${userProfile.state =='RI' ? "<option value='RI' selected>RHODE ISLAND</option>" :  "<option value='RI' >RHODE ISLAND</option>"}
								${userProfile.state =='SC' ? "<option value='SC' selected>SOUTH CAROLINA</option>" :  "<option value='SC' >SOUTH CAROLINA</option>"}
								${userProfile.state =='SD' ? "<option value='SD' selected>SOUTH DAKOTA</option>" :  "<option value='SD' >SOUTH DAKOTA</option>"}
								${userProfile.state =='TN' ? "<option value='TN' selected>TENNESSE</option>" :  "<option value='TN' >TENNESSE</option>"}
								${userProfile.state =='TX' ? "<option value='TX' selected>TEXAS</option>" :  "<option value='TX' >TEXAS</option>"}
								${userProfile.state =='UT' ? "<option value='UT' selected>UTAH</option>" :  "<option value='UT' >UTAH</option>"}
								${userProfile.state =='VI' ? "<option value='VT' selected>VERMONT</option>" :  "<option value='VT' >VERMONT</option>"}
								${userProfile.state =='VA' ? "<option value='VA' selected>VIRGINIA</option>" :  "<option value='VA' >VIRGINIA</option>"}
								${userProfile.state =='WA' ? "<option value='WA' selected>WASHINGTON</option>" :  "<option value='WA' >WASHINGTON</option>"}
								${userProfile.state =='WV' ? "<option value='WV' selected>WEST VIRGINIA</option>" :  "<option value='WV' >WEST VIRGINIA</option>"}
								${userProfile.state =='WI' ? "<option value='WI' selected>WISCONSIN</option>" :  "<option value='WI' >WISCONSIN</option>"}
								${userProfile.state =='WY' ? "<option value='WY' selected>WYOMING</option>" :  "<option value='WY' >WYOMING</option>"}
								${userProfile.state =='AB' ? "<option value='AB' selected>ALBERTA</option>" :  "<option value='AB' >ALBERTA</option>"}
								${userProfile.state =='AS' ? "<option value='AS' selected>AMERICAN SAMOA</option>" :  "<option value='AS' >AMERICAN SAMOA</option>"}
								${userProfile.state =='BC' ? "<option value='BC' selected>BRITISH COLUMBIA</option>" :  "<option value='BC' >BRITISH COLUMBIA</option>"}
								${userProfile.state =='GU' ? "<option value='GU' selected>GUAM</option>" :  "<option value='GU' >GUAM</option>"}
								${userProfile.state =='LB' ? "<option value='LB' selected>LABRADOR</option>" :  "<option value='LB' >LABRADOR</option>"}
								${userProfile.state =='MB' ? "<option value='MB' selected>MANITOBA</option>" :  "<option value='MB' >MANITOBA</option>"}
								${userProfile.state =='MM' ? "<option value='MM' selected>MEXICO</option>" :  "<option value='MM' >MEXICO</option>"}
								${userProfile.state =='NB' ? "<option value='NB' selected>NEW BRUNSWICK</option>" :  "<option value='NB' >NEW BRUNSWICK</option>"}
								${userProfile.state =='NF' ? "<option value='NF' selected>NEWFOUNDLAND</option>" :  "<option value='NF' >NEWFOUNDLAND</option>"}
								${userProfile.state =='NT' ? "<option value='NT' selected>NORTHWEST TERRITORY</option>" :  "<option value='NT' >NORTHWEST TERRITORY</option>"}
								${userProfile.state =='NS' ? "<option value='NS' selected>NOVA SCOTIA</option>" :  "<option value='NS' >NOVA SCOTIA</option>"}
								${userProfile.state =='ON' ? "<option value='ON' selected>ONTARIO</option>" :  "<option value='ON' >ONTARIO</option>"}
								${userProfile.state =='CZ' ? "<option value='CZ' selected>PANAMA CANAL ZONE</option>" :  "<option value='CZ' >PANAMA CANAL ZONE</option>"}
								${userProfile.state =='PE' ? "<option value='PE' selected>PRINCE EDWARD ISLAND</option>" :  "<option value='PE' >PRINCE EDWARD ISLAND</option>"}
								${userProfile.state =='PR' ? "<option value='PR' selected>PUERTO RICO</option>" :  "<option value='PR' >PUERTO RICO</option>"}
								${userProfile.state =='PQ' ? "<option value='PQ' selected>QUEBEC</option>" :  "<option value='PQ' >QUEBEC</option>"}
								${userProfile.state =='SK' ? "<option value='SK' selected>SASKATCHEWAN</option>" :  "<option value='SK' >SASKATCHEWAN</option>"}
								${userProfile.state =='VI' ? "<option value='VI' selected>VIRGIN ISLANDS</option>" :  "<option value='VI' >VIRGIN ISLANDS</option>"}
								${userProfile.state =='YT' ? "<option value='YT' selected>YUKEN</option>" :  "<option value='YT' >YUKEN</option>"}
						</form:select>					
					
					</td>
					<td class="leftalign" nowrap><form:errors path="zipcode"><form:errors path="zipcode" cssClass="error" /><br></form:errors><span class="required">*</span><label>Zipcode:</label> <form:input size="25" path="zipcode" /> </td>
				</tr>
				<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
				<tr>
					<td class="leftalign" nowrap><form:errors path="dobmonth"><form:errors path="dobmonth" cssClass="error" /><br></form:errors><span class="required">*</span>
					 <label>Birth Date: </label> 
				        <form:select size="1" path="dobmonth" id="dobmonth" >
				          <option selected  value="-1">Month</option>
				          ${userProfile.dobmonth =='1' ? "<option value='1' selected>Jan</option>" : "<option value='1' >Jan</option>"}
				          ${userProfile.dobmonth =='2' ? "<option value='2' selected>Feb</option>" : "<option value='2' >Feb</option>"}
				          ${userProfile.dobmonth =='3' ? "<option value='3' selected>Mar</option>" : "<option value='3' >Mar</option>"}
				          ${userProfile.dobmonth =='4' ? "<option value='4' selected>Apr</option>" : "<option value='4' >Apr</option>"}
				          ${userProfile.dobmonth =='5' ? "<option value='5' selected>May</option>" : "<option value='5' >May</option>"}
				          ${userProfile.dobmonth =='6' ? "<option value='6' selected>Jun</option>" : "<option value='6' >Jun</option>"}
				          ${userProfile.dobmonth =='7' ? "<option value='7' selected>Jul</option>" : "<option value='7' >Jul</option>"}
				          ${userProfile.dobmonth =='8' ? "<option value='8' selected>Aug</option>" : "<option value='8' >Aug</option>"}
				          ${userProfile.dobmonth =='9' ? "<option value='9' selected>Sep</option>" : "<option value='9' >Sep</option>"}
				          ${userProfile.dobmonth =='10' ? "<option value='10' selected>Oct</option>" : "<option value='10' >Oct</option>"}
				          ${userProfile.dobmonth =='11' ? "<option value='11' selected>Nov</option>" : "<option value='11' >Nov</option>"}
				          ${userProfile.dobmonth =='12' ? "<option value='12' selected>Dec</option>" : "<option value='12' >Dec</option>"}
				        </form:select>  
				        <form:select size="1" path="dobday" id="dobday" >
				          <option selected  value="-1">Day</option>
				          ${userProfile.dobday =='1' ? "<option value='1' selected>1</option>" : "<option value='1' >1</option>"}
				          ${userProfile.dobday =='2' ? "<option value='2' selected>2</option>" : "<option value='2' >2</option>"}
				          ${userProfile.dobday =='3' ? "<option value='3' selected>3</option>" : "<option value='3' >3</option>"}
				          ${userProfile.dobday =='4' ? "<option value='4' selected>4</option>" : "<option value='4' >4</option>"}
				          ${userProfile.dobday =='5' ? "<option value='5' selected>5</option>" : "<option value='5' >5</option>"}
				          ${userProfile.dobday =='6' ? "<option value='6' selected>6</option>" : "<option value='6' >6</option>"}
				          ${userProfile.dobday =='7' ? "<option value='7' selected>7</option>" : "<option value='7' >7</option>"}
				          ${userProfile.dobday =='8' ? "<option value='8' selected>8</option>" : "<option value='8' >8</option>"}
				          ${userProfile.dobday =='9' ? "<option value='9' selected>9</option>" : "<option value='9' >9</option>"}
				          ${userProfile.dobday =='10' ? "<option value='10' selected>10</option>" : "<option value='10' >10</option>"}
				          ${userProfile.dobday =='11' ? "<option value='11' selected>11</option>" : "<option value='11' >11</option>"}
				          ${userProfile.dobday =='12' ? "<option value='12' selected>12</option>" : "<option value='12' >12</option>"}
				          ${userProfile.dobday =='13' ? "<option value='13' selected>13</option>" : "<option value='13' >13</option>"}
				          ${userProfile.dobday =='14' ? "<option value='14' selected>14</option>" : "<option value='14' >14</option>"}
				          ${userProfile.dobday =='15' ? "<option value='15' selected>15</option>" : "<option value='15' >15</option>"}
				          ${userProfile.dobday =='16' ? "<option value='16' selected>16</option>" : "<option value='16' >16</option>"}
				          ${userProfile.dobday =='17' ? "<option value='17' selected>17</option>" : "<option value='17' >17</option>"}
				          ${userProfile.dobday =='18' ? "<option value='18' selected>18</option>" : "<option value='18' >18</option>"}
				          ${userProfile.dobday =='19' ? "<option value='19' selected>19</option>" : "<option value='19' >19</option>"}
				          ${userProfile.dobday =='20' ? "<option value='20' selected>20</option>" : "<option value='20' >20</option>"}
				          ${userProfile.dobday =='21' ? "<option value='21' selected>21</option>" : "<option value='21' >21</option>"}
				          ${userProfile.dobday =='22' ? "<option value='22' selected>22</option>" : "<option value='22' >22</option>"}
				          ${userProfile.dobday =='23' ? "<option value='23' selected>23</option>" : "<option value='23' >23</option>"}
				          ${userProfile.dobday =='24' ? "<option value='24' selected>24</option>" : "<option value='24' >24</option>"}
				          ${userProfile.dobday =='25' ? "<option value='25' selected>25</option>" : "<option value='25' >25</option>"}
				          ${userProfile.dobday =='26' ? "<option value='26' selected>26</option>" : "<option value='26' >26</option>"}
				          ${userProfile.dobday =='27' ? "<option value='27' selected>27</option>" : "<option value='27' >27</option>"}
				          ${userProfile.dobday =='28' ? "<option value='28' selected>28</option>" : "<option value='28' >28</option>"}
				          ${userProfile.dobday =='29' ? "<option value='29' selected>29</option>" : "<option value='29' >29</option>"}
				          ${userProfile.dobday =='30' ? "<option value='30' selected>30</option>" : "<option value='30' >30</option>"}
				          ${userProfile.dobday =='31' ? "<option value='31' selected>31</option>" : "<option value='31' >31</option>"}
				        </form:select>  
				        <form:select size="1" path="dobyear" id="dobyear" >
				          <option selected  value="-1">Year</option>
				          <c:forEach var="i" begin="10" end="90">
				          	<c:if test="${userProfile.dobyear == year - i }">
				          		<option value='${year - i}' selected>${year - i}</option>
				          	</c:if>
				          	<c:if test="${userProfile.dobyear != year - i }">
				          		<option value='${year - i}' >${year - i}</option>
				          	</c:if>
				          </c:forEach>
				        </form:select>  

					</td>
					<td class="leftalign" nowrap><form:errors path="gender"><form:errors path="gender" cssClass="error" /><br></form:errors><span class="required">*</span>
						<label>Gender</label>  
				        <form:select size="1" path="gender" id="gender" >
				          <option selected  value="-1">Select Gender</option>
				          ${userProfile.gender =='m' ? "<option value='m' selected>Male</option>" : "<option value='m' >Male</option>"}
				          ${userProfile.gender =='f' ? "<option value='f' selected>Female</option>" : "<option value='f' >Female</option>"}
				        </form:select>  
					</td>
					<td class="leftalign" nowrap><form:errors path="experience"><form:errors path="experience" cssClass="error" /><br></form:errors><span class="required">*</span>
						<label>Experience</label>
				        <form:select size="1" path="experience" id="experience" >
				          <option selected  value="-1">Select Experience</option>
				          ${userProfile.experience =='1' ? "<option value='1' selected>1 year</option>" : "<option value='1' >1 year</option>"}
				          ${userProfile.experience =='2' ? "<option value='2' selected>2 years</option>" : "<option value='2' >2 years</option>"}
				          ${userProfile.experience =='3' ? "<option value='3' selected>3 years</option>" : "<option value='3' >3 years</option>"}
				          ${userProfile.experience =='4' ? "<option value='4' selected>4 years</option>" : "<option value='4' >4 years</option>"}
				          ${userProfile.experience =='5' ? "<option value='5' selected>5 years</option>" : "<option value='5' >5 years</option>"}
				          ${userProfile.experience =='6' ? "<option value='6' selected>6 years</option>" : "<option value='6' >6 years</option>"}
				          ${userProfile.experience =='7' ? "<option value='7' selected>7 years</option>" : "<option value='7' >7 years</option>"}
				          ${userProfile.experience =='8' ? "<option value='8' selected>8 years</option>" : "<option value='8' >8 years</option>"}
				          ${userProfile.experience =='9' ? "<option value='9' selected>9 years</option>" : "<option value='9' >9 years</option>"}
				          ${userProfile.experience =='10' ? "<option value='10' selected>10 years</option>" : "<option value='10' >10 years</option>"}
				          ${userProfile.experience =='11' ? "<option value='11' selected>11 years</option>" : "<option value='11' >11 years</option>"}
				          ${userProfile.experience =='12' ? "<option value='12' selected>12 years</option>" : "<option value='12' >12 years</option>"}
				          ${userProfile.experience =='13' ? "<option value='13' selected>13 years</option>" : "<option value='13' >13 years</option>"}
				          ${userProfile.experience =='14' ? "<option value='14' selected>14 years</option>" : "<option value='14' >14 years</option>"}
				          ${userProfile.experience =='15' ? "<option value='15' selected>15 years</option>" : "<option value='15' >15 years</option>"}
				          ${userProfile.experience =='16' ? "<option value='16' selected>16 years</option>" : "<option value='16' >16 years</option>"}
				          ${userProfile.experience =='17' ? "<option value='17' selected>17 years</option>" : "<option value='17' >17 years</option>"}
				          ${userProfile.experience =='18' ? "<option value='18' selected>18 years</option>" : "<option value='18' >18 years</option>"}
				          ${userProfile.experience =='19' ? "<option value='19' selected>19 years</option>" : "<option value='19' >19 years</option>"}
				          ${userProfile.experience =='20' ? "<option value='20' selected>20 years</option>" : "<option value='20' >20 years</option>"}
				          ${userProfile.experience =='21' ? "<option value='&gt; 20' selected>&gt 20 years</option>" : "<option value='21' >&gt; 20 years</option>"}
				        </form:select>  
					</td>
				</tr>
	</table>
	<hr>
	<br>
	<table style="border:1px solid black;">			
				<tr><td class="leftalign" nowrap>
					    <form:errors path="coachstyleinperson"><form:errors path="coachstyleinperson" cssClass="error" /><br></form:errors><span class="required">*</span>	
					    <label>How do you coach:</label> 
				            <form:checkbox path="coachstyleonline" value="1" />Online
				            <form:checkbox path="coachstyleinperson" value="1" />In-Person
				    </td>
				    
			      <td class="leftalign" nowrap>
			      		<form:errors path="hourlyrate"><form:errors path="hourlyrate" cssClass="error" /><br></form:errors><span class="required">*</span> 
					<label>Hourly Rate: </label>
			        	<form:select size="1" path="hourlyrate" >
			          	<option selected  value="-1">Select Your Rate</option>
			          	${userProfile.hourlyrate =='10' ? "<option value='10' selected>10</option>" : "<option value='10' >10</option>"}
			          	${userProfile.hourlyrate =='15' ? "<option value='15' selected>15</option>" : "<option value='15' >15</option>"}
			          	${userProfile.hourlyrate =='20' ? "<option value='20' selected>20</option>" : "<option value='20' >20</option>"}
			          	${userProfile.hourlyrate =='25' ? "<option value='25' selected>25</option>" : "<option value='25' >25</option>"}
			          	${userProfile.hourlyrate =='30' ? "<option value='30' selected>30</option>" : "<option value='30' >30</option>"}
			          	${userProfile.hourlyrate =='35' ? "<option value='35' selected>35</option>" : "<option value='35' >35</option>"}
			          	${userProfile.hourlyrate =='40' ? "<option value='40' selected>40</option>" : "<option value='40' >40</option>"}
			          	${userProfile.hourlyrate =='45' ? "<option value='45' selected>45</option>" : "<option value='45' >45</option>"}
			          	${userProfile.hourlyrate =='50' ? "<option value='50' selected>50</option>" : "<option value='50' >50</option>"}
			          	${userProfile.hourlyrate =='55' ? "<option value='55' selected>55</option>" : "<option value='55' >55</option>"}
			          	${userProfile.hourlyrate =='60' ? "<option value='60' selected>60</option>" : "<option value='60' >60</option>"}
			          	${userProfile.hourlyrate =='65' ? "<option value='65' selected>65</option>" : "<option value='65' >65</option>"}
			          	${userProfile.hourlyrate =='70' ? "<option value='70' selected>70</option>" : "<option value='70' >70</option>"}
			          	${userProfile.hourlyrate =='75' ? "<option value='75' selected>75</option>" : "<option value='75' >75</option>"}
			          	${userProfile.hourlyrate =='80' ? "<option value='80' selected>80</option>" : "<option value='80' >80</option>"}
			          	${userProfile.hourlyrate =='85' ? "<option value='85' selected>85</option>" : "<option value='85' >85</option>"}
			          	${userProfile.hourlyrate =='90' ? "<option value='90' selected>90</option>" : "<option value='90' >90</option>"}
			          	${userProfile.hourlyrate =='95' ? "<option value='95' selected>95</option>" : "<option value='95' >95</option>"}
			          	${userProfile.hourlyrate =='100' ? "<option value='100' selected>100</option>" : "<option value='100' >100</option>"}
			          	${userProfile.hourlyrate =='105' ? "<option value='105' selected>105</option>" : "<option value='105' >105</option>"}
			          	${userProfile.hourlyrate =='110' ? "<option value='110' selected>110</option>" : "<option value='110' >110</option>"}
			          	${userProfile.hourlyrate =='115' ? "<option value='115' selected>115</option>" : "<option value='115' >115</option>"}
			          	${userProfile.hourlyrate =='120' ? "<option value='120' selected>120</option>" : "<option value='120' >120</option>"}
			          	${userProfile.hourlyrate =='125' ? "<option value='125' selected>125</option>" : "<option value='125' >125</option>"}
			          	${userProfile.hourlyrate =='130' ? "<option value='130' selected>130</option>" : "<option value='130' >130</option>"}
			          	${userProfile.hourlyrate =='135' ? "<option value='135' selected>135</option>" : "<option value='135' >135</option>"}
			          	${userProfile.hourlyrate =='140' ? "<option value='140' selected>140</option>" : "<option value='140' >140</option>"}
			          	${userProfile.hourlyrate =='145' ? "<option value='145' selected>145</option>" : "<option value='145' >145</option>"}
			          	${userProfile.hourlyrate =='150' ? "<option value='150' selected>150</option>" : "<option value='150' >150</option>"}
			          	${userProfile.hourlyrate =='155' ? "<option value='155' selected>155</option>" : "<option value='155' >155</option>"}
			          	${userProfile.hourlyrate =='160' ? "<option value='160' selected>160</option>" : "<option value='160' >160</option>"}
			          	${userProfile.hourlyrate =='165' ? "<option value='165' selected>165</option>" : "<option value='165' >165</option>"}
			          	${userProfile.hourlyrate =='170' ? "<option value='170' selected>170</option>" : "<option value='170' >170</option>"}
			          	${userProfile.hourlyrate =='175' ? "<option value='175' selected>175</option>" : "<option value='175' >175</option>"}
			          	${userProfile.hourlyrate =='180' ? "<option value='180' selected>180</option>" : "<option value='180' >180</option>"}
			          	${userProfile.hourlyrate =='185' ? "<option value='185' selected>185</option>" : "<option value='185' >185</option>"}
			          	${userProfile.hourlyrate =='190' ? "<option value='190' selected>190</option>" : "<option value='190' >190</option>"}
			          	${userProfile.hourlyrate =='195' ? "<option value='195' selected>195</option>" : "<option value='195' >195</option>"}
			          	${userProfile.hourlyrate =='200' ? "<option value='200' selected>200</option>" : "<option value='200' >200</option>"}
			          	
					</form:select> 
			      </td> 
				    
				</tr>

				<tr><td class="leftalign" nowrap colspan="3">
					    <form:errors path="lvlelementary" cssClass="error" /><br><span class="required">*</span>
					    <label>Levels:</label> 
				            <form:checkbox path="lvlelementary" value="1" />Elementary (K - 6)
				            <form:checkbox path="lvljuniorhigh" value="1" />Junior High (6 - 8)
				            <form:checkbox path="lvlhighschool" value="1" />High School (8 - 12)
				            <form:checkbox path="lvlcollege" value="1" />College 
				            <form:checkbox path="lvlprofessional" value="1" />Professional
				            <form:checkbox path="lvlleisure" value="1" />Leisure
				</td></tr>

			    <tr>
			    	<td class="leftalign" nowrap><form:errors path="coachingcategory1" cssClass="error" /><br><label>*Subject 1</label><br>
				        <form:select size="1" path="coachingcategory1" id="coachingcategory1" >
				          <option selected  value="-1">Select a Subject</option>
				          ${userProfile.coachingcategory1 =='1010' ? "<option value='1010' selected>Art</option>" : "<option value='1010' >Art</option>"}
				          ${userProfile.coachingcategory1 =='1020' ? "<option value='1020' selected>Business</option>" : "<option value='1020' >Business</option>"}
				          ${userProfile.coachingcategory1 =='1030' ? "<option value='1030' selected>Computer Bs. (Word, Excel, Etc..)</option>" : "<option value='1030' >Computer Bs. (Word, Excel, Etc..)</option>"}
				          ${userProfile.coachingcategory1 =='1040' ? "<option value='1040' selected>Computer prog. (Java, .Net, etc..)</option>" : "<option value='1040' >Computer prog. (Java, .Net, etc..)</option>"}
				          ${userProfile.coachingcategory1 =='1050' ? "<option value='1050' selected>Communication</option>" : "<option value='1050' >Communication</option>"}
				          ${userProfile.coachingcategory1 =='1060' ? "<option value='1060' selected>English</option>" : "<option value='1060' >English</option>"}
				          ${userProfile.coachingcategory1 =='1070' ? "<option value='1070' selected>History</option>" : "<option value='1070' >History</option>"}
				          ${userProfile.coachingcategory1 =='1080' ? "<option value='1080' selected>Homeschool</option>" : "<option value='1080' >Homeschool</option>"}
				          ${userProfile.coachingcategory1 =='1090' ? "<option value='1090' selected>Language</option>" : "<option value='1090' >Language</option>"}
				          ${userProfile.coachingcategory1 =='1100' ? "<option value='1100' selected>Math</option>" : "<option value='1100' >Math</option>"}
				          ${userProfile.coachingcategory1 =='1110' ? "<option value='1110' selected>Music</option>" : "<option value='1110' >Music</option>"}
				          ${userProfile.coachingcategory1 =='1120' ? "<option value='1120' selected>Science</option>" : "<option value='1120' >Science</option>"}
				          ${userProfile.coachingcategory1 =='1130' ? "<option value='1130' selected>Special Needs (ADD, ADHD, etc..)</option>" : "<option value='1130' >Special Needs (ADD, ADHD, etc..)</option>"}
				          ${userProfile.coachingcategory1 =='1140' ? "<option value='1140' selected>Test Prep.((SAT, ACT, GMAT, etc..)</option>" : "<option value='1140' >Test Prep.((SAT, ACT, GMAT, etc..)</option>"}
				        </form:select>
			        </td>
		    		<td class="leftalign" nowrap><br><label>Subject 2</label><br>
				        <form:select size="1" path="coachingcategory2" id="coachingcategory2" >
				          <option selected  value="-1">Select a Subject</option>
				          ${userProfile.coachingcategory2 =='1010' ? "<option value='1010' selected>Art</option>" : "<option value='1010' >Art</option>"}
				          ${userProfile.coachingcategory2 =='1020' ? "<option value='1020' selected>Business</option>" : "<option value='1020' >Business</option>"}
				          ${userProfile.coachingcategory2 =='1030' ? "<option value='1030' selected>Computer Bs. (Word, Excel, Etc..)</option>" : "<option value='1030' >Computer Bs. (Word, Excel, Etc..)</option>"}
				          ${userProfile.coachingcategory2 =='1040' ? "<option value='1040' selected>Computer prog. (Java, .Net, etc..)</option>" : "<option value='1040' >Computer prog. (Java, .Net, etc..)</option>"}
				          ${userProfile.coachingcategory2 =='1050' ? "<option value='1050' selected>Communication</option>" : "<option value='1050' >Communication</option>"}
				          ${userProfile.coachingcategory2 =='1060' ? "<option value='1060' selected>English</option>" : "<option value='1060' >English</option>"}
				          ${userProfile.coachingcategory2 =='1070' ? "<option value='1070' selected>History</option>" : "<option value='1070' >History</option>"}
				          ${userProfile.coachingcategory2 =='1080' ? "<option value='1080' selected>Homeschool</option>" : "<option value='1080' >Homeschool</option>"}
				          ${userProfile.coachingcategory2 =='1090' ? "<option value='1090' selected>Language</option>" : "<option value='1090' >Language</option>"}
				          ${userProfile.coachingcategory2 =='1100' ? "<option value='1100' selected>Math</option>" : "<option value='1100' >Math</option>"}
				          ${userProfile.coachingcategory2 =='1110' ? "<option value='1110' selected>Music</option>" : "<option value='1110' >Music</option>"}
				          ${userProfile.coachingcategory2 =='1120' ? "<option value='1120' selected>Science</option>" : "<option value='1120' >Science</option>"}
				          ${userProfile.coachingcategory2 =='1130' ? "<option value='1130' selected>Special Needs (ADD, ADHD, etc..)</option>" : "<option value='1130' >Special Needs (ADD, ADHD, etc..)</option>"}
				          ${userProfile.coachingcategory2 =='1140' ? "<option value='1140' selected>Test Prep.((SAT, ACT, GMAT, etc..)</option>" : "<option value='1140' >Test Prep.((SAT, ACT, GMAT, etc..)</option>"}
				        </form:select>
			        </td>
		    		<td class="leftalign" nowrap><br><label>Subject 3</label><br>
				        <form:select size="1" path="coachingcategory3" id="coachingcategory3" >
				          <option selected  value="-1">Select a Subject</option>
				          ${userProfile.coachingcategory3 =='1010' ? "<option value='1010' selected>Art</option>" : "<option value='1010' >Art</option>"}
				          ${userProfile.coachingcategory3 =='1020' ? "<option value='1020' selected>Business</option>" : "<option value='1020' >Business</option>"}
				          ${userProfile.coachingcategory3 =='1030' ? "<option value='1030' selected>Computer Bs. (Word, Excel, Etc..)</option>" : "<option value='1030' >Computer Bs. (Word, Excel, Etc..)</option>"}
				          ${userProfile.coachingcategory3 =='1040' ? "<option value='1040' selected>Computer prog. (Java, .Net, etc..)</option>" : "<option value='1040' >Computer prog. (Java, .Net, etc..)</option>"}
				          ${userProfile.coachingcategory3 =='1050' ? "<option value='1050' selected>Communication</option>" : "<option value='1050' >Communication</option>"}
				          ${userProfile.coachingcategory3 =='1060' ? "<option value='1060' selected>English</option>" : "<option value='1060' >English</option>"}
				          ${userProfile.coachingcategory3 =='1070' ? "<option value='1070' selected>History</option>" : "<option value='1070' >History</option>"}
				          ${userProfile.coachingcategory3 =='1080' ? "<option value='1080' selected>Homeschool</option>" : "<option value='1080' >Homeschool</option>"}
				          ${userProfile.coachingcategory3 =='1090' ? "<option value='1090' selected>Language</option>" : "<option value='1090' >Language</option>"}
				          ${userProfile.coachingcategory3 =='1100' ? "<option value='1100' selected>Math</option>" : "<option value='1100' >Math</option>"}
				          ${userProfile.coachingcategory3 =='1110' ? "<option value='1110' selected>Music</option>" : "<option value='1110' >Music</option>"}
				          ${userProfile.coachingcategory3 =='1120' ? "<option value='1120' selected>Science</option>" : "<option value='1120' >Science</option>"}
				          ${userProfile.coachingcategory3 =='1130' ? "<option value='1130' selected>Special Needs (ADD, ADHD, etc..)</option>" : "<option value='1130' >Special Needs (ADD, ADHD, etc..)</option>"}
				          ${userProfile.coachingcategory3 =='1140' ? "<option value='1140' selected>Test Prep.((SAT, ACT, GMAT, etc..)</option>" : "<option value='1140' >Test Prep.((SAT, ACT, GMAT, etc..)</option>"}
				        </form:select>			    	
			    	</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="leftalign" colspan="3"> <label>Classes: List all classes you are capable of tutoring (ex. algebra, chemistry, anatomy, etc...)</label> 
							<form:errors path="skillsExpertise" cssClass="error" />
							<form:textarea rows="2" cols="100" name="wysiwygskills"
							id="wysiwygskills" path="skillsExpertise" /> 
						</td>
					</tr>

				<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="leftalign" colspan="3"> <label>Availability: Update your availability to tutor below</label> 
							<form:errors path="availability" cssClass="error" />
							<form:textarea rows="6" cols="100" name="wysiwygskills"
							id="wysiwygskills" path="availability" /> 
						</td>
				</tr>

				</table>
				<%-- 
				<table>
					<tr>
						<td class="leftalign" colspan="3"> <label>Classes: List all classes you are capable of tutoring (ex. algebra 1, algebra 2, chemistry, anatomy, etc...)</label> <form:errors path="skillsExpertise" cssClass="error" />
						<font style="font-size: 14px; color: red;"><form:errors path="skillsExpertise" cssClass="error" /></font><br> 
							<form:textarea rows="2" cols="100" name="wysiwygskills"
							id="wysiwygskills" path="skillsExpertise" /> 
						</td>
					</tr>
				</table>
				--%>
				<hr>
				<br>
				<table>
				<tr>
					<td class="leftalign" > <label>Overview / Bio: Provide an overview of your background, and what makes you the ideal tutor </label> <font style="font-size: 14px; color: red;"> <form:errors path="overview" cssClass="error" /></font><br>
						<form:textarea  name="wysiwyg" class="required" cols="100"
						id="wysiwyg" rows="10" path="overview" value="&nbsp;"/> 
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>	
				<td class="leftalign" nowrap> <label>Qualifications: Detail out what qualifies you to tutor in each of the subjects you've selected</label>  
				<font style="font-size: 14px; color: red;"><form:errors path="serviceDescription" cssClass="error" /></font> <br>
					<div style="height: 10px;"></div>
					<form:textarea name="wysiwyg1" class="required" cols="100"
					 id="wysiwyg1" rows="10" path="serviceDescription" value="&nbsp;"/>
				</td>
<%--
				</tr>	
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td class="leftalign" > <label>Skills Expertise: Describe your skills in detail</label> <form:errors path="skillsExpertise" cssClass="error" />
					<font style="font-size: 14px; color: red;"><form:errors path="skillsExpertise" cssClass="error" /></font><br> 
						<form:textarea rows="10" cols="100" name="wysiwygskills"
						id="wysiwygskills" path="skillsExpertise" /> 
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td class="leftalign" ><label>Keywords: List all the possible keywords that can be used to find you</label> 
					<font style="font-size: 14px; color: red;"><form:errors path="keywords" cssClass="error" /></font><br>
						<form:textarea rows="10"  cols="100" name="wysiwygkeywords"
						id="wysiwygkeywords" path="keywords" /> 
					</td>
				</tr>
--%>				
			</table>
			<table>
				<tr>
					<td class="leftalign">
						<input type="submit" class="input-button" value="CANCEL" />
						<input type="submit" class="input-button" value="SUBMIT" />
					</td>
				</tr>
			</table>

 							
						</td> <!-- End style="margin-top -->
					</tr>

				</table>			
			</td>
		</table>
		<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>
		<input type="hidden" name="profile_picture_type" id="profile_picture_type" value="${userProfile.profile_picture_type}"></input>
		<input type="hidden" name="profile_picture_name" id="profile_picture_name" value="${userProfile.profile_picture_name}"></input>
		</form:form>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>