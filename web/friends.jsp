<%@ page import="db.DBManager" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ERLAN-PC
  Date: 10.10.2020
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Friends</title>
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
            <form class="form-inline my-2 my-lg-0" action="/addFriends" method="get">
                <input class="form-control mr-sm-4 col-sm-9" name="search_name" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-primary my-2 my-sm-0" type="submit"><i class="fas fa-search mr-1"></i>Search</button>
            </form>

            <%
                ArrayList<Users> usersRequest = DBManager.getAllRequests(myuser.getId());
                if(usersRequest!=null){
                    for(Users users:usersRequest){


            %>
            <div class="card mt-3">
                <div class="card-header">
                    You have <%=usersRequest.size()%> new requests
                </div>
                <div class="media" >
                    <div class="row no-gutters p-2">
                        <div class="col-md-4">
                            <img src="<%=users.getPicture_url()%>" class="rounded-circle mt-3" width="100px" height="100px">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title"><strong><%= users.getFullName()%></strong></h5>
                                <%--                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
                                <p class="card-text" style="font-size: 14px; color: #8c8685"><%= DBManager.getAge(users.getId()) %> age old</p>
                                <div class="d-flex">
                                    <form action="/add" method="post">
                                        <input type="hidden" name="id" value="<%=users.getId()%>">
                                        <button class="btn btn-sm btn-outline-primary"> <i class="fas fa-plus-circle mr-1"></i>Confirm</button>
                                    </form>
                                    &nbsp;
                                    <form action="/delete" method="post">
                                        <input type="hidden" name="id" value="<%=users.getId()%>">
                                        <button type="submit" class="btn btn-sm btn-outline-primary"> <i class="fas fa-trash-alt"></i>Reject</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    }
                }
                ArrayList<Users> userFriends = DBManager.getAllFriends(myuser.getId());
                if(userFriends!=null){
                    for(Users user: userFriends){
//                        if(user != myuser){
            %>
            <div class="media card mb-3 mt-3" style="max-width: 540px;">
                <div class="row no-gutters p-2">
                    <div class="col-md-4">
                       <a href="/more?id=<%=user.getId()%>"><img src="<%=user.getPicture_url()%>" class="rounded-circle mt-3" width="100px" height="100px"></a>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <a href="/more?id=<%=user.getId()%>"><h5 class="card-title"><strong><%= user.getFullName()%></strong></h5></a>
<%--                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
                            <p class="card-text" style="font-size: 14px; color: #8c8685"><%= DBManager.getAge(user.getId()) %> age old</p>
                            <button type="button" class="btn btn-outline-primary"><i class="fab fa-telegram-plane" style="margin-right: 7px"></i> Send Message</button>
                        </div>
                    </div>
                </div>
            </div>
<%--            <div class="card">--%>
<%--                <img src="<%=user.getPicture_url()%>" width="200px" class=" rounded-circle" style="clear: left" alt="100x100" data-holder-rendered="true">--%>

<%--                    <h3><strong><%= user.getFullName()%></strong></h3>--%>
<%--                    <h5 style="font-size: 14px; color: #8c8685"><%= DBManager.getAge(user.getId()) %> age old</h5>--%>
<%--                    <button type="button" class="btn btn-outline-primary"><i class="fab fa-telegram-plane" style="margin-right: 7px"></i> Send Message</button>--%>

<%--            </div>--%>
          <%
//                      }
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
