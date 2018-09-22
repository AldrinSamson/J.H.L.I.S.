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

    <!-- Main CSS-->
    <link href="../css/theme.css" rel="stylesheet" media="all">
</head>
<body class="animsition">
<!-- declarations -->
<%
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
                                                        <img src="../images/icon/avatar-01.jpg"/>
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
     <!-- Main Body -->
     	<div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
           	<div class="row">
           	<div class="col-md-12">
           		<div class = "card text-left" id = "ptab-marg">
				<div class = "card-header" >
					<h3 class = "card-title">Account Management </h3>
					
				</div>
           		<div class = "card-body">
					
			
						<div class="col-lg-12">
                        <button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mEAdd" data-toggle="modal"style = "color:black;">new account</a></button>
						<button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mEEdit" data-toggle="modal"style = "color:black;">edit account</a></button>
                        <div class="table-responsive table--no-card m-b-40">
                        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names..">
                        <table class="table table-borderless table-striped table-earning" id = "Elist">
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
    	<form action="addAccount"  method = "post">
        
		<div class="modal-body">
		
		<pre class = "tab">  
       
    	name     <input type ="text" name = "name"> 
    	username <input type ="text" name = "un">  
            class    <select name = "cls">
            <option>Administrator</option>
            <option>Professor</option>
        </select>
    	id    	 <input type ="text" name = "id">  
    	SQ1      <input type ="text" name = "rq1">  
    	SQA1     <input type ="text" name = "ra1">  
    	SQ2      <input type ="text" name = "rq2">  
    	SQA2     <input type ="text" name = "ra2">  
    	password <input type ="password" name = "pass">
	
      
      
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

		<!-- Edit Equipment Modal -->
		<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mEEdit" data-backdrop="static" data-keyboard="false">
  		<div class="modal-dialog">
    	<div class="modal-content">
    	<div class="modal-header"><h4>Edit Account<i class="fa fa-lock"></i></h4></div>
    	<form action="../editAccount"  method = "post">
		<div class="modal-body">
		<pre class = "tab">
		
     	Code     <input type ="text" name = "aKey">
     	Username <input type ="text" name = "un">
     	Name	 <input type ="text" name = "name">
     	SQ1		 <input type ="text" name = "rq1">
     	SQA1	 <input type ="text" name = "ra1">
     	SQ2 	 <input type ="text" name = "rq2">
     	SQA2 	 <input type ="text" name = "ra2">
     	old pass <input type ="password" name = "oP">
     	new pass <input type ="password" name = "nP">
     	
     	
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
    <script src="../vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="../vendor/circle-progress/circle-progress.min.js"></script>
    <script src="../vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="../vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="../vendor/select2/select2.min.js">
    </script>
	<script type = "text/javascript">
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

</script>
    <!-- Main JS-->
    <script src="../js/main.js"></script>
</body>
</html>