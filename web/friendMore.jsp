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
<%--    <script>tinymce.init({selector:'textarea'});</script>--%>
<%--    <script src="https://cdn.tiny.cloud/1/1x1l6uqjv5ujxfpdkoyg1vf5a9xmhjr0fhen7h7cpbyrtrve/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>--%>
<%--    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>--%>
<%--    <script>tinymce.init({selector:'textarea'});</script>--%>

</head>
<body>
<%@include file="vendor/nav.jsp"%>

<div class="container">
    <div class="row mt-3">
        <div class="col-sm-3">
            <%
                Users user = (Users) request.getAttribute("user");
                if(user!=null){
            %>
            <img src="<%=user.getPicture_url()%>" width="255px">
            <table class="table table-bordered mt-3">
                <tr>
                    <td><strong><%=user.getFullName()%>, <%= DBManager.getAge(user.getId()) %> age</strong></td>
                </tr>
                <tr>
                    <td><a style="color: #0062cc" href="/delete?id=<%=user.getId()%>"><i class="fas fa-minus-circle mr-2"></i><strong>Remove From Friends</strong></a></td>
                </tr>
                <tr>
                    <td><a style="color: #0062cc" href="#"><i class="fab fa-telegram-plane mr-2"></i><strong>Send Message</strong></a></td>
                </tr>
                <tr>
                    <td><a href="/logout" style="color: #a82047"><i class="fas fa-sign-out-alt mr-2"></i><strong>Logout</strong></a></td>
                </tr>
            </table>

        </div>
        <div class="col-sm-6">

            <%

                    ArrayList<Posts> allPosts= (ArrayList<Posts>) request.getAttribute("posts");
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
                    Posted on <%=p.getPost_date()%> by <a style="color: rgba(4,91,135,0.85) "><strong style="color: rgb(24,11,122);"><%=p.getAuthor().getFullName()%></strong></a>
                </div>
            </div>
            <%
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
            %>
        </div>
</div>

<form action="/addPost" method="post">
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Add post</h5>
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
