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

<style type="text/css">
    .Table
    {
        display: table;
    }
    .Title
    {
        display: table-caption;
        text-align: center;
        font-weight: bold;
        font-size: larger;
    }
    .Heading
    {
        display: table-row;
        font-weight: bold;
        text-align: center;
    }
    .Row
    {
        display: table-row;
    }
    .list-row {
        background:#f4f4f4;
        border:2px solid blue;
        width: 600px;
        margin: auto;
        text-align: center;
        vertical-align: middle;
        top: 50%;
        padding: 20px 0px;
        }
        
    .Cell
    {
        width: 300px;
        display: table-cell;
        padding-left: 40px;
        padding-right: 40px;
        text-align: center;
    }
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

<span style="font-size: 25px;"><br>Your Primary Goal on CoachConnecXion is to: <br><br></span>


	<div id="useractions">
		<div class="list-row">
			<div class="Cell" >
				<a style="font-size: 20px;" href="${pageContext.request.contextPath}/public/profile?cuin=${cuin}">COACH OTHERS</a>
			</div>
			<div class="Cell" >
			    <a style="font-size: 20px; " href="${pageContext.request.contextPath}/public/createCustomerUserProfile">FIND A COACH</a>
			</div>
		    </div>
		    <div class="list-row">
			<div class="Cell">
			    <a style="font-size: 20px" href="${pageContext.request.contextPath}/tutor/public/profile?cuin=${cuin}">TUTOR OTHERS</a>
			</div>
			<div class="Cell">
			    <a style="font-size: 20px" href="${pageContext.request.contextPath}/tutor/public/createCustomerUserProfile">FIND A TUTOR</a>
			</div>
		    </div>	
	</div>

	<div><br>&nbsp;</div>
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