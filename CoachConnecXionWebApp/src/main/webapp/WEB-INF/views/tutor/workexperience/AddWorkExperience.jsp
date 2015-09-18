<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Add Coach/Trainer work experience</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Add or Edit the work experience of a Coach or Trainer" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_head.jsp" %>

<style type="text/css">
table tr {
	border: none
}

table tbody {
	border: none;
}

body,input {
	margin: 0px;
	padding: 0px;
}

a {
	color: #0254EB
}

a:visited {
	color: #0254EB
}

#header h2 {
	color: white;
	background-color: #00A1E6;
	margin: 0px;
	padding: 5px;
}

.comment {
	width: 100%;
	background-color: #f0f0f0;
}

a.morelink {
	text-decoration: none;
	outline: none;
}

.morecontent span {
	display: none;
}
</style>

<script type="text/javascript" src="js/calendar.js">
	
</script>
<link href="css/calendar.css" rel="stylesheet" type="text/css" />
<script type='text/javascript'>
	$(document).ready(function() {
		$('input#tmpOpen').click(function($e) {
			$('div#myDialog').show(5000);
		});

		$('input#tmpClose').click(function($e) {
			$('div#myDialog').hide(5000);
		});
	});
</script>
<style type='text/css'>
div#myDialog {
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 350px;
	margin: -101px 0 0 -251px;
	border: 1px solid rgb(128, 128, 128);
	background-color: #EAEAEA;
	border-radius: 10px;
	padding: 10px;
}
</style>
<script>
	function myFunction() {
		var value1 = document.getElementById("success").value;
		if (value1 != "") {
			document.getElementById("submit1").disabled = true;
			if (document.all || document.getElementById) {
				for (i = 0; i < addWorkExperience.length; i++) {
				var formElement = addWorkExperience.elements[i];
				
					if (true) {
						formElement.disabled = true;
					}
				}
			}
		} else {
			document.getElementById("submit1").disabled = false;
		}
	}
</script>

