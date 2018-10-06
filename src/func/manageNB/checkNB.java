package func.manageNB;

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


@WebServlet("/checkNB")
public class checkNB extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Connection con;
    Statement stmt, stmtE;
    ResultSet chk, get;
    String getAbbv, codeN;
    int getNum, newNum;

    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String user;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String nLab = request.getParameter("nLab");
            String nName = request.getParameter("nName");
            String nDesc = request.getParameter("nDesc");
            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            String aTime = df.format(new java.util.Date());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String aDate = sdf.format(new Date());

            if(request.getSession(false).getAttribute("user") == null){
                out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='../index.html';</script></body></html>");
            }else {
                user = (String)request.getSession(false).getAttribute("user");
            }

            if (nDesc.isEmpty() == true) {

                nDesc = "N/A";
            }

            getBean.setnName(nName);
            getBean.setnLab(nLab);
            getBean.setnDesc(nDesc);

            try {
                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmt = con.createStatement();
                stmtE = con.createStatement();

                String chkName = "select * from nonborrowable where nName = '" + nName + "'";
                chk = stmt.executeQuery(chkName);

                if (chk.next() == true) {

                    String getData = "select nAbbv , nNum from nonborrowable where nName = '" + nName + "'order by nNum desc limit 1";
                    get = stmt.executeQuery(getData);

                    while (get.next()) {
                        getAbbv = get.getString("nAbbv");
                        getNum = get.getInt("nNum");
                        newNum = getNum + 1;
                    }
                    codeN = getAbbv + "-" + newNum;

                    String addNB = "insert into nonborrowable values ('" + codeN + "','" + nName + "', '" + newNum + "','" + getAbbv + "','" + nDesc + "','" + nLab + "','OK')";

                    stmtE.execute(addNB);

                    String audit = "insert into audit values (NULL,'"+user+"' , '"+aDate+"','"+aTime+"','Added item "+codeN+"','Add Item','N/A')";
                    stmtE.execute(audit);

                    out.println("<html><body><script type='text/javascript'>alert('item added ');location='nonBorrowable.jsp';</script></body></html>");


                } else {
                    //get middle second abbv1
                    char first, middle, last;

                    if (nName.length() % 2 == 0) {
                        first = nName.charAt(0);
                        middle = nName.charAt(nName.length() / 2 - 1 / 2);
                        last = nName.charAt(nName.length() - 1);
                    } else {
                        first = nName.charAt(0);
                        middle = nName.charAt(nName.length() / 2 - 1);
                        last = nName.charAt(nName.length() - 1);

                    }
                    String firstS = Character.toString(first);
                    String lastS = Character.toString(last);
                    String middleS = Character.toString(middle);
                    String abbvS = firstS + middleS + lastS;
                    String abbv1 = abbvS.toUpperCase();

                    // get 3rd abbv2
                    char first2, middle2, last2;
                    first2 = nName.charAt(0);
                    middle2 = nName.charAt(2);
                    last2 = nName.charAt(nName.length() - 1);

                    String firstS2 = Character.toString(first2);
                    String lastS2 = Character.toString(last2);
                    String middleS2 = Character.toString(middle2);
                    String abbvS2 = firstS2 + middleS2 + lastS2;
                    String abbv2 = abbvS2.toUpperCase();

                    // get 2rd abbv3
                    char first3, middle3, last3;
                    first3 = nName.charAt(0);
                    middle3 = nName.charAt(1);
                    last3 = nName.charAt(nName.length() - 1);

                    String firstS3 = Character.toString(first3);
                    String lastS3 = Character.toString(last3);
                    String middleS3 = Character.toString(middle3);
                    String abbvS3 = firstS3 + middleS3 + lastS3;
                    String abbv3 = abbvS3.toUpperCase();

                    getBean.setAbbvN1(abbv1);
                    getBean.setAbbvN2(abbv2);
                    getBean.setAbbvN3(abbv3);

                    out.println("<html><body><script type='text/javascript'>location='nonBorrowable.jsp#mNCode';</script></body></html>");
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
