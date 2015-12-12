<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
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

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>
	
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

	<h2 style="text-align: center;">Create/Update Your Coaching Profile</h2>									
	<table style="width: 900px;">
		<tr>
			<td style="width: 730px; padding: 5px;">
				<table>
					<tr>
						<td style="margin-top: 4px;"> <!-- style="margin-top -->
						

	<table style="border:1px solid black; width:100%">	
				<%-- <tr><td colspan="2" ><label style="font-size:20px;">PROFILE INFORMATION</label></td> </tr>  --%>
				<tr><td class="leftalign" nowrap colspan="2" ><label>Upload Image/Logo: <b>${userProfile.profile_picture_name}</b></label> <input type="file" name="frmprofilepicture"
					id="frmprofilepicture" ></input></td> 
					<td class="leftalign" nowrap ><label>YouTube Video Link </label> <form:input size="25" path="video_url" /><br> <b>Link ex.: https://www.youtube.com/watch?v=1234 </b></td>
				</tr>
				<tr><td class="leftalign" nowrap><form:errors path="firstname"><form:errors path="firstname" cssClass="error" /><br></form:errors><label>*First Name:</label> <form:input size="25" path="firstname" /> </td> 
					<td class="leftalign" nowrap><form:errors path="middleinitial"><form:errors path="middleinitial" cssClass="error" /><br></form:errors><label>Middle Initial:</label> <form:input size="2" maxlength="2" path="middleinitial" /> </td>
					<td class="leftalign" nowrap><form:errors path="lastname"><form:errors path="lastname" cssClass="error" /><br></form:errors><label>*Last Name:</label> <form:input size="25" path="lastname" /> </td>
				</tr>
				<tr><td class="leftalign" nowrap><form:errors path="displayName"><form:errors path="displayName" cssClass="error" /><br></form:errors><span class="required">*</span> <label>Display Name:</label> <form:input size="20" path="displayName" /> </td> 
					<td class="leftalign" nowrap><form:errors path="email"><form:errors path="email" cssClass="error" /><br></form:errors><span class="required">*</span> <label>Email:</label> <form:input size="25" path="email" /> </td>
					<td class="leftalign" nowrap><form:errors path="phone"><form:errors path="phone" cssClass="error" /><br></form:errors><span class="required">*</span><label>Phone:</label> <form:input size="25" path="phone" /> </td>
				</tr>
				<tr><td class="leftalign" nowrap colspan="2"><form:errors path="address"><form:errors path="address" cssClass="error" /><br></form:errors><span class="required">*</span><label>Address:</label> <form:input size="50" path="address" /> </td> 
					<td class="leftalign" nowrap><label>Suite/Apt #:</label> <form:input size="25" path="apartment" /> </td>
				</tr>
				<tr><td class="leftalign" nowrap><form:errors path="city"><form:errors path="city" cssClass="error" /><br></form:errors><span class="required">*</span><label>City:</label> <form:input size="25" path="city" /> </td> 
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
	</table>
	<hr>
	<br>
	<table style="border:1px solid black;">			
			    <tr>
			    	<td class="leftalign" nowrap><form:errors path="coachingcategory1" cssClass="error" /><br><label>*Coaching Categories</label><br>
				        <form:select size="1" path="coachingcategory1" id="coachingcategory1" >
				          <option selected  value="-1">Select a Category</option>
				          ${userProfile.coachingcategory1 =='1' ? "<option value='1' selected>ADD & ADHD</option>" : "<option value='1' >ADD & ADHD</option>"}
				          ${userProfile.coachingcategory1 =='2' ? "<option value='2' selected>Business</option>" : "<option value='2' >Business</option>"}
				          ${userProfile.coachingcategory1 =='3' ? "<option value='3' selected>Career Change & Enhancement</option>" : "<option value='3' >Career Change & Enhancement</option>"}
				          ${userProfile.coachingcategory1 =='4' ? "<option value='4' selected>Couples</option>" : "<option value='4' >Couples</option>"}
				          ${userProfile.coachingcategory1 =='5' ? "<option value='5' selected>Diet/Weight Loss</option>" : "<option value='5' >Diet/Weight Loss</option>"}
				          ${userProfile.coachingcategory1 =='6' ? "<option value='6' selected>Disability</option>" : "<option value='6' >Disability</option>"}
				          ${userProfile.coachingcategory1 =='7' ? "<option value='7' selected>Exercise</option>" : "<option value='7' >Exercise</option>"}
				          ${userProfile.coachingcategory1 =='8' ? "<option value='8' selected>Executive</option>" : "<option value='8' >Executive</option>"}
				          ${userProfile.coachingcategory1 =='9' ? "<option value='9' selected>Family</option>" : "<option value='9' >Family</option>"}
				          ${userProfile.coachingcategory1 =='10' ? "<option value='10' selected>Finance</option>" : "<option value='10' >Finance</option>"}
				          ${userProfile.coachingcategory1 =='11' ? "<option value='11' selected>Hobby</option>" : "<option value='11' >Hobby</option>"}
				          ${userProfile.coachingcategory1 =='12' ? "<option value='12' selected>Leadership</option>" : "<option value='12' >Leadership</option>"}
				          ${userProfile.coachingcategory1 =='13' ? "<option value='13' selected>Life</option>" : "<option value='13' >Life</option>"}
				          ${userProfile.coachingcategory1 =='14' ? "<option value='14' selected>Management</option>" : "<option value='14' >Management</option>"}
				          ${userProfile.coachingcategory1 =='15' ? "<option value='15' selected>Music</option>" : "<option value='15' >Music</option>"}
				          ${userProfile.coachingcategory1 =='16' ? "<option value='16' selected>Motivational</option>" : "<option value='16' >Motivational</option>"}
				          ${userProfile.coachingcategory1 =='17' ? "<option value='17' selected>Performance</option>" : "<option value='17' >Performance</option>"}
				          ${userProfile.coachingcategory1 =='18' ? "<option value='18' selected>Relationship</option>" : "<option value='18' >Relationship</option>"}
				          ${userProfile.coachingcategory1 =='19' ? "<option value='19' selected>Retirement</option>" : "<option value='19' >Retirement</option>"}
				          ${userProfile.coachingcategory1 =='20' ? "<option value='20' selected>Sales</option>" : "<option value='20' >Sales</option>"}
				          ${userProfile.coachingcategory1 =='21' ? "<option value='21' selected>Stress Management</option>" : "<option value='21' >Stress Management</option>"}
				          ${userProfile.coachingcategory1 =='22' ? "<option value='22' selected>Sports Training</option>" : "<option value='22' >Sports Training</option>"}
				          ${userProfile.coachingcategory1 =='23' ? "<option value='23' selected>Team and Group</option>" : "<option value='23' >Team and Group</option>"}
				        </form:select>
				        <br>				        
				        <form:select size="1" path="coachingcategory2" id="coachingcategory2" >
				          <option selected  value="-1">Select a Category</option>
				          ${userProfile.coachingcategory2 =='1' ? "<option value='1' selected>ADD & ADHD</option>" : "<option value='1' >ADD & ADHD</option>"}
				          ${userProfile.coachingcategory2 =='2' ? "<option value='2' selected>Business</option>" : "<option value='2' >Business</option>"}
				          ${userProfile.coachingcategory2 =='3' ? "<option value='3' selected>Career Change & Enhancement</option>" : "<option value='3' >Career Change & Enhancement</option>"}
				          ${userProfile.coachingcategory2 =='4' ? "<option value='4' selected>Couples</option>" : "<option value='4' >Couples</option>"}
				          ${userProfile.coachingcategory2 =='5' ? "<option value='5' selected>Diet/Weight Loss</option>" : "<option value='5' >Diet/Weight Loss</option>"}
				          ${userProfile.coachingcategory2 =='6' ? "<option value='6' selected>Disability</option>" : "<option value='6' >Disability</option>"}
				          ${userProfile.coachingcategory2 =='7' ? "<option value='7' selected>Exercise</option>" : "<option value='7' >Exercise</option>"}
				          ${userProfile.coachingcategory2 =='8' ? "<option value='8' selected>Executive</option>" : "<option value='8' >Executive</option>"}
				          ${userProfile.coachingcategory2 =='9' ? "<option value='9' selected>Family</option>" : "<option value='9' >Family</option>"}
				          ${userProfile.coachingcategory2 =='10' ? "<option value='10' selected>Finance</option>" : "<option value='10' >Finance</option>"}
				          ${userProfile.coachingcategory2 =='11' ? "<option value='11' selected>Hobby</option>" : "<option value='11' >Hobby</option>"}
				          ${userProfile.coachingcategory2 =='12' ? "<option value='12' selected>Leadership</option>" : "<option value='12' >Leadership</option>"}
				          ${userProfile.coachingcategory2 =='13' ? "<option value='13' selected>Life</option>" : "<option value='13' >Life</option>"}
				          ${userProfile.coachingcategory2 =='14' ? "<option value='14' selected>Management</option>" : "<option value='14' >Management</option>"}
				          ${userProfile.coachingcategory2 =='15' ? "<option value='15' selected>Music</option>" : "<option value='15' >Music</option>"}
				          ${userProfile.coachingcategory2 =='16' ? "<option value='16' selected>Motivational</option>" : "<option value='16' >Motivational</option>"}
				          ${userProfile.coachingcategory2 =='17' ? "<option value='17' selected>Performance</option>" : "<option value='17' >Performance</option>"}
				          ${userProfile.coachingcategory2 =='18' ? "<option value='18' selected>Relationship</option>" : "<option value='18' >Relationship</option>"}
				          ${userProfile.coachingcategory2 =='19' ? "<option value='19' selected>Retirement</option>" : "<option value='19' >Retirement</option>"}
				          ${userProfile.coachingcategory2 =='20' ? "<option value='20' selected>Sales</option>" : "<option value='20' >Sales</option>"}
				          ${userProfile.coachingcategory2 =='21' ? "<option value='21' selected>Stress Management</option>" : "<option value='21' >Stress Management</option>"}
				          ${userProfile.coachingcategory2 =='22' ? "<option value='22' selected>Sports Training</option>" : "<option value='22' >Sports Training</option>"}
				          ${userProfile.coachingcategory2 =='23' ? "<option value='23' selected>Team and Group</option>" : "<option value='23' >Team and Group</option>"}
				        </form:select>
				        <br>
				        <form:select size="1" path="coachingcategory3" id="coachingcategory3" >
				          <option selected  value="-1">Select a Category</option>
				          ${userProfile.coachingcategory3 =='1' ? "<option value='1' selected>ADD & ADHD</option>" : "<option value='1' >ADD & ADHD</option>"}
				          ${userProfile.coachingcategory3 =='2' ? "<option value='2' selected>Business</option>" : "<option value='2' >Business</option>"}
				          ${userProfile.coachingcategory3 =='3' ? "<option value='3' selected>Career Change & Enhancement</option>" : "<option value='3' >Career Change & Enhancement</option>"}
				          ${userProfile.coachingcategory3 =='4' ? "<option value='4' selected>Couples</option>" : "<option value='4' >Couples</option>"}
				          ${userProfile.coachingcategory3 =='5' ? "<option value='5' selected>Diet/Weight Loss</option>" : "<option value='5' >Diet/Weight Loss</option>"}
				          ${userProfile.coachingcategory3 =='6' ? "<option value='6' selected>Disability</option>" : "<option value='6' >Disability</option>"}
				          ${userProfile.coachingcategory3 =='7' ? "<option value='7' selected>Exercise</option>" : "<option value='7' >Exercise</option>"}
				          ${userProfile.coachingcategory3 =='8' ? "<option value='8' selected>Executive</option>" : "<option value='8' >Executive</option>"}
				          ${userProfile.coachingcategory3 =='9' ? "<option value='9' selected>Family</option>" : "<option value='9' >Family</option>"}
				          ${userProfile.coachingcategory3 =='10' ? "<option value='10' selected>Finance</option>" : "<option value='10' >Finance</option>"}
				          ${userProfile.coachingcategory3 =='11' ? "<option value='11' selected>Hobby</option>" : "<option value='11' >Hobby</option>"}
				          ${userProfile.coachingcategory3 =='12' ? "<option value='12' selected>Leadership</option>" : "<option value='12' >Leadership</option>"}
				          ${userProfile.coachingcategory3 =='13' ? "<option value='13' selected>Life</option>" : "<option value='13' >Life</option>"}
				          ${userProfile.coachingcategory3 =='14' ? "<option value='14' selected>Management</option>" : "<option value='14' >Management</option>"}
				          ${userProfile.coachingcategory3 =='15' ? "<option value='15' selected>Music</option>" : "<option value='15' >Music</option>"}
				          ${userProfile.coachingcategory3 =='16' ? "<option value='16' selected>Motivational</option>" : "<option value='16' >Motivational</option>"}
				          ${userProfile.coachingcategory3 =='17' ? "<option value='17' selected>Performance</option>" : "<option value='17' >Performance</option>"}
				          ${userProfile.coachingcategory3 =='18' ? "<option value='18' selected>Relationship</option>" : "<option value='18' >Relationship</option>"}
				          ${userProfile.coachingcategory3 =='19' ? "<option value='19' selected>Retirement</option>" : "<option value='19' >Retirement</option>"}
				          ${userProfile.coachingcategory3 =='20' ? "<option value='20' selected>Sales</option>" : "<option value='20' >Sales</option>"}
				          ${userProfile.coachingcategory3 =='21' ? "<option value='21' selected>Stress Management</option>" : "<option value='21' >Stress Management</option>"}
				          ${userProfile.coachingcategory3 =='22' ? "<option value='22' selected>Sports Training</option>" : "<option value='22' >Sports Training</option>"}
				          ${userProfile.coachingcategory3 =='23' ? "<option value='23' selected>Team and Group</option>" : "<option value='23' >Team and Group</option>"}
				        </form:select>			    	
			    	</td>

			    	<td class="leftalign" nowrap><br><label>Industries of Focus</label> <form:errors path="industryfocus1" cssClass="error" nowrap="true" /><br>
				        <form:select size="1" path="industryfocus1" id="industryfocus1" >
				          <option selected  value="-1">Select an Industry</option>
								${userProfile.industryfocus1 =='1'  ? "<option value='1' selected>Accounting - Finance</option>" : "<option value='1'>Accounting - Finance</option>"}
								${userProfile.industryfocus1 =='2'  ? "<option value='2' selected>Advertising</option>" : "<option value='2'>Advertising</option>"}
								${userProfile.industryfocus1 =='3'  ? "<option value='3' selected>Agriculture</option>" : "<option value='3'>Agriculture</option>"}
								${userProfile.industryfocus1 =='4'  ? "<option value='4' selected>Airline - Aviation</option>" : "<option value='4'>Airline - Aviation</option>"}
								${userProfile.industryfocus1 =='5'  ? "<option value='5' selected>Appliance &amp; Electronics</option>" : "<option value='5'>Appliance &amp; Electronics</option>"}
								${userProfile.industryfocus1 =='6'  ? "<option value='6' selected>Architecture - Building</option>" : "<option value='6'>Architecture - Building</option>"}
								${userProfile.industryfocus1 =='7'  ? "<option value='7' selected>Art - Photography - Journalism</option>" : "<option value='7'>Art - Photography - Journalism</option>"}
								${userProfile.industryfocus1 =='8'  ? "<option value='8' selected>Automotive - Motor Vehicles - Parts</option>" : "<option value='8'>Automotive - Motor Vehicles - Parts</option>"}
								${userProfile.industryfocus1 =='9'  ? "<option value='9' selected>Banking - Financial Services</option>" : "<option value='9'>Banking - Financial Services</option>"}
								${userProfile.industryfocus1 =='10'  ? "<option value='10' selected>Beauty / Wellness / Grooming</option>" : "<option value='10'>Beauty / Wellness / Grooming</option>"}
								${userProfile.industryfocus1 =='11'  ? "<option value='11' selected>Biotechnology</option>" : "<option value='11'>Biotechnology</option>"}
								${userProfile.industryfocus1 =='12'  ? "<option value='12' selected>Broadcasting - Radio - TV</option>" : "<option value='12'>Broadcasting - Radio - TV</option>"}
								${userProfile.industryfocus1 =='13'  ? "<option value='13' selected>Building Materials</option>" : "<option value='13'>Building Materials</option>"}
								${userProfile.industryfocus1 =='14'  ? "<option value='14' selected>Call Center / SSO / BPO</option>" : "<option value='14'>Call Center / SSO / BPO</option>"}
								${userProfile.industryfocus1 =='15'  ? "<option value='15' selected>Chemical</option>" : "<option value='15'>Chemical</option>"}
								${userProfile.industryfocus1 =='16'  ? "<option value='16' selected>Coffee Shop</option>" : "<option value='16'>Coffee Shop</option>"}
								${userProfile.industryfocus1 =='17'  ? "<option value='17' selected>Computer Hardware</option>" : "<option value='17'>Computer Hardware</option>"}
								${userProfile.industryfocus1 =='18'  ? "<option value='18' selected>Computer Software</option>" : "<option value='18'>Computer Software</option>"}
								${userProfile.industryfocus1 =='19'  ? "<option value='19' selected>Construction</option>" : "<option value='19'>Construction</option>"}
								${userProfile.industryfocus1 =='20'  ? "<option value='20' selected>Consulting</option>" : "<option value='20'>Consulting</option>"}
								${userProfile.industryfocus1 =='21'  ? "<option value='21' selected>Consumer Products</option>" : "<option value='21'>Consumer Products</option>"}
								${userProfile.industryfocus1 =='22'  ? "<option value='22' selected>Cosmetics &amp; Beauty</option>" : "<option value='22'>Cosmetics &amp; Beauty</option>"}
								${userProfile.industryfocus1 =='23'  ? "<option value='23' selected>Credit - Loan - Collections</option>" : "<option value='23'>Credit - Loan - Collections</option>"}
								${userProfile.industryfocus1 =='24' ? "<option value='24' selected>Defense - Aerospace</option>" : "<option value='24'>Defense - Aerospace</option>"}
								${userProfile.industryfocus1 =='25' ? "<option value='25' selected>Department Store</option>" : "<option value='25'>Department Store</option>"}
								${userProfile.industryfocus1 =='26' ? "<option value='26' selected>Education - Teaching - Administration</option>" : "<option value='26'>Education - Teaching - Administration</option>"}
								${userProfile.industryfocus1 =='27' ? "<option value='27' selected>Electronics</option>" : "<option value='27'>Electronics</option>"}
								${userProfile.industryfocus1 =='28' ? "<option value='28' selected>Employment - Recruiting - Staffing</option>" : "<option value='28'>Employment - Recruiting - Staffing</option>"}
								${userProfile.industryfocus1 =='29' ? "<option value='29' selected>Energy - Utilities - Gas - Electric</option>" : "<option value='29'>Energy - Utilities - Gas - Electric</option>"}
								${userProfile.industryfocus1 =='30' ? "<option value='30' selected>Engineering - Machinery</option>" : "<option value='30'>Engineering - Machinery</option>"}
								${userProfile.industryfocus1 =='31' ? "<option value='31' selected>Engineering - Precision</option>" : "<option value='31'>Engineering - Precision</option>"}
								${userProfile.industryfocus1 =='32' ? "<option value='32' selected>Engineering - Services</option>" : "<option value='32'>Engineering - Services</option>"}
								${userProfile.industryfocus1 =='33' ? "<option value='33' selected>Entertainment</option>" : "<option value='33'>Entertainment</option>"}
								${userProfile.industryfocus1 =='34' ? "<option value='34' selected>Environmental</option>" : "<option value='34'>Environmental</option>"}
								${userProfile.industryfocus1 =='35' ? "<option value='35' selected>Exercise - Fitness</option>" : "<option value='35'>Exercise - Fitness</option>"}
								${userProfile.industryfocus1 =='36' ? "<option value='36' selected>Exhibitions / Event Management / MICE</option>" : "<option value='36'>Exhibitions / Event Management / MICE</option>"}
								${userProfile.industryfocus1 =='37' ? "<option value='37' selected>Eye Care</option>" : "<option value='37'>Eye Care</option>"}
								${userProfile.industryfocus1 =='38' ? "<option value='38' selected>Fashion - Apparel - Textile</option>" : "<option value='38'>Fashion - Apparel - Textile</option>"}
								${userProfile.industryfocus1 =='39' ? "<option value='39' selected>Food</option>" : "<option value='39'>Food</option>"}
								${userProfile.industryfocus1 =='40' ? "<option value='40' selected>Full Service Restaurant</option>" : "<option value='40'>Full Service Restaurant</option>"}
								${userProfile.industryfocus1 =='41' ? "<option value='41' selected>Funeral - Cemetery</option>" : "<option value='41'>Funeral - Cemetery</option>"}
								${userProfile.industryfocus1 =='42' ? "<option value='42' selected>Furniture</option>" : "<option value='42'>Furniture</option>"}
								${userProfile.industryfocus1 =='43' ? "<option value='43' selected>Gas / Convenience Store</option>" : "<option value='43'>Gas / Convenience Store</option>"}
								${userProfile.industryfocus1 =='44' ? "<option value='44' selected>Government - Civil Service</option>" : "<option value='44'>Government - Civil Service</option>"}
								${userProfile.industryfocus1 =='45' ? "<option value='45' selected>Grocery &amp; Pharmacy</option>" : "<option value='45'>Grocery &amp; Pharmacy</option>"}
								${userProfile.industryfocus1 =='46' ? "<option value='46' selected>Hardware / Home Improvement</option>" : "<option value='46'>Hardware / Home Improvement</option>"}
								${userProfile.industryfocus1 =='47' ? "<option value='47' selected>Healthcare - Health Services</option>" : "<option value='47'>Healthcare - Health Services</option>"}
								${userProfile.industryfocus1 =='48' ? "<option value='48' selected>Home D&#233;cor and Kitchen</option>" : "<option value='48'>Home D&#233;cor and Kitchen</option>"}
								${userProfile.industryfocus1 =='49' ? "<option value='49' selected>Homebuilding</option>" : "<option value='49'>Homebuilding</option>"}
								${userProfile.industryfocus1 =='50' ? "<option value='50' selected>Hospitality</option>" : "<option value='50'>Hospitality</option>"}
								${userProfile.industryfocus1 =='51' ? "<option value='51' selected>Hotel - Resort</option>" : "<option value='51'>Hotel - Resort</option>"}
								${userProfile.industryfocus1 =='52' ? "<option value='52' selected>HVAC</option>" : "<option value='52'>HVAC</option>"}
								${userProfile.industryfocus1 =='53' ? "<option value='53' selected>Import - Export</option>" : "<option value='53'>Import - Export</option>"}
								${userProfile.industryfocus1 =='54' ? "<option value='54' selected>Industrial</option>" : "<option value='54'>Industrial</option>"}
								${userProfile.industryfocus1 =='55' ? "<option value='55' selected>Insurance</option>" : "<option value='55'>Insurance</option>"}
								${userProfile.industryfocus1 =='56' ? "<option value='56' selected>Internet - ECommerce</option>" : "<option value='56'>Internet - ECommerce</option>"}
								${userProfile.industryfocus1 =='57' ? "<option value='57' selected>Jewelry</option>" : "<option value='57'>Jewelry</option>"}
								${userProfile.industryfocus1 =='58' ? "<option value='58' selected>Landscaping</option>" : "<option value='58'>Landscaping</option>"}
								${userProfile.industryfocus1 =='59' ? "<option value='59' selected>Law Enforcement</option>" : "<option value='59'>Law Enforcement</option>"}
								${userProfile.industryfocus1 =='60' ? "<option value='60' selected>Legal</option>" : "<option value='60'>Legal</option>"}
								${userProfile.industryfocus1 =='61' ? "<option value='61' selected>Library Science</option>" : "<option value='61'>Library Science</option>"}
								${userProfile.industryfocus1 =='62' ? "<option value='62' selected>Managed Care</option>" : "<option value='62'>Managed Care</option>"}
								${userProfile.industryfocus1 =='63' ? "<option value='63' selected>Manufacturing</option>" : "<option value='63'>Manufacturing</option>"}
								${userProfile.industryfocus1 =='64' ? "<option value='64' selected>Marine / Maritime</option>" : "<option value='64'>Marine / Maritime</option>"}
								${userProfile.industryfocus1 =='65' ? "<option value='65' selected>Maritime - Offshore &amp; Marine Engineering</option>" : "<option value='65'>Maritime - Offshore &amp; Marine Engineering</option>"}
								${userProfile.industryfocus1 =='66' ? "<option value='66' selected>Maritime - Port</option>" : "<option value='66'>Maritime - Port</option>"}
								${userProfile.industryfocus1 =='67' ? "<option value='67' selected>Maritime - Shipping</option>" : "<option value='67'>Maritime - Shipping</option>"}
								${userProfile.industryfocus1 =='68' ? "<option value='68' selected>Mass Merchandiser</option>" : "<option value='68'>Mass Merchandiser</option>"}
								${userProfile.industryfocus1 =='69' ? "<option value='69' selected>Medical Equipment</option>" : "<option value='69'>Medical Equipment</option>"}
								${userProfile.industryfocus1 =='70' ? "<option value='70' selected>Merchandising</option>" : "<option value='70'>Merchandising</option>"}
								${userProfile.industryfocus1 =='71' ? "<option value='71' selected>Military</option>" : "<option value='71'>Military</option>"}
								${userProfile.industryfocus1 =='72' ? "<option value='72' selected>Mining / Drilling / Resources</option>" : "<option value='72'>Mining / Drilling / Resources</option>"}
								${userProfile.industryfocus1 =='73' ? "<option value='73' selected>Mortgage</option>" : "<option value='73'>Mortgage</option>"}
								${userProfile.industryfocus1 =='74' ? "<option value='74' selected>Newspaper</option>" : "<option value='74'>Newspaper</option>"}
								${userProfile.industryfocus1 =='75' ? "<option value='75' selected>Not for Profit - Charitable</option>" : "<option value='75'>Not for Profit - Charitable</option>"}
								${userProfile.industryfocus1 =='76' ? "<option value='76' selected>Office Supplies - Equipment</option>" : "<option value='76'>Office Supplies - Equipment</option>"}
								${userProfile.industryfocus1 =='77' ? "<option value='77' selected>Oil Refining - Petroleum - Drilling</option>" : "<option value='77'>Oil Refining - Petroleum - Drilling</option>"}
								${userProfile.industryfocus1 =='78' ? "<option value='78' selected>Other</option>" : "<option value='78'>Other</option>"}
								${userProfile.industryfocus1 =='79' ? "<option value='79' selected>Other Great Industries</option>" : "<option value='79'>Other Great Industries</option>"}
								${userProfile.industryfocus1 =='80' ? "<option value='80' selected>Packaging</option>" : "<option value='80'>Packaging</option>"}
								${userProfile.industryfocus1 =='81' ? "<option value='81' selected>Pet Store</option>" : "<option value='81'>Pet Store</option>"}
								${userProfile.industryfocus1 =='82' ? "<option value='82' selected>Pharmaceutical</option>" : "<option value='82'>Pharmaceutical</option>"}
								${userProfile.industryfocus1 =='83' ? "<option value='83' selected>Polymer / Plastic / Rubber</option>" : "<option value='83'>Polymer / Plastic / Rubber</option>"}
								${userProfile.industryfocus1 =='84' ? "<option value='84' selected>Printing - Publishing</option>" : "<option value='84'>Printing - Publishing</option>"}
								${userProfile.industryfocus1 =='85' ? "<option value='85' selected>Public Relations</option>" : "<option value='85'>Public Relations</option>"}
								${userProfile.industryfocus1 =='86' ? "<option value='86' selected>Quick Service or Fast Food Restaurant</option>" : "<option value='86'>Quick Service or Fast Food Restaurant</option>"}
								${userProfile.industryfocus1 =='87' ? "<option value='87' selected>Real Estate - Property Mgt</option>" : "<option value='87'>Real Estate - Property Mgt</option>"}
								${userProfile.industryfocus1 =='88' ? "<option value='88' selected>Recreation</option>" : "<option value='88'>Recreation</option>"}
								${userProfile.industryfocus1 =='89' ? "<option value='89' selected>Repair / Maintenance Services</option>" : "<option value='89'>Repair / Maintenance Services</option>"}
								${userProfile.industryfocus1 =='90' ? "<option value='90' selected>Research &amp; Development</option>" : "<option value='90'>Research &amp; Development</option>"}
								${userProfile.industryfocus1 =='91' ? "<option value='91' selected>Restaurant</option>" : "<option value='91'>Restaurant</option>"}
								${userProfile.industryfocus1 =='92' ? "<option value='92' selected>Retail</option>" : "<option value='92'>Retail</option>"}
								${userProfile.industryfocus1 =='93' ? "<option value='93' selected>Retail Bank</option>" : "<option value='93'>Retail Bank</option>"}
								${userProfile.industryfocus1 =='94' ? "<option value='94' selected>Sales - Marketing</option>" : "<option value='94'>Sales - Marketing</option>"}
								${userProfile.industryfocus1 =='95' ? "<option value='95' selected>Science &amp; Technology</option>" : "<option value='95'>Science &amp; Technology</option>"}
								${userProfile.industryfocus1 =='96' ? "<option value='96' selected>Securities</option>" : "<option value='96'>Securities</option>"}
								${userProfile.industryfocus1 =='97' ? "<option value='97' selected>Security</option>" : "<option value='97'>Security</option>"}
								${userProfile.industryfocus1 =='98' ? "<option value='98' selected>Semiconductor</option>" : "<option value='98'>Semiconductor</option>"}
								${userProfile.industryfocus1 =='99' ? "<option value='99' selected>Services - Corporate B2B</option>" : "<option value='99'>Services - Corporate B2B</option>"}
								${userProfile.industryfocus1 =='100' ? "<option value='100' selected>Social Services</option>" : "<option value='100'>Social Services</option>"}
								${userProfile.industryfocus1 =='101' ? "<option value='101' selected>Sporting Goods</option>" : "<option value='101'>Sporting Goods</option>"}
								${userProfile.industryfocus1 =='102' ? "<option value='102' selected>Telecommunications</option>" : "<option value='102'>Telecommunications</option>"}
								${userProfile.industryfocus1 =='103' ? "<option value='103' selected>Training</option>" : "<option value='103'>Training</option>"}
								${userProfile.industryfocus1 =='104' ? "<option value='104' selected>Transportation</option>" : "<option value='104'>Transportation</option>"}
								${userProfile.industryfocus1 =='105' ? "<option value='105' selected>Travel</option>" : "<option value='105'>Travel</option>"}
								${userProfile.industryfocus1 =='106' ? "<option value='106' selected>Wireless</option>" : "<option value='106'>Wireless</option>"}
								${userProfile.industryfocus1 =='107' ? "<option value='107' selected>Wood / Fibre / Paper</option>" : "<option value='107'>Wood / Fibre / Paper</option>"}
				        </form:select>
						<br>
				        <form:select size="1" path="industryfocus2" id="industryfocus2" >
				          <option selected  value="-1">Select an Industry</option>
								${userProfile.industryfocus1 =='1'  ? "<option value='1' selected>Accounting - Finance</option>" : "<option value='1'>Accounting - Finance</option>"}
								${userProfile.industryfocus1 =='2'  ? "<option value='2' selected>Advertising</option>" : "<option value='2'>Advertising</option>"}
								${userProfile.industryfocus1 =='3'  ? "<option value='3' selected>Agriculture</option>" : "<option value='3'>Agriculture</option>"}
								${userProfile.industryfocus1 =='4'  ? "<option value='4' selected>Airline - Aviation</option>" : "<option value='4'>Airline - Aviation</option>"}
								${userProfile.industryfocus1 =='5'  ? "<option value='5' selected>Appliance &amp; Electronics</option>" : "<option value='5'>Appliance &amp; Electronics</option>"}
								${userProfile.industryfocus1 =='6'  ? "<option value='6' selected>Architecture - Building</option>" : "<option value='6'>Architecture - Building</option>"}
								${userProfile.industryfocus1 =='7'  ? "<option value='7' selected>Art - Photography - Journalism</option>" : "<option value='7'>Art - Photography - Journalism</option>"}
								${userProfile.industryfocus1 =='8'  ? "<option value='8' selected>Automotive - Motor Vehicles - Parts</option>" : "<option value='8'>Automotive - Motor Vehicles - Parts</option>"}
								${userProfile.industryfocus1 =='9'  ? "<option value='9' selected>Banking - Financial Services</option>" : "<option value='9'>Banking - Financial Services</option>"}
								${userProfile.industryfocus1 =='10'  ? "<option value='10' selected>Beauty / Wellness / Grooming</option>" : "<option value='10'>Beauty / Wellness / Grooming</option>"}
								${userProfile.industryfocus1 =='11'  ? "<option value='11' selected>Biotechnology</option>" : "<option value='11'>Biotechnology</option>"}
								${userProfile.industryfocus1 =='12'  ? "<option value='12' selected>Broadcasting - Radio - TV</option>" : "<option value='12'>Broadcasting - Radio - TV</option>"}
								${userProfile.industryfocus1 =='13'  ? "<option value='13' selected>Building Materials</option>" : "<option value='13'>Building Materials</option>"}
								${userProfile.industryfocus1 =='14'  ? "<option value='14' selected>Call Center / SSO / BPO</option>" : "<option value='14'>Call Center / SSO / BPO</option>"}
								${userProfile.industryfocus1 =='15'  ? "<option value='15' selected>Chemical</option>" : "<option value='15'>Chemical</option>"}
								${userProfile.industryfocus1 =='16'  ? "<option value='16' selected>Coffee Shop</option>" : "<option value='16'>Coffee Shop</option>"}
								${userProfile.industryfocus1 =='17'  ? "<option value='17' selected>Computer Hardware</option>" : "<option value='17'>Computer Hardware</option>"}
								${userProfile.industryfocus1 =='18'  ? "<option value='18' selected>Computer Software</option>" : "<option value='18'>Computer Software</option>"}
								${userProfile.industryfocus1 =='19'  ? "<option value='19' selected>Construction</option>" : "<option value='19'>Construction</option>"}
								${userProfile.industryfocus1 =='20'  ? "<option value='20' selected>Consulting</option>" : "<option value='20'>Consulting</option>"}
								${userProfile.industryfocus1 =='21'  ? "<option value='21' selected>Consumer Products</option>" : "<option value='21'>Consumer Products</option>"}
								${userProfile.industryfocus1 =='22'  ? "<option value='22' selected>Cosmetics &amp; Beauty</option>" : "<option value='22'>Cosmetics &amp; Beauty</option>"}
								${userProfile.industryfocus1 =='23'  ? "<option value='23' selected>Credit - Loan - Collections</option>" : "<option value='23'>Credit - Loan - Collections</option>"}
								${userProfile.industryfocus1 =='24' ? "<option value='24' selected>Defense - Aerospace</option>" : "<option value='24'>Defense - Aerospace</option>"}
								${userProfile.industryfocus1 =='25' ? "<option value='25' selected>Department Store</option>" : "<option value='25'>Department Store</option>"}
								${userProfile.industryfocus1 =='26' ? "<option value='26' selected>Education - Teaching - Administration</option>" : "<option value='26'>Education - Teaching - Administration</option>"}
								${userProfile.industryfocus1 =='27' ? "<option value='27' selected>Electronics</option>" : "<option value='27'>Electronics</option>"}
								${userProfile.industryfocus1 =='28' ? "<option value='28' selected>Employment - Recruiting - Staffing</option>" : "<option value='28'>Employment - Recruiting - Staffing</option>"}
								${userProfile.industryfocus1 =='29' ? "<option value='29' selected>Energy - Utilities - Gas - Electric</option>" : "<option value='29'>Energy - Utilities - Gas - Electric</option>"}
								${userProfile.industryfocus1 =='30' ? "<option value='30' selected>Engineering - Machinery</option>" : "<option value='30'>Engineering - Machinery</option>"}
								${userProfile.industryfocus1 =='31' ? "<option value='31' selected>Engineering - Precision</option>" : "<option value='31'>Engineering - Precision</option>"}
								${userProfile.industryfocus1 =='32' ? "<option value='32' selected>Engineering - Services</option>" : "<option value='32'>Engineering - Services</option>"}
								${userProfile.industryfocus1 =='33' ? "<option value='33' selected>Entertainment</option>" : "<option value='33'>Entertainment</option>"}
								${userProfile.industryfocus1 =='34' ? "<option value='34' selected>Environmental</option>" : "<option value='34'>Environmental</option>"}
								${userProfile.industryfocus1 =='35' ? "<option value='35' selected>Exercise - Fitness</option>" : "<option value='35'>Exercise - Fitness</option>"}
								${userProfile.industryfocus1 =='36' ? "<option value='36' selected>Exhibitions / Event Management / MICE</option>" : "<option value='36'>Exhibitions / Event Management / MICE</option>"}
								${userProfile.industryfocus1 =='37' ? "<option value='37' selected>Eye Care</option>" : "<option value='37'>Eye Care</option>"}
								${userProfile.industryfocus1 =='38' ? "<option value='38' selected>Fashion - Apparel - Textile</option>" : "<option value='38'>Fashion - Apparel - Textile</option>"}
								${userProfile.industryfocus1 =='39' ? "<option value='39' selected>Food</option>" : "<option value='39'>Food</option>"}
								${userProfile.industryfocus1 =='40' ? "<option value='40' selected>Full Service Restaurant</option>" : "<option value='40'>Full Service Restaurant</option>"}
								${userProfile.industryfocus1 =='41' ? "<option value='41' selected>Funeral - Cemetery</option>" : "<option value='41'>Funeral - Cemetery</option>"}
								${userProfile.industryfocus1 =='42' ? "<option value='42' selected>Furniture</option>" : "<option value='42'>Furniture</option>"}
								${userProfile.industryfocus1 =='43' ? "<option value='43' selected>Gas / Convenience Store</option>" : "<option value='43'>Gas / Convenience Store</option>"}
								${userProfile.industryfocus1 =='44' ? "<option value='44' selected>Government - Civil Service</option>" : "<option value='44'>Government - Civil Service</option>"}
								${userProfile.industryfocus1 =='45' ? "<option value='45' selected>Grocery &amp; Pharmacy</option>" : "<option value='45'>Grocery &amp; Pharmacy</option>"}
								${userProfile.industryfocus1 =='46' ? "<option value='46' selected>Hardware / Home Improvement</option>" : "<option value='46'>Hardware / Home Improvement</option>"}
								${userProfile.industryfocus1 =='47' ? "<option value='47' selected>Healthcare - Health Services</option>" : "<option value='47'>Healthcare - Health Services</option>"}
								${userProfile.industryfocus1 =='48' ? "<option value='48' selected>Home D&#233;cor and Kitchen</option>" : "<option value='48'>Home D&#233;cor and Kitchen</option>"}
								${userProfile.industryfocus1 =='49' ? "<option value='49' selected>Homebuilding</option>" : "<option value='49'>Homebuilding</option>"}
								${userProfile.industryfocus1 =='50' ? "<option value='50' selected>Hospitality</option>" : "<option value='50'>Hospitality</option>"}
								${userProfile.industryfocus1 =='51' ? "<option value='51' selected>Hotel - Resort</option>" : "<option value='51'>Hotel - Resort</option>"}
								${userProfile.industryfocus1 =='52' ? "<option value='52' selected>HVAC</option>" : "<option value='52'>HVAC</option>"}
								${userProfile.industryfocus1 =='53' ? "<option value='53' selected>Import - Export</option>" : "<option value='53'>Import - Export</option>"}
								${userProfile.industryfocus1 =='54' ? "<option value='54' selected>Industrial</option>" : "<option value='54'>Industrial</option>"}
								${userProfile.industryfocus1 =='55' ? "<option value='55' selected>Insurance</option>" : "<option value='55'>Insurance</option>"}
								${userProfile.industryfocus1 =='56' ? "<option value='56' selected>Internet - ECommerce</option>" : "<option value='56'>Internet - ECommerce</option>"}
								${userProfile.industryfocus1 =='57' ? "<option value='57' selected>Jewelry</option>" : "<option value='57'>Jewelry</option>"}
								${userProfile.industryfocus1 =='58' ? "<option value='58' selected>Landscaping</option>" : "<option value='58'>Landscaping</option>"}
								${userProfile.industryfocus1 =='59' ? "<option value='59' selected>Law Enforcement</option>" : "<option value='59'>Law Enforcement</option>"}
								${userProfile.industryfocus1 =='60' ? "<option value='60' selected>Legal</option>" : "<option value='60'>Legal</option>"}
								${userProfile.industryfocus1 =='61' ? "<option value='61' selected>Library Science</option>" : "<option value='61'>Library Science</option>"}
								${userProfile.industryfocus1 =='62' ? "<option value='62' selected>Managed Care</option>" : "<option value='62'>Managed Care</option>"}
								${userProfile.industryfocus1 =='63' ? "<option value='63' selected>Manufacturing</option>" : "<option value='63'>Manufacturing</option>"}
								${userProfile.industryfocus1 =='64' ? "<option value='64' selected>Marine / Maritime</option>" : "<option value='64'>Marine / Maritime</option>"}
								${userProfile.industryfocus1 =='65' ? "<option value='65' selected>Maritime - Offshore &amp; Marine Engineering</option>" : "<option value='65'>Maritime - Offshore &amp; Marine Engineering</option>"}
								${userProfile.industryfocus1 =='66' ? "<option value='66' selected>Maritime - Port</option>" : "<option value='66'>Maritime - Port</option>"}
								${userProfile.industryfocus1 =='67' ? "<option value='67' selected>Maritime - Shipping</option>" : "<option value='67'>Maritime - Shipping</option>"}
								${userProfile.industryfocus1 =='68' ? "<option value='68' selected>Mass Merchandiser</option>" : "<option value='68'>Mass Merchandiser</option>"}
								${userProfile.industryfocus1 =='69' ? "<option value='69' selected>Medical Equipment</option>" : "<option value='69'>Medical Equipment</option>"}
								${userProfile.industryfocus1 =='70' ? "<option value='70' selected>Merchandising</option>" : "<option value='70'>Merchandising</option>"}
								${userProfile.industryfocus1 =='71' ? "<option value='71' selected>Military</option>" : "<option value='71'>Military</option>"}
								${userProfile.industryfocus1 =='72' ? "<option value='72' selected>Mining / Drilling / Resources</option>" : "<option value='72'>Mining / Drilling / Resources</option>"}
								${userProfile.industryfocus1 =='73' ? "<option value='73' selected>Mortgage</option>" : "<option value='73'>Mortgage</option>"}
								${userProfile.industryfocus1 =='74' ? "<option value='74' selected>Newspaper</option>" : "<option value='74'>Newspaper</option>"}
								${userProfile.industryfocus1 =='75' ? "<option value='75' selected>Not for Profit - Charitable</option>" : "<option value='75'>Not for Profit - Charitable</option>"}
								${userProfile.industryfocus1 =='76' ? "<option value='76' selected>Office Supplies - Equipment</option>" : "<option value='76'>Office Supplies - Equipment</option>"}
								${userProfile.industryfocus1 =='77' ? "<option value='77' selected>Oil Refining - Petroleum - Drilling</option>" : "<option value='77'>Oil Refining - Petroleum - Drilling</option>"}
								${userProfile.industryfocus1 =='78' ? "<option value='78' selected>Other</option>" : "<option value='78'>Other</option>"}
								${userProfile.industryfocus1 =='79' ? "<option value='79' selected>Other Great Industries</option>" : "<option value='79'>Other Great Industries</option>"}
								${userProfile.industryfocus1 =='80' ? "<option value='80' selected>Packaging</option>" : "<option value='80'>Packaging</option>"}
								${userProfile.industryfocus1 =='81' ? "<option value='81' selected>Pet Store</option>" : "<option value='81'>Pet Store</option>"}
								${userProfile.industryfocus1 =='82' ? "<option value='82' selected>Pharmaceutical</option>" : "<option value='82'>Pharmaceutical</option>"}
								${userProfile.industryfocus1 =='83' ? "<option value='83' selected>Polymer / Plastic / Rubber</option>" : "<option value='83'>Polymer / Plastic / Rubber</option>"}
								${userProfile.industryfocus1 =='84' ? "<option value='84' selected>Printing - Publishing</option>" : "<option value='84'>Printing - Publishing</option>"}
								${userProfile.industryfocus1 =='85' ? "<option value='85' selected>Public Relations</option>" : "<option value='85'>Public Relations</option>"}
								${userProfile.industryfocus1 =='86' ? "<option value='86' selected>Quick Service or Fast Food Restaurant</option>" : "<option value='86'>Quick Service or Fast Food Restaurant</option>"}
								${userProfile.industryfocus1 =='87' ? "<option value='87' selected>Real Estate - Property Mgt</option>" : "<option value='87'>Real Estate - Property Mgt</option>"}
								${userProfile.industryfocus1 =='88' ? "<option value='88' selected>Recreation</option>" : "<option value='88'>Recreation</option>"}
								${userProfile.industryfocus1 =='89' ? "<option value='89' selected>Repair / Maintenance Services</option>" : "<option value='89'>Repair / Maintenance Services</option>"}
								${userProfile.industryfocus1 =='90' ? "<option value='90' selected>Research &amp; Development</option>" : "<option value='90'>Research &amp; Development</option>"}
								${userProfile.industryfocus1 =='91' ? "<option value='91' selected>Restaurant</option>" : "<option value='91'>Restaurant</option>"}
								${userProfile.industryfocus1 =='92' ? "<option value='92' selected>Retail</option>" : "<option value='92'>Retail</option>"}
								${userProfile.industryfocus1 =='93' ? "<option value='93' selected>Retail Bank</option>" : "<option value='93'>Retail Bank</option>"}
								${userProfile.industryfocus1 =='94' ? "<option value='94' selected>Sales - Marketing</option>" : "<option value='94'>Sales - Marketing</option>"}
								${userProfile.industryfocus1 =='95' ? "<option value='95' selected>Science &amp; Technology</option>" : "<option value='95'>Science &amp; Technology</option>"}
								${userProfile.industryfocus1 =='96' ? "<option value='96' selected>Securities</option>" : "<option value='96'>Securities</option>"}
								${userProfile.industryfocus1 =='97' ? "<option value='97' selected>Security</option>" : "<option value='97'>Security</option>"}
								${userProfile.industryfocus1 =='98' ? "<option value='98' selected>Semiconductor</option>" : "<option value='98'>Semiconductor</option>"}
								${userProfile.industryfocus1 =='99' ? "<option value='99' selected>Services - Corporate B2B</option>" : "<option value='99'>Services - Corporate B2B</option>"}
								${userProfile.industryfocus1 =='100' ? "<option value='100' selected>Social Services</option>" : "<option value='100'>Social Services</option>"}
								${userProfile.industryfocus1 =='101' ? "<option value='101' selected>Sporting Goods</option>" : "<option value='101'>Sporting Goods</option>"}
								${userProfile.industryfocus1 =='102' ? "<option value='102' selected>Telecommunications</option>" : "<option value='102'>Telecommunications</option>"}
								${userProfile.industryfocus1 =='103' ? "<option value='103' selected>Training</option>" : "<option value='103'>Training</option>"}
								${userProfile.industryfocus1 =='104' ? "<option value='104' selected>Transportation</option>" : "<option value='104'>Transportation</option>"}
								${userProfile.industryfocus1 =='105' ? "<option value='105' selected>Travel</option>" : "<option value='105'>Travel</option>"}
								${userProfile.industryfocus1 =='106' ? "<option value='106' selected>Wireless</option>" : "<option value='106'>Wireless</option>"}
								${userProfile.industryfocus1 =='107' ? "<option value='107' selected>Wood / Fibre / Paper</option>" : "<option value='107'>Wood / Fibre / Paper</option>"}
				        </form:select><br>
				        <form:select size="1" path="industryfocus3" id="industryfocus3" >
				          <option selected  value="-1">Select an Industry</option>
								${userProfile.industryfocus1 =='1'  ? "<option value='1' selected>Accounting - Finance</option>" : "<option value='1'>Accounting - Finance</option>"}
								${userProfile.industryfocus1 =='2'  ? "<option value='2' selected>Advertising</option>" : "<option value='2'>Advertising</option>"}
								${userProfile.industryfocus1 =='3'  ? "<option value='3' selected>Agriculture</option>" : "<option value='3'>Agriculture</option>"}
								${userProfile.industryfocus1 =='4'  ? "<option value='4' selected>Airline - Aviation</option>" : "<option value='4'>Airline - Aviation</option>"}
								${userProfile.industryfocus1 =='5'  ? "<option value='5' selected>Appliance &amp; Electronics</option>" : "<option value='5'>Appliance &amp; Electronics</option>"}
								${userProfile.industryfocus1 =='6'  ? "<option value='6' selected>Architecture - Building</option>" : "<option value='6'>Architecture - Building</option>"}
								${userProfile.industryfocus1 =='7'  ? "<option value='7' selected>Art - Photography - Journalism</option>" : "<option value='7'>Art - Photography - Journalism</option>"}
								${userProfile.industryfocus1 =='8'  ? "<option value='8' selected>Automotive - Motor Vehicles - Parts</option>" : "<option value='8'>Automotive - Motor Vehicles - Parts</option>"}
								${userProfile.industryfocus1 =='9'  ? "<option value='9' selected>Banking - Financial Services</option>" : "<option value='9'>Banking - Financial Services</option>"}
								${userProfile.industryfocus1 =='10'  ? "<option value='10' selected>Beauty / Wellness / Grooming</option>" : "<option value='10'>Beauty / Wellness / Grooming</option>"}
								${userProfile.industryfocus1 =='11'  ? "<option value='11' selected>Biotechnology</option>" : "<option value='11'>Biotechnology</option>"}
								${userProfile.industryfocus1 =='12'  ? "<option value='12' selected>Broadcasting - Radio - TV</option>" : "<option value='12'>Broadcasting - Radio - TV</option>"}
								${userProfile.industryfocus1 =='13'  ? "<option value='13' selected>Building Materials</option>" : "<option value='13'>Building Materials</option>"}
								${userProfile.industryfocus1 =='14'  ? "<option value='14' selected>Call Center / SSO / BPO</option>" : "<option value='14'>Call Center / SSO / BPO</option>"}
								${userProfile.industryfocus1 =='15'  ? "<option value='15' selected>Chemical</option>" : "<option value='15'>Chemical</option>"}
								${userProfile.industryfocus1 =='16'  ? "<option value='16' selected>Coffee Shop</option>" : "<option value='16'>Coffee Shop</option>"}
								${userProfile.industryfocus1 =='17'  ? "<option value='17' selected>Computer Hardware</option>" : "<option value='17'>Computer Hardware</option>"}
								${userProfile.industryfocus1 =='18'  ? "<option value='18' selected>Computer Software</option>" : "<option value='18'>Computer Software</option>"}
								${userProfile.industryfocus1 =='19'  ? "<option value='19' selected>Construction</option>" : "<option value='19'>Construction</option>"}
								${userProfile.industryfocus1 =='20'  ? "<option value='20' selected>Consulting</option>" : "<option value='20'>Consulting</option>"}
								${userProfile.industryfocus1 =='21'  ? "<option value='21' selected>Consumer Products</option>" : "<option value='21'>Consumer Products</option>"}
								${userProfile.industryfocus1 =='22'  ? "<option value='22' selected>Cosmetics &amp; Beauty</option>" : "<option value='22'>Cosmetics &amp; Beauty</option>"}
								${userProfile.industryfocus1 =='23'  ? "<option value='23' selected>Credit - Loan - Collections</option>" : "<option value='23'>Credit - Loan - Collections</option>"}
								${userProfile.industryfocus1 =='24' ? "<option value='24' selected>Defense - Aerospace</option>" : "<option value='24'>Defense - Aerospace</option>"}
								${userProfile.industryfocus1 =='25' ? "<option value='25' selected>Department Store</option>" : "<option value='25'>Department Store</option>"}
								${userProfile.industryfocus1 =='26' ? "<option value='26' selected>Education - Teaching - Administration</option>" : "<option value='26'>Education - Teaching - Administration</option>"}
								${userProfile.industryfocus1 =='27' ? "<option value='27' selected>Electronics</option>" : "<option value='27'>Electronics</option>"}
								${userProfile.industryfocus1 =='28' ? "<option value='28' selected>Employment - Recruiting - Staffing</option>" : "<option value='28'>Employment - Recruiting - Staffing</option>"}
								${userProfile.industryfocus1 =='29' ? "<option value='29' selected>Energy - Utilities - Gas - Electric</option>" : "<option value='29'>Energy - Utilities - Gas - Electric</option>"}
								${userProfile.industryfocus1 =='30' ? "<option value='30' selected>Engineering - Machinery</option>" : "<option value='30'>Engineering - Machinery</option>"}
								${userProfile.industryfocus1 =='31' ? "<option value='31' selected>Engineering - Precision</option>" : "<option value='31'>Engineering - Precision</option>"}
								${userProfile.industryfocus1 =='32' ? "<option value='32' selected>Engineering - Services</option>" : "<option value='32'>Engineering - Services</option>"}
								${userProfile.industryfocus1 =='33' ? "<option value='33' selected>Entertainment</option>" : "<option value='33'>Entertainment</option>"}
								${userProfile.industryfocus1 =='34' ? "<option value='34' selected>Environmental</option>" : "<option value='34'>Environmental</option>"}
								${userProfile.industryfocus1 =='35' ? "<option value='35' selected>Exercise - Fitness</option>" : "<option value='35'>Exercise - Fitness</option>"}
								${userProfile.industryfocus1 =='36' ? "<option value='36' selected>Exhibitions / Event Management / MICE</option>" : "<option value='36'>Exhibitions / Event Management / MICE</option>"}
								${userProfile.industryfocus1 =='37' ? "<option value='37' selected>Eye Care</option>" : "<option value='37'>Eye Care</option>"}
								${userProfile.industryfocus1 =='38' ? "<option value='38' selected>Fashion - Apparel - Textile</option>" : "<option value='38'>Fashion - Apparel - Textile</option>"}
								${userProfile.industryfocus1 =='39' ? "<option value='39' selected>Food</option>" : "<option value='39'>Food</option>"}
								${userProfile.industryfocus1 =='40' ? "<option value='40' selected>Full Service Restaurant</option>" : "<option value='40'>Full Service Restaurant</option>"}
								${userProfile.industryfocus1 =='41' ? "<option value='41' selected>Funeral - Cemetery</option>" : "<option value='41'>Funeral - Cemetery</option>"}
								${userProfile.industryfocus1 =='42' ? "<option value='42' selected>Furniture</option>" : "<option value='42'>Furniture</option>"}
								${userProfile.industryfocus1 =='43' ? "<option value='43' selected>Gas / Convenience Store</option>" : "<option value='43'>Gas / Convenience Store</option>"}
								${userProfile.industryfocus1 =='44' ? "<option value='44' selected>Government - Civil Service</option>" : "<option value='44'>Government - Civil Service</option>"}
								${userProfile.industryfocus1 =='45' ? "<option value='45' selected>Grocery &amp; Pharmacy</option>" : "<option value='45'>Grocery &amp; Pharmacy</option>"}
								${userProfile.industryfocus1 =='46' ? "<option value='46' selected>Hardware / Home Improvement</option>" : "<option value='46'>Hardware / Home Improvement</option>"}
								${userProfile.industryfocus1 =='47' ? "<option value='47' selected>Healthcare - Health Services</option>" : "<option value='47'>Healthcare - Health Services</option>"}
								${userProfile.industryfocus1 =='48' ? "<option value='48' selected>Home D&#233;cor and Kitchen</option>" : "<option value='48'>Home D&#233;cor and Kitchen</option>"}
								${userProfile.industryfocus1 =='49' ? "<option value='49' selected>Homebuilding</option>" : "<option value='49'>Homebuilding</option>"}
								${userProfile.industryfocus1 =='50' ? "<option value='50' selected>Hospitality</option>" : "<option value='50'>Hospitality</option>"}
								${userProfile.industryfocus1 =='51' ? "<option value='51' selected>Hotel - Resort</option>" : "<option value='51'>Hotel - Resort</option>"}
								${userProfile.industryfocus1 =='52' ? "<option value='52' selected>HVAC</option>" : "<option value='52'>HVAC</option>"}
								${userProfile.industryfocus1 =='53' ? "<option value='53' selected>Import - Export</option>" : "<option value='53'>Import - Export</option>"}
								${userProfile.industryfocus1 =='54' ? "<option value='54' selected>Industrial</option>" : "<option value='54'>Industrial</option>"}
								${userProfile.industryfocus1 =='55' ? "<option value='55' selected>Insurance</option>" : "<option value='55'>Insurance</option>"}
								${userProfile.industryfocus1 =='56' ? "<option value='56' selected>Internet - ECommerce</option>" : "<option value='56'>Internet - ECommerce</option>"}
								${userProfile.industryfocus1 =='57' ? "<option value='57' selected>Jewelry</option>" : "<option value='57'>Jewelry</option>"}
								${userProfile.industryfocus1 =='58' ? "<option value='58' selected>Landscaping</option>" : "<option value='58'>Landscaping</option>"}
								${userProfile.industryfocus1 =='59' ? "<option value='59' selected>Law Enforcement</option>" : "<option value='59'>Law Enforcement</option>"}
								${userProfile.industryfocus1 =='60' ? "<option value='60' selected>Legal</option>" : "<option value='60'>Legal</option>"}
								${userProfile.industryfocus1 =='61' ? "<option value='61' selected>Library Science</option>" : "<option value='61'>Library Science</option>"}
								${userProfile.industryfocus1 =='62' ? "<option value='62' selected>Managed Care</option>" : "<option value='62'>Managed Care</option>"}
								${userProfile.industryfocus1 =='63' ? "<option value='63' selected>Manufacturing</option>" : "<option value='63'>Manufacturing</option>"}
								${userProfile.industryfocus1 =='64' ? "<option value='64' selected>Marine / Maritime</option>" : "<option value='64'>Marine / Maritime</option>"}
								${userProfile.industryfocus1 =='65' ? "<option value='65' selected>Maritime - Offshore &amp; Marine Engineering</option>" : "<option value='65'>Maritime - Offshore &amp; Marine Engineering</option>"}
								${userProfile.industryfocus1 =='66' ? "<option value='66' selected>Maritime - Port</option>" : "<option value='66'>Maritime - Port</option>"}
								${userProfile.industryfocus1 =='67' ? "<option value='67' selected>Maritime - Shipping</option>" : "<option value='67'>Maritime - Shipping</option>"}
								${userProfile.industryfocus1 =='68' ? "<option value='68' selected>Mass Merchandiser</option>" : "<option value='68'>Mass Merchandiser</option>"}
								${userProfile.industryfocus1 =='69' ? "<option value='69' selected>Medical Equipment</option>" : "<option value='69'>Medical Equipment</option>"}
								${userProfile.industryfocus1 =='70' ? "<option value='70' selected>Merchandising</option>" : "<option value='70'>Merchandising</option>"}
								${userProfile.industryfocus1 =='71' ? "<option value='71' selected>Military</option>" : "<option value='71'>Military</option>"}
								${userProfile.industryfocus1 =='72' ? "<option value='72' selected>Mining / Drilling / Resources</option>" : "<option value='72'>Mining / Drilling / Resources</option>"}
								${userProfile.industryfocus1 =='73' ? "<option value='73' selected>Mortgage</option>" : "<option value='73'>Mortgage</option>"}
								${userProfile.industryfocus1 =='74' ? "<option value='74' selected>Newspaper</option>" : "<option value='74'>Newspaper</option>"}
								${userProfile.industryfocus1 =='75' ? "<option value='75' selected>Not for Profit - Charitable</option>" : "<option value='75'>Not for Profit - Charitable</option>"}
								${userProfile.industryfocus1 =='76' ? "<option value='76' selected>Office Supplies - Equipment</option>" : "<option value='76'>Office Supplies - Equipment</option>"}
								${userProfile.industryfocus1 =='77' ? "<option value='77' selected>Oil Refining - Petroleum - Drilling</option>" : "<option value='77'>Oil Refining - Petroleum - Drilling</option>"}
								${userProfile.industryfocus1 =='78' ? "<option value='78' selected>Other</option>" : "<option value='78'>Other</option>"}
								${userProfile.industryfocus1 =='79' ? "<option value='79' selected>Other Great Industries</option>" : "<option value='79'>Other Great Industries</option>"}
								${userProfile.industryfocus1 =='80' ? "<option value='80' selected>Packaging</option>" : "<option value='80'>Packaging</option>"}
								${userProfile.industryfocus1 =='81' ? "<option value='81' selected>Pet Store</option>" : "<option value='81'>Pet Store</option>"}
								${userProfile.industryfocus1 =='82' ? "<option value='82' selected>Pharmaceutical</option>" : "<option value='82'>Pharmaceutical</option>"}
								${userProfile.industryfocus1 =='83' ? "<option value='83' selected>Polymer / Plastic / Rubber</option>" : "<option value='83'>Polymer / Plastic / Rubber</option>"}
								${userProfile.industryfocus1 =='84' ? "<option value='84' selected>Printing - Publishing</option>" : "<option value='84'>Printing - Publishing</option>"}
								${userProfile.industryfocus1 =='85' ? "<option value='85' selected>Public Relations</option>" : "<option value='85'>Public Relations</option>"}
								${userProfile.industryfocus1 =='86' ? "<option value='86' selected>Quick Service or Fast Food Restaurant</option>" : "<option value='86'>Quick Service or Fast Food Restaurant</option>"}
								${userProfile.industryfocus1 =='87' ? "<option value='87' selected>Real Estate - Property Mgt</option>" : "<option value='87'>Real Estate - Property Mgt</option>"}
								${userProfile.industryfocus1 =='88' ? "<option value='88' selected>Recreation</option>" : "<option value='88'>Recreation</option>"}
								${userProfile.industryfocus1 =='89' ? "<option value='89' selected>Repair / Maintenance Services</option>" : "<option value='89'>Repair / Maintenance Services</option>"}
								${userProfile.industryfocus1 =='90' ? "<option value='90' selected>Research &amp; Development</option>" : "<option value='90'>Research &amp; Development</option>"}
								${userProfile.industryfocus1 =='91' ? "<option value='91' selected>Restaurant</option>" : "<option value='91'>Restaurant</option>"}
								${userProfile.industryfocus1 =='92' ? "<option value='92' selected>Retail</option>" : "<option value='92'>Retail</option>"}
								${userProfile.industryfocus1 =='93' ? "<option value='93' selected>Retail Bank</option>" : "<option value='93'>Retail Bank</option>"}
								${userProfile.industryfocus1 =='94' ? "<option value='94' selected>Sales - Marketing</option>" : "<option value='94'>Sales - Marketing</option>"}
								${userProfile.industryfocus1 =='95' ? "<option value='95' selected>Science &amp; Technology</option>" : "<option value='95'>Science &amp; Technology</option>"}
								${userProfile.industryfocus1 =='96' ? "<option value='96' selected>Securities</option>" : "<option value='96'>Securities</option>"}
								${userProfile.industryfocus1 =='97' ? "<option value='97' selected>Security</option>" : "<option value='97'>Security</option>"}
								${userProfile.industryfocus1 =='98' ? "<option value='98' selected>Semiconductor</option>" : "<option value='98'>Semiconductor</option>"}
								${userProfile.industryfocus1 =='99' ? "<option value='99' selected>Services - Corporate B2B</option>" : "<option value='99'>Services - Corporate B2B</option>"}
								${userProfile.industryfocus1 =='100' ? "<option value='100' selected>Social Services</option>" : "<option value='100'>Social Services</option>"}
								${userProfile.industryfocus1 =='101' ? "<option value='101' selected>Sporting Goods</option>" : "<option value='101'>Sporting Goods</option>"}
								${userProfile.industryfocus1 =='102' ? "<option value='102' selected>Telecommunications</option>" : "<option value='102'>Telecommunications</option>"}
								${userProfile.industryfocus1 =='103' ? "<option value='103' selected>Training</option>" : "<option value='103'>Training</option>"}
								${userProfile.industryfocus1 =='104' ? "<option value='104' selected>Transportation</option>" : "<option value='104'>Transportation</option>"}
								${userProfile.industryfocus1 =='105' ? "<option value='105' selected>Travel</option>" : "<option value='105'>Travel</option>"}
								${userProfile.industryfocus1 =='106' ? "<option value='106' selected>Wireless</option>" : "<option value='106'>Wireless</option>"}
								${userProfile.industryfocus1 =='107' ? "<option value='107' selected>Wood / Fibre / Paper</option>" : "<option value='107'>Wood / Fibre / Paper</option>"}
				        </form:select>			    	
			    	</td>
			    	<td class="leftalign" nowrap><br><label>Company Experiences</label> <br>
			    	<form:input size="25" path="companyexperience1" /><br>
					<form:input size="25" path="companyexperience2" /><br>
					<form:input size="25" path="companyexperience3" />
					</td>
				</tr>
				</table>
				<hr>
				<br>
				<table>
				<tr>
					<td class="leftalign" > <label>Overview: Provide an overview of your business </label> <font style="font-size: 14px; color: red;"> <form:errors path="overview" cssClass="error" /></font><br>
						<form:textarea  name="wysiwyg" class="required" cols="100"
						id="wysiwyg" rows="10" path="overview" value="&nbsp;"/> 
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>	
				<td class="leftalign" nowrap> <label>Service Description: Describe the services that you offer</label> <form:errors path="serviceDescription" cssClass="error" /> 
				<font style="font-size: 14px; color: red;"><form:errors path="serviceDescription" cssClass="error" /></font> <br>
					<div style="height: 10px;"></div>
					<form:textarea name="wysiwyg1" class="required" cols="100"
					 id="wysiwyg1" rows="10" path="serviceDescription" value="&nbsp;"/>
				</td>
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
