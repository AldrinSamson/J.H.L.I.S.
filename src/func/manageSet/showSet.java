package func.manageSet;

import bean.getBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/showSet")
public class showSet extends HttpServlet {

    Connection con;
    Statement stmtCHK, stmtE;
    ResultSet chk;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String rMessage;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {

            String ID = request.getParameter("ID");
            String location = request.getParameter("location");

            try {
                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmtCHK = con.createStatement();
                stmtE = con.createStatement();



                getBean.setSet(ID);

                if (location.equals("admin")) {
                    out.println("<html><body><script type='text/javascript'>;location='inventory/itemSets.jsp#viewSet';</script></body></html>");
                }else if (location.equals("borrow")){
                    out.println("<html><body><script type='text/javascript'>;location='borrow/borrowSet.jsp#viewSet';</script></body></html>");
                }

                if (con != null) {
                    con.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }


        }
    }

}
