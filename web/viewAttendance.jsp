<%-- 
    Document   : viewAttendance
    Created on : May 19, 2018, 1:47:23 AM
    Author     : pavi_pc
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
        <link rel="stylesheet" media="screen,projection" type="text/css" href="./main.css" />
        <title>View Attendance</title>
        
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
            select
            {
                height: 27px;
                width:157px;
            }
            
            
        </style>
    </head>
    <body>
        <img src="cc.jpg">
           <strong><% out.println("Welcome "+session.getAttribute("username"));%></strong>
        
        <div class="well">
            <ul>
                   <li><a href="welcomehr.jsp">Home</a></li> 
                    <li><a href="add1.jsp">Add Employee</a></li>
                    <li><a href="addAttendance.jsp">Add Attendance</a></li>
                    <li><a href="viewAttendance.jsp">view Attendance</a></li>
                    <!--view employee list-->
                    <li><a href="logout">Logout</a></li>
            </ul>
        </div>
           <div class="well1">
            <br><h2><center><b>Employee Attendance List</b></center></h2>
            <table border="1" style="width:100%; border-spacing:0.5em; text-align: center;">
            <tr>
                <td>Employee ID</td>
                <td>Worked Date</td>
                <td>Worked hours</td>
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
           
            PreparedStatement ps = con.prepareStatement("select * from attendance");
            ResultSet rs = ps.executeQuery();
            rs.next();
            
            
            while(rs.next()){
        %>
        

            <tr>      
                <td><%= rs.getString(1)%></td>
                <td><%= rs.getDate(2)%></td>
                <td><%= rs.getInt(3)%></td>
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
