package func.account;

import java.io.*;
import java.sql.*;
import bean.getBean;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/loginv2")
public class loginv2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
	Statement stmt;
	
	String MYdburl = getBean.getMyUrl();
	String MSdburl = getBean.getMsUrl();
	String MYclass = getBean.getMyClass();
	String MSclass = getBean.getMsClass();
	String user, name , idNum ;
    boolean chk = false;   
	
  @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  response.setContentType("text/html;charset=UTF-8");
		
		 try (PrintWriter out = response.getWriter()) {
			 
			 String user = request.getParameter("user");
	         String pass = request.getParameter("pass");
	         
	         try {
	        	 Class.forName(MYclass);
	                conn = DriverManager.getConnection(MYdburl);
	                stmt = conn.createStatement();
	                
	                String query = "SELECT * FROM account where username=? and password=?";
	                PreparedStatement ps = conn.prepareStatement(query);
	                ps.setString(1, user);
	                ps.setString(2, pass);
	                ResultSet rs = ps.executeQuery();
	                chk = rs.next();
	                   
	                
	                if(chk == true){
	                
	                String get = "select * from account where username = '"+user+"'";
	                stmt.executeQuery(get);
	                
	                HttpSession log = request.getSession() ;
	                log.setAttribute("user", user);
	                	
	                response.sendRedirect("mainv2.jsp");
	                
	                }
	                
	                else {
	                    out.println ("<html><body><script type='text/javascript'>alert('Invalid username or password!');location='index.html';</script></body></html>");
	                }
	                if(conn != null)  {
						 conn.close();
					 }	
	        	 
	         } catch (Exception e){
	                e.printStackTrace();
	            }
			 
		 }
	}

}
