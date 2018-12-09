package func.manageItem;

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

@WebServlet("/addNew")
public class addNew extends HttpServlet {

    Connection con;
    Statement stmtCHK, stmtE;
    ResultSet chk;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    int itemNum =1;
    int quantity = 0;
    String user;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String name = request.getParameter("name");
            String quantityA = request.getParameter("quantity");
            String date = request.getParameter("date");
            String form = request.getParameter("form");
            String unit = request.getParameter("unit");
            String desc = request.getParameter("desc");
            String lab = request.getParameter("lab");
            String type = request.getParameter("type");
            String abbv = request.getParameter("abbv");
            String fAbbv =request.getParameter("fAbbv");
            String newKey = "";
            String dateType = "";
            String condition = "";
            DateFormat df = new SimpleDateFormat("HH:mm:ss");
            String aTime = df.format(new java.util.Date());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String aDate = sdf.format(new Date());

            HttpSession session = request.getSession(false);
            if(session == null){
                out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='../index.html';</script></body></html>");
            }else {
                user = (String) request.getSession(false).getAttribute("user");


                // Value validation
                newKey = type.equalsIgnoreCase("Consumable") ? abbv + "-" + fAbbv + "-1" : abbv + "-1";
                if (desc == null) {
                    desc = "N/A";
                } else if (desc.isEmpty()) {
                    desc = "N/A";
                }
                if (date == null) {
                    date = "NULL";
                } else if (date.isEmpty()) {
                    date = "NULL";
                } else if (date.equalsIgnoreCase("N/A")) {
                    date = "NULL";
                } else {
                    date = "'" + date + "'";
                }
                unit = unit == null ? "N/A" : unit;
                quantity = quantityA == null ? 1 : Integer.parseInt(quantityA);

                if (type.equals("Equipment")) {
                    dateType = "Calibration";
                    condition = "Available";
                    form = "N/A";
                    fAbbv = "N/A";
                } else if (type.equals("Apparatus")) {
                    form = "N/A";
                    fAbbv = "N/A";
                    dateType = "N/A";
                    condition = "Complete";
                    unit = "Piece";
                } else {
                    dateType = "Expiration";
                    condition = "OK";
                }



                try {
                    Class.forName(MYclass);
                    con = DriverManager.getConnection(MYdburl);
                    stmtCHK = con.createStatement();
                    stmtE = con.createStatement();

                    String z;
                    if (type.equals("Consumable") & form == null) {
                        z = "and itemType = 'Consumable'";
                    } else {
                        z = "";
                    }

                    String chkIfNew = "select itemNAbbv , itemFAbbv from itemdetails where itemName = '" + name + "' and itemForm = '" + form + "' and itemType = '" + type + "' or itemName = '" + name + "' " + z + " ";
                    chk = stmtCHK.executeQuery(chkIfNew);

                    if (chk.next()) {

                        // code layout already in use
                        if (lab.equalsIgnoreCase("Physics")) {

                            if (type.equalsIgnoreCase("Consumable")) {
                                out.println("<html><body><script type='text/javascript'>alert('Code layout already in use. Please choose another one');location='inventory/physics.jsp#mNewC';</script></body></html>");
                            } else {
                                if (type.equalsIgnoreCase("Apparatus")) {
                                    out.println("<html><body><script type='text/javascript'>alert('Code layout already in use. Please choose another one');location='inventory/physics.jsp#mNewA';</script></body></html>");
                                } else {
                                    out.println("<html><body><script type='text/javascript'>alert('Code layout already in use. Please choose another one');location='inventory/physics.jsp#mNewE';</script></body></html>");
                                }
                            }
                        } else {
                            if (type.equalsIgnoreCase("Consumable")) {
                                out.println("<html><body><script type='text/javascript'>alert('Code layout already in use. Please choose another one')location='inventory/chemistry.jsp#mNewC';</script></body></html>");
                            } else {
                                if (type.equalsIgnoreCase("Apparatus")) {
                                    out.println("<html><body><script type='text/javascript'>alert('Code layout already in use. Please choose another one');location='inventory/chemistry.jsp#mNewA';</script></body></html>");
                                } else {
                                    out.println("<html><body><script type='text/javascript'>alert('Code layout already in use. Please choose another one');location='inventory/chemistry.jsp#mNewE';</script></body></html>");
                                }
                            }
                        }

                    } else {

                        String createNewExisting = "insert into itemdetails values ('" + newKey + "','" + name + "','" + form + "','" + type + "','" + desc + "','" + abbv + "','" + fAbbv + "','" + itemNum + "','" + unit + "')";
                        String createNewExistingInventory = "insert into inventory values ('" + newKey + "','" + lab + "','" + quantity + "','" + quantity + "'," + date + ",'" + dateType + "','" + condition + "')";
                        stmtE.execute(createNewExisting);
                        stmtE.execute(createNewExistingInventory);

                        String audit = "insert into audit values (NULL,'" + user + "' , '" + aDate + "','" + aTime + "','Added item " + newKey + "','Add Item','N/A')";
                        stmtE.execute(audit);

                        if (lab.equalsIgnoreCase("Physics")) {
                            out.println("<html><body><script type='text/javascript'>;location='inventory/physics.jsp';</script></body></html>");
                        } else {
                            out.println("<html><body><script type='text/javascript'>location='inventory/chemistry.jsp';</script></body></html>");
                        }
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


}
