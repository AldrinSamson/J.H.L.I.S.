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
    <title>Item Sets</title>

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

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">
   
    
</head>
<body class="animsition">
 
   
<!-- declarations -->
<%
Connection con;
Statement stmt;
ResultSet rs , get , counter , getName ;
PreparedStatement lps;
String getQ , getUser ,query;
String MYdburl = getBean.getMyUrl();
String MSdburl = getBean.getMsUrl();
String MYclass = getBean.getMyClass();
String MSclass = getBean.getMsClass();
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
                        <a class="logo" href="mainv2.html">
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
                            <a href="mainv2.jsp">
                               <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                        </li>
                         <li>
                            <a href="borrow.jsp">
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
                            <a href="account.jsp">
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
                <a href="mainv2.jsp">
                <h1>JHLIS</h1>
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                      
                       <li >
                            <a href="mainv2.jsp">
                               <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                        </li>
                         <li>
                            <a href="borrow.jsp">
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
                            <a href="account.jsp">
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
     <!-- Main Body -->
     	<div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
           	<div class="row">
          
			<div class="col-md-12">
           		<div class = "card text-left" id = "ptab-marg">
				<div class = "card-header" >
					<h3 class = "card-title"> Item Sets</h3>
					<ul class="nav nav-tabs ">
					<li class = "nav-item"><a  style = "color : grey;" href="#tab-elist" data-toggle="tab" class = "nav-link active">Physics Lab</a></li>	
					<li class = "nav-item"><a  style = "color : grey;" href="#tab-clist" data-toggle="tab" class = "nav-link" >Chemistry Lab</a></li>
					</ul>
				</div>
           		<div class = "card-body">
					
				<div class= "tab-content">
				
						<div class="tab-pane fade-in active" id="tab-elist">
						<div class="col-lg-12">
                        <h2 class="title-1 m-b-25">Physics Item Sets</h2>
                        <button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mPAdd" data-toggle="modal"style = "color:black;">new set</a></button>
						<button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mPEdit" data-toggle="modal"style = "color:black;">edit set</a></button>
						<table class="table table-borderless table-striped table-earning" id = "Elist">
					<tr>
					  <%   
					  			try {
					  				
                                     String queryX = "select count(isCondition) from itemsetlist where isCondition = 'available' and isLab = 'Physics'";
                                     counter = stmt.executeQuery(queryX);
                                     
                                     while(counter.next()){
                                  
                                	%>                                   			
									<th>Available</th>
									<td><%=counter.getString("count(isCondition)")%></td>
									<%    
                                    	 }
                               			 } catch (Exception e){
                                   			 e.printStackTrace();
                               			 }
		       					%>
					</table>
                        <div class="table-responsive table--no-card m-b-40">		
                        <table class="table table-borderless table-striped table-earning" id = "Elist">
                        <thead>
							<tr>
							<th>ID</th>
							 <th>condi</th>
							</tr>
                        </thead>
                        <tbody>
                            <%
                            try {
								query = "select * from itemsetlist where isLab = 'Physics'";
                                rs = stmt.executeQuery(query);
                                             
                                while(rs.next()){
								
                            %>
							<tr>
							<td><%=rs.getString("isKey")%></td>
							<td><%=rs.getString("isCondition")%></td>
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
                
                		<div class="tab-pane fade-in " id="tab-clist">
						<div class="col-lg-12">
						 <h2 class="title-1 m-b-25">Chemistry Item Sets</h2>
						 <button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mCAdd" data-toggle="modal"style = "color:black;">new set</a></button>
						<button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mCEdit" data-toggle="modal"style = "color:black;">edit set</a></button>
						 <table class="table table-borderless table-striped table-earning" id = "Elist">
					<tr>
					  <%   
					  			try {
					  				 
                                     String queryX = "select count(isCondition) from itemsetlist where isCondition = 'available' and isLab = 'Chemistry'";
                                     counter = stmt.executeQuery(queryX);
                                     
                                     while(counter.next()){
                                  
                                	%>                                   			
									<th>Available</th>
									<td><%=counter.getString("count(isCondition)")%></td>
									<%    
                                    	 }
                               			 } catch (Exception e){
                                   			 e.printStackTrace();
                               			 }
		       					%>
					</table>
                        <div class="table-responsive table--no-card m-b-40">		
                        <table class="table table-borderless table-striped table-earning" id = "Elist">
                        <thead>
							<tr>
							<th>ID</th>
							<th>condi</th>
							</tr>
                        </thead>
                        <tbody>
                            <%
                            try {
								
                                        
                                query = "select * from itemsetlist where isLab = 'Chemistry'";
                                rs = stmt.executeQuery(query);
                                             
                                while(rs.next()){
                                	
                            %>
							<tr>
							<td><%=rs.getString("isKey")%></td>
							<td><%=rs.getString("isCondition")%></td>
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
        <!-- Equip add modal -->
		<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mPAdd" data-backdrop="static" data-keyboard="false">
  		<div class="modal-dialog">
    	<div class="modal-content">
    	<div class="modal-header"><h4>New Set<i class="fa fa-lock"></i></h4></div>
    	<form action="addSet" method = "post">
       
		<div class="modal-body">
		
		<pre class = "tab">  
       
    	laboratory   <input  type = "text" name = "isLab" >  <!-- hide -->
		
		Equipment
		
		1:      <input name = "is1" list = "is1R">
    			<datalist id = "is1R">
    			<%
                try {
         	
         	
         	    String geteName = "select eKey from equipmentlist where eLab = 'Physics'";
         	    getName = stmt.executeQuery(geteName);
        		
         	    while (getName.next()){
        
                %>
    				<option ><%=getName.getString("eKey") %> </option>
    	       <%
    	       }
        	   }catch (Exception e){
        		e.printStackTrace();
        	   }
      		   %>
    		   </datalist>
    	
    	2:      <input name = "is2" list = "is2R">
    			<datalist id = "is2R">
    			<%
                try {
         	
         	
         	    String geteName = "select eKey from equipmentlist where eLab = 'Physics'";
         	    getName = stmt.executeQuery(geteName);
        		
         	    while (getName.next()){
        
                %>
    				<option ><%=getName.getString("eKey") %> </option>
    	       <%
    	       }
        	   }catch (Exception e){
        		e.printStackTrace();
        	   }
      		   %>
    		   </datalist>
    		  
   		3:      <input name = "is3" list = "is3R">
    			<datalist id = "is3R">
    			<%
                try {
         	
         	
         	    String geteName = "select eKey from equipmentlist where eLab = 'Physics'";
         	    getName = stmt.executeQuery(geteName);
        		
         	    while (getName.next()){
        
                %>
    				<option ><%=getName.getString("eKey") %> </option>
    	       <%
    	       }
        	   }catch (Exception e){
        		e.printStackTrace();
        	   }
      		   %>
    		   </datalist>
    		   
    	4:      <input name = "is4" list = "is4R">
    			<datalist id = "is4R">
    			<%
                try {
         	
         	
         	    String geteName = "select eKey from equipmentlist where eLab = 'Physics'";
         	    getName = stmt.executeQuery(geteName);
        		
         	    while (getName.next()){
        
                %>
    				<option ><%=getName.getString("eKey") %> </option>
    	       <%
    	       }
        	   }catch (Exception e){
        		e.printStackTrace();
        	   }
      		   %>
    		   </datalist>
    		   
    	5:      <input name = "is5" list = "is5R">
    			<datalist id = "is5R">
    			<%
                try {
         	
         	
         	    String geteName = "select eKey from equipmentlist where eLab = 'Physics'";
         	    getName = stmt.executeQuery(geteName);
        		
         	    while (getName.next()){
        
                %>
    				<option ><%=getName.getString("eKey") %> </option>
    	       <%
    	       }
        	   }catch (Exception e){
        		e.printStackTrace();
        	   }
      		   %>
    		   </datalist>
		
		
      	
      
		</pre>
		</div>
      	   
      	<div class="modal-footer">
        <input type ="submit" id ="addE" class="btn btn-default btn-md" value = "Add Equip">
      	<button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
      	</div>
		</form>
        </div>
        </div>
    	</div>
    
    	

</div>    
            
 <!-- Jquery JS-->
    <script src="vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js">
    </script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js">
    </script>
     <script type="text/javascript">
    $(document).ready(function(){
    	
    	if (window.location.href.indexOf('#mCCode') != 1) {
    		$('#mCCode').modal('show');
    	}
    });
    
 	$(document).ready(function(){
    	
    	if (window.location.href.indexOf('#mCode') != 1) {
    		$('#mCode').modal('show');
    	}
    });
    </script>
	
    <!-- Main JS-->
    <script src="js/main.js"></script>
</body>
</html>