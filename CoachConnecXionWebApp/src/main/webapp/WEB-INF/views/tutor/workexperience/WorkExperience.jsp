<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Coach/Trainer work experience</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="View the work experience of the coach or trainer" />
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
</style>
<STYLE>
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

</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>
	
	<div
		style="text-align: center; width: 900px; font-size: large; font-weight: bold; color: blue">Work
		Experience</div>
	<div style="width: 900px;">
		<c:url var="jobhistoryUrl" value="/tutor/jobhistoryAdd" />
		<form:form method="GET" action="${jobhistoryUrl}"
			commandName="jobHostoryAttribute">

			<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>
			<table>
				<tr>
					<td><input type="submit" value="Add Job History"
						style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right; float: right;" /></td>
				</tr>
			</table>
		</form:form>
	</div>
	<div style="height: 10px"></div>
	<table style="width: 900px;">
		<tr>
			<td
				style="width: 150px; vertical-align: top; background-color: #EAEAEA; padding: 5px;">
				<table>

					<tr>
						<td style="font-size: 14px; text-align: left;"><a
							href="profile?profileId=${profileId}" style="text-decoration: none">Profile
								Overview </a></td>
					</tr>

					<tr>
						<td style="font-size: 14px; text-align: left;"><a href="packages?profileId=${profileId}"
							style="text-decoration: none">Packages</a></td>
					</tr>
					<tr>
						<td style="font-size: 14px; text-align: left;"><a
							href="workexperience?profileId=${profileId}"
							style="text-decoration: none; font-weight: bold;">Job History</a></td>
					</tr>
					<tr>
						<td style="font-size: 14px; text-align: left;"><a
							href="education?profileId=${profileId}" style="text-decoration: none">Education</a></td>
					</tr>
				</table>


			</td>

			<td style="vertical-align: top; width: 700px;">
				<div style="height: 10px;"></div>
				<h1 style="font-size: 14px;">${message}</h1>
				<div style="height: 10px;"></div>
				<table style="text-align: center;">
					<tbody>
						<c:forEach items="${addExperiences}" var="Experience">
							<c:url var="editUrl" value="experienceEdit?id=${Experience.id}&profileId=${profileId}" />
							<c:url var="deleteUrl"
								value="experienceDelete?id=${Experience.id}&profileId=${profileId}" />
							<tr>
								<td style="text-align: left;">
									<table>
										<tr>
											<td
												style="width: 100px; text-align: left; font-weight: bold;">Title
												:</td>
											<td style="text-align: left;"><div
													style="width: 450px; word-wrap: break-word;">
													<c:out value="${Experience.labelName}" />
												</div></td>
										</tr>
										<tr>
											<td
												style="width: 100px; text-align: left; font-weight: bold;">Employer
												:</td>
											<td style="text-align: left;"><div
													style="width: 450px; word-wrap: break-word;">
													<c:out value="${Experience.employerName}" />
												</div></td>
										</tr>
										<tr>
											<td
												style="width: 100px; text-align: left; font-weight: bold;">Duration :</td>
											<td style="text-align: left;"><div
													style="width: 450px; word-wrap: break-word;">
													<c:out value="${Experience.startDate}" />
													To
													<c:out value="${Experience.endDate}" />
												</div></td>
										</tr>
										<tr>
											<td
												style="width: 100px; text-align: left; font-weight: bold;">Country
												:</td>
											<td style="text-align: left;"><div
													style="width: 450px; word-wrap: break-word;">
													<c:out value="${Experience.countryName}" />
												</div></td>
										</tr>
										<tr>
											<td
												style="width: 100px; text-align: left; font-weight: bold;">City/State
												:</td>
											<td style="text-align: left;"><div
													style="width: 450px; word-wrap: break-word;">
													<c:out value="${Experience.locationName}" />
												</div></td>
										</tr>
										<tr>
											<td
												style="width: 100px; text-align: left; font-weight: bold; vertical-align: top;">Description
												:</td>
											<td style="text-align: left;">
												<div style="width: 450px; word-wrap: break-word;">
													<c:out value="${Experience.descriptionDetails}" />
												</div>
											</td>
										</tr>
									</table>
							

								</td>
								<td style="vertical-align: top;">
								<div style="margin-left: -80px;">
								<a href="${editUrl}"
									style="font-size: 14px; text-decoration: underline;">Edit</a>&nbsp;&nbsp;&nbsp;
									<a href="${deleteUrl}"
									style="font-size: 14px; text-decoration: underline;">Delete</a>	</div>	
									</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</td>
		</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>	
