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
import java.sql.Statement;


@WebServlet("/editNB")
public class editNB extends HttpServlet {
    private static final long serialVersionUID = 1L;

    Connection con;
    Statement stmt;

    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String nKey = request.getParameter("nKey");
            String nDesc = request.getParameter("nDesc");
            String nLab = request.getParameter("nLab");
            String nCondition = request.getParameter("nCondition");
            String del = request.getParameter("del");

            if (nDesc.isEmpty() == true) {

                nDesc = "N/A";

            }

            try {
                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmt = con.createStatement();

                if (del == null) {

                    String editNB = "update nonborrowable set nDesc = '" + nDesc + "' , nLab = '" + nLab + "', nCondition ='" + nCondition + "' where nKey = '" + nKey + "'";
                    stmt.execute(editNB);
                    out.println("<html><body><script type='text/javascript'>alert('equipment edited');location='nonBorrowable.jsp';</script></body></html>");

                } else {

                    String delNB = "delete from nonborrowable where nKey = '" + nKey + "'";
                    stmt.execute(delNB);
                    out.println("<html><body><script type='text/javascript'>alert('equipment deleted');location='nonBorrowable.jsp';</script></body></html>");
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
