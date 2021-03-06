package func.itemBorrowReturn;

import bean.getBean;

import javax.servlet.ServletException;
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

@WebServlet("/returnApparatusSingle")
public class returnApparatusSingle extends HttpServlet {

    Connection con;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    Statement stmt;
    ResultSet get;
    String user;
    int inventoryCQ , inventoryTQ ,inventoryReturn, newCQ , newTQ ,  quantityTotal;
    String type,iKey ,sName , aKey ,sID;
    String condition;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {


            int quantityLoss = Integer.parseInt(request.getParameter("qLoss"));
            String mResponse = request.getParameter("response");
            String bID = (String)request.getSession(false).getAttribute("bID");
            String remarks = request.getParameter("remarks");

            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            String bETime = df.format(new Date());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String bEDate = sdf.format(new Date());

            HttpSession session = request.getSession(false);
            if(session == null){
                out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='../index.html';</script></body></html>");
            }else {
                user = (String)request.getSession(false).getAttribute("user");
                quantityTotal = (Integer)request.getSession(false).getAttribute("quantityTotal");
                aKey = (String)request.getSession(false).getAttribute("aKey");


            try {

                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmt = con.createStatement();

                String getTransaction = "select bItemKey , sName  , sID from borrowtransaction where bID = '"+bID+"'";
                get = stmt.executeQuery(getTransaction);

                while (get.next()) {

                    iKey = get.getString("bItemKey");
                    sName = get.getString("sName");
                    sID = get.getString("sID");
                }

                String getDetails = "select d.itemType  , i.itemCurrentQuantity ,i.itemTotalQuantity from itemdetails d join inventory i on i.itemKey = d.itemKey  where i.itemKey = '"+iKey+"' ";
                get = stmt.executeQuery(getDetails);

                while (get.next()){
                    type = get.getString("itemType");
                    inventoryCQ= get.getInt("itemCurrentQuantity");
                    inventoryTQ = get.getInt("itemTotalQuantity");
                    inventoryReturn= quantityTotal - quantityLoss;
                    newCQ = inventoryCQ + inventoryReturn;
                    newTQ = inventoryTQ - quantityLoss;

                } get.close();

                String bCondition = mResponse.equals("Missing")? "Missing" : "Damaged";

                if (newTQ == 0 ){
                    condition = "Empty";
                }else if (inventoryTQ == newCQ){
                    condition = "Complete";
                }else {
                    condition = "Incomplete";
                }
                String updateInventory = "update inventory set itemCurrentQuantity = '"+newCQ+"' , itemCondition = '"+condition+"' where itemKey = '"+iKey+"' ";
                String updateBorrow = "update borrowtransaction set bCondition = '"+bCondition+"' , bEDate = '"+bEDate+"' , bETime = '"+bETime+"', bQuantityLoss = '"+quantityLoss+"' where bID = '"+bID+"'";
                String audit ="insert into audit values (NULL ,'"+user +"' , '"+bEDate+"' , '"+bETime+"' , '"+sName+" returned item "+iKey+" as "+bCondition+"' , '"+bCondition+" item' , '"+bID+"')";
                stmt.execute(updateBorrow);
                stmt.execute(updateInventory);
                stmt.execute(audit);
                String missing = "insert into damagemissingtransaction values (NULL ,'"+iKey +"', '"+bID+"', '"+aKey+"' , '"+sID+"' , '"+bCondition+"' ,'"+quantityLoss+"',NULL, '"+remarks+"' , 'Unresolved' , '"+bEDate+"' , '"+bETime+"' )";
                stmt.execute(missing);

                response.sendRedirect("borrow/borrow.jsp");

                if (con != null) {
                    con.close();
                }

            }catch (Exception e){
                e.printStackTrace();

            }
            }
        }

    }


}
