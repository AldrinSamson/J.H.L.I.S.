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
import org.apache.commons.dbcp2.*;



@WebServlet("/loginv2")
public class loginv2 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Statement stmt;
    //BasicDataSource connectionPool;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String type ,aKey;
    int count  ;

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
            List<String> date = new ArrayList<>();

            try {

                //Connection pooling
                /*this.connectionPool = new BasicDataSource();
                Class.forName(getBean.getMyClass()).newInstance();
                connectionPool.setUrl(getBean.getDburl());
                connectionPool.setUsername(getBean.getDbuser());
                connectionPool.setPassword(getBean.getDbpass());
                connectionPool.setDriverClassName(getBean.getMyClass());
                connectionPool.setInitialSize(1);
                Connection conn = connectionPool.getConnection();*/

                Class.forName(MYclass);
                Connection conn = DriverManager.getConnection(MYdburl);
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
                        String dateX = getz.getString("itemDate");
                        date.add(dateX);
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

                            String filterRecord = "select * from audit where date = '"+aDate+"' and actionID = '"+key+"' and actionType = 'Critical Quantity'";
                            getz = stmt.executeQuery(filterRecord);
                            if (!getz.next()){
                                String criticalQ = "insert into audit values (NULL , '"+user+"' , '"+aDate+"' , '"+aTime+"' , 'Critical Quantity on "+key+"' , 'Critical Quantity' ,'"+key+"')";
                                stmt.execute(criticalQ);
                            }
                        }
                        x++;
                    }

                    // compare date
                    int z = 0 ;
                    while (z < iKey.size()){
                        if (date.get(z) == null){
                            z++;
                        }else {
                            String criticalYear = date.get(z).substring(0, 4);
                            String criticalMonth = date.get(z).substring(5, 7);
                            String currentYear = aDate.substring(0, 4);
                            String currentMonth = aDate.substring(5, 7);
                            if (criticalYear.equals(currentYear) && criticalMonth.equals(currentMonth)) {
                                String filterRecord = "select * from audit where date = '" + aDate + "' and actionID = '" + iKey.get(z) + "' and actionType = 'Critical Date'";
                                getz = stmt.executeQuery(filterRecord);
                                if (!getz.next()) {
                                    String criticalQ = "insert into audit values (NULL , '" + user + "' , '" + aDate + "' , '" + aTime + "' , 'Critical Date on " + iKey.get(z) + "' , 'Critical Date' ,'" + iKey.get(z) + "')";
                                    stmt.execute(criticalQ);
                                }
                            }
                            z++;
                        }


                    }

                    String audit = "insert into audit values (NULL,'"+user+"' , '"+aDate+"','"+aTime+"','Logged in','Login','N/A')";
                    stmt.execute(audit);

                    HttpSession log = request.getSession(true);
                    log.setAttribute("user", user);
                    log.setAttribute("class", type);
                    log.setAttribute("aKey", aKey);

                    if (type.equals("Administrator")){
                    response.sendRedirect("dashboard.jsp");
                    }else {
                        response.sendRedirect("request/request.jsp");
                    }

                } else {
                    out.println("<html><body><script type='text/javascript'>alert('Invalid username or password!');location='index.html';</script></body></html>");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

}
