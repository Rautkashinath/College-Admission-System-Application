package admission.system;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * @author Kashinath.Raut
 *
 */
public class DBmanager
{
	static Connection con=null;							//connection object
    public static Connection getConnection()        	//database connectivity 
    {	
        if (con != null) 								//if already connected to database then return that object
        {
        	return con;
        }												//if not connected then try to connect 
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/college_admission","root","RAut@123");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
   
	//validate username and password
	public static boolean validate(String username,String password) throws SQLException
	{
		Connection conn=getConnection();
		CallableStatement statement = conn.prepareCall("{CALL credentials(?,?)}");//procedure call to verify login credential
		statement.setString(1, username);
		statement.setString(2,password);
		statement.execute();
		ResultSet rs =statement.getResultSet();
		if(rs.next())
		{
			return true;		
		}
		
		return false;
	}
	
	//Register student
	public static int insertdata(String fname,String lname,String midname,String mothername,String dob,String mobile,String email,String gender,String address,float ssc,float hsc,String dateofadmission,String ac_year,String course)
	{
		int sid=0;
		Connection conn=getConnection();
		CallableStatement statement;
		try 
		{	
			statement = conn.prepareCall("{CALL checkmail(?)}"); 	//check if already registered
			statement.setString(1,email);
			statement.execute();
			ResultSet rs =statement.getResultSet();
			if(rs.next())
			{
				return 0;
			}
			
			//if not registered? register him
			statement=null;//re-initialize variables
			rs=null;
			//call to insertdata procedure
			statement = conn.prepareCall("{CALL Insertdata(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
  	  		statement.setString(1, fname);
  	  		statement.setString(2,lname);
  	  		statement.setString(3,midname);
  	  		statement.setString(4,mothername);
  	  		statement.setString(5,dob);
  	  		statement.setString(6,mobile);
  	  		statement.setString(7,email);
  	  		statement.setString(8,gender);
  	  		statement.setString(9,address);
  	  		statement.setFloat(10,ssc);
  	  		statement.setFloat(11,hsc);
  	  		statement.setString(12,dateofadmission);
  	  		statement.setString(13,ac_year);
  	  		statement.setString(14,course);
  	  		statement.setInt(15,100000);
  	  		statement.execute();
  	  		rs=statement.getResultSet();
  	  		while (rs.next()) 
  	  		{
             sid=rs.getInt(1);
  	  		}
  	  		rs.close();
  	  	} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return sid;
	}		
}
