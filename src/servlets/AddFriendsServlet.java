package servlets;

import db.DBManager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/addFriends")
public class AddFriendsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long friendId = Long.parseLong(request.getParameter("id"));

        Users users = (Users) request.getSession().getAttribute("MeUser");
        if(users != null){
            if(DBManager.addFriendReq(users.getId(),friendId)){
                response.sendRedirect("/friends");
            }
            else {
                response.sendRedirect("/home");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("search_name");
        ArrayList<Users> users = DBManager.findFriend(name);
        request.setAttribute("users",users);
        request.setAttribute("search_name", name);
        request.getRequestDispatcher("/addfriends.jsp").forward(request,response);
    }
}
