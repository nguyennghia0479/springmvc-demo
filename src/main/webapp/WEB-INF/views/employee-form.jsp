<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Form</title>
</head>
<body>
    <div align="center">
        <h2>Employee Form</h2>
        <form:form action="save" method="post" modelAttribute="employee">
            <table border="0" cellpadding="5">
               <form:hidden path="id"/>
                <tr>
                    <td>First Name: </td>
                    <td><form:input path="firstName" /></td>
                </tr>
                <tr>
                    <td>Last Name: </td>
                    <td><form:input path="lastName" /></td>
                </tr>
                <tr>
                    <td>Date of Birth: </td>
                    <td><form:input path="dobString" type="date"/></td>
                </tr>
                <tr>
                    <td>Login: </td>
                    <td><form:input path="login" /></td>
                </tr>
                <tr>
                    <td>Mobile No: </td>
                    <td><form:input path="mobileNo" /></td>
                </tr>
                <tr>
                    <td>Gender: </td>
                    <td><form:radiobuttons path="gender" items="${genderRadio}"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Save"></td>
                </tr>
            </table>
        </form:form>
    </div>
</body>
</html>