<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 5/17/2023
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        table tr td {
            border: solid 1px;
        }

        table tr {
            border: solid 2px;
        }

        .btn-primary {
            background-color: #ffffff;
            color: black;
            border: solid 1px;
        }

        .btn-primary:hover {
            background-color: aqua;
        }

        .popup {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: rgba(0, 0, 0, 0.6);
            display: none;
        }

        #xmas-popup .popup-content {
            width: 400px;
            height: 200px;
            background: #bbb;
            margin: 100px auto;
            position: relative;
            border: 5px solid #fff;
        }

        #popup-delete .popup-content {
            width: 400px;
            height: 200px;
            background: #bbb;
            margin: 100px auto;
            position: relative;
            border: 5px solid #fff;
        }


        .close {
            position: absolute;
            top: 5px;
            right: 5px;
            border-radius: 50%;
            background: #222;
            border: 3px solid #fff;
            color: #fff;
            text-decoration: none;
            line-height: 0;
            padding: 9px 0 11px;
            width: 20px;
            text-align: center;
        }

        .popup:target {
            display: block;
        }

        .arrange {
            margin-bottom: 20px;
        }

    </style>
</head>
<body>


<div style="text-align: center;">
    <h1>User Management</h1>
    <h2>
        <a href="/UserServlet?action=create">Add New User</a>
    </h2>
    <form action="/UserServlet?action=showByName" method="post">
        <h2><label for="inputShowByName">Find By Name</label><br></h2>
        <input type="text" id="inputShowByName" name="showByName" style="width: 400px; height: 30px;"
               placeholder="Enter the name you want to search for">
        <label><input type="submit" value="Show" style="height: 30px"></label>
    </form>
    <a href="/UserServlet?action=arrangeForName">
        <input type="button" value="Arrange for name" name="arrangeForName" class="arrange">
    </a>
    <a href="/UserServlet?action=null"><input type="button" value="Default" name="default" class="arrange"> </a>

</div>
<div align="center">
    <button type="button" class="btn btn-primary" data-toggle="modal"
            data-target="#myUpdateModal">edit
    </button>
    <button type="button" class="btn btn-primary" data-toggle="modal"
            data-target="#myDeleteModal">Delete
    </button>
    <table>
        <tr>
            <h2>List of Users</h2>
        </tr>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>


        <c:if test="${!not empty arrangeForName}">
            <c:if test="${ !not empty userShowByName }">

                <c:forEach items="${userList}" var="userList">

                    <tr>
                        <td>${userList.id}</td>
                        <td>${userList.name}</td>
                        <td>${userList.email}</td>
                        <td>${userList.country}</td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${ not empty userShowByName }">
                <c:forEach items="${userShowByName}" var="showByName">
                    <tr>
                        <td>${showByName.id}</td>
                        <td>${showByName.name}</td>
                        <td>${showByName.email}</td>
                        <td>${showByName.country}</td>
                    </tr>
                </c:forEach>
            </c:if>
        </c:if>


        <c:if test="${not empty arrangeForName}">
            <c:if test="${ !not empty userShowByName }">
                <c:forEach items="${arrangeForName}" var="userList">

                    <tr>
                        <td>${userList.id}</td>
                        <td>${userList.name}</td>
                        <td>${userList.email}</td>
                        <td>${userList.country}</td>
                    </tr>
                </c:forEach>
            </c:if>
        </c:if>
    </table>


    <!--Modal edit  -->
    <div class="modal fade" id="myUpdateModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Update</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form action="/UserServlet" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">

                        <label for="idUpdate">id</label>
                        <input type="number" class="form-control" name="idUpdate" id="idUpdate">

                        <label for="nameUpdate">Name:</label>
                        <input type="text" class="form-control" name="nameUpdate" id="nameUpdate">

                        <label for="emailUpdate">Email:</label>
                        <input type="email" class="form-control" name="emailUpdate" id="emailUpdate">

                        <label for="countryUpdate">Country</label>
                        <input type="text" class="form-control" name="countryUpdate" id="countryUpdate">
                    </div>
                    <!-- Pop-Up -->
                    <div id="xmas-popup" class="popup" href="#">
                        <div class="popup-content">
                            <table>
                                <tr>You definitely want to edit the object</tr>
                                <tr>
                                    <td>
                                        <a href="/UserServlet" class="btn btn-primary">Close </a>
                                    </td>
                                    <td>
                                        <input type="submit" class="btn btn-primary" value="edit" name="action">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </form>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="#xmas-popup" class="btn btn-primary">Edit</a>
                </div>
            </div>
        </div>
    </div>

    <!--Modal delete  -->
    <!-- Modal -->
    <div class="modal fade" id="myDeleteModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Delete</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form action="/UserServlet" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <label for="idDelete">id</label>
                        <input type="number" class="form-control" name="idDelete" id="idDelete">
                    </div>
                    <!-- Pop-Up -->
                    <div id="popup-delete" class="popup" href="#">
                        <div class="popup-content">
                            <table>
                                <tr>You definitely want to remove the object</tr>
                                <tr>
                                    <td>
                                        <a href="/UserServlet" class="btn btn-primary">Close </a>
                                    </td>
                                    <td>
                                        <input type="submit" class="btn btn-primary" value="Delete" name="action">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </form>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="#popup-delete" class="btn btn-primary">Delete</a>

                </div>
            </div>
        </div>
    </div>
</div>


</div>
</body>
</html>
