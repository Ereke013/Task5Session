<%--
  Created by IntelliJ IDEA.
  User: ERLAN-PC
  Date: 03.10.2020
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ADD</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/nav.jsp"%>
        <div class="row mt-5">
            <div class="col-sm-12">
                <h2 class="text-center">Create new Account</h2>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-4 offset-4">
                <form action="/add" method="post">
                    <div class="form-group">
                        <label>Email address</label>
                        <input type="email" name="email" class="form-control">
                        <label style="font-size: 12px; color: #8c8685">Input your email</label>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control">
                        <label style="font-size: 12px; color: #8c8685">Input your password</label>
                    </div>
                    <div class="form-group">
                        <label>Re-Password</label>
                        <input type="password" name="re-password" class="form-control">
                        <label style="font-size: 12px; color: #8c8685">Re input your password again</label>
                    </div>
                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" name="full_name" class="form-control">
                        <label style="font-size: 12px; color: #8c8685">Input your full name</label>
                    </div>
                    <div class="form-group">
                        <label>Birthdate</label>
                        <input type="date" name="birthdate" class="form-control">
                        <label style="font-size: 12px; color: #8c8685">Input your birthdate</label>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-sm btn-primary">Sign Up</button>
                    </div>
                </form>
            </div>
        </div>

</body>
</html>
