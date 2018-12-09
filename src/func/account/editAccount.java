package func.account;

import bean.getBean;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet("/editAccount")
public class editAccount extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Connection con;
    Statement stmt;
    ResultSet chk;
    String eUN;

    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try (PrintWriter out = response.getWriter()) {

            String aKey = request.getParameter("aKey");
            String un = request.getParameter("un");
            String newPass = request.getParameter("nP");
            String oldPass = request.getParameter("oP");
            String name = request.getParameter("name");
            String rq1 = request.getParameter("rq1");
            String rq2 = request.getParameter("rq2");
            String ra1 = request.getParameter("ra1");
            String ra2 = request.getParameter("ra2");
            String del = request.getParameter("del");

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
                con = DriverManager.getConnection(MYdburl);
                stmt = con.createStatement();

                String chkPass = "select * from account where aKey = '" + aKey + "' and password = '" + oldPass + "' ";
                chk = stmt.executeQuery(chkPass);

                if (chk.next() == true) {

                    while (chk.next()) {
                        eUN = chk.getString("username");
                    }

                    if (del == null) {

                        if (eUN != un) {

                            if (newPass.isEmpty() == true) {
                                String editAccount = "update account set username = '" + un + "', password ='" + oldPass + "', aName = '" + name + "',rq1 ='" + rq1 + "', rq2 = '" + rq2 + "', ra1 = '" + ra1 + "', "
                                        + "ra2 = '" + ra2 + "' where aKey = '" + aKey + "' ";
                                stmt.execute(editAccount);

                                out.println("<html><body><script type='text/javascript'>alert('Account edited');location='account.jsp';</script></body></html>");

                            } else {
                                String editAccount = "update account set username = '" + un + "', password ='" + newPass + "', aName = '" + name + "',rq1 ='" + rq1 + "', rq2 = '" + rq2 + "', ra1 = '" + ra1 + "', "
                                        + "ra2 = '" + ra2 + "' where aKey = '" + aKey + "' ";
                                stmt.execute(editAccount);

                                out.println("<html><body><script type='text/javascript'>alert('Account edited');location='account.jsp';</script></body></html>");
                            }
                        } else {

                            out.println("<html><body><script type='text/javascript'>alert('Account with this username currently exists!');location='account.jsp';</script></body></html>");

                        }
                    } else {

                        String delAccount = "delete from account where aKey = '" + aKey + "'";
                        stmt.execute(delAccount);

                        out.println("<html><body><script type='text/javascript'>alert('Account deleted');location='account.jsp';</script></body></html>");

                    }
                } else {
                    out.println("<html><body><script type='text/javascript'>alert('Password inccorect');location='account.jsp';</script></body></html>");
                }

                if (con != null) {
                    con.close();
                }
            } catch (ClassNotFoundException | SQLException | NullPointerException e) {
                e.printStackTrace();
            }

        }
    }

}
