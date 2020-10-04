<%@ page import="db.DBManager" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: ERLAN-PC
  Date: 03.10.2020
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>HOME</title>
    <%@include file="vendor/head.jsp"%>
  </head>
  <body>
  <%@include file="vendor/nav.jsp"%>
  <div class="container">
    <div class="row mt-3">
      <div class="col-sm-3">
        <%
          if(myuser!=null){
        %>
        <img src="<%=myuser.getPicture_url()%>" width="255px">
        <table class="table table-bordered mt-3">
          <tr>
            <td><strong><%=myuser.getFullName()%>, <%= DBManager.getAge(myuser.getId()) %> age</strong></td>
          </tr>
          <tr>
            <td><a style="color: #0062cc" href="/profile.jsp"><i class="fas fa-address-card mr-2"></i><strong>My profile</strong></a></td>
          </tr>
          <tr>
            <td><a style="color: #0062cc" href="#"><i class="fas fa-cogs mr-2"></i><strong>Settings</strong></a></td>
          </tr>
          <tr>
            <td><a href="/logout" style="color: #a82047"><i class="fas fa-sign-out-alt mr-2"></i><strong>Logout</strong></a></td>
          </tr>
        </table>
      </div>

      <div class="col-sm-3 offset-1">
        <div class="card" style="width: 18rem;">
          <div class="card-header bg-primary" style="font-size: 15px; color: #ffffff">
            <strong>
            Latest Bithdays
            </strong>
          </div>
          <div class="card-body">
            <p class = "card-text"> Musa Uatbaev, tomorrow</p>
            <p class = "card-text"> Azamat Tolegenov,02 October</p>
            <p class = "card-text"> Yerik Utemuratov,05 October</p>
            <p class = "card-text"> Aybek Bagit,10 October</p>
          </div>
        </div>
        <div class="card mt-4" style="width: 18rem;">
          <div class="card-header bg-primary" style="font-size: 15px; color: #ffffff">
            <strong>
             My Games
            </strong>
          </div>
          <div class="card-body">
            <p class="card-text" style="color: rgb(24,11,122)"><strong><i class="far fa-futbol mr-2"></i>FOOTBAL ONLINE </strong></p>
            <p class="card-text" style="color: rgb(24,11,122)"><strong><i class="fas fa-table-tennis mr-2"></i>PING PONG ONLINE </strong></p>
            <p class="card-text" style="color: rgb(24,11,122)"><strong><i class="fas fa-chess mr-2"></i>CHESS MASTERS </strong></p>
            <p class="card-text" style="color: rgb(24,11,122)"><strong><i class="fas fa-car mr-2"></i>RACES ONLINE </strong></p>
          </div>
        </div>
      </div>

      <%
        }
        else {
          response.sendRedirect("/404.jsp");
        }
      %>
    </div>
  </div>


  <%@include file="vendor/footer.jsp"%>
  </body>
</html>
