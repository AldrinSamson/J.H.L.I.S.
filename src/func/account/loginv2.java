package func.account;

import bean.getBean;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet("/loginv2")
public class loginv2 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Connection conn;
    Statement stmt;

    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String user, name, idNum;
    boolean chk = false;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            String user = request.getParameter("user");
            String pass = request.getParameter("pass");

            try {
                Class.forName(MYclass);
                conn = DriverManager.getConnection(MYdburl);
                stmt = conn.createStatement();

                String query = "SELECT * FROM account where username=? and password=?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, user);
                ps.setString(2, pass);
                ResultSet rs = ps.executeQuery();
                chk = rs.next();


                if (chk == true) {

                    String get = "select * from account where username = '" + user + "'";
                    stmt.executeQuery(get);

                    HttpSession log = request.getSession();
                    log.setAttribute("user", user);

                    response.sendRedirect("dashboard.jsp");

                } else {
                    out.println("<html><body><script type='text/javascript'>alert('Invalid username or password!');location='index.html';</script></body></html>");
                }
                if (conn != null) {
                    conn.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

}
