<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>All Customers</title>
</head>
<body>
<h1>List Customers</h1>
<h3><a href="addCustomer.html">Add More Customer</a></h3>

<c:if test="${!empty customers}">
	<table align="left" border="1">
		<tr>
			<th>Customer ID</th>
			<th>Customer Name</th>
			<th>Customer Phone no</th>
			<th>Customer Created Date</th>
			<th>Customer Address</th>
		</tr>

		<c:forEach items="${customers}" var="customer">
			<tr>
				<td><c:out value="${customer.id}"/></td>
				<td><c:out value="${customer.name}"/></td>
				<td><c:out value="${customer.phno}"/></td>
				<td><c:out value="${customer.createddate}"/></td>
				<td><c:out value="${customer.address}"/></td>
			</tr>
		</c:forEach>
	</table>
</c:if>
</body>
</html>