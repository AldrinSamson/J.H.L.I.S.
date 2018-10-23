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
    String nowCondition, type, status , user,newCondition;
    int newTQ, nowTQ , nowQ , newQ ,count , newid;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            String setID = request.getParameter("setID");
            String bID = request.getParameter("bID");
            String bName = request.getParameter("bName");
            String bClass = request.getParameter("bClass");
            String bSupervisor = request.getParameter("bSupervisor");

            List<String> iKey = new ArrayList<>();
            List<Integer> bQuantity = new ArrayList<>();

            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String bDate = sdf.format(new Date());
            String bSTime = df.format(new Date());

            if(request.getSession(false).getAttribute("user") == null){
                out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='../index.html';</script></body></html>");
            }else {
                user = (String)request.getSession(false).getAttribute("user");
            }

            try {
                Class.forName(MYclass);
                Connection conn = DriverManager.getConnection(MYdburl);
                stmt = conn.createStatement();

                // get data
                String doCritical = "SELECT  COUNT(*) as rowss  from itemsetgroup where isKey = '"+setID+"' ";
                get  = stmt.executeQuery(doCritical);
                while(get.next()) {
                    count = get.getInt("rowss");
                }
                get.close();

                String getItems = "select * from itemsetgroup where isKey = '"+setID+"'";
                get = stmt.executeQuery(getItems);

                int i = 0;
                while( i < count){
                    get.next();
                    String itemKey = get.getString("itemKey");
                    iKey.add(itemKey);
                    int quantity = get.getInt("isQuantity");
                    bQuantity.add(quantity);
                    i++;
                }
                get.close();

                //borrow per item
                int x = 0;
                while( x < iKey.size()){

                    String chkIfAvailable = "select itemCondition from inventory where itemKey ='" + iKey.get(x) + "'";
                    chk = stmt.executeQuery(chkIfAvailable);

                    while (chk.next()) {
                        nowCondition = chk.getString("itemCondition");
                    }

                    if (nowCondition.equals("Not Available")){
                        out.println("<html><body><script type='text/javascript'>alert('item "+iKey.get(x)+" not available');location='borrow/borrow.jsp';</script></body></html>");
                    } else if (nowCondition.equalsIgnoreCase("Missing")) {
                        out.println("<html><body><script type='text/javascript'>alert('item "+iKey.get(x)+" missing');location='borrow/borrow.jsp';</script></body></html>");
                    }else if (nowCondition.equalsIgnoreCase("Damaged")){
                        out.println("<html><body><script type='text/javascript'>alert('item "+iKey.get(x)+" damaged');location='borrow/borrow.jsp';</script></body></html>");
                    } else {

                        String getQ = "select i.itemCurrentQuantity , d.itemType ,i.itemTotalQuantity from inventory i join itemdetails d on i.itemKey = d.itemKey where i.itemKey = '" + iKey.get(x) + "'";
                        get = stmt.executeQuery(getQ);

                        while (get.next()) {

                            type = get.getString("itemType");
                            nowQ = get.getInt("itemCurrentQuantity");
                            nowTQ = get.getInt("itemTotalQuantity");
                            newQ = nowQ - bQuantity.get(x);
                            newTQ = nowTQ - bQuantity.get(x);

                        }
                    }

                        get.close();

                    String getID = "select bID  from borrowtransaction order by bID desc limit 1";
                    get = stmt.executeQuery(getID);
                    if (!get.next()){
                        newid = 1;
                    }else {
                        while (get.next()) {

                            int id = get.getInt("bID");
                            newid = id + 1;
                        }
                    }
                    get.close();

                    if(type.equalsIgnoreCase("Equipment")){
                        newCondition = "Not Available";
                        status = "Not Returned";
                    }else if (type.equalsIgnoreCase("Apparatus")){
                        newCondition = "Incomplete";
                        status = "Not Returned";
                    }else {
                        newCondition = "OK";
                        status = "N/A";
                    }

                    String newTransaq = "insert into borrowTransaction values (NULL,'" + iKey.get(x) + "','" + bQuantity.get(x) + "','"+status+"','" + bID + "','" + bName + "','" + bClass + "','" + bSupervisor + "','" + bDate + "',NULL,'" + bSTime + "',NULL ,NULL)";
                    stmt.execute(newTransaq);

                    if (type.equalsIgnoreCase("Consumable")){

                        String updateItem = "update inventory set itemCondition = '" + newCondition + "' , itemCurrentQuantity = '" + newQ + "', itemTotalQuantity = '" + newTQ + "' where itemKey = '" + iKey.get(x) + "'";
                        stmt.execute(updateItem);

                    }else {

                        String updateItem = "update inventory set itemCondition = '" + newCondition + "' , itemCurrentQuantity = '" + newQ + "' where itemKey = '" +iKey.get(x)+ "'";
                        stmt.execute(updateItem);
                    }
                    String audit = "insert into audit values (NULL,'"+user+"' , '"+bDate+"','"+bSTime+"','Lent item "+iKey.get(x)+" to "+bName+" ','Lent Item','"+newid+"')";
                    stmt.execute(audit);

                    x++;

                }

                response.sendRedirect("borrow/borrowSet.jsp");

            }catch (Exception e){
                e.printStackTrace();
            }


        }

    }


}
