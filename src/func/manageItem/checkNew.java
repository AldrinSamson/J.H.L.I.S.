package func.manageItem;

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

@WebServlet("/checkNew")
public class checkNew extends HttpServlet {

    Connection con;
    Statement stmt, stmtE;
    ResultSet chk, get;
    String getAbbv, codeE;
    int getNum, newNum;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    String itemNAbbv, itemFAbbv, newKey;
    int itemNum, newItemNum;
    int quantity = 0;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String sqlDate ="";
            String dateType = "";
            String condition = "";
            String name = request.getParameter("name");
            String quantityA = request.getParameter("quantity");
            String date = request.getParameter("date");
            String form = request.getParameter("form");
            String unit = request.getParameter("unit");
            String desc = request.getParameter("desc");
            String lab = request.getParameter("lab");
            String type = request.getParameter("type");

            if (desc.isEmpty()) {
                desc = "N/A";
            }

            if (date.isEmpty()) {
                sqlDate = "NULL";
            }else {
                sqlDate = "'"+date+"'";
            }

            if (unit == null){
                unit = "N/A";
            }

            if (quantityA == null){
                quantity = 1;
            }else {
                quantity = Integer.parseInt(quantityA);
            }

            if (type.equals("Equipment")) {
                dateType = "Calibration";
                condition = "Available";
                form = "N/A";
                itemFAbbv = "N/A";
            }
            if (type.equals("Apparatus")) {
                form = "N/A";
                itemFAbbv = "N/A";
                dateType = "N/A";
                condition = "Complete";
            }

