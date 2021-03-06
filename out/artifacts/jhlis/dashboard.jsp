<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import = "java.sql.*"%>
<%@page import = "java.io.*"%>
<%@ page import = "bean.getBean"%>
<%@ page import="javax.swing.plaf.nimbus.State" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   

    <!-- Title Page-->
    <title>Dashboard</title>

    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
    <link href="vendor/datatables/datatables.min.css" rel="stylesheet" media="all">
    <link href="vendor/datatables/datatables.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">
</head>
<body class="animsition">
<!-- declarations -->
<%
    Connection con;
    Statement stmt;
    ResultSet rs, get, counter;
    String getQ, getUser, query;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    Class.forName(MYclass);
    con = DriverManager.getConnection(MYdburl);
    stmt = con.createStatement();

    String message = getBean.getrMessage();
%>
    <div class="page-wrapper">
                        <!-- HEADER MOBILE-->
        <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <a class="logo" href="dashboard.jsp">
                           <h1>JHLIS</h1>
                        </a>
                        <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <nav class="navbar-mobile">
                <div class="container-fluid">
                    <ul class="navbar-mobile__list list-unstyled">
                       
                       <li >
                            <a href="dashboard.jsp">
                               <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                        </li>
                         <li>
                            <a href="borrow/borrow.jsp">
                                <i class="fas fa-flask"></i>Item Borrow/Return</a>
                        </li>
                          <li class="has-sub">
                            <a class="js-arrow" href="#">
                                 <i class="fas fa-table"></i>Laboratory Item Management</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="inventory/physics.jsp">Physics Laboratory</a>
                                </li>
                                <li>
                                    <a href="inventory/chemistry.jsp">Chemistry Laboratory</a>
                                </li>
                                <li>
                                    <a href="inventory/itemSets.jsp">Item Sets</a>
                                </li>
                                 <li>
                                    <a href="inventory/nonBorrowable.jsp">Non-Borrowable</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                 <i class="fas fa-chart-bar"></i>Reports</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="report/inventory.jsp">Inventory Manifest</a>
                                </li>
                                <li>
                                    <a href="report/borrowTransaction.jsp">Borrowing Transactions</a>
                                </li>
                                <li>
                                    <a href="report/request.jsp">Request Reports</a>
                                </li>
                                <li>
                                    <a href="report/damages.jsp">Damage Reports</a>
                                </li>
                                 <li>
                                    <a href="report/missing.jsp">Missing Item Reports</a>
                                </li>
                                 <li>
                                    <a href="report/insights.jsp">Insights</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="requestAdmin.jsp">
                                <i class="far fa-check-square"></i>Requests</a>
                        </li>
                       
                        
                        <li>
                            <a href="account/account.jsp">
                                <i class="fas fa-users"></i>Account Management</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="dashboard.jsp">
                <h1>JHLIS</h1>
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                      
                       <li >
                            <a href="dashboard.jsp">
                               <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                        </li>
                         <li>
                            <a href="borrow/borrow.jsp">
                                <i class="fas fa-flask"></i>Item Borrow/Return</a>
                        </li>
                          <li class="has-sub">
                            <a class="js-arrow" href="#">
                                 <i class="fas fa-table"></i>Laboratory Item Management</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="inventory/physics.jsp">Physics Laboratory</a>
                                </li>
                                <li>
                                    <a href="inventory/chemistry.jsp">Chemistry Laboratory</a>
                                </li>
                                <li>
                                    <a href="inventory/itemSets.jsp">Item Sets</a>
                                </li>
                                 <li>
                                    <a href="inventory/nonBorrowable.jsp">Non-Borrowable</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                 <i class="fas fa-chart-bar"></i>Reports</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="report/inventory.jsp">Inventory Manifest</a>
                                </li>
                                <li>
                                    <a href="report/borrowTransaction.jsp">Borrowing Transactions</a>
                                </li>
                                <li>
                                    <a href="report/request.jsp">Request Reports</a>
                                </li>
                                <li>
                                    <a href="report/damages.jsp">Damage Reports</a>
                                </li>
                                 <li>
                                    <a href="report/missingR.jsp">Missing Item Reports</a>
                                </li>
                                 <li>
                                    <a href="report/insights.jsp">Analytics</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="requestAdmin.jsp">
                                <i class="far fa-check-square"></i>Requests</a>
                        </li>
                       
                        
                        <li>
                            <a href="account/account.jsp">
                                <i class="fas fa-users"></i>Account Management</a>
                        </li>
                       
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            
                            <div class="header-button">
                        <% 
                        	try{
                    		Class.forName(MYclass);
                    		con = DriverManager.getConnection(MYdburl);
                    		stmt = con.createStatement();
                    		
                    		getUser = (String)session.getAttribute("user");
                    		
                    		getQ = "select * from account where username = '"+getUser+"'";
                    		get = stmt.executeQuery(getQ);
                    		
                    		while (get.next()){
                    		
                    	
                        
                        %>
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                  
                                        <div class="content">
                                            <a class="js-acc-btn" href="#">Hello, <%= get.getString("aClass") %> <%= get.getString("aName") %> </a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <a href="#">
                                                        <img src="images/icon/avatar-01.jpg" alt="John Doe" />
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="#"><%= get.getString("username") %> </a>
                                                    </h5>
                                                    <span class="email"><%= get.getString("aID") %> </span>
                                                </div>
                                            </div>
                                          
                                            <div class="account-dropdown__footer">
                                                <a href="#">
                                                    <i class="zmdi zmdi-power"></i>Logout</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        <%
                    		}
                    	}catch (Exception e){
                        	
                        }
                    	
                    	
                        %>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <%
                                        try{
                                            String queryx= "select count(itemCurrentQuantity) as count from inventory where itemCurrentQuantity <> itemTotalQuantity and itemCondition <> 'Broken' and itemCondition <> 'Missing'";
                                            rs = stmt.executeQuery(queryx);

                                            while (rs.next()){

                                    %>
                                    <h2 class="number"><%=rs.getString("count")%></h2>
                                    <%}
                                        }catch(Exception e){
                                            e.printStackTrace();
                                        }
                                    %>
                                    <span class="desc">Equipment Lent</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <h2 class="number">Next Time</h2>
                                    <span class="desc">Critical</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-shopping-cart"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <%
                                        try{
                                            String queryx= "select count(rID) as count from request where rCondition = 'Pending'";
                                            rs = stmt.executeQuery(queryx);

                                            while (rs.next()){

                                    %>
                                    <h2 class="number"><%=rs.getString("count")%></h2>
                                    <%}
                                    }catch(Exception e){
                                        e.printStackTrace();
                                    }
                                    %>
                                    <span class="desc">Requests Pending</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-calendar-note"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <%
                                        try{
                                            String queryx= "select count(itemCurrentQuantity) as count from inventory where itemCurrentQuantity <> itemTotalQuantity and itemCondition = 'Broken' or itemCondition = 'Missing'";
                                            rs = stmt.executeQuery(queryx);

                                            while (rs.next()){

                                    %>
                                    <h2 class="number"><%=rs.getString("count")%></h2>
                                    <%}
                                    }catch(Exception e){
                                        e.printStackTrace();
                                    }
                                    %>
                                    <span class="desc">Damaged/Missing</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-money"></i>
                                    </div>
                                </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card text-left" id="ptab-marg">
                                    <div class="card-header">
                                        <h3 class="card-title"> Requests </h3>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-borderless table-striped table-earning" id = "rTable">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Date</th>
                                                <th>Time</th>
                                                <th>Condition</th>
                                                <th>Status</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                                try {


                                                    query = "SELECT r.*, a.* from request r join account a on r.aKey = a.aKey ";
                                                    rs = stmt.executeQuery(query);

                                                    while(rs.next()){
                                            %>
                                            <tr data-toggle="modal" id="mRView">
                                                <td><%=rs.getString("rID")%>
                                                </td>
                                                <td><%=rs.getString("aClass")%> <%=rs.getString("aName")%>
                                                </td>
                                                <td><%=rs.getString("rDate")%>
                                                </td>
                                                <td><%=rs.getString("rTime")%>
                                                </td>
                                                <td><%=rs.getString("rCondition") %>
                                                </td>
                                                <td><%=rs.getString("rStatus")%>
                                                </td>

                                            </tr>
                                            <%
                                                    }
                                                }catch (Exception e){
                                                    e.printStackTrace();
                                                }
                                            %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                                  
                      <section>
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-8">
                                <!-- RECENT REPORT 2-->
                                <div class="recent-report2">
                                    <h3 class="title-3">Demo Descriptive Analytics</h3>
                                    <div class="chart-info">
                                        <div class="chart-info__left">
                                            <div class="chart-note">
                                                <span class="dot dot--blue"></span>
                                                <span>Breakage</span>
                                            </div>
                                            <div class="chart-note">
                                                <span class="dot dot--green"></span>
                                                <span>Missing</span>
                                            </div>
                                        </div>
                                        <div class="chart-info-right">
                                            <div class="rs-select2--dark rs-select2--md m-r-10">
                                                <select class="js-select2" name="property">
                                                    <option selected="selected">All Properties</option>
                                                    <option value="">Breakage</option>
                                                    <option value="">Missing</option>
                                                </select>
                                                <div class="dropDownSelect2"></div>
                                            </div>
                                            <div class="rs-select2--dark rs-select2--sm">
                                                <select class="js-select2 au-select-dark" name="time">
                                                    <option selected="selected">All Time</option>
                                                    <option value="">By Month</option>
                                                    <option value="">By Day</option>
                                                </select>
                                                <div class="dropDownSelect2"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="recent-report__chart">
                                        <canvas id="recent-rep2-chart"></canvas>
                                    </div>
                                </div>
                                <!-- END RECENT REPORT 2             -->
                            </div>
                            <div class="col-xl-4">
                                <!-- TASK PROGRESS-->
                                <div class="task-progress">
                                    <h3 class="title-3">#myDevProgress</h3>
                                    <div class="au-skill-container">
                                        <div class="au-progress">
                                            <span class="au-progress__title">Management Modules</span>
                                            <div class="au-progress__bar">
                                                <div class="au-progress__inner js-progressbar-simple" role="progressbar" data-transitiongoal="30">
                                                    <span class="au-progress__value js-value"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="au-progress">
                                            <span class="au-progress__title">Functional Modules</span>
                                            <div class="au-progress__bar">
                                                <div class="au-progress__inner js-progressbar-simple" role="progressbar" data-transitiongoal="15">
                                                    <span class="au-progress__value js-value"></span>
                                                </div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                </div>
                                <!-- END TASK PROGRESS-->
                            </div>
                        </div>
                    </div>
                </div>
            </section>

                      
                      
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->

