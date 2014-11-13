<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Confirmation Message</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Confirmation message for coaching services" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

<%--
	<style type="text/css">
		a:link {color:#FF0000;}    /* unvisited link */
		a:visited {color:#00FF00;} /* visited link */
		a:hover {color:#FF00FF;}   /* mouse over link */
		a:active {color:#0000FF;}  /* selected link */	}
	</style>
 --%>
 	
</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>
			
<!-- CONTACT FORM -->
		<form:form method="post" commandName="paymentInformation"  >
			 <table>
			  	  	<tbody >
					    <tr>
					      <td class="centeralign">Your order has completed successfully.  Your coach will be in touch with you to setup the sessions
						</td></tr>
			  	  	</tbody >
			  	</table>
			  	<br>
			  	<table>
				  	<tbody >
					    <tr>
					      <td class="leftalign">Package Name: ${packageName}
						</td></tr>
					    <tr>
					      <td class="leftalign">Package Price: ${packagePrice}
						</td></tr>
				  	</tbody >
			  	</table>
				<p align="center"><a href='.'>Return to home page</a> 
		<!--  This section is opened in header_no_side.jsp -->
	</form:form>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
