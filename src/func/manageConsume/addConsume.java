package func.manageConsume;

import java.io.*;
import java.sql.*;
import bean.getBean;	
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addConsume")
public class addConsume extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	Statement stmtE , stmtCHK;
	ResultSet chk;
	
	String MYdburl = getBean.getMyUrl();
	String MSdburl = getBean.getMsUrl();
	String MYclass = getBean.getMyClass();
	String MSclass = getBean.getMsClass();
  @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   response.setContentType("text/html;charset=UTF-8");
	   	try(PrintWriter out = response.getWriter()){
	   		String cName = request.getParameter("cName");
	   		String cForm = request.getParameter("cForm");
	   		String cAbbv = request.getParameter("cAbbv");
	   		String cFAbbv = request.getParameter("cFAbbv");
	   		String cDesc = request.getParameter("cDesc");
	   		String cLab = request.getParameter("cLab");
	   		String cMeasure = request.getParameter("cMeasure");
	   		String cUnit = request.getParameter("cUnit");
	   		String cExpireDate = request.getParameter("cExpireDate");
	   		
	   		String cKey = cAbbv+"-"+cFAbbv+"-1";
	   		
	   		if (cDesc.isEmpty() == true) {
	   			
	   			cDesc = "N/A";
	   			
	   		}
	   		
	   		try {
	   			Class.forName(MYclass);
	   			con = DriverManager.getConnection(MYdburl);
	   			stmtCHK = con.createStatement();
	   			stmtE = con.createStatement();
	   			
	   			String chkAbbv = "select * from consumablelist where cAbbv = '"+cAbbv+"' and cFAbbv = '"+cFAbbv+"'";
	   			chk = stmtCHK.executeQuery(chkAbbv);
	   			
	   			if (chk.next() == false) {
	   				
	   			 String addConsume = "insert into consumablelist values ('"+cKey+"', '"+cAbbv+"', '"+cFAbbv+"','1','"+cName+"','"+cForm+"',"
					 		+ "'"+cDesc+"','"+cLab+"','"+cMeasure+"','"+cUnit+"','"+cExpireDate+"','OK',NULL)";
					 String addConsumeN = "insert into consumablelist values ('"+cKey+"', '"+cAbbv+"', '"+cFAbbv+"','1','"+cName+"','"+cForm+"',"
						 		+ "'"+cDesc+"','"+cLab+"','"+cMeasure+"','"+cUnit+"',NULL,'OK',NULL)";
	   				
					 if (cExpireDate.isEmpty() == false) {
						 stmtE.execute(addConsume);
						 if (cLab.equalsIgnoreCase("Physics")) {
								out.println("<html><body><script type='text/javascript'>alert('item added ');location='physics.jsp';</script></body></html>");
							}else {
								out.println("<html><body><script type='text/javascript'>alert('item added');location='chemistry.jsp';</script></body></html>");
							}
					 }else {
						 stmtE.execute(addConsumeN);
						 if (cLab.equalsIgnoreCase("Physics")) {
								out.println("<html><body><script type='text/javascript'>alert('item added N');location='physics.jsp';</script></body></html>");
							}else {
								out.println("<html><body><script type='text/javascript'>alert('item added N');location='chemistry.jsp';</script></body></html>");
							}
					 }
					 
	   			}else {
	   				//code layout already in use
	   			 if (cLab.equalsIgnoreCase("Physics")) {
						out.println("<html><body><script type='text/javascript'>alert('code layout already in use');location='physics.jsp';</script></body></html>");
					}else {
						out.println("<html><body><script type='text/javascript'>alert('code layout already in use');location='chemistry.jsp';</script></body></html>");
					}
	   			}
	   		 if(con != null)  {
				 con.close();
			 }		
	   			
	   		}catch (SQLException | ClassNotFoundException e) {
	   			e.printStackTrace();
	   		}
	   		
	   		

	   	}
	}

}
