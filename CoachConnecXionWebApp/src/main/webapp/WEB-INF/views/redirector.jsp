<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="url" value="/WEB-INF/views/users/home"/>
<jsp:useBean id="url" type="java.lang.String"/>

<% response.sendRedirect(url); %>