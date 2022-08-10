/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package gippm;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "Add_stockSize", urlPatterns = {"/Add_stockSize"})

public class Add_stockSize extends HttpServlet {

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
        
        String stock=null;
        int long_term;
        int short_term;
        int mid_term;
        
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Stock Update</title>");            
            out.println("</head>");
            out.println("<body>");

               stock = request.getParameter("stock");
               long_term = parseInt(stock);
               mid_term = long_term*2;
               short_term = mid_term*5;
                    
                  
                try{
               Class.forName("com.mysql.jdbc.Driver"); 
               try{
                   
               Connection dbconnect=DriverManager.getConnection("jdbc:mysql://localhost:8000/gippm_db", "root", "password");
               Statement checkdb=dbconnect.createStatement();
               checkdb.executeUpdate("update products set product_quantity='"+short_term+"' where production line='1'");
               checkdb.executeUpdate("update products set product_quantity='"+mid_term+"' where production line='2'");
               checkdb.executeUpdate("update products set product_quantity='"+long_term+"' where production line='3'");

               out.println("Stock has been successful updated....To view stock, click");
               out.println("<a href='admin/products.jsp'>Here</a>");
               }catch(SQLException e){
                  out.println("error"+e.getMessage()); 
               }
              
            }catch(ClassNotFoundException e ){
            out.println("error"+e.getMessage());
            }
            out.println("</body>");
            out.println("</html>");
        } finally {
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
