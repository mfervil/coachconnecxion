
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Account Activation</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Activate your account for training or coaching purposes" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_head.jsp" %>

</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>

<div id="content">
    <div class="pageWrapper">
        <h1>Activation</h1> <br />

<%--        
         ${message}  <a href="<c:url value="/public/profile?cuin=${cuin}"/>" style="font:14px;color:#0404B4">LOGIN AND CREATE A PROFILE TO CONTINUE</a>
--%>
         ${message}  <a href="<c:url value="/userprofile/systemUsageType?cuin=${cuin}"/>" style="font:14px;color:#0404B4"><br> CLICK HERE TO LOGIN AND CREATE A PROFILE TO CONTINUE</a>

        <br/><br/>
        
		<%--
        <p>
            Don't have an account yet? 
            <a href="<c:url value="/users/create"/>" style="font:14px;color:#0404B4">REGISTER HERE</a>
        </p>
        --%>
        
    </div>


</div>

</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>	
