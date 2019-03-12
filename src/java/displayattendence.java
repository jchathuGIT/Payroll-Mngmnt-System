
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author pavi_pc
 */
public class displayattendence extends HttpServlet{
    
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
    PrintWriter out = response.getWriter() ;
        try {
           // PrintWriter out = response.getWriter() ;
                        HttpSession session=request.getSession();
 if(session.getAttribute("username")!=null)           
 {    
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","");
     
        PreparedStatement ps = con.prepareStatement("select * from attendance");

        ResultSet rs = ps.executeQuery();
            
                /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Employee Attendence List</title>");            
            out.println("   <link rel=\"stylesheet\" media=\"screen,projection\" type=\"text/css\" href=\"./main.css\" /> <style>\n" +
"            img\n" +
"            {\n" +
"                width:150px;\n" +
"                height:50px;\n" +
"                margin-left: 70px;\n" +
"                margin-top: -5px;\n" +
"            }\n" +
"            strong\n" +
"            {\n" +
"            position: absolute;\n" +
"            right: 15px;\n" +
"            top :35px\n" +
"                \n" +
"            }\n" +
"        </style></head><body>");
        
        
        out.println("<img src=\"cc.jpg\"> <strong>Welcome "+session.getAttribute("username")+"</strong>");
     
        out.println("<div class=\"well\">  <ul>\n" +
"  <li><a href=\"welcomehr.jsp\">Home</a></li>\n" +
"  <li><a href=\"addAttendance.jsp\">Add Attendance</a></li>\n" +
"  <li><a href=\"viewAttendance.jsp\">view Attendance</a></li>\n" +
"  <li><a href=\"logout\">Logout</a></li>\n" +
"  </ul>\n" +
"        </div>" +
"        <div class=\"well1\">");
            // border=\"1\" style=\"width:100%>
            out.println("<br><h2><center><b>Employee Attendence List</b></center></h2><br><table border=\"1\" style=\"width:100%;border-spacing: 0.5em;text-align: center;\">");
            out.println("<tr>"
                    + "<td><b>Employee Id</b></td>"
                    + "<td><b>Date</b></td>"
                    + "<td><b>Worked Hours</b></td>"
                    + "</tr>");
            while(rs.next())
            {
             out.println("<tr>"
                     + "<td>"+rs.getString(1)+"</td>"
                     + "<td>"+rs.getDate(2)+"</td>"
                     + "<td>"+rs.getString(3)+"</td>"
                     + "</tr>");
           
            //out.println("<td>"+rs.getInt(15)+"</td>");
            //out.println("<td>"+rs.getDate(10)+"</td></tr>");
            
            }
            out.println("</table>");
            //out.println("<br><br><center><button onclick=\"history.go(-1)\">Back</button></center></div>");
            out.println("</body>");
            out.println("</html>");
 }        else
 {
      response.sendRedirect("index.jsp?id=Your session may be expired. You have to login first");

 }
        }catch(Exception e){
        out.println(e);
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

