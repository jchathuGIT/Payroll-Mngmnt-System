



























































































































0.................................................................00.0...0...............0............................++++++++++++++++++++++++















































000000
+<%-- 
    Document   : viewLeaves
    Created on : May 17, 2018, 1:55:12 AM
    Author     : navo_pc
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Leaves</title>
                <link rel="stylesheet" media="screen,projection" type="text/css" href="./main.css" />
        <style>
          
            img
            {
                width:150px;
                height:130px;
                margin-left: 70px;
                margin-top: -5px;
            }
            strong
            {
            position: absolute;
            right: 15px;
            top :115px
                
            }
           
            td{padding-left: 10px}
        </style>
    </head>
    <body>
        
              <img src="cc.jpg">
           <strong><% out.println("Welcome "+session.getAttribute("username"));%></strong>
        
           <div class="well">  
              <ul>
                <li><a href="generatepayslip.jsp">View Pay-Slip</a></li>
                <li><a href="actualupdate.jsp">Update Employee</a></li>
                <li><a href="applyleave.jsp">Apply Leave</a></li>
                <li><a href="viewLeaves.jsp">View Leaves</a></li>
                <li><a href="logout">Logout</a></li>
              </ul>
           </div>
           
             <div class="well1">
            <br><h2><center><b>Leave List</b></center></h2>
            <table border="1" style="width:100%; border-spacing:0.5em; text-align: center;">
            <tr>
                
                <td>Earned leaves</td>
                <td>Sick leaves </td>
                <td>Casual leaves</td>
                <td>Month</td>
                <td>Year</td>
                <td>Employee ID</td>
                <!--td>Employee ID</td>
                <td>Worked Date</td>
                <td>Worked hours</td-->
            </tr>
           
        <%
  
     //  HttpSession session=request.getSession();
 if(session.getAttribute("username")!=null)           
 {
        String id = (String)session.getAttribute("id");
        String usertype = (String)session.getAttribute("usertype");
    try {       
      Class.forName("com.mysql.jdbc.Driver").newInstance();
            
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","");
           
            PreparedStatement ps = con.prepareStatement("select * from `leave`");
            ResultSet rs = ps.executeQuery();
            rs.next();           
            
            while(rs.next()){
        %>
            <tr>      
                <td><%= rs.getInt(1)%></td>
                <td><%= rs.getInt(2)%></td>
                <td><%= rs.getInt(3)%></td>
                <td><%= rs.getString(4)%></td>
                <td><%= rs.getInt(5)%></td>
                <td><%= rs.getString(6)%></td>
                
                <!--td><%= rs.getString(1)%></td>
                <td><%= rs.getDate(2)%></td>
                <td><%= rs.getInt(3)%></td-->
            </tr>          
        <%
            }
            rs.close();
            ps.close();
            con.close();
      }catch(Exception e)
      
        {System.out.println(e);}

      }
        else
        {
            response.sendRedirect("index.jsp?id=Your session may be expired. You have to login first");   
        }
 
        %>
        </table>
    </div>
    </body>
</html>