            try {
                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmt = con.createStatement();

                String chkIfNew = "select itemNAbbv , itemFAbbv , itemNum from itemdetails where itemName = '" + name + "' and itemForm = '" + form + "' or itemName = '" + name + "' order by itemNum desc limit 1";
                chk = stmt.executeQuery(chkIfNew);

                if (chk.next()) {

                    if (type.equals("Consumable")) {

                        dateType = "Expiration";
                        condition = "OK";
                        get = stmt.executeQuery(chkIfNew);
                        while (get.next()) {

                            itemNAbbv = get.getString("itemNAbbv");
                            itemFAbbv = get.getString("itemFAbbv");
                            itemNum = get.getInt("itemNum");
                            newItemNum = ++itemNum;
                            newKey = itemNAbbv + "-" + itemFAbbv + "-" + newItemNum;
                        }

                    } else {

                        get = stmt.executeQuery(chkIfNew);
                        while (get.next()) {

                            itemNAbbv = get.getString("itemNAbbv");
                            itemNum = get.getInt("itemNum");
                            newItemNum = ++itemNum;
                            newKey = itemNAbbv + "-" + newItemNum;
                        }

                    }

                    String createNewExisting = "insert into itemdetails values ('" + newKey + "','" + name + "','" + form + "','" + type + "','" + desc + "','" + itemNAbbv + "','" + itemFAbbv + "','" + newItemNum + "','" + unit + "')";
                    String createNewExistingInventory = "insert into inventory values ('" + newKey + "','" + lab + "','" + quantity + "','" + quantity + "',"+sqlDate+",'" + dateType + "','" + condition + "')";
                    stmt.execute(createNewExisting);
                    stmt.execute(createNewExistingInventory);

                    if (lab.equalsIgnoreCase("Physics")) {
                        out.println("<html><body><script type='text/javascript'>;location='inventory/physics.jsp';</script></body></html>");
                    } else {
                        out.println("<html><body><script type='text/javascript'>location='inventory/chemistry.jsp';</script></body></html>");
                    }

                    //out.println("<html><body><script type='text/javascript'>alert('"+newKey+"');location='inventory/physics.jsp';</script></body></html>");

                } else {

                    if (date.equalsIgnoreCase("NULL")){
                        date = "";
                    }

                    getBean.setiName(name);
                    getBean.setiForm(form);
                    getBean.setiType(type);
                    getBean.setiDesc(desc);
                    getBean.setiDate(date);
                    getBean.setiDateType(dateType);
                    getBean.setiQuantity(quantity);
                    getBean.setiUnit(unit);
                    getBean.setiLab(lab);
                    getBean.setiCondition(condition);

                    //iKey code generator
                    //make name abbv
                    //get middle second
                    char first, middle, last;
                    first = name.charAt(0);
                    last = name.charAt(name.length() - 1);
                    if (name.length() % 2 == 0) {
                        middle = name.charAt(name.length() / 2 - 1 / 2);
                    } else {
                        middle = name.charAt(name.length() / 2 - 1);
                    }
                    String firstS = Character.toString(first);
                    String lastS = Character.toString(last);
                    String middleS = Character.toString(middle);
                    String abbvS = firstS + middleS + lastS;
                    String abbv1 = abbvS.toUpperCase();

                    // get 3rd
                    char first2, middle2, last2;
                    first2 = name.charAt(0);
                    middle2 = name.charAt(2);
                    last2 = name.charAt(name.length() - 1);

                    String firstS2 = Character.toString(first2);
                    String lastS2 = Character.toString(last2);
                    String middleS2 = Character.toString(middle2);
                    String abbvS2 = firstS2 + middleS2 + lastS2;
                    String abbv2 = abbvS2.toUpperCase();

                    // get 2rd
                    char first3, middle3, last3;
                    first3 = name.charAt(0);
                    middle3 = name.charAt(1);
                    last3 = name.charAt(name.length() - 1);

                    String firstS3 = Character.toString(first3);
                    String lastS3 = Character.toString(last3);
                    String middleS3 = Character.toString(middle3);
                    String abbvS3 = firstS3 + middleS3 + lastS3;
                    String abbv3 = abbvS3.toUpperCase();

                    getBean.setAbbv1(abbv1);
                    getBean.setAbbv2(abbv2);
                    getBean.setAbbv3(abbv3);
                    //end make name abbv

                    //make form abbv 
                    //get middle second abbv1
                    char firstF, middleF, lastF;

                    if (form.length() % 2 == 0) {
                        firstF = form.charAt(0);
                        middleF = form.charAt(form.length() / 2 - 1 / 2);
                        lastF = form.charAt(form.length() - 1);
                    } else {
                        firstF = form.charAt(0);
                        middleF = form.charAt(form.length() / 2 - 1);
                        lastF = form.charAt(form.length() - 1);

                    }
                    String firstSF = Character.toString(firstF);
                    String lastSF = Character.toString(lastF);
                    String middleSF = Character.toString(middleF);
                    String abbvSF = firstSF + middleSF + lastSF;
                    String form1 = abbvSF.toUpperCase();

                    // get 3rd abbv2
                    char firstF2, middleF2, lastF2;
                    firstF2 = form.charAt(0);
                    middleF2 = form.charAt(2);
                    lastF2 = form.charAt(form.length() - 1);

                    String firstSF2 = Character.toString(firstF2);
                    String lastSF2 = Character.toString(lastF2);
                    String middleSF2 = Character.toString(middleF2);
                    String abbvSF2 = firstSF2 + middleSF2 + lastSF2;
                    String form2 = abbvSF2.toUpperCase();

                    // get 2rd abbv3
                    char firstF3, middleF3, lastF3;
                    firstF3 = form.charAt(0);
                    middleF3 = form.charAt(1);
                    lastF3 = form.charAt(form.length() - 1);

                    String firstSF3 = Character.toString(firstF3);
                    String lastSF3 = Character.toString(lastF3);
                    String middleSF3 = Character.toString(middleF3);
                    String abbvSF3 = firstSF3 + middleSF3 + lastSF3;
                    String form3 = abbvSF3.toUpperCase();

                    getBean.setAbbvF1(form1);
                    getBean.setAbbvF2(form2);
                    getBean.setAbbvF3(form3);
                    //end make form abbv


                    if (lab.equalsIgnoreCase("Physics")) {

                        if (type.equalsIgnoreCase("Consumable")) {
                            out.println("<html><body><script type='text/javascript'>;location='inventory/physics.jsp#mNewC';</script></body></html>");
                        } else {
                            if(type.equalsIgnoreCase("Apparatus")) {
                                out.println("<html><body><script type='text/javascript'>;location='inventory/physics.jsp#mNewA';</script></body></html>");
                            }else{
                                out.println("<html><body><script type='text/javascript'>;location='inventory/physics.jsp#mNewE';</script></body></html>");
                            }
                        }
                    } else {
                        if (type.equalsIgnoreCase("Consumable")) {
                            out.println("<html><body><script type='text/javascript'>;location='inventory/chemistry.jsp#mNewC';</script></body></html>");
                        } else {
                            if(type.equalsIgnoreCase("Apparatus")) {
                                out.println("<html><body><script type='text/javascript'>;location='inventory/chemistry.jsp#mNewA';</script></body></html>");
                            }else{
                                out.println("<html><body><script type='text/javascript'>;location='inventory/chemistry.jsp#mNewE';</script></body></html>");
                            }
                        }
                    }

                    out.println("<html><body><script type='text/javascript'>alert('no such thing');location='inventory/physics.jsp';</script></body></html>");

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
