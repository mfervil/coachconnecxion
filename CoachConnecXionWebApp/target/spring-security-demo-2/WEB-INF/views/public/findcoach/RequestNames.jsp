<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Selecting your coach</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="WEISS - HTML5 Responsive Template" />
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
</style>
	
</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

	<h1 style="color: red; font-size: 14px;">
		<c:out value="${errorMessage}"></c:out>
	</h1>
	<h1 style="color: green; font-size: 14px;">${successMessage}</h1>

	<c:url var="saveUrl1"
		value="/public/requestNames?id=${requestNameAttribute.id}" />
	<form:form modelAttribute="requestNameAttribute" method="POST"
		action="${saveUrl1}">
		<form:input type="text" path="requestName"
			cssStyle="border:none; background:none;font-weight:bold;text-align: center; width: 900px; font-size: large;  color: blue"
			readonly="true"></form:input>

		<div style="height: 10px"></div>
		<table style="width: 900px;">

			<tr>
				<td style="text-align: left;"><b>Date Posted:</b></td>
				<td style="text-align: left;"><b><form:input
							path="datePosted"
							cssStyle="border:none; background:none;font-weight:bold;text-align:left"
							readonly="true" /></b></td>
				<td style="text-align: left;"><b>Desired Rate:</b></td>
				<td style="text-align: left;"><b><form:input
							path="desiredRate"
							cssStyle="border:none; background:none;font-weight:bold;"
							readonly="true" size="3" />/hour</b></td>
			</tr>
			<tr>
				<td style="text-align: left;"><b>location:</b></td>
				<td style="text-align: left;"><b><form:input
							path="locationName"
							cssStyle="border:none; background:none;font-weight:bold;"
							readonly="true" /></b></td>
				<td style="text-align: left;"><b>Desired Start Date:</b></td>
				<td style="text-align: left;"><b><form:input
							path="desiredstartDate"
							cssStyle="border:none; background:none;font-weight:bold;"
							readonly="true" /></b></td>
			</tr>

		</table>
		<table style="width: 900px;">
			<tr>
				<td style="text-align: left;"><b>Request Details</b> <br></br>

					<form:textarea path="requestDetails" cols="10" rows="10"
						cssStyle="margin-top:-10px;font-family:Tahoma;font-size: 10pt;border: none;font-weight: normal;padding:1px; min-height:30px; max-height: 1000px; width: 900px; float: left; overflow-x: hidden;font-family:Arial;"
						readonly="true" /></td>
			</tr>
		</table>
		<table border="1" style="height: 199px; width: 900px">
			<tr>
				<td valign="top" style="font-weight: bold; text-align: left;">Describe
					Your Proposal<br> Describe how your best suited to perform
					this service <br> <textarea rows="8" cols="70"
						name="proposalDescription"
						style="max-width: 900px; max-height: 200px;"></textarea><br>
					<label>Proposed Hourly Rate:$</label> <input type="text"
					name="proposedhourlyrate1" style="size: 30;" /> <br></br>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;"><input type="submit"
					style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right;"
					value="Submit Proposal"></td>

			</tr>
		</table>
	</form:form>
	<table style="margin-top: -31px; margin-left: 146px;">
		<tr>
			<td><c:url var="Allrequests" value="/public/Allrequests" /> <form:form
					commandName="/public/Allrequests" method="GET" action="${Allrequests}">
					<input type="submit"
						style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right; float: left;"
						value="Back">
				</form:form></td>
		</tr>
	</table>
	</td>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	


