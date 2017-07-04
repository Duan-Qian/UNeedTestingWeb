package log;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DataBase.MD5;
import DataBase.User;
import DataBase.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String username = request.getParameter("username");
		String password = MD5.transMD5(request.getParameter("password"));
		UserDao userDao = new UserDao();
		User user = userDao.login(username, password);
		if (user != null) {
			int userId = user.getId();
			request.getSession().setAttribute("user", username);	
			request.getSession().setAttribute("userId", userId);	
			response.sendRedirect("index.jsp");
		} else {
			String script = "<script>alert('Login failed! Please check your username or password!');location.href='login.jsp'</script>";
			response.getWriter().println(script);
		}
	}

}
