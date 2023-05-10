package com.example.calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "Calculator", value = "/calculator")
public class Calculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("input.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Integer.parseInt(request.getParameter("first_operand"));
        float secondOperand = Integer.parseInt(request.getParameter("second_operand"));
        String select = request.getParameter("select");
        try {
            float result = calculator(firstOperand, secondOperand, select);
            request.setAttribute("result", result);
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } catch (Exception e) {
            String errorZero = "số chia phải lớn hơn 0!";
            request.setAttribute("errorZero", errorZero);
            request.getRequestDispatcher("input.jsp").forward(request, response);
        }
    }

    public float calculator(float firstOperand, float secondOperand, String operand) throws Exception {
            switch (operand) {
                case "addition":
                    return firstOperand + secondOperand;
                case "subtraction":
                    return firstOperand - secondOperand;
                case "multiplication":
                    return firstOperand * secondOperand;
                case "division":
                    if (secondOperand != 0) {
                        return firstOperand / secondOperand;
                    } else {
                        throw new RuntimeException("số chia phải khác 0");
                    }
                default:
                    throw new RuntimeException("chọn 1 phép toán");


        }
    }
}