package controller;

import bean.Customer;
import service.CustomerServiceImlp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "customerServlet", value = "/customerServlet")
public class CustomerServlet extends HttpServlet {
    private CustomerServiceImlp customerServiceImlp = new CustomerServiceImlp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showAdd(request, response);
                break;
            case "edit":
                showEditFrom(request, response);
                break;
            case "delete":
                showDelete(request,response);
                break;
            default:
                listCustomer(request, response);
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
                doCreateCustomer(request, response);
                break;
            case "edit":
                doEditCustomer(request, response);
                break;
            case "delete":
                doDeleteCustomer(request,response);
                break;
            case "view":
                doView(request,response);
                break;
            default:
                listCustomer(request, response);
                break;
        }

    }

    private void doView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerServiceImlp.findById(id);
        request.setAttribute("customerView",customer);
        request.getRequestDispatcher("/customerServlet?action=null").forward(request,response);

    }


    private void showView(HttpServletRequest request, HttpServletResponse response) {

    }

    private void doDeleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        customerServiceImlp.remove(id);
        response.sendRedirect("/customerServlet");
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerServiceImlp.findById(id);
        request.setAttribute("customer",customer);
        request.getRequestDispatcher("delete.jsp").forward(request,response);
    }


    private void doEditCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer customer = customerServiceImlp.findById(id);
        customer.setName(name);
        customer.setEmail(email);
        customer.setAddress(address);
        response.sendRedirect("/customerServlet");
    }

    private void showEditFrom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerServiceImlp.findById(id);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("edit.jsp").forward(request, response);

    }


    private void doCreateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int id = (int) (Math.random() * 10000);

        Customer customer = new Customer(id, name, email, address);
        customerServiceImlp.add(customer);
        request.setAttribute("message", "New customer was created");
        request.getRequestDispatcher("add.jsp").forward(request, response);
    }

    private void showAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("add.jsp").forward(request, response);
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerServiceImlp.finAll();
        request.setAttribute("customerList", customerList);

        request.getRequestDispatcher("list.jsp").forward(request, response);
    }
}