</head>
<body onload="myFunction();">
<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>
	
	
	<div
		style="text-align: center; width: 870px; font-size: large; font-weight: bold; color: blue">
		Add/Edit Work Experience</div>
	<div style="height: 10px"></div>
	<table style="width: 870px;">
		<tr>
			<td style="width: 150px; vertical-align: top;background-color: #EAEAEA;padding: 5px;">
				<table>
					
					<tr>
						<td
							style="font-size: 14px; text-align: left;"><a
							href="profile?profileId=${profileId}" style="text-decoration: none">Profile
								Overview </a></td>
					</tr>
					<tr>
						<td
							style="font-size: 14px; text-align: left;"><a
							href="workexperience?profileId=${profileId}" style="text-decoration: none;font-weight:bold;">Job
								History</a></td>
					</tr>
					<tr>
						<td
							style="font-size: 14px; text-align: left;"><a
							href="education?profileId=${profileId}" style="text-decoration: none">Education</a></td>
					</tr>
				</table>


			</td>


			<td>
				<div style="text-align: left; margin-left: 10px;">
					<h1 style="font-size: 14px; color: red;">${errorMessage}</h1>
					<input type="hidden" name="success" id="success"
						value="${successMessage}"></input>

					<c:choose>
						<c:when test="${not empty successMessage}">
							<div id='myDialog'>
								<h1 style="font-size: 14px; color: green;">${successMessage}</h1>
								<br> 
								<a href="jobhistoryAdd?profileId=${profileId}"
								style="font-size: 14px;text-decoration: underline;color:blue;">CREATE ANOTHER EMPLOYER</a>

								<c:if test="${sessionScope.newusercreated != '1'}">
									 <br><br> <a href="workexperience?profileId=${profileId}" style="font-size: 14px;text-decoration: underline;color:blue;">VIEW WORK SUMMARY</a>
								</c:if>	
								
								<c:if test="${sessionScope.newusercreated == '1'}">
									 <br><br> <a href="public/profile?profileId=${profileId}" style="font-size: 14px;text-decoration: underline;color:blue;">DONE WITH WORK HISTORY</a>
								</c:if>	
								
								<div style="height: 15px;"></div>
							</div>
						</c:when>
					</c:choose>

				</div>
				
					<c:url var="jobHistoryUrl" value="/tutor/jobhistoryAdd" />
					<form:form modelAttribute="jobHistoryAttribute" method="POST" id="addWorkExperience"
						action="${jobHistoryUrl}">
						<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>
						
						<table>
						<tr>
							<td style="text-align: left; width: 150px;"><form:label
									path="employerName">Employer:</form:label></td>
							<td style="text-align: left; width: 200px;"><form:input
									type="text" size="30" path="employerName"  maxlength="100"/></td>
							<td style="text-align: left;"><h1
									style="font-size: 14px; color: red;">${errorMessage1}</h1></td>
						</tr>
						<tr>
							<td style="text-align: left; width: 150px;"><form:label
									path="labelName">Title:</form:label></td>
							<td style="text-align: left;"><form:input type="text"
									size="30" path="labelName" maxlength="100"/></td>
							<td style="text-align: left;"><h1
									style="font-size: 14px; color: red;">${errorMessage2}</h1></td>
						</tr>
						<tr>
							<td style="text-align: left; width: 150px;"><form:label
									path="countryName">Country:</form:label></td>
							<td style="text-align: left;"><form:input type="text"
									size="30" path="countryName" maxlength="100"/></td>
							<td style="text-align: left;"><h1
									style="font-size: 14px; color: red;">${errorMessage3}</h1></td>
						</tr>
						<tr>
							<td style="text-align: left; width: 150px;"><form:label
									path="locationName">City/State:</form:label></td>
							<td style="text-align: left;"><form:input type="text"
									size="30" path="locationName" maxlength="100"/></td>
							<td style="text-align: left;"><h1
									style="font-size: 14px; color: red;">${errorMessage4}</h1></td>
						</tr>
						<tr>
							<td style="text-align: left; width: 150px;"><form:label
									path="descriptionDetails">Description:</form:label></td>
							<td style="text-align: left;"><form:textarea cols="20" rows="3" cssStyle="width:192px;" path="descriptionDetails" /></td>
							<td style="text-align: left;"><h1
									style="font-size: 14px; color: red;">${errorMessage5}</h1></td>
						</tr>
						<tr>
							<td style="text-align: left; width: 150px;"><form:label
									path="startDate">Start Date:</form:label></td>
							<td style="text-align: left;"><form:input type="text"
									size="30" path="startDate" /></td>
							<td style="text-align: left;">Ex:mm/dd/yyyy<font
									style="font-size: 14px; color: red;margin-left: 5px;">${errorMessage6}</font></td>
						</tr>
						<tr>
							<td style="text-align: left; width: 150px;"><form:label
									path="endDate">End Date::</form:label></td>
							<td style="text-align: left;"><form:input type="text"
									size="30" path="endDate" /></td>
									<td style="text-align: left;">Ex:mm/dd/yyyy<font
									style="font-size: 14px; color: red;margin-left: 5px;">${errorMessage7}</font></td>
						<tr>
						<tr>
							<td></td>
							<td style="text-align: left;"><input type="submit"
								name="submit1" id="submit1"
								style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right;"
								value="Save Changes" disabled></td>
						</tr>
						</table>
					</form:form>
				


				<c:if test="${sessionScope.newusercreated != '1'}">
					<table style="margin-top: -31px; margin-left: 0px;">
						<tr>
							<td><c:url var="profileUrl" value="public/profile" /> <form:form
									commandName="/workexperience" method="GET" action="${profileUrl}">
							
									<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>
									
									<input type="submit"
										style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right;"
										value="Cancel">
								</form:form></td>
						</tr>
					</table>
				</c:if>				
				
				<c:if test="${sessionScope.newusercreated == '1'}">
					 <br> <a href="public/profile?profileId=${profileId}" style="font-size: 14px;text-decoration: underline;color:blue;">SKIP WORK HISTORY</a>
				</c:if>
				
			</td>
		</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>