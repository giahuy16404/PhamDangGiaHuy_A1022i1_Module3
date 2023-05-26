<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 5/12/2023
  Time: 8:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Customer</title>
</head>
<body>
<h1>Customers</h1>
<p>
    <a href="/customerServlet?action=create">Create new customer</a>
</p>

<table style="border: solid 1px">
    <c:if test="${ !not empty customerView}">
        <tr>
            <td>Name</td>
            <td>Email</td>
            <td>Address</td>
            <td>Edit</td>
            <td>Delete</td>
        </tr>
        <c:forEach items='${requestScope["customerList"]}' var="customer">
            <tr>
                <td>${customer.getName()}</td>
                <td>${customer.getEmail()}</td>
                <td>${customer.getAddress()}</td>
                <td><a href="/customerServlet?action=edit&id=${customer.getId()}">edit</a></td>
                <td><a href="/customerServlet?action=delete&id=${customer.getId()}">delete</a></td>
            </tr>
        </c:forEach>
    </c:if>

    <c:if test="${not empty customerView}">
        <h2>Customer Information</h2>
        <table  style="border: solid 1px">
            <tr>
                <td>ID:</td>
                <td>${customerView.id}</td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>${customerView.name}</td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>${customerView.email}</td>
            </tr>
            <tr>
                <td>Address:</td>
                <td>${customerView.address}</td>
            </tr>
        </table>
    </c:if>
</table>
<table>
    <form action="/customerServlet?action=view" method="post">
        <tr><h3>View Customer by id</h3></tr>
        <tr>
            <td><input type="number" value="view" name="id" ></td>
        </tr>
        <tr>
            <td><input type="submit" value="view"></td>
        </tr>
    </form>
</table>



</body>
</html>
