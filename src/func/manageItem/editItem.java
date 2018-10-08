package func.manageItem;

import bean.getBean;

import javax.servlet.ServletException;
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

@WebServlet("/editItem")
public class editItem extends HttpServlet {

    Connection con;
    Statement stmt, stmtE;
    ResultSet chk, get ,chk1;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    int quantityA = 0;
    int quantityB = 0;
    int newITQ , newICQ;
    String lab;
    String type , user;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String sqlDate ="";
            String code = request.getParameter("code");
            String quantityT = request.getParameter("quantityT");
            String quantityC = request.getParameter("quantityC");
            String date = request.getParameter("date");
            String desc = request.getParameter("desc");
            String unit = request.getParameter("unit");
            String condi = request.getParameter("condi");
            String mResponse = request.getParameter("response");
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
            desc = desc == null ? "N/A" : desc;
            unit = unit == null  ? "N/A" : unit;
            quantityA = quantityT == null ? 1 : Integer.parseInt(quantityT);
            quantityB = quantityC == null ? quantityA : Integer.parseInt(quantityC);
            if (date == null){
                sqlDate = "NULL";
            } else if (date.equals("N/A")){
                sqlDate = "NULL";
            }else {
                sqlDate = "'"+date+"'";
            }

            try {

                Class.forName(MYclass);
                con = DriverManager.getConnection(MYdburl);
                stmt = con.createStatement();
                stmtE = con.createStatement();


                String getLabType = "select itemLab from inventory where itemKey = '"+code+"' ";
                chk = stmt.executeQuery(getLabType);

                if (chk.next()) {

                    String getType = "select i.itemLab as itemLab ,  d.itemType as itemType from inventory i join itemdetails d on i.itemKey = d.itemKey where i.itemKey ='"+code+"' ";
                    chk1 = stmtE.executeQuery(getType);

                    while (chk1.next()){
                        type = chk1.getString("itemType");
                        lab = chk1.getString("itemLab");
                    }

                    if (mResponse.equals("Add")) {

                        String getQuantity = "select itemTotalQuantity , itemCurrentQuantity from inventory where itemKey ='" + code + "'";
                        get = stmt.executeQuery(getQuantity);

                        while (get.next()) {

                            int iTQ = get.getInt("itemTotalQuantity");
                            int iCQ = get.getInt("itemCurrentQuantity");
                            newITQ = iTQ + quantityA;
                            newICQ = iCQ + quantityA;
                        }

                        if (type.equals("Calibration")) {
                            out.println("<html><body><script type='text/javascript'>alert('wtf no, i forbid it');location='inventory/physics.jsp';</script></body></html>");
                        } else {

                            String addItem = "update inventory set itemTotalQuantity = '" + newITQ + "', itemCurrentQuantity = '" + newICQ + "' where itemKey = '" + code + "'";
                            stmt.execute(addItem);
                            String audit = "insert into audit values (NULL,'"+user+"' , '"+aDate+"','"+aTime+"','Added Quantity to item "+code+"','Add Quantity to Item','N/A')";
                            stmtE.execute(audit);
                            if (lab.equalsIgnoreCase("Physics")) {
                                out.println("<html><body><script type='text/javascript'>;location='inventory/physics.jsp';</script></body></html>");
                            } else {
                                out.println("<html><body><script type='text/javascript'>location='inventory/chemistry.jsp';</script></body></html>");
                            }

                        }

                    } else if (mResponse.equals("Edit")) {

                        String editItem = "update itemdetails set itemDesc = '"+desc+"' , itemUnit = '"+unit+"' where itemKey = '"+code+"'";
                        String editItemInventory = "update inventory set itemTotalQuantity = '"+quantityA+"' , itemCurrentQuantity = '"+quantityB+"' , itemDate ="+sqlDate+" ,itemCondition ='"+condi+"' where itemKey = '"+code+"'";
                        stmt.execute(editItem);
                        stmt.execute(editItemInventory);
                        String audit = "insert into audit values (NULL,'"+user+"' , '"+aDate+"','"+aTime+"','Edited item "+code+"','Edited Item','N/A')";
                        stmtE.execute(audit);
                        if (lab.equalsIgnoreCase("Physics")) {
                            out.println("<html><body><script type='text/javascript'>;location='inventory/physics.jsp';</script></body></html>");
                        } else {
                            out.println("<html><body><script type='text/javascript'>location='inventory/chemistry.jsp';</script></body></html>");
                        }

                    } else {

                        String deleteItem = "delete i , d from inventory i join itemdetails d on i.itemKey = d.itemKey where i.itemKey = '"+code+"' ";
                        stmt.execute(deleteItem);
                        String audit = "insert into audit values (NULL,'"+user+"' , '"+aDate+"','"+aTime+"','Deleted item "+code+"','Deleted Item','N/A')";
                        stmtE.execute(audit);
                        if (lab.equalsIgnoreCase("Physics")) {
                            out.println("<html><body><script type='text/javascript'>;location='inventory/physics.jsp';</script></body></html>");
                        } else {
                            out.println("<html><body><script type='text/javascript'>location='inventory/chemistry.jsp';</script></body></html>");
                        }

                    }

                } else {
                    out.println("<html><body><script type='text/javascript'>alert('wtf no, i forbid it');location='inventory/physics.jsp';</script></body></html>");
                }

                if (con != null) {
                    con.close();
                }

            }catch(Exception e){
                e.printStackTrace();
            }

        }

    }

}
