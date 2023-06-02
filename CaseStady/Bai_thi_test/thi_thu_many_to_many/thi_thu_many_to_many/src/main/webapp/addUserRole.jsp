<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 6/1/2023
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/UserRoleServlet?action=create" method="post">
  <table>
    <tr>
      <td>ID:</td>
      <td><input type="number" name="idUser"></td>
    </tr>
    <tr>
      <td>Name:</td>
      <td><input type="text" name="nameUser"></td>
    </tr>
    <tr>
      <td>code:</td>
      <td><input type="text" name="codeUser"></td>
    </tr>
    <tr>
      <td>Birthday:</td>
      <td><input type="date" name="birhtdayUser"></td>
    </tr>
    <tr>
      <td>Role:</td>
      <td><input type="checkbox" name="role" value="1">Admin</td>
      <td><input type="checkbox" name="role" value="2">User</td>
    </tr>
    <tr>
      <td><input type="submit" value="Add"></td>
    </tr>
  </table>
</form>
</body>
</html>
