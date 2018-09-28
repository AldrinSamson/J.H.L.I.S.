package func.manageSet;

import bean.getBean;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;


@WebServlet("/addSet")
public class addSet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    Connection con;
    Statement stmt , stmtE;
    ResultSet get;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String newKey ;
    int newNum ;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try (PrintWriter out = response.getWriter()) {

            String lab = request.getParameter("lab");
            String[] name = request.getParameterValues("name[]");
            String[] quantity = request.getParameterValues("quantity[]");
            String abbv ;
            List<String> nameList = new ArrayList<>();
            nameList.addAll(Arrays.asList(name));
            List<String> quantityList = new ArrayList<>();
            quantityList.addAll(Arrays.asList(quantity));

            if (lab.equals("Physics")){
                 abbv = "PHYS";
            }else
                 abbv = "CHEM";

            try {

                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmt = con.createStatement();
                stmtE = con.createStatement();

                String genKey = "select isNum from itemsetlist where isLab = '"+lab+"' order by isNum desc limit 1 ";
                get = stmt.executeQuery(genKey);

                while (get.next()){
                    int num = get.getInt("isNum");
                    newNum = ++num;
                    newKey = abbv+"-"+newNum;
                }

                int i = 0;
                while(i< nameList.size()){

                    String addGroup = "insert into itemsetgroup values ('"+nameList.get(i)+"', '"+newKey+"' , '"+quantityList.get(i)+"')";
                    stmtE.execute(addGroup);
                    i++;
                }

                String addList = "insert into itemsetlist values ('"+newKey+"','"+lab+"','"+newNum+"','Available')";
                stmtE.execute(addList);
            } catch (Exception e){
                e.printStackTrace();
            }

            out.println("<html><body><script type='text/javascript'>location='inventory/itemSets.jsp';</script></body></html>");
        }

    }
}
