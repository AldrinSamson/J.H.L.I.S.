package func.manageConsume;

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


@WebServlet("/editConsume")
public class editConsume extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Connection con;
    Statement stmt;

    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String cKey = request.getParameter("cKey");
            String cDesc = request.getParameter("cDesc");
            String cLab = request.getParameter("cLab");
            String cED = request.getParameter("cExpireDate");
            String cMeasure = request.getParameter("cMeasure");
            String cUnit = request.getParameter("cUnit");
            String cCondition = request.getParameter("cCondition");
            String del = request.getParameter("del");

            if (cDesc.isEmpty() == true) {
                cDesc = "N/A";
            }

            try {

                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmt = con.createStatement();

                if (del == null) {

                    String editConsume = "update consumablelist set cDesc = '" + cDesc + "' , cLab = '" + cLab + "' , cExpireDate = '" + cED + "', cMeasure = '" + cMeasure + "', cUnit = '" + cUnit + "', cCondition = '" + cCondition + "' where cKey = '" + cKey + "'";
                    String editConsumeN = "update consumablelist set cDesc = '" + cDesc + "' , cLab = '" + cLab + "' , cExpireDate = NULL, cMeasure = '" + cMeasure + "', cUnit = '" + cUnit + "', cCondition = '" + cCondition + "' where cKey = '" + cKey + "'";
                    if (cED.isEmpty() == true) {

                        stmt.execute(editConsumeN);

                        if (cLab.equalsIgnoreCase("Physics")) {
                            out.println("<html><body><script type='text/javascript'>alert('Consumable edited N');location='physics.jsp';</script></body></html>");
                        } else {
                            out.println("<html><body><script type='text/javascript'>alert('Consumable edited N');location='chemistry.jsp';</script></body></html>");
                        }
                    } else {
                        stmt.execute(editConsume);

                        if (cLab.equalsIgnoreCase("Physics")) {
                            out.println("<html><body><script type='text/javascript'>alert('Consumable edited ');location='physics.jsp';</script></body></html>");
                        } else {
                            out.println("<html><body><script type='text/javascript'>alert('Consumable edited ');location='chemistry.jsp';</script></body></html>");
                        }

                    }

                } else {

                    String delConsume = "delete from consumablelist where cKey = '" + cKey + "'";
                    stmt.execute(delConsume);

                    if (cLab.equalsIgnoreCase("Physics")) {
                        out.println("<html><body><script type='text/javascript'>alert('Consumable deleted');location='physics.jsp';</script></body></html>");
                    } else {
                        out.println("<html><body><script type='text/javascript'>alert('Consumable deleted');location='chemistry.jsp';</script></body></html>");
                    }

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
