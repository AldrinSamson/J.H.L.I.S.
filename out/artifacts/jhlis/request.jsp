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
    <!-- Main CSS-->
    <link href="../css/theme.css" rel="stylesheet" media="all">
    <link href="../css/custom.css" rel="stylesheet" media="all">
</head>
<body class="animsition">
<!-- declarations -->
<%
    Connection con;
    Statement stmt;
    ResultSet rs , get;
    String getQ , getUser , query;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    Class.forName(MYclass);
    con = DriverManager.getConnection(MYdburl);
    stmt = con.createStatement();
%>
<div class="page-wrapper">


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
                                                    <img src="../images/icon/avatar-01.jpg" alt="John Doe" />
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
                                    <h3 class = "card-title">Item Requesting Module</h3>

                                </div>
                                <div class = "card-body">


                                    <div class="col-lg-12">
                                        <button type="button" class="btn btn-outline-secondary"  href="#mEAdd" data-toggle="modal"><i
                                                class="fa fa-plus-square"
                                                style="color:black;"></i>New Request</button>
                                        <div class="table-responsive table--no-card m-b-40">
                                            Your Current Requests
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
                <form action="../checkNew" method="post">

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
        var eTable = $("#nTable").DataTable();
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