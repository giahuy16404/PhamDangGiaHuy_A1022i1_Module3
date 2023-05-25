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
      <form action="/CustomerServlet?action=addCustomer" method="post">

      <table>
        <tr>
          <th style="text-align: center"><h3>Add Customer</h3></th>
        </tr>
        <tr>
          <td>
            <label for="id">ID</label>
          </td>
          <td>:</td>
          <td><input type="number" id="id" name="id" readonly placeholder="ID"></td>
        </tr>

        <tr>
          <td>
            <label for="type">Type Customer</label>
          </td>
          <td>:</td>
          <td><select id="type" name="type">
            <option value="1">Diamond</option>
            <option value="2">Platinium</option>
            <option value="3">Gold</option>
            <option value="4">Silver</option>
            <option value="5">Member</option>
          </select></td>
        </tr>

        <tr>
          <td>
            <label for="name">Name</label>
          </td>
          <td>:</td>
          <td><input type="text" id="name" name="name" readonly placeholder="Name"></td>
        </tr>

        <tr>
          <td>
            <label for="birthday">Birth Day</label>
          </td>
          <td>:</td>
          <td><input type="date" id="birthday" name="birthday" readonly placeholder="Birth Day"></td>
        </tr>

        <tr>
          <td>
            <label for="gender">Gender</label>
          </td>
          <td>:</td>
          <td><select id="gender" name="gender">
            <option value="0">Male</option>
            <option value="1">Female</option>
            <option value="2">Third gender </option>
          </select></td>
        </tr>

        <tr>
          <td>
            <label for="idcard">ID card</label>
          </td>
          <td>:</td>
          <td><input type="number" id="idcard" name="idcard" readonly placeholder="ID card"></td>
        </tr>

        <tr>
          <td>
            <label for="phone">Phone</label>
          </td>
          <td>:</td>
          <td><input type="number" id="phone" name="phone" readonly placeholder="Phone"></td>
        </tr>

        <tr>
          <td>
            <label for="email">Email</label>
          </td>
          <td>:</td>
          <td><input type="email" id="email" name="email"  placeholder="Email"></td>
        </tr>

        <tr>
          <td>
            <label for="address">Address</label>
          </td>
          <td>:</td>
          <td><input type="number" id="address" name="address"  placeholder="Address"></td>
        </tr>
        <tr>
          <th>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myAddCustomerModal">
              Add
            </button>
          </th>
        </tr>
      </table>
        <div class="modal fade" id="myAddCustomerModal">
          <div class="modal-dialog">
            <div class="modal-content">
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">Update</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              <!-- Modal body -->
              <div class="modal-body">
                <h3>Do you agree to add the object to ?</h3>
              </div>
              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <input type="submit" value="Add" class="btn btn-secondary">
              </div>
            </div>
          </div>
        </div>
      </form>
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
