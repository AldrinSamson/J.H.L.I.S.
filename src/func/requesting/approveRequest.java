package func.requesting;

import bean.getBean;

import javax.servlet.ServletException;
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

@WebServlet("/approveRequest")
public class approveRequest extends HttpServlet {

    Connection con;
    Statement stmtCHK, stmtE;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {

            String mResponse = request.getParameter("response");
            String rID = getBean.getrID();


            try {
                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmtCHK = con.createStatement();
                stmtE = con.createStatement();

                if (mResponse.equals("Approve")){

                    String approve = "update request set rCondition = 'Approved' where rID = '"+rID+"'";
                    stmtE.execute(approve);

                }else if (mResponse.equals("Reject")){

                    String reject = "update request set rCondition = 'Rejected',rStatus = 'Fulfilled' where rID = '"+rID+"'";
                    stmtE.execute(reject);

                }else {

                    String fulfill = "update request set rCondition = 'Approved' , rStatus = 'Fulfilled' where rID = '"+rID+"'";
                    stmtE.execute(fulfill);
                }

                out.println("<html><body><script type='text/javascript'>location='request/requestAdmin.jsp';</script></body></html>");

                if (con != null) {
                    con.close();
                }


            }catch (Exception e){
                e.printStackTrace();
            }
        }


    }


}
