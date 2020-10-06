<%@ page import="db.Posts" %><%--
  Created by IntelliJ IDEA.
  User: ERLAN-PC
  Date: 06.10.2020
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>More</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/nav.jsp"%>

<div class="container">
    <div class="row mt-5">
        <div class="col-sm-6 offset-3">
            <%
                Posts post = (Posts) request.getAttribute("post");
                if(post!=null){
            %>
            <%
                String success = request.getParameter("success");
                if(success!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                Student saved successfully!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <%
                String error = request.getParameter("error");
                if(error!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Student saved wrong!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <form action="/save" method="post">
                <input type="hidden" name="id" value="<%=post.getId()%>">
                <div class="form-group">
                    <label>TITLE</label>
                    <input type="text" name="name" class="form-control" value="<%=post.getTitle()%>">
                </div>
                <div class="form-group">
                    <label>SHORT_CONTENT</label>
                    <input type="text" name="surname" class="form-control" value="<%=post.getShort_content()%>">
                </div>
                <div class="form-group">
                    <label>CONTENT</label>
                    <input type="text" name="middlename" class="form-control" value="<%=post.getContent()%>">
                </div>
                <div class="form-group">
<%--                    <label>DAY of post(dd.MM.YYYY)</label>--%>
                    <input type="hidden" name="bday" class="form-control" value="<%=post.getPost_date()%>">
                </div>

                <div class="form-group">
                    <button type="button" class="btn btn-danger btn-sm float-right ml-2" data-toggle="modal" data-target="#deleteStudModal">
                        DELETE STUDENT
                    </button>
                    <button class="btn btn-success btn-sm float-right">SAVE STUDENT</button>
                </div>
            </form>

            <div class="modal fade" id="deleteStudModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/delete" method="post">
                            <input type="hidden" name="id" value="<%=post.getId()%>">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Confirm Delete Process</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Are you sure?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                                <button type="submit" class="btn btn-danger">YES</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%
            }else{
            %>
            <h1 class="text-center">404 POST NOT FOUND</h1>
            <%
                }
            %>
        </div>
    </div>
</div>

</body>
</html>
