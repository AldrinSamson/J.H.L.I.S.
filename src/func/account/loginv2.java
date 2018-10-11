package func.account;

import bean.getBean;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.util.function.DoubleUnaryOperator;


@WebServlet("/loginv2")
public class loginv2 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Connection conn;
    Statement stmt;

    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String user, name, idNum , type ,aKey;
    String  iKey ;
    int CQ , TQ  , count  ;

    boolean chk = false;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            String aTime = df.format(new java.util.Date());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String aDate = sdf.format(new Date());
            List<String> iKey = new ArrayList<>();
            List<Double> CQ = new ArrayList<>();
            List<Double> TQ = new ArrayList<>();
            List<Long> Date = new ArrayList<>();

            try {
                Class.forName(MYclass);
                conn = DriverManager.getConnection(MYdburl);
                stmt = conn.createStatement();

                String query = "SELECT * FROM account where username=? and password=?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, user);
                ps.setString(2, pass);
                ResultSet rs = ps.executeQuery();
                chk = rs.next();

                if (chk) {

                    ResultSet getz;
                    String get = "select * from account where username = '" + user + "'";
                    getz = stmt.executeQuery(get);
                    while (getz.next()){
                        aKey = getz.getString("aKey");
                        type = getz.getString("aClass");

                    } getz.close();


                    // get data
                    String doCritical = "SELECT  COUNT(*) as rowss  from inventory ";
                    getz  = stmt.executeQuery(doCritical);
                    while(getz.next()) {
                        count = getz.getInt("rowss");
                    }
                    getz.close();

                    String doCritical2 = "SELECT * from inventory  ";
                    getz  = stmt.executeQuery(doCritical2);

                    int i = 0;
                    while(i < count){
                        getz.next();
                        String itemKey = getz.getString("itemKey");
                        iKey.add(itemKey);
                        double CurrentQuantity = getz.getInt("itemCurrentQuantity");
                        CQ.add(CurrentQuantity);
                        double TotalQuantity = getz.getInt("itemTotalQuantity");
                       TQ.add(TotalQuantity);

                        i++;
                    }


                    getz.close();
                    //end get data

                    //compare quantity
                    int x = 0 ;
                    while (x < iKey.size()){
                        double criticalTQ = TQ.get(x) * 0.25;
                        double nowQ = CQ.get(x);
                        String key = iKey.get(x);
                        if (criticalTQ >= nowQ){

                            String filterRecord = "select * from audit where date = '"+aDate+"' and actionID = '"+key+"'";
                            getz = stmt.executeQuery(filterRecord);
                            if (!getz.next()){
                                String criticalQ = "insert into audit values (NULL , '"+user+"' , '"+aDate+"' , '"+aTime+"' , 'Critical Quantity on "+key+"' , 'Critical' ,'"+key+"')";
                                stmt.execute(criticalQ);
                            }
                        }
                        x++;
                    }


                    HttpSession log = request.getSession(true);
                    log.setAttribute("user", user);
                    log.setAttribute("class", type);
                    log.setAttribute("aKey", aKey);

                    String audit = "insert into audit values (NULL,'"+user+"' , '"+aDate+"','"+aTime+"','Logged in','Login','N/A')";
                    stmt.execute(audit);

                    if (type.equals("Administrator")){
                    response.sendRedirect("dashboard.jsp");
                    }else {
                        response.sendRedirect("request/request.jsp");
                    }

                } else {
                    out.println("<html><body><script type='text/javascript'>alert('Invalid username or password!');location='index.html';</script></body></html>");
                }
                if (conn != null) {
                    conn.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

}
