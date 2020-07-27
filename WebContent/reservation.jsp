<!DOCTYPE html>

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



<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">




<title>Reservation</title>

</head>

<body onload="startTime(); my1();">



	<div class="d-flex" id="sidebar-wrapper">

		<!-- Sidebar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div class=container-fluid>
			<div id="content">
				<jsp:include page="_navbar.jsp"></jsp:include>


				<div class="container">

					<!-- /#Type Body Here -->


					<h3>Reservation</h3>


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
									value="<%=cno%>" placeholder="NIC/BOC PF Number/ Mobile Number"
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
					<div class='alert alert-danger' role='alert'>Please register
						the guest first..</div>

					<%
						}
					%>


					<br>
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->
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
								<input type="text" name="nameview" value="<%=Pos%> <%=cname%>"
									readonly placeholder="Name">
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


						<br>




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



					<br> <br> <br>
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->
					<!-- --------------------------------------------------------------------------------------------------------------------------- -->



					<div>




						<div class="card border-dark text-center">

							<div class="card-body">

								<form class="forms" action="" method="post"
									style="align: center">

									<br>

									<%
										try {

											Connection con = DBConnection.getConnection();
											System.out.println("Printing connection object " + con);

											Statement statement = con.createStatement();
											Statement st = con.createStatement();

											rx = statement.executeQuery("select * from block");

										} catch (Exception e) {
											e.printStackTrace();
										}
									%>


									<div class="row">

										<div class="col-25">
											<p>
												<b><b>Select Block</b></b>
											</p>

										</div>

										<div class="col-75">
											<select name="block_in_r" id="block_in_r"
												onchange="this.form.submit();">
												<%
													String x = request.getParameter("block_in_r");
													String RecieveBlock = (String) session.getAttribute("Block_Name_Value");

													block z = blockDAO.getBlocksByUserIdForRSM(x);

													block r = blockDAO.getBlocksByUserIdForRSM(RecieveBlock);

													session.setAttribute("Block_Name_Value", x);

													if (x != null) {
												%>
												<option value="" disabled selected><%=z.getBlock_name()%></option>


												<%
													} else if (RecieveBlock != null) {
												%>
												<option value="" disabled selected><%=r.getBlock_name()%></option>
												<%
													} else {
												%>
												<option value="" disabled selected>Select a Block</option>

												<%
													}
												%>

												<%
													try {
														String Query = "select * from block where block_location=?";
														Connection con = DBConnection.getConnection();
														//System.out.println("Printing connection object " + con);

														PreparedStatement psmtX = con.prepareStatement(Query);
														psmtX.setString(1, Employees_Branch);

														rs1 = psmtX.executeQuery();
														while (rs1.next()) {
												%>
												<option value=<%=rs1.getInt("blockID")%>><%=rs1.getString("block_name")%></option>
												<%
													}

													} catch (Exception e) {
														e.printStackTrace();
													}
												%>


											</select>
										</div>
									</div>


									<div class="row">

										<div class="col-25">
											<p>
												<b><b>Select Room No</b></b>
											</p>

										</div>

										<div class="col-75">
											<select name="room_in_r" id="room_in_r"
												onchange="this.form.submit();">

												<%
													String rname = request.getParameter("room_in_r");
													session.setAttribute("Room_Name_Value", rname);

													Room rm = RoomDao.getRoomById(rname);

													if (rname != null) {
												%>
												<option value="" disabled selected><%=rm.getRoomName()%></option>
												<%
													} else {
												%>
												<option value="" disabled selected>Select a Room</option>

												<%
													}
												%>



												<%
													try {
														String Query = "select * from rooms where blockID=?";
														Connection con = DBConnection.getConnection();
														//System.out.println("Printing connection object " + con);

														PreparedStatement psmt = con.prepareStatement(Query);
														psmt.setString(1, request.getParameter("block_in_r"));

														rs = psmt.executeQuery();
														while (rs.next()) {
												%>
												<option value=<%=rs.getInt("id")%>><%=rs.getString("roomName")%></option>
												<%
													}

													} catch (Exception e) {
														e.printStackTrace();
													}
												%>
											</select>
										</div>
									</div>



									<div class="row">

										<div class="col-25">
											<p>
												<%
													String rname1 = request.getParameter("room_in_r");
													System.out.println("room_in_r ::: " + rname1);
												%>
												<b><b>Meal Plan</b></b>
											</p>

										</div>

										<div class="col-75">

											<label class="radio-inline"> <input type="radio"
												name="rtype" value="bb">B/B
											</label> <label class="radio-inline"> <input type="radio"
												name="rtype" value="hb">H/B
											</label> <label class="radio-inline"><input type="radio"
												name="rtype" value="fb">F/B</label> <label
												class="radio-inline"><input type="radio"
												name="rtype" value="ronly">Room Only</label>
										</div>
									</div>


									<div class="row">

										<div class="col-25" style="text-align: left">
											<p>
												<b><b>Check in Date :</b></b>
											</p>

										</div>

										<div class="col-25">
										
										<%
										
										String checkin_d = request.getParameter("checkin");
										session.setAttribute("checkin", checkin_d);
										
										String checkin = (String) session.getAttribute("checkin");
										
										%>
											<input type='date' value="<%=checkin%>" name="checkin" class="form-control" 
											id="checkin" onchange="this.form.submit();"/> 
											
											<span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>

										</div>

										<div class="col-25" style="text-align: center">
											<p>
												<b><b>Checkout Date :</b></b>
											</p>

										</div>

										<div class="col-25">
										
										<%
										
										String checkout_d = request.getParameter("checkout");
										session.setAttribute("checkout", checkout_d);
										
										String checkout = (String) session.getAttribute("checkout");
										
										%>
										
											<input type='date'  value="<%=checkout%>" name="checkout" class="form-control" 
											onchange="this.form.submit();"/> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>

										</div>

									</div>

									<div class="row">

										<div class="col-75"></div>

									</div>
								</form>

							</div>
							<div class="card-footer text-muted" style="align: center">

								<form class="forms" action="ReservationSaveServlet" method="post"
									style="align: center">
									
										<input type="hidden" name="checkin"id="checkin" value="<%=checkin%>">
									
										<input type="hidden" name="checkout"id="checkout" value="<%=checkout%>">
										
										<input type="hidden" name="pfnovalue"id="pfnovalue" value="">
										
										<input type="hidden" name="pfnovalue"id="pfnovalue" value="">
										
										<input type="hidden" name="pfnovalue"id="pfnovalue" value="">
										
										<input type="hidden" name="pfnovalue"id="pfnovalue" value="">
										
										<input type="hidden" name="pfnovalue"id="pfnovalue" value="">
										
										<input type="hidden" name="pfnovalue"id="pfnovalue" value="">
										
									<button type="submit" name="Submit_res"
								style="float: left; margin-left: 16px; text-align: center;"
								class="btn btn-primary">Submit</button>
								</form>

							</div>
						</div>


					</div>
				</div>

			</div>

		</div>
	</div>



	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->


	<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-lg">

			<div class="modal-content">

				<form action="Guest_saveServlet" method="post">

					<div class="modal-header" style="text-align: center;">
						<h3 class="modal-title" id="exampleModalLabel">Add New Guest</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body" style="text-align: center;">


						<div class="row">

							<div class="col-25">Name</div>
							<div class="col-65">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select class="custom-select" id="position" name="position">

											<option value="Mr">Mr</option>
											<option value="Mrs">Mrs</option>
											<option value="Ms">Ms</option>
											<option value="Dr">Dr</option>
										</select>
									</div>
									<input type="text" name="name" required class="form-control"
										aria-label="Text input with dropdown button">
								</div>
							</div>
						</div>

						<div class="row">


							<div class="col-25">Address</div>

							<div class="col-65">
								<input type="text" name="address" value="" required
									placeholder="Address">
							</div>
						</div>


						<div class="row">


							<div class="col-25">City</div>

							<div class="col-65">
								<input type="text" name="city" value="" required
									placeholder="City">
							</div>

						</div>

						<div class="row">


							<div class="col-25">Residence Country</div>

							<div class="col-65">
								<input type="text" name="r_country" required value=""
									placeholder="Residence Country">
							</div>

						</div>

						<div class="row">


							<div class="col-25">Citizenship</div>

							<div class="col-65">
								<input type="text" name="citizenship" required value=""
									placeholder="Citizenship">
							</div>

						</div>

						<div class="row">


							<div class="col-25">NIC Number</div>

							<div class="col-65">
								<input type="text" name="nic" value="" required
									placeholder="NIC Number" pattern=".{10,12}">
							</div>

						</div>

						<div class="row">


							<div class="col-25">Mobile</div>

							<div class="col-65">
								<input type="text" name="mobile" value="" required
									placeholder="Mobile" pattern=".{8,10}">
							</div>

						</div>

						<div class="row">


							<div class="col-25">Date of Birth</div>

							<div class="col-65">
								<input type="date" name="dob" value="" required
									placeholder="Date of Birth">
							</div>

						</div>

						<div class="row">


							<div class="col-25">Email</div>

							<div class="col-65">
								<input type="email" name="email" value="" required
									placeholder="Email">
							</div>
						</div>

						<div class="row">


							<div class="col-25">Profession</div>

							<div class="col-65">
								<input type="text" name="profession" required value=""
									placeholder="Profession">
							</div>

						</div>


						<br>


						<div class="row">


							<div class="col-25">Guest Type</div>

							<div class="col-65">
								<div style="float: left;">

									<label onclick="javascript:yesnoCheck();"> <input
										type="radio" name="options" id="noCheck" value="Public">Public
									</label> <label onclick="javascript:yesnoCheck();"> <input
										type="radio" name="options" id="yesCheck" checked
										value="BOC Staff">BOC Staff
									</label> <br>
								</div>

								<div class="col-40" style="float: right;" id="ifYes"
									style="visibility: hidden">
									<input type="text" id="yes" name="pfnovalue" value=""
										placeholder="PF Number">
								</div>
							</div>
						</div>


					</div>

					<div class="modal-footer">

						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>

						<button type="submit" class="btn btn-primary">Register</button>
					</div>

				</form>

			</div>


		</div>




	</div>

	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->



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
