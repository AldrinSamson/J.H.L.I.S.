package func.requesting;

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
import java.sql.Statement;


@WebServlet("/disableRequest")
public class disableRequest extends HttpServlet {

    Connection conn;
    Statement stmtE;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
        String rID = (String)request.getSession(false).getAttribute("rID");

        try {

            Class.forName(MYclass);
            conn = DriverManager.getConnection(MYdburl);
            stmtE = conn.createStatement();

            String disable = "UPDATE request SET isDisabled = 'YES' WHERE rID = '"+rID+"' ";
            stmtE.execute(disable);

            out.println("<html><body><script type='text/javascript'>location='request/request.jsp';</script></body></html>");

        }catch (Exception e) {
            e.printStackTrace();
        }

    }
    }


}
