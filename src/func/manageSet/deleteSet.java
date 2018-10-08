package func.manageSet;

import bean.getBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

@WebServlet("/deleteSet")
public class deleteSet extends HttpServlet {
    Connection conn;
    Statement stmt;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String set = (String)request.getSession(false).getAttribute("set");

            try {
                Class.forName(MYclass);
                conn = DriverManager.getConnection(MYdburl);
                stmt = conn.createStatement();

                String deleteGroup ="delete from itemsetgroup where isKey = '"+set+"'";
                String deleteList = "delete from itemsetlist where isKey = '"+set+"'";

                stmt.execute(deleteGroup);
                stmt.execute(deleteList);

                response.sendRedirect("inventory/itemSets.jsp");

                if (conn != null){
                    conn.close();
                }

            }catch (Exception e){
                e.printStackTrace();
            }

        }




}
