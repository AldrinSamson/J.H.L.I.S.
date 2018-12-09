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

@WebServlet("/returnSingle")
public class returnSingle extends HttpServlet {
    Connection con;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    Statement stmt;
    ResultSet get;
    int nowReturnQuantity , newReturnCurrentQuantity ,newReturnTotalQuantity , nowCurrentInventoryQuantity ,  nowTotalInventoryQuantity;
    String type,bName;
    String condition , user , aKey , sID;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String iKey = request.getParameter("iKey");
            String rResponse = request.getParameter("response");
            String bID = request.getParameter("bID");
            int bQ = Integer.parseInt(request.getParameter("bQ"));
            String remarks = request.getParameter("remarks");

            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            String bETime = df.format(new Date());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String bEDate = sdf.format(new Date());
            HttpSession session = request.getSession(false);
            if(session == null){
                out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='../index.html';</script></body></html>");
            }else {
                user = (String) request.getSession(false).getAttribute("user");
                aKey = (String) request.getSession(false).getAttribute("aKey");
                try {

                    Class.forName(MYclass);
                    con = DriverManager.getConnection(MYdburl);
                    stmt = con.createStatement();

                    String getDetails = "select d.itemType  , i.itemCurrentQuantity ,i.itemTotalQuantity from itemdetails d join inventory i on i.itemKey = d.itemKey  where i.itemKey = '" + iKey + "' ";
                    get = stmt.executeQuery(getDetails);

                    while (get.next()) {
                        type = get.getString("itemType");
                        nowCurrentInventoryQuantity = get.getInt("itemCurrentQuantity");
                        nowTotalInventoryQuantity = get.getInt("itemTotalQuantity");
                    }
                    get.close();


                    String getBID = "select * from borrowtransaction where bID = '" + bID + "'";
                    get = stmt.executeQuery(getBID);

                    while (get.next()) {
                        nowReturnQuantity = get.getInt("bQuantity");
                        bName = get.getString("sName");
                        sID = get.getString("sID");
                    }
                    get.close();

                    if (rResponse.equals("Return")) {

                        if (type.equalsIgnoreCase("Equipment")) {
                            condition = "Available";
                        } else if (type.equalsIgnoreCase("Apparatus")) {
                            condition = "Complete";
                        } else {
                            condition = "OK";
                        }

                        newReturnCurrentQuantity = nowReturnQuantity + nowCurrentInventoryQuantity;

                        if (!type.equalsIgnoreCase("Consumable")) {

                            String updateTransaction = "update borrowtransaction set bCondition = 'Returned' , bEDate = '" + bEDate + "' , bETime = '" + bETime + "' , bQuantityLoss = '0' where bID = '" + bID + "'";
                            stmt.execute(updateTransaction);
                            String updateInventory = "update inventory set itemCondition = '" + condition + "' , itemCurrentQuantity = '" + newReturnCurrentQuantity + "' where itemKey = '" + iKey + "'";
                            stmt.execute(updateInventory);
                            String audit = "insert into audit values (NULL,'" + user + "' , '" + bEDate + "','" + bETime + "','Received item " + iKey + " from " + bName + " ','Received Item','" + bID + "')";
                            stmt.execute(audit);
                        }

                        response.sendRedirect("borrow/borrow.jsp");
                    }
                    if (rResponse.equals("Missing")) {

                        if (type.equalsIgnoreCase("Equipment")) {

                            condition = "Missing";

                            String updateTransaction = "update borrowtransaction set bCondition = 'Missing' , bEDate = '" + bEDate + "' , bETime = '" + bETime + "' , bQuantityLoss = '1' where bID = '" + bID + "'";
                            stmt.execute(updateTransaction);
                            String updateInventory = "update inventory set itemCondition = '" + condition + "' where itemKey = '" + iKey + "'";
                            stmt.execute(updateInventory);
                            String audit = "insert into audit values (NULL,'" + user + "' , '" + bEDate + "','" + bETime + "','" + bName + " reported item " + iKey + " as Missing','Missing Item','" + bID + "')";
                            stmt.execute(audit);
                            String missing = "insert into damagemissingtransaction values (NULL ,'"+iKey +"', '"+bID+"', '"+aKey+"' , '"+sID+"' , 'Missing' , '1',NULL,'"+remarks+"' , 'Unresolved' , '"+bEDate+"' , '"+bETime+"' )";
                            stmt.execute(missing);
                            response.sendRedirect("borrow/borrow.jsp");

                        } else {

                            HttpSession log = request.getSession(false);
                            log.setAttribute("bID", bID);
                            log.setAttribute("quantityTotal", nowReturnQuantity);
                            response.sendRedirect("borrow/borrow.jsp#returnApparatus");

                        }

                    }
                    if (rResponse.equals("Broken")) {

                        if (type.equalsIgnoreCase("Equipment")) {

                            condition = "Damaged";

                            String updateTransaction = "update borrowtransaction set bCondition = 'Damaged' , bEDate = '" + bEDate + "' , bETime = '" + bETime + "' , bQuantityLoss = '1' where bID = '" + bID + "'";
                            stmt.execute(updateTransaction);
                            String updateInventory = "update inventory set itemCondition = '" + condition + "' where itemKey = '" + iKey + "'";
                            stmt.execute(updateInventory);
                            String audit = "insert into audit values (NULL,'" + user + "' , '" + bEDate + "','" + bETime + "','" + bName + " reported item " + iKey + " as Damaged','Damaged Item','" + bID + "')";
                            stmt.execute(audit);
                            String damage = "insert into damagemissingtransaction values (NULL ,'"+iKey +"', '"+bID+"', '"+aKey+"' , '"+sID+"' , 'Damaged' ,'1',NULL, '"+remarks+"' , 'Unresolved' ,  '"+bEDate+"' , '"+bETime+"' )";
                            stmt.execute(damage);

                            response.sendRedirect("borrow/borrow.jsp");

                        } else {

                            HttpSession log = request.getSession(false);
                            log.setAttribute("bID", bID);
                            log.setAttribute("quantityTotal", nowReturnQuantity);
                            response.sendRedirect("borrow/borrow.jsp#returnApparatus");

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
