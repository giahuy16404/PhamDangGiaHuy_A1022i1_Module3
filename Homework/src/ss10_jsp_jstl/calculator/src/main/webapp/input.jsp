<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 5/10/2023
  Time: 9:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    table {
      position: relative;
      margin: auto;
      border: solid;
      padding: 20px;
      top:  400px
    }

    h4 {
      position: absolute;
      top: -12px;
      left: 20%;
      transform: translateX(-50%);
      margin: 0;
      background-color: white;
      padding: 5px 10px;
    }

  </style>
</head>
<body >
  <form action="/calculator" method="post">
    <table>
      <tr><td>
        <h4>Calculator</h4>
      </td></tr>
      <tr>
        <td><label for="first_operand">First operand:</label> </td>
        <td> <input type="number" name="first_operand" id="first_operand"> </td>
      </tr>
      <tr>
        <td><label for="select">Operator: </label></td>
        <td>
          <select id="select" name="select">
            <option value="addition">+</option>
            <option value="subtraction">-</option>
            <option value="multiplication">x</option>
            <option value="division">/</option>
          </select>
        </td>
      </tr>
      <tr>
        <td><label for="second_operand">Second operand: </label> </td>
        <td> <input type="number" name="second_operand" id="second_operand" required></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="calculate" ></td>
      </tr>
      <tr>
        <td style="color: red">${error}${errorZero}</td>
      </tr>
    </table>
  </form>
</body>
</html>
