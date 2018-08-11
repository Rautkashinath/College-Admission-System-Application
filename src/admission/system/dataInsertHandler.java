package admission.system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class Insertdata
 */
@WebServlet("/datainserthandler")
public class dataInsertHandler extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dataInsertHandler() 
    {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		  //getting data from JSP page
		  String fname = request.getParameter("first_name");
		  String lname = request.getParameter("last_name");
		  String midname = request.getParameter("father_name");
		  String mothername = request.getParameter("mother_name");
		  String dob =request.getParameter("dob");
		  String gender=request.getParameter("gender");
		  String mobile = request.getParameter("mobile");
		  String email = request.getParameter("mail");
		  String address = request.getParameter("addr");
		  float ssc= Float.parseFloat(request.getParameter("ssc_perc"));
		  float hsc = Float.parseFloat(request.getParameter("hsc_perc"));
		  String dateofadmission= request.getParameter("doa");
		  String ac_year = request.getParameter("ac_year"); 
		  String course=request.getParameter("select_course");
		  
		  //register student
		  int sid=DBmanager.insertdata(fname, lname, midname, mothername, dob, mobile, email, gender, address, ssc, hsc, dateofadmission, ac_year, course);
		 
		  if(sid!=0)   //checking if student registered successfully or not
		  {
			  printReceipt.student_id=sid;
			  response.sendRedirect("success.html");      //redirected to success page 
		  }
		  else
		  {
			  request.setAttribute("error", "Student Already Registered");
			  request.getRequestDispatcher("Admin.jsp").forward(request, response);//forward response to admin.jsp
		  }
	} 
}
