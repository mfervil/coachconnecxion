<%--@elvariable id="user" type="ua.com.bitlab.springsecuritydemo.web.beans.WebUser"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <c:import url="../../include/head.jsp"/>
</head>
<body>

<c:import url="../../include/header.jsp"/>

<div id="content">
    <div class="pageWrapper">
        <h1>Users</h1>

        <dl>
            <%--@elvariable id="users" type="java.util.List"--%>
            <c:forEach var="user" items="${users}" varStatus="status">
                <dt><label>${status.index+1}. ${user.username}</label></dt>
                <dd class="clear">${user.email} (${user.createdDate})</dd>
            </c:forEach>
        </dl>
        <div class="hr">
            <hr/>
        </div>
    </div>
</div>

<c:import url="../../include/footer.jsp"/>

</body>
</html>