<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>All Coaching/Training Requests</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="All Coaching Request" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
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

table td {
	height: 11px;
	font-size: 13px;
}
</STYLE>

<SCRIPT>
	$(document)
			.ready(
					function() {
						var showChar = 300;
						var ellipsestext = "...";
						var moretext = "more";
						var lesstext = "less";
						$('.more')
								.each(
										function() {
											var content = $(this).html();

											if (content.length > showChar) {

												var c = content.substr(0,
														showChar);
												var h = content.substr(
														showChar - 1,
														content.length
																- showChar);

												var html = c
														+ '<span class="moreelipses">'
														+ ellipsestext
														+ '</span>&nbsp;<span class="morecontent"><span>'
														+ h
														+ '</span>&nbsp;&nbsp;<a href="" class="morelink">'
														+ moretext
														+ '</a></span>';

												$(this).html(html);
											}

										});

						$(".morelink").click(function() {
							if ($(this).hasClass("less")) {
								$(this).removeClass("less");
								$(this).html(moretext);
							} else {
								$(this).addClass("less");
								$(this).html(lesstext);
							}
							$(this).parent().prev().toggle();
							$(this).prev().toggle();
							return false;
						});
					});
</SCRIPT>

<style type="text/css">
table tr {
	border: none
}

table tbody {
	border: none;
}

table td:first-child {
	padding-left: 0px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		var value1 = document.getElementById("pageRefresh").value;
		if (value1 == 1) {
			$(".toggle_container").hide();
		}
		$("h2.expand_heading").click(function() {
			$(this).next(".toggle_container").slideToggle("slow");
		});

		$(".expand_all").click(function() {
			$(".toggle_container").slideToggle("slow");
		});
	});
</script>
<script type="text/javascript">
	function onmouseOver1(enableDiv, id) {
		eraseCookie('field1');
		createCookie('field1', enableDiv, 1);
		eraseCookie('field2');
		document.getElementById(id).style.color = '#FF0000';
		createCookie('field2', id, 1);
		if (enableDiv == "All Requests") {
			return true;
		} else {
			if (document.getElementById(enableDiv).style.display == "") {
				$(".toggle_container").hide();
			} else if (document.getElementById(enableDiv).style.display == "block") {
				document.getElementById(enableDiv).style.display = "none";
				$(".toggle_container").hide();
				eraseCookie('field1');
			} else {
				$(".toggle_container").hide();
				document.getElementById(enableDiv).style.display = "block";
			}
			return true;
		}

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
</script>
<script type="text/javascript">
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
		
		var value1 = document.getElementById("pageRefresh").value;		
		if (value1 == 1) {
			$(".toggle_container").hide();
			eraseCookie('field2');
			eraseCookie('field1');
			document.getElementById("1").style.color = '#FF0000';
			createCookie('field2', '1', 1);
		} else {
			document.getElementById(readCookie('field2')).style.color = '#FF0000';
			document.getElementById(readCookie('field1')).style.display = "block";
		}
	}
	function changeColor(id) {
		eraseCookie('field2');
		document.getElementById(id).style.color = '#FF0000';
		createCookie('field2', id, 1);
		return false;
	}
</script>

<style type="text/css">
body {
	font: 10px normal Georgia, Arial, Helvetica, sans-serif;
	margin: 0;
	padding: 0;
	line-height: 1.7em;
}

.wrapper {
	width: 400px;
	margin: 0 auto;
}

.expand_top,.expand_wrapper {
	width: 400px;
	padding: 0px;
	margin: 0px 0px 5px 0px;
	float: left;
}

h1 {
	text-align: center;
	padding: 20px 0;
	color: #ffffff;
}

h2.expand_heading {
	padding: 0 0 0 10px;
	margin: 0 0 5px 0;
	background-image: url(../images/plus1.png);
	background-repeat: no-repeat;
	background-position: right top;
	/*	background: url(expand_collapse.png) no-repeat;*/
	height: 22px;
	line-height: 23px;
	width: 200px;
	font-size: 14px;
	font-weight: normal;
	float: left;
}

.expand_all {
	cursor: default;
}

h2.expand_heading a {
	color: #000000;
	text-decoration: none;
}

h2.expand_heading a:hover {
	color: #ccc;
}

h2.active {
	background-position: right bottom;
}

.toggle_container {
	margin: 0 0 5px;
	width: 200px;
	padding: 0;
	background: #ffffff;
	overflow: hidden;
	font-size: 1.2em;
	clear: both;
	display: none;
}

.toggle_container .box {
	padding: 0px;
}

.toggle_container .box p {
	padding: 5px 0;
	margin: 5px 0;
}

.box ul {
	margin: 5px 0px 0px 20px;
	padding: 0;
}

.box ul li {
	margin: 0;
	line-height: 20px;
	list-style: none;
	padding: 0;
}

.box ul li a {
	margin: 0;
	color: #444444;
	text-decoration: none;
	line-height: 20px;
	background-image: url(../images/arrow1.png);
	background-repeat: no-repeat;
	background-position: left;
	list-style: none;
	padding: 0px 0px 0px 10px;
}

.box ul li a:hover {
	color: #000000;
}

.toggle_container h3 {
	margin: 0 0 5px;
	padding: 0 0 5px 0;
	color: #000000;
	border-bottom: 1px dotted #ccc;
}

.toggle_container img {
	float: left;
	margin: 10px 15px 15px 0;
	padding: 5px;
	background: #ddd;
	border: 1px solid #ccc;
}

.expand_all {
	width: 116px;
	height: 29px;
	background: url(../images/extra_buttons1.png) no-repeat top left;
	float: right;
	cursor: pointer;
}

.expanded {
	background-position: bottom left;
}

.footer {
	margin: 200px 0px 0px 0px;
	text-align: center;
	float: left;
	color: #ffffff;
	font-size: 15px;
	overflow: hidden;
}

.footer a {
	color: #ffffff;
	font-weight: bold;
	font-size: 15px;
	line-height: 20px;
	text-decoration: none;
}

table {
	border: none;
}
</style>
	
	
</head>

<body onload="onloadFuntion();">

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

	<input type="hidden" name="pageRefresh" id="pageRefresh"
		value="${pageRefresh}"></input>
	<form>
		<div
			style="text-align: center; width: 900px; font-size: large; font-weight: bold; color: blue">${HeaderName}</div>
		<div style="height: 10px"></div>

		<table style="width: 900px;">
			<tr>
			<td></td>
			<td style="float: right;"><table border="1" style="width: 190px;">
			<tr>

				<td style="width: 70px;"><c:if test="${currentPage != 1}">
						<a href="getRequestDetails1?page=${currentPage - 1}"
							style="width: 70px;">Previous</a>
					</c:if></td>


				<td><c:forEach begin="1" end="${noOfPages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<td>${i}</td>
							</c:when>
							<c:otherwise>
								<td><a href="getRequestDetails1?page=${i}">${i}</a></td>
							</c:otherwise>
						</c:choose>
					</c:forEach></td>
				<%--For displaying Next link --%>
				
					<td style="width: 70px;">
					<c:if test="${currentPage lt noOfPages}">
					<a
						href="getRequestDetails1?page=${currentPage + 1}"
						style="width: 70px;">Next</a>
				</c:if>
				</td>
				
			</tr>
		</table></td>
			</tr>
			<tr>
				<td style="text-align: left; vertical-align: top; width: 250px;"><c:forEach
						items="${coachingCategory}" var="Category">
						<c:url var="editUrl"
							value="/getRequestDetails?id=${Category.categoryId}" />
						<table>
							<tr>
								<td style="text-align: left; vertical-align: top; width: 200px;"><a
									id="${Category.categoryId}" href="${editUrl}"
									style="font-size: 14px;"
									onclick="return onmouseOver1('${Category.categoryName}','${Category.categoryId}');">${Category.categoryName}</a>
									<br> <c:if test="${Category.categoryId==2}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory2}" var="SubCategory">

													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 12px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==3}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory3}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==4}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory4}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==5}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory5}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==6}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory6}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==7}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory7}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==8}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory8}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==9}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory9}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==10}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory10}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==11}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory11}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==12}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory12}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==13}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory13}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==14}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory14}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==15}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory15}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==16}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory16}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==17}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory17}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==18}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory18}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==19}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory19}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>
												</c:forEach>
											</div>
										</div>
									</c:if> <c:if test="${Category.categoryId==20}">
										<div class="toggle_container" id="${Category.categoryName}">
											<div class="box">
												<c:forEach items="${coachingCategory20}" var="SubCategory">
													<ul
														style="list-style: none; text-align: left; margin-left: 10px;">
														<li style="margin-left: 25px; font-size: 18px;"><a
															href="getRequestDetails?id=${SubCategory.categoryId}"
															style="text-decoration: none;"
															id="${SubCategory.categoryId}"
															onclick="changeColor('${SubCategory.categoryId}')">${SubCategory.categoryName}</a></li>
													</ul>

												</c:forEach>
											</div>
										</div>
									</c:if></td>
							</tr>
						</table>
					</c:forEach></td>
				<td style="width: 650px; text-align: left; vertical-align: top;">
					<table style="margin-left: 5px;">
						<c:forEach items="${requestDetails}" var="requestDetail">
							<c:url var="requestLink"
								value="/public/requestNames?id=${requestDetail.id}" />
							<tr>
								<td style="vertical-align: top; text-align: left;"><a
									href="${requestLink}"
									style="background-color: lightblue; font-size: 14px;"><c:out
											value="${requestDetail.requestName}" /></a><br> <b>Date
										Posted:&nbsp;&nbsp;&nbsp;&nbsp;<c:out
											value="${requestDetail.datePosted}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										2 Proposals
								</b><br>
									<div class="comment more" style="font-size: 12px;">
										<c:out value="${requestDetail.requestDetails}" />
									</div> <br></br></td>
							</tr>
						</c:forEach>
					</table>
				</td>

			</tr>
			<tr>
		<td></td>
			<td style="float: right;"><table border="1" style="width: 190px;">
			<tr>

				<td style="width: 70px;"><c:if test="${currentPage != 1}">
						<a href="getRequestDetails1?page=${currentPage - 1}"
							style="width: 70px;">Previous</a>
					</c:if></td>


				<td><c:forEach begin="1" end="${noOfPages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<td>${i}</td>
							</c:when>
							<c:otherwise>
								<td style="font-size: 13px;"><a href="getRequestDetails1?page=${i}" style="font-style:13px;">${i}</a></td>
							</c:otherwise>
						</c:choose>
					</c:forEach></td>
				<%--For displaying Next link --%>
				
					<td style="width: 70px;">
					<c:if test="${currentPage lt noOfPages}">
					<a
						href="getRequestDetails1?page=${currentPage + 1}"
						style="width: 70px;">Next</a>
				</c:if>
				</td>
				
			</tr>
		</table></td>
		</tr>
		<tr><td></td></tr>
		</table>

	</form>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
