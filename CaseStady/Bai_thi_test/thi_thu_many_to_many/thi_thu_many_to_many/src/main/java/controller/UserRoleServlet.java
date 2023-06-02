package controller;

import bean.Role;
import bean.User;
import bean.UserRole;
import service.UserRoleService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserRoleServlet", value = "/UserRoleServlet")
public class UserRoleServlet extends HttpServlet {
    UserRoleService userRoleService = new UserRoleService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showCreate":
                showCreate(request, response);
                break;
            case "doRemove":
                doRemove(request, response);
                break;
            case "showEdit":
                showEdit(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                doCreate(request, response);
                break;
            case "showBy":
                showBy(request, response);
                break;
            case "doEdit":
                doEdit(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void showBy(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idShowBy"));
        String name = request.getParameter("nameShowBy");
        List<UserRole> list = userRoleService.showBy(id, name);
        request.setAttribute("showList",list);
        try {
            request.getRequestDispatcher("showList.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void doRemove(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        userRoleService.remove(id);
        try {
            request.getRequestDispatcher("/UserRoleServlet?action=showList").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void doEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idUserUpdate"));
        String name = request.getParameter("nameUserUpdate");
        String codeUserUpdate = request.getParameter("codeUserUpdate");
        String birthday = request.getParameter("birhtdayUserUpdate");
        LocalDateTime localDateTime = LocalDateTime.now();
        String thoiGianKhoiTao = localDateTime.toString();

        String[] roleUpdate = request.getParameterValues("roleUpdate");
        List<Role> roleList = new ArrayList<>();
        for (String r : roleUpdate) {
            Role role1 = new Role();
            role1.setIdRole(Integer.parseInt(r));
            roleList.add(role1);
        }
        User user = new User(id, name, codeUserUpdate, birthday, thoiGianKhoiTao, roleList);
        userRoleService.edit(user);
        try {
            request.getRequestDispatcher("/UserRoleServlet?action=showList").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", id);
        try {
            request.getRequestDispatcher("edit.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void doCreate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idUser"));
        String name = request.getParameter("nameUser");
        String code = request.getParameter("codeUser");
        String birhtdayUser = request.getParameter("birhtdayUser");
        LocalDateTime localDateTime = LocalDateTime.now();
        String thoiGianKhoiTao = localDateTime.toString();

        String[] roleAsString = request.getParameterValues("role");
        List<Role> roleList = new ArrayList<>();
        for (String r : roleAsString) {
            Role role1 = new Role();
            role1.setIdRole(Integer.parseInt(r));
            roleList.add(role1);
        }

        User user = new User(id, name, code, birhtdayUser, thoiGianKhoiTao, roleList);
        userRoleService.addUser(user);

        try {
            request.getRequestDispatcher("/UserRoleServlet?action=null")
                    .forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<UserRole> list = userRoleService.showList();
        request.setAttribute("showList", list);
        try {
            request.getRequestDispatcher("showList.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("addUserRole.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


}

