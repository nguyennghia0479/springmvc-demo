<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Manager</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
    <c:set var="prefix" value="${pageContext.request.contextPath}/api/v1/employees/page"/>
    <div class="container">
        <h2>Employee Manager</h2>
        <form method="get" action="search">
            <input type="text" name="keyword" /> &nbsp;
            <button type="submit" class="btn btn-sm btn-primary">Search</button>
        </form>
        <h3><a href="add" class="btn btn-primary">New Employee</a></h3>
        <table class="table table-borderd table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th><a href="${prefix}/${currentPage}?sortField=firstName&sortDir=${reverseSortDir}">First Name</a></th>
                    <th><a href="${prefix}/${currentPage}?sortField=lastName&sortDir=${reverseSortDir}">Last Name</a></th>
                    <th><a href="${prefix}/${currentPage}?sortField=dob&sortDir=${reverseSortDir}">Date of Birth</a></th>
                    <th><a href="${prefix}/${currentPage}?sortField=login&sortDir=${reverseSortDir}">Login</a></th>
                    <th><a href="${prefix}/${currentPage}?sortField=mobileNo&sortDir=${reverseSortDir}">Mobile No</a></th>
                    <th><a href="${prefix}/${currentPage}?sortField=gender&sortDir=${reverseSortDir}">Gender</a></th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
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
                            <a href="${employee.id}" class="btn btn-sm btn-primary">Edit</a>
                            <a href="/delete?id=${employee.id}" class="btn btn-sm btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div c:if="${totalPages > 1}">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <!-- Prev Page -->
                    <c:if test="${currentPage != 1}">
                        <li class="page-item"><a class="page-link" href="${prefix}/${currentPage - 1}${url}">Previous</a></li>
                    </c:if>

                    <c:if test="${totalPages <= 10}">
                        <c:forEach begin="1" end="${totalPages}" step="1" var="i">
                            <c:if test="${currentPage != i}">
                                <li class="page-item"><a class="page-link" href="${prefix}/${i}${url}">${i}</a></li>
                            </c:if>
                            <c:if test="${currentPage == i}">
                                <li class="page-item active"><a class="page-link">${i}</a></li>
                            </c:if>
                        </c:forEach>
                    </c:if>

                    <c:if test="${totalPages > 10}">
                        <c:if test="${currentPage <= 5 || currentPage >= totalPages - 4}">
                            <c:forEach begin="1" end="5" step="1" var="i">
                                <c:if test="${currentPage != i}">
                                    <li class="page-item"><a class="page-link" href="${prefix}/${i}${url}">${i}</a></li>
                                </c:if>
                                <c:if test="${currentPage == i}">
                                    <li class="page-item active"><a class="page-link">${i}</a></li>
                                </c:if>
                            </c:forEach>
                            <li class="page-item"><a class="page-link">...</a></li>
                            <c:forEach begin="${totalPages - 4}" end="${totalPages}" step="1" var="i">
                                <c:if test="${currentPage != i}">
                                    <li class="page-item"><a class="page-link" href="${prefix}/${i}${url}">${i}</a></li>
                                </c:if>
                                <c:if test="${currentPage == i}">
                                    <li class="page-item active"><a class="page-link">${i}</a></li>
                                </c:if>
                            </c:forEach>
                        </c:if>

                        <c:if test="${currentPage > 5 && currentPage < totalPages - 4}">
                            <li class="page-item"><a class="page-link">...</a></li>
                            <c:forEach begin="${currentPage - 4}" end="${currentPage + 4}" step="1" var="i">
                                <c:if test="${currentPage != i}">
                                    <li class="page-item"><a class="page-link" href="${prefix}/${i}${url}">${i}</a></li>
                                </c:if>
                                <c:if test="${currentPage == i}">
                                    <li class="page-item active"><a class="page-link">${i}</a></li>
                                </c:if>
                            </c:forEach>
                            <li class="page-item"><a class="page-link">...</a></li>
                        </c:if>
                    </c:if>

                    <!-- Next Page -->
                    <c:if test="${currentPage != totalPages}">
                        <li class="page-item"><a class="page-link" href="${prefix}/${currentPage + 1}${url}">Next</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>