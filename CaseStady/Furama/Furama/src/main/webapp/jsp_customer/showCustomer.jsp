<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 5/25/2023
  Time: 5:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>showMenu</title>
  <link href="jsp_customer/cssAddCustomer.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container">

  <header>
    <div id="header-one">
      <div id="header-logo">
        <a href="#">
          <img src="../—Pngtree—lovely%20macarone%20ice%20cream%20color_7126031.png" id="logo">
        </a>
      </div>
      <div id="header-text">
        <h3>Quản Lý Khu Nghỉ Dưỡng Furama</h3>
      </div>
      <div id="name-login">
        <p>Name-Login</p>
      </div>
    </div>
    <div id="header-two">
      <nav>
        <a href="/MenuServlet">Home</a>
        <a href="#">Employee</a>
        <a href="#">Customer</a>
        <a href="#">Service</a>
        <a href="#">Contract</a>
      </nav>
      <form id="header-search">
        <input type="submit" value="Submit" class="submit-button">
        <input type="text" class="search-input" placeholder="search">
      </form>
    </div>
  </header>

  <main>
    <div id="main-left">
      <a href="#"><input type="button" value="Show Customer"></a>
      <a href="#"><input type="button" value="Add Customer"></a>
      <a href="#"><input type="button" value="Update Customer"></a>
      <a href="#"><input type="button" value="Remove Customer"></a>
    </div>
    <div id="main-right">
      <table>
        <tr>
          <th></th>
        </tr>
      </table>
    </div>
  </main>
  <footer>
    <div id="footer-main">
      <div id="footer-text">
        <h4>Footer...</h4>
      </div>
    </div>
  </footer>
</div>
</body>



</html>
