package func.account;

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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/logout")
public class logout extends HttpServlet {

    Connection conn;
    Statement stmt;

    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String user, name, idNum , type;
    boolean chk = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DateFormat df = new SimpleDateFormat("HH:mm:ss");
        String aTime = df.format(new java.util.Date());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String aDate = sdf.format(new Date());
            try {
                Class.forName(MYclass);
                conn = DriverManager.getConnection(MYdburl);
                stmt = conn.createStatement();

                HttpSession log = request.getSession(false);

                user = (String)request.getSession(false).getAttribute("user");

                String audit = "insert into audit values (NULL,'"+user+"' , '"+aDate+"','"+aTime+"','Logged Out','Logout','N/A')";
                stmt.execute(audit);

                log.invalidate();
                response.sendRedirect("index.html");

            }catch (Exception e){
                e.printStackTrace();
            }
        }







}
