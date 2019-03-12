<%-- 
    Document   : addAttendance
    Created on : May 19, 2018, 3:17:32 AM
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
        <title>Attendance Page</title>
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
        
           <div class="well">  <ul>
                   <li><a href="welcomehr.jsp">Home</a></li> 
                    <li><a href="add1.jsp">Add Employee</a></li>
                    <li><a href="addAttendance.jsp">Add Attendance</a></li>
                    <li><a href="viewAttendance.jsp">view Attendance</a></li>
                    <!--view employee list-->
                    <li><a href="logout">Logout</a></li>
  </ul>
        </div>

        <div class="well1">
        <%
  
     //  HttpSession session=request.getSession();
 if(session.getAttribute("username")!=null)           
 {
      
        %>
        <form method="post" action="addAttendance">
        <table style="margin-left:40px;">
            <tr><td>Employee ID : </td><td><input type="text" name="EmployeeID"></td>
            <tr><td>Date<br>(YYYY-MM-DD)</td><td><input type="date" name="date" /></td></tr>
            <tr><td>Worked Hours :</td><td><input type="text" name="totalhours"></td>
            </tr>
            <tr><td/><td><button class="btn" type="submit">Apply</button></td>
         </tr>
        </table>
        </form></div></body></html>
        <%
    
 }
        else
 {
     response.sendRedirect("index.jsp?id=Your session may be expired. You have to login first");

    
 }
 
        %>
    </body>
</html>
