<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Coaching/Trainig Orders</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Coaches and trainers can view all the requests made for their services" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>
	
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
	

	<table style="width: 98%;">
		<tr>

			<td style="width: 85%;">
			
			<h1 style="font-size:14px;">${message}</h1>

			<h2 style="font-size:16px; text-align: center; font-weight:bold;">PURCHASES & MESSAGES</h2>
			<br>
			<table style="border: 1px solid; width: 100%; text-align: center">
				<thead style="background: #EAEAEA;">
					<tr>
						<th style="text-align: center;width: 20%;">Customer Name</th>
						<th style="text-align: center;width: 20%;">Package Name</th>
						<th style="text-align: center;width: 10%;">Price</th>
						<th style="text-align: center;width: 10%;">Order Date</th>
						<th style="text-align: center;width: 20%;">Customer Email</th>						
						<th style="text-align: center;width: 20%;">Customer Phone</th>						
						<th style="text-align: center;width: 20%;">Messages</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${coachOrders}" var="coachOrders">

							<c:set var="todisplayname" value="${coachOrders.todisplayname}"/>						
							<c:set var="fromdisplayname" value="${coachOrders.fromdisplayname}"/>						
					
						<c:if test="${empty coachOrders.todisplayname}">
							<c:set var="todisplayname" value="${coachOrders.tofirstname}"/>						
						</c:if>
						<c:if test="${empty coachOrders.fromdisplayname}">
							<c:set var="fromdisplayname" value="${coachOrders.fromfirstname}"/>						
						</c:if>
						
						<tr>
							<td style="text-align: center;"><c:out value="${coachOrders.first_Name} ${coachOrders.last_Name}" /></td>
							<td style="text-align: center;"><c:out value="${coachOrders.package_Name}" /></td>
							<td style="text-align: center;"><c:out value="${coachOrders.package_Price}" /></td>
							<td style="text-align: center;"><c:out value="${fn:substring(coachOrders.currentdate, 0, 10)}" /></td>
							<td style="text-align: center;"><c:out value="${coachOrders.toemail}" /></td>
							<td style="text-align: center;"><c:out value="${coachOrders.phone_Number1}-${coachOrders.phone_Number2}-${coachOrders.phone_Number3} " /></td>
							<td style="text-align: center; 	white-space: nowrap;" ><a style="color: #0000FF;" href="${pageContext.request.contextPath}/workroom/wrsendMessage?fromprofileid=${coachOrders.fromprofileid}&orderid=${coachOrders.orderid}&toprofileid=${coachOrders.toprofileid}
																		&fromemail=${coachOrders.fromemail}&toemail=${coachOrders.toemail}&todisplayname=${todisplayname}&fromdisplayname=${fromdisplayname}">
																		<c:if test="${coachOrders.unreadmessages ne '0' }">New Msg(${coachOrders.unreadmessages})</c:if>
																		<c:if test="${coachOrders.unreadmessages == '0' }">All Msg</c:if>
															</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<c:if test="${empty coachOrders}">
				There are currently no orders in your list.
			</c:if>

			</td>
		</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
