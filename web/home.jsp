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
            <td><%=myuser.getFullName()%>, <%= DBManager.getAge(myuser.getId()) %> age</td>
          </tr>
          <tr>
            <td><a>My profile</a></td>
          </tr>
          <tr>
            <td><a>Settings</a></td>
          </tr>
          <tr>
            <td><a href="/logout"><button>Logout</button></a></td>
          </tr>
        </table>



      </div>
      <div class="col-sm-4 offset-1">
        <h2 class="text-center">EDIT Profile</h2>
        <form action="/update?profile" method="post">
          <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" class="form-control" value="<%=myuser.getEmail()%>">
            <label style="font-size: 12px; color: #8c8685">Input your email</label>
          </div>
          <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="full_name" class="form-control" value="<%=myuser.getFullName()%>">
            <label style="font-size: 12px; color: #8c8685">Input your full name</label>
          </div>
          <div class="form-group">
            <label>Birthdate</label>
            <input type="date" name="birthdate" class="form-control" value="<%=String.valueOf(myuser.getBirthdate())%>">
            <label style="font-size: 12px; color: #8c8685">Input your birthdate</label>
          </div>
          <div class="form-group">
            <button class="btn btn-sm btn-primary">Update Profile</button>
          </div>
        </form>

        <h2 class="mt-5">Edit picture</h2>
        <form action="/update?picture" method="post">
          <div class="form-group">
            <label>URL</label>
            <input type="text" name="url" class="form-control" value="<%= myuser.getPicture_url()%>">
            <label style="font-size: 12px; color: #8c8685">Input your profile photo</label>
          </div>
          <div class="form-group">
            <button class="btn btn-sm btn-primary">Update Picture</button>
          </div>
        </form>

        <h2 class="mt-4">Update Password</h2>
        <form action="/update?password" method="post">
          <div class="form-group">
            <label>Old Password</label>
            <input type="password" name="old_password" class="form-control">
            <label style="font-size: 12px; color: #8c8685">Input your old password</label>
          </div>
          <div class="form-group">
            <label>New Password</label>
            <input type="password" name="new_password" class="form-control">
            <label style="font-size: 12px; color: #8c8685">Input your new password </label>
          </div>
          <div class="form-group">
            <label>Re-New Password</label>
            <input type="password" name="re_new_password" class="form-control" >
            <label style="font-size: 12px; color: #8c8685">Re type your new password again</label>
          </div>
          <div class="form-group">
            <button class="btn btn-sm btn-primary">Update Password</button>
          </div>
        </form>
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
            <p class="card-text">FOOTBAL ONLINE</p>
            <p class="card-text">PING PONG ONLINE</p>
            <p class="card-text">CHESS MASTERS</p>
            <p class="card-text">RACES ONLINE</p>
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
