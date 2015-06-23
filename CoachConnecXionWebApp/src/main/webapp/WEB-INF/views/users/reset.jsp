<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Reset Password</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Reset your password for CoachConnecXion" />
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
        <%--<h1><a href="<c:url value="/users/list"/>">Users</a> &gt; ${user.username}</h1>--%>

        <div class="section">
            <h3>Account Reset</h3> <br />
        </div>
        <c:url value='/users/reset' var="submitUrl"/>
        <form:form id="userReset" action="${submitUrl}" method="post" modelAttribute="user" class="noValidate">
            <div class="section">
                <span class="r" style="color: red">${errorMsg}</span> <br>
        <p style="font-size:16px">
            Don't have an account or your email does not exist? 
            <a  rel="nofollow" href="<c:url value="/users/create"/>" style="font-size:16px; font-color:blue; text-decoration:underline" >Register here</a>
            <br>Forgot your User Name or Password? Fill-out the information below and click Reset Account 
        </p> <br>
                <dl>
                	<%-- 
                    <dt><label for="username">Username<span class="r">*</span></label></dt>
                    <dd><form:input path="username" cssClass="text"/></dd>
					--%>
					
                    <dt><label for="email">Email<span class="r">*</span></label></dt>
                    <dd><form:input size="30" path="email" cssClass="text"/></dd>

                    <dt><label for="password">Password<span class="r">*</span></label></dt>
                    <dd><form:input size="30" path="password" cssClass="text" type="password"/></dd>

                    <dt><label for="confirmedPassword">Confirm password<span class="r">*</span></label></dt>
                    <dd><form:input size="30" path="confirmedPassword" cssClass="text" type="password"/></dd>
                </dl>
            </div>
            <br>
            <%-- 
            <div class="controls">
                <a href="javascript:void(0)" class="floatLeft button submitForm"><span>Save</span></a>
                <a href="javascript:history.back();" class="floatLeft button cancel"><span>Cancel</span></a>
                <div class="clear"></div>
            </div>
            --%>
            <div class="hidden-submit"><input type="submit" value="Reset Account" tabindex="-1"/></div>
        </form:form>

    </div>
</div>

</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
