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

</head>
<body >
<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>
	
<div id="content">
    <div class="pageWrapper">
        <h1>Log In</h1><br>
        <p>
        <div class="signUpForm">
            <form action="<c:url value="/j_spring_security_check"/>" method="post">
                <dl>
                    <dt><label for="email">Email:</label></dt>
                    <dd class="clear"><input value="marc" id="email" type="text" class="text required" name="j_username"/></dd>
                    <dt><label for="password">Password:</label></dt>
                    <dd class="clear"><input value="marc" id="password" type="password" class="text required" name="j_password"/></dd>
                </dl>
                <c:if test="${not empty param.login_error}">
                    <div class="error">Could not log you in.  Please verify your email and password and try again. <br> If you still can't login the system may be down, please try again at a later time</div>
                </c:if>
                <br>
                <div>
                	By clicking submit below, you agree to our <a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/legal?type=tu">Terms of Service</a> and <a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/legal?type=pp">Privacy Policy</a> 
                </div>
                <div class="hidden-submit"><input type="submit" value="Sign In" tabindex="-1"/></div>
                
            </form>
            
        </div>
        <p style="font-size:16px">
            <br>Don't have an account yet? 
            <a href="<c:url value="/users/create"/>" style="font-size:16px; font-color:blue; text-decoration:underline" >Register here</a>
        </p>
        <p style="font-size:16px">
            Forgot your User Name or password? 
            <a href="<c:url value="/users/reset"/>" style="font-size:16px; font-color:blue; text-decoration:underline" >Reset your account here</a>
        </p>
        <br>
        <p>
		<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span>									
        </p>
        
    </div>
</div>

</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>
