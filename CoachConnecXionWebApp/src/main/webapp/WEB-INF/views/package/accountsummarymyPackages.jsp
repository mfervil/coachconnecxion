<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>View Coach/Trainer Packages</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="View all the packages that our Trainers and Coaches offer" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>
	
<%--
<link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css" />
<script type="text/javascript" src="jquery/jquery-1.3.2.js"></script>
<script type="text/javascript" src="jquery/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="js/packageDetails.js"></script>
<script type="text/javascript" src="js/validations.js"></script>
--%>

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
</script>
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
	<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a><br><br>

	<%-- 
		<c:if test="${sessionScope.newusercreated == '1'}">
			<br> Done with packages: Click&nbsp;&nbsp;<a href="educationAdd?profileId=${userProfileId}"
				style="font-size: 14px; text-decoration: underline; color: blue;">here</a>&nbsp;&nbsp;To
			enter Training and Education.  
		</c:if>
	--%>
			
		<table style="width: 98%;"><tr><td style="width: 15%;">&nbsp;</td><td style="text-align: left"><h1 style="color: blue; font-size: 20px;">MY PACKAGES </h1></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<!--  <td style="font-weight: bold;">Number of Clients:</td>
					<td><c:out value="${totalClients}"></c:out></td>  -->
					<td style="font-weight: bold;">Total Packages Sold:</td>
					<td><c:out value="${totalSold}"></c:out></td>
					<td>&nbsp;&nbsp;</td>
					<!--  <td style="font-weight: bold;">Outstanding Request:</td>
					<td>5</td>  -->
		
		</tr></table>

	
	<table style="width: 98%;">
		<tr>
		<%-- 
			<td	style="width: 15%; vertical-align: top; background-color: #EAEAEA; padding: 5px;">
			<%@ include file="/WEB-INF/views/common/left_nav.jsp" %>
			</td>
		--%>
			
<%-- 111    
	<div
		style="background-color: #FFF; border: 2px; border-color: #216554; text-align: left; border-radius: 5px;">
		<div align="center">
			<div style="height: 10px"></div>
--%>			

			<td style="width: 100%;">
<%-- 			
			<table style="width: 100%; border: none; clear: left;">
				<tr>
					<td style="font-weight: bold;">Number of Clients:</td>
					<td><c:out value="${totalClients}"></c:out></td>
					<td style="font-weight: bold;">Total Packages Sold:</td>
					<td><c:out value="${totalSold}"></c:out></td>
					<td style="font-weight: bold;">Outstanding Request:</td>
					<td>5</td>
				</tr>
			</table>
--%>			
			<%-- br 111
		<div style="height:7px;"></div>
			--%>
			<%-- <div style="height:7px;"></div> --%>
			
			<c:url var="mainUrl" value="/packageAdd" />
			<h1 style="font-size:14px;">${message}</h1>
			<table style="border: 1px solid; width: 100%; text-align: center">
				<thead style="background: #EAEAEA;">
					<tr>
						<th style="text-align: center;width: 40%;">Package Name</th>
						<th style="text-align: center;width: 20%;">Price</th>
						<%-- <th style="text-align: center;width: 100px;">Days to Cancel</th> --%>
						<th style="text-align: center;width: 20%;"># Sold</th>
						<th style="text-align: center;width: 20%;"><a href="${mainUrl}" style="font-size: 14px;text-decoration: underline;">Add a Package</a>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${persons}" var="person">
						<c:url var="editUrl" value="/packageEdit?id=${person.id}" />
						<c:url var="deleteUrl" value="/packagedelete?id=${person.id}" />
						<tr>
							<td style="text-align: center;"><c:out value="${person.packageName}" /></td>
							<td style="text-align: center;"><c:out value="${person.priceValue}" /></td>
							<%-- <td style="text-align: center;"><c:out value="${person.optOutDays}" /></td> --%>
							<td style="text-align: center;"><c:out value="${person.numberSold}" /></td>
							
							<td style="text-align: center;"><a href="${editUrl}" style="font-size: 14px;text-decoration: underline;">Edit</a>&nbsp;&nbsp;&nbsp;
							<a href="${deleteUrl}" onclick="return confirm('Are you sure you want to delete this document?')" style="font-size: 14px;text-decoration: underline;">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<c:if test="${empty persons}">
				There are currently no packages in the list.
			</c:if>

<%-- 
		</div>
	</div>
--%>

<%-- </body>  --%>
			</td>
		</tr>
	</table>

</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
