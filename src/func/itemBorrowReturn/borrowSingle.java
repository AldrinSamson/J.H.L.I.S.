package func.itemBorrowReturn;

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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet("/borrowSingle")
public class borrowSingle extends HttpServlet {

    Connection con;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    Statement stmt;
    ResultSet chk;
    String nowCondition, nowDate, nowKey;
    int nowNum, newNum;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            String iKey = request.getParameter("iKey");
            String iType = request.getParameter("iType");
            String bQuantity = request.getParameter("bQuantity");
            String bID = request.getParameter("bID");
            String bName = request.getParameter("bName");
            String bClass = request.getParameter("bClass");
            String bSupervisor = request.getParameter("bSupervisor");

            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String bDate = sdf.format(new Date());
            String bSTime = df.format(new Date());
            String updateItem = "update inventory set itemCondition = 'Borrowed' where itemKey = '" + iKey + "'";
            String b = "Borrowed";
            String m = "Missing";
            String k = "Broken";

            try {

                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmt = con.createStatement();

                String chkIfAvailable = "select itemCondition from inventory where itemKey ='" + iKey + "'";
                chk = stmt.executeQuery(chkIfAvailable);

                while (chk.next()) {
                    nowCondition = chk.getString("itemCondition");
                }

                String chkKey = "select bNum , bDate from borrowtransactions where bDate = '" + bDate + "' order by bNum desc limit 1";
                chk = stmt.executeQuery(chkKey);

                if (chk.next() == true) {

                    while (chk.next()) {
                        nowDate = chk.getString("bDate");
                        nowNum = chk.getInt("bNum");
                        newNum = ++nowNum;
                        nowKey = nowDate + "-" + newNum;
                    }

                    String newTransaq1 = "insert into borrowTransactions values ('" + nowKey + "','" + newNum + "','" + iKey + "','" + iType + "','" + bQuantity + "'," +
                            "'" + bID + "','" + bName + "','" + bClass + "','" + bSupervisor + "','" + bDate + "','" + bSTime + "',NULL ,'Borrowed')";
                    stmt.execute(newTransaq1);
                    stmt.execute(updateItem);
                } else {

                    String newKey = bDate + "-1";
                    String newTransaq2 = "insert into borrowTransactions values ('" + newKey + "','1','" + iKey + "','" + iType + "','" + bQuantity + "'," +
                            "'" + bID + "','" + bName + "','" + bClass + "','" + bSupervisor + "','" + bDate + "','" + bSTime + "',NULL,'Borrowed')";
                    stmt.execute(newTransaq2);
                    stmt.execute(updateItem);
                }


                out.println("<html><body><script type='text/javascript'>location='borrow.jsp';</script></body></html>");

                if (con != null) {
                    con.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }


}
