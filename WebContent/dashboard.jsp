<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import = "java.sql.*"%>
<%@page import = "java.io.*"%>
<%@ page import = "bean.getBean"%>
<%@ page import="javax.swing.plaf.nimbus.State" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   

    <!-- Title Page-->
    <title>Dashboard</title>

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
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">i
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
    <link href="vendor/datatables/datatables.min.css" rel="stylesheet" media="all">
    <link href="vendor/datatables/datatables.css" rel="stylesheet" media="  all">

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">
    <link href = "css/custom.css" rel = "stylesheet" media = "all">
</head>
<body class="animsition">
<!-- declarations -->
<%
    if(session.getAttribute("user") == null){
        out.println ("<html><body><script type='text/javascript'>alert('Please log-in first.');location='index.html';</script></body></html>");
    }

    Connection con;
    Statement stmt;
    ResultSet rs, get,  rs2 , rs3;
    String getQ, getUser, query;
    String MYdburl = getBean.getMyUrl();
    String MYclass = getBean.getMyClass();
    Class.forName(MYclass);
    con = DriverManager.getConnection(MYdburl);
    stmt = con.createStatement();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
    String date = sdf.format(new Date());


    String message = (String)session.getAttribute("rMessage");
    String rID = (String)session.getAttribute("rID");
    %>

<%!
    public String join(ArrayList<?> arr, String del)
    {

        StringBuilder output = new StringBuilder();

        for (int i = 0; i < arr.size(); i++)
        {

            if (i > 0) output.append(del);
            
            if (arr.get(i) instanceof String) output.append("\"");
            output.append(arr.get(i));
            if (arr.get(i) instanceof String) output.append("\"");
        }

        return output.toString();
    }
%>
<%


    ArrayList<String> itemName = new ArrayList<>();
    ArrayList<String> itemKeyDamaged = new ArrayList<>();
    ArrayList<String> itemKeyMissing = new ArrayList<>();
    ArrayList<Integer> borrowCount = new ArrayList<>();
    ArrayList<Integer> damagedCount = new ArrayList<>();
    ArrayList<Integer> missingCount = new ArrayList<>();

    try {
        String getBorrowTop = "select distinct bItemKey, count(bItemKey) as count from borrowtransaction group by bItemKey order by count desc limit 10";
        rs = stmt.executeQuery(getBorrowTop);

        int x = 0;
        while(x < 10){
            rs.next();
            itemName.add(rs.getString("bItemKey"));
            borrowCount.add(rs.getInt("count"));
            x++;
        }

        rs.close();
    }catch(Exception e){
        e.printStackTrace();
    }

    try {
        String getDamageTop = "select b.bItemKey, d.itemName ,sum(b.bQuantityLoss) as count  from borrowTransaction b join itemdetails d on b.bItemKey = d.itemKey where b.bCondition = 'Damaged' group by b.bItemKey order by sum(b.bQuantityLoss) desc limit 10 ";
        rs2 = stmt.executeQuery(getDamageTop);

        int y = 0;
        while (y < 10){
            rs2.next();
            itemKeyDamaged.add(rs2.getString("bItemKey"));
            damagedCount.add(rs2.getInt("count"));
            y++;
        }
        rs2.close();
    }catch(Exception e){
        e.printStackTrace();
    }

    try {
        String getMissingTop = "select b.bItemKey, d.itemName ,sum(b.bQuantityLoss) as count  from borrowTransaction b join itemdetails d on b.bItemKey = d.itemKey where b.bCondition = 'Missing' group by b.bItemKey order by sum(b.bQuantityLoss) desc limit 10 ";
        rs3 = stmt.executeQuery(getMissingTop);

        int z = 0;
        while (z < 10){
            rs3.next();
            itemKeyMissing.add(rs3.getString("bItemKey"));
            missingCount.add(rs3.getInt("count"));
            z++;
        }
        rs3.close();
    }catch(Exception e){
        e.printStackTrace();
    }

%>
<script>

    var itemNameData = [<%= join(itemName, ",") %>];
    var borrowCountData = [<%= join(borrowCount, ",") %>];
    var itemKeyDamagedData = [<%= join(itemKeyDamaged, ",") %>];
    var damagedCountData = [<%= join(damagedCount, ",") %>];
    var itemKeyMissingData = [<%= join(itemKeyMissing, ",") %>];
    var missingCountData = [<%= join(missingCount, ",") %>];


