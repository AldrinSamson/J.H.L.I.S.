package func.account;

import bean.getBean;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/addAccount")
public class addAccount extends HttpServlet {
    private static final long serialVersionUID = 1L;

    Connection conn;
    Statement stmtCHK, stmtE;
    ResultSet chkRID, chkRUN;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try (PrintWriter out = response.getWriter()) {


            int id = Integer.parseInt(request.getParameter("id"));
            String un = request.getParameter("un");
            String cls = request.getParameter("cls");
            String pass = request.getParameter("pass");
            String rq1 = request.getParameter("rq1");
            String rq2 = request.getParameter("rq2");
            String ra1 = request.getParameter("ra1");
            String ra2 = request.getParameter("ra2");
            String name = request.getParameter("name");
            String aKey = cls + "-" + id;

            if (rq1.isEmpty() == true) {
                rq1 = "N/A";
                ra1 = "N/A";
            }

            if (rq2.isEmpty() == true) {
                rq2 = "N/A";
                ra2 = "N/A";

            }

            try {

                Class.forName(MYclass);
                conn = DriverManager.getConnection(MYdburl);
                stmtCHK = conn.createStatement();
                stmtE = conn.createStatement();
                String chkID = "select * from account where aID ='" + id + "'";
                String chkUN = "select * from account where username = '" + un + "'";

                chkRID = stmtCHK.executeQuery(chkID);

                if (chkRID.next() == true) {

                    //id exists
                    out.println("<html><body><script type='text/javascript'>alert('ID already exists');location='account.jsp';</script></body></html>");


                } else {

                    chkRUN = stmtCHK.executeQuery(chkUN);

                    if (chkRUN.next() == true) {

                        //username exists
                        out.println("<html><body><script type='text/javascript'>alert('Username already exists');location='account.jsp';</script></body></html>");


                    } else {
                        //add account
                        String addAccount = "insert into account values ('" + aKey + "','" + un + "','" + pass + "','" + name + "', '" + cls + "', '" + id + "', "
                                + " '" + rq1 + "', '" + rq2 + "', '" + ra1 + "','" + ra2 + "')";

                        stmtE.execute(addAccount);
                        out.println("<html><body><script type='text/javascript'>alert('Account Added');location='account.jsp';</script></body></html>");

                    }
                }
                if (conn != null) {
                    conn.close();
                }


            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("<html><body><script type='text/javascript'>alert('SQL error');location='account.jsp';</script></body></html>");
            } catch (NumberFormatException d) {

                out.println("<html><body><script type='text/javascript'>alert('ID format error');location='account.jsp';</script></body></html>");

            }
        }
    }

}
