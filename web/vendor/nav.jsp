<%@ page import="db.Users" %><%--<div class="container">--%>
<%
    Users myuser = (Users)request.getSession().getAttribute("MeUser");
%>
<%
    if(myuser != null){
%>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #c7d7ed; padding: 10px 10%">
        <a class="navbar-brand" href="/home" style=" font-size: 30px; color: #19386b">
        <img src="../img/aa.png" width="30px" class="ui-icon-image mr-1" alt="" loading="lazy">
        <strong>ARALASU KZ</strong></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse " style="padding-left: 20%; justify-content: space-between">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link d-flex" style="font-size: 20px; color: #122647" href="/register"><i class="fas fa-portrait"></i>Feed</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; color: #122647" href="/city">My Friends</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; color: #122647" href="/city">Groups</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; color: #122647" href="/city">My Posts</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; color: #122647" href="/city">Messages</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; color: #122647" href="/city">Pictures</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" style="font-size: 20px; color: #122647" href="/city">Videos</a>
        </li>
    </ul>
        </div>

    <%
        }
        else {
    %>
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #c7d7ed; padding: 10px 10%">
        <a class="navbar-brand" href="/" style=" font-size: 30px; color: #19386b">
            <img src="../img/aa.png" width="30px" class="ui-icon-image mr-1" alt="" loading="lazy">
            <strong>ARALASU KZ</strong></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    <div class="collapse navbar-collapse " style="padding-left: 40%">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link d-flex" style="font-size: 20px; color: #122647" href="/register"><i class="fas fa-portrait"></i>Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="font-size: 20px; color: #122647" href="/city">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="font-size: 20px; color: #122647" href="/city">FAQ</a>
                </li>
                <li class="nav-item">

                    <a class="nav-link" style="font-size: 20px; color: #122647" href="/city"><img src="img/aa.png" style="width: 20px">About Aralasu</a>
                </li>
            </ul>
    </div>

<%
                }
            %>
    </nav>
<%--</div>--%>