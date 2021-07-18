package g;
import java.sql.*;

import g.GetCon;
public class RegisterUser {
static int status=0;

public static int register(String username,String password,String repassword,double amount,String adderess,double phone){
	Connection con=GetCon.getCon();
	PreparedStatement ps;
	try {
		ps = con.prepareStatement("Insert into NEWACCOUNT(username,password,repassword,amount,address,phone) values(?,?,?,?,?,?)");
		//int	nextvalue1=GetCon.getPrimaryKey();
		//ps.setInt(1,nextvalue1);
		ps.setString(1,username);
		ps.setString(2,password);
		ps.setString(3,repassword);
		ps.setDouble(4,amount);
		ps.setString(5,adderess);
		ps.setDouble(6,phone);
		
		status=ps.executeUpdate();
		//status++;
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return status;
	
}
	
}