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


@WebServlet("/answerCHK")
public class answerCHK extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	Statement stmt;
	ResultSet chkUN , chkQ;
	String getUser;
	String MYdburl = getBean.getMyUrl();
	String MSdburl = getBean.getMsUrl();
	String MYclass = getBean.getMyClass();
	String MSclass = getBean.getMsClass(); 
	String ra1 ,ra2;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		 try (PrintWriter out = response.getWriter()) {
			 String getUN =  request.getParameter("user");
			 String a1 = request.getParameter("A1");
			 String a2 = request.getParameter("A2");
			 
			 
			 try {
				 Class.forName(MYclass);
				 con = DriverManager.getConnection(MYdburl);
				 stmt = con.createStatement();
				 
				 String getInfo = "select ra1 , ra2 from account where username = '"+getUN+"'"; 
				 chkUN = stmt.executeQuery(getInfo);
				 while (chkUN.next()) {
					 ra1 = chkUN.getString("ra1");
					 ra2 = chkUN.getString("ra2");
				 }
				 
				 
				 if (a1.equalsIgnoreCase(ra1)) {
					 
					 if (a2.equalsIgnoreCase(ra2)) {
						 
						 HttpSession okCHK = request.getSession();
						 okCHK.setAttribute("userCHK", getUN);
						 okCHK.setAttribute("good", true);
						 response.sendRedirect("recoverAccount.jsp");
						 
					 }else {
						 out.println ("<html><body><script type='text/javascript'>alert('Wrong answer on #2');location='forgot-qa.jsp';</script></body></html>");	 
					 }
					 
				 }else {
					 out.println ("<html><body><script type='text/javascript'>alert('Wrong answer on #1');location='forgot-qa.jsp';</script></body></html>");	 
				 }
				 if(con != null)  {
					 con.close();
				 }	 
			 }catch(Exception e) {
				 e.printStackTrace();
				 
				 
			 }
			 
			 
		 }
	}

}
