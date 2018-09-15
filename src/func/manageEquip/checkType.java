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


@WebServlet("/checkType")
public class checkType extends HttpServlet {
    private static final long serialVersionUID = 1L;

    Connection con;
    Statement stmt, stmtE;
    ResultSet chk, get;
    String getAbbv, codeE;
    int getNum, newNum;

    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, NullPointerException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String name = request.getParameter("name");
            String desc = request.getParameter("desc");
            String lab = request.getParameter("lab");
            String calibDate = request.getParameter("calibDate");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String condi = "Available";
            String dateSQL;

            if (quantity > 1) {
                condi = "Complete";
            }

            if (desc.isEmpty()) {
                desc = "N/A";
            }

            //MySQL format
            if (calibDate.isEmpty()) {
                dateSQL = "NULL";
            } else {
                String date[] = calibDate.split("/");
                String mm = date[0];
                String dd = date[1];
                String yyyy = date[2];
                dateSQL = "'" + yyyy + "/" + mm + "/" + dd + "'";
            }

            //set to bean


            try {
                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmt = con.createStatement();
                stmtE = con.createStatement();

                String chkName = "SELECT * FROM equipmentdetails WHERE eName = '" + name + "'";
                chk = stmt.executeQuery(chkName);

                if (chk.next()) {

                    String getData = "select eAbbv , eNum from equipmentDetails where eName = '" + name + "'order by eNum desc limit 1";
                    get = stmt.executeQuery(getData);

                    while (get.next()) {
                        getAbbv = get.getString("eAbbv");
                        getNum = get.getInt("eNum");
                        newNum = getNum + 1;
                    }
                    codeE = getAbbv + "-" + newNum;

                    String addEDetails = "insert into equipmentDetails values ('" + codeE + "' , '" + name + "' , '" + desc + "' , '" + getAbbv + "' , '" + newNum + "')";
                    stmtE.execute(addEDetails);

                    String addEItem = "insert into inventory values ('" + codeE + "', 'Equipment' , '" + quantity + "', '" + quantity + "' , 'piece' , " + dateSQL + " , " +
                            "'" + condi + "', '" + lab + "')";
                    stmtE.execute(addEItem);

                    if (lab.equalsIgnoreCase("Physics")) {
                        out.println("<html><body><script type='text/javascript'>;location='physics.jsp';</script></body></html>");
                    } else {
                        out.println("<html><body><script type='text/javascript'>location='chemistry.jsp';</script></body></html>");
                    }

                } else {

                    //get middle second
                    char first, middle, last;
                    first = name.charAt(0);
                    last = name.charAt(name.length() - 1);
                    if (name.length() % 2 == 0) {
                        middle = name.charAt(name.length() / 2 - 1 / 2);
                    } else {
                        middle = name.charAt(name.length() / 2 - 1);
                    }
                    String firstS = Character.toString(first);
                    String lastS = Character.toString(last);
                    String middleS = Character.toString(middle);
                    String abbvS = firstS + middleS + lastS;
                    String abbv1 = abbvS.toUpperCase();

                    // get 3rd
                    char first2, middle2, last2;
                    first2 = name.charAt(0);
                    middle2 = name.charAt(2);
                    last2 = name.charAt(name.length() - 1);

                    String firstS2 = Character.toString(first2);
                    String lastS2 = Character.toString(last2);
                    String middleS2 = Character.toString(middle2);
                    String abbvS2 = firstS2 + middleS2 + lastS2;
                    String abbv2 = abbvS2.toUpperCase();

                    // get 2rd
                    char first3, middle3, last3;
                    first3 = name.charAt(0);
                    middle3 = name.charAt(1);
                    last3 = name.charAt(name.length() - 1);

                    String firstS3 = Character.toString(first3);
                    String lastS3 = Character.toString(last3);
                    String middleS3 = Character.toString(middle3);
                    String abbvS3 = firstS3 + middleS3 + lastS3;
                    String abbv3 = abbvS3.toUpperCase();

                    getBean.setAbbv1(abbv1);
                    getBean.setAbbv2(abbv2);
                    getBean.setAbbv3(abbv3);

                    out.println("<html><body><script type='text/javascript'>location='physics.jsp#mCode';</script></body></html>");
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
