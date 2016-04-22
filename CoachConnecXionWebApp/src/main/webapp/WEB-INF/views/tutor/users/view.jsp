<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>View User Info</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="View the user information" />
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
        <h1>User&#39;s profile</h1>

        <dl>
            <dt><label>Username:</label></dt>
            <dd class="clear">${user.username}</dd>
            <dt><label>Email:</label></dt>
            <dd class="clear">${user.email}</dd>
            <dt><label>Created date:</label></dt>
            <dd class="clear">${user.createdDate}</dd>
        </dl>
        <div class="hr">
            <hr/>
        </div>
    </div>
</div>

</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>