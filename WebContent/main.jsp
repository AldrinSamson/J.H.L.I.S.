<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "java.sql.*"%>
<%@page import = "java.io.*"%>
<%@ page import = "bean.getBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Bootstrap CDN  --> 
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <script src="bootstrap/jquery/jquery.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <script src="bootstrap/js/moment.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" type = "text/css" href="css/main.css" >

<title></title>

</head>
<body>
<script type="text/javascript">


</script>


<nav class="navbar navbar-default navbar-fixed-top" id = "homenav">
  <div class="container-fluid">
  	<ul class = "nav navbar-nav navbar-left">
  	 
  	</ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a><span id="time-part"></span></a></li>
     
    </ul>
  </div>
</nav>

     
     

<form action="addNewEquip" name = "newequip" method = "post">
<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mAdd" data-backdrop="static" data-keyboard="false">
  		<div class="modal-dialog">
    	 <div class="modal-content">
    	  <div class="modal-header"><h4>New Equip<i class="fa fa-lock"></i></h4></div>
    	
        
	<div class="modal-body">
	<pre class = "tab">
      
      
     item abbv    <input type ="text" name = "abbv">  
	item version <input type ="text" name = "version"> 
	item name  <input type ="text" name = "name"> 
	laboratory <input type ="text" name = "lab"> 
	quantity <input type ="text" name = "quantity"> 
	calibration date <input type ="text" name = "calibdate"> 
      
      
	</pre>
	</div>
      	   
      	   <div class="modal-footer">
                <input type ="submit" id ="addE" class="btn btn-default btn-md" value = "Add Equip">
      	   	<button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
      	   </div>

          </div>
        </div>
    </div>

</form>

<form action="updateQuantity" name = "updateQ" method = "post">
<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mUpdate" data-backdrop="static" data-keyboard="false">
  		<div class="modal-dialog">
    	 <div class="modal-content">
    	  <div class="modal-header"><h4>Add Quantity<i class="fa fa-lock"></i></h4></div>
    	
        
	<div class="modal-body">
	<pre class = "tab">
      
      
   
	item version <input type ="text" name = "version"> 
		item number <input type ="text" name = "num"> 
	item name  <input type ="text" name = "name"> 
	laboratory <input type ="text" name = "lab"> 
	add quantity <input type ="text" name = "addQ"> 

      
      
	</pre>
	</div>
      	   
      	   <div class="modal-footer">
                <input type ="submit" id ="addE" class="btn btn-default btn-md" value = "Add Quantity">
      	   	<button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
      	   </div>

          </div>
        </div>
    </div>

</form>

<br><br><br>

<div class = "panel-body">
<ul class="nav nav-tabs" style ="font-size:16px;" id="altab" >
            <li class="active"><a href="#tabs-1" data-toggle="tab">Equipment</a></li>
            <li><a href="#tabs-2" data-toggle="tab">Chemicals</a></li>
        </ul><br>
<div class= "tab-content">
<a href="#mAdd" data-toggle="modal" class ="nov">
     <span class = "glyphicon glyphicon-plus" style = "font-size:16pt; color:black;"></span></a>
     <a href="#mUpdate" data-toggle="modal" class ="nov">
     <span class = "glyphicon glyphicon-plus" style = "font-size:16pt; color:black;"></span></a>
    <div class="tab-pane fade in active" id="tabs-1">
<table class="table table-hover table-striped scroll" id = "equip">
 <thead>
	 			<tr style = "background-color: #EFF0F1;">
	 				<th>Code</th>
	 				<th>abbv</th>
	 				<th>version</th>
	 				<th>number</th>
	 				<th>name</th>
	 				<th>lab</th>
	 				<th>calibration</th>
	 				<th>currentQ</th>
	 				<th>totalQ</th>
	 				<th>condi</th>
	 				
	 			</tr>
                            </thead>

<tbody>
<%
Connection con;
Statement stmt;
ResultSet rs;
PreparedStatement lps;
String query;
String dburl = getBean.getMyUrl();
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
 try {
                       				con = DriverManager.getConnection(dburl);
                                     stmt = con.createStatement();
                                
                                     query = "SELECT * FROM equipmentMasterList";
                                     rs = stmt.executeQuery(query);
                                     
                                     while(rs.next()){
 
                                %>       
                            
                                <tr>
                                    <td><%=rs.getString("equipmentCode")%></td>
                                    <td><%=rs.getString("itemAbbv")%></td>
                                    <td><%=rs.getString("itemVersion")%></td>
                                    <td><%=rs.getString("itemNum")%></td>
                                    <td><%=rs.getString("itemName")%></td>
                                    <td><%=rs.getString("laboratory")%></td>
                                    <td><%=rs.getString("calibrationDate")%></td>
                                    <td><%=rs.getString("currentQuantity")%></td>
                                    <td><%=rs.getString("totalQuantity")%></td>
                                    <td><%=rs.getString("condition")%></td>
                                </tr>
                         
                              <%    
                                    }

                                } catch (Exception e){
                                    e.printStackTrace();
                                }
                                %>   
</tbody>
</table>
</div>
</div>

<div class="tab-pane fade" id="tabs-2">
<table class="table table-hover table-striped scroll" id = "chem">
 <thead>
	 			<tr style = "background-color: #EFF0F1;">
	 				<th>Code</th>
	 				<th>abbv</th>
	 				<th>version</th>
	 				<th>numer</th>
	 				<th>name</th>
	 				<th>lab</th>
	 				<th>calibration</th>
	 				<th>currentQ</th>
	 				<th>totalQ</th>
	 				<th>condi</th>
	 				
	 			</tr>
                            </thead>

<tbody>
<%
 try {
                       				con = DriverManager.getConnection(dburl);
                                     stmt = con.createStatement();
                                
                                     query = "SELECT * FROM equipmentMasterList";
                                     rs = stmt.executeQuery(query);
                                     
                                     while(rs.next()){
 
                                %>       
                            
                                <tr>
                                    <td><%=rs.getString("equipmentCode")%></td>
                                    <td><%=rs.getString("itemAbbv")%></td>
                                    <td><%=rs.getString("itemVersion")%></td>
                                    <td><%=rs.getString("itemNum")%></td>
                                    <td><%=rs.getString("itemName")%></td>
                                    <td><%=rs.getString("laboratory")%></td>
                                    <td><%=rs.getString("calibrationDate")%></td>
                                    <td><%=rs.getString("currentQuantity")%></td>
                                    <td><%=rs.getString("totalQuantity")%></td>
                                    <td><%=rs.getString("condition")%></td>
                                </tr>
                         
                              <%    
                                    }

                                } catch (Exception e){
                                    e.printStackTrace();
                                }
                                %>   
</tbody>
</table>
</div>
</div>

</body>
</html>