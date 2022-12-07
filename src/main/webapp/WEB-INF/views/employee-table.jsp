<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Manager</title>
</head>
<body>
<div align="center">
    <h2>Employee Manager</h2>
    <form method="get" action="search">
        <input type="text" name="keyword" /> &nbsp;
        <input type="submit" value="Search" />
    </form>
    <h3><a href="add">New Employee</a></h3>
    <table border="1" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>DOB</th>
            <th>Login</th>
            <th>Mobile No</th>
            <th>Gender</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${employees}" var="employee" varStatus="loop">
        <tr>
            <td>${loop.index +  1}</td>
            <td>${employee.firstName}</td>
            <td>${employee.lastName}</td>
            <td><fmt:formatDate pattern="dd-MM-yyyy" type="date" value="${employee.dob}" /></td>
            <td>${employee.login}</td>
            <td>${employee.mobileNo}</td>
            <td>${employee.gender}</td>
            <td>
                <a href="${employee.id}">Edit</a>
                &nbsp;&nbsp;&nbsp;
                <a href="/delete?id=${employee.id}">Delete</a>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>