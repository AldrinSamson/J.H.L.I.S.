package func.account;

import java.io.*;
import java.sql.*;
import bean.getBean;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/iForgot")
public class iForgot extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	Statement stmt;
	ResultSet chk;
	
	String MYdburl = getBean.getMyUrl();
	String MSdburl = getBean.getMsUrl();
	String MYclass = getBean.getMyClass();
	String MSclass = getBean.getMsClass();
   @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   response.setContentType("text/html;charset=UTF-8");
		
		 try (PrintWriter out = response.getWriter()) {
			 
			 String user = request.getParameter("user");
		 
			 try {
				 Class.forName(MYclass);
				 con = DriverManager.getConnection(MYdburl);
				 stmt = con.createStatement();
				 String chkUN = "select * from account where username = '"+user+"'";
				 chk = stmt.executeQuery(chkUN);
				 
				 if (chk.next()==true) {
					 
					 HttpSession iForgot = request.getSession();
					 iForgot.setAttribute("forgotUser", user);
					 response.sendRedirect("forgot-qa.jsp");
					 
				 }else {
					 
					  out.println ("<html><body><script type='text/javascript'>alert('Username does not exist');location='forgot-us.html';</script></body></html>");	 
					 
				 }
				 if(con != null)  {
					 con.close();
				 }	 
			 }catch (ClassNotFoundException | SQLException e ) {
				 e.printStackTrace();
				 
			 }
		 }
	}

}
