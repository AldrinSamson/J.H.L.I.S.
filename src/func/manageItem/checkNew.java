package func.manageItem;

import bean.getBean;

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

@WebServlet("/checkNew")
public class checkNew extends HttpServlet {

    Connection con;
    Statement stmt;
    ResultSet chk, get;
    String MYclass = getBean.getMyClass();
    String itemNAbbv, itemFAbbv, newKey;
    int itemNum, newItemNum;
    int quantity = 0;
    String MYdburl = getBean.getMyUrl();
    String user;

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
            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            String aTime = df.format(new java.util.Date());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String aDate = sdf.format(new Date());

            if(request.getSession(false).getAttribute("user") == null){
                out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='../index.html';</script></body></html>");
            }else {
                user = (String)request.getSession(false).getAttribute("user");
            }

            // Value validation
            if (desc == null){
                desc = "N/A";
            }else if (desc.isEmpty()){
                desc = "N/A";
            }
            if (date == null){
                sqlDate = "NULL";
            }else if (date.isEmpty()){
                sqlDate = "NULL";
            }else {
                sqlDate = "'"+date+"'";
            }
            unit = unit == null  ? "N/A" : unit;
            quantity = quantityA == null ? 1 : Integer.parseInt(quantityA);

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

                String z;
                if (type.equals("Consumable")& form == null){
                     z = "and itemType = 'Consumable'";
                }else {
                    z = "";
                }

                String chkIfNew = "select itemNAbbv , itemFAbbv , itemNum from itemdetails where itemName = '" + name + "' and itemForm = '" + form + "' and itemType = '"+type+"' or itemName = '" + name + "' "+z+" order by itemNum desc limit 1";
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

                    String audit = "insert into audit values (NULL,'"+user+"' , '"+aDate+"','"+aTime+"','Added item "+newKey+"','Add Item','N/A')";
                    stmt.execute(audit);

                    if (lab.equalsIgnoreCase("Physics")) {
                        out.println("<html><body><script type='text/javascript'>;location='inventory/physics.jsp';</script></body></html>");
                    } else {
                        out.println("<html><body><script type='text/javascript'>location='inventory/chemistry.jsp';</script></body></html>");
                    }

                    //out.println("<html><body><script type='text/javascript'>alert('"+newKey+"');location='inventory/physics.jsp';</script></body></html>");

                } else {

                    //iKey code generator
                    String namex = name.trim().replaceAll("\\s", "");
                    //make name abbv
                    //get middle second
                    char first, middle, last;
                    first = namex.charAt(0);
                    last = namex.charAt(namex.length() - 1);
                    if (namex.length() % 2 == 0) {
                        middle = namex.charAt(namex.length() / 2 - 1 / 2);
                    } else {
                        middle = namex.charAt(namex.length() / 2 - 1);
                    }
                    String firstS = Character.toString(first);
                    String lastS = Character.toString(last);
                    String middleS = Character.toString(middle);
                    String abbvS = firstS + middleS + lastS;
                    String abbv1 = abbvS.toUpperCase();

                    // get 3rd
                    char first2, middle2, last2;
                    first2 = namex.charAt(0);
                    middle2 = namex.charAt(2);
                    last2 = namex.charAt(namex.length() - 1);

                    String firstS2 = Character.toString(first2);
                    String lastS2 = Character.toString(last2);
                    String middleS2 = Character.toString(middle2);
                    String abbvS2 = firstS2 + middleS2 + lastS2;
                    String abbv2 = abbvS2.toUpperCase();

                    // get 2rd
                    char first3, middle3, last3;
                    first3 = namex.charAt(0);
                    middle3 = namex.charAt(1);
                    last3 = namex.charAt(namex.length() - 1);

                    String firstS3 = Character.toString(first3);
                    String lastS3 = Character.toString(last3);
                    String middleS3 = Character.toString(middle3);
                    String abbvS3 = firstS3 + middleS3 + lastS3;
                    String abbv3 = abbvS3.toUpperCase();

                    //end make name abbv

                    //make form abbv 
                    //get middle second abbv1
                    String formx = form.trim().replaceAll("\\s", "");

                    char firstF, middleF, lastF;

                    if (formx.length() % 2 == 0) {
                        firstF = formx.charAt(0);
                        middleF = formx.charAt(formx.length() / 2 - 1 / 2);
                        lastF = formx.charAt(formx.length() - 1);
                    } else {
                        firstF = formx.charAt(0);
                        middleF = formx.charAt(formx.length() / 2 - 1);
                        lastF = formx.charAt(formx.length() - 1);

                    }
                    String firstSF = Character.toString(firstF);
                    String lastSF = Character.toString(lastF);
                    String middleSF = Character.toString(middleF);
                    String abbvSF = firstSF + middleSF + lastSF;
                    String form1 = abbvSF.toUpperCase();

                    // get 3rd abbv2
                    char firstF2, middleF2, lastF2;
                    firstF2 = formx.charAt(0);
                    middleF2 = formx.charAt(2);
                    lastF2 = formx.charAt(form.length() - 1);

                    String firstSF2 = Character.toString(firstF2);
                    String lastSF2 = Character.toString(lastF2);
                    String middleSF2 = Character.toString(middleF2);
                    String abbvSF2 = firstSF2 + middleSF2 + lastSF2;
                    String form2 = abbvSF2.toUpperCase();

                    // get 2rd abbv3
                    char firstF3, middleF3, lastF3;
                    firstF3 = formx.charAt(0);
                    middleF3 = formx.charAt(1);
                    lastF3 = formx.charAt(formx.length() - 1);

                    String firstSF3 = Character.toString(firstF3);
                    String lastSF3 = Character.toString(lastF3);
                    String middleSF3 = Character.toString(middleF3);
                    String abbvSF3 = firstSF3 + middleSF3 + lastSF3;
                    String form3 = abbvSF3.toUpperCase();

                    //end make form abbv

                    //set to session
                    HttpSession log = request.getSession(false);
                    log.setAttribute("itemName", name);
                    log.setAttribute("itemForm" ,form);
                    log.setAttribute("itemQuantity", quantityA);
                    log.setAttribute("itemDate" , date);
                    log.setAttribute("itemUnit" , unit);
                    log.setAttribute("itemDesc",desc);
                    log.setAttribute("itemLab" , lab);
                    log.setAttribute("type" , type);
                    log.setAttribute("itemAbbv1" , abbv1);
                    log.setAttribute("itemAbbv2", abbv2);
                    log.setAttribute("itemAbbv3" , abbv3);
                    log.setAttribute("itemFAbbv1" , form1);
                    log.setAttribute("itemFAbbv2" , form2);
                    log.setAttribute("itemFAbbv3" , form3);




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
