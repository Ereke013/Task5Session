package servlets;

import db.DBManager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(value = "/update")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        if(request.getParameter("profile") != null) {
            String email = request.getParameter("email");
            String full_name = request.getParameter("full_name");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));

            Users us = (Users) request.getSession().getAttribute("MeUser");
            if (us != null) {
                us.setEmail(email);
                us.setFullName(full_name);
                us.setBirthdate(birthdate);
                if (DBManager.saveUser(us)) {
                    request.getSession().setAttribute("MeUser", us);
                    response.sendRedirect("/home.jsp");
                }
            }
        }

        else if(request.getParameter("picture") != null){
            String picture_url = request.getParameter("url");

            Users users = (Users) request.getSession().getAttribute("MeUser");
            if(users != null){
                users.setPicture_url(picture_url);
                if (DBManager.saveUser(users)) {
                    request.getSession().setAttribute("MyUser",users);
                    response.sendRedirect("/home");
                }
            }
        }

        else if(request.getParameter("password") != null){
            String old_password = request.getParameter("old_password");
            String new_password = request.getParameter("new_password");
            String re_password = request.getParameter("re_new_password");

            Users users = (Users) request.getSession().getAttribute("MeUser");
            if(users != null){
                if(new_password.equals(re_password)) {
                    if (users.getPassword().equals(old_password)) {
                        users.setPassword(new_password);
                        if(DBManager.saveUser(users)){
                            request.getSession().setAttribute("MeUser",users);
                            response.sendRedirect("/home");
                        }
                    }
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
