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

	<h2 style="text-align: center;">Create/Update Your Profile</h2>	<br>								
	<table style="width: 900px;">
		<tr>
			<td style="width: 730px; padding: 5px;">
				<table>
					<tr>
						<td style="margin-top: 4px;"> <!-- style="margin-top -->
						

	<table style="border:1px solid black; width:100%">	
				<%-- <tr><td colspan="2" ><label style="font-size:20px;">PROFILE INFORMATION</label></td> </tr>  --%>
				<%-- 
				<tr><td class="leftalign" nowrap colspan="2" ><label>Upload Image/Logo: <b>${userProfile.profile_picture_name}</b></label> <input type="file" name="frmprofilepicture"
					id="frmprofilepicture" ></input></td> 
					<td class="leftalign" nowrap ><label>YouTube Video Link </label> <form:input size="25" path="video_url" /><br> <b>Link ex.: https://www.youtube.com/watch?v=1234 </b></td>
				</tr>
				--%>
				<tr><td class="leftalign" nowrap><form:errors path="firstname"><form:errors path="firstname" cssClass="error" /><br></form:errors><label>*First Name:</label> <form:input size="25" path="firstname" /> </td> 
					<td class="leftalign" nowrap><form:errors path="middleinitial"><form:errors path="middleinitial" cssClass="error" /><br></form:errors><label>Middle Initial:</label> <form:input size="2" path="middleinitial" /> </td>
					<td class="leftalign" nowrap><form:errors path="lastname"><form:errors path="lastname" cssClass="error" /><br></form:errors><label>*Last Name:</label> <form:input size="25" path="lastname" /> </td>
				</tr>
				<tr><td class="leftalign" nowrap><form:errors path="displayName"><form:errors path="displayName" cssClass="error" /><br></form:errors><span class="required">*</span> <label>Display Name:</label> <form:input size="20" path="displayName" /> </td> 
					<td class="leftalign" nowrap><form:errors path="email"><form:errors path="email" cssClass="error" /><br></form:errors><span class="required">*</span> <label>Email:</label> <form:input size="25" path="email" /> </td>
					<td class="leftalign" nowrap><form:errors path="phone"><form:errors path="phone" cssClass="error" /><br></form:errors><span class="required"></span><label>Phone:</label> <form:input size="25" path="phone" /> </td>
				</tr>
	</table>

				<br>

	<table style="border:1px solid black;">			
			<tr>
			    	<td class="leftalign" nowrap><form:errors path="coachingcategory1" cssClass="error" /><label>*Coaching Type Needed</label><br>
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
				        &nbsp; &nbsp; &nbsp;				        
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
				        &nbsp; &nbsp; &nbsp;
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
			</tr>	
	</table>			
	<br>			
	<table>
				<tr>
					<td class="leftalign" > <label>Overview: Provide a brief description of what you want to accomplish </label> <font style="font-size: 14px; color: red;"> <form:errors path="overview" cssClass="error" /></font><br>
						<form:textarea  name="wysiwyg" class="required" cols="100"
						id="wysiwyg" rows="10" path="overview" value="&nbsp;"/> 
					</td>
				</tr>
<%-- 
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
<%-- 		
		<input type="hidden" name="profile_picture_type" id="profile_picture_type" value="${userProfile.profile_picture_type}"></input>
		<input type="hidden" name="profile_picture_name" id="profile_picture_name" value="${userProfile.profile_picture_name}"></input>
--%>		
		</form:form>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
