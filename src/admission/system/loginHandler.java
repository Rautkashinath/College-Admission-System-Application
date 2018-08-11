package admission.system;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
/**
 * Servlet implementation class loginHandler
 */
@WebServlet("/loginhandler")
public class loginHandler extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginHandler() 
    {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//get username and password from jsp form
		String username=request.getParameter("username");
		String password=request.getParameter("password");
	      try
	      {
	    	  if(DBmanager.validate(username, password))
	    	  {
	    		  //get session if not exist create new one
	    		  HttpSession session = request.getSession();
	  			  session.setAttribute("user",username);
	    		  response.sendRedirect("Admin.jsp");   
	    	  }
	    	  else
	    	  {
	    		  request.setAttribute("error","Invalid Username or Password");
	    		  request.getRequestDispatcher("/login.jsp").forward(request,response);
	    	  }
	      }
	      catch (SQLException e)
	      {
	    	  e.printStackTrace();
	      }
	}
}
