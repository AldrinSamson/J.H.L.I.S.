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
    <title>Account</title>

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
PreparedStatement lps;
String getQ , getUser, query;
String MYdburl = getBean.getMyUrl();
String MYclass = getBean.getMyClass();
Class.forName(MYclass);
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
                                        con = DriverManager.getConnection(MYdburl);
                                        stmt = con.createStatement();
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
        <div class = "pl-5 pb-3 page-title">Account Management</div>
        <div class="section__content section__content--p30">
            <div class="container-fluid">
           	<div class="row">
           	<div class="col-md-12">
           		<div class = "card text-left" id = "ptab-marg">
           		<div class = "card-body">
					
			
						<div class="col-lg-12">
                        <a class ="btn btn-card" href="#mEAdd" data-toggle="modal">New Account</a>
                        <div class="pt-2 table-responsive table--no-card m-b-40">
                        <%--<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names..">--%>
                        <table class="table table-borderless table-striped table-earning" id = "aTable">
                        <thead>
							<tr>
							<th>code</th>
							<th>username</th>
							<th>name</th>
							<th>class</th>
							<th>id</th>
							</tr>
                        </thead>
                        <tbody>
                            <%
                            try {
								con = DriverManager.getConnection(MYdburl);
                                stmt = con.createStatement();
                                        
                                query = "SELECT * FROM account";
                                rs = stmt.executeQuery(query);
                                             
                                while(rs.next()){
                            %>
							<tr>
							<td><%=rs.getString("aKey")%></td>
							<td><%=rs.getString("username")%></td>
							<td><%=rs.getString("aName") %></td>
							<td><%=rs.getString("aClass")%></td>
							<td><%=rs.getString("aID")%></td>
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
        <!-- account add modal -->
		<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mEAdd" data-backdrop="static" data-keyboard="false">
  		<div class="modal-dialog">
    	<div class="modal-content">
    	<div class="modal-header"><h4>New account<i class="fa fa-lock"></i></h4></div>
    	<form action="../addAccount" id = "addAccount" method = "post">
        
		<div class="modal-body">

        <pre class="tab">
        <table class="table table-borderless table-earning" style="border-spacing:20px">
            <tr>
                <td><label class="label-modal">Name</label></td>
                <td><input type="text" name="name" class="input-modal" list="nameR"></td>
            </tr><br>
            <tr>
                <td><label class="label-modal">Username</label></td>
                <td><input type="text" name="un" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Class</label></td>
                <td>
                <select name = "cls">
                    <option>Administrator</option>
                    <option>Professor</option>
                </select>
                </td>
            </tr>
            <tr>
                <td><label class="label-modal">ID</label></td>
                <td><input type="text" name="id" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">SQ1</label></td>
                <td><input type="text" name="rq1" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">SQA1</label></td>
                <td><input type="text" name="ra1" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">SQ2e</label></td>
                <td><input type="text" name="rq2" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">SQA2</label></td>
                <td><input type="text" name="ra1" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Password</label></td>
                <td><input type="password" id = "newAccountPass" name="pass" class="input-modal"></td>
            </tr>
        </table>
		</pre>
		</div>
      	   
      	<div class="modal-footer">
        <input type ="submit" id ="addE" class="btn btn-default btn-md" value = "Add Account">
      	<button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
      	</div>
		</form>
        </div>
        </div>
    	</div>

		<!-- Edit account Modal -->
		<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mAEdit" data-backdrop="static" data-keyboard="false">
  		<div class="modal-dialog">
    	<div class="modal-content">
    	<div class="modal-header"><h4>Edit Account<i class="fa fa-lock"></i></h4></div>
    	<form class = "editAccount" action="../editAccount"  method = "post">
		<div class="modal-body">
		<pre class = "tab">
        <table class="table table-borderless table-earning" style="border-spacing:20px">
            <tr>
                <td><label class="label-modal">Code</label></td>
                <td><input type="text" name="aKey" class="input-modal" id = "aKey" readonly></td>
            </tr><br>
            <tr>
                <td><label class="label-modal">Username</label></td>
                <td><input type="text" name="un" class="input-modal" id = "userName" readonly></td>
            </tr>
            <tr>
                <td><label class="label-modal">Name</label></td>
                <td><input type="text" name="name" class="input-modal" id = "aName" readonly></td>
            </tr>
            <tr>
                <td><label class="label-modal">SQ1</label></td>
                <td><input type="text" name="rq1" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">SQA1</label></td>
                <td><input type="text" name="ra1" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">SQ2e</label></td>
                <td><input type="text" name="rq2" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">SQA2</label></td>
                <td><input type="text" name="ra1" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">Old Password</label></td>
                <td><input type="password" name="oP" class="input-modal"></td>
            </tr>
            <tr>
                <td><label class="label-modal">New Password</label></td>
                <td><input type="password" name="nP" class="input-modal"></td>
            </tr>
        </table>
		</pre>
		</div>
      	<div class="modal-footer">
        <input type ="submit" name="edit" class="btn btn-default btn-md" value = "Edit">
	  	<input type ="submit" name ="del" class="btn btn-default btn-md" value = "Delete">            
      	<button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
      	</div>
		</form>
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

            var aTable = $('#aTable').DataTable();
            $('#aTable tbody').on('click', 'tr', function () {
                var aTableData = aTable.row(this).data();
                $('#mAEdit').modal('show');
                $(".modal-body #aKey").val(aTableData[0]);
                $(".modal-body #userName").val(aTableData[1]);
                $(".modal-body #aName").val(aTableData[2]);
                $(".modal-body #aClass").val(aTableData[3]);
                $(".modal-body #aID").val(aTableData[5]);
            });

        });
$(document).on("keyup", "#search", function(){     
    var val = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$',
    reg = RegExp(val, 'i'),
    text;
    
    $rows.show().filter(function() {
    text = $(this).text().replace(/\s+/g, ' ');
    return !reg.test(text);
    }).hide();
});
function myFunction() {
	  // Declare variables 
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("EList");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    } 
	  }
	}

	$("#addAccount").submit(function(event){
        var passwordRegex = /^.*(?=.{6,20})(?=.*\d)(?=.*[0-9])(?=.*[A-Z])(^[a-zA-Z0-9]+$)/;
        var restriction = passwordRegex.test(document.getElementById('newAccountPass').value);
        //can be changed to dynamic alert later on bitch
        console.log(restriction);
        console.log(document.getElementById('newAccountPass').value);
        if(!restriction) {
            alert("Password restrictions..\n" +
                "1. At least 1 uppercase letter\n" +
                "2. At least one digit\n" +
                "3. Minimum of 6 and a maximum of 20 characters\n" +
                "4. Special Characters are not allowed");
            //use this if you want to clear textbox
            // document.getElementById('newAccountPass').value = "";
            event.preventDefault();
        }
    });

</script>
    <!-- Main JS-->
    <script src="../js/main.js"></script>
</body>
</html>