<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>View Coach/Trainer Education</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="View the education and background of a coach or trainer" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

	<script>
		function ShowHideSubCat() {
			
			var mainCombo = document.getElementById ("coachingCategory");

			var subCombo1 = document.getElementById ("coachingSubcategory1");
			var subCombo2 = document.getElementById ("coachingSubcategory2");
			var subCombo3 = document.getElementById ("coachingSubcategory3");
			var subCombo0 = document.getElementById ("coachingSubcategory0");

			subCombo0.style.display = 'none';
			subCombo1.style.display = 'none';
			subCombo2.style.display = 'none';
			subCombo3.style.display = 'none';

			if (mainCombo.value == '1') {
				subCombo1.style.display = '';
			} else if (mainCombo.value == '2') {
				subCombo2.style.display = '';
			} else if (mainCombo.value == '3') {
				subCombo3.style.display = '';
			} else {
				subCombo0.style.display = '';
			}
			
		}
		
		function updateSubcategoryValue(subCatPassed){
			document.getElementById ("coachingSubcategory").value = subCatPassed;
		}
	</script>		
	
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
</style>
<script>
	function checkForSuccess() {		
		var value1 = document.getElementById("success").value;	
		if(value1 !=""){
			document.getElementById("submit1").disabled=true;
			if (document.all || document.getElementById) {
				for (i = 0; i < addEducation.length; i++) {
				var formElement = addEducation.elements[i];
				
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
<body onload="checkForSuccess;">

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>


	<div
		style="text-align: center; width: 900px; font-size: large; font-weight: bold; color: blue">Education</div>
	<div style="width: 900px;">
		<c:url var="educationUrl" value="/educationAdd" />
		<form:form method="GET" action="${educationUrl}">
		
		<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>

			<c:if test="${sessionScope.newusercreated == '1'}">
				<br> Done with Education: Click&nbsp;&nbsp;<a href="jobhistoryAdd?profileId=${profileId}"
					style="font-size: 14px; text-decoration: underline; color: blue;">here</a>&nbsp;&nbsp;To
					enter job history.  
			</c:if>

			<table>
				<tr>
					<td><input type="submit" value="Add Education"
						style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right; float: right;" /></td>
				</tr>
			</table>
		</form:form>
	</div>

	<div style="height: 10px;"></div>
	<table style="width: 900px;">
		<tr>
			<td	style="width: 150px; vertical-align: top; background-color: #EAEAEA; padding: 5px;">
			<%@ include file="/WEB-INF/views/common/left_nav.jsp" %>
			</td>
			
			<%-- 
			<td	style="width: 150px; vertical-align: top; background-color: #EAEAEA; padding: 5px;">
				<table>

					<tr>
						<td style="font-size: 14px; text-align: left;"><a
							href="profile?profileId=${profileId}" style="text-decoration: none">Profile
								Overview </a></td>
					</tr>

					<tr>
						<td style="font-size: 14px; text-align: left;"><a href=""
							style="text-decoration: none">Portfolio</a></td>
					</tr>
					<tr>
						<td style="font-size: 14px; text-align: left;"><a
							href="workexperience?profileId=${profileId}" style="text-decoration: none">Job
								History</a></td>
					</tr>
					<tr>
						<td style="font-size: 14px; text-align: left;"><a
							href="education?profileId=${profileId}"
							style="text-decoration: none; font-weight: bold;">Education</a></td>
					</tr>
				</table>
			</td> --%>
			
			<td style="vertical-align: top; width: 700px;">
				<div style="height: 10px;"></div>
				<h1 style="font-size: 14px;">${message}</h1>
				<div style="height: 10px;"></div>
				<table style="text-align: center;">
					<tbody>
						<c:forEach items="${addEducations}" var="Educations">
							<c:url var="editUrl" value="/educationEdit?id=${Educations.id}&profileId=${profileId}" />
							<c:url var="deleteUrl"
								value="/educationDelete?id=${Educations.id}&profileId=${profileId}" />
							<tr>

								<td style="text-align: left;">
									<table>
										<tr>
											<td
												style="width: 130px; text-align: left; font-weight: bold;">School
												Name:</td>
											<td style="text-align: left;">
												<div style="width: 450px; word-wrap: break-word;">
													<c:out value="${Educations.schoolName}" />
												</div>
											</td>
										</tr>
										<tr>
											<td
												style="width: 100px; text-align: left; font-weight: bold;">Degree
												Level:</td>
											<td style="text-align: left;">
												<div style="width: 450px; word-wrap: break-word;">
													<c:out value="${Educations.degreeLevel}" />
												</div>
											</td>
										</tr>
										<tr>
											<td
												style="width: 100px; text-align: left; font-weight: bold;">Concentrations:</td>
											<td style="text-align: left;"><div
													style="width: 450px; word-wrap: break-word;">
													<c:out value="${Educations.concentrationsName}" />
												</div></td>
										</tr>
										<tr>
											<td
												style="width: 100px; text-align: left; font-weight: bold;">Place:</td>
											<td style="text-align: left;">
												<div style="width: 450px; word-wrap: break-word;">
													<c:out value="${Educations.countryName}" />
													-
													<c:out value="${Educations.locationsName}" />
												</div>
											</td>
										</tr>

										<tr>
											<td
												style="width: 100px; text-align: left; font-weight: bold;">Duration
												:</td>
											<td style="text-align: left;"><div
													style="width: 450px; word-wrap: break-word;">
													<c:out value="${Educations.fromDate}" />
													-
													<c:out value="${Educations.toDate}" />
												</div></td>
										</tr>
									</table>

								</td>
								<td
									style="vertical-align: top; border-top-color: -moz-use-text-color;">
									<div style="margin-left: -80px;">
										<a href="${editUrl}"
											style="font-size: 14px; text-decoration: underline;">Edit</a>&nbsp;&nbsp;&nbsp;
										<a href="${deleteUrl}"
											style="font-size: 14px; text-decoration: underline;">Delete</a>
									</div>
								</td>

							</tr>
							<tr><td colspan="2"><hr></td></tr>
						</c:forEach>
					</tbody>
				</table>
			</td>
		</tr>
	</table>
	</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
