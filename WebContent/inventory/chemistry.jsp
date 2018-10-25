<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="bean.getBean" %>
<%@page import="java.sql.*" %>
<html>
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title Page-->
    <title>Chemistry</title>

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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="../vendor/datatables/datatables.min.css" rel="stylesheet" media="all">
    <link href="../vendor/gigjo/css/gijgo.min.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="../css/theme.css" rel="stylesheet" media="all">
    <link href="../css/custom.css" rel="stylesheet" media="all">


</head>
<body class="animsition">



<!-- declarations -->
<%

    if(session.getAttribute("user") == null){
        out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='../index.html';</script></body></html>");
    }

    Connection con;
    Statement stmt;
    ResultSet rs, get, counter;
    String getQ, getUser, query;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    Class.forName(MYclass);
    con = DriverManager.getConnection(MYdburl);
    stmt = con.createStatement();

    String iName = (String)session.getAttribute("itemName");
    String iForm = (String)session.getAttribute("itemForm");
    String iDesc = (String)session.getAttribute("itemDesc");
    String iDate = (String)session.getAttribute("itemDate");
    String  iQuantity = (String)session.getAttribute("itemQuantity");
    String iUnit = (String)session.getAttribute("itemUnit");


    String abbv1 = (String)session.getAttribute("itemAbbv1");
    String abbv2 = (String)session.getAttribute("itemAbbv2");
    String abbv3 = (String)session.getAttribute("itemAbbv3");
    String abbvF1 = (String)session.getAttribute("itemFAbbv1");
    String abbvF2 = (String)session.getAttribute("itemFAbvv2");
    String abbvF3 = (String)session.getAttribute("itemFAbbv3");
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
            <div class="pb-3 pl-5 page-title"> Chemistry Laboratory </div>
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card text-left" id="ptab-marg">
                                <!-- Nav Tabs -->
                                <div class="card-header">
                                    <ul class="nav nav-pills ">
                                        <li class="nav-item"><a href="#tab-elist" data-toggle="tab" class="nav-link active">Equipment</a>
                                        </li>
                                        <li class="nav-item"><a href="#tab-alist" data-toggle="tab" class="nav-link">Apparatus</a></li>
                                        <li class="nav-item"><a href="#tab-clist" data-toggle="tab" class="nav-link">Consumable</a></li>
                                    </ul>
                                </div>
                                <div class="p-1 card-body">
                                    <div class="tab-content">

                                        <!--Equipment Table-->
                                        <div class="tab-pane fade-in active" id="tab-elist">
                                            <div class="col-lg-12">
                                                <button type="button" class="btn new-item-btn"  href="#mEAdd" data-toggle="modal">NEW ITEM</button>
                                                <table class="table table-borderless table-striped table-earning">
                                                    <tr>
                                                        <% try {

                                                            String queryX = "select itemName, sum(itemTotalQuantity) from inventory i join itemdetails d on d.itemKey=i.itemKey where itemType ='Equipment'and itemLab ='Chemistry' group by itemName";
                                                            counter = stmt.executeQuery(queryX);

                                                            while (counter.next()) {

                                                        %>
                                                        <th><%=counter.getString("itemName")%>
                                                        </th>
                                                        <td><%=counter.getString("sum(itemTotalQuantity)")%>
                                                        </td>
                                                        <%
                                                                }
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            }
                                                        %>
                                                    </tr>
                                                </table>
                                                <div class="table-responsive table--no-card m-b-40">
                                                    <table class="table table-borderless table-striped table-earning" id="ETable">
                                                        <thead>
                                                        <tr >
                                                            <th>ID</th>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Calibration</th>
                                                            <th>Condition</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                            try {
                                                                query = "select * from itemdetails d join inventory i on d.itemKey = i.itemKey where itemLab = 'Chemistry' and itemType ='Equipment'";
                                                                rs = stmt.executeQuery(query);

                                                                while (rs.next()) {
                                                                    String CCdate = rs.getString("itemDate");
                                                                    if (CCdate == null) {
                                                                        CCdate = "N/A";
                                                                    }
                                                        %>
                                                        <tr data-toggle="modal" data-target="mEEdit">
                                                            <td><%=rs.getString("itemKey")%>
                                                            </td>
                                                            <td><%=rs.getString("itemName")%>
                                                            </td>
                                                            <td><%=rs.getString("itemDesc") %>
                                                            </td>
                                                            <td><%=CCdate%>
                                                            </td>
                                                            <td><%=rs.getString("itemCondition")%>
                                                            </td>
                                                        </tr>
                                                        <%
                                                                }
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            }
                                                        %>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                        <!--Apparatus Table-->
                                        <div class="tab-pane fade-in" id="tab-alist">
                                            <div class="col-lg-12">
                                                <button type="button" class="btn new-item-btn"  href="#mAAdd" data-toggle="modal">NEW ITEM</button>
                                                <table class="table table-borderless table-striped table-earning">
                                                    <tr>
                                                            <%
					  			try {
					  			      String queryX = "select itemName ,sum(itemCurrentQuantity), itemUnit from itemdetails d join inventory i " +
					  			       "on d.itemKey=i.itemKey where itemLab = 'Chemistry' and itemType ='Apparatus'" +
					  			        " group by itemName ";
                                     counter = stmt.executeQuery(queryX);
                                     while(counter.next()){
                                         String unitX = counter.getString("itemUnit");
                                        int iQ = counter.getInt("sum(itemCurrentQuantity)");
                                        if (iQ > 1){
                                            unitX = unitX+"s";
                                        }
                                   %>
                                                        <th><%=counter.getString("itemName")%>
                                                        </th>
                                                        <td><%=iQ%><%=unitX%>
                                                        </td>
                                                            <%
                                    	 }
                               			 } catch (Exception e){
                                   			 e.printStackTrace();
                               			 }
		       					%>
                                                </table>
                                                <div class="table-responsive table--no-card m-b-40">
                                                    <table class="table table-borderless table-striped table-earning"
                                                           id="ATable">
                                                        <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Name</th>
                                                            <th>Description</th>
                                                            <th>Total Quantity</th>
                                                            <th>Current Quantity</th>
                                                            <th>Condition</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                            try {


                                                                query = "select * from itemdetails d join inventory i on d.itemKey = i.itemKey where itemLab = 'Chemistry' and itemType ='Apparatus'";
                                                                rs = stmt.executeQuery(query);

                                                                while (rs.next()) {


                                                                    String unitX = rs.getString("itemUnit");
                                                                    int iTQ = rs.getInt("itemTotalQuantity");
                                                                    int iCQ = rs.getInt("itemCurrentQuantity");


                                                                    if (iTQ > 1) {
                                                                        unitX = unitX + "s";
                                                                    }


                                                        %>
                                                        <tr data-toggle="modal" id="mAEDit">
                                                            <td><%=rs.getString("itemKey")%>
                                                            </td>
                                                            <td><%=rs.getString("itemName")%>
                                                            </td>
                                                            <td><%=rs.getString("itemDesc") %>
                                                            </td>
                                                            <td><%=iTQ%> <%=unitX%>
                                                            </td>
                                                            <td><%=iCQ%> <%=unitX%>
                                                            </td>
                                                            <td><%=rs.getString("itemCondition")%>
                                                            </td>
                                                        </tr>
                                                        <%
                                                                }
                                                            } catch (Exception e) {
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
                                                <button type="button" class="btn new-item-btn"  href="#mCAdd" data-toggle="modal">NEW ITEM</button>
                                                <table class="table table-borderless table-striped table-earning">
                                                    <tr>
                                                            <%
					  			try {
					  			      String queryX = "select itemName , itemForm ,sum(itemTotalQuantity), itemUnit from itemdetails d join inventory i " +
					  			       "on d.itemKey=i.itemKey where itemCondition 	= 'OK' and itemLab = 'Chemistry' and itemType ='Consumable'" +
					  			        " group by itemName , itemForm";
                                     counter = stmt.executeQuery(queryX);
                                     while(counter.next()){
                                         String unitX = counter.getString("itemUnit");
                                        int iQ = counter.getInt("sum(itemTotalQuantity)");
                                        if (iQ > 1){
                                            unitX = unitX+"s";
                                        }
                                   %>
                                                        <th><%=counter.getString("itemName")%> <%=counter.getString("itemForm")%>
                                                        </th>
                                                        <td><%=iQ%><%=unitX%>
                                                        </td>
                                                            <%
                                    	 }
                               			 } catch (Exception e){
                                   			 e.printStackTrace();
                               			 }
		       					%>
                                                </table>
                                                <div class="table-responsive table--no-card m-b-40">
                                                    <table class="table table-borderless table-striped table-earning"
                                                           id="CTable">
                                                        <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Name</th>
                                                            <th>Form</th>
                                                            <th>Description</th>
                                                            <th>Measure</th>
                                                            <th>Expiration</th>
                                                            <th>Condition</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                            try {


                                                                query = "select * from itemdetails d join inventory i on d.itemKey = i.itemKey where itemLab = 'Chemistry' and itemType ='Consumable'";
                                                                rs = stmt.executeQuery(query);

                                                                while (rs.next()) {

                                                                    String EEdate = rs.getString("itemDate");
                                                                    String unitX = rs.getString("itemUnit");
                                                                    int iQ = rs.getInt("itemTotalQuantity");
                                                                    if (EEdate == null) {
                                                                        EEdate = "N/A";
                                                                    }

                                                                    if (iQ > 1) {
                                                                        unitX = unitX + "s";
                                                                    }

                                                        %>
                                                        <tr data-toggle="modal" id="mCEDit">
                                                            <td><%=rs.getString("itemKey")%>
                                                            </td>
                                                            <td><%=rs.getString("itemName")%>
                                                            </td>
                                                            <td><%=rs.getString("itemForm")%>
                                                            </td>
                                                            <td><%=rs.getString("itemDesc") %>
                                                            </td>
                                                            <td><%=iQ%> <%=unitX%>
                                                            </td>
                                                            <td><%=EEdate%>
                                                            </td>
                                                            <td><%=rs.getString("itemCondition")%>
                                                            </td>
                                                        </tr>
                                                        <%
                                                                }
                                                            } catch (Exception e) {
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

    <!-- Add Equipment Modal -->
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mEAdd" data-keyboard="false">
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
                <td><input type="text" name="date" class="input-modal--date" placeholder="yy/mm/dd" id = "date"></td>
            </tr>
        </table>
		</pre>
                </div>
                <div class="modal-footer">
                    <input type="text" name="type" class="input-modal" value="Equipment" hidden>
                    <input type="text" name="lab" class="input-modal" value="Chemistry" hidden>
                    <input type="submit" class="btn btn-default btn-md" value="Add">
                    <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

    <!-- Add Apparatus Modal -->
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mAAdd" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>New Apparatus</h4></div>
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
                <td><label class="label-modal">Quantity</label></td>
                <td><input type="text" name="quantity" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Unit</label></td>
                <td><select name = "unit" class = "select-modal">
                    <option> Piece </option>
                    </select></td>
            </tr>
        </table>


		</pre>
                    </div>
                    <div class="modal-footer">
                        <input type="text" name="type" class="input-modal" value="Apparatus" hidden>
                        <input type="text" name="lab" class="input-modal" value="Chemistry" hidden>
                        <datalist id="name">

                        </datalist>
                        <input type="submit" class="btn btn-default btn-md" value="Add">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Add Consumable Modal -->
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mCAdd" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>New Consumable</h4></div>
                <form action="../checkNew" method="post">

                    <div class="modal-body">

		<pre class="tab">
            <table class="table table-borderless table-earning" style="border-spacing:20px">
                <tr>
                    <td><label class="label-modal">Name</label>
                <td><input type="text" name="name" class="input-modal" list="nameR"></td>
                </tr>
                        <tr>
                        <td><label class="label-modal">Form</label></td>
                 <td><input type="text" name="form" class="input-modal" list="nameR"></td>
                        </tr>
                <tr>
                <td><label class="label-modal">Description</label></td>
                 <td><input type="text" name="desc" class="input-modal"></td>
                </tr>
                <tr>
                <td><label class="label-modal">Quantity</label></td>
                 <td><input type="text" name="quantity" class="input-modal"></td>
                </tr>
                <tr>
                <td><label class="label-modal">Unit</label></td>
                 <td><select name = "unit" class = "select-modal">
                    <option> Piece </option>
                     <option> Militter </option>
                    <option> Litter</option>
                     </select></td>
                </tr>
                <tr>
                <td><label class="label-modal">Expiration Date</label></td>
                   <td><input type="text" name="date" class="input-modal--date" id="date1"></td>
                </tr>
            </table>
        </pre>
                    </div>
                    <div class="modal-footer">
                        <input type="text" name="type" class="input-modal" value="Consumable" hidden>
                        <input type="text" name="lab" class="input-modal" value="Chemistry" hidden>
                        <datalist id="name">

                        </datalist>
                        <input type="submit" class="btn btn-default btn-md" value="Add">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Add New Apparatus Modal -->
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mNewA" data-keyboard="false" data-backdrop = "static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>New Apparatus</h4></div>
                <form action="../addNew" method="post">

                    <div class="modal-body">

		<pre class="tab">
        <table class="table table-borderless table-earning" style="border-spacing:20px">
             <tr>
                <td><label class="label-modal">Code</label></td>
                <td> <select name="abbv" class="select-modal">
                    <option> <%= abbv1 %></option>
                    <option><%= abbv2 %></option>
                     <option><%= abbv3 %></option>
                    </select>
                </td>
            </tr><br>
           <tr>
                <td><label class="label-modal">Name</label></td>
                <td><input type="text" name="name" class="input-modal" list="nameR" value = "<%=iName%>" readonly></td>
            </tr><br>
            <tr>
                <td><label class="label-modal">Description</label></td>
                <td><input type="text" name="desc" class="input-modal" value = "<%=iDesc%>"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Quantity</label></td>
                <td><input type="text" name="quantity" class="input-modal" value = "<%=iQuantity%>"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Unit</label></td>
                <td><select name = "unit" class = "select-modal">
                    <option> Piece </option>
                    </select></td>
            </tr>
        </table>
		</pre>
                    </div>
                    <div class="modal-footer">
                        <input type="text" name="type" class="input-modal" value="Apparatus" hidden>
                        <input type="text" name="lab" class="input-modal" value="Chemistry" hidden>
                        <input type="submit" class="btn btn-default btn-md" value="Add">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Add New Equipement Modal -->
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mNewE" data-keyboard="false" data-backdrop = "static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>New Equipment</h4></div>
                <form action="../addNew" method="post">

                    <div class="modal-body">

		<pre class="tab">
        <table class="table table-borderless table-earning" style="border-spacing:20px">
             <tr>
                <td><label class="label-modal">Code</label></td>
                <td> <select name="abbv" class="select-modal">
                    <option> <%= abbv1 %></option>
                    <option><%= abbv2 %></option>
                     <option><%= abbv3 %></option>
                    </select>
                </td>
            </tr><br>
            <tr>
                <td><label class="label-modal">Name</label></td>
                <td><input type="text" name="name" class="input-modal" value = "<%=iName%>" readonly></td>
            </tr>
            <tr>
                <td><label class="label-modal">Description</label></td>
                <td><input type="text" name="desc" class="input-modal"value = "<%=iDesc%>"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Calibration date</label></td>
                <td><input type="text" name="date" id="date2" class="input-modal--date" placeholder="yy/mm/dd"value = "<%=iDate%>"></td>
            </tr>
        </table>
		</pre>
                    </div>
                    <div class="modal-footer">
                        <input type="text" name="type" class="input-modal" value="Equipment" hidden>
                        <input type="text" name="lab" class="input-modal" value="Chemistry" hidden>
                        <input type="submit" class="btn btn-default btn-md" value="Add">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Add New Consumable Modal -->
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mNewC" data-keyboard="false" data-backdrop = "static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>New Consumable</h4></div>
                <form action="../addNew" method="post">

                    <div class="modal-body">

		<pre class="tab">
        <table class="table table-borderless table-earning" style="border-spacing:20px">
             <tr>
                <td><label class="label-modal">Code</label></td>
                <td> <select name="abbv" class="select-modal">
                    <option> <%= abbv1 %></option>
                    <option><%= abbv2 %></option>
                     <option><%= abbv3 %></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td> <select name="fAbbv" class="select-modal">
                    <option> <%= abbvF1 %></option>
                    <option><%= abbvF2 %></option>
                     <option><%= abbvF3 %></option>
                    </select>
                </td>
            </tr>
           <tr>
                    <td><label class="label-modal">Name</label>
                <td><input type="text" name="name" class="input-modal" value = "<%= iName%>" readonly></td>
                </tr>
                        <tr>
                        <td><label class="label-modal">Form</label></td>
                 <td><input type="text" name="form" class="input-modal" value = "<%= iForm%>" readonly></td>
                        </tr>
                <tr>
                <td><label class="label-modal">Description</label></td>
                 <td><input type="text" name="desc" class="input-modal" value = "<%= iDesc%>"></td>
                </tr>
                <tr>
                <td><label class="label-modal">Quantity</label></td>
                 <td><input type="text" name="quantity" class="input-modal" value = "<%= iQuantity%>"></td>
                </tr>
                <tr>
                <td><label class="label-modal">Unit</label></td>
                 <td><select name = "unit" class = "select-modal">
                    <option> Piece </option>
                     <option> Militter </option>
                    <option> Litter</option>
                     </select></td>
                </tr>
                <tr>
                <td><label class="label-modal">Expiration Date</label></td>
                   <td><input type="text" name="date" class="input-modal--date" value = "<%= iDate%>" id = "date3"></td>
                </tr>
        </table>
		</pre>
                    </div>
                    <div class="modal-footer">
                        <input type="text" name="type" class="input-modal" value="Consumable" hidden>
                        <input type="text" name="lab" class="input-modal" value="Chemistry" hidden>
                        <input type="submit" class="btn btn-default btn-md" value="Add">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Equipment Modal -->
    <div class="modal fade" id="mEEdit" tabindex="-1" role="dialog" aria-hidden="true"  >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Edit Equipment</h4></div>
                <form action="../editItem" method="post">

                    <div class="modal-body">

		<pre class="tab">
            <h2><input type="text" name="code" id = "EID" readonly></h2>
        <table class="table table-borderless table-earning" style="border-spacing:20px">
            <tr>
                <td><label class="label-modal">Name</label></td>
                <td><input type="text" name="name" class="input-modal" id = "EName" readonly></td>
            </tr>
            <tr>
                <td><label class="label-modal">Description</label></td>
                <td><input type="text" name="desc" class="input-modal" id = "EDesc"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Calibration date</label></td>
                <td><input type="text" name="date" class="input-modal--date" placeholder="yy/mm/dd" id = "EDate"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Condition</label></td>
                <td><input type="text" name="condi" class="input-modal" id = "ECondi"></td>
            </tr>
            <tr>
                                            <td></td>
                                            <td><input type="submit" name = "response" class="btn btn-default btn-md" value="Edit" >&emsp;<input type="submit" name = "response" class="btn btn-default btn-md" value="Delete" ></td>
                                        </tr>
        </table>
		</pre>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Apparatus Modal -->
    <div class = "modal fade" id = "mAEdit" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class = "modal-content">
                <div class="modal-body">
                    <div role = "tabpanel">
                        <!-- Nav tabs -->
                        <ul class ="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link" href = "#AAQ" aria-controls="AAQ"  data-toggle ="tab">Add Quantity</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href = "#AE" aria-controls="AE"  data-toggle ="tab">Edit Apparatus</a>
                            </li>
                        </ul>
                        <!-- Tabs -->
                        <div class="tab-content">
                            <!-- Add Quantity -->
                            <div  class="tab-pane" id="AAQ">
                                <form action="../editItem" method="post">
                                    <h2 ><input type="text" name="code" id = "AID" readonly></h2>
                                    <table class="table table-borderless table-earning" style="border-spacing:20px">
                                        <tr>
                                            <td><label class="label-modal">Quantity</label></td>
                                            <td><input type="text" name="quantityT" class="input-modal" ></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><input type="submit" name = "response" class="btn btn-default btn-md" value="Add" ></td>
                                        </tr>
                                    </table>

                                </form>
                            </div>
                            <!-- Edit -->
                            <div class="tab-pane active" id="AE">
                                <form action ="../editItem" method="post">
                                    <h2><input type="text" name="code" id = "AID" readonly></h2>
                                    <table class="table table-borderless table-earning" style="border-spacing:20px">
                                        <tr>
                                            <td><label class="label-modal">Name</label>
                                            <td><input type="text" name="name" class="input-modal" id = "AName" readonly></td>
                                        </tr>
                                        <tr>
                                            <td><label class="label-modal">Description</label></td>
                                            <td><input type="text" name="desc" class="input-modal" id = "ADesc"></td>
                                        </tr>
                                        <tr>
                                            <td><label class="label-modal">Total Quantity</label></td>
                                            <td><input type="text" name="quantityT" class="input-modal" id = "ATQ"></td>
                                        </tr>
                                        <tr>
                                            <td><label class="label-modal">Current Quantity</label></td>
                                            <td><input type="text" name="quantityC" class="input-modal" id = "ACQ"></td>
                                        </tr>
                                        <tr>
                                            <td><label class="label-modal">Unit</label></td>
                                            <td><select name = "unit" class = "select-modal" id = "AUnit">
                                                <option> Piece </option>

                                            </select> </td>
                                        </tr>
                                        <tr>
                                            <td><label class="label-modal">Condition</label></td>
                                            <td><input type="text" name="condi" class="input-modal" id = "ACondi"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><input type="submit" name = "response" class="btn btn-default btn-md" value="Edit" >&emsp;<input type="submit" name = "response" class="btn btn-default btn-md" value="Delete" ></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Consumable Modal -->

    <div class = "modal fade" id = "mCEdit" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class = "modal-content">
                <div class="modal-body">
                    <div role = "tabpanel">
                        <!-- Nav tabs -->
                        <ul class ="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link" href = "#CAQ" aria-controls="CAQ"  data-toggle ="tab">Add Quantity</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href = "#CE" aria-controls="CE"  data-toggle ="tab">Edit Consumable</a>
                            </li>
                        </ul>
                        <!-- Tabs -->
                        <div class="tab-content">
                            <!-- Add Quantity -->
                            <div  class="tab-pane" id="CAQ">
                                <form action="../editItem" method="post">
                                    <h2 ><input type="text" name="code" id = "CID" readonly></h2>
                                    <table class="table table-borderless table-earning" style="border-spacing:20px">
                                        <tr>
                                            <td><label class="label-modal">Quantity</label></td>
                                            <td><input type="text" name="quantityT" class="input-modal" ></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><input type="submit" name = "response" class="btn btn-default btn-md" value="Add" ></td>
                                        </tr>
                                    </table>

                                </form>
                            </div>
                            <!-- Edit -->
                            <div class="tab-pane active" id="CE">
                                <form action ="../editItem" method="post">
                                    <h2><input type="text" name="code" id = "CID" readonly></h2>
                                    <table class="table table-borderless table-earning" style="border-spacing:20px">
                                        <tr>
                                            <td><label class="label-modal">Name</label>
                                            <td><input type="text" name="name" class="input-modal" id = "CName" readonly></td>
                                        </tr>
                                        <tr>
                                            <td><label class="label-modal">Form</label></td>
                                            <td><input type="text" name="form" class="input-modal" id = "CForm"readonly></td>
                                        </tr>
                                        <tr>
                                            <td><label class="label-modal">Description</label></td>
                                            <td><input type="text" name="desc" class="input-modal" id = "CDesc"></td>
                                        </tr>
                                        <tr>
                                            <td><label class="label-modal">Quantity</label></td>
                                            <td><input type="text" name="quantityT" class="input-modal" id = "CQuantity"></td>
                                        </tr>
                                        <tr>
                                            <td><label class="label-modal">Unit</label></td>
                                            <td><select name = "unit" class = "select-modal" id = "CUnit">
                                                <option> Piece </option>
                                                <option> Militter </option>
                                                <option> Litter</option>
                                            </select> </td>
                                        </tr>
                                        <tr>
                                            <td><label class="label-modal">Expiration Date</label></td>
                                            <td><input type="text" name="date" class="input-modal--date" id = "CDAte"></td>
                                        </tr>
                                        <tr>
                                            <td><label class="label-modal">Condition</label></td>
                                            <td><input type="text" name="condi" class="input-modal" id = "CCondition"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><input type="submit" name = "response" class="btn btn-default btn-md" value="Edit" >&emsp;<input type="submit" name = "response" class="btn btn-default btn-md" value="Delete" ></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Jquery JS-->
<script src="../vendor/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Bootstrap JS-->
<script src="../vendor/bootstrap-4.1/popper.min.js"></script>
<script src="../vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS -->
<script src="../vendor/slick/slick.min.js"></script>
<script src="../vendor/wow/wow.min.js"></script>
<script src="../vendor/animsition/animsition.min.js"></script>
<script src="../vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<script src="../vendor/counter-up/jquery.waypoints.min.js"></script>
<script src="../vendor/datatables/datatables.min.js"></script>
<script src="../vendor/counter-up/jquery.counterup.min.js"></script>
<script src="../vendor/circle-progress/circle-progress.min.js"></script>
<script src="../vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="../vendor/chartjs/Chart.bundle.min.js"></script>
<script src="../vendor/select2/select2.min.js"></script>
<script src="../vendor/gigjo/js/gijgo.min.js"></script>
<!-- Main JS-->
<script src="../js/main.js"></script>
<script name="pageScripts" type="text/javascript">

    //modal show on url
    $(document).ready(function () {

        if (window.location.href.indexOf('#mNewC') != -1) {
            $('#mNewC').modal('show');
        }
        if (window.location.href.indexOf('#mNewE') != -1) {
            $('#mNewE').modal('show');
        }
        if (window.location.href.indexOf('#mNewA') != -1) {
            $('#mNewA').modal('show');
        }
    });

    //ETable
    $(document).ready(function () {
        var eTable = $("#ETable").DataTable({
            "paging" : false
        });
        $('#ETable tbody').on('click', 'tr', function () {
            var eTableData = eTable.row(this).data();
            $('#mEEdit').modal('show');
            $(".modal-body #EID").val(eTableData[0]);
            $(".modal-body #EName").val(eTableData[1]);
            $(".modal-body #EDesc").val(eTableData[2]);
            $(".modal-body #EDate").val(eTableData[3]);
            $(".modal-body #ECondi").val(eTableData[4]);
        });
    });

    //ATable
    $(document).ready(function () {
        var aTable = $("#ATable").DataTable({
            "paging" : false
        });
        $('#ATable tbody').on('click', 'tr', function () {
            var aTableData = aTable.row(this).data();
            var x = aTableData[3];
            var y = aTableData[4];
            var tq = x.split(" ");
            var cq = y.split(" ");
            $('#mAEdit').modal('show');
            $(".modal-body #AID").val(aTableData[0]);
            $(".modal-body #AName").val(aTableData[1]);
            $(".modal-body #ADesc").val(aTableData[2]);
            $(".modal-body #ATQ").val(tq[0]);
            $(".modal-body #ACQ").val(cq[0]);
            $(".modal-body #AUnit").val(tq[1]);
            $(".modal-body #ACondi").val(aTableData[5]);
        });
    });

    //CTable
    $(document).ready(function () {
        var cTable = $("#CTable").DataTable({
            "paging" : false
        });
        $('#CTable tbody').on('click', 'tr', function () {
            var CtableData = cTable.row(this).data();
            var x = CtableData[4];
            var q = x.split(" ");
            $('#mCEdit').modal('show');
            $(".modal-body #CID").val(CtableData[0]);
            $(".modal-body #CName").val(CtableData[1]);
            $(".modal-body #CForm").val(CtableData[2]);
            $(".modal-body #CDesc").val(CtableData[3]);
            $(".modal-body #CQuantity").val(q[0]);
            $(".modal-body #CUnit").val(q[1]);
            $(".modal-body #CDate").val(CtableData[5]);
            $(".modal-body #CCondition").val(CtableData[6]);
        });
    });

    // datepicker
    $(function () {
        $("#date").datepicker({
            format: "yyyy-mm-dd",
            uiLibrary: 'bootstrap4'
        });
    });

    $(function () {
        $("#date1").datepicker({
            format: "yyyy-mm-dd",
            uiLibrary: 'bootstrap4'
        });
    });

    $(function () {
        $("#date2").datepicker({
            format: "yyyy-mm-dd",
            uiLibrary: 'bootstrap4'
        });
    });
    $(function () {
        $("#date3").datepicker({
            format: "yyyy-mm-dd",
            uiLibrary: 'bootstrap4'
        });
    });
    $(function () {
        $("#EDate").datepicker({
            format: "yyyy-mm-dd",
            uiLibrary: 'bootstrap4'
        });
    });
    $(function () {
        $("#CDate").datepicker({
            format: "yyyy-mm-dd",
            uiLibrary: 'bootstrap4'
        });
    });
</script>
</body>
</html>