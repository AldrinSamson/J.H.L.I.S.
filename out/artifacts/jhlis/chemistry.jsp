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
    <title>Chemistry</title>

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
					<h3 class = "card-title">  Chemistry Laboratory </h3>
					<ul class="nav nav-tabs ">
					<li class = "nav-item"><a  style = "color : grey;" href="#tab-elist" data-toggle="tab" class = "nav-link active">Equipment</a></li>	
					<li class = "nav-item"><a  style = "color : grey;" href="#tab-clist" data-toggle="tab" class = "nav-link" >Consumables</a></li>
					</ul>
				</div>
           		<div class = "card-body">
					
				<div class= "tab-content">
				
						<div class="tab-pane fade-in active" id="tab-elist">
						<div class="col-lg-12">
                        <h2 class="title-1 m-b-25">Equipment List</h2>
                        <button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mEAdd" data-toggle="modal"style = "color:black;">new equipment</a></button>
						<button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mEEdit" data-toggle="modal"style = "color:black;">edit equipment</a></button>
						<table class="table table-borderless table-striped table-earning" id = "Elist">
					<tr>
					  <%   
					  			try {
					  				
                                     String queryX = "select eName ,sum(totalQ) from equipmentlist where eCondition = 'available'  and totalQ <= 1 and eLab = 'Chemistry' group by eName";
                                     counter = stmt.executeQuery(queryX);
                                     
                                     while(counter.next()){
                                  
                                	%>                                   			
									<th><%=counter.getString("eName")%></th>
									<td><%=counter.getString("sum(totalQ)")%></td>
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
							<th>name</th>
							<th>desc</th>
							<th>calibration</th>
							
							<th>condi</th>
							</tr>
                        </thead>
                        <tbody>
                            <%
                            try {
								query = "select * from equipmentlist where totalQ <= 1 and eLab = 'Chemistry'";
                                rs = stmt.executeQuery(query);
                                             
                                while(rs.next()){
								String CCdate = rs.getString("calibDate");
                                	
                                	if ( CCdate == null){
                                		
                                		CCdate = "N/A";
                                		
                                	}
                            %>
							<tr>
							<td><%=rs.getString("eKey")%></td>
							<td><%=rs.getString("eName")%></td>
							<td><%=rs.getString("eDesc") %></td>
							<td><%=CCdate%></td>
							<td><%=rs.getString("eCondition")%></td>
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
                        <h4>Has Quantity</h4>
                        <table class="table table-borderless table-striped table-earning" id = "Elist">
                          <%   
					  			try {
					  				 
                                     String queryX = "select eName ,sum(totalQ) from equipmentlist where totalQ > 1   and  eLab = 'Chemistry' group by eName";
                                     counter = stmt.executeQuery(queryX);
                                     
                                     while(counter.next()){
                                  
                                	%>                                   			
									<th><%=counter.getString("eName")%></th>
									<td><%=counter.getString("sum(totalQ)")%></td>
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
							<th>name</th>
							<th>desc</th>
							<th>calibration</th>
							<th>currentQ</th>
							<th>totalQ</th>
							<th>condi</th>
							</tr>
                        </thead>
                        <tbody>
                            <%
                            try {
								
                                        
                                query = "select * from equipmentlist where totalQ > 1 and eLab = 'Chemistry'";
                                rs = stmt.executeQuery(query);
                                             
                                while(rs.next()){
                                	
									String CCdate = rs.getString("calibDate");
                                	
                                	if ( CCdate == null){
                                		
                                		CCdate = "N/A";
                                		
                                	}
                                	
                            %>
							<tr>
							<td><%=rs.getString("eKey")%></td>
							<td><%=rs.getString("eName")%></td>
							<td><%=rs.getString("eDesc") %></td>
							<td><%=CCdate%></td>
							<td><%=rs.getString("currentQ")%></td>
							<td><%=rs.getString("totalQ")%></td>
							<td><%=rs.getString("eCondition")%></td>
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
                
                		<div class="tab-pane fade-in" id="tab-clist">
						<div class="col-lg-12">
						 <h2 class="title-1 m-b-25">Consumable List</h2>
						<button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mCAdd" data-toggle="modal"style = "color:black;">new consumable</a></button>
						<button type="button" class="btn btn-outline-secondary"><a class ="btn-btn-primary" href="#mCEdit" data-toggle="modal"style = "color:black;">edit consumable</a></button>
						 <table class="table table-borderless table-striped table-earning" id = "Elist">
					<tr>
					  <%   
					  			try {
					  				 
                                     String queryX = "select cName , cForm ,sum(cMeasure) , cUnit from consumablelist where cCondition 	= 'OK' and  cLab = 'Chemistry' group by cName , cForm";
                                     counter = stmt.executeQuery(queryX);
                                     
                                     while(counter.next()){
                                  
                                	%>                                   			
									<th><%=counter.getString("cName")%> <%=counter.getString("cForm")%></th>
									<td><%=counter.getString("sum(cMeasure)")%><%=counter.getString("cUnit")%></td>
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
							<th>name</th>
							<th>Form</th>
							<th>desc</th>
							<th>Measure</th>
							<th>expiration</th>
							<th>condi</th>
							</tr>
                        </thead>
                        <tbody>
                            <%
                            try {
								
                                        
                                query = "select * from consumablelist where cLab = 'Chemistry'";
                                rs = stmt.executeQuery(query);
                                             
                                while(rs.next()){
                                	
                                	String EEdate = rs.getString("cExpireDate");
                                	
                                	if ( EEdate == null){
                                		
                                		EEdate = "N/A";
                                		
                                	}
                            %>
							<tr>
							<td><%=rs.getString("cKey")%></td>
							<td><%=rs.getString("cName")%></td>
							<td><%=rs.getString("cForm")%></td>
							<td><%=rs.getString("cDesc") %></td>
							<td><%=rs.getString("cMeasure")%><%=rs.getString("cUnit")%></td>
							<td><%=EEdate%></td>
							<td><%=rs.getString("cCondition")%></td>
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
		<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mEAdd" data-backdrop="static" data-keyboard="false">
  		<div class="modal-dialog">
    	<div class="modal-content">
    	<div class="modal-header"><h4>New Equip<i class="fa fa-lock"></i></h4></div>
    	<form action="checkType" name = "newequip" method = "post">
       
		<div class="modal-body">
		
		<pre class = "tab">  
       
    	item name    <input name = "name" list = "nameR">
    				<datalist id = "nameR">
    				 <%
         try {
         	
         	
         	String geteName = "select distinct eName from equipmentlist where eLab = 'Chemistry'";
         	getName = stmt.executeQuery(geteName);
        		
         	while (getName.next()){
        
        %>
    				<option ><%=getName.getString("eName") %> </option>
    	<%}
        	}catch (Exception e){
        		
        		e.printStackTrace();
        	}
      	
      	%>
    				 </datalist>  
		item desc 	 <input type ="text" name = "desc"> 
		laboratory 	 <input type ="text" name = "lab"> 
		quantity 	 <input type ="text" name = "quantity"> 
		calibration date <input type ="text" name = "calibDate"> 
      	
      
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
    
    	<!-- new Code Equipment modal -->
		<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mCode" data-backdrop="static" data-keyboard="false">
  		<div class="modal-dialog">
    	<div class="modal-content">
    	<div class="modal-header"><h4>New Equip Type<i class="fa fa-lock"></i></h4></div>
    	<form action="addEquip"  method = "post">
        <% 
        try{
        	String Ename , Edesc, Elab , Eq , EcalibDate , Eabbv1 , Eabbv2 , Eabbv3;
        	Ename =  getBean.getEname();
        	Edesc =  getBean.getEdesc();
        	Elab =  getBean.getElab();
        	Eq =  getBean.getEq();
        	EcalibDate =  getBean.getEcalibDate();
        	Eabbv1 =  getBean.getAbbv1();
        	Eabbv2 =  getBean.getAbbv2();
        	Eabbv3=  getBean.getAbbv3();
        	        	
        %>
		<div class="modal-body">
		<pre class = "tab">  
      	code <select name = "abbv"> 
      		<option > <%= Eabbv1 %></option>
      		<option ><%= Eabbv2 %></option>
      		<option ><%= Eabbv3 %></option>
      		</select>      	
    	item name    <input type ="text" name = "name" value = <%=Ename %>>  
		item desc 	 <input type ="text" name = "desc"value = <%=Edesc %>> 
		laboratory 	 <input type ="text" name = "lab"value = <%=Elab %>> 
		quantity 	 <input type ="text" name = "quantity"value = <%=Eq %>> 
		calibration date <input type ="text" name = "calibDate"value = <%=EcalibDate %>> 
      
      
		</pre>
		</div>
      	   <% }catch (Exception e){
      		   e.printStackTrace();
      	   }
        
        %>
      	<div class="modal-footer">
        <input type ="submit" id ="addET" class="btn btn-default btn-md" value = "Add Type">
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
    	<div class="modal-header"><h4>Add Quantity<i class="fa fa-lock"></i></h4></div>
    	        
		<div class="modal-body">
		<pre class = "tab">
		<form action="updateQuantity" method ="post">
       	Add Quantity    
		code <input type ="text" name = "eKey"> 
		add quantity <input type ="text" name = "addQ">
      	<input type ="submit"  class="btn btn-default btn-md" value = "Add Quantity">
		</form>
      	<form action="editEquip"  method = "post">
     	Edit
     	item code <input type ="text" name = "code">
     	item desc <input type ="text" name = "desc">
     	lab <input type ="text" name = "lab">
     	calib <input type ="text" name = "calibDate">
     	currentq <input type ="text" name = "cQ">
     	totalq <input type ="text" name = "tQ">
     	condition <input type ="text" name = "condi">
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
    	
    	 <!-- Consumable add modal -->
		<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mCAdd" data-backdrop="static" data-keyboard="false">
  		<div class="modal-dialog">
    	<div class="modal-content">
    	<div class="modal-header"><h4>New Consumable<i class="fa fa-lock"></i></h4></div>
    	<form action="checkCType" name = "newequip" method = "post">
       
		<div class="modal-body">
		
		<pre class = "tab">  
       
    	item name    <input name = "cName" list = "nameD">
    				<datalist id = "nameD">
    				 <%
         try {
         	
         	
         	String geteName = "select distinct cName from consumablelist where cLab = 'Chemistry'";
         	getName = stmt.executeQuery(geteName);
        		
         	while (getName.next()){
        
        %>
    				<option ><%=getName.getString("cName") %> </option>
    	<%}
        	}catch (Exception e){
        		
        		e.printStackTrace();
        	}
      	
      	%>
    				 </datalist>
    	 item form    <input name = "cForm" list = "nameQ">
    				<datalist id = "nameQ">
    				 <%
         try {
         	
         	
         	String geteName = "select distinct cForm from consumablelist where cLab = 'Chemistry'";
         	getName = stmt.executeQuery(geteName);
        		
         	while (getName.next()){
        
        %>
    				<option ><%=getName.getString("cForm") %> </option>
    	<%}
        	}catch (Exception e){
        		
        		e.printStackTrace();
        	}finally {
     	   		 if(con != null)  {
   		   	        try{ con.close(); } catch( SQLException ignored ) {}
   		   	    }
     		 }
      	
      	%>
    				 </datalist>   
		item desc 	 <input type ="text" name = "cDesc"> 
		laboratory 	 <input type ="text" name = "cLab"> 
		Measure	<input type ="text" name = "cMeasure"> <select name = "cUnit">
														<option>mL</option>
														<option>L</option>
														</select> 
		expiration date <input type ="text" name = "cExpireDate"> 
      	
      
		</pre>
		</div>
      	   
      	<div class="modal-footer">
        <input type ="submit" id ="addE" class="btn btn-default btn-md" value = "Add Consumable">
      	<button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
      	</div>
		</form>
        </div>
        </div>
    	</div>
    	
    	<!-- new Code Consumable modal -->
		<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mCCode" data-backdrop="static" data-keyboard="false">
  		<div class="modal-dialog">
    	<div class="modal-content">
    	<div class="modal-header"><h4>New Consumable Type<i class="fa fa-lock"></i></h4></div>
    	<form action="addConsume"  method = "post">
        <% 
        try{
        	String cName , cForm , cDesc , cLab , cUnit , cMeasure , cExpireDate;
        	String abbvC1 , abbvC2 , abbvC3;
        	String abbvCF1 , abbvCF2 , abbvCF3;   
        	
        	cName = getBean.getcName();
        	cForm = getBean.getcForm();
        	cDesc = getBean.getcDesc();
        	cLab = getBean.getcLab();
        	cUnit = getBean.getcUnit();
        	cMeasure = getBean.getcMeasure();
        	cExpireDate = getBean.getcExpireDate();
        	abbvC1 = getBean.getAbbvC1();
        	abbvC2 = getBean.getAbbvC2();
        	abbvC3 = getBean.getAbbvC3();
        	abbvCF1 = getBean.getAbbvCF1();
        	abbvCF2 = getBean.getAbbvCF2();
        	abbvCF3 = getBean.getAbbvCF3();
        %>
		<div class="modal-body">
		<pre class = "tab">  
      	code <select name = "cAbbv">               
      		<option > <%= abbvC1 %></option>
      		<option ><%=abbvC2 %></option>
      		<option ><%= abbvC3 %></option>
      		</select> <select name = "cFAbbv">   
      		<option > <%= abbvCF1 %></option>
      		<option ><%=abbvCF2 %></option>
      		<option ><%= abbvCF3 %></option>
      		</select>     	
    	item name    <input type ="text" name = "cName" value = <%=cName %>> 
    	item form    <input type ="text" name = "cForm" value = <%=cForm %>> 
		item desc 	 <input type ="text" name = "cDesc"value = <%=cDesc %>> 
		laboratory 	 <input type ="text" name = "cLab"value = <%=cLab %>> 
		measure 	 <input type ="text" name = "cMeasure"value = <%=cMeasure %>> <input type ="text" name = "cUnit"value = <%=cUnit %>>
		expiration date <input type ="text" name = "cExpireDate"value = <%=cExpireDate%>> 
      
      
		</pre>
		</div>
      	   <% }catch (Exception e){
      		   e.printStackTrace();
      	   }
        
        %>
      	<div class="modal-footer">
        <input type ="submit" id ="addET" class="btn btn-default btn-md" value = "Add Type">
      	<button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
      	</div>
		</form>
        </div>
        </div>
    	</div>	

		<!-- Edit Consumable Modal -->
		<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mCEdit" data-backdrop="static" data-keyboard="false">
  		<div class="modal-dialog">
    	<div class="modal-content">
    	<div class="modal-header"><h4>Add Measure<i class="fa fa-lock"></i></h4></div>
    	        
		<div class="modal-body">
		<pre class = "tab">
		<form action="updateMeasure" method ="post">
       	Add Measure    
		code <input type ="text" name = "cKey"> 
		add  <input type ="text" name = "addMeasure">
      	<input type ="submit"  class="btn btn-default btn-md" value = "Add ">
		</form>
      	<form action="editConsume"  method = "post">
     	Edit
     	item code <input type ="text" name = "cKey">
     	item desc <input type ="text" name = "cDesc">
     	lab <input type ="text" name = "cLab">
     	expire <input type ="text" name = "cExpireDate">
     	measure <input type ="text" name = "cMeasure"><select name = "cUnit">
														<option>mL</option>
														<option>L</option>
														</select> 
     	condition <input type ="text" name = "cCondition">
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
    	
    	if (window.location.href.indexOf('#mCCode') != -1) {
    		$('#mCCode').modal('show');
    	}
    });
    
 $(document).ready(function(){
    	
    	if (window.location.href.indexOf('#mCode') != -1) {
    		$('#mCode').modal('show');
    	}
    });
    </script>
	
    <!-- Main JS-->
    <script src="js/main.js"></script>
</body>
</html>