package func.itemBorrowReturn;

import bean.getBean;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
    ResultSet chk , get;
    String nowCondition, type , newCondition , user;
    int  nowQ , newQ , newid ,nowTQ , newTQ;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            String iKey = request.getParameter("iKey");
            int bQuantity = Integer.parseInt(request.getParameter("bQuantity"));
            String bID = request.getParameter("bID");
            String bName = request.getParameter("bName");
            String bClass = request.getParameter("bClass");
            String bSupervisor = request.getParameter("bSupervisor");

            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String bDate = sdf.format(new Date());
            String bSTime = df.format(new java.util.Date());
            HttpSession session = request.getSession(false);
            if(session == null){
                out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='../index.html';</script></body></html>");
            }else {
                user = (String)request.getSession(false).getAttribute("user");



            try {

                    Class.forName(MYclass);
                    con = DriverManager.getConnection(MYdburl);
                    stmt = con.createStatement();

                String chkIfAvailable = "select itemCondition from inventory where itemKey ='" + iKey + "'";
                chk = stmt.executeQuery(chkIfAvailable);

                while (chk.next()) {
                    nowCondition = chk.getString("itemCondition");
                }

                if (nowCondition.equals("Not Available")){

                    out.println("<html><body><script type='text/javascript'>alert('item not available');location='borrow/borrow.jsp';</script></body></html>");
                }else {

                    String getQ = "select i.itemCurrentQuantity , d.itemType ,i.itemTotalQuantity from inventory i join itemdetails d on i.itemKey = d.itemKey where i.itemKey = '" + iKey + "'";
                    get = stmt.executeQuery(getQ);

                    while (get.next()) {

                        type = get.getString("itemType");
                        nowQ = get.getInt("itemCurrentQuantity");
                        nowTQ = get.getInt("itemTotalQuantity");
                        newQ = nowQ - bQuantity;
                        newTQ = nowTQ - bQuantity;

                    }

                    get.close();

                    if((nowQ >= nowTQ) ) {

                        String getID = "select bID  from borrowtransaction order by bID desc limit 1";
                        get = stmt.executeQuery(getID);
                        if (!get.next()) {
                            newid = 1;
                        } else {
                            while (get.next()) {

                                int id = get.getInt("bID");
                                newid = id + 1;
                            }
                        }

                        String status;

                        if (type.equalsIgnoreCase("Equipment")) {
                            newCondition = "Not Available";
                            status = "Not Returned";
                        } else if (type.equalsIgnoreCase("Apparatus")) {
                            newCondition = "Incomplete";
                            status = "Not Returned";
                        } else {
                            newCondition = "OK";
                            status = "N/A";
                        }

                        String newTransaq = "insert into borrowTransaction values (NULL,'" + iKey + "','" + bQuantity + "','" + status + "','" + bID + "','" + bName + "','" + bClass + "','" + bSupervisor + "','" + bDate + "',NULL,'" + bSTime + "',NULL ,NULL)";
                        stmt.execute(newTransaq);

                        if (type.equalsIgnoreCase("Consumable")) {

                            String updateItem = "update inventory set itemCondition = '" + newCondition + "' , itemCurrentQuantity = '" + newQ + "', itemTotalQuantity = '" + newTQ + "' where itemKey = '" + iKey + "'";
                            stmt.execute(updateItem);

                        } else {

                            String updateItem = "update inventory set itemCondition = '" + newCondition + "' , itemCurrentQuantity = '" + newQ + "' where itemKey = '" + iKey + "'";
                            stmt.execute(updateItem);
                        }
                        String audit = "insert into audit values (NULL,'" + user + "' , '" + bDate + "','" + bSTime + "','Lent item " + iKey + " to " + bName + " ','Lent Item','" + newid + "')";
                        stmt.execute(audit);

                        out.println("<html><body><script type='text/javascript'>location='borrow/borrow.jsp';</script></body></html>");
                    }else {
                        out.println("<html><body><script type='text/javascript'>alert('item not available');location='borrow/borrow.jsp';</script></body></html>");
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


}
