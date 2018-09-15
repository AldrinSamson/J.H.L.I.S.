package func.manageNB;

import bean.getBean;

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


@WebServlet("/addNB")
public class addNB extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Connection con;
    Statement stmtE, stmtCHK;
    ResultSet chk;

    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String nName = request.getParameter("nName");
            String nDesc = request.getParameter("nDesc");
            String nLab = request.getParameter("nLab");
            String nAbbv = request.getParameter("nAbbv");
            String nKey = nAbbv + "-1";
            if (nDesc.isEmpty() == true) {
                nDesc = "N/A";
            }

            try {
                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmtCHK = con.createStatement();
                stmtE = con.createStatement();

                String abbvCHK = "select nName from nonborrowable where nAbbv = '" + nAbbv + "'";
                chk = stmtCHK.executeQuery(abbvCHK);

                if (chk.next() == false) {

                    String addNB = "insert into nonborrowable values ('" + nKey + "','" + nName + "','1','" + nAbbv + "','" + nDesc + "','" + nLab + "','OK')";

                    stmtE.execute(addNB);

                    out.println("<html><body><script type='text/javascript'>alert('item added ');location='nonBorrowable.jsp';</script></body></html>");

                } else {
                    //abbv already in use

                    out.println("<html><body><script type='text/javascript'>alert('abbv already exists please pick a new one ');location=nonBorrowable.jsp#mNCode';</script></body></html>");
                }

                if (con != null) {
                    con.close();
                }


            } catch (Exception e) {
                e.printStackTrace();

            }

        }
    }
}
