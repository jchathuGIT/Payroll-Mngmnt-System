
import java.io.*;
import java.sql.*;
import java.sql.SQLException;

public class LoginVerifier {
    
    public static boolean validate(String uname, String pass) throws IOException, SQLException {
        
        boolean status = false;
        try {
   Class.forName("com.mysql.jdbc.Driver").newInstance();
            
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","");
    
          PreparedStatement ps = con.prepareStatement("SELECT * from employee WHERE employeeid=?");
          ps.setString(1, uname);
            
            ResultSet rs = ps.executeQuery();
            
         if(rs.next())
         { 
             String pass1=uname+"_"+rs.getString("dob");
             if(pass.equals(pass1))
            status = true;
          
         }
        }
        catch(Exception e) {
            System.out.println(e);
        }   
        return status;
    }
}
