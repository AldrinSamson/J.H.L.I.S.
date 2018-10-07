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


    <!-- Title Page-->
    <title>Damages / Missing</title>

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
    owgg


    <!-- Main CSS-->
    <link href ="../css/custom.css" rel = "stylesheet" media = "all">
    <link href="../css/theme.css" rel="stylesheet" media="all">
</head>
<body class="animsition">
<!-- declarations -->
<%
    Connection con;
    Statement stmt;
    ResultSet rs , get;
    PreparedStatement lps;
    String getQ , getUser , query;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    Class.forName(MYclass);
    con = DriverManager.getConnection(MYdburl);
    stmt = con.createStatement();
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
                        <a href="../dashboard.jsp">
                            <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                    </li>
                    <li class="has-sub">
                        <a class="js-arrow" href="#">
                            <i class="fas fa-table"></i>Item Borrow/Return</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="borrow.jsp">Single</a>
                            </li>
                            <li>
                                <a href="borrowSet.jsp">Set</a>
                            </li>
                        </ul>
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
                                <a href="../report/damagesMissing.jsp">Damage/Missing Reports</a>
                            </li>
                            <li>
                                <a href="../report/audit.jsp">Audit</a>
                            </li>
                            <li>
                                <a href="../report/insights.jsp">Insights</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="../request/requestAdmin.jsp">
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
                    <li class="has-sub">
                        <a class="js-arrow" href="#">
                            <i class="fas fa-table"></i>Item Borrow/Return</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="borrow.jsp">Single</a>
                            </li>
                            <li>
                                <a href="borrowSet.jsp">Set</a>
                            </li>
                        </ul>
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
                                <a href="../report/damagesMissing.jsp">Damage/Missing Reports</a>
                            </li>
                            <li>
                                <a href="../report/audit.jsp">Audit</a>
                            </li>
                            <li>
                                <a href="../report/insights.jsp">Insights</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="../request/requestAdmin.jsp">
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

                                    getQ = "select * from account    where username = '" + getUser + "'";
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
                                                    <img src="../images/icon/avatar-02.png"/>
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
                                            <form method = "post" action = "../logout">
                                                <button class="btn btn-default btn-md">Logout<i class="zmdi zmdi-power"></i><input type="submit" value=""></button>
                                            </form>
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
            <div class = "mt-0 pb-3 pl-5 page-title">Damage / Missing Report</div>
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class = "card text-left" id = "ptab-marg">
                                <div class = "card-header" >
                                    <ul class="nav nav-pills">
                                        <li class = "nav-item"><a href="#tab-blist" data-toggle="tab" class = "nav-link active">Damages</a></li>
                                        <li class = "nav-item"><a href="#tab-rlist" data-toggle="tab" class = "nav-link" >Missing</a></li>
                                    </ul>
                                </div>
                                <div class = "card-body">

                                    <div class ="tab-content">
                                        <div class="tab-pane fade-in active" id="tab-blist">
                                            <div class="col-lg-12">
                                                <button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mEAdd" data-toggle="modal"style = "color:black;">Export .csv</a></button>
                                                <button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mEEdit" data-toggle="modal"style = "color:black;">Export .pdf</a></button>
                                                <div class="table-responsive table--no-card m-b-40">
                                                    * will add function to resolve
                                                    <table class="pt-2 table table-borderless table-striped table-earning" id = "borrowETable">
                                                        <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>name</th>
                                                            <th>description</th>
                                                            <th>quantity</th>
                                                            <th>item unit</th>
                                                            <th>item condition</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                            try {


                                                                query = "select b.bItemKey , i.itemName , i.itemDesc , b.bQuantity , i.itemUnit , b.bCondition from borrowtransaction b join itemdetails i on b.bItemKey = i.itemKey where b.bCondition = 'Broken' ";
                                                                rs = stmt.executeQuery(query);

                                                                while(rs.next()){
                                                        %>
                                                        <tr>
                                                            <td><%=rs.getString("bItemKey")%></td>
                                                            <td><%=rs.getString("itemName")%></td>
                                                            <td><%=rs.getString("itemDesc")%></td>
                                                            <td><%=rs.getString("bQuantity")%></td>
                                                            <td><%=rs.getString("itemUnit")%></td>
                                                            <td><%=rs.getString("bCondition")%></td>
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
                                        <div class="tab-pane fade-in" id="tab-rlist">
                                            <div class="col-lg-12">
                                                <button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mEAdd" data-toggle="modal"style = "color:black;">Export .csv</a></button>
                                                <button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mEEdit" data-toggle="modal"style = "color:black;">Export .pdf</a></button>
                                                <div class="table-responsive table--no-card m-b-40">
                                                    <table class="table table-borderless table-striped table-earning" id = "ReturnETable">
                                                        <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>name</th>
                                                            <th>description</th>
                                                            <th>quantity</th>
                                                            <th>item unit</th>
                                                            <th>item condition</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                            try {


                                                                query = "select b.bItemKey , i.itemName , i.itemDesc , b.bQuantity , i.itemUnit , b.bCondition from borrowtransaction b join itemdetails i on b.bItemKey = i.itemKey where b.bCondition = 'Lost' ";
                                                                rs = stmt.executeQuery(query);

                                                                while(rs.next()){
                                                        %>
                                                        <tr>
                                                            <td><%=rs.getString("bItemKey")%></td>
                                                            <td><%=rs.getString("itemName")%></td>
                                                            <td><%=rs.getString("itemDesc")%></td>
                                                            <td><%=rs.getString("bQuantity")%></td>
                                                            <td><%=rs.getString("itemUnit")%></td>
                                                            <td><%=rs.getString("bCondition")%></td>
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
    <!-- borrow -->
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mEBorrow"  data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Borrow Equipement</h4></div>
                <form action="../borrowSingle"  method = "post">

                    <div class="modal-body">

		<pre class = "tab">
        <div  style = "display:table">
            <div style = "display:table-cell">
                <label  class = "label-modal">Item Code</label>
                <label  class = "label-modal">Name</label>
                <label  class = "label-modal">Quantity</label>
                <label  class = "label-modal">ID</label>
                <label  class = "label-modal">Name</label>
                <label  class = "label-modal">Class</label>
                <label  class = "label-modal">Supervisor</label>
            </div>
            <div  style = "display:table-cell; position:absolute; top:40px;">
                <input type ="text" name = "iKey" class="input-modal" id = "EID" readonly>
                <input type ="text" name = "iName" class="input-modal" id = "EName" readonly>
                <input type ="text" name = "bQuantity" class="input-modal">
                <input type ="text" name = "bID" class="input-modal">
                <input type ="text" name = "bName" class="input-modal">
                <input type ="text" name = "bClass" class="input-modal">
                <input type ="text" name = "bSupervisor" class="input-modal">
            </div>
        </div>
		</pre>
                    </div>

                    <div class="modal-footer">
                        <input type ="submit" class="btn btn-default btn-md" value = "Lend">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- return -->
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mEReturn"  data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Return Equipment</h4></div>

                <div class="modal-body">

		<pre class = "tab">
        <div  style = "display:table">
            <div style = "display:table-cell">
                <form action="../returnSingle"  method = "post">
                <label  class = "label-modal">Item Code</label>
                <label  class = "label-modal">Name</label>
            </div>
            <div  style = "display:table-cell; position:absolute; top:40px;">
                <input type ="text" name = "iKey" class="input-modal" id = "EID" readonly>
                <input type ="text" name = "iName" class="input-modal" id = "EName" readonly>
                 <input type ="text" name = "bID" class="input-modal" id = "BID" hidden>
                <input type ="text" name = "bQ" class="input-modal" id = "BQ" >
                Report:
                        <input type ="submit" name = "response" class="btn btn-default btn-md" value = "Missing">
                        <input type ="submit" name = "response" class="btn btn-default btn-md" value = "Broken">
                        <input type ="submit" name = "response" class="btn btn-default btn-md" value = "Return">
                </form>

            </div>
        </div>
		</pre>
                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
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
<script src="../vendor/datatables/datatables.min.js"></script>
<script src="../vendor/counter-up/jquery.counterup.min.js">
</script>
<script src="../vendor/circle-progress/circle-progress.min.js"></script>
<script src="../vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="../vendor/chartjs/Chart.bundle.min.js"></script>
<script src="../vendor/select2/select2.min.js">
</script>
<script type = "text/javascript">
    $(document).ready(function(){

        if (window.location.href.indexOf('#mNCode') != -1) {
            $('#mNCode').modal('show');
        }
    });

    $(document).ready(function(){
        var borrowETableX = $("#borrowETable").DataTable();


    });

    $(document).ready(function(){
        var ReturnETableX = $("#ReturnETable").DataTable();


    });
</script>
<!-- Main JS-->
<script src="../js/main.js"></script>
</body>
</html>