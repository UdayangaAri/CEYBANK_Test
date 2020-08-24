<!DOCTYPE html>
<%@page import="RoomStatus.StatusRooms"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connections.DBConnection"%>

<%@page import="block_Register.blockBean"%>
<%@page import="block_Register.blockDAO"%>
<%@page import="RoomStatus.RoomStatusDAO"%>
<%@page import="login.LoginDao"%>
<%@page import="login.LoginBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Branches.BranchDao"%>
<%@page import="java.util.List"%>
<%@page import="Branches.Branch"%>
<html lang="en">

<%
	ResultSet resultset = null;
	ResultSet rs = null;
%>



<head>

<!-- #9999ff -->

<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<script type="text/javascript" src="js/clock.js"></script>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Room Status</title>

 <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">




<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">





<style>
div.c {
	text-align: right;
}
div.a {
	width: 80%;
}
.center {
	margin: auto;
	width: 30%;
	padding: 20px;
}
}
</style>
</head>

<body>
<body onload="startTime()">


	<div class="d-flex" id="sidebar-wrapper">

		<!-- Sidebar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div class=container-fluid>
			<div id="content">
				<jsp:include page="_navbar.jsp"></jsp:include>

				<div class="container">
				
				<div class="container mt-5 mb-5">

					<!-- body start -->

					<div class="container mt-3 a">

						<div class="card shadow mb-4">

							<div class="card-header py-3">

								<h4 class="m-0 font-weight-bold text-primary">Room Status</h4>
							</div>
							<div class="card-body" style="left: 30%">


								<!-- /#Type Body Here -->
								<form action="" method="post">
									<%
										String branch = (String) session.getAttribute("branch");
										String branchstatus = RoomStatusDAO.getBranchIDbyLoging(branch);
									%>

									<div class="row mt-1 mb-1">


										<div class="col-25">
											<p>
												<b><b>You branch code</b></b>
											</p>

										</div>
										<div class="col-65">

											<input type="text" name="branchname"
												value="<%=branchstatus%>" disabled
												placeholder="Branchn Name">
										</div>

									</div>


									<div class="row mt-1 mb-1">


										<div class="col-25">
											<p>
												<b><b>Block </b></b>
											</p>

										</div>
										<div class="col-65">
											<select name="ID" id="ID" required
												onchange="this.form.submit()">

												<%
												//	System.out.println("***************************");
													String b = request.getParameter("ID");
													session.setAttribute("blockIDPass", b);
													String a = RoomStatusDAO.getBlockNAmeByID(b);
											
												//	session.setAttribute("blockNAme", resultset.getString(3));
														
												%>

												<option value="" disabled selected>Select Block</option>

												<%
													String Query = "select * from block where block_location=?";
													Connection con = DBConnection.getConnection();
													PreparedStatement ps = con.prepareStatement(Query);
													ps.setString(1, branch);
													//System.out.println("block_location = branch code :" + branch);
													resultset = ps.executeQuery();
													while (resultset.next()) {
		
												%>

												<option value="<%=resultset.getString(1)%>"><%=resultset.getString(3)%></option>

												<%
													}
												%>
											</select>

										</div>

									</div>



								</form>
							</div>
						</div>

					</div>
					<!-- Content Row -->
