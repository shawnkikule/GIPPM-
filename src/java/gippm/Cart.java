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
@WebServlet(name = "Cart", urlPatterns = {"/Cart"})

public class Cart extends HttpServlet {

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
        
        String milk = request.getParameter("q_milk");
            String butter = request.getParameter("q_butter");
            String ghee = request.getParameter("q_ghee");
            String yog = request.getParameter("q_yoghurt");


            int update_milk= parseInt(milk)*1500;
            int update_butter= parseInt(butter)*13000;
            int update_ghee= parseInt(ghee)*6000;
            int update_yog= parseInt(yog)*2000;
            int total = update_milk+update_ghee+update_butter+update_yog;
        
        try ( PrintWriter out = response.getWriter()) {
            
            
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Cart Update</title>");            
            out.println("</head>");
            out.println("<body>");
            
                    

                try{
               Class.forName("com.mysql.jdbc.Driver"); 
               try{
                   
               Connection dbconnect=DriverManager.getConnection("jdbc:mysql://localhost:8000/gippm_db", "root", "password");
               Statement checkdb=dbconnect.createStatement();
              checkdb.executeUpdate("insert into orders(customer_id, milk, butter, ghee, yoghurt, total)values('"+67+"','"+update_milk+"','"+update_butter+"','"+update_ghee+"','"+update_yog+"','"+total+"')");
              checkdb.executeUpdate("update products set sales='"+update_milk+"' where product_id='g001'");
              checkdb.executeUpdate("update products set sales='"+update_butter+"' where product_id='g003'");
              checkdb.executeUpdate("update products set sales='"+update_ghee+"' where product_id='g004'");
              checkdb.executeUpdate("update products set sales='"+update_yog+"' where product_id='g002'");
                out.println("Your shopping cart has been updated....To view it, click");
               out.println("<a href='shop/checkout.jsp'>Here</a>");
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
