package func.account;

import java.io.*;
import java.sql.*;
import bean.getBean;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/changePass")
public class changePass extends HttpServlet {
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
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 try (PrintWriter out = response.getWriter()) {
			 String getUN =  request.getParameter("user");
			 String pass = request.getParameter("newPass");
			 String passCHK = request.getParameter("passChk");
			 
			if (pass.isEmpty()==true) {
				out.println ("<html><body><script type='text/javascript'>alert('password null ');location='index.html';</script></body></html>");
			}else {
		
			 try {
				 Class.forName(MYclass);
				 con = DriverManager.getConnection(MYdburl);
				 stmt = con.createStatement();
				 
				 if (pass.equals(passCHK)) {
					 
					 String changePass = "update account set password = '"+pass+"' where username = '"+getUN+"'";
					 stmt.execute(changePass);
					 out.println ("<html><body><script type='text/javascript'>alert('Password Recovered for "+getUN+" ');location='index.html';</script></body></html>");
				 }else {
					 out.println ("<html><body><script type='text/javascript'>alert('Password dont match ');location='index.jsp';</script></body></html>");
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
}