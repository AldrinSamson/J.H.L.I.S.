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

@WebServlet("/logout")
public class logout extends HttpServlet {

    Connection conn;
    Statement stmt;

    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String user, name, idNum , type;
    boolean chk = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {

            try {
                Class.forName(MYclass);
                conn = DriverManager.getConnection(MYdburl);
                stmt = conn.createStatement();

                // add audit log
                HttpSession log = request.getSession(false);
                log.invalidate();
                response.sendRedirect("../index.html");

            }catch (Exception e){
                e.printStackTrace();
            }
        }



    }


}
