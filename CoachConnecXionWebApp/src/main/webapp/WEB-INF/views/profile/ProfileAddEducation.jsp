
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Add Coach/Trainer Profile Education</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Area where Coaches and Trainers can add or edit their education" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

<style type="text/css">
table tr {
	border: none
}

table tbody {
	border: none;
}
</style><STYLE>
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
</STYLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="js/calendar.js">
	
</script>
<link href="css/calendar.css" rel="stylesheet" type="text/css" />
<style type='text/css'>
div#myDialog {
text-align:center;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 350px;
	
	margin: -101px 0 0 -251px;
	border: 1px solid rgb(128, 128, 128);
	background-color: #EAEAEA;
	border-radius:10px;
	padding:10px;
}

lable {
	font-size: 14px;
}

</style>
<script>
	function disableObjects() {		
		var value1 = document.getElementById("success").value;	
		if(value1 !=""){
			document.getElementById("submit1").disabled=true;
			if (document.all || document.getElementById) {
				for (i = 0; i < addWorkExperience.length; i++) {
				var formElement = addWorkExperience.elements[i];
				
					if (true) {
						formElement.disabled = true;
					}
				}
			}
		}else{		
			document.getElementById("submit1").disabled=false;
		}
	}	
</script>

</head>
<body onload="disableObjects();">

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

	<div
		style="text-align: center; width: 900px; font-size: large; font-weight: bold; color: blue">
		Add/Edit Education</div>
	<div style="height: 10px"></div>

	<table style="width: 900px;">

		<tr>
			<td style="width: 150px; vertical-align: top;background-color: #EAEAEA;padding: 5px;">
				<table>
					
					<tr>
						<td
							style="font-size: 14px; text-align: left;"><a
							href="profile" style="text-decoration: none">Profile
								Overview </a></td>
					</tr>

					<tr>
						<td
							style="font-size: 14px; text-align: left;"><a
							href="" style="text-decoration: none">Portfolio</a></td>
					</tr>
					<tr>
						<td
							style="font-size: 14px; text-align: left;"><a
							href="workexperience" style="text-decoration: none;">Job
								History</a></td>
					</tr>
					<tr>
						<td
							style="font-size: 14px; text-align: left;"><a
							href="education" style="text-decoration: none;font-weight: :bold;">Education</a></td>
					</tr>
				</table>


			</td>


			<td>
				<div style="text-align: left;margin-left:10px;">
			
				<input type="hidden" name="success" id="success" value="${successMessage}"></input>

					<c:choose>
						<c:when test="${not empty successMessage}">
							<div id='myDialog'>
								<h1 style="font-size: 14px; color: green;">${successMessage}</h1>
								 <br>
								 Click&nbsp;&nbsp;<a href="profileeducationAdd?profileId=${profileId}" style="font-size: 14px;text-decoration: underline;color:blue;">here</a>&nbsp;&nbsp;To create another Education
								 <br>OR
								 <br>
								Click&nbsp;&nbsp;<a href="profile?profileId=${profileId}" style="font-size: 14px;text-decoration: underline;color:blue;">here</a>&nbsp;&nbsp;To continue summary page								
								<div style="height: 15px;"></div>
							</div>
						</c:when>
					</c:choose>
				</div>
				
					<c:url var="educationUrl" value="/profileeducationAdd" />
					<form:form modelAttribute="educationAttribute" method="POST" id="addWorkExperience"
						action="${educationUrl}">

					<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>
						
						<table>
												<tr>
							<td style="text-align: left; width: 150px;"><form:label
									path="degreeLevel">Degree Level:</form:label></td>
							<td style="text-align: left;width:200px;"><form:select
									style="width: 202px;" path="degreeLevel">
									<form:option value="Master Degree">Master Degree</form:option>
									<form:option value="Bacher Degree">Bacher Degree</form:option>

								</form:select>
								</td><td style="text-align: left;"><h1 style="font-size: 14px; color: red;">${errorMessage}</h1></td>
						</tr>
						<tr>
							<td style="text-align: left; width: 150px;"><form:label
									path="schoolName">School Name:</form:label></td>
							<td style="text-align: left;"><form:input type="text"
									size="30"  path="schoolName" maxlength="100" cssStyle="width: 197px;"/></td>
									<td style="text-align: left;"><h1 style="font-size: 14px; color: red;">${errorMessage1}</h1></td>
						</tr>
						<tr>

							<td style="text-align: left;"><label for="fromDate">From
									Date:</label></td>
							<td style="text-align: left;"><form:input type="text"
									size="30" name="datum1" path="fromDate" cssStyle="width: 197px;"/></td>
									<td style="text-align: left;">Ex:mm/dd/yyyy<h1 style="font-size: 14px; color: red;">${errorMessage2}</h1></td>
						</tr>
						<tr>
							<td style="text-align: left;"><label for="toDate">To
									Date:</label></td>
							<td style="text-align: left;"><form:input type="text"
									size="30" name="datum2" path="toDate" cssStyle="width: 197px;"/></td>
										<td style="text-align: left;">Ex:mm/dd/yyyy<h1 style="font-size: 14px; color: red;">${errorMessage6}</h1></td>
									
						</tr>
						<tr>
							<td style="text-align: left;"><form:label path="graduatedId">Graduated:</form:label></td>
							<td style="text-align: left;"><form:select
									style="width: 202px;"  path="graduatedId">
									<form:option value="0">Yes</form:option>
									<form:option value="1">No</form:option>
								</form:select></td>
								<td></td>
						</tr>
						<tr>
							<td style="text-align: left;"><form:label
									path="concentrationsName">Concentrations:</form:label></td>
							<td style="text-align: left;"><form:input type="text"
									size="30" path="concentrationsName" maxlength="100" cssStyle="width: 197px;"/></td>
									<td style="text-align: left;"><h1 style="font-size: 14px; color: red;">${errorMessage3}</h1></td>
						</tr>

						<tr>
							<td style="text-align: left;"><form:label path="countryName">Country:</form:label></td>
							<td style="text-align: left;"><form:input type="text"
									size="30" path="countryName" maxlength="100" cssStyle="width: 197px;"/></td>
									<td style="text-align: left;"><h1 style="font-size: 14px; color: red;">${errorMessage4}</h1></td>
						</tr>
						<tr>
							<td style="text-align: left;"><form:label
									path="locationsName">City/State:</form:label></td>
							<td style="text-align: left;"><form:input type="text"
									size="30" path="locationsName" maxlength="100" cssStyle="width: 197px;"/></td>
									<td style="text-align: left;"><h1 style="font-size: 14px; color: red;">${errorMessage5}</h1></td>
						</tr>
						<tr>
						<td></td>
							<td style="text-align: left;"><input type="submit"
								style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right;"
								value="Save Changes" name="submit1" id="submit1" disabled></td>
						</tr>
						</table>
					</form:form>


				<table style="margin-left: 0px; margin-top: -31px;">
					<tr>
						<td><c:url var="profileUrl" value="/profile" /> <form:form
								commandName="/profile" method="GET" action="${profileUrl}">
								<input type="submit"
									style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right;"
									value="Cancel">
							</form:form></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
