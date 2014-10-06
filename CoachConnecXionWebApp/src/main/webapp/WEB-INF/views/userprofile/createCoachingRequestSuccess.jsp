<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Selecting your coach</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content=" CoachConnecXion" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

	<style type="text/css">
		a:link {color:#FF0000;}    /* unvisited link */
		a:visited {color:#00FF00;} /* visited link */
		a:hover {color:#FF00FF;}   /* mouse over link */
		a:active {color:#0000FF;}  /* selected link */	}
	</style>
	
</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>
			
<center>
<br> 
<b>The user profile has been created successfully for the customer with ID <c:out value="${model.userProfileId}"/>.</b>
<br> 
</center>

</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
