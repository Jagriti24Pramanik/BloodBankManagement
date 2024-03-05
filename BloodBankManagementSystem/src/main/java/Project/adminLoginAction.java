package Project;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class adminLoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 String username = request.getParameter("username");
		        String password = request.getParameter("password");
		        if("admin".equals(username) && "admin".equals(password))
		         {
		        	HttpSession session = request.getSession();
		        	session.setAttribute("username",username);
			        response.sendRedirect("home.jsp");
		         }
		         else
		         {
			           response.sendRedirect("adminLogin.jsp?msg=invalid");
		         }
	}

}
