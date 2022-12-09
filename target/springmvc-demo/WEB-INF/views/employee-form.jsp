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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-6">
                <h2>Employee Form</h2>
                <form:form action="save" method="post" modelAttribute="employee">
                    <form:hidden path="id"/>
                    <div class="form-group">
                        <label for="firstName"><strong>First name</strong></label>
                        <form:input path="firstName" type="text" class="form-control" id="firstName" placeholder="Input first name"/>
                      </div>
                      <div class="form-group">
                        <label for="lastName"><strong>Last name</strong></label>
                        <form:input path="lastName" type="text" class="form-control" id="lastName" placeholder="Input last name"/>
                      </div>
                      <div class="form-group">
                        <label for="dobString"><strong>Date of Birth</strong></label>
                        <form:input path="dobString" type="date" class="form-control" id="dobString"/>
                      </div>
                      <div class="form-group">
                        <label for="login"><strong>Login</strong></label>
                        <form:input path="login" type="text" class="form-control" id="login" placeholder="Input login"/>
                      </div>
                      <div class="form-group">
                        <label for="mobileNo"><strong>Mobile No</strong></label>
                        <form:input path="mobileNo" type="text" class="form-control" id="mobileNo" placeholder="Input mobile no"/>
                      </div>
                      <div class="form-group">
                        <label for="gender" class"mr-5"><strong>Gender</strong></label>
                        <div class="form-check form-check-inline">
                            <form:radiobutton  path="gender" class="form-check-input" name="gender" id="male" value="MALE" />
                            <label class="form-check-label" for="male">MALE</label>
                          </div>
                          <div class="form-check form-check-inline">
                            <form:radiobutton  path="gender" class="form-check-input" name="gender" id="female" value="FEMALE" />
                            <label class="form-check-label" for="female">FEMALE</label>
                          </div>
                      </div>
                      <div class="form-group row">
                        <div class="col-sm-10">
                          <button type="submit" class="btn btn-success">Save</button>
                          <a href="${pageContext.request.contextPath}/api/v1/employees/page/1" class="btn btn-secondary">Cancel</a>
                        </div>
                      </div>
                </form:form>
            </div>
        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>