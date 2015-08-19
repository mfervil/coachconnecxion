<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Customer Coaching/Training Packages</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Customers can view a listing of all the training and coaching packages they have ordered" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_head.jsp" %>
	
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

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>

	<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a><br><br>

	<table style="width: 98%;">
		<tr>

<%-- 			<td	style="width: 15%; vertical-align: top; background-color: #EAEAEA; padding: 5px;">
			<%@ include file="/WEB-INF/views/tutor/common/left_nav.jsp" %>
			</td>
--%>

			<td style="width: 85%;">
			
			<c:url var="mainUrl" value="/packageAdd" />
			<h1 style="font-size:14px;">${message}</h1>

			<h2 style="font-size:16px; text-align: center; font-weight:bold;">PURCHASES AND MESSAGES</h2>
			<br>
			<table style="border: 1px solid; width: 100%; text-align: center">
				<thead style="background: #EAEAEA;">
					<tr>
						<th style="text-align: center;width: 10%;">Vendor Name</th>
						<th style="text-align: center;width: 20%;">Package Name</th>
						<th style="text-align: center;width: 5%;">Price</th>
						<th style="text-align: center;width: 10%;">Order Date</th>
						<th style="text-align: center;width: 15%;">Vendor Email</th>						
						<th style="text-align: center;width: 15%;">Vendor Phone</th>						
						<th style="text-align: center;width: 15%;">Rating</th>						
						<th style="text-align: center;width: 10%;">Message</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${customerPackages}" var="packages">
					
						<c:set var="todisplayname" value="${packages.todisplayname}"/>						
						<c:set var="fromdisplayname" value="${packages.fromdisplayname}"/>						
					
						<c:if test="${empty packages.todisplayname}">
							<c:set var="todisplayname" value="${packages.tofirstname}"/>						
						</c:if>
						<c:if test="${empty packages.fromdisplayname}">
							<c:set var="fromdisplayname" value="${packages.fromfirstname}"/>						
						</c:if>
						
						<tr>
							<td style="text-align: center;"><c:out value="${todisplayname}" /></td>
							<td style="text-align: center;"><c:out value="${packages.packageName}" /></td>

							<!-- NEED TO MAKE SURE I RETURN ENTRY TYPES OF 0 OR 1 ONLY -->
							<c:if test="${ packages.Entrytype != 1}">
								<td style="text-align: center;"><c:out value="${packages.priceValue}" /></td>
								<td style="text-align: center;"><c:out value="${fn:substring(packages.orderdate, 0, 10)}" /></td>
								<td style="text-align: center;"><c:out value="${packages.toemail}" /></td>
								<td style="text-align: center;"><c:out value="${packages.tophone}" /></td>
								<td style="text-align: center;">
								<a style="color: #0000FF;" href="${pageContext.request.contextPath}/tutor/feedbackAdd?vendorName=${todisplayname}&projectName=${packages.packageName}&vendorId=${packages.toprofileid}&packageId=${packages.packageId}&paymentId=${packages.orderid}&customerId=${currentUserId}&projectName=${packages.packagename}&vendorName=${packages.displayname}" >Rate this job</a> </td>
							</c:if>

							<c:if test="${ packages.entrytype == 1}">
								<td style="text-align: left; font-weight: bold" colspan="5">THIS ENTRY NOT AN ORDER -- USE ONLY TO SEND/GET MESSAGES TO COACH</td>
							</c:if>
							
							
							<td style="text-align: center; 	white-space: nowrap;" ><a style="color: #0000FF;" href="${pageContext.request.contextPath}/tutor/workroom/wrsendMessage?fromprofileid=${packages.fromprofileid}&orderid=${packages.orderid}&toprofileid=${packages.toprofileid}
										&fromemail=${packages.fromemail}&toemail=${packages.toemail}&todisplayname=${todisplayname}&fromdisplayname=${fromdisplayname}">
										<c:if test="${packages.unreadmessages ne '0' }">New Msg(${packages.unreadmessages})</c:if>
										<c:if test="${packages.unreadmessages == '0' }">All Msg</c:if>
									</a>
							</td>
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
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>	