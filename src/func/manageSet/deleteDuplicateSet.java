package func.manageSet;

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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/deleteDuplicateSet")
public class deleteDuplicateSet extends HttpServlet {
    Connection conn;
    Statement stmt;
    ResultSet get;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    int count  , newNum, num;
    String setName , lab , abbv , newKey , isQuantity , name , itemKey;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String set = (String)request.getSession(false).getAttribute("set");
        String mResponse = request.getParameter("response");
        List<String> iKey = new ArrayList<>();
        List<String> quantityList = new ArrayList<>();

            try {
                Class.forName(MYclass);
                conn = DriverManager.getConnection(MYdburl);
                stmt = conn.createStatement();

                if (mResponse.equalsIgnoreCase("Delete")) {

                    String deleteGroup = "delete from itemsetgroup where isKey = '" + set + "'";
                    String deleteList = "delete from itemsetlist where isKey = '" + set + "'";

                    stmt.execute(deleteGroup);
                    stmt.execute(deleteList);

                    response.sendRedirect("inventory/itemSets.jsp");
                }else {

                    //getData
                    String getCount = "select count(*) as rowss  from itemsetgroup where isKey = '"+set+"'";
                    get = stmt.executeQuery(getCount);
                    while (get.next()) {
                        count = get.getInt("rowss");
                    }
                    get.close();

                    String getItems =  "select itemKey as kiss , isQuantity from itemsetgroup where isKey = '"+set+"'" ;
                    get = stmt.executeQuery(getItems);
                    get.next();

                    int i = 0 ;
                    while ( i < count){

                        itemKey = get.getString("kiss");
                        isQuantity = get.getString("isQuantity");
                        iKey.add(itemKey);
                        quantityList.add(isQuantity);
                        i++;
                    }
                    get.close();
                    //end getData

                    String getList = "select * from itemsetlist where  isKey = '"+set+"' ";
                    get = stmt.executeQuery(getList);
                    while (get.next()){
                        lab = get.getString("isLab");
                    }
                    get.close();


                    //genKey
                    String genKey = "select isNum as kiss , isName as kissu  from itemsetlist where isLab = '"+lab+"' order by isNum desc limit 1 ";
                    get = stmt.executeQuery(genKey);

                    if (lab.equals("Physics")){
                        abbv = "PHYS";
                    }else
                        abbv = "CHEM";

                    while (get.next()) {
                        name = get.getString("kissu");
                        num = get.getInt("kiss");
                        newNum = ++num;
                        newKey = abbv + "-" + newNum;
                    }
                    get.close();
                    // end genKey

                    char last = name.charAt(name.length() -1);
                    boolean chk = Character.isDigit(last);
                    if (!chk){
                        setName = name + "-1";
                    }else{
                        int x = Integer.parseInt(String.valueOf(last));
                        ++x;
                        String lastx = "-"+last;
                        String newNum = "-"+x;
                        setName = name.replace(lastx,newNum);
                    }

                    int y = 0;
                    while(y< iKey.size()){

                        String addGroup = "insert into itemsetgroup values ('"+ iKey.get(y)+"', '"+newKey+"' , '"+quantityList.get(y)+"')";
                        stmt.execute(addGroup);
                        y++;
                    }

                    String addList = "insert into itemsetlist values ('"+newKey+"','"+lab+"','"+newNum+"','Available' ,'"+setName+"')";
                    stmt.execute(addList);


                    response.sendRedirect("inventory/itemSets.jsp");
                }

                if (conn != null){
                    conn.close();
                }

            }catch (Exception e){
                e.printStackTrace();
            }

        }




}
