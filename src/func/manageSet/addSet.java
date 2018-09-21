package func.manageSet;

import bean.getBean;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;


@WebServlet("/addSet")
public class addSet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    Connection con;
    Statement stmt;
    ResultSet chkID;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String namesplit;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try (PrintWriter out = response.getWriter()) {

            String lab = request.getParameter("lab");
            String[] name = request.getParameterValues("name[]");
            String[] quantity = request.getParameterValues("quantity[]");

            List<String> list = new ArrayList<String>();
            list.addAll(Arrays.asList(name));


            /*for (int i = 0; i < name.length; i++) {
                namesplit = list.get(0);
                out.println("<html><body><script type='text/javascript'>alert('"+namesplit+"');location='inventory/itemSets.jsp';</script></body></html>");
                list.remove(0);
            }*/

            try {

                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                String sql = "insert into itemsetgroup(itemKey ,isKey) values (?,?) ";
                //PreparedStatement pstmt = con.createStatement(sql);
                for (String tmp : name) {


                }


            } catch (Exception e){
                e.printStackTrace();
            }


        }

    }
}
