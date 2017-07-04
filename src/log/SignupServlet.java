package log;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DataBase.MD5;
import DataBase.User;
import DataBase.UserDao;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
@MultipartConfig(maxFileSize = 16177215)
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "/Users/dunn/Desktop/user_icon";
//	private static final String SAVE_DIR = "images/upload_icon";
	private static String icon_default;
//	private String extractFileName(Part part) {
//	    String contentDisp = part.getHeader("content-disposition");
//	    String[] items = contentDisp.split(";");
//	    for (String s : items) {
//	      if (s.trim().startsWith("filename") && s.length()>0) {
//	        return s.substring(s.indexOf("=") + 2, s.length()-1);
//	      }
//	    }
//	    return null;
//	  }
	
	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition"); String[] items = contentDisp.split(";");
		for (String s : items) {
		       if (s.trim().startsWith("filename")) {
		         return s.substring(s.indexOf("=") + 2, s.length()-1);
		   } }
		return icon_default; 
		}

	private String getFileExtension (String fileName) {

		if (fileName.length() == 3) {
			return fileName;
		} else if (fileName.length() > 3) {
			return fileName.substring(fileName.length() - 3);
		} else {
			return "default";
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = MD5.transMD5(request.getParameter("password"));
		String email = request.getParameter("email");
		icon_default = request.getParameter("icon_default");
		String savePath = SAVE_DIR;
		String fileName;
		String icon = "";
		String fileExtension = "";
		
//		String realPath = request.getServletContext().getRealPath("");
		
		File fileSaveDir = new File(savePath + File.separator + username);		
		if (!fileSaveDir.exists())
			  fileSaveDir.mkdir();
		
		for (Part part : request.getParts()) {
			fileName = extractFileName(part);
			
			System.out.println("fileName: " + fileName + " end");

			if (fileName != "" && fileName != null) {
				fileExtension = getFileExtension(fileName);
				if (fileExtension.equals("png")) {
			    	icon = fileSaveDir + File.separator + fileName;
			    	part.write(fileSaveDir + File.separator + fileName);
			    	break;
				} else {
//					fileName = icon_default;
					icon = "images" + File.separator + "profile_icons" + File.separator + icon_default;
//			    	part.write(fileSaveDir + File.separator + fileName);
			    	break;}
			} else {
//				fileName = icon_default;
//				icon = fileSaveDir + File.separator + fileName;
				icon = "images" + File.separator + "profile_icons" + File.separator + icon_default;
//		    	part.write(fileSaveDir + File.separator + fileName);
		    	break;
			}
		}
		
		System.out.println(icon + " is icon");
		UserDao userDao = new UserDao();
		if (username != null && !username.isEmpty() && !email.isEmpty()) {
			if (userDao.sameUsername(username)) {
				if (userDao.sameEmail(email)) {
					User user = new User();
					user.setUsername(username);
					user.setPassword(password);
					user.setEmail(email);
					user.setIcon(icon);
					
					userDao.saveUser(user);
					
					request.getSession().setAttribute("user", username);	
					String script = "<script>alert('Registration Successful!');location.href='index.jsp'</script>";
					response.getWriter().println(script);
				} else {
					String script = "<script>alert('Register failed! The EMAIL is already existed.');location.href='signUp.jsp'</script>";
					response.getWriter().println(script);
				}	
			} else {
				String script = "<script>alert('Register failed! The USERNAME is already existed.');location.href='signUp.jsp'</script>";
				response.getWriter().println(script);
			}
		}
		
	}

}
