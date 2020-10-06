<%@ page import="db.DBManager" %>
<%@ page import="java.sql.Date" %>
<%@ page import="db.Posts" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
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

      <div class="col-sm-6">
<%--        <button type="button" class="btn btn-primary" data-toggle="modal" id="addNew"  data-target="#staticBackdrop">--%>
<%--          +ADD NEW--%>
<%--        </button>--%>
        <%
          if(myuser!=null){
            ArrayList<Posts> allPosts= DBManager.getAllPosts();
            if(allPosts!=null){
              for (Posts p:allPosts){
        %>
        <div class="card mt-3">
          <div class="card-body">
            <h5 class="card-title"><%=p.getTitle()%></h5>
            <p class="card-text"><%=p.getShort_content()%></p>
            <form action="/details" method="get">
              <input type="hidden" name="id" value="<%=p.getId()%>">
              <button class="btn btn-primary">More-></button>
            </form>
          </div>
          <div class="card-footer">
            <%
//              SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
//              Date date = formatter.format(p.getPost_date())
            %>
            Posted on <%= p.getPost_date()%> by <a style="color: rgba(4,91,135,0.85) "><strong style="color: rgb(24,11,122);"><%=p.getAuthor().getFullName()%></strong></a>
          </div>
        </div>
        <%
              }
            }
          }
        %>
      </div>

      <div class="col-sm-3">
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

  <form action="/addPost" method="post">
    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="staticBackdropLabel">Add New Post</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label>TITLE:</label>
              <input type="text" name="title" class="form-control">
            </div>
            <div class="form-group">
              <label>SHORT CONTENT:</label>
              <textarea class="form-control" rows="20" name="short_content"></textarea>
            </div>
            <div class="form-group">
              <label>CONTENT:</label>
              <textarea class="form-control" rows="20" name="content"></textarea>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Add</button>
          </div>
        </div>
      </div>
    </div>
  </form>

  <%@include file="vendor/footer.jsp"%>
  </body>
</html>
