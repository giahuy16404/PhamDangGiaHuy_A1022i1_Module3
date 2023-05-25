package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MenuServlet", value = "/MenuServlet")
public class MenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String object = request.getParameter("object");
        if (object == null){
            object = " ";
        }
        switch (object){
            case "/CustomerServlet":
                showCustomer(request,response);
                break;
            default:
                showMenu(request,response);
                break;
        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void showCustomer(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/CustomerServlet?action=showCustomer").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void showMenu(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("showMenu.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
