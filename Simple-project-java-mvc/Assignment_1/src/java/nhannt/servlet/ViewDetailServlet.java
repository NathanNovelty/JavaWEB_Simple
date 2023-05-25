/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhannt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nhannt.customer_tbl_order.customer_tbl_orderDAO;
import nhannt.customer_tbl_order.customer_tbl_orderDTO;
import nhannt.tbl_orderDetail.tbl_orderDetailDAO;
import nhannt.tbl_orderDetail.tbl_orderDetailDTO;

/**
 *
 * @author Trung Nhan
 */
public class ViewDetailServlet extends HttpServlet {
    private final String viewDetailPage = "ViewDetail.jsp";
    private final String errorPage = "ErrorPage.html"; 
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
        String url = errorPage;
        String orderID = request.getParameter("orderID");
        try {
            //Load Info Cust
            customer_tbl_orderDAO dao = new customer_tbl_orderDAO();
            dao.loadCustInfo(orderID);
            List<customer_tbl_orderDTO> result = dao.getListCustInfo();
            request.setAttribute("LOADCUSTINFO", result);
            
            //Load Order Detail
            tbl_orderDetailDAO oDAO = new tbl_orderDetailDAO();
            oDAO.loadListOrderDetail(orderID);
            List<tbl_orderDetailDTO> rs = oDAO.getListOrderDetail();
            request.setAttribute("LOADORDERDETAIL", rs);
            url = viewDetailPage;
            
            //Load Total Price
            float totalPrice= oDAO.sumTotalPrice(orderID);
            request.setAttribute("TOTALPRICE", totalPrice);
            
                    
            
        } catch (SQLException e) {
            log("Can not connect DB in viewdetailServlet ", e);
        } catch (NamingException e) {
            log("Can not find class in viewdetailServlet", e);
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
