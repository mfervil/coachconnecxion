<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Create and account</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Create an accont for Coaching or Training purposes" />
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
            <h3>Registration</h3> <br />
        </div>
        <c:url value='/users/create' var="submitUrl"/>
        <form:form id="userCreate" action="${submitUrl}" method="post" modelAttribute="user" class="noValidate">
            <div class="section">
                <span class="r" style="color: red">${errorMsg}</span> <br>
                <dl>
                <%-- 
                    <dt><label for="username">User Name<span class="r">*</span></label></dt>
                    <dd><form:input path="username" cssClass="text"/><form:errors path="username" cssClass="error" /></dd>
				--%>
                    <dt><label for="email">Email<span class="r">*</span></label></dt>
                    <dd><form:input size="30" path="email" cssClass="text"/><form:errors path="email" cssClass="error" /></dd>

                    <dt><label for="password">Password<span class="r">*</span></label></dt>
                    <dd><form:input size="30" path="password" cssClass="text" type="password"/><form:errors path="password" cssClass="error" /></dd>

                    <dt><label for="confirmedPassword">Confirm password<span class="r">*</span></label></dt>
                    <dd><form:input size="30" path="confirmedPassword" cssClass="text" type="password"/><form:errors path="confirmedPassword" cssClass="error" /></dd>
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
                <div>
                	By clicking Register below, you agree to our <a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/terms-of-use">Terms of Service</a> and <a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/privacy-policy">Privacy Policy</a> 
                </div>
            
            <div class="hidden-submit"><input type="submit" value="Register" tabindex="-1"/></div>
        </form:form>
        
        <br>
		<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span>
        <%-- 
		<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span>									
		--%>
    </div>
</div>

</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
