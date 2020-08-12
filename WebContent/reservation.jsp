<!DOCTYPE html>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="RoomManagement.RoomDao"%>
<%@page import="RoomManagement.Room"%>
<%@page import="block_Register.blockDAO"%>
<%@page import="block_Register.block"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connections.DBConnection"%>
<%@page import="Guest_details.GuestDAO"%>
<%@page import="Guest_details.Guest"%>
<%@page import="login.LoginDao"%>
<%@page import="login.LoginBean"%>
<%@page import="Roles.RoleDao"%>
<%@page import="Roles.Role"%>
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

<title>Home</title>

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<%
	ResultSet rs1 = null;
	ResultSet rx = null;
%>


<%
	String Employees_Branch = (String) session.getAttribute("branch");

	String Guest_Branch = (String) session.getAttribute("branch");

	String Username = (String) session.getAttribute("Username");

	String Pos = (String) request.getAttribute("Pos");
	String cname = (String) request.getAttribute("name");
	String cnic = (String) request.getAttribute("nic");
	String cmobile = (String) request.getAttribute("mobile");
	String cemail = (String) request.getAttribute("email");
	String cst_nonst = (String) request.getAttribute("st_nonst");
	String cpfno = (String) request.getAttribute("pfno");
	String err = (String) request.getAttribute("wrong");
	String cno = (String) request.getAttribute("cno");
	String xString = (String) request.getAttribute("xString");

	String Staff = "Staff";
	String Guest = "Public";

	//System.out.println("Guest_Branch" + (String) session.getAttribute("branch"));
%>


</head>


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



					<div>

						<a href="index.jsp">Index drawer</a> <br>
						
						<a href="NewFile.jsp">reservation.next drawer</a> <br>
						
						<a href="mytest.jsp">my test drawer</a> <br>
						
						<br>


						<div class="card border-dark text-center">

							<div class="card-body">

								<div class="row">

									<div class="col-65">
										<form action="Guest_ViewServlet" method="post">

											<%
												if (cno == null) {
											%>

											<input type="search" name="search" required class="search"
												value="" placeholder="NIC/BOC PF Number/ Mobile Number"
												style="margin-right: 16px;">

											<%
												} else {
											%>
											<input type="search" name="search" required class="search"
												value="<%=cno%>"
												placeholder="NIC/BOC PF Number/ Mobile Number"
												style="margin-right: 16px;">

											<%
												}
											%>
										
									</div>

									<div class="col-25">

										<button type="submit" name="search"
											style="float: left; margin-left: 16px; text-align: center;"
											class="btn btn-primary">Search</button>
										</form>

										<button type="button"
											style="margin-left: 16px; text-align: center;"
											class="btn btn-primary" data-toggle="modal"
											data-target=".bd-example-modal-lg">
											Add Guest<img src="images/add.png" alt="" border=3 height=15
												width=15
												style="text-align: center; float: right; margin-left: 0.5em">
										</button>

									</div>
								</div>

								<%
									if (err == "this is wrong") {
								%>
								<br>
								<div class='alert alert-danger' role='alert'>Please
									register the guest first..</div>

								<%
									}
								%>

								<form method="POST" class="forms" action="Guest_ViewServlet"
									method="post" style="align: center">


									<div class="row">

										<div class="col-25">
											<p>
												<b><b>Guest Details</b></b>
											</p>

										</div>

										<div class="col-75"></div>
									</div>

									<div class="row">

										<div class="col-20">
											<p>Name</p>

										</div>

										<%
											if (cname == null) {
										%>

										<div class="col-75">
											<input type="text" name="nameview" value="" readonly
												placeholder="Name">
										</div>

										<%
											} else {
										%>

										<div class="col-75">
											<input type="text" name="nameview"
												value="<%=Pos%> <%=cname%>" readonly placeholder="Name">
										</div>

										<%
											}
										%>

									</div>


									<div class="row">

										<div class="col-20">
											<p>NIC Number</p>

										</div>

										<%
											if (cnic == null) {
										%>

										<div class="col-75">
											<input type="text" name="nameview" value="" readonly
												placeholder="NIC">
										</div>

										<%
											} else {
										%>

										<div class="col-75">
											<input type="text" name="nameview" value="<%=cnic%>" readonly
												placeholder="NIC">
										</div>

										<%
											}
										%>
									</div>


									<div class="row">

										<div class="col-20">
											<p>Mobile Number</p>

										</div>

										<%
											if (cmobile == null) {
										%>

										<div class="col-75">
											<input type="text" name="mobileview" value="" readonly
												placeholder="Mobile">
										</div>


										<%
											} else {
										%>
										<div class="col-75">
											<input type="text" name="mobileview" value="<%=cmobile%>"
												readonly placeholder="Mobile">
										</div>

										<%
											}
										%>

									</div>

									<div class="row">

										<div class="col-20">
											<p>Email Address</p>

										</div>

										<%
											if (cemail == null) {
										%>

										<div class="col-75">
											<input type="email" name="emailview" value="" readonly
												placeholder="Email">
										</div>

										<%
											} else {
										%>


										<div class="col-75">
											<input type="email" name="emailview" value="<%=cemail%>"
												readonly placeholder="Email">
										</div>

										<%
											}
										%>
									</div>
									<div class="row">


										<div class="col-20">
											<p>Guest Type</p>

										</div>

										<div class="col-75">
											<%
												if (cpfno == null) {
											%>

											<div class="col-25">


												<input type="text" name="pfnovalue" readonly
													style="float: left;" id="pfnovalue" value="Public"
													placeholder="Public">

											</div>


											<div class="col-25">


												<input type="text" name="pfnovalue" readonly
													style="float: right;" id="pfnovalue" value=""
													placeholder="No PF Number..">
											</div>

											<%
												} else {
											%>

											<div class="col-25">

												<input type="text" name="pfnovalue" readonly
													style="float: left;" id="pfnovalue" value="<%=cst_nonst%>"
													placeholder=" BOC Staff">

											</div>


											<div class="col-25">
												<input type="text" name="pfnovalue" readonly
													style="float: right;" id="pfnovalue" value="<%=cpfno%>"
													placeholder="No PF Number..">
											</div>
											<%
												}
											%>

										</div>
									</div>

								</form>


							</div>
							<div class="card-footer text-muted">


								<div class="col-75"></div>

								<button type="submit" name="Submit_res"
									style="float: right; text-align: center;"
									class="btn btn-primary">Submit</button>


							</div>
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
		var today = new Date().toISOString().split('T')[0];
		document.getElementsByName("checkin")[0].setAttribute('min', today);
		document.getElementsByName("checkout")[0].setAttribute('min', today);
		document.getElementsByName("dob")[0].setAttribute('max', today);
		function yesnoCheck() {
			if (document.getElementById('yesCheck').checked) {
				document.getElementById('ifYes').style.visibility = 'visible';
			} else
				document.getElementById('ifYes').style.visibility = 'hidden';
		}
		function my1() {
			$(document).ready(function() {
				$("#update").modal('show');
				$tr = $this.closest('tr');
				tr = $(this).closet('tr');
			});
		}
		window.setTimeout(function() {
			$(".alert").fadeTo(500, 0).slideUp(500, function() {
				$(this).remove();
			});
		}, 2000);
	</script>



</body>

</html>
