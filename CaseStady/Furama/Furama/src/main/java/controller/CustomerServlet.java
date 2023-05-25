package controller;

import bean.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = " ";
        }
        switch (action){
            default:
                showCustomer(request,response);
                break;
        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = " ";
        }
        switch (action){
            case "addCustomer":
                doAddCustomer(request,response);
            default:
                showCustomer(request,response);
                break;
        }
    }

    private void doAddCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int type = Integer.parseInt(request.getParameter("type"))  ;
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idcard = request.getParameter("idcard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer customer = new Customer(id,type,name,birthday,gender,idcard,phone,email,address);
        customerImlp.add(customer);
        try {
            response.sendRedirect("/CustomerServlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> list = customerImlp.showList();
        request.setAttribute("showListCustomer",list);
        try {
            request.getRequestDispatcher("jsp_customer/showCustomer.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }
}
