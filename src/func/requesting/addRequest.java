package func.requesting;

import bean.getBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/addRequest")
public class addRequest extends HttpServlet {

    Connection conn;
    Statement stmtCHK, stmtE;
    ResultSet chkRID, chkRUN;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
