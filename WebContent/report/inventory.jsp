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
    <title>Inventory Reports</title>

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
    <link href="../vendor/css-hamburgers/ham   burgers.min.css" rel="stylesheet" media="all">
    <link href="../vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="../vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="../vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
    <link href="../vendor/datatables/datatables.min.css" rel="stylesheet" media="all">
    <link href="../vendor/Buttons-1.5.4/css/buttons.dataTables.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href ="../css/custom.css" rel = "stylesheet" media = "all">
    <link href="../css/theme.css" rel="stylesheet" media="all">
</head>
<body class="animsition">
<!-- declarations -->
<%

    if(session.getAttribute("user") == null){
        out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='../index.html';</script></body></html>");
    }

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
                                <a href="../borrow/borrow.jsp">Single</a>
                            </li>
                            <li>
                                <a href="../borrow/borrowSet.jsp">Set</a>
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
                                <a href="inventory.jsp">Inventory Manifest</a>
                            </li>
                            <li>
                                <a href="borrowTransaction.jsp">Borrowing Transactions</a>
                            </li>
                            <li>
                                <a href="damagesMissing.jsp">Damage/Missing Reports</a>
                            </li>
                            <li>
                                <a href="audit.jsp">Audit</a>
                            </li>
                            <li>
                                <a href="insights.jsp">Insights</a>
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
                                <a href="../borrow/borrow.jsp">Single</a>
                            </li>
                            <li>
                                <a href="../borrow/borrowSet.jsp">Set</a>
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
            <div class = "pl-5 pb-3 page-title">Inventory Manifest</div>
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class = "card text-left" id = "ptab-marg">
                                <div class = "card-header" >
                                    <ul class="nav nav-pills">
                                        <li class = "nav-item"><a href="#tab-alllist" data-toggle="tab" class = "nav-link active" >ALL</a></li>
                                        <li class = "nav-item"><a href="#tab-elist" data-toggle="tab" class = "nav-link ">Physics Lab</a></li>
                                        <li class = "nav-item"><a href="#tab-clist" data-toggle="tab" class = "nav-link" >Chemistry Lab</a></li>
                                    </ul>
                                </div>
                                <div class = "card-body">

                                    <div class= "tab-content">

                                        <div class="tab-pane fade-in" id="tab-elist">
                                            <div class = "card-header" >
                                                <ul class="nav nav-pills">
                                                    <li class = "nav-item"><a href="#tab-pelist" data-toggle="tab" class = "nav-link active">Equipment</a></li>
                                                    <li class = "nav-item"><a href="#tab-palist" data-toggle="tab" class = "nav-link" >Apparatus</a></li>
                                                    <li class = "nav-item"><a href="#tab-pclist" data-toggle="tab" class = "nav-link" >Consumable</a></li>
                                                    <li class = "nav-item"><a href="#tab-palllist" data-toggle="tab" class = "nav-link" >ALL</a></li>
                                                </ul>
                                            </div>

                                            <div class= "tab-content">

                                                <div class="tab-pane fade-in active" id="tab-pelist">
                                    <div class="col-lg-12">
                                        <div class="pt-2 table-responsive table--no-card m-b-40">
                                            <table class="table table-borderless table-striped table-earning" id = "physicsE">
                                                <thead>
                                                <tr>
                                                    <th>itemKey</th>
                                                    <th>name</th>
                                                    <th>desc</th>
                                                    <th>calibration date</th>
                                                    <th>condition</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <%
                                                    try {


                                                        query = "SELECT * from inventory i join itemdetails d on i.itemKey = d.itemKey where i.itemLab = 'Physics' and d.itemType = 'Equipment'";
                                                        rs = stmt.executeQuery(query);

                                                        while(rs.next()){
                                                %>
                                                <tr>
                                                    <td><%=rs.getString("itemKey")%></td>
                                                    <td><%=rs.getString("itemName")%></td>
                                                    <td><%=rs.getString("itemDesc")%></td>
                                                    <td><%=rs.getString("itemDate")%></td>
                                                    <td><%=rs.getString("itemCondition")%></td>

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

                                                <div class="tab-pane fade-in " id="tab-palist">
                                                    <div class="col-lg-12">
                                                        <div class="pt-2 table-responsive table--no-card m-b-40">
                                                            <table class="table table-borderless table-striped table-earning" id = "physicsA">
                                                                <thead>
                                                                <tr>
                                                                    <th>itemKey</th>
                                                                    <th>name</th>
                                                                    <th>desc</th>
                                                                    <th>currentQuantity</th>
                                                                    <th>totalQuantity</th>
                                                                    <th>condition</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <%
                                                                    try {


                                                                        query = "SELECT * from inventory i join itemdetails d on i.itemKey = d.itemKey where i.itemLab = 'Physics'and d.itemType = 'Apparatus'";
                                                                        rs = stmt.executeQuery(query);

                                                                        while(rs.next()){
                                                                %>
                                                                <tr>
                                                                    <td><%=rs.getString("itemKey")%></td>
                                                                    <td><%=rs.getString("itemName")%></td>
                                                                    <td><%=rs.getString("itemDesc")%></td>
                                                                    <td><%=rs.getString("itemCurrentQuantity")%></td>
                                                                    <td><%=rs.getString("itemTotalQuantity")%></td>
                                                                    <td><%=rs.getString("itemCondition")%></td>

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

                                                <div class="tab-pane fade-in " id="tab-pclist">
                                                    <div class="col-lg-12">
                                                        <div class="pt-2 table-responsive table--no-card m-b-40">
                                                            <table class="table table-borderless table-striped table-earning" id = "physicsC">
                                                                <thead>
                                                                <tr>
                                                                    <th>itemKey</th>
                                                                    <th>name</th>
                                                                    <th>form</th>
                                                                    <th>desc</th>
                                                                    <th>currentQuantity</th>
                                                                    <th>totalQuantity</th>
                                                                    <th>expiration date</th>
                                                                    <th>condition</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <%
                                                                    try {


                                                                        query = "SELECT * from inventory i join itemdetails d on i.itemKey = d.itemKey where i.itemLab = 'Physics' and d.itemType = 'Consumable'";
                                                                        rs = stmt.executeQuery(query);

                                                                        while(rs.next()){
                                                                %>
                                                                <tr>
                                                                    <td><%=rs.getString("itemKey")%></td>
                                                                    <td><%=rs.getString("itemName")%></td>
                                                                    <td><%=rs.getString("itemForm")%></td>
                                                                    <td><%=rs.getString("itemDesc")%></td>
                                                                    <td><%=rs.getString("itemCurrentQuantity")%></td>
                                                                    <td><%=rs.getString("itemTotalQuantity")%></td>
                                                                    <td><%=rs.getString("itemDate")%></td>
                                                                    <td><%=rs.getString("itemCondition")%></td>

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

                                                <div class="tab-pane fade-in " id="tab-palllist">
                                                    <div class="col-lg-12">
                                                        <div class="pt-2 table-responsive table--no-card m-b-40">
                                                            <table class="table table-borderless table-striped table-earning" id = "physicsAll">
                                                                <thead>
                                                                <tr>
                                                                    <th>itemKey</th>
                                                                    <th>name</th>
                                                                    <th>desc</th>
                                                                    <th>currentQuantity</th>
                                                                    <th>totalQuantity</th>
                                                                    <th>date</th>
                                                                    <th>date type</th>
                                                                    <th>condition</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <%
                                                                    try {


                                                                        query = "SELECT * from inventory i join itemdetails d on i.itemKey = d.itemKey where i.itemLab = 'Physics'";
                                                                        rs = stmt.executeQuery(query);

                                                                        while(rs.next()){
                                                                %>
                                                                <tr>
                                                                    <td><%=rs.getString("itemKey")%></td>
                                                                    <td><%=rs.getString("itemName")%></td>
                                                                    <td><%=rs.getString("itemDesc")%></td>
                                                                    <td><%=rs.getString("itemCurrentQuantity")%></td>
                                                                    <td><%=rs.getString("itemTotalQuantity")%></td>
                                                                    <td><%=rs.getString("itemDate")%></td>
                                                                    <td><%=rs.getString("itemDateType")%></td>
                                                                    <td><%=rs.getString("itemCondition")%></td>

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

                                        <div class="tab-pane" id="tab-clist">

                                            <div class = "card-header" >
                                                <ul class="nav nav-pills">
                                                    <li class = "nav-item"><a href="#tab-celist" data-toggle="tab" class = "nav-link active">Equipment</a></li>
                                                    <li class = "nav-item"><a href="#tab-calist" data-toggle="tab" class = "nav-link" >Apparatus</a></li>
                                                    <li class = "nav-item"><a href="#tab-cclist" data-toggle="tab" class = "nav-link" >Consumable</a></li>
                                                    <li class = "nav-item"><a href="#tab-calllist" data-toggle="tab" class = "nav-link" >ALL</a></li>
                                                </ul>
                                            </div>
                                            <div class= "tab-content">

                                                <div class="tab-pane fade-in active" id="tab-celist">
                                            <div class="col-lg-12">
                                                <div class="pt-2 table-responsive table--no-card m-b-40">
                                                    <table class="table table-borderless table-striped table-earning" id = "chemistryE">
                                                        <thead>
                                                        <tr>
                                                            <th>itemKey</th>
                                                            <th>name</th>
                                                            <th>desc</th>
                                                            <th>calibration date</th>
                                                            <th>condition</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                            try {


                                                                query = "SELECT * from inventory i join itemdetails d on i.itemKey = d.itemKey where i.itemLab = 'Chemistry' and d.itemType = 'Equipment'";
                                                                rs = stmt.executeQuery(query);

                                                                while(rs.next()){
                                                        %>
                                                        <tr>
                                                            <td><%=rs.getString("itemKey")%></td>
                                                            <td><%=rs.getString("itemName")%></td>
                                                            <td><%=rs.getString("itemDesc")%></td>
                                                            <td><%=rs.getString("itemDate")%></td>
                                                            <td><%=rs.getString("itemCondition")%></td>

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

                                                <div class="tab-pane fade-in" id="tab-calist">
                                                    <div class="col-lg-12">
                                                        <div class="pt-2 table-responsive table--no-card m-b-40">
                                                            <table class="table table-borderless table-striped table-earning" id = "chemistryA">
                                                                <thead>
                                                                <tr>
                                                                    <th>itemKey</th>
                                                                    <th>name</th>
                                                                    <th>desc</th>
                                                                    <th>currentQuantity</th>
                                                                    <th>totalQuantity</th>
                                                                    <th>condition</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <%
                                                                    try {


                                                                        query = "SELECT * from inventory i join itemdetails d on i.itemKey = d.itemKey where i.itemLab = 'Chemistry' and d.itemType = 'Apparatus'";
                                                                        rs = stmt.executeQuery(query);

                                                                        while(rs.next()){
                                                                %>
                                                                <tr>
                                                                    <td><%=rs.getString("itemKey")%></td>
                                                                    <td><%=rs.getString("itemName")%></td>
                                                                    <td><%=rs.getString("itemDesc")%></td>
                                                                    <td><%=rs.getString("itemCurrentQuantity")%></td>
                                                                    <td><%=rs.getString("itemTotalQuantity")%></td>
                                                                    <td><%=rs.getString("itemCondition")%></td>

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

                                                <div class="tab-pane fade-in" id="tab-cclist">
                                                    <div class="col-lg-12">
                                                        <div class="pt-2 table-responsive table--no-card m-b-40">
                                                            <table class="table table-borderless table-striped table-earning" id = "chemistryC">
                                                                <thead>
                                                                <tr>
                                                                    <th>itemKey</th>
                                                                    <th>name</th>
                                                                    <th>form</th>
                                                                    <th>desc</th>
                                                                    <th>currentQuantity</th>
                                                                    <th>totalQuantity</th>
                                                                    <th>expiration date</th>
                                                                    <th>condition</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <%
                                                                    try {


                                                                        query = "SELECT * from inventory i join itemdetails d on i.itemKey = d.itemKey where i.itemLab = 'Chemistry' and d.itemType = 'Consumable'";
                                                                        rs = stmt.executeQuery(query);

                                                                        while(rs.next()){
                                                                %>
                                                                <tr>
                                                                    <td><%=rs.getString("itemKey")%></td>
                                                                    <td><%=rs.getString("itemName")%></td>
                                                                    <td><%=rs.getString("itemForm")%></td>
                                                                    <td><%=rs.getString("itemDesc")%></td>
                                                                    <td><%=rs.getString("itemCurrentQuantity")%></td>
                                                                    <td><%=rs.getString("itemTotalQuantity")%></td>
                                                                    <td><%=rs.getString("itemDate")%></td>
                                                                    <td><%=rs.getString("itemCondition")%></td>

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

                                                <div class="tab-pane fade-in" id="tab-calllist">
                                                    <div class="col-lg-12">
                                                        <div class="pt-2 table-responsive table--no-card m-b-40">
                                                            <table class="table table-borderless table-striped table-earning" id = "chemistryAll">
                                                                <thead>
                                                                <tr>
                                                                    <th>itemKey</th>
                                                                    <th>name</th>
                                                                    <th>desc</th>
                                                                    <th>currentQuantity</th>
                                                                    <th>totalQuantity</th>
                                                                    <th>date</th>
                                                                    <th>date type</th>
                                                                    <th>condition</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <%
                                                                    try {


                                                                        query = "SELECT * from inventory i join itemdetails d on i.itemKey = d.itemKey where i.itemLab = 'Chemistry'";
                                                                        rs = stmt.executeQuery(query);

                                                                        while(rs.next()){
                                                                %>
                                                                <tr>
                                                                    <td><%=rs.getString("itemKey")%></td>
                                                                    <td><%=rs.getString("itemName")%></td>
                                                                    <td><%=rs.getString("itemDesc")%></td>
                                                                    <td><%=rs.getString("itemCurrentQuantity")%></td>
                                                                    <td><%=rs.getString("itemTotalQuantity")%></td>
                                                                    <td><%=rs.getString("itemDate")%></td>
                                                                    <td><%=rs.getString("itemDateType")%></td>
                                                                    <td><%=rs.getString("itemCondition")%></td>

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

                                        <div class="tab-pane fade-in active" id="tab-alllist">
                                            <div class="col-lg-12">
                                                <div class="pt-2 table-responsive table--no-card m-b-40">
                                                    <table class="table table-borderless table-striped table-earning" id = "all">
                                                        <thead>
                                                        <tr>
                                                            <th>itemKey</th>
                                                            <th>name</th>
                                                            <th>desc</th>
                                                            <th>currentQuantity</th>
                                                            <th>totalQuantity</th>
                                                            <th>date</th>
                                                            <th>date type</th>
                                                            <th>lab</th>
                                                            <th>condition</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                            try {


                                                                query = "SELECT * from inventory i join itemdetails d on i.itemKey = d.itemKey ";
                                                                rs = stmt.executeQuery(query);

                                                                while(rs.next()){
                                                        %>
                                                        <tr>
                                                            <td><%=rs.getString("itemKey")%></td>
                                                            <td><%=rs.getString("itemName")%></td>
                                                            <td><%=rs.getString("itemDesc")%></td>
                                                            <td><%=rs.getString("itemCurrentQuantity")%></td>
                                                            <td><%=rs.getString("itemTotalQuantity")%></td>
                                                            <td><%=rs.getString("itemDate")%></td>
                                                            <td><%=rs.getString("itemDateType")%></td>
                                                            <td><%=rs.getString("itemLab")%></td>
                                                            <td><%=rs.getString("itemCondition")%></td>

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
<script src="../vendor/datatables/datatables.min.js"></script>
<script src="../vendor/chartjs/Chart.bundle.min.js"></script>
<script src="../vendor/select2/select2.min.js">
</script>
<script src = "../vendor/pdfmake-0.1.36/pdfmake.js"></script>
<script src = "../vendor/pdfmake-0.1.36/vfs_fonts.js"></script>
<script src = "../vendor/Buttons-1.5.4/js/buttons.html5.js"></script>
<script type = "text/javascript">
    $(document).ready(function(){

        if (window.location.href.indexOf('#mNCode') != -1) {
            $('#mNCode').modal('show');
        }
    });
    $(document).ready(function(){

        $("#physicsE").DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csvHtml5',
                {
                    extend: 'pdfHtml5',
                    orientation: 'landscape',
                    download: 'open',
                    message : 'University of Santo Tomas | Junior Highschool | Physics Laboratory '
                }
            ],
            "paging": false
        });

        $("#physicsA").DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csvHtml5',
                {
                    extend: 'pdfHtml5',
                    orientation: 'landscape',
                    download: 'open',
                    message : 'University of Santo Tomas | Junior Highschool | Physics Laboratory '
                }
            ],
            "paging": false
        });

        $("#physicsC").DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csvHtml5',
                {
                    extend: 'pdfHtml5',
                    orientation: 'landscape',
                    download: 'open',
                    message : 'University of Santo Tomas | Junior Highschool | Physics Laboratory '
                }
            ],
            "paging": false
        });

        $("#physicsAll").DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csvHtml5',
                {
                    extend: 'pdfHtml5',
                    orientation: 'landscape',
                    download: 'open',
                    message : 'University of Santo Tomas | Junior Highschool | Physics Laboratory '
                }
            ],
            "paging": false
        });

        $("#chemistryE").DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csvHtml5',
                {
                    extend: 'pdfHtml5',
                    orientation: 'landscape',
                    download: 'open',
                    message : 'University of Santo Tomas | Junior Highschool | Chemistry Laboratory '
                }
            ],
            "paging": false
        });

        $("#chemistryA").DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csvHtml5',
                {
                    extend: 'pdfHtml5',
                    orientation: 'landscape',
                    download: 'open',
                    message : 'University of Santo Tomas | Junior Highschool | Chemistry Laboratory '
                }
            ],
            "paging": false
        });

        $("#chemistryC").DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csvHtml5',
                {
                    extend: 'pdfHtml5',
                    orientation: 'landscape',
                    download: 'open',
                    message : 'University of Santo Tomas | Junior Highschool | Chemistry Laboratory '
                }
            ],
            "paging": false
        });

        $("#chemistryAll").DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csvHtml5',
                {
                    extend: 'pdfHtml5',
                    orientation: 'landscape',
                    download: 'open',
                    message : 'University of Santo Tomas | Junior Highschool | Chemistry Laboratory '
                }
            ],
            "paging": false
        });

        $("#all").DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csvHtml5',
                {
                    extend: 'pdfHtml5',
                    orientation: 'landscape',
                    download: 'open',
                    message : 'University of Santo Tomas | Junior Highschool | Chemistry Laboratory '
                }
            ],
            "paging": false
        });
    });

</script>
<!-- Main JS-->
<script src="../js/main.js"></script>
</body>
</html>