<!-- Add Equipment Modal -->
<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mRView" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"><h4>New Equipment</h4></div>
            <form action="../checkNew" method="post">

                <div class="modal-body">

		<pre class="tab">
        <table class="table table-borderless table-earning" style="border-spacing:20px">
            <tr>
                <td><label class="label-modal">Name</label></td>
                <td><input type="text" name="name" class="input-modal" list="nameR"></td>
            </tr><br>
            <tr>
                <td><label class="label-modal">Description</label></td>
                <td><input type="text" name="desc" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Calibration date</label></td>
                <td><input type="text" name="date" class="input-modal--date" placeholder="yy/mm/dd"></td>
            </tr>
        </table>
		</pre>
                </div>
                <div class="modal-footer">
                    <input type="text" name="type" class="input-modal" value="Equipment" hidden>
                    <input type="text" name="lab" class="input-modal" value="Physics" hidden>
                    <input type="submit" class="btn btn-default btn-md" value="Add">
                    <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- View Request Modal -->
<div class="modal fade" id="message" tabindex="-1" role="dialog" aria-hidden="true"  >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"><h4>Message</h4></div>
            <form action="../showMessage" method="post">

                <div class="modal-body">

		<pre class="tab">

            <%=message%>

		</pre>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-md" data-dismiss="modal">OH BOI GO BACK</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="mEgdit" tabindex="-1" role="dialog" aria-hidden="true"  >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"><h4>Message</h4></div>
            <form action="../showMessage" method="post" id = "getMessage">

                <div class="modal-body">

		<pre class="tab">
            <input type="text" name="rID" id = "rID">
             <input type="text" name="location" value = "admin" hidden>


		</pre>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-md" data-dismiss="modal">OH BOI GO BACK</button>
                </div>
            </form>
        </div>
    </div>
</div>




<!-- Jquery JS-->
<script src="vendor/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Bootstrap JS-->
<script src="vendor/bootstrap-4.1/popper.min.js"></script>
<script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS -->
<script src="vendor/slick/slick.min.js"></script>
<script src="vendor/wow/wow.min.js"></script>
<script src="vendor/animsition/animsition.min.js"></script>
<script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<script src="vendor/counter-up/jquery.waypoints.min.js"></script>
<script src="vendor/datatables/datatables.min.js"></script>
<script src="vendor/counter-up/jquery.counterup.min.js"></script>
<script src="vendor/circle-progress/circle-progress.min.js"></script>
<script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="vendor/chartjs/Chart.bundle.min.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<!-- Main JS-->
<script src="js/main.js"></script>
<script name = "pageScripts">

    $(document).ready(function(){

        if (window.location.href.indexOf('#message') != -1) {
            $('#message').modal('show');
        }
    });

    $(document).ready(function (){
        var RTable= $('#rTable').DataTable();
        $('#rTable tbody').on('click', 'tr', function () {
            var RTableData = RTable.row(this).data();
            //$('#mEgdit').modal('show');
            $(".modal-body #rID").val(RTableData[0]);
            $('#getMessage').submit();
        });
    });


</script>

</body>
</html>