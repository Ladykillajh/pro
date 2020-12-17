/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daoAdmin.ChiTietDonHangDAO;
import daoAdmin.DonHangDAO;
import daoAdmin.KhachHangDAO;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import modelAdmin.ChiTietDonHang;
import modelAdmin.DonHang;
import modelAdmin.KhachHang;

/**
 *
 * @author thai9
 */
public class UpdateKHmua extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            HttpSession session = request.getSession(true);
            String tenKhachHang = request.getParameter("user");
            Account acc = (Account) session.getAttribute("login");

            KhachHangDAO update = new KhachHangDAO();
            request.setAttribute("update", update.selectByUser(tenKhachHang));
            
            if(request.getParameter("save")!=null){
                    int maKhachHang= Integer.valueOf(request.getParameter("maKhachHang"));
                    String tenKhachHang1 = request.getParameter("hoTen");
                    String gioiTinh = request.getParameter("gioiTinh");
                    String email = request.getParameter("email");
                    String diaChi = request.getParameter("diaChi");
                    String sDT = request.getParameter("sDT");
                    System.out.println(acc.getUsername());
                    String account = acc.getUsername();
                    KhachHang kh2 = new KhachHang(maKhachHang, tenKhachHang1, gioiTinh, email, diaChi, sDT, account);
                    update.update1(kh2);
                    session.setAttribute("kh1", kh2);
                     response.sendRedirect("xacnhan?user="+account);
                    return;
                
               
                   // System.out.println(tenKhachHang1);
                }
                
                      
            
            RequestDispatcher rd = request.getRequestDispatcher("diachivadichvu.jsp");
            rd.forward(request, response);
        
        } catch (Exception exc) {
            response.getWriter().print(exc);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}