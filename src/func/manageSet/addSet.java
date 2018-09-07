package func.manageSet;

import java.io.IOException;
import java.sql.*;
import bean.getBean;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;


@WebServlet("/addSet")
public class addSet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection con;
	Statement stmt;
	ResultSet chkID;
	String MYdburl = getBean.getMyUrl();
	String MYclass = getBean.getMyClass();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()){
			
			String lab = request.getParameter("isLab");
			String i1 = request.getParameter("is1");
			String i2 = request.getParameter("is2");
			String i3 = request.getParameter("is3");
			String i4 = request.getParameter("is4");
			String i5 = request.getParameter("is5");
			String i6 = request.getParameter("is6");
			String i7 = request.getParameter("is7");
			String i8 = request.getParameter("is8");
			String i9 = request.getParameter("is9");
			String i10 = request.getParameter("is10");
			
			if (lab.isEmpty() && i1.isEmpty() && i2.isEmpty()) {
				 out.println ("<html><body><script type='text/javascript'>alert('Empty Parameter / JS error');location='itemSets.jsp';</script></body></html>");
			}
			
			
		}

}
}
