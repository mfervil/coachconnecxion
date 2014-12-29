<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Create user profile success</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Confirmation of having successfully created a profile to become a Coach or Trainer" />
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
		
	<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a> &gt;&gt;<a href="${pageContext.request.contextPath}/createuserprofile">User Profile</a><br><br>
		
			
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
<%-- <b>The user profile has been created successfully for the customer with ID <c:out value="${model.userProfileId}"/>.</b> 
<b> <span style="font-size: 1.25em;"> <c:out value="${model.message}"/> </span></b>--%>

<span style="font-size: 1.25em;"> Congratulations! Your profile update completed successfully. </span>
<br> <span style="font-size: 1.25em;"> Next step is to create coaching service packages that customers can buy </span>
<br><br><b> <span style="font-size: 1.25em; color: rgb(0,0,255); text-decoration: underline;"> <a href="${pageContext.request.contextPath}/packageAdd">**CLICK HERE TO CREATE YOUR COACHING PACKAGES**</a> </span></b>


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
