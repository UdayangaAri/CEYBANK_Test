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
	ResultSet r1 = null;
	ResultSet r2 = null;
	ResultSet r3 = null;
	ResultSet r4 = null;
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

<title>Room Rates Management</title>

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
	<%
		try {

			Connection con = DBConnection.getConnection();
			System.out.println("Printing connection object " + con);

			Statement statement = con.createStatement();
			Statement st = con.createStatement();

			r1 = statement.executeQuery("SELECT * FROM branches;");
			//rs = st.executeQuery("select * from branches");

		}

		catch (Exception e) {
			e.printStackTrace();
		}
	%>

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


										<div class="row mt-1 mb-1">


											<div class="col-25">
												<p>
													<b><b>Select Branch</b></b>
												</p>

											</div>
											<div class="col-65">

												<select name="branchidforRates" id="branchidforRates"
													required onchange="this.form.submit()">







													<%
															System.out.println("***************************");
														String branchidforRates = request.getParameter("branchidforRates");
														//session.setAttribute("branchNameRates", b);

														//System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA : "+b);
														//	session.setAttribute("blockNAme", resultset.getString(3));
													%>

													<option value="" disabled selected>Select Branch</option>
													<%
														while (r1.next()) {
													%>

													<option value="<%=r1.getString(1)%>"><%=r1.getString(3)%></option>
													<%
														}
													%>
												</select>
											</div>

										</div>


										<div class="row mt-1 mb-1">


											<div class="col-25">
												<p>
													<b><b>Block </b></b>
												</p>

											</div>
											<div class="col-65">
												<select name="blockidforRates" id="blockidforRates" required
													onchange="this.form.submit()">

													<%
														//	System.out.println("***************************");
														String blockidforRates = request.getParameter("blockidforRates");
														//session.setAttribute("blockIDPass", b);
														//String aa = RoomStatusDAO.getBlockNAmeByID(bb);
														//	session.setAttribute("blockNAme", resultset.getString(3));
													%>

													<option value="" disabled selected>Select Block</option>

													<%
														//String a = RoomStatusDAO.getBlockNAmeByID(branchidforRates);
														String Q2 = "select * from block where block_location=?";
														Connection c2 = DBConnection.getConnection();

														PreparedStatement p2 = c2.prepareStatement(Q2);
														p2.setString(1, branchidforRates);
														//System.out.println("block_location = branch code :" + branch);
														r2 = p2.executeQuery();
														while (r2.next()) {
													%>

													<option value="<%=r2.getString(1)%>"><%=r2.getString(3)%></option>

													<%
														}
													%>
												</select>
											</div>
										</div>

										<div class="row mt-1 mb-1">


											<div class="col-25">
												<p>
													<b><b>Room Type </b></b>
												</p>

											</div>
											<div class="col-65">
												<select name="roomtypeforRates" id="roomtypeforRates"
													required onchange="this.form.submit()">

													<%
														//System.out.println("***************************");

														//String IDofblockroom = request.getParameter("roomno");
														//	System.out.println("ID from session : "+IDofblockroom);

														String roomtypeforRates = request.getParameter("roomtypeforRates");
														//System.out.println("roomtypeforRates : "+roomtypeforRates);
														//session.setAttribute("blockIDPass", b);
														//String aaa = RoomStatusDAO.getBlockNAmeByID(bbb);
														//	session.setAttribute("blockNAme", resultset.getString(3));
													%>

													<option value="" disabled selected>Select Room
														Types</option>

													<%
														String Q3 = "SELECT distinct roomType FROM ceybank_rest.rooms where blockID=?";
														Connection c3 = DBConnection.getConnection();

														PreparedStatement p3 = c3.prepareStatement(Q3);
														p3.setString(1, blockidforRates);
														//System.out.println("block_location = branch code :" + branch);
														r3 = p3.executeQuery();
														while (r3.next()) {
															//String idofblockroom = r3.getString(4);
															System.out.println("id while loop : " + r3.getString(1));
															//session.setAttribute("roomno", r3.getString(4));

															String Q4 = "SELECT distinct RoomTypeName FROM roomtypes where roomTypeId=?";
															Connection c4 = DBConnection.getConnection();
															PreparedStatement p4 = c4.prepareStatement(Q4);
															p4.setString(1, r3.getString(1));
															r4 = p4.executeQuery();
															while (r4.next()) {
																System.out.println("room name: " + r4.getString(1));
													%>

													<option value=""><%=r4.getString(1)%></option>

													<%
														}
														}
													%>
												</select>

											</div>



										</div>

										<div class="row mt-1 mb-1">


											<div class="col-25">
												<p>
													<b><b>Rate </b></b>
												</p>

											</div>
											<div class="col-25">
												<input type="text" name="Rate" id="Rate" value="" required>
											</div>
										</div>
										<div class="row mt-1 mb-1">


											<div class="col-25">
												<p>
													<b><b>Discount </b></b>
												</p>

											</div>

											<div class="col-25">

												<input type="text" id="Rate" name="Rate" value=""
													>
											</div>

											<div class="col-25">
												<label onclick="javascript:yesnoCheck();"> <input
													type="radio" name="options" id="Amount" 
													value="<%   String assignRate_Amount=request.getParameter("Rate");
												System.out.println("rate = "+assignRate_Amount);%>">
													Amount
												</label>
											</div>

											<div class="col-25">
												<label onclick="javascript:yesnoCheck();"> <input
													type="radio" name="options" id="Percentage" value="<%  
													String assignRate_Percentage=request.getParameter("Rate");
												System.out.println("rate = "+assignRate_Percentage);%>">
													Percentage
												</label>

											</div>
											
						<div class="row mt-1 mb-1" style="float: right">
						

							<input type="reset" value="Clear" style="margin-right: 16px;">
							<input type="submit" style="float: left; margin-right: 250px;" value="Next">
					
</div>
										</div>
									</form>

								</div>
							</div>

						</div>
						<!-- Content Row -->





					</div>

				</div>
			</div>
		</div>

	</div>

	<!-- /#page-content-wrapper -->



	<footer class="footer"
		style="background-color: #464646; z-index: 150; position: relative; margin-left: -15px; height: 40px; width: 103%;">
		<div class="container-fluid">

			<ul class="navbar-nav ml-auto mt-2 mt-lg-0">

				<li class="nav-link" style="text-color: #fff; text-align: center"><font
					color="#fffff">Developed By BOC IT Unit</font></li>
			</ul>

		</div>
	</footer>



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
