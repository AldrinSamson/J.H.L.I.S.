package func.manageEquip;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import bean.getBean;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateQuantity")
public class updateQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection con;
	String MYdburl = getBean.getMyUrl();
	String MYclass = getBean.getMyClass();
	Statement stmt;
	String lab;
	int totalq , currentq , newtotalq , newcurrentq;
	
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	response.setContentType("text/html;charset=UTF-8");
		 
		 try(PrintWriter out =response.getWriter()) {
			 
			 
			 String eKey = request.getParameter("eKey");			 
			 int addQ =Integer.parseInt(request.getParameter("addQ"));
			
			 
			 try {
				 Class.forName(MYclass);
				 con = DriverManager.getConnection(MYdburl);
				 stmt = con.createStatement();
			
				 String detect ="select * from equipmentlist where eKey = '"+eKey+"'";    
				 
					ResultSet chk =stmt.executeQuery(detect);
					
					if (chk.next()==true) {
						totalq = chk.getInt("totalQ");
						currentq = chk.getInt("currentQ");
						lab = chk.getString("eLab");
						
						newtotalq = totalq + addQ;
						newcurrentq = currentq + addQ; 
						
						String update = "update equipmentlist set totalQ = '"+newtotalq+"' , currentQ = '"+newcurrentq+"'"
								+ "where eKey = '"+eKey+"'";
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
