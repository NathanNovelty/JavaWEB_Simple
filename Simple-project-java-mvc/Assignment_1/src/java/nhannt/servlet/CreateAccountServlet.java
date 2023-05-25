/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhannt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nhannt.customer.customerDAO;

/**
 *
 * @author Trung Nhan
 */
public class CreateAccountServlet extends HttpServlet {
    private final String loginPage = "Login.html";
    private final String createNewAccountPage = "CreateNewAccount.jsp";
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
        String url = createNewAccountPage;
        String custID = request.getParameter("insertCustID");
        String password = request.getParameter("insertPassword");
        String custName = request.getParameter("insertCustName");
        String lastName = request.getParameter("insertLastName");
        String middleName = request.getParameter("insertMiddleName");
        String address = request.getParameter("insertAddress");
        String phone = request.getParameter("insertPhone");
        
        try {
            customerDAO dao = new customerDAO();
            boolean error = dao.checkExistCustID(custID);
            if (error) {
                url = createNewAccountPage;
                request.setAttribute("ERRORPRIMARYKEY", error);
            }else{
               boolean rs =  dao.insertNewCus(custID, password, custName, lastName, middleName, address, phone,1);
                System.out.println("Vào dc insert "); 
               if (rs) {
                   System.out.println("vào đc if");
                    url = loginPage;
                }
            }
            
        } catch (SQLException e) {
            log("Can not connect DB in ", e);
        } catch (NamingException e) {
            log("Can not find class in ", e);
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
