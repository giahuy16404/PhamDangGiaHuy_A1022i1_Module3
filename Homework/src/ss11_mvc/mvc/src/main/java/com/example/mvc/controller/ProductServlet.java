package com.example.mvc.controller;

import com.example.mvc.bean.Product;
import com.example.mvc.repository.ProductRepository;
import com.example.mvc.repository.ProductRepositoryImlp;
import com.example.mvc.service.ProductService;
import com.example.mvc.service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {
    private  ProductService service = new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch(action){
            case "create":
            case "delete":
            case "update": {
                showList(request,response);
                break;
            }
            default:{
                showList(request,response);
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch(action){
            case "create":{
                doCreate(request,response);
                break;
            }
            case "update":{
                doUpdate(response,request);
                break;
            }
            case "delete":{
                doDelete(response,request);
                break;
            }
            case "view":{
                doView(request,response);
            }
            default:{
                showList(request,response);
            }

        }

    }

    private void doView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = service.findById(id);
        request.setAttribute("productView",product);
        request.getRequestDispatcher("/ProductServlet?action=null").forward(request,response);
    }

    private void doCreate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String origin = request.getParameter("origin");
        Product product = new Product(id, name, price, quantity, origin);
        if (service.add(product)) {
            response.sendRedirect("/ProductServlet");
        } else {
            String errorMsg = "ID of product existed";
            request.setAttribute("errorMgs", errorMsg);
            request.getRequestDispatcher("/menu.jsp")
                    .forward(request, response);
        }
    }
    private void doUpdate(HttpServletResponse response,HttpServletRequest request) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String origin = request.getParameter("origin");
        Product product = new Product(id, name, price, quantity, origin);
        if (service.update(product)) {
            response.sendRedirect("/ProductServlet");
        }
    }
    private void doDelete(HttpServletResponse response,HttpServletRequest request) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (service.delete(id)) {
            response.sendRedirect("/ProductServlet");
        }
    }
    public void showList(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        List<Product> list = service.findAll();
        request.setAttribute("list",list);
        request.getRequestDispatcher("WEB-INF/menu.jsp").forward(request,response);
    }
}