</script>
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <a class="logo" href="dashboard.jsp">
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
                            <a href="dashboard.jsp">
                                <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-table"></i>Item Borrow/Return</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="borrow/borrow.jsp">Single</a>
                                </li>
                                <li>
                                    <a href="borrow/borrowSet.jsp">Set</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-table"></i>Laboratory Item Management</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="inventory/physics.jsp">Physics Laboratory</a>
                                </li>
                                <li>
                                    <a href="inventory/chemistry.jsp">Chemistry Laboratory</a>
                                </li>
                                <li>
                                    <a href="inventory/itemSets.jsp">Item Sets</a>
                                </li>
                                <li>
                                    <a href="inventory/nonBorrowable.jsp">Non-Borrowable</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-chart-bar"></i>Reports</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="report/inventory.jsp">Inventory Manifest</a>
                                </li>
                                <li>
                                    <a href="report/borrowTransaction.jsp">Borrowing Transactions</a>
                                </li>
                                <li>
                                    <a href="report/damagesMissing.jsp">Damage/Missing Reports</a>
                                </li>
                                <li>
                                    <a href="report/audit.jsp">Audit</a>
                                </li>
                                <li>
                                    <a href="report/insights.jsp">Insights</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="request/requestAdmin.jsp">
                                <i class="far fa-check-square"></i>Requests</a>
                        </li>


                        <li>
                            <a href="account/account.jsp">
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
                <a href="dashboard.jsp">
                    <h1>JHLIS</h1>
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">

                        <li>
                            <a href="dashboard.jsp">
                                <i class="fas fa-tachometer-alt"></i>Dashboard</a>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-table"></i>Item Borrow/Return</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="borrow/borrow.jsp">Single</a>
                                </li>
                                <li>
                                    <a href="borrow/borrowSet.jsp">Set</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-table"></i>Laboratory Item Management</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="inventory/physics.jsp">Physics Laboratory</a>
                                </li>
                                <li>
                                    <a href="inventory/chemistry.jsp">Chemistry Laboratory</a>
                                </li>
                                <li>
                                    <a href="inventory/itemSets.jsp">Item Sets</a>
                                </li>
                                <li>
                                    <a href="inventory/nonBorrowable.jsp">Non-Borrowable</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-chart-bar"></i>Reports</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="report/inventory.jsp">Inventory Manifest</a>
                                </li>
                                <li>
                                    <a href="report/borrowTransaction.jsp">Borrowing Transactions</a>
                                </li>
                                <li>
                                    <a href="report/damagesMissing.jsp">Damage/Missing Reports</a>
                                </li>
                                <li>
                                    <a href="report/audit.jsp">Audit</a>
                                </li>
                                <li>
                                    <a href="report/insights.jsp">Insights</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="request/requestAdmin.jsp">
                                <i class="far fa-check-square"></i>Requests</a>
                        </li>


                        <li>
                            <a href="account/account.jsp">
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

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row dashboard-counter">
                            <a href ="borrow/borrow.jsp" class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <div class = "counter__icon">
                                        <span class = "icon-018"></span>
                                    </div>
                                    <%
                                        try{
                                            String queryx= "select count(*) as count from itemdetails d left join inventory i on d.itemKey = i.itemKey right join borrowtransaction b on i.itemKey = b.bitemKey where d.itemType = 'Equipment' and b.bCondition = 'Not Returned'";
                                            rs = stmt.executeQuery(queryx);

                                            while (rs.next()){

                                    %>
                                    <h2 class="number"><%=rs.getString("count")%></h2>
                                    <%}
                                        }catch(Exception e){
                                            e.printStackTrace();
                                        }
                                    %>
                                    <span class="desc">Equipment Lent</span>
                                </div>
                            </a>
                            <a href ="report/insights.jsp" class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <div class = "counter__icon">
                                        <span class = "icon-275"></span>
                                    </div>
                                    <%
                                        try{
                                            String queryx= "select count(actionType) as count from audit where actionType = 'Critical Quantity' and date = '"+date+"'";
                                            rs = stmt.executeQuery(queryx);

                                            while (rs.next()){

                                    %>
                                    <h2 class="number"><%=rs.getString("count")%></h2>
                                    <%}
                                    }catch(Exception e){
                                        e.printStackTrace();
                                    }
                                    %>
                                    <span class="desc">Critical Quantity</span>
                                </div>
                            </a>
                            <a href ="request/requestAdmin.jsp" class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <div class = "counter__icon">
                                        <span class = "icon-012"></span>
                                    </div>
                                    <%
                                        try{
                                            String queryx= "select count(rID) as count from request where rCondition = 'Pending'";
                                            rs = stmt.executeQuery(queryx);

                                            while (rs.next()){

                                    %>
                                    <h2 class="number"><%=rs.getString("count")%></h2>
                                    <%}
                                    }catch(Exception e){
                                        e.printStackTrace();
                                    }
                                    %>
                                    <span class="desc">Requests Pending</span>
                                </div>
                            </a>
                            <a href ="report/damagesMissing.jsp" class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <div class = "counter__icon">
                                        <span class = "icon-036"></span>
                                    </div>
                                    <%
                                        try{
                                            String queryx= "select count(itemCurrentQuantity) as count from inventory where itemCondition = 'Damaged' ";
                                            rs = stmt.executeQuery(queryx);

                                            while (rs.next()){

                                    %>
                                    <h2 class="number"><%=rs.getString("count")%></h2>
                                    <%}
                                    }catch(Exception e){
                                        e.printStackTrace();
                                    }
                                    %>
                                    <span class="desc">Damaged</span>
                                </div>
                                    </a>

                            <a href ="borrow/borrow.jsp" class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <div class = "counter__icon">
                                        <span class = "icon-017"></span>
                                    </div>
                                    <%
                                        try{
                                            String queryx= "select count(bQuantity) as count from itemdetails d left join inventory i on d.itemKey = i.itemKey right join borrowtransaction b on i.itemKey = b.bitemKey where d.itemType = 'Apparatus' and b.bCondition = 'Not Returned' ";
                                            rs = stmt.executeQuery(queryx);

                                            while (rs.next()){

                                    %>
                                    <h2 class="number"><%=rs.getString("count")%></h2>
                                    <%}
                                    }catch(Exception e){
                                        e.printStackTrace();
                                    }
                                    %>
                                    <span class="desc">Apparatus Borrowed</span>
                                </div>
                            </a>

                            <a href ="report/insights.jsp" class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <div class = "counter__icon">
                                        <span class = "icon-033"></span>
                                    </div>
                                    <%
                                        try{
                                            String queryx= "select count(actionType) as count from audit where actionType = 'Critical Date' and date = '"+date+"'";
                                            rs = stmt.executeQuery(queryx);

                                            while (rs.next()){

                                    %>
                                    <h2 class="number"><%=rs.getString("count")%></h2>
                                    <%}
                                    }catch(Exception e){
                                        e.printStackTrace();
                                    }
                                    %>
                                    <span class="desc">Critical Date</span>
                                </div>
                            </a>

                            <a href ="report/insights.jsp" class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <div class = "counter__icon">
                                        <span class = "icon-087"></span>
                                    </div>
                                    <%
                                        try{
                                            String queryx= "select count(itemCurrentQuantity) as count from inventory where itemCondition = 'Missing'";
                                            rs = stmt.executeQuery(queryx);

                                            while (rs.next()){

                                    %>
                                    <h2 class="number"><%=rs.getString("count")%></h2>
                                    <%}
                                    }catch(Exception e){
                                        e.printStackTrace();
                                    }
                                    %>
                                    <span class="desc">Missing</span>
                                </div>
                            </a>
                                </div>
                            </div>
                        </div>

                <section>
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-8">
                                <div class = "card text-left" >
                                    <div class = "card-body">
                            <canvas id="borrowTop" width="800" height="450"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </section>
                <section>
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-xl-8">
                                    <div class = "card text-left" >
                                        <div class = "card-body">
                                    <canvas id="damagedTop" width="800" height="450"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-xl-8">
                                    <div class = "card text-left" >
                                        <div class = "card-body">
                                    <canvas id="missingTop" width="800" height="450"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->

<!-- Jquery JS-->
<script src="vendor/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Bootstrap JS-->
<script src="vendor/bootstrap-4.1/popper.min.js"></script>
<script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS -->
<script src="vendor/slick/slick.min.js"></script>
<script src="vendor/wow/wow.min.js"></script>
<script src="vendor/animsition/animsition.min.js"></script>
<script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<script src="vendor/counter-up/jquery.waypoints.min.js"></script>
<script src="vendor/datatables/datatables.min.js"></script>
<script src="vendor/counter-up/jquery.counterup.min.js"></script>
<script src="vendor/circle-progress/circle-progress.min.js"></script>
<script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="vendor/chartjs/Chart.bundle.min.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<!-- Main JS-->
<script src="js/main.js"></script>
<script name = "pageScripts">

    $(document).ready(function(){

        if (window.location.href.indexOf('#message') != -1) {
            $('#message').modal('show');
        }
    });

    $(document).ready(function (){
        var RTable= $('#rTable').DataTable();
        $('#rTable tbody').on('click', 'tr', function () {
            var RTableData = RTable.row(this).data();
            //$('#mEgdit').modal('show');
            $(".modal-body #rID").val(RTableData[0]);
            $('#getMessage').submit();
        });
    });

    new Chart(document.getElementById("borrowTop"), {
        type: 'bar',
        data: {
            labels: itemNameData,
            datasets: [
                {
                    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
                    data: borrowCountData
                }
            ]
        },
        options: {
            legend: { display: false },
            title: {
                display: true,
                text: 'Top 10 Most Borrowed'
            }
        }
    });

    new Chart(document.getElementById("damagedTop"), {
        type: 'bar',
        data: {
            labels: itemKeyDamagedData,
            datasets: [
                {
                    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
                    data: damagedCountData
                }
            ]
        },
        options: {
            legend: { display: false },
            title: {
                display: true,
                text: 'Top 10 Most Damaged'
            }
        }
    });

    new Chart(document.getElementById("missingTop"), {
        type: 'bar',
        data: {
            labels: itemKeyMissingData,
            datasets: [
                {
                    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
                    data: missingCountData
                }
            ]
        },
        options: {
            legend: { display: false },
            title: {
                display: true,
                text: 'Top 10 Most Missing'
            }
        }
    });


</script>

</body>
</html>