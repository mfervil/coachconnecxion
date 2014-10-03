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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Select Coaching Categories</title>

<script type="text/javascript">
	function onmouseOver1(enableDiv, id) {		
		createCookie('field1', enableDiv, 1);		
		createCookie('field2', id, 1);
	}
	function eraseCookie(name) {
		createCookie(name, "", -1);
	}
	function createCookie(name, value, days) {
		if (days) {
			var date = new Date();
			date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
			var expires = "; expires=" + date.toGMTString();
		} else
			var expires = "";
		document.cookie = name + "=" + value + expires + "; path=/";
	}
	function readCookie(name) {
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for ( var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ')
				c = c.substring(1, c.length);
			if (c.indexOf(nameEQ) == 0)
				return c.substring(nameEQ.length, c.length);
		}
		return null;
	}
	function onloadFuntion() {				
			document.getElementById(readCookie('field2')).style.color = '#FF0000';
			document.getElementById(readCookie('field1')).style.display = "block";
		
	}
	function changeColor(id, id1) {
		createCookie('field1', id1, 1);			
		createCookie('field2', id, 1);
	
		return false;
	}
</script>

	
</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>


	<div
		style="text-align: center; width: 900px; font-size: large; font-weight: bold; color: blue">Select
		Coaching Categories</div>
	<div style="height: 10px"></div>


	
	<table style="width:900px;">
		<tr>
			<td style="text-align: left; vertical-align: top; width: 200px;"><c:forEach
					items="${coachingCategory}" var="Category">
					<c:url var="editUrl"
						value="/getRequestDetails?id=${Category.categoryId}" />
					<table style="clear:both;display: inline;">
						<tr>
							<td style="text-align: left; vertical-align: top; width: 200px;"><a
								href="${editUrl}" style="font-size: 14px;color:blue;font-weight: bold;" onclick="onmouseOver1('${Category.categoryName}','${Category.categoryId}');">${Category.categoryName}</a><br>
									 <c:if test="${Category.categoryId==2}">
										<c:forEach items="${coachingCategory2}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if> <c:if test="${Category.categoryId==3}">
										<c:forEach items="${coachingCategory3}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if> <c:if test="${Category.categoryId==4}">
										<c:forEach items="${coachingCategory4}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if> <c:if test="${Category.categoryId==5}">
										<c:forEach items="${coachingCategory5}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if> <c:if test="${Category.categoryId==6}">
										<c:forEach items="${coachingCategory6}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if> <c:if test="${Category.categoryId==7}">
										<c:forEach items="${coachingCategory7}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width:200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if> <c:if test="${Category.categoryId==8}">
										<c:forEach items="${coachingCategory8}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if> <c:if test="${Category.categoryId==9}">
										<c:forEach items="${coachingCategory9}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if>
									 <c:if test="${Category.categoryId==10}">
										<c:forEach items="${coachingCategory10}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if>
									 <c:if test="${Category.categoryId==11}">
										<c:forEach items="${coachingCategory11}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if>
									 <c:if test="${Category.categoryId==12}">
										<c:forEach items="${coachingCategory12}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if>
									 <c:if test="${Category.categoryId==13}">
										<c:forEach items="${coachingCategory13}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if>
									 <c:if test="${Category.categoryId==14}">
										<c:forEach items="${coachingCategory14}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if>
									 <c:if test="${Category.categoryId==15}">
										<c:forEach items="${coachingCategory15}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if>
									 <c:if test="${Category.categoryId==16}">
										<c:forEach items="${coachingCategory16}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if>
									 <c:if test="${Category.categoryId==17}">
										<c:forEach items="${coachingCategory17}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if>
									 <c:if test="${Category.categoryId==18}">
										<c:forEach items="${coachingCategory18}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if>
									 <c:if test="${Category.categoryId==19}">
										<c:forEach items="${coachingCategory19}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if>
									 <c:if test="${Category.categoryId==20}">
										<c:forEach items="${coachingCategory20}" var="SubCategory">
											<tr>
												<td style="width: 100px;">
													<ol
														style="list-style: none; text-align: left; margin-left: 10px; width: 200px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;" onclick="changeColor('${SubCategory.categoryId}','${Category.categoryName}')">${SubCategory.categoryName}</a></li>
													</ol>
												</td>
											</tr>

										</c:forEach>
									</c:if></td>
						</tr>
					</table>
				</c:forEach></td>
		</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
