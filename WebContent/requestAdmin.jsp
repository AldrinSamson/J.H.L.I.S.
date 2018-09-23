<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="bean.getBean" %>
<%@page import="java.sql.*" %>
<html>
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title Page-->
    <title>Physics</title>

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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="vendor/datatables/datatables.min.css" rel="stylesheet" media="all">
    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">
    <link href="css/custom.css" rel="stylesheet" media="all">


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
                    <a class="logo" href="../dashboard.jsp">
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

                    <li>
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
                                <a href="../report/inventory.jsp">Inventory Manifest</a>
                            </li>
                            <li>
                                <a href="../report/borrowTransaction.jsp">Borrowing Transactions</a>
                            </li>
                            <li>
                                <a href="../report/request.jsp">Request Reports</a>
                            </li>
                            <li>
                                <a href="../report/damages.jsp">Damage Reports</a>
                            </li>
                            <li>
                                <a href="../report/missing.jsp">Missing Reports</a>
                            </li>
                            <li>
                                <a href=../report/insights.jsp">Insights</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="../requestAdmin.jsp">
                            <i class="far fa-check-square"></i>Requests</a>
                    </li>


                    <li>
                        <a href="../account/account.jsp">
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
            <a href="../dashboard.jsp">
                <h1>JHLIS</h1>
            </a>
        </div>
        <div class="menu-sidebar__content js-scrollbar1">
            <nav class="navbar-sidebar">
                <ul class="list-unstyled navbar__list">

                    <li>
                        <a href="../dashboard.jsp">
                            <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                    </li>
                    <li>
                        <a href="../borrow/borrow.jsp">
                            <i class="fas fa-flask"></i>Item Borrow/Return</a>
                    </li>
                    <li class="has-sub">
                        <a class="js-arrow" href="#">
                            <i class="fas fa-table"></i>Laboratory Item Management</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="../inventory/physics.jsp">Physics Laboratory</a>
                            </li>
                            <li>
                                <a href="../inventory/chemistry.jsp">Chemistry Laboratory</a>
                            </li>
                            <li>
                                <a href="../inventory/itemSets.jsp">Item Sets</a>
                            </li>
                            <li>
                                <a href="../inventory/nonBorrowable.jsp">Non-Borrowable</a>
                            </li>
                        </ul>
                    </li>
                    <li class="has-sub">
                        <a class="js-arrow" href="#">
                            <i class="fas fa-chart-bar"></i>Reports</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="../report/inventory.jsp">Inventory Manifest</a>
                            </li>
                            <li>
                                <a href="../report/borrowTransaction.jsp">Borrowing Transactions</a>
                            </li>
                            <li>
                                <a href="../report/request.jsp" >Request Reports</a>
                            </li>
                            <li>
                                <a href="../report/damages.jsp">Damage Reports</a>
                            </li>
                            <li>
                                <a href="../report/missing.jsp">Missing Reports</a>
                            </li>
                            <li>
                                <a href="../report/insights.jsp">Insights</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="../requestAdmin.jsp">
                            <i class="far fa-check-square"></i>Requests</a>
                    </li>


                    <li>
                        <a href="../account/account.jsp">
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
                                try {
                                    getUser = (String) session.getAttribute("user");

                                    getQ = "select * from account where username = '" + getUser + "'";
                                    get = stmt.executeQuery(getQ);

                                    while (get.next()) {
                            %>
                            <div class="account-wrap">
                                <div class="account-item clearfix js-item-menu">

                                    <div class="content">
                                        <a class="js-acc-btn"
                                           href="#">Hello, <%= get.getString("aClass") %> <%= get.getString("aName") %>
                                        </a>
                                    </div>
                                    <div class="account-dropdown js-dropdown">
                                        <div class="info clearfix">
                                            <div class="image">
                                                <a href="#">
                                                    <img src="../images/icon/avatar-01.jpg"/>
                                                </a>
                                            </div>
                                            <div class="content">
                                                <h5 class="name">
                                                    <a href="#"><%= get.getString("username") %>
                                                    </a>
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
                                } catch (Exception e) {

                                }


                            %>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- HEADER DESKTOP-->
        <!-- Main Body -->
        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card text-left" id="ptab-marg">
                                <!-- Nav Tabs -->
                                <div class="card-header">
                                    <h3 class="card-title"> Item Request Module </h3>
                                    <ul class="nav nav-tabs ">
                                        <li class="nav-item"><a style="color : grey;" href="#tab-elist"
                                                                data-toggle="tab" class="nav-link active">Pending</a>
                                        </li>
                                        <li class="nav-item"><a style="color : grey;" href="#tab-alist"
                                                                data-toggle="tab" class="nav-link">Unfulfilled</a></li>
                                        <li class="nav-item"><a style="color : grey;" href="#tab-clist"
                                                                data-toggle="tab" class="nav-link">History</a></li>
                                    </ul>
                                </div>
                                <div class="card-body">
                                    <div class="tab-content">

                                        <!--Pending Table-->
                                        <div class="tab-pane fade-in active" id="tab-elist">
                                            <div class="col-lg-12">
                                                <div class="table-responsive table--no-card m-b-40">
                                                    <table class="table table-borderless table-striped table-earning" id = "rTable">
                                                        <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Name</th>
                                                            <th>Date</th>
                                                            <th>Time</th>
                                                            <th>Message</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                            try {


                                                                    query = "SELECT LEFT(rMessage, 20) as message, r.*, a.aName,a.aClass from request r join account a on r.aKey = a.aKey where rCondition = 'Pending' and rStatus ='Unfulfilled'";
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
                                                            <td><%=rs.getString("message")%>
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

                                        <!--Unfulfilled Table-->
                                        <div class="tab-pane fade-in" id="tab-alist">
                                            <div class="col-lg-12">
                                                <div class="table-responsive table--no-card m-b-40">
                                                    <table class="table table-borderless table-striped table-earning" id = "rOKTable">
                                                        <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Name</th>
                                                            <th>Date</th>
                                                            <th>Time</th>
                                                            <th>Message</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                            try {


                                                                query = "SELECT LEFT(rMessage, 20) as message, r.*, a.aName,a.aClass from request r join account a on r.aKey = a.aKey where rCondition = 'Approved' and rStatus ='Unfulfilled'";
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
                                                            <td><%=rs.getString("message")%>
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

                                        <!--Consumable Table-->
                                        <div class="tab-pane fade-in" id="tab-clist">
                                            <div class="col-lg-12">
                                                <div class="table-responsive table--no-card m-b-40">
                                                    <table class="table table-borderless table-striped table-earning" id = "rHTable">
                                                        <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Name</th>
                                                            <th>Date</th>
                                                            <th>Time</th>
                                                            <th>Message</th>
                                                            <th>Condition</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                            try {


                                                                query = "SELECT LEFT(rMessage, 20) as message, r.*, a.aName,a.aClass from request r join account a on r.aKey = a.aKey where rStatus = 'Fulfilled' ";
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
                                                            <td><%=rs.getString("message")%>
                                                            </td>
                                                            <td><%=rs.getString("rCondition")%>
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
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- Main Body End-->
    <!-- Modal -->
    <!-- Pending Request Modal -->
    <div class="modal fade" id="pMessage" tabindex="-1" role="dialog"  data-backdrop = "static" aria-hidden="true"  >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Message</h4></div>
                <form action="approveRequest" method="post">

                    <div class="modal-body">

		<pre class="pre-scrollable"><div class="m-1"><%=message%></div>
             <table class="table table-borderless table-earning" style="border-spacing:20px">
            <tr>
                <td><input type="submit" name = "response" class="btn btn-default btn-md" value="Approve" > <input type="submit" name = "response" class="btn btn-default btn-md" value="Reject" ></td>
            </tr>
                 <tr>
                     <td><input type="submit" name = "response" class="btn btn-default btn-md" value="Approve and Fulfill" ></td>
                 </tr>
            </table>
        </pre></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="mPMessage" tabindex="-1" role="dialog" aria-hidden="true"  >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Message</h4></div>
                <form action="showMessage" method="post" id = "getMessage">

                    <div class="modal-body">

		<pre class="tab">
            <input type="text" name="rID" id = "rID" hidden>
             <input type="text" name="location" value = "pending" hidden>



		</pre>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">OH BOI GO BACK</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Fulfill Request Modal -->
    <div class="modal fade" id="fMessage" tabindex="-1" role="dialog"  data-backdrop = "static" aria-hidden="true"  >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Message</h4></div>
                <form action="fulfillRequest" method="post">

                    <div class="modal-body">

		<pre class="pre-scrollable"><div class="m-1"><%=message%></div>
             <table class="table table-borderless table-earning" style="border-spacing:20px">
            <tr>
                <td><input type="submit" name = "response" class="btn btn-default btn-md" value="Fulfill" > <input type="submit" name = "response" class="btn btn-default btn-md" value="Reject" ></td>
            </tr>
            </table>
        </pre></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="mFMessage" tabindex="-1" role="dialog" aria-hidden="true"  >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Message</h4></div>
                <form action="showMessage" method="post" id = "getMessage2">

                    <div class="modal-body">

		<pre class="tab">
            <input type="text" name="rID" id = "rID" hidden>
             <input type="text" name="location" value = "unfulfilled" hidden>



		</pre>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">OH BOI GO BACK</button>
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

            <div class = "m-1"><%=message%></div>

		</pre>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="mEgdit" tabindex="-1" role="dialog" aria-hidden="true"  >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Message</h4></div>
                <form action="../showMessage" method="post" id = "getMessage3">

                    <div class="modal-body">

		<pre class="tab">
            <input type="text" name="rID" id = "rID" hidden>
            <input type="text" name="location" value = "hehe" hidden>


		</pre>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
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
<script name="pageScripts" type="text/javascript">

    //modal show on url
    $(document).ready(function(){

        if (window.location.href.indexOf('#pMessage') != -1) {
            $('#pMessage').modal('show');
        }

        if (window.location.href.indexOf('#fMessage') != -1) {
            $('#fMessage').modal('show');
        }

        if (window.location.href.indexOf('#message') != -1) {
            $('#message').modal('show');
        }


    });

    $(document).ready(function (){
        var RTable= $('#rTable').DataTable();
        $('#rTable tbody').on('click', 'tr', function () {
            var RTableData = RTable.row(this).data();
            //$('#mPMessage').modal('show');
            $(".modal-body #rID").val(RTableData[0]);
            $('#getMessage').submit();
        });
    });
    $(document).ready(function (){
        var RTable= $('#rOKTable').DataTable();
        $('#rOKTable tbody').on('click', 'tr', function () {
            var RTableData = RTable.row(this).data();
            // $('#mFMessage').modal('show');
            $(".modal-body #rID").val(RTableData[0]);
            $('#getMessage2').submit();
        });
    });
    $(document).ready(function (){
        var RTable= $('#rHTable').DataTable();
        $('#rHTable tbody').on('click', 'tr', function () {
            var RTableData = RTable.row(this).data();
            //$('#message').modal('show');
            $(".modal-body #rID").val(RTableData[0]);
            $('#getMessage3').submit();
        });
    });
</script>
</body>
</html>