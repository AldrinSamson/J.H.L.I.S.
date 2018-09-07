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
    <title>Borrow Prototype</title>

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
    <link href="vendor/datatables/datatables.min.css" rel="stylesheet" media="all">


    <!-- Main CSS-->
    <link href ="css/custom.css" rel = "stylesheet" media = "all">
    <link href="css/theme.css" rel="stylesheet" media="all">
</head>
<body class="animsition">
<!-- declarations -->
<%
    Connection con;
    Statement stmt;
    ResultSet rs , get;
    PreparedStatement lps;
    String getQ , getUser , query;
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
                                    <h3 class = "card-title"> Borrowables(Singles Only)(v1)</h3>
                                    <ul class="nav nav-tabs ">
                                        <li class = "nav-item"><a  style = "color : grey;" href="#tab-blist" data-toggle="tab" class = "nav-link active">Borrow</a></li>
                                        <li class = "nav-item"><a  style = "color : grey;" href="#tab-rlist" data-toggle="tab" class = "nav-link" >Return</a></li>
                                    </ul>
                                </div>
                                <div class = "card-body">

                                    <div class ="tab-content">
                                    <div class="tab-pane fade-in active" id="tab-blist">
                                    <div class="col-lg-12">
                                        <div class="table-responsive table--no-card m-b-40">
                                            <table class="table table-borderless table-striped table-earning" id = "borrowETable">
                                                <thead>
                                                <tr data-toggle = "modal" data-target = "mEBorrow">
                                                    <th>ID</th>
                                                    <th>name</th>
                                                    <th>description</th>
                                                    <th>item CQ</th>
                                                    <th>item TQ</th>
                                                    <th>item unit</th>
                                                    <th>item Date</th>
                                                    <th>item condition</th>
                                                    <th>item type</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <%
                                                    try {


                                                        query = "SELECT e.* , i.*   from equipmentdetails e join inventory i on e.eKey = i.itemKey where i.itemCondition ='Available'";
                                                        rs = stmt.executeQuery(query);

                                                        while(rs.next()){
                                                %>
                                                <tr>
                                                    <td><%=rs.getString("e.eKey")%></td>
                                                    <td><%=rs.getString("e.eName")%></td>
                                                    <td><%=rs.getString("e.eDesc")%></td>
                                                    <td><%=rs.getString("i.itemCurrentQuantity")%></td>
                                                    <td><%=rs.getString("i.itemTotalQuantity")%></td>
                                                    <td><%=rs.getString("i.itemUnit")%></td>
                                                    <td><%=rs.getString("i.itemDate")%></td>
                                                    <td><%=rs.getString("i.itemCondition")%></td>
                                                    <td><%=rs.getString("i.itemType")%></td>
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
                                        <div class="tab-pane fade-in active" id="tab-rlist">
                                            <div class="col-lg-12">
                                                <div class="table-responsive table--no-card m-b-40">
                                                    <table class="table table-borderless table-striped table-earning" id = "ReturnETable">
                                                        <thead>
                                                        <tr data-toggle = "modal" data-target = "mEReturn">
                                                            <th>ID</th>
                                                            <th>name</th>
                                                            <th>description</th>
                                                            <th>item CQ</th>
                                                            <th>item TQ</th>
                                                            <th>item unit</th>
                                                            <th>item Date</th>
                                                            <th>item condition</th>
                                                            <th>item type</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%
                                                            try {


                                                                query = "SELECT e.* , i.*   from equipmentdetails e join inventory i on e.eKey = i.itemKey where i.itemCondition ='Borrowed'";
                                                                rs = stmt.executeQuery(query);

                                                                while(rs.next()){
                                                        %>
                                                        <tr>
                                                            <td><%=rs.getString("e.eKey")%></td>
                                                            <td><%=rs.getString("e.eName")%></td>
                                                            <td><%=rs.getString("e.eDesc")%></td>
                                                            <td><%=rs.getString("i.itemCurrentQuantity")%></td>
                                                            <td><%=rs.getString("i.itemTotalQuantity")%></td>
                                                            <td><%=rs.getString("i.itemUnit")%></td>
                                                            <td><%=rs.getString("i.itemDate")%></td>
                                                            <td><%=rs.getString("i.itemCondition")%></td>
                                                            <td><%=rs.getString("i.itemType")%></td>
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
    <!-- borrow -->
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mEBorrow"  data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Borrow Equipement</h4></div>
                <form action="borrowSingle"  method = "post">

                    <div class="modal-body">

		<pre class = "tab">
        <div  style = "display:table">
            <div style = "display:table-cell">
                <label  class = "label-modal">Item Code</label>
                <label  class = "label-modal">Name</label>
                <label  class = "label-modal">Type</label>
                <label  class = "label-modal">Quantity</label>
                <label  class = "label-modal">ID</label>
                <label  class = "label-modal">Name</label>
                <label  class = "label-modal">Class</label>
                <label  class = "label-modal">Supervisor</label>
            </div>
            <div  style = "display:table-cell; position:absolute; top:40px;">
                <input type ="text" name = "iKey" class="input-modal" id = "EID" disabled>
                <input type ="text" name = "iName" class="input-modal" id = "EName"disabled>
                <input type ="text" name = "iType" class="input-modal" id = "EType"disabled>
                <input type ="text" name = "bQuantity" class="input-modal">
                <input type ="text" name = "bID" class="input-modal">
                <input type ="text" name = "bName" class="input-modal">
                <input type ="text" name = "bClass" class="input-modal">
                <input type ="text" name = "bSupervisor" class="input-modal">
            </div>
        </div>
		</pre>
                    </div>

                    <div class="modal-footer">
                        <input type ="submit" class="btn btn-default btn-md" value = "Lend">
                        <button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- return -->
    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id = "mEReturn"  data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4>Return Equipment</h4></div>
                <form action="returnSingle"  method = "post">

                    <div class="modal-body">

		<pre class = "tab">
        <div  style = "display:table">
            <div style = "display:table-cell">
                <label  class = "label-modal">Item Code</label>
                <label  class = "label-modal">Name</label>
                <label  class = "label-modal">Type</label>
            </div>
            <div  style = "display:table-cell; position:absolute; top:40px;">
                <input type ="text" name = "iKey" class="input-modal" id = "EID" disabled>
                <input type ="text" name = "iName" class="input-modal" id = "EName" disabled>
                <input type ="text" name = "iType" class="input-modal" id = "EType" disabled>
            </div>
        </div>
		</pre>
                    </div>
                    <div class="modal-footer">
                        Report:
                        <input type ="submit" name = "bMissing" class="btn btn-default btn-md" value = "Missing">
                        <input type ="submit" name = "bBroken" class="btn btn-default btn-md" value = "Broken">
                        <input type ="submit" name = "bReturn" class="btn btn-default btn-md" value = "Return">
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
<script src="vendor/datatables/datatables.min.js"></script>
<script src="vendor/counter-up/jquery.counterup.min.js">
</script>
<script src="vendor/circle-progress/circle-progress.min.js"></script>
<script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="vendor/chartjs/Chart.bundle.min.js"></script>
<script src="vendor/select2/select2.min.js">
</script>
<script type = "text/javascript">
    $(document).ready(function(){

        if (window.location.href.indexOf('#mNCode') != -1) {
            $('#mNCode').modal('show');
        }
    });

    $(document).ready(function(){
        var borrowETableX = $("#borrowETable").DataTable()
        $('#borrowETable tbody').on('click', 'tr', function(){
            var borrowEdata = borrowETableX.row(this).data();
            $('#mEBorrow').modal('show');
            $(".modal-body #EID").val( borrowEdata[0] );
            $(".modal-body #EName").val( borrowEdata[1] );
            $(".modal-body #EType").val( borrowEdata[8] );
        });
    });

    $(document).ready(function(){
        var ReturnETableX = $("#ReturnETable").DataTable()
        $('#ReturnETable tbody').on('click', 'tr', function(){
            var ReturnEdata = ReturnETableX.row(this).data();
            $('#mEReturn').modal('show');
            $(".modal-body #EID").val( ReturnEdata[0] );
            $(".modal-body #EName").val( ReturnEdata[1] );
            $(".modal-body #EType").val( ReturnEdata[8] );
        });
    });
</script>
<!-- Main JS-->
<script src="js/main.js"></script>
</body>
</html>