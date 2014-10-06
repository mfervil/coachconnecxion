<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>View Customer Packages</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content=" CoachConnecXion" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>
	
	<%@taglib prefix="enc" uri="/WEB-INF/tags/customtaglib.tld"%>
	
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

	<table style="width: 98%;">
		<tr>

<%-- 			<td	style="width: 15%; vertical-align: top; background-color: #EAEAEA; padding: 5px;">
			<%@ include file="/WEB-INF/views/common/left_nav.jsp" %>
			</td>
--%>

			<td style="width: 85%;">
			
			<c:url var="mainUrl" value="/packageAdd" />
			<h1 style="font-size:14px;">${message}</h1>

			<h2 style="font-size:16px; text-align: center; font-weight:bold;">PACKAGES PURCHASED</h2>
			<br>
			<table style="border: 1px solid; width: 100%; text-align: center">
				<thead style="background: #EAEAEA;">
					<tr>
						<th style="text-align: center;width: 15%;">Vendor Name</th>
						<th style="text-align: center;width: 20%;">Package Name</th>
						<th style="text-align: center;width: 5%;">Price</th>
						<th style="text-align: center;width: 10%;">Order Date</th>
						<th style="text-align: center;width: 20%;">Vendor Email</th>						
						<th style="text-align: center;width: 15%;">Vendor Phone</th>						
						<th style="text-align: center;width: 15%;">&nbsp;</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${customerPackages}" var="packages">
						<tr>
							<td style="text-align: center;"><c:out value="${packages.displayname}" /></td>
							<td style="text-align: center;"><c:out value="${packages.packagename}" /></td>
							<td style="text-align: center;"><c:out value="${packages.price}" /></td>
							<td style="text-align: center;"><c:out value="${packages.orderdate}" /></td>
							<td style="text-align: center;"><c:out value="${packages.email}" /></td>
							<td style="text-align: center;"><c:out value="${packages.phone}" /></td>
							<td style="border-style: solid; border-width: 1px; text-align: center; white-space:nowrap; text-decoration:underline; color: rgb(0,0,255);" >
							<a href="${pageContext.request.contextPath}/feedbackAdd?vendorId=${packages.userProfileId}&packageId=${packages.packageId}&paymentId=${packages.paymentId}&customerId=${currentUserId}&projectName=${packages.packagename}&vendorName=${packages.displayname}" >Rate this job</a> </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<c:if test="${empty customerPackages}">
				There are currently no packages in your list.
			</c:if>

			</td>
		</tr>
	</table>

</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
