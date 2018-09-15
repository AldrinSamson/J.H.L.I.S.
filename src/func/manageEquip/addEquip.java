package func.manageEquip;

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


@WebServlet("/addEquip")
public class addEquip extends HttpServlet {
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
            String eName = request.getParameter("name");
            String eDesc = request.getParameter("desc");
            String eLab = request.getParameter("lab");
            int eQ = Integer.parseInt(request.getParameter("quantity"));
            String eCalibDate = request.getParameter("calibDate");
            String abbv = request.getParameter("abbv");
            String condi = "Available";
            String eKey = abbv + "-1";
            String dateSQL;
            if (eDesc.isEmpty()) {
                eDesc = "N/A";
            }

            if (eQ < 1) {
                condi = "Complete";
            }

            if (eCalibDate.isEmpty()) {
                dateSQL = "NULL";
            } else {
                String date[] = eCalibDate.split("/");
                String mm = date[0];
                String dd = date[1];
                String yyyy = date[2];
                dateSQL = "'" + yyyy + "/" + mm + "/" + dd + "'";
            }

            try {
                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmtCHK = con.createStatement();
                stmtE = con.createStatement();

                String abbvCHK = "select eName from equipmentdetails where eAbbv = '" + abbv + "'";
                chk = stmtCHK.executeQuery(abbvCHK);

                if (chk.next() == false) {

                    String addEDetails = "insert into equipmentDetails values ('" + eKey + "' , '" + eName + "' , '" + eDesc + "' , '" + abbv + "' , '1')";
                    stmtE.execute(addEDetails);

                    String addEItem = "insert into inventory values ('" + eKey + "', 'Equipment' , '" + eQ + "', '" + eQ + "' , 'piece' , " + dateSQL + " , " +
                            "'" + condi + "', '" + eLab + "')";
                    stmtE.execute(addEItem);

                    if (eLab.equalsIgnoreCase("Physics")) {
                        out.println("<html><body><script type='text/javascript'>;location='physics.jsp';</script></body></html>");
                    } else {
                        out.println("<html><body><script type='text/javascript'>;location='chemistry.jsp';</script></body></html>");
                    }
                } else {
                    //abbreviation error
                    if (eLab.equalsIgnoreCase("Physics")) {
                        out.println("<html><body><script type='text/javascript'>alert('abbreviation already exists, please pick a new one ');location='physics.jsp#mCode';</script></body></html>");
                    } else {
                        out.println("<html><body><script type='text/javascript'>alert('abbreviation already exists, please pick a new one ');location='chemistry.jsp#mCode';</script></body></html>");
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
