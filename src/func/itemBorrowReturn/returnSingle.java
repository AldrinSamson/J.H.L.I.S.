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

@WebServlet("/returnSingle")
public class returnSingle extends HttpServlet {
    Connection con;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    Statement stmt;
    ResultSet get;
    int nowReturnQuantity , newReturnQuantity ;
    String type;
    String condition;
    String transaqCondition = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String iKey = request.getParameter("iKey");
            String rResponse = request.getParameter("response");
            String bID = request.getParameter("bID");
            int bQ = Integer.parseInt(request.getParameter("bQ"));

            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            String bETime = df.format(new Date());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String bEDate = sdf.format(new Date());

            try {

                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmt = con.createStatement();

                String getDetails = "select itemType from itemdetails where itemKey = '"+iKey+"' ";
                get = stmt.executeQuery(getDetails);

                while (get.next()){
                    type = get.getString("itemType");
                } get.close();


                String getBID = "select * from borrowtransaction where bID = '"+bID+"'";
                get = stmt.executeQuery(getBID);

                while (get.next()){
                    nowReturnQuantity = get.getInt("bQuantity");
                }
                get.close();

                if (rResponse.equals("Return")) {

                    if(type.equalsIgnoreCase("Equipment")){
                        condition = "Available";
                    }else if (type.equalsIgnoreCase("Apparatus")){
                        condition = "Complete";
                    }else {
                        condition = "OK";
                    }

                    String updateTransaction = "update borrowtransaction set bCondition = 'Returned' , bEDate = '"+bEDate+"' , bETime = '"+bETime+"'  bQuantityLoss = '0' where bID = '"+bID+"'";
                    stmt.execute(updateTransaction);
                    String updateInventory = "";
                }
                if (rResponse.equals("Missing")) {

                }
                if (rResponse.equals("Broken")) {

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
