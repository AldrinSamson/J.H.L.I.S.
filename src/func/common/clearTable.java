package func.common;

import bean.getBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/clearTable")
public class clearTable extends HttpServlet {


    Connection con;
    Statement stmt;

    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String user;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String table = request.getParameter("table");
            String password = request.getParameter("password");
            String location = request.getParameter("location");
            HttpSession session = request.getSession(false);
            if(session == null){
                out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='../index.html';</script></body></html>");
            }else {
                user = (String) request.getSession(false).getAttribute("user");

                try {
                    Class.forName(MYclass);
                    con = DriverManager.getConnection(MYdburl);
                    stmt = con.createStatement();

                    String query = "SELECT * FROM account where username=? and password=?";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, user);
                    ps.setString(2, password);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()){

                        String truncateTable = "truncate "+table+"";
                        stmt.execute(truncateTable);

                    }else {

                        out.println("<html><body><script type='text/javascript'>alert('Invalid username or password!');location='report/"+location+".jsp';</script></body></html>");
                    }

                } catch (Exception e){
                    e.printStackTrace();
                }

            }


        }

    }

}
