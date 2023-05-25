/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhannt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nhannt.tbl_order.tbl_orderDAO;
import nhannt.tbl_order.tbl_orderDTO;

/**
 *
 * @author Trung Nhan
 */
public class SearchServlet extends HttpServlet {

    private final String searchPage = "Search.jsp";

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
        PrintWriter out = response.getWriter();
        String url = searchPage;
        String fromDate = request.getParameter("txtFromDate");
        System.out.println("fromDate = " + fromDate);
        String toDate = request.getParameter("txtToDate");
        System.out.println("toDate = " + toDate);
        String isDeli = request.getParameter("chkDelivered");
        System.out.println("isDeli = " + isDeli);
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date parseDate = dateFormat.parse(fromDate);
            System.out.println("fromDate: " + fromDate);
            System.out.println("parseDate: " + parseDate.toString());
            Timestamp startDate = new java.sql.Timestamp(parseDate.getTime());
            System.out.println("startDate: " + startDate);

            Date parseDate_1 = dateFormat.parse(toDate);
            Timestamp endDate = new java.sql.Timestamp(parseDate_1.getTime());
            tbl_orderDAO dao = new tbl_orderDAO();
            if (isDeli == null) {

                dao.searchDeliOrder(startDate, endDate, false);
                List<tbl_orderDTO> rs = dao.getListOrder();
                request.setAttribute("LOADRESULT", rs);
            } else {
                dao.searchDeliOrder(startDate, endDate, true);
                List<tbl_orderDTO> result = dao.getListOrder();
                request.setAttribute("LOADRESULT", result);
            }
        } catch (SQLException e) {
            log("Can not connect DB in ", e);
        } catch (NamingException e) {
            log("Can not find class in ", e);
        } catch (ParseException e) {
            log("Can not convert to DateFormat", e);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
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
