<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 5/10/2023
  Time: 7:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    <link rel="stylesheet" href="product.css">
</head>
<body>
<h1>All product</h1>
<div id="list-product">
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <td>id</td>
            <td>name</td>
            <td>price</td>
            <td>quantity</td>
            <td>origin</td>
        </tr>
        </thead>
        <c:forEach items="${list}" var="p">
            <tbody>
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.price}</td>
                <td>${p.quantity}</td>
                <td>${p.origin}</td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
</div>
<!--CREATE -->
<div id="create">
    <!-- Modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Create new product</button>

    <!-- Modal -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="/ProductServlet" method="post">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">add product</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">

                        <label for="id">id</label>
                        <input type="number" class="form-control" id="id" name="id">

                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" name="name">

                        <label for="price">Price</label>
                        <input type="number" class="form-control" id="price" name="price">

                        <label for="quantity">Quantity:</label>
                        <input type="text" class="form-control" id="quantity" name="quantity">

                        <label for="origin">Origin</label>
                        <input type="text" class="form-control" id="origin" name="origin">
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <input type="hidden" name="action" value="create"/>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="create" name="action">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Update -->
<div id="update">
    <!-- Modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myUpdateModal">Update</button>

    <!-- Modal -->
    <div class="modal fade" id="myUpdateModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="/ProductServlet" method="post">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Update</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">

                        <label for="id">id</label>
                        <input type="number" class="form-control" name="id">

                        <label for="name">Name:</label>
                        <input type="text" class="form-control" name="name">

                        <label for="price">Price</label>
                        <input type="number" class="form-control" name="price">

                        <label for="quantity">Quantity:</label>
                        <input type="text" class="form-control" name="quantity">

                        <label for="origin">Origin</label>
                        <input type="text" class="form-control" name="origin">
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <input type="hidden" name="action" value="update"/>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="update" name="action">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete -->
<div id="delete">
    <!-- Modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myDeleteModal">Delete</button>

    <!-- Modal -->
    <div class="modal fade" id="myDeleteModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="/ProductServlet" method="post">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Delete</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <label for="id">id</label>
                        <input type="number" class="form-control" name="id">
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <input type="hidden" name="action" value="delete"/>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Delete</button>
                        <input type="submit" class="btn btn-primary" value="delete" name="action">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
