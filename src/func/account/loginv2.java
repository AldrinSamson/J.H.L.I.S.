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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet("/loginv2")
public class loginv2 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Connection conn;
    Statement stmt;

    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String user, name, idNum , type ,aKey;
    boolean chk = false;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            String aTime = df.format(new java.util.Date());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String aDate = sdf.format(new Date());

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

                //add audit log

                if (chk) {

                    ResultSet getz;
                    String get = "select * from account where username = '" + user + "'";
                    getz = stmt.executeQuery(get);
                    while (getz.next()){
                        aKey = getz.getString("aKey");
                        type = getz.getString("aClass");

                    }


                    HttpSession log = request.getSession(true);
                    log.setAttribute("user", user);
                    log.setAttribute("class", type);

                    String audit = "insert into audit values (NULL,'"+user+"' , '"+aDate+"','"+aTime+"','Logged in','Login','N/A')";
                    stmt.execute(audit);

                    if (type.equals("Administrator")){
                    response.sendRedirect("dashboard.jsp");
                    }else {
                        response.sendRedirect("request/request.jsp");
                    }

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
