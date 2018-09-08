package func.manageConsume;

import java.io.*;
import java.sql.*;
import bean.getBean;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/checkCType")
public class checkCType extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	Statement stmt , stmtE;
	ResultSet chk , get;
	String getAbbv ,getForm , codeC ;
	int getNum , newNum; 
	
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
  		  String cDesc = request.getParameter("cDesc");
  		  String cLab = request.getParameter("cLab");
  		  String cMeasure = request.getParameter("cMeasure");
  		  String cUnit = request.getParameter("cUnit");
  		  String cExpireDate = request.getParameter("cExpireDate");
  		  
  		  if (cDesc.isEmpty() == true) {
  			  
  			  cDesc = "N/A";
  			  
  		  } 
  		  
  		  getBean.setcName(cName);
  		  getBean.setcForm(cForm);
  		  getBean.setcDesc(cDesc);
  		  getBean.setcLab(cLab);
  		  getBean.setcMeasure(cMeasure);
  		  getBean.setcUnit(cUnit);
  		  getBean.setcExpireDate(cExpireDate);
  		  
  		 try {
			 Class.forName(MYclass);
			 con = DriverManager.getConnection(MYdburl);
			 stmt = con.createStatement();
			 stmtE = con.createStatement();
			 
			 String chkName = "select * from consumablelist where cName = '"+cName+"' and cForm = '"+cForm+"'";
			 chk = stmt.executeQuery(chkName);
			 
			 if (chk.next() == true ) {
				 
				 String getData = "select cAbbv , cFAbbv , cNum from consumablelist where cName = '"+cName+"' and cForm = '"+cForm+"'order by cNum desc limit 1";
				 get = stmt.executeQuery(getData);
				 
				 while (get.next()) {
					 getAbbv = get.getString("cAbbv");
					 getForm = get.getString("cFAbbv");
					 getNum = get.getInt("cNum");
					 newNum = getNum + 1;
				 }
				 
				 codeC = getAbbv+"-"+getForm+"-"+newNum;
				 String addConsume = "insert into consumablelist values ('"+codeC+"', '"+getAbbv+"', '"+getForm+"','"+newNum+"','"+cName+"', '"+cForm+"',"
				 		+ "'"+cDesc+"','"+cLab+"','"+cMeasure+"','"+cUnit+"','"+cExpireDate+"','OK',NULL)";
				 String addConsumeN = "insert into consumablelist values ('"+codeC+"', '"+getAbbv+"', '"+getForm+"','"+newNum+"','"+cName+"','"+cForm+"',"
					 		+ "'"+cDesc+"','"+cLab+"','"+cMeasure+"','"+cUnit+"',NULL,'OK',NULL)";
				 
				 if (cExpireDate.isEmpty()==true) {
					 
					 stmt.execute(addConsumeN);
					 if (cLab.equalsIgnoreCase("Physics")) {
							out.println("<html><body><script type='text/javascript'>alert('item added N');location='physics.jsp';</script></body></html>");
						}else {
							out.println("<html><body><script type='text/javascript'>alert('item added');location='chemistry.jsp';</script></body></html>");
						}					 
				 } else {
					 stmt.execute(addConsume);
					 if (cLab.equalsIgnoreCase("Physics")) {
							out.println("<html><body><script type='text/javascript'>alert('item added N');location='physics.jsp';</script></body></html>");
						}else {
							out.println("<html><body><script type='text/javascript'>alert('item added');location='chemistry.jsp';</script></body></html>");
						}
				 } 
				 
			 }else {
				 //make abbv
				//get middle second abbv1
				 char first , middle , last;
				                                      
				 if (cName.length() %2 == 0){
				     first = cName.charAt(0);
				     middle = cName.charAt(cName.length() / 2 - 1/2 );
				     last = cName.charAt(cName.length() - 1 );                                    	
				 }else {
				 	first = cName.charAt(0);
				     middle = cName.charAt(cName.length() / 2 - 1 );
				     last = cName.charAt(cName.length() - 1 ); 
				                                     	 
				 }
				 String firstS = Character.toString(first);
				 String lastS = Character.toString(last);
				 String middleS = Character.toString(middle);
				 String abbvS = firstS + middleS + lastS;
				 String abbv1 = abbvS.toUpperCase();
				 
				// get 3rd abbv2
				 char first2 , middle2 , last2; 
                 	 first2 = cName.charAt(0);
				     middle2 = cName.charAt(2 );
				     last2 = cName.charAt(cName.length() - 1 );                                    	
				
				 String firstS2 = Character.toString(first2);
				 String lastS2 = Character.toString(last2);
				 String middleS2 = Character.toString(middle2);
				 String abbvS2 = firstS2 + middleS2 + lastS2;
				 String abbv2 = abbvS2.toUpperCase();
				 
				// get 2rd abbv3
				 char first3 , middle3 , last3; 
                 	 first3 = cName.charAt(0);
				     middle3 = cName.charAt(1);
				     last3 = cName.charAt(cName.length() - 1 );                                    	
				
				 String firstS3 = Character.toString(first3);
				 String lastS3 = Character.toString(last3);
				 String middleS3 = Character.toString(middle3);
				 String abbvS3 = firstS3 + middleS3 + lastS3;
				 String abbv3 = abbvS3.toUpperCase();
				 
				 getBean.setAbbvC1(abbv1);
				 getBean.setAbbvC2(abbv2);
				 getBean.setAbbvC3(abbv3);
				 
				
				 //make form abbv 
				//get middle second abbv1
				 char firstF , middleF , lastF;
				                                      
				 if (cForm.length() %2 == 0){
				     firstF = cForm.charAt(0);
				     middleF = cForm.charAt(cForm.length() / 2 - 1/2 );
				     lastF = cForm.charAt(cForm.length() - 1 );                                    	
				 }else {
				 	firstF = cForm.charAt(0);
				     middleF = cForm.charAt(cForm.length() / 2 - 1 );
				     lastF = cForm.charAt(cForm.length() - 1 ); 
				                                     	 
				 }
				 String firstSF = Character.toString(firstF);
				 String lastSF = Character.toString(lastF);
				 String middleSF = Character.toString(middleF);
				 String abbvSF = firstSF + middleSF + lastSF;
				 String form1 = abbvSF.toUpperCase();
				 
				// get 3rd abbv2
				 char firstF2 , middleF2 , lastF2; 
                 	 firstF2 = cForm.charAt(0);
				     middleF2 = cForm.charAt(2 );
				     lastF2 = cForm.charAt(cForm.length() - 1 );                                    	
				
				 String firstSF2 = Character.toString(firstF2);
				 String lastSF2 = Character.toString(lastF2);
				 String middleSF2 = Character.toString(middleF2);
				 String abbvSF2 = firstSF2 + middleSF2 + lastSF2;
				 String form2 = abbvSF2.toUpperCase();
				 
				// get 2rd abbv3
				 char firstF3 , middleF3 , lastF3; 
                 	 firstF3 = cForm.charAt(0);
				     middleF3 = cForm.charAt(1);
				     lastF3 = cForm.charAt(cForm.length() - 1 );                                    	
				
				 String firstSF3 = Character.toString(firstF3);
				 String lastSF3 = Character.toString(lastF3);
				 String middleSF3 = Character.toString(middleF3);
				 String abbvSF3 = firstSF3 + middleSF3 + lastSF3;
				 String form3 = abbvSF3.toUpperCase();
				 
				 getBean.setAbbvCF1(form1);
				 getBean.setAbbvCF2(form2);
				 getBean.setAbbvCF3(form3);
				 
				 out.println("<html><body><script type='text/javascript'>location='physics.jsp#mCCode';</script></body></html>"); 
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
