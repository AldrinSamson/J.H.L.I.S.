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
    <title>Non-Borrowable</title>

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


    if(session.getAttribute("user") == null){
        out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='../index.html';</script></body></html>");
    }


Connection con;
Statement stmt;
ResultSet rs , get;
String getQ , getUser , query;
String MYdburl = getBean.getMyUrl();
String MYclass = getBean.getMyClass();
Class.forName(MYclass);
con = DriverManager.getConnection(MYdburl);
stmt = con.createStatement();
String nName = (String)session.getAttribute("nName");
String nLab =(String)session.getAttribute("nLab");
String nDesc = (String)session.getAttribute("nDesc");
String abbv1 = (String)session.getAttribute("abbvN1");
String abbv2 = (String)session.getAttribute("abbvN2");
String abbv3 = (String)session.getAttribute("abbvN3");
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
        <div class = "pb-3 pl-5 page-title"> Non-Borrowable</div>
        <div class="section__content section__content--p30">
            <div class="container-fluid">
           	<div class="row">
           	<div class="col-md-12">
           		<div class = "card text-left" id = "ptab-marg">
           		<div class = "p-1 card-body">
					
			
						<div class="col-lg-12">
                            <button type="button" class="btn new-item-btn-nb"  href="#mEAdd" data-toggle="modal">NEW ITEM</button>
                        <div class="table-responsive table--no-card m-b-40">
                        <table class="table table-borderless table-striped table-earning" id = "nTable">
                        <thead>
							<tr>
							<th>ID</th>
							<th>name</th>
							<th>desc</th>
							<th>lab</th>
							<th>condi</th>
							</tr>
                        </thead>
                        <tbody>
                            <%
                            try {
								
                                        
                                query = "SELECT * FROM nonborrowable";
                                rs = stmt.executeQuery(query);
                                             
                                while(rs.next()){
                            %>
							<tr>
							<td><%=rs.getString("nKey")%></td>
							<td><%=rs.getString("nName")%></td>
							<td><%=rs.getString("nDesc") %></td>
							<td><%=rs.getString("nLab")%></td>
							<td><%=rs.getString("nCondition")%></td>
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
     <!-- Main Body End-->           
<!-- Modal -->

        <!-- Add Equipment Modal -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mEAdd" data-keyboard="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header"><h4>New Equipment</h4></div>
                    <form action="../checkNB" method="post">

                        <div class="modal-body">

		<pre class="tab">
        <table class="table table-borderless table-earning" style="border-spacing:20px">
            <tr>
                <td><label class="label-modal">Name</label></td>
                <td><input type="text" name="nName" class="input-modal" ></td>
            </tr>
            <tr>
                <td><label class="label-modal">Description</label></td>
                <td><input type="text" name="nDesc" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Laboratory</label></td>
                <td><input type="text" name="nLab" class="input-modal"></td>
            </tr>
        </table>
		</pre>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-default btn-md" value="Add">
                            <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Add New Equipement Modal -->
        <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mNCode" data-keyboard="false" data-backdrop = "static">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header"><h4>New Equipment</h4></div>
                    <form action="../addNB" method="post">

                        <div class="modal-body">

		<pre class="tab">
        <table class="table table-borderless table-earning" style="border-spacing:20px">
             <tr>
                <td><label class="label-modal">Code</label></td>
                <td> <select name="nAbbv" class="select-modal">
                    <option> <%= abbv1 %></option>
                    <option><%= abbv2 %></option>
                     <option><%= abbv3 %></option>
                    </select>
                </td>
            </tr><br>
            <tr>
                <td><label class="label-modal">Name</label></td>
                <td><input type="text" name="nName" class="input-modal" value = "<%=nName%>" readonly></td>
            </tr>
            <tr>
                <td><label class="label-modal">Description</label></td>
                <td><input type="text" name="nDesc" class="input-modal"value = "<%=nDesc%>"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Laboratory</label></td>
                <td><input type="text" name="nLab" class="input-modal"value = "<%=nLab%>"></td>
            </tr>
        </table>
		</pre>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-default btn-md" value="Save">
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
                    <form action="../editNB" method="post">

                        <div class="modal-body">

		<pre class="tab">
            <h2><input type="text" name="nKey" id = "nID" readonly></h2>
        <table class="table table-borderless table-earning" style="border-spacing:20px">
            <tr>
                <td><label class="label-modal">Name</label></td>
                <td><input type="text" name="nName" class="input-modal" id = "nName" readonly></td>
            </tr>
            <tr>
                <td><label class="label-modal">Description</label></td>
                <td><input type="text" name="nDesc" class="input-modal" id = "nDesc"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Laboratory</label></td>
                <td><input type="text" name="nLab" class="input-modal"  id = "nLab"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Condition</label></td>
                <td><input type="text" name="nCondi" class="input-modal" id = "nCondi"></td>
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
<script type = "text/javascript">
$(document).ready(function(){
	
	if (window.location.href.indexOf('#mNCode') != -1) {
		$('#mNCode').modal('show');
	}
});

$(document).ready(function () {
    var eTable = $("#nTable").DataTable({
        "paging" : false
    });
    $('#nTable tbody').on('click', 'tr', function () {
        var eTableData = eTable.row(this).data();
        $('#mEEdit').modal('show');
        $(".modal-body #nID").val(eTableData[0]);
        $(".modal-body #nName").val(eTableData[1]);
        $(".modal-body #nDesc").val(eTableData[2]);
        $(".modal-body #nLab").val(eTableData[3]);
        $(".modal-body #nCondi").val(eTableData[4]);
    });
});
</script>
</body>
</html>