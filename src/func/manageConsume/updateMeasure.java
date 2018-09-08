package func.manageConsume;

import java.io.*;
import java.sql.*;
import bean.getBean;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateMeasure")
public class updateMeasure extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	String MYdburl = getBean.getMyUrl();
	String MSdburl = getBean.getMsUrl();
	String MYclass = getBean.getMyClass();
	String MSclass = getBean.getMsClass();
	Statement stmt;
	String lab;
	int measure , newMeasure;
   @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   response.setContentType("text/html;charset=UTF-8");
		 
		 try(PrintWriter out =response.getWriter()) {
			 
			 
			 String cKey = request.getParameter("cKey");			 
			 int addMeasure =Integer.parseInt(request.getParameter("addMeasure"));
			
			 
			 try {
				 Class.forName(MYclass);
				 con = DriverManager.getConnection(MYdburl);
				 stmt = con.createStatement();
			
				 String detect ="select * from consumablelist where cKey = '"+cKey+"'";    
				 
					ResultSet chk =stmt.executeQuery(detect);
					
					if (chk.next()==true) {
						
						measure = chk.getInt("cMeasure");
						lab = chk.getString("cLab");
						
						newMeasure = measure + addMeasure; 
						
						String update = "update consumablelist set cMeasure = '"+newMeasure+"'"
								+ "where cKey = '"+cKey+"'";
						stmt.execute(update);
						if(lab.equalsIgnoreCase("Physics")) {
							out.println("<html><body><script type='text/javascript'>alert('quantity added');location='physics.jsp';</script></body></html>");
						}else {
							out.println("<html><body><script type='text/javascript'>alert('quantity added');location='chemistry.jsp';</script></body></html>");
						}
						 
					}else {
						if(lab.equalsIgnoreCase("Physics")) {
							out.println("<html><body><script type='text/javascript'>alert('Item invalid');location='physics.jsp';</script></body></html>");
						}else {
							out.println("<html><body><script type='text/javascript'>alert('Item invalid');location='chemistry.jsp';</script></body></html>");
						}
					}
					 if(con != null)  {
						 con.close();
					 }	
					
				 
			 }catch (Exception e) {
				 e.printStackTrace();
			 }
			 
			 
		 }
   }

}