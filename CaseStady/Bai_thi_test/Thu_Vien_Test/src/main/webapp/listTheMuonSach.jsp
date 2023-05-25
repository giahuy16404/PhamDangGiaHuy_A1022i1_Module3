<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: VICTUS
  Date: 5/24/2023
  Time: 12:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <style>
    .popup {
      position: fixed;
      width: 100%;
      height: 100%;
      top: 0;
      left: 0;
      background: rgba(0, 0, 0, 0.6);
      display: none;
    }

    #xmas-popup-edit .popup-content {
      width: 400px;
      height: 200px;
      background: #bbb;
      margin: 100px auto;
      position: relative;
      border: 5px solid #fff;
    }

    .popup:target {
      display: block;
    }

    .btn-primary {
      margin-left: 10px;
    }
  </style>
</head>
<body>
<h1>Thong ke sach dang cho muon</h1>
<form method="post" action="/SachServlet?aciton=find">
  <label for="tenSach">Ten Sach</label>
  <input type="text" id="tenSach">
  <label for="tenHocSinh">Ten Hoc Sinh</label>
  <input type="text" id="tenHocSinh">
  <input type="submit" value="Tim Kiem">
</form>

<table>
  <tr>
    <th>Ma Sach</th>
    <th>Ten Sach</th>
    <th>Tac Gia</th>
    <th>Ten Hoc Sinh</th>
    <th>Lop</th>
    <th>Ngay Muon</th>
    <th>Ngay Tra</th>
  </tr>
  <c:forEach items="${showList}" var="list">
    <tr>
      <td>${list.maMuonSach}</td>
      <td>${list.tenSach}</td>
      <td>${list.tacGia}</td>
      <td>${list.hoTen}</td>
      <td>${list.lop}</td>
      <td>${list.ngayMuon}</td>
      <td>${list.ngayTra}</td>
      <td><a href="#xmas-popup-edit" ><input type="button" value="Tra Sach"></a></td>
      <td>
        <div id="xmas-popup-edit" class="popup" href="#" >
          <div class="popup-content">
            <table>
              <tr>You definitely want to edit the object</tr>
              <tr>
                <td>
                  <a href="/SachServlet?action=showTheMuonSach" class="btn btn-primary">Close </a>
                </td>
                <td>
                    <%--          <input type="submit" class="btn btn-primary" value="Edit" name="action">--%>
                  <a href="/SachServlet?action=TraSach&maMuonSach=${list.maMuonSach}"><input type="button" value="Tra Sach"> </a>
                </td>
              </tr>
            </table>
          </div>
        </div>
      </td>
    </tr>

  </c:forEach>
  <c:if test="${empty showList}">
    <p>Danh sách rỗng.</p>
  </c:if>
</table>



</body>
</html>
