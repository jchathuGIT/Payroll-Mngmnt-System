
//package validator;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.HttpSession;


public class validate1 extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
             HttpSession session=request.getSession();
String id=(String) session.getAttribute("id");          
      try{ Class.forName("com.mysql.jdbc.Driver").newInstance();
            
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","");

          PreparedStatement ps = con.prepareStatement("SELECT * from accountant WHERE id=?");
          ps.setString(1, id);

            ResultSet rs = ps.executeQuery();
             String pass = request.getParameter("pass");
  

         if(rs.next())
         { 
             String pass1=id+"_"+rs.getString("dob");
             if(pass.equals(pass1))
             {
        //String uname = request.getParameter("uname");
       //  String usertype = request.getParameter("usertype");//its actually db name
             
          //  HttpSession session=request.getSession();
           // String username1="administrator";
          //  session.setAttribute("username",username1);
          //  session.setAttribute("id",uname);
    //        session.setAttribute("usertype",usertype);
     //       System.out.println("4");  
                  rs.close();
         ps.close();
         con.close();
     //   System.out.println("");
        RequestDispatcher rd = request.getRequestDispatcher("paysalary");
                rd.forward(request, response);
            
         }
         } else {
              
 rs.close();
         ps.close();
         con.close();
                response.sendRedirect("paysalary.jsp?id=Please enter correct password");
        
        }
         
      }
      catch(Exception e)
      {  
      System.out.println(e);
      }
       
         
       
    }
}

   
