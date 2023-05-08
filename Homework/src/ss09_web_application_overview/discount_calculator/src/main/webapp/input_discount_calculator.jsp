<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 5/6/2023
  Time: 5:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>

</style>
<body>
<form action="discount_calculator" method="post">
    <label>Product Description:</label><br>
    <input type="text"  name="product_description"><br>
    <label>List Price:</label><br>
    <input type="number"  name="list_price"><br>
    <label >Discount Percent:</label><br>
    <input type="number" name="discount_percent"><br>
    <br>
    <input type="submit" value="Calculate Discount">
</form>

</body>
</html>
