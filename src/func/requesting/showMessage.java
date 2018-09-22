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
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/showMessage")
public class showMessage extends HttpServlet {

    Connection con;
    Statement stmtCHK, stmtE;
    ResultSet chk;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String rMessage;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {

            String rID = request.getParameter("rID");

            try {
                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmtCHK = con.createStatement();
                stmtE = con.createStatement();

                String getMessage = "Select rMessage from request where rID = '"+rID+"'";
                chk = stmtE.executeQuery(getMessage);

                while (chk.next()){
                    rMessage = chk.getString("rMessage");
                }

                getBean.setrMessage(rMessage);

                out.println("<html><body><script type='text/javascript'>;location='request.jsp#message';</script></body></html>");

            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }


}
