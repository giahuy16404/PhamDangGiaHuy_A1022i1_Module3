package controller;

import bean.HocSinh;
import bean.Sach;
import bean.TheMuonSach;
import repository.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "SachServlet", value = "/SachServlet")
public class SachServlet extends HttpServlet {
    SachIMLP sachIMLP = new SachIMLP();
    HocSinhIMLP hocSinhIMLP = new HocSinhIMLP();

    TheMuonSachIMLP theMuonSachIMLP = new TheMuonSachIMLP();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "muon":
                showMuonSach(request,response);
                break;
            case "TraSach":
                traSach(request,response);
            case "showTheMuonSach":
                showTheMuonSach(request,response);
                break;
            default:
                showList(request,response);
                break;
        }

    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "addTheMuonSach":
                addTheMuonSach(request,response);
                break;
            case "showTheMuonSach":
                showTheMuonSach(request,response);
                break;
            default:
                showList(request,response);
        }
    }
    private void traSach(HttpServletRequest request, HttpServletResponse response) {
        int maSach = Integer.parseInt(request.getParameter("maMuonSach")) ;
        theMuonSachIMLP.traSach(maSach);
        try {
            request.getRequestDispatcher("/SachServlet?action=showTheMuonSach").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showTheMuonSach(HttpServletRequest request, HttpServletResponse response) {
        List<TheMuonSach> theMuonSachList = theMuonSachIMLP.showList();
        request.setAttribute("showList",theMuonSachList);
        try {
            request.getRequestDispatcher("listTheMuonSach.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void addTheMuonSach(HttpServletRequest request, HttpServletResponse response) {
        int maMuonSach = Integer.parseInt(request.getParameter("maMuonSach"));
        String tenSach = request.getParameter("tenSach");
        String tenHocSinh = request.getParameter("tenHocSinh");
        String ngayMuon =  request.getParameter("ngayMuonSach");
        String ngayTra = request.getParameter("ngayTraSach");

        Boolean trangThai  = true;
        int maSach = theMuonSachIMLP.getMaSachByName(tenSach);
        int maHocSinh = theMuonSachIMLP.getMaHocSinhByName(tenHocSinh) ;
        if ( theMuonSachIMLP.addTheMuonSach( new TheMuonSach(maMuonSach,maSach,maHocSinh,trangThai,ngayMuon,ngayTra))){
            theMuonSachIMLP.updateSoLuongSachTang(theMuonSachIMLP.getMaSachByName(tenSach));
        }
        try {
            response.sendRedirect("/SachServlet?action=showTheMuonSach");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }




    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Sach> sachList = sachIMLP.showList();
        request.setAttribute("sachList",sachList);
        try {
            request.getRequestDispatcher("list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showMuonSach(HttpServletRequest request, HttpServletResponse response) {
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        if (soLuong >0){
            String tenSach =  request.getParameter("tenSach") ;
            List<HocSinh> hocSinhList =  hocSinhIMLP.showList();
            LocalDate ngayMuon = LocalDate.now();
            request.setAttribute("ngayMuon",ngayMuon);
            request.setAttribute("hocSinhList",hocSinhList);
            request.setAttribute("tenSach",tenSach);
        }else {
            String errorSoLuong = "Sach ban thue da het!";
            request.setAttribute("errorSoLuong",errorSoLuong);
        }

        try {
            request.getRequestDispatcher("muonSach.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


}
