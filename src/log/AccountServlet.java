package log;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DataBase.MD5;
import DataBase.UserDao;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String newUsername = request.getParameter("newUsername");
		String newEmail = request.getParameter("newEmail");
		String newPassword = request.getParameter("newPassword");
		int curUserId = (int)session.getAttribute("userId");
		UserDao userDao = new UserDao();
		String oldPassword = userDao.valueId(curUserId).getPassword();
		// change user name
		if (newUsername != null) {
			if (userDao.sameUsername(newUsername)) {
				userDao.changeUsername(newUsername, curUserId);
				session.invalidate();
				String script = "<script>alert('Change name Successful!');location.href='login.jsp'</script>";
				response.getWriter().println(script);
			} else {
				String script = "<script>alert('Register failed! The USERNAME is already existed.');location.href='account.jsp'</script>";
				response.getWriter().println(script);
			}
		}
		
		// change user email
		if (newEmail != null) {
			if (userDao.sameEmail(newEmail)) {
				userDao.changeEmail(newEmail, curUserId);
				session.invalidate();
				String script = "<script>alert('Reset Email Successful!');location.href='login.jsp'</script>";
				response.getWriter().println(script);
			} else {
				String script = "<script>alert('Reset Email failed! The EMAIL is already been used.');location.href='account.jsp'</script>";
				response.getWriter().println(script);
			}
		}
		
		// change user password
		if (newPassword != null) {
			newPassword = MD5.transMD5(newPassword);
			if ( !newPassword.equals(oldPassword)) {
				userDao.changePassword(newPassword, curUserId);
				session.invalidate();
				String script = "<script>alert('Reset Password Successful!');location.href='login.jsp'</script>";
				response.getWriter().println(script);
			} else {
				String script = "<script>alert('Reset password failed! The new password is the same as previous one.');location.href='account.jsp'</script>";
				response.getWriter().println(script);
			}
		}
	}

}
