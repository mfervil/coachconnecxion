<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div id="serviceBlock">
    <div class="pageWrapper">
        <ul class="rightItems">
            <c:set var="isMemeber" value="false"/>
            <sec:authorize access="isAuthenticated()">
                <c:set var="isMemeber" value="true"/>
                <li><b>Hello, <sec:authentication property="principal.username"/>!</b></li>
                <li><a href="<c:url value="/users/home"/>">Home</a></li>
                <li><a href="<c:url value="/users/view"/>">User Console</a></li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li><a href="<c:url value="/users/list"/>">Admin Console</a></li>
                </sec:authorize>
                <li><a href="<c:url value="/j_spring_security_logout"/>">Log out</a></li>
            </sec:authorize>
            <c:if test="${isMemeber eq false}">
                <li><a href="<c:url value="/users/login"/>">Log in</a></li>
            </c:if>
        </ul>
<%-- 
        <ul class="hintsList">
            <li>Sample hint text</li>
            <li>Chuck Norris doesn't call the wrong number. You answer the wrong phone.</li>
            <li>When Alexander Bell invented the telephone he had 3 missed calls from Chuck Norris.</li>
            <li>When the Boogeyman goes to sleep every night, he checks his closet for Chuck Norris.</li>
            <li>Chuck Norris' hand is the only hand that can beat a Royal Flush.</li>
        </ul>
--%>        
    </div>
</div>