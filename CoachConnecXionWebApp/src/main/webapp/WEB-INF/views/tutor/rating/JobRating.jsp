
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Coaches/Trainers job rating</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Provide a rating for the Coaches and Trainers you worked with" />
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

<script>
	function myFunction() {

		document.getElementById("clientResponse").style.display = 'block';

	}
</script>

</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>

	<div
		style="text-align: center; width: 900px; font-size: large; font-weight: bold; color: blue">Job
		and Rating</div>
	<div style="height: 10px"></div>
	<table style="text-align: center; width: 900px;">
		<tbody>
			<c:forEach items="${addJobratingDetails}" var="Jobrating">
				<c:url var="editUrl" value="/feedbackAdd?id=${Jobrating.id}" />
				<tr>
					<td
						style="vertical-align: top; text-align: left; font-size: 14px; color: blue;width:200px;">

						<font style="font-family: Arial; font-size: 12px; color: black;">
							<b>Project:&nbsp;&nbsp;&nbsp;&nbsp;</b><b><c:out
									value="${Jobrating.projectName}" /></b>

					</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br> <c:if
							test="${Jobrating.ratingDone==1}">
							<br>
							<font style="font-family: Arial; font-size: 12px; color: black;">My
								Rating for this Job</font>
							<br>
							<c:if test="${Jobrating.averageRating>4.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.averageRating>4.25 && Jobrating.averageRating<=4.75}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.averageRating>3.75 && Jobrating.averageRating<=4.25}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.averageRating>3.25 && Jobrating.averageRating<=3.75}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.averageRating>2.75 && Jobrating.averageRating<=3.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.averageRating>2.25 && Jobrating.averageRating<=2.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.averageRating>1.75 && Jobrating.averageRating<=2.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.averageRating>1.25 && Jobrating.averageRating<=1.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.averageRating>0.75 && Jobrating.averageRating<=1.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if test="${Jobrating.averageRating<=0.75}">
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<font
								style="font-family: Arial; font-size: 12px; color: black; vertical-align: top;">Rating</font>
							<br>
							<c:if test="${Jobrating.qualityDetails>4.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.qualityDetails>4.25 && Jobrating.qualityDetails<=4.75}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.qualityDetails>3.75 && Jobrating.qualityDetails<=4.25}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.qualityDetails>3.25 && Jobrating.qualityDetails<=3.75}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.qualityDetails>2.75 && Jobrating.qualityDetails<=3.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.qualityDetails>2.25 && Jobrating.qualityDetails<=2.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.qualityDetails>1.75 && Jobrating.qualityDetails<=2.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.qualityDetails>1.25 && Jobrating.qualityDetails<=1.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.qualityDetails>0.75 && Jobrating.qualityDetails<=1.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if test="${Jobrating.qualityDetails<=0.75}">
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>

							<font
								style="font-family: Arial; font-size: 12px; color: black; vertical-align: top;">Quality
							</font>
							<br>
							<c:if test="${Jobrating.experienceDetails>4.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.experienceDetails>4.25 && Jobrating.experienceDetails<=4.75}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.experienceDetails>3.75 && Jobrating.experienceDetails<=4.25}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.experienceDetails>3.25 && Jobrating.experienceDetails<=3.75}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.experienceDetails>2.75 && Jobrating.experienceDetails<=3.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.experienceDetails>2.25 && Jobrating.experienceDetails<=2.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.experienceDetails>1.75 && Jobrating.experienceDetails<=2.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.experienceDetails>1.25 && Jobrating.experienceDetails<=1.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.experienceDetails>0.75 && Jobrating.experienceDetails<=1.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if test="${Jobrating.experienceDetails<=0.75}">
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>

							<font
								style="font-family: Arial; font-size: 12px; color: black; vertical-align: top;">Experience</font>
							<br>
							<c:if test="${Jobrating.responseDetails>4.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.responseDetails>4.25 && Jobrating.responseDetails<=4.75}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.responseDetails>3.75 && Jobrating.responseDetails<=4.25}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.responseDetails>3.25 && Jobrating.responseDetails<=3.75}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.responseDetails>2.75 && Jobrating.responseDetails<=3.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.responseDetails>2.25 && Jobrating.responseDetails<=2.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.responseDetails>1.75 && Jobrating.responseDetails<=2.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.responseDetails>1.25 && Jobrating.responseDetails<=1.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.responseDetails>0.75 && Jobrating.responseDetails<=1.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if test="${Jobrating.responseDetails<=0.75}">
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>




							<font
								style="font-family: Arial; font-size: 12px; color: black; vertical-align: top;">Response
							</font>
							<br>

							<c:if test="${Jobrating.professionalismDetails>4.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.professionalismDetails>4.25 && Jobrating.professionalismDetails<=4.75}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.professionalismDetails>3.75 && Jobrating.professionalismDetails<=4.25}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.professionalismDetails>3.25 && Jobrating.professionalismDetails<=3.75}">

								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.professionalismDetails>2.75 && Jobrating.professionalismDetails<=3.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.professionalismDetails>2.25 && Jobrating.professionalismDetails<=2.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />

								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.professionalismDetails>1.75 && Jobrating.professionalismDetails<=2.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/starrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />

							</c:if>
							<c:if
								test="${Jobrating.professionalismDetails>1.25 && Jobrating.professionalismDetails<=1.75}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if
								test="${Jobrating.professionalismDetails>0.75 && Jobrating.professionalismDetails<=1.25}">
								<img src="${pageContext.request.contextPath}/images/starrating.png" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<c:if test="${Jobrating.professionalismDetails<=0.75}">
								<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
								<img src="${pageContext.request.contextPath}/images/nostartrating.png"
									style="border: none; margin-left: -5px;" />
							</c:if>
							<font
								style="font-family: Arial; font-size: 12px; color: black; vertical-align: center; vertical-align: top;">Professionalism</font>
						</c:if>
					</td>
					<td style="vertical-align: top; text-align: left;width:400px;"><b>Client:&nbsp;&nbsp;&nbsp;&nbsp;</b><b><c:out
								value="${Jobrating.clientName}" /></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<br></br> <c:if test="${Jobrating.ratingDone==1}">
							
							<b>Feedback Comments</b>
							<br>
					<div style="margin-left:10px;min-height: 80px; width: 450px;word-wrap: break-word;">					
					<c:out value="${Jobrating.feedBacks}" />
					</div>
							
							
							<b>Client Response</b>
						<br>
						<div style="width: 450px;word-wrap: break-word;">			
							<c:out value="${Jobrating.commentDetails}" /></div>
							<c:if test="${Jobrating.clientResponse==0}">
								<a href="#" onclick="myFunction();">Give your comments</a>
							</c:if>
							<div id="clientResponse" style="display: none;">
								<c:url var="responseUrl" value="/responseAdd" />
								<form:form method="GET" action="${responseUrl}"
									commandName="/responseAdd">

									<textarea id="commentDetails1" name="commentDetails1"
										cols="100" rows="10" style="max-width: 350px;"></textarea>
									<table>
										<tr>
											<td><input type="hidden" value="${Jobrating.id}"
												id="jobratingId" name="jobratingId" /></td>
											<td><input type="submit" value="Add your Comments"
												style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right; float: right;" /></td>
										</tr>
									</table>
								</form:form>


							</div>



						</c:if></td>
					<td style="vertical-align: top; text-align: left;width:230px;font-size: 12px;"><b>Date:&nbsp;&nbsp;&nbsp;&nbsp;</b><b><c:out
								value="${Jobrating.awardedDate}" /></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${Jobrating.ratingDone==0}">

							<a href="${editUrl}"
								style="background-color: lightblue; font-size: 12px;">Rate
								this Client</a>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_boxed.jsp" %>	
<%@ include file="/WEB-INF/views/tutor/common/footer_only.jsp" %>	
