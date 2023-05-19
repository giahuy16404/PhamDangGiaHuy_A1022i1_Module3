package controller;

import bean.User;
import repository.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "edit":
                break;
            case "arrangeForName":
                showArrangeForName(request, response);
                break;
            case "delete":
                break;
            case "showByName":
                break;
            default:
                showList(request, response);
                break;
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                doCreate(request, response);
                break;
            case "edit":
                doEdit(request, response);
                break;
            case "Delete":
                doRemove(request,response);
                break;
            case "showByName":
                doShowByName(request, response);
                break;
            default:
                showList(request, response);
                break;
        }

    }

    private void doRemove(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        userDao.deleteUser(id);
        try {
            response.sendRedirect("/UserServlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void doEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idUpdate"));
        String name = request.getParameter("nameUpdate");
        String email = request.getParameter("emailUpdate");
        String country = request.getParameter("countryUpdate");

        User user = new User(id, name, email, country);
        userDao.updateUser(user);
        try {
            response.sendRedirect("/UserServlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void showArrangeForName(HttpServletRequest request, HttpServletResponse response) {
        List<User> arrangeForName = userDao.arrangeForName();
        request.setAttribute("arrangeForName", arrangeForName);
        try {
            request.getRequestDispatcher("/UserServlet?action=null").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void doShowByName(HttpServletRequest request, HttpServletResponse response) {
        String inputShowByName = request.getParameter("showByName");
        List<User> user = userDao.selectUser(inputShowByName);
        request.setAttribute("userShowByName", user);
        try {
            request.getRequestDispatcher("/UserServlet?action=null").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void doCreate(HttpServletRequest request, HttpServletResponse response) {
        User user;
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        user = new User(name, email, country);
        try {
            userDao.insertUser(user);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            request.getRequestDispatcher("WEB-INF/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            request.getRequestDispatcher("WEB-INF/create.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userDao.selectAllUser();
        request.setAttribute("userList", userList);
        try {
            request.getRequestDispatcher("WEB-INF/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
