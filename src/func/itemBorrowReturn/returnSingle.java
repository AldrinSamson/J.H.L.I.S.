package func.itemBorrowReturn;

import bean.getBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/returnSingle")
public class returnSingle extends HttpServlet {
    Connection con;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    Statement stmt;
    String itemCondition;
    String transaqCondition;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try(PrintWriter out =response.getWriter()) {
            String iKey = request.getParameter("iKey");
            String bReturn = request.getParameter("bReturn");
            String bMissing = request.getParameter("bMissing");
            String bBroken = request.getParameter("bBroken");

            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            String bETime = df.format(new Date());

            try {

                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmt = con.createStatement();

                if (bReturn != null){
                    itemCondition = "Available";
                    transaqCondition ="Returned";
                }else if(bMissing != null){
                    itemCondition = "Missing";
                    transaqCondition ="Lost";
                }else{
                    itemCondition = "Broken";
                    transaqCondition ="Broken";
                }

                String updateTransaq ="update borrowTransactions set bCondition ='"+transaqCondition+"', bETime ='"+bETime+"' where itemKey = '"+iKey+"' ";
                String updateInventory = "update inventory set itemCondition = '"+itemCondition+"' where itemKey = '"+iKey+"'";
                stmt.execute(updateInventory);
                stmt.execute(updateTransaq);

                out.println("<html><body><script type='text/javascript'>location='borrow.jsp';</script></body></html>");

                if (con != null) {
                    con.close();
                }

            }catch(Exception e){
                e.printStackTrace();
            }
        }

    }


}
