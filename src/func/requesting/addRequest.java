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

@WebServlet("/addRequest")
public class addRequest extends HttpServlet {

    Connection conn;
    Statement stmtCHK, stmtE;
    ResultSet chkRID, chkRUN;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String aKey , user;
    int newKey;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try (PrintWriter out = response.getWriter()) {

            String timeRequired = request.getParameter("time");
            String dateRequired = request.getParameter("date");
            String message = request.getParameter("message");
            String user = (String)request.getSession(false).getAttribute("user");
            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String bDate = sdf.format(new Date());
            String bSTime = df.format(new Date());


            try {

                Class.forName(MYclass);
                conn = DriverManager.getConnection(MYdburl);
                stmtCHK = conn.createStatement();
                stmtE = conn.createStatement();

                String getUser = "select * from account where username = '"+user+"'";
                chkRID = stmtCHK.executeQuery(getUser);



                    while (chkRID.next()){
                       aKey = chkRID.getString("aKey");
                    }

                    chkRID.close();
                    String getBID = "select rID from request order by rID desc limit 1";
                    chkRID = stmtCHK.executeQuery(getBID);
                    while(chkRID.next()){
                        int id = chkRID.getInt("rID");
                        newKey = id + 1;
                    }

                    String newRequest = "insert into request values ('"+newKey+"','"+aKey+"','"+message+"','"+bDate+"','"+bSTime+"','Pending','"+dateRequired+"' , '"+timeRequired+"' , NULL)";
                    stmtE.execute(newRequest);
                    String audit = "insert into audit values (NULL,'"+user+"' , '"+bDate+"','"+bSTime+"',' "+user+" sent a request','Send Request','"+newKey+"' )";
                    stmtE.execute(audit);

                out.println("<html><body><script type='text/javascript'>location='request/request.jsp';</script></body></html>");

            if (conn != null) {
                conn.close();
            }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        }

}
