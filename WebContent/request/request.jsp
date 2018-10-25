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
    <title>Request</title>

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
    ResultSet rs , get;
    String getQ , getUser , query;
    String aKey = "";
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    Class.forName(MYclass);
    con = DriverManager.getConnection(MYdburl);
    stmt = con.createStatement();

    String message = (String)session.getAttribute("rMessage");
    String rID = (String)session.getAttribute("rID");
%>
<div class="page-wrapper">


    <!-- PAGE CONTAINER-->
    <div class="page-container">
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="">
                    <h1>JHLIS</h1>
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <div class = "side-title">Item List</div>
                <div class="item-list-table table-responsive-sm table--no-card ">
                    <table class="table table-borderless table-striped " id = "iTable">
                        <thead>
                        <tr>
                            <th>Sort</th>
                        </tr>
                        </thead>
                        <tbody class = "item-list">
                        <%
                            try {


                                query = "SELECT distinct itemName from itemdetails  ";
                                rs = stmt.executeQuery(query);

                                while(rs.next()){
                        %>
                        <tr data-toggle="modal" >
                            <td ><%=rs.getString("itemName")%>
                            </td>

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
        </aside>
        <!-- END MENU SIDEBAR-->
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
                                            <form method = "post" action = "/logout">
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
            <div class = "mt-0 pb-3 pl-5 page-title">Item Requesting Module</div>
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class = "card text-left" id = "ptab-marg">
                                <div class = "card-header" >
                                    <h3 class = "pt-3 req-header">Your Current Requests</h3>
                                </div>
                                <div class = "card-body">


                                    <div class="col-lg-12">
                                        <button type="button" class="btn new-item-btn-nA"  href="#mEAdd" data-toggle="modal">Add Request</button>
                                        <div class="table-responsive table--no-card m-b-40">
                                            Your Current Requests
                                            <table class="table table-borderless table-striped table-earning" id = "nTable">
                                                <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Date</th>
                                                    <th>Time</th>
                                                    <th>Condition</th>
                                                    <th>Status</th>
                                                    <th>Date Required</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <%
                                                    try {

                                                        aKey = (String)session.getAttribute("aKey");
                                                        query = "SELECT * from request where aKey = '"+aKey+"'";
                                                        rs = stmt.executeQuery(query);

                                                        while(rs.next()){
                                                %>
                                                <tr data-toggle="modal" id="mRView">
                                                    <td><%=rs.getString("rID")%>
                                                    </td>
                                                    <td><%=rs.getString("rDate")%>
                                                    </td>
                                                    <td><%=rs.getString("rTime")%>
                                                    </td>
                                                    <td><%=rs.getString("rCondition") %>
                                                    </td>
                                                    <td><%=rs.getString("rStatus")%>
                                                    </td>
                                                    <td><%=rs.getString("rDateRequired")%>
                                                    </td>

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

    <!-- Add Request Modal -->
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mEAdd" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>New Request</h4></div>
                <form action="../addRequest" method="post" name ="addRequest">

                    <div class="modal-body">

		<pre class="tab">
        <table class="table table-borderless table-earning" style=  "border-spacing:20px">
            <tr>
                <td><label class="label-modal">Message</label></td>
            <td><input type="text" name="message" class ="input-modal" ></td>

            </tr>
            <tr>
                <td><label class="label-modal">Date Required</label></td>
                <td><input type="text" name="date"  class="input-modal--date" placeholder="yy/mm/dd" ></td>
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

    <!-- View Request Modal -->
    <div class="modal fade" id="message" tabindex="-1" role="dialog" aria-hidden="true"  >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Message</h4></div>
                <form action="" method="post">

                    <div class="modal-body">

		<pre class="tab">

            <div class = "m-1"><%=message%></div>

		</pre>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- View Request Modal -->
    <div class="modal fade" id="mEgdit" tabindex="-1" role="dialog" aria-hidden="true"  >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Message</h4></div>
                <form action="../showMessage" method="post" id = "getMessage">

                    <div class="modal-body">

		<pre class="tab">
            <input type="text" name="rID" id = "rID" hidden>
            <input type="text" name="location" value = "prof" hidden>


		</pre>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- View Item Modal -->
    <div class="modal fade" id="m3" tabindex="-1" role="dialog" aria-hidden="true"  >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Message</h4></div>
                <form action="../showMessage" method="post" id = "getItem">

                    <div class="modal-body">

		<pre class="tab">
            <input type="text" name="rID" id = "iID" >
            <input type="text" name="location" value = "item" hidden>


		</pre>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- View Item Modal -->
    <div class="modal fade" id="item" tabindex="-1" role="dialog" aria-hidden="true"  >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4></h4></div>
                <form action="" method="post">
                    <div class="modal-body">
		<pre class="tab">
            <div class="table-responsive-sm table--no-card ">
                    <table class="table table-borderless table-striped  " id = "i2Table">
                        <thead>
                            <th class = "col-md-6"><%=rID%></th>
                            <th class = "col-md-6">Condition</th>
                        </thead>
                        <tbody>
                        <%
                            try {


                                query = "SELECT i.itemKey , i.itemCondition from itemdetails d join inventory i on d.itemKey = i.itemKey where d.itemName = '"+rID+"'  ";
                                rs = stmt.executeQuery(query);

                                while(rs.next()){
                        %>
                        <tr data-toggle="modal" >
                            <td ><%=rs.getString("itemKey")%>
                            </td>
                            <td ><%=rs.getString("itemCondition")%>
                            </td>

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

                        </pre>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Close</button>
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
<script src="../vendor/gigjo/js/gijgo.min.js"></script>
<!-- Main JS-->
<script src="../js/main.js"></script>
<script type = "text/javascript">
    $(document).ready(function(){

        if (window.location.href.indexOf('#message') != -1) {
            $('#message').modal('show');
        }
    });

    $(document).ready(function(){

        if (window.location.href.indexOf('#item') != -1) {
            $('#item').modal('show');
        }
    });

    $(document).ready(function () {
        var eTable = $("#nTable").DataTable();
        $('#nTable tbody').on('click', 'tr', function () {
            var eTableData = eTable.row(this).data();
           // $('#mEgdit').modal('show');
            $(".modal-body #rID").val(eTableData[0]);
            $('#getMessage').submit();

        });
    });

    $(document).ready(function () {
        var iTable = $("#iTable").DataTable();
        $('#iTable tbody').on('click', 'tr', function () {
            var iTableData = iTable.row(this).data();
            //$('#m3').modal('show');
            $(".modal-body #iID").val(iTableData[0]);
            $('#getItem').submit();

        });
    });

    $(document).ready(function () {
        $("#i2Table").DataTable();

    });

    // datepicker
    $(function () {
        $(".input-modal--date").datepicker({
            format: "yyyy-mm-dd",
            uiLibrary: 'bootstrap4'
        });
    });


</script>
</body>
</html>