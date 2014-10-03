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

<style>
span.required {color:red;font-weight:bold}
</style>
	
</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>
			
		<!-- CONTACT FORM -->
		<form:form method="post" commandName="userProfile" enctype="multipart/form-data">
		<!-- <form action="#" id="page_user_profile_form" method="post"> -->
		<h3 style="color:red"> ${errorMessage} </h3>
	<table style="width: 900px;">
		<tr>
			<td style="width: 730px; padding: 5px;">
				<table>
					<tr>
						<td style="margin-top: 4px;"> <!-- style="margin-top -->
	
	<table style="border:1px solid;">	

<tr><td>	
<%-- <b>The user profile has been created successfully for the customer with ID <c:out value="${model.userProfileId}"/>.</b> --%>
<b> <span style="font-size: 1.25em;"> <c:out value="${model.message}"/> </span></b>

</td></tr>

			</table>
						</td> <!-- End style="margin-top -->

					</tr>

				</table>			
			</td>
		</table>
			
		</form:form>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
