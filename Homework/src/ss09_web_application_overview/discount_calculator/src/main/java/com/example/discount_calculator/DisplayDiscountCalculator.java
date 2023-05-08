package com.example.discount_calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DisplayDiscountCalculator", value = "/discount_calculator")
public class DisplayDiscountCalculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("input_discount_calculator.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("product_description");
        double price = Double.parseDouble(request.getParameter("list_price"));
        double percent = Double.parseDouble(request.getParameter("discount_percent"));

        double amount = price * percent * 0.01;
        double discountPrice = price - amount;
        request.setAttribute("amount", amount);
        request.setAttribute("discountPrice", discountPrice);

        request.getRequestDispatcher("display_discount.jsp").forward(request, response);

    }
}