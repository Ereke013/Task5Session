<%@ page import="db.DBManager" %>
<%@ page import="db.Posts" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ERLAN-PC
  Date: 05.10.2020
  Time: 06:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Post</title>
    <%@include file="vendor/head.jsp"%>
<%--    <script src="tinymce/tinymce/tinymce.min.js"></script>--%>
    <script>tinymce.init({selector:'textarea'});</script>
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
            <button type="button" class="btn btn-primary" data-toggle="modal" id="addNew"  data-target="#staticBackdrop">
            +ADD NEW
        </button>

            <%

                    ArrayList<Posts> allPosts= DBManager.getPostByUserId(myuser.getId());
                    if(allPosts!=null){
                        for (Posts p:allPosts){
            %>
            <div class="card mt-3">
                <div class="card-body">
                    <h5 class="card-title"><%=p.getTitle()%></h5>
                    <p class="card-text"><%=p.getShort_content()%></p>
                    <form action="/edit" method="get">
                        <input type="hidden" name="id" value="<%=p.getId()%>">
                        <button class="btn btn-light">More-></button>
                    </form>
                </div>
                <div class="card-footer">
                    Posted on <%=p.getPost_date()%> by <a style="color: rgba(4,91,135,0.85) "><%=p.getAuthor().getFullName()%></a>
                </div>
            </div>
            <%
                        }

                }
            %>
        </div>
        <div class="col-sm-3    ">
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
            %>
        </div>
</div>


<%@include file="vendor/footer.jsp"%>
</body>
</html>
