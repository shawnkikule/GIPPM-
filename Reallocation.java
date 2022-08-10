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
import java.sql.ResultSet;
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
@WebServlet(name = "Reallocation", urlPatterns = {"/Reallocation"})

public class Reallocation extends HttpServlet {

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
        
        ResultSet sale_high=null;
        String MAX =null;
        int MAXs = 0;
        
        ResultSet sale_low=null;
        String MIN = null;
        int MINs;
        
        ResultSet prod_high=null;
        String MAXP =null;
        int MAXPp = 0;
        
        ResultSet prod_low=null;
        String MINP = null;
        int MINPp = 0;
        
        ResultSet staff_long=null;
        String llong = null;
        
        ResultSet staff_mid=null;
        String mlong = null;
        
        ResultSet staff_short=null;
        String slong = null;
        
        ResultSet staff_unassign=null;
        String ustaff = null;
        
        //default hours needed to manufacture products on long term line
        int time_long = 10;
        
        //variables to store production line sizes and integers for calculations
        int mid_term;
        int long_term;
        int short_term;
        int unassignedstaff;
        int split_unassigned;
        
        //Variables for new allocation claculations
        int mid_termNew;
        int short_termNew;
        int long_termNew;
        int unassign_new;
        
        //variables for new reallocations
        int final_long;
        int final_mid;
        int final_short;
        int final_unassigned;

        
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Staff Reallocation Update</title>");            
            out.println("</head>");
            out.println("<body>");
            
                try{
               Class.forName("com.mysql.jdbc.Driver"); 
               try{
                   
               Connection dbconnect=DriverManager.getConnection("jdbc:mysql://localhost:8000/gippm_db", "root", "password");
               Statement checkdb=dbconnect.createStatement();
               
                        //Getting highest and lowest sales
                 sale_high= checkdb.executeQuery("select max(sales) as shighest from products");
                 while(sale_high.next()){
                        MAX = sale_high.getString("shighest");
                        MAXs = parseInt(MAX);

                      
        }
                 sale_low= checkdb.executeQuery("select min(sales) as slowest from products");
                 while(sale_low.next()){
                        MIN = sale_low.getString("slowest");
                        out.println("");

                        
                        //Getting production lines with highest and lowest number of staff
                        //Minus one ia for the admin who is not directly involved in the operations, only supervision is done by the manager
        }
                 prod_low= checkdb.executeQuery("select min(prdtn_size) as plowest from production_lines");
                 while(prod_low.next()){
                        MINP = prod_low.getString("plowest");
                        MINPp = parseInt(MINP)-1;
                       
        }
                 prod_high= checkdb.executeQuery("select max(prdtn_size) as phighest from production_lines");
                 while(prod_high.next()){
                        MAXP = prod_high.getString("phighest");
                        MAXPp = parseInt(MAXP)-1;
                        
                        
                        
                        //Getting staff sizes from the database
        }
                 staff_long= checkdb.executeQuery("select count(staff_id) as lts from staff where allocation='"+3+"'");
                 while(staff_long.next()){
                        llong = staff_long.getString("lts");
        }
                 staff_short= checkdb.executeQuery("select count(staff_id) as sts from staff where allocation='"+1+"'");
                 while(staff_short.next()){
                        slong = staff_short.getString("sts");
        }
                 staff_mid= checkdb.executeQuery("select count(staff_id) as mts from staff where allocation='"+2+"'");
                 while(staff_mid.next()){
                        mlong = staff_mid.getString("mts");
        }
                 staff_unassign= checkdb.executeQuery("select count(staff_id) as uns from staff where allocation='"+0+"'");
                 while(staff_unassign.next()){
                        ustaff = staff_unassign.getString("uns");
        }
                 //Default allocations of staff sizes
                 mid_term = parseInt(mlong);
                 long_term = parseInt(llong)*mid_term;
                 short_term = time_long*parseInt("0.25");
                 unassignedstaff = parseInt(ustaff);
                 
                
        
                 /*     CUSTOM ALLOCATIONS AFTER THE MANAGER CLICKS REALLOCATE*/
                 
                 /*The number of unassigned staff is added to the production line that is generating more sales*/
                 
                 if(MAXs>=long_term && MAXs<mid_term || MAXs<short_term)
                 {
                     final_long=MAXPp-MINPp+unassignedstaff;
                     checkdb.executeUpdate("update production_lines set prdtn_size='"+final_long+"' where prdtn_line_id='"+3+"'");
                     checkdb.executeUpdate("update staff set allocation='"+3+"' where allocation='"+2+"' or allocation='"+1+"' or allocation='"+0+"'");

                 }
                 else if(MAXs>=mid_term && MAXs<long_term || MAXs<short_term)
                 {
                     final_mid=MAXPp-MINPp+unassignedstaff;
                     checkdb.executeUpdate("update production_lines set prdtn_size='"+final_mid+"' where prdtn_line_id='"+2+"'");
                     checkdb.executeUpdate("update staff set allocation='"+2+"' where allocation='"+3+"' or allocation='"+1+"' or allocation='"+0+"'");

                 }
                 else if(MAXs>=short_term && MAXs<mid_term || MAXs<long_term)
                 {
                     final_short=MAXPp-MINPp+unassignedstaff;
                     checkdb.executeUpdate("update production_lines set prdtn_size='"+final_short+"' where prdtn_line_id='"+1+"'");
                     checkdb.executeUpdate("update staff set allocation='"+1+"' where allocation='"+2+"' or allocation='"+3+"' or allocation='"+0+"'");

                 }
                 else
                 {
                     out.println("The product line staff is equally distributed in the production chain");
                 }
                 
                 
                 /*END OF CUSTOM REALLOCATIONS*/
                out.println("Reallocation is complete.......To return to dashboard, Click");
               out.println("<a href='index.jsp'>Here</a>");
               }catch(SQLException e){
                  out.println("error"+e.getMessage());
                  out.println("Could not execute reallocation!");
               }
              
               out.println("<a href='admin/pages/human_resource.jsp'>Return to try again</a>");
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
