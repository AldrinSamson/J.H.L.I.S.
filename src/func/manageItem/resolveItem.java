package func.manageItem;

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

@WebServlet("/resolveItem")
public class resolveItem extends HttpServlet {


    Connection con;
    Statement stmt;
    ResultSet get , chk ;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String user , type , bCondition , resolve , condition ,status , DMresolve;
    int resolveQuantity , resolveInventoryQuantity , complete , nowReturnQuantity;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String iKey = request.getParameter("iKey");
            int quantityReturned = Integer.parseInt(request.getParameter("quantity"));
            String bID = request.getParameter("bID");
            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            String aTime = df.format(new java.util.Date());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String aDate = sdf.format(new Date());

            HttpSession session = request.getSession(false);
            if(session == null){
                out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='../index.html';</script></body></html>");
            }else {
                user = (String) request.getSession(false).getAttribute("user");

                try {
                            Class.forName(MYclass);
                            con = DriverManager.getConnection(MYdburl);
                            stmt = con.createStatement();

                            String getTransaq = "select b.bQuantityLoss , b.bCondition , i.itemCurrentQuantity , i.itemTotalQuantity , d.itemType from borrowtransaction b join inventory i right join itemdetails d on i.itemKey = d.itemKey on b.bItemKey = i.itemKey where  b.bId = '"+bID+"'";
                            get = stmt.executeQuery(getTransaq);
                            while (get.next()){
                                int loss = get.getInt("bQuantityLoss");
                                int current = get.getInt("itemCurrentQuantity");
                                int total = get.getInt("itemTotalQuantity");
                                type = get.getString("itemType");
                                bCondition = get.getString("bCondition");
                                resolveQuantity = loss - quantityReturned ; // update bT
                                resolveInventoryQuantity = current + quantityReturned; // on update inventory

                                if (total == resolveInventoryQuantity){
                                    complete = 1;
                                }else {
                                    complete = 0;
                                }
                            }

                            get.close();

                            String getDM = "select quantityResolve from damageMissingTransaction where bID = '"+bID+"'";
                            get = stmt.executeQuery(getDM);

                            while(get.next()){
                                int previousQuantityResolve = get.getInt("quantityResolve");
                                nowReturnQuantity = previousQuantityResolve + quantityReturned;
                            }
                            if (complete == 1) {
                                 condition = type.equalsIgnoreCase("Equipment") ? "Available" : "Complete";
                            } else {
                               condition = type.equalsIgnoreCase("Equipment") ? "Available" : "Incomplete";
                            }

                            if (resolveQuantity == 0){
                                 resolve = "Resolved";
                                 DMresolve = "Resolved";
                            } else {
                                 resolve = bCondition;
                                 DMresolve = "Unresolved";
                            }

                            String updateTransaq = "update borrowTransaction set bQuantityLoss = '"+resolveQuantity+"' , bCondition = '"+resolve+"' where bID = '"+bID+"' ";
                            String updateInventory = "update inventory set itemCurrentQuantity = '"+resolveInventoryQuantity+"', itemCondition = '"+condition+"' where itemKey = '"+iKey+"'";
                            String updateDMTransaq = "update damageMissingTransaction set quantityResolve = '"+nowReturnQuantity+"' , status = '"+DMresolve+"' where bID = '"+bID+"'" ;
                            stmt.execute(updateTransaq);
                            stmt.execute(updateInventory);
                            stmt.execute(updateDMTransaq);

                            String audit = "insert into audit values (NULL,'" + user + "' , '" + aDate + "','" + aTime + "','Resolved item " + iKey + "','Resolve Item','"+iKey+"')";
                            stmt.execute(audit);

                            response.sendRedirect("report/damagesMissing.jsp");
                }catch(Exception e){
                    e.printStackTrace();
                }

            }

        }

    }

}
