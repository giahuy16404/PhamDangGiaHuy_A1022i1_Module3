<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="jsp_customer/cssShowCustomer.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="jsp_customer/cssAddCustomer.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
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
            <a href="/CustomerServlet"><input type="button" value="Show Customer"></a>
            <a><input type="button" class="btn btn-primary" data-toggle="modal" data-target="#myAddCustomerModal"
                      value="Add Customer"></a>
            <a><input type="button" class="btn btn-primary" data-toggle="modal"
                      data-target="#myShowUpdateUpdateCustomerModal" value="Update Customer"></a>
            <a href="#"><input type="button" value="Remove Customer"></a>
        </div>
        <div id="main-right">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Type</th>
                    <th>Name</th>
                    <th>Birth day</th>
                    <th>Gender</th>
                    <th>ID card</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                </tr>
                <c:forEach items="${showListCustomer}" var="list">
                    <tr>
                        <td>${list.id}</td>
                        <td>${list.typeID}</td>
                        <td>${list.name}</td>
                        <td>${list.birthday}</td>
                        <td>${list.gender}</td>
                        <td>${list.idCard}</td>
                        <td>${list.phone}</td>
                        <td>${list.email}</td>
                        <td>${list.address}</td>
                    </tr>
                </c:forEach>
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
<div id="modal-add">
    <!--Add -->
    <form action="/CustomerServlet?action=addCustomer" method="post">
        <div class="modal fade" id="myAddCustomerModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add Customer</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <label for="id">ID</label>
                    <input type="number" class="form-control" name="id" id="id" placeholder="ID">


                    <label for="type">Type Customer</label>
                    <select id="type" name="type" class="form-control">
                        <option value="1">Diamond</option>
                        <option value="2">Platinium</option>
                        <option value="3">Gold</option>
                        <option value="4">Silver</option>
                        <option value="5">Member</option>
                    </select>

                    <label for="name">Name</label>
                    <input type="text" class="form-control" name="name" id="name" required placeholder="Name">

                    <label for="birthday">Birth Day</label>
                    <input type="date" class="form-control" name="birthday" id="birthday" required
                           placeholder="Birth Day">

                    <label for="gender">Gender</label>
                    <select id="gender" name="gender" class="form-control">
                        <option value="0">Male</option>
                        <option value="1">Female</option>
                    </select>

                    <label for="idcard">ID card</label>
                    <input type="number" class="form-control" name="idcard" id="idcard" required
                           placeholder="ID card">

                    <label for="phone">Phone</label>
                    <input type="number" class="form-control" name="phone" id="phone" required
                           placeholder="Phone">


                    <label for="email">Email</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="Email">


                    <label for="address">Address</label>
                    <input type="number" class="form-control" name="address" id="address" placeholder="Address">

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <%--                                <input type="submit" value="Add" class="btn btn-secondary">--%>
                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#myAddCustomerModalPopUp">Add
                        </button>

                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="myAddCustomerModalPopUp">
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
                        <input type="submit" value="Add" class="btn btn-secondary" >
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="modal-edit">
    <!-- Update -->
    <form action="/CustomerServlet?action=showUpdateCustomer" method="post">
        <div class="modal fade" id="myShowUpdateUpdateCustomerModal" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Enter the id you want to edit</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <label for="id">ID</label>
                    <input type="number" class="form-control" name="id" id="idShowUpdate" placeholder="ID">
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" value="Show" class="btn btn-secondary"
                               data-dismiss="modal" data-toggle="modal" data-target="#myDoUpdateCustomerModal">
                        <%--            <button type="button" class="btn btn-primary" data-toggle="modal"--%>
                        <%--                    data-target="#myAddCustomerModalPopUp">Add--%>
                        <%--            </button>--%>
                    </div>
                </div>
            </div>
        </div>
    </form>
<%--    <c:if test="${not empty showListUpdateCustomer}">--%>
        <!--Do Update -->
        <form action="/CustomerServlet?action=doUpdateCustomer" method="post">
            <div class="modal fade " id="myDoUpdateCustomerModal" >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Do Update</h4>
                            <a href="/CustomerServlet?action=showListCustomer">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </a>
                        </div>
                        <!--  Modal body -->
                        <c:forEach items="${showListUpdateCustomer}" var="list">
                            <label for="idUpdate">ID</label>
                            <input type="number" class="form-control" name="idUpdate" id="idUpdate" value="${list.id}">


                            <label for="typeUpdate">Type Customer</label>
                            <select id="typeUpdate" name="typeUpdate" class="form-control">
                                <option value="1">Diamond</option>
                                <option value="2">Platinium</option>
                                <option value="3">Gold</option>
                                <option value="4">Silver</option>
                                <option value="5">Member</option>
                            </select>

                            <label for="nameUpdate">Name</label>
                            <input type="text" class="form-control" name="nameUpdate" id="nameUpdate"
                                   value="${list.name}" required>

                            <label for="birthdayUpdate">Birth Day</label>
                            <input type="date" class="form-control" name="birthdayUpdate" id="birthdayUpdate" required
                                   value="${list.birthday}">

                            <label for="genderUpdate">Gender</label>
                            <select id="genderUpdate" name="genderUpdate" class="form-control">
                                <option value="0">Male</option>
                                <option value="1">Female</option>
                            </select>

                            <label for="idcardUpdate">ID card</label>
                            <input type="number" class="form-control" name="idcardUpdate" id="idcardUpdate" required
                                   value="${list.idCard}">

                            <label for="phoneUpdate">Phone</label>
                            <input type="number" class="form-control" name="phoneUpdate" id="phoneUpdate" required
                                   value="${list.phone}">


                            <label for="emailUpdate">Email</label>
                            <input type="email" class="form-control" name="emailUpdate" id="emailUpdate"
                                   value="${list.email}">


                            <label for="addressUpdate">Address</label>
                            <input type="number" class="form-control" name="addressUpdate" id="addressUpdate"
                                   value="${list.addres}">
                        </c:forEach>
                        <!--   Modal footer-->
                        <div class="modal-footer">
                            <a href="/CustomerServlet?action=showListCustomer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </a>
                            <input type="submit" value="Show" class="btn btn-secondary">
                                <%--            <button type="button" class="btn btn-primary" data-toggle="modal"--%>
                                <%--                    data-target="#myAddCustomerModalPopUp">Add--%>
                                <%--            </button>--%>
                        </div>
                    </div>
                </div>
            </div>
                <%--    <div class="modal fade" id="myAddCustomerModalPopUp">--%>
                <%--      <div class="modal-dialog">--%>
                <%--        <div class="modal-content">--%>
                <%--          <!-- Modal Header -->--%>
                <%--          <div class="modal-header">--%>
                <%--            <h4 class="modal-title">Update</h4>--%>
                <%--            <button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                <%--          </div>--%>
                <%--          <!-- Modal body -->--%>
                <%--          <div class="modal-body">--%>
                <%--            <h3>Do you agree to add the object to ?</h3>--%>
                <%--          </div>--%>
                <%--          <!-- Modal footer -->--%>
                <%--          <div class="modal-footer">--%>
                <%--            <button type="button" class="btn btn-secon dary" data-dismiss="modal">Close</button>--%>
                <%--            <input type="submit" value="Add" class="btn btn-secondary">--%>
                <%--          </div>--%>
                <%--        </div>--%>
                <%--      </div>--%>
                <%--    </div>--%>
        </form>
<%--    </c:if>--%>
</div>

</body>


</html>
