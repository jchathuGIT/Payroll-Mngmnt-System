<%-- 
    Document   : generatereportbyacc1
    Created on : May 15, 2018, 1:28:55 PM
    Author     : weli_pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" media="screen,projection" type="text/css" href="./main.css" />
        <style>
            select
            {
                height: 50px;
                width:150px;
            }
            
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
        </style>
        <title>generate report by acc</title>
    </head>
    <body>
        <% if(session.getAttribute("username")!=null){ %>
        <img src="cc.jpg">
           <strong><% out.println("Welcome "+session.getAttribute("username"));%></strong>
        
           <div class="well">  <ul>
  <li><a href="generatepayslipbyacc1.jsp">Generate Pay-Slip</a></li>
  <li><a href="generatereportbyacc1.jsp">Generate Report</a></li>
  <li><a href="add2.jsp">Add Employee</a></li>
  <li><a href="updatebyacc1.jsp">Update Employee</a></li>
  <li><a href="paysalary.jsp">Pay Salary</a></li>
 
  <li><a href="displayemployee1">View Employee List</a></li>
  <li><a href="logout">Logout</a></li>
  </ul>
        </div>
           <div class="well1">
               <% if(request.getParameter("id")!=null)out.println("<ul style=\"list-style-type:disc;color:red; position: static;margin-left:5px;margin-top:20px;\"><li>"+request.getParameter("id")+"</li></ul>"); %>
    <form method="post" action="generatereportbyaccz">
            <table style="margin-left:40px;">
                           
                           <tr><td>Month : </td><td><select name="month">
    <option selected value="0">Select Month</option>
    <option value="JAN">January</option>
    <option value="FEB">February</option>
    <option value="MAR">March</option>
    <option value="APRIL">April</option>
    <option value="MAY">May</option>
    <option value="JUNE">June</option>
    <option value="JULY">July</option>
    <option value="AUG">August</option>
    <option value="SEPT">September</option>
    <option value="OCT">October</option>
    <option value="NOV">November</option>
    <option value="DEC">December</option>
</select>
                    </td></tr>
                <tr><td>Year : </td><td><select name="year" size="1">
    <option selected value="0">Select Year</option>
    <option value="2017">2017</option>
    <option value="2018">2018</option>
    <option value="2019">2019</option>
</select>
                    </td></tr>
                <tr><td/><td><button class="btn" type="submit">Generate Report</button></td></tr>    
            </table>
        </form>
           </div>
      <% }
        else
        {
            response.sendRedirect("index.jsp?id=Your session may be expired. You have to login first");
        }
      %>
    
    </body>
</html>
