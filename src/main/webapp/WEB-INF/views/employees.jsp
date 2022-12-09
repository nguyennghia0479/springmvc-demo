<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Manager</title>
<link href="<c:url value="/resources/vendor/easyui/themes/bootstrap/easyui.css" />" rel="stylesheet">
<link href="<c:url value="/resources/vendor/easyui/themes/icon.css" />" rel="stylesheet">
<link href="<c:url value="/resources/vendor/easyui/themes/color.css" />" rel="stylesheet">
<link href="<c:url value="/resources/vendor/easyui/demo/demo.css" />" rel="stylesheet">
</head>
<body>

    <h2>Basic CRUD Application</h2>
    <p>Click the buttons on datagrid toolbar to do crud actions.</p>
    <table id="dg" title="My Users" class="easyui-datagrid" style="width:700px;height:250px"
                url="${pageContext.request.contextPath}/api/v1/employees/get-list"
                toolbar="#toolbar" pagination="true"
                rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="firstname" width="50">First Name</th>
                <th field="lastname" width="50">Last Name</th>
                <th field="dob" width="50">DOB</th>
                <th field="login" width="50">Login</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">New User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">Edit User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">Remove User</a>
    </div>

<script src="<c:url value="/resources/vendor/easyui/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/easyui/jquery/jquery.easyui.min.js" />"></script>
</body>
</html>