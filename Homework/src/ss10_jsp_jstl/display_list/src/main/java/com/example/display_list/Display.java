package com.example.display_list;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Display", value = "/display-list")
public class Display extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Entity> entities = new ArrayList<>();
        entities.add(new Entity("Mai Văn Hoàng", "1983-08-20","Hà Nội","https://goeco.link/tfCdI"));
        entities.add(new Entity("Mai Văn Hoàng", "1983-08-20","Hà Nội","https://goeco.link/tfCdI"));
        entities.add(new Entity("Mai Văn Hoàng", "1983-08-20","Hà Nội","https://goeco.link/tfCdI"));
        entities.add(new Entity("Mai Văn Hoàng", "1983-08-20","Hà Nội","https://goeco.link/tfCdI"));
        request.setAttribute("entities",entities);
        request.getRequestDispatcher("display.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
