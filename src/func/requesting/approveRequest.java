package func.requesting;

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

@WebServlet("/approveRequest")
public class approveRequest extends HttpServlet {

    Connection con;
    Statement stmtGet, stmtE;
    ResultSet get;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String user , prof;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try (PrintWriter out = response.getWriter()) {

            String mResponse = request.getParameter("response");
            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            String aTime = df.format(new java.util.Date());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String aDate = sdf.format(new Date());
            String rID = (String)request.getSession(false).getAttribute("rID");

            HttpSession session = request.getSession(false);
            if(session == null){
                out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='../index.html';</script></body></html>");
            }else {
                user = (String) request.getSession(false).getAttribute("user");


                try {
                    Class.forName(MYclass);
                    con = DriverManager.getConnection(MYdburl);
                    stmtGet = con.createStatement();
                    stmtE = con.createStatement();

                    String getProf = "select a.username from account a join request r on a.aKey = r.aKey where rID = '" + rID + "'";
                    get = stmtGet.executeQuery(getProf);

                    while (get.next()) {
                        prof = get.getString("username");
                    }

                    if (mResponse.equals("Approve")) {

                        String approve = "update request set rCondition = 'Approved' where rID = '" + rID + "'";
                        stmtE.execute(approve);
                        String audit = "insert into audit values (NULL,'" + user + "' , '" + aDate + "','" + aTime + "','" + user + " approved request of " + prof + " ','Approve Request','" + rID + "')";
                        stmtE.execute(audit);

                    } else if (mResponse.equals("Reject")) {

                        String reject = "update request set rCondition = 'Rejected'where rID = '" + rID + "'";
                        stmtE.execute(reject);
                        String audit = "insert into audit values (NULL,'" + user + "' , '" + aDate + "','" + aTime + "','" + user + " rejected request of " + prof + " ','Rejected Request','" + rID + "')";
                        stmtE.execute(audit);

                    } else {

                        String fulfill = "update request set rCondition = 'Approved' where rID = '" + rID + "'";
                        stmtE.execute(fulfill);
                        String audit = "insert into audit values (NULL,'" + user + "' , '" + aDate + "','" + aTime + "','" + user + " fulfilled request of " + prof + "','Fulfill Request','" + rID + "')";
                        stmtE.execute(audit);
                    }

                    out.println("<html><body><script type='text/javascript'>location='request/requestAdmin.jsp';</script></body></html>");

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