<div class="container mt-3 a">

						<div class="card shadow mb-4">

							<div class="card-header py-3">

								<h4 class="m-0 font-weight-bold text-primary">Room Status : <%=a%></h4>
							</div>
							</div></div>
					


					<div class="row">
						<%
							String blockIDPass = (String) session.getAttribute("blockIDPass");
						
					
							List<StatusRooms> list = RoomStatusDAO.getRoomDetails(blockIDPass);
							//	String Queryy = "SELECT * FROM rooms where blockID=?;";
							//	Connection conn = DBConnection.getConnection();
							//	PreparedStatement pss = conn.prepareStatement(Queryy);
							//	pss.setString(1, blockIDPass);
							//	rs = pss.executeQuery();
							//	while (rs.next()) {
							//	String id = rs.getString(1);
							//	String roomNo = rs.getString(2);
							//	String roomName = rs.getString(3);
							//	String roomType = rs.getString(4);
							//	String blockID = rs.getString(5);
							//	String Status = rs.getString(6);
							for (StatusRooms e : list) {
						%>
<%if(e.getStatus().equalsIgnoreCase("Available")){ 
 System.out.println("6666666666666666666666666666666666666666666666666666666666666");%>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4 mt-5">
              <div class="card shadow h-100 py-2"  style="background-color:#1cc88a;">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h6 mb-0 font-weight-bold text-white text-uppercase mb-1"><%=e.getStatus()%></div>
                      <div class="h6 mb-0 font-weight-bold text-white"><%=e.getRoomName()%></div>
                    </div>
                   
                  </div>
                </div>
              </div>
            </div>
						
		<%} %>				

<% if(e.getStatus().equalsIgnoreCase("Cleaning")){
	 System.out.println("55555555555555555555555555555555555555555555555");%>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4 mt-5">
              <div class="card shadow h-100 py-2"  style="background-color: #ffc107;">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h6 mb-0 font-weight-bold text-white text-uppercase mb-1"><%=e.getStatus()%></div>
                      <div class="h6 mb-0 font-weight-bold text-white"><%=e.getRoomName()%></div>
                    </div>
                   
                  </div>
                </div>
              </div>
            </div>
						
		<%} %>
<% if(e.getStatus().equalsIgnoreCase("Maintenance")){
	 System.out.println("4444444444444444444444444444444444444");%>
  <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4 mt-5">
              <div class="card shadow h-100 py-2"  style="background-color: #007bff;">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h6 mb-0 font-weight-bold text-white text-uppercase mb-1"><%=e.getStatus()%></div>
                      <div class="h6 mb-0 font-weight-bold text-white"><%=e.getRoomName()%></div>
                    </div>
                   
                  </div>
                </div>
              </div>
            </div>
						
		<%} %>


<% if(e.getStatus().equalsIgnoreCase("Occupied")){
	 System.out.println("333333333333333333333333333333");%>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4 mt-5">
              <div class="card shadow h-100 py-2"  style="background-color:#e74a3b;">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h6 mb-0 font-weight-bold text-white text-uppercase mb-1"><%=e.getStatus()%></div>
                      <div class="h6 mb-0 font-weight-bold text-white"><%=e.getRoomName()%></div>
                    </div>
                   
                  </div>
                </div>
              </div>
            </div>
						
		<%} %>
		<% if(e.getStatus().equalsIgnoreCase("Reserved")){ 
		 System.out.println("2222222222222222222222222222222222222222222");%>

           <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4 mt-5">
              <div class="card shadow h-100 py-2"  style="background-color: #36b9cc;">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h6 mb-0 font-weight-bold text-white text-uppercase mb-1"><%=e.getStatus()%></div>
                      <div class="h6 mb-0 font-weight-bold text-white"><%=e.getRoomName()%></div>
                    </div>
                   
                  </div>
                </div>
              </div>
            </div>
						
		<%}} %>
		
		
		



						<!-- cards starts -->

						<!-- cards end -->
					</div>
				</div>

			</div>
		</div>
		</div>
		
	</div>

	<!-- /#page-content-wrapper -->

<jsp:include page="Footer.jsp"></jsp:include>


	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("active");
		});
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
			});
		});
		var dropdown = document.getElementsByClassName("dropdown-btn");
		var i;
		for (i = 0; i < dropdown.length; i++) {
			dropdown[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var dropdownContent = this.nextElementSibling;
				if (dropdownContent.style.display === "block") {
					dropdownContent.style.display = "none";
				} else {
					dropdownContent.style.display = "block";
				}
			});
		}
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
	</script>



</body>

</html>