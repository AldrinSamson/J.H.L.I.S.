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
    <!-- Main CSS-->
    <link href="../css/theme.css" rel="stylesheet" media="all">
    <link href="../css/custom.css" rel="stylesheet" media="all">


</head>
<body class="animsition">



<!-- declarations -->
<%
    Connection con;
    Statement stmt;
    ResultSet rs, get, counter, getName;
    String getQ, getUser, query;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    Class.forName(MYclass);
    con = DriverManager.getConnection(MYdburl);
    stmt = con.createStatement();

    String iName = getBean.getiName();
    String iForm = getBean.getiForm();
    String iDesc = getBean.getiDesc();
    String iType = getBean.getiType();
    String iLab = getBean.getiLab();
    String iDate = getBean.getiDate();
    String iDateType = getBean.getiDateType();
    int iQuantity = getBean.getiQuantity();
    String iUnit = getBean.getiUnit();

    String abbv1 = getBean.getAbbv1();
    String abbv2 = getBean.getAbbv2();
    String abbv3 = getBean.getAbbv3();
    String abbvF1 = getBean.getAbbvF1();
    String abbvF2 = getBean.getAbbvF2();
    String abbvF3 = getBean.getAbbvF3();
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
                    <li>
                        <a href="../borrow/borrow.jsp">
                            <i class="fas fa-flask"></i>Item Borrow/Return</a>
                    </li>
                    <li class="has-sub">
                        <a class="js-arrow" href="#">
                            <i class="fas fa-table"></i>Laboratory Item Management</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="physics.jsp">Physics Laboratory</a>
                            </li>
                            <li>
                                <a href="chemistry.jsp">Chemistry Laboratory</a>
                            </li>
                            <li>
                                <a href="itemSets.jsp">Item Sets</a>
                            </li>
                            <li>
                                <a href="nonBorrowable.jsp">Non-Borrowable</a>
                            </li>
                        </ul>
                    </li>
                    <li class="has-sub">
                        <a class="js-arrow" href="#">
                            <i class="fas fa-chart-bar"></i>Reports</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="inventoryR.jsp">Inventory Manifest</a>
                            </li>
                            <li>
                                <a href="borrowR.jsp">Borrowing Transactions</a>
                            </li>
                            <li>
                                <a href="requestR.jsp">Request Reports</a>
                            </li>
                            <li>
                                <a href="damageR.jsp">Damage Reports</a>
                            </li>
                            <li>
                                <a href="missingR.jsp">Missing Item Reports</a>
                            </li>
                            <li>
                                <a href="criticalR.jsp">Critical Reports</a>
                            </li>
                            <li>
                                <a href="analyticsR.jsp">Analytics</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="request.jsp">
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
                                <a href="physics.jsp">Physics Laboratory</a>
                            </li>
                            <li>
                                <a href="chemistry.jsp">Chemistry Laboratory</a>
                            </li>
                            <li>
                                <a href="itemSets.jsp">Item Sets</a>
                            </li>
                            <li>
                                <a href="nonBorrowable.jsp">Non-Borrowable</a>
                            </li>
                        </ul>
                    </li>
                    <li class="has-sub">
                        <a class="js-arrow" href="#">
                            <i class="fas fa-chart-bar"></i>Reports</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="inventoryR.jsp">Inventory Manifest</a>
                            </li>
                            <li>
                                <a href="borrowR.jsp">Borrowing Transactions</a>
                            </li>
                            <li>
                                <a href="requestR.jsp">Request Reports</a>
                            </li>
                            <li>
                                <a href="damageR.jsp">Damage Reports</a>
                            </li>
                            <li>
                                <a href="missingR.jsp">Missing Item Reports</a>
                            </li>
                            <li>
                                <a href="criticalR.jsp">Critical Reports</a>
                            </li>
                            <li>
                                <a href="analyticsR.jsp">Analytics</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="request.jsp">
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
                        <div class="col-md-12">
                            <div class="card text-left" id="ptab-marg">
                                <!-- Nav Tabs -->
                                <div class="card-header">
                                    <h3 class="card-title"> Physics Laboratory </h3>
                                    <ul class="nav nav-tabs ">
                                        <li class="nav-item"><a style="color : grey;" href="#tab-elist"
                                                                data-toggle="tab" class="nav-link active">Equipment</a>
                                        </li>
                                        <li class="nav-item"><a style="color : grey;" href="#tab-alist"
                                                                data-toggle="tab" class="nav-link">Apparatus</a></li>
                                        <li class="nav-item"><a style="color : grey;" href="#tab-clist"
                                                                data-toggle="tab" class="nav-link">Consumable</a></li>
                                    </ul>
                                </div>
                                <div class="card-body">
                                    <div class="tab-content">

                                        <!--Equipment table-->
                                        <div class="tab-pane fade-in active" id="tab-elist">
                                            <div class="col-lg-12">
                                                <h2 class="title-1 m-b-25">Equipment List  <button type="button" class="btn btn-outline-secondary"  href="#mEAdd" data-toggle="modal"><i
                                                        class="fa fa-plus-square"
                                                        style="color:black;"></i>NEW</button></h2>
                                                <table class="table table-borderless table-striped table-earning">
                                                    <tr>
                                                        <% try {

                                                            String queryX = "select itemName, sum(itemTotalQuantity) from inventory i join itemdetails d on d.itemKey=i.itemKey where itemType ='Equipment'and itemLab ='Physics' group by itemName";
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
                                                        <tr data-toggle="modal" data-target="mEEdit">
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
                                                                query = "select * from itemdetails d join inventory i on d.itemKey = i.itemKey where itemLab = 'Physics' and itemType ='Equipment'";
                                                                rs = stmt.executeQuery(query);

                                                                while (rs.next()) {
                                                                    String CCdate = rs.getString("itemDate");
                                                                    if (CCdate == null) {
                                                                        CCdate = "N/A";
                                                                    }
                                                        %>
                                                        <tr>
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

                                        <!--Consumable table-->
                                        <div class="tab-pane fade-in" id="tab-clist">
                                            <div class="col-lg-12">
                                                <h2 class="title-1 m-b-25">Consumable List</h2>
                                                <button type="button" class="btn btn-outline-secondary"><a
                                                        class="btn-btn-primary" href="#mCAdd" data-toggle="modal"
                                                        style="color:black;">new</a></button>
                                                <table class="table table-borderless table-striped table-earning">
                                                    <tr>
                                                            <%
					  			try {
					  			      String queryX = "select itemName , itemForm ,sum(itemTotalQuantity), itemUnit from itemdetails d join inventory i " +
					  			       "on d.itemKey=i.itemKey where itemCondition 	= 'OK' and itemLab = 'Physics' and itemType ='Consumable'" +
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


                                                                query = "select * from itemdetails d join inventory i on d.itemKey = i.itemKey where itemLab = 'Physics' and itemType ='Consumable'";
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
                <td><input type="text" name="Quantity" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Unit</label></td>
                <td><input type="text" name="Unit" class="input-modal"></td>
            </tr>
        </table>


		</pre>
                    </div>
                    <div class="modal-footer">
                        <input type="text" name="type" class="input-modal" value="Apparatus" hidden>
                        <input type="text" name="lab" class="input-modal" value="Physics" hidden>
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
                 <td><input type="text" name="unit" class="input-modal"></td>
                </tr>
                <tr>
                <td><label class="label-modal">Expiration Date</label></td>
                   <td><input type="text" name="date" class="input-modal--date" id="datepicker"></td>
                </tr>
            </table>
        </pre>
                    </div>
                    <div class="modal-footer">
                        <input type="text" name="type" class="input-modal" value="Consumable" hidden>
                        <input type="text" name="lab" class="input-modal" value="Physics" hidden>
                        <datalist id="name">

                        </datalist>
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
                <td><input type="text" name="name" class="input-modal" value = "<%=iName%>" ></td>
            </tr>
            <tr>
                <td><label class="label-modal">Description</label></td>
                <td><input type="text" name="desc" class="input-modal"value = "<%=iDesc%>"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Calibration date</label></td>
                <td><input type="text" name="date" id="date1" class="input-modal--date" placeholder="yy/mm/dd"value = "<%=iDate%>"></td>
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

    <!-- Edit Consumable Modal -->
    <div class = "modal fade" id = "mCEdit" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class = "modal-content">
                <div class="modal-body">
                    <div role = "tabpanel">
                        <!-- Nav tabs -->
                        <ul class ="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" href = "#CAQ" aria-controls="CAQ"  data-toggle ="tab">Add Quantity</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href = "#CE" aria-controls="CE"  data-toggle ="tab">Edit Consumable</a>
                            </li>
                        </ul>
                        <!-- Tabs -->
                        <div class="tab-content">
                            <!-- Add Quantity -->
                            <div  class="tab-pane active" id="CAQ">Add Quantity
                            </div>

                            <div class="tab-pane" id="CE">Edit Consumable
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
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mCEdit" data-backdrop="static"
         data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Add Measure<i class="fa fa-lock"></i></h4></div>

                <div class="modal-body">
		<pre class="tab">
		<form action="updateMeasure" method="post">
       	Add Measure
		code <input type="text" name="cKey" id="CID">
		add  <input type="text" name="addMeasure">
      	<input type="submit" class="btn btn-default btn-md" value="Add ">
		</form>
      	<form action="editConsume" method="post">
     	Edit
     	item code <input type="text" name="cKey">
     	item desc <input type="text" name="cDesc">
     	lab <input type="text" name="cLab">
     	expire <input type="text" name="cExpireDate">
     	measure <input type="text" name="cMeasure"><select name="cUnit">
														<option>mL</option>
														<option>L</option>
														</select>
     	condition <input type="text" name="cCondition">
		</pre>
                </div>
                <div class="modal-footer">
                    <input type="submit" name="edit" class="btn btn-default btn-md" value="Edit">
                    <input type="submit" name="del" class="btn btn-default btn-md" value="Delete">
                    <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
                </div>
                </form>
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
<!-- Main JS-->
<script src="../js/main.js"></script>
<script name="pageScripts" type="text/javascript">
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


    $(document).ready(function () {
        var eTable = $("#ETable").DataTable();
    });

    $(document).ready(function () {
        var aTable = $("#ATable").DataTable();
    });

    $(document).ready(function () {
        var CtableM = $("#CTable").DataTable();
        $('#CTable tbody').on('click', 'tr', function () {
            var CtableData = CtableM.row(this).data();
            $('#mCEdit').modal('show');
            $(".modal-body #CID").val(CtableData[0]);
            $(".modal-body #CName").val(CtableData[1]);
            $(".modal-body #CType").val(CtableData[8]);
        });
    });

    $(function () {
        $(".input-modal--date").datepicker({
            dateFormat: "yy-mm-dd"
        });
    });
</script>
</body>
</html>