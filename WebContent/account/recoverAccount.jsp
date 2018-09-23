<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "java.sql.*"%>
<%@page import = "java.io.*"%>
<%@ page import = "bean.getBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>iForgotHuhu</title>

    <!-- Fontfaces CSS-->
    <link href="../css/font-face.css" rel="stylesheet" media="all">
    <link href="../vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="../vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="../vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="../vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="../vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="../vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="../vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="../vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="../vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="../vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="../vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="../css/theme.css" rel="stylesheet" media="all">

</head>
<% Connection con;
Statement stmt;
ResultSet get;
String getQ , getUser;
String MYdburl = getBean.getMyUrl();
String MYclass = getBean.getMyClass();
boolean chk=((Boolean) session.getAttribute("good")).booleanValue();

if( session.getAttribute("good") == null){
    out.println ("<html><body><script type='text/javascript'>alert('Invalid.');location='forgot-qa.jsp';</script></body></html>");
}else if (chk == false){
	out.println ("<html><body><script type='text/javascript'>alert('Invalid.');location='forgot-qa.jsp';</script></body></html>");
}

%>
<body class="animsition">
    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                           <h1>JHLIS</h1>  <br> University of Santo Tomas Junior High <br> Laboratory Inventory System
                        </div>
                        <%
                       
                    	
                    	try{
                    		Class.forName(MYclass);
                    		con = DriverManager.getConnection(MYdburl);
                    		stmt = con.createStatement();
                    		
                    		getUser = (String)session.getAttribute("forgotUser");
                    		
                    		getQ = "select * from account where username = '"+getUser+"'";
                    		get = stmt.executeQuery(getQ);
                    		
                    		while (get.next()){
                    		
                    	
                        
                        %>
                        
                        <div class="login-form">
                         Reset your password, <%= get.getString("aClass") %> <%= get.getString("aName") %> 
                            <form action="../changePass" method="post" >
                                <div class="form-group">
                               <input name ="user" value =<%=get.getString("username") %>><br>
                                   New Password:
                                    <input class="au-input au-input--full"  name="newPass" >
                                    Retype Password:
                                	 <input class="au-input au-input--full"  name="passChk" >
                                	 
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">Enter</button>
                                  
							</div>
                            </form>
                        
                        </div>
                        <%
                    		}
                    		session.invalidate();
                    	}catch (Exception e){
                        	
                        }
                    	
                    	
                        %>
                        
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="../vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="../vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="../vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="../vendor/slick/slick.min.js">
    </script>
    <script src="../vendor/wow/wow.min.js"></script>
    <script src="../vendor/animsition/animsition.min.js"></script>
    <script src="../vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="../vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="../vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="../vendor/circle-progress/circle-progress.min.js"></script>
    <script src="../vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="../vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="../vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="../js/main.js"></script>

</body>
</html>