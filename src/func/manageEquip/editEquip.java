package func.manageEquip;

import java.io.*;
import java.sql.*;
import bean.getBean;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/editEquip")
public class editEquip extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection con;
	Statement stmt;
	
	String MYdburl = getBean.getMyUrl();
	String MSdburl = getBean.getMsUrl();
	String MYclass = getBean.getMyClass();
	String MSclass = getBean.getMsClass();
	
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	try(PrintWriter out = response.getWriter()){
    		
    		String code = request.getParameter("code");
    		String desc = request.getParameter("desc");
    		String lab = request.getParameter("lab");
    		String calibDate = request.getParameter("calibDate");
    		String cQ = request.getParameter("cQ");
    		String tQ = request.getParameter("tQ");
    		String condi = request.getParameter("condi");
    		String del = request.getParameter("del");
    		
    		 if(desc.isEmpty()==true) {
				 desc = "N/A";
			 }
    		 
    		try {
       		 
       		 Class.forName(MYclass);
       		 con = DriverManager.getConnection(MYdburl);
       		 stmt = con.createStatement();
       		 
       		 	if(del == null) {
       		 		
       		 		 if(calibDate.isEmpty()==true) {
       		 			 
       		 			 String editEquipN = "update equipmentlist set eDesc ='"+desc+"',eLab ='"+lab+"', calibDate = NULL , currentQ ='"+cQ+"',totalQ = '"+tQ+"' "
       		 			 		+ ",eCondition = '"+condi+"' where eKey = '"+code+"'";
       		 			 stmt.execute(editEquipN);
       		 			 
       		 			 if (lab.equalsIgnoreCase("Physics")) {
       		 				 out.println("<html><body><script type='text/javascript'>alert('equipment edited N');location='physics.jsp';</script></body></html>");
       		 			 }else {
       		 				 out.println("<html><body><script type='text/javascript'>alert('equipment edited N');location='chemistry.jsp';</script></body></html>");
       		 			 }	
       		 		 }else {
       		 			
       		 			 String editEquip = "update equipmentlist set eDesc ='"+desc+"',eLab ='"+lab+"', calibDate = '"+calibDate+"' , currentQ ='"+cQ+"',totalQ = '"+tQ+"' "
       		 			 		+ ",eCondition = '"+condi+"' where eKey = '"+code+"'";
       		 			 stmt.execute(editEquip);
       		 			 if(lab.equalsIgnoreCase("Physics")) {
       		 				 out.println("<html><body><script type='text/javascript'>alert('equipment edited ');location='physics.jsp';</script></body></html>");
       		 			 }else {
       		 				out.println("<html><body><script type='text/javascript'>alert('equipment edited ');location='chemistry.jsp';</script></body></html>");
       		 			 }
       		 		 }
    			}else {
    			
    				String delEquip = "delete from equipmentList where eKey ='"+code+"'";
    				stmt.execute(delEquip);
    				if(lab.equalsIgnoreCase("Physics")) {
    					out.println("<html><body><script type='text/javascript'>alert('equipment deleted');location='physics.jsp';</script></body></html>");
    				}else {
    					out.println("<html><body><script type='text/javascript'>alert('equipment deleted');location='chemistry.jsp';</script></body></html>");
    				}	
    			}
       		 	if (con != null) {
       		 	con.close();
       		 	}
       		 	
    		}catch (ClassNotFoundException | SQLException|NullPointerException e) {
       		 e.printStackTrace();
    	}
    		
	}

}
    }
