package servlets;

import db.DBManager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/delete")
public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long friendId = Long.parseLong(request.getParameter("id"));
        Users users = (Users) request.getSession().getAttribute("MeUser");
        if(users!=null){
            if(DBManager.reject(users.getId(),friendId)){
                response.sendRedirect("/friend");
            }
            else {
                response.sendRedirect("/home");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Users users = (Users) request.getSession().getAttribute("MeUser");
        if(users!=null){
            if(DBManager.removeFriend(users.getId(),id)){
                response.sendRedirect("/friend");
            }
            else {
                response.sendRedirect("/home");
            }
        }
    }
}