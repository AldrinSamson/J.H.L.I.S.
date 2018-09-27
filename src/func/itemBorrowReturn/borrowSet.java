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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;


@WebServlet("/borrowSet")
public class borrowSet extends HttpServlet {

    Connection con;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    Statement stmt;
    ResultSet chk , get;
    String nowCondition, nowDate, nowKey;
    int nowNum, newNum , nowQ , newQ;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            String[] iKey = request.getParameterValues("iKey");
            String[] bQuantity = request.getParameterValues("bQuantity");
            String[] bID = request.getParameterValues("bID");
            String[] bName = request.getParameterValues("bName");
            String[] bClass = request.getParameterValues("bClass");
            String[] bSupervisor = request.getParameterValues("bSupervisor");

            List<String> iKeyList = new ArrayList<>();
            iKeyList.addAll(Arrays.asList(iKey));
            List<String> bQuantityList  = new ArrayList<>();
            bQuantityList.addAll(Arrays.asList(bQuantity));
            List<String> bIDList = new ArrayList<>();
            bIDList.addAll(Arrays.asList(bID));
            List<String> bNameList = new ArrayList<>();
            bNameList.addAll(Arrays.asList(bName));
            List<String> bClassList = new ArrayList<>();
            bClassList.addAll(Arrays.asList(bClass));
            List<String> bSupervisorList = new ArrayList<>();
            bSupervisorList.addAll(Arrays.asList(bSupervisor));

            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String bDate = sdf.format(new Date());
            String bSTime = df.format(new Date());

            try {

                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmt = con.createStatement();

                int i = 0;
                while(i< iKeyList.size()) {

                    int quantity = Integer.parseInt(bQuantityList.get(i));

                    String chkIfAvailable = "select itemCondition from inventory where itemKey ='" + iKeyList.get(i) + "'";
                    chk = stmt.executeQuery(chkIfAvailable);

                    while (chk.next()) {
                        nowCondition = chk.getString("itemCondition");
                    }

                    if (nowCondition.equals("Not Available")) {

                        out.println("<html><body><script type='text/javascript'>alert('item not available');location='borrow/borrow.jsp';</script></body></html>");
                    } else {

                        String getID = "select bID from borrowtransaction order by bID desc limit 1";
                        chk = stmt.executeQuery(getID);

                        while (chk.next()) {
                            nowNum = chk.getInt("bID");
                            newNum = nowNum + 1;
                        }

                        String getQ = "select itemCurrentQuantity from inventory where itemKey = '" + iKeyList.get(i) + "'";
                        get = stmt.executeQuery(getQ);

                        while (get.next()) {
                            nowQ = get.getInt("itemCurrentQuantity");
                            newQ = nowQ - quantity;
                        }

                        String newTransaq = "insert into borrowTransaction values ('" + newNum + "','" + iKeyList.get(i) + "','" + quantity + "','Not Returned','" + bIDList.get(i) + "','" + bNameList.get(i) + "','" + bClassList.get(i) + "','" + bSupervisorList.get(i) + "','" + bDate + "',NULL,'" + bSTime + "',NULL )";
                        stmt.execute(newTransaq);
                        String updateItem = "update inventory set itemCondition = 'Not Available' , itemCurrentQuantity = '" + newQ + "' where itemKey = '" + iKeyList.get(i) + "'";
                        stmt.execute(updateItem);

                        out.println("<html><body><script type='text/javascript'>location='borrow/borrow.jsp';</script></body></html>");
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
