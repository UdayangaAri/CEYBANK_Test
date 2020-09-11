<!DOCTYPE html>
<%@page import="connections.DBConnection"%>
<%@page import="login.LoginDao"%>
<%@page import="login.LoginBean"%>
<%@page import="Update.EmpDao"%>
<%@page import="Update.Emp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Branches.BranchDao"%>
<%@page import="java.util.List"%>
<%@page import="Branches.Branch"%>
<html lang="en">


<%
	String eno = (String) session.getAttribute("eno");
	ResultSet resultset = null;
	ResultSet rs = null;
%>
<%
	String sid = request.getParameter("name");

	Emp e = EmpDao.getEmployeeById(sid);
%>



<head>

<!-- #9999ff -->

<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<script type="text/javascript" src="js/clock.js"></script>


<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">



<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>User Update Page</title>

</head>

<body onload="startTime()">

	<%
		//Class.forName("com.mysql.jdbc.Driver").newInstance();

		try {

			Connection con = DBConnection.getConnection();
			System.out.println("Printing connection object " + con);

			Statement statement = con.createStatement();
			Statement st = con.createStatement();

			resultset = statement.executeQuery("select * from role ORDER BY role ASC;");
			rs = st.executeQuery("select * from branches ORDER BY B_display_name ASC;");
		} catch (Exception ex) {
			ex.printStackTrace();
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

				<%
					if (e.getStatus() == null) {

						request.setAttribute("errorMessage", "Registration Failed");
						response.sendRedirect("Update.jsp");

					} else {
				%>

				<div class="container">

					<div class="container mt-5 mb-5">

						<!-- body start -->

						<div class="container mt-3 a">

							<div class="card shadow mb-4">

								<div class="card-body" style="left: 30%">

									<form action="user_update.jsp" method="post">


										<br> <br> <br>
										<table>
											<tr>
												<td><font color="#111111"></font></td>
												<td><input type="text" name="name"
													placeholder="Enter Employee Number.." required /></td>
												<td><input type="submit" value="Search user"
													style='margin-left: 10px' /></td>
										</table>

									</form>

								</div>

							</div>

							<div class="card shadow mb-4">

								<div class="card-header py-3">

									<h4 class="m-0 font-weight-bold text-primary">User Update
										Page</h4>

								</div>

								<div class="card-body" style="left: 30%">

									<form method="POST" action="EditServlet2" method="post">

										<%
											if (e.getStatus() == null) {
										%>
										<div class='alert alert-dander' role='alert'>" + "Cannot
											Find User" +"</div>

										<%
											}
										%>

										<div class="row">

											<div class="col-25">
												<p>Employee Number</p>

											</div>

											<div class="col-65">

												<%
													if (e.getEmployeeNo() == null) {
												%>

												<input type="text" name="empno" readonly readonly
													value="Employee Number">
												<%
													} else {
												%>

												<input type="text" name="empno" readonly
													value="<%=e.getEmployeeNo()%>" required>
												<%
													}
												%>
											</div>
										</div>

										<div class="row">

											<div class="col-25">
												<p>First Name</p>

											</div>

											<div class="col-65">

												<%
													if (e.getFirstName() == null) {
												%>
												<input type="text" name="fname" value="First Name" readonly>

												<%
													} else {
												%>

												<input type="text" name="fname"
													value="<%=e.getFirstName()%>" required>
												<%
													}
												%>

											</div>
										</div>

										<div class="row">

											<div class="col-25">
												<p>Last Name</p>

											</div>

											<div class="col-65">

												<%
													if (e.getLastName() == null) {
												%>

												<input type="text" name="lname" value="Last Name" required>
												<%
													} else {
												%>
												<input type="text" name="lname" value="<%=e.getLastName()%>"
													required>
												<%
													}
												%>


											</div>
										</div>

										<%
											String g = e.getGender();

												System.out.println("G value ::: " + g);

												if (e.getLastName() == null) {
										%>
										<div class="row">

											<div class="col-25">
												<p>Gender</p>

											</div>

											<div class="col-65">

												<label> <input type="radio" name="Gender"
													value="Male" id="Gender">Male
												</label> <label> <input type="radio" name="Gender"
													value="Female" id="Gender">Female
												</label> <br>
											</div>

										</div>

										<%
											} else {

													if (g.equalsIgnoreCase("Male")) {
										%>

										<div class="row">

											<div class="col-25">
												<p>Gender</p>

											</div>

											<div class="col-65">

												<label> <input type="radio" name="Gender"
													value="Male" id="Gender" checked>Male
												</label> <label> <input type="radio" name="Gender"
													value="Female" id="Gender">Female
												</label> <br>
											</div>

										</div>

										<%
											} else if (g.equalsIgnoreCase("Female")) {
										%>
										<div class="row">

											<div class="col-25">
												<p>Gender</p>

											</div>


											<div class="col-65">

												<label> <input type="radio" name="Gender"
													value="Male" id="Gender">Male
												</label> <label> <input type="radio" name="Gender"
													value="Female" id="Gender" checked>Female
												</label> <br>
											</div>

										</div>

										<%
											}

												}
										%>


										<div class="row">

											<div class="col-25">
												<p>NIC Number</p>

											</div>

											<div class="col-65">

												<%
													if (e.getNIC() == null) {
												%>

												<input type="text" name="nic" value="NIC Number" readonly>
												<%
													} else {
												%>
												<input type="text" name="nic" value="<%=e.getNIC()%>"
													pattern=".{10,12}">
												<%
													}
												%>

											</div>
										</div>

										<div class="row">

											<div class="col-25">
												<p>Phone And Mobile</p>

											</div>

											<div class="col-65">

												<%
													if (e.getPhoneNo() == null || e.getMobileNo() == null) {
												%>

												<input type="text" name="phone" value="Phone Number"
													readonly style='width: 49.5%' required> <input
													type="text" readonly style='width: 49.5%' name="mobile"
													value="Mobile Number" required>
												<%
													} else {
												%>
												<input type="text" name="phone" value="<%=e.getPhoneNo()%>"
													pattern=".{8,10}" style='width: 49.5%' required> <input
													type="text" pattern=".{8,10}" style='width: 49.5%'
													name="mobile" value="<%=e.getMobileNo()%>" required>
												<%
													}
												%>


											</div>
										</div>

										<div class="row">

											<div class="col-25">
												<p>Email Address</p>

											</div>

											<div class="col-65">

												<%
													if (e.getEmail() == null) {
												%>

												<input type="email" name="email" readonly
													value="Email Address">
												<%
													} else {
												%>
												<input type="email" name="email" value="<%=e.getEmail()%>">
												<%
													}
												%>

											</div>
										</div>

										<div class="row">

											<div class="col-25">
												<p>Address</p>

											</div>

											<div class="col-65">



												<%
													if (e.getAddress() == null) {
												%>

												<input type="text" name="address" value="Address" readonly>
												<%
													} else {
												%>
												<input type="text" name="address"
													value="<%=e.getAddress()%>">
												<%
													}
												%>



											</div>
										</div>

										<br>

										<div class="row">

											<div class="col-25">
												<p>Role</p>

											</div>

											<div class="col-65">

												<%
													if (e.getAddress() == null) {
												%>

												<select name="role" disabled></select>

												<%
													} else {

															Roles.Role z = EmpDao.getRIdByName(e.getRole());
															System.out.println("z.getRole() : " + z.getRole());
												%>

												<select name="role">

													<%
														while (resultset.next()) {
													%>

													<option
														<%if (z.getRole().equals(resultset.getString(2))) {%>
														selected <%}%>>
														<%=resultset.getString(2)%></option>
													<%
														}
															}
													%>
												</select>
											</div>
										</div>

										<div class="row">

											<div class="col-25">
												<p>Branch</p>

											</div>

											<div class="col-65">

												<%
													if (e.getAddress() == null) {
												%>

												<select name="Branch"></select>
												<%
													} else {

															Branches.Branch b = EmpDao.getBIdByName(e.getBranch());
												%>
												<select name="Branch">
													<%
														while (rs.next()) {
																	if (rs.getString(9).equals("Active")) {
													%>

													<option
														<%if (b.getDisplayName().equals(rs.getString(3))) {%>
														selected <%}%>>
														<%=rs.getString(3)%></option>
													<%
														}
																}
															}
													%>

												</select>
											</div>
										</div>

										<div class="row">

											<div class="col-25">
												<p>Status</p>

											</div>

											<div class="col-65">


												<%
													if (e.getStatus() == null) {
												%>

												<input type="text" name="current_status" readonly
													value="Status">
												<%
													} else {

															if (e.getStatus().equals("Deactive")) {
												%>

												<input type="text" name="current_status" readonly
													value="Deactive">

												<%
													} else if (e.getStatus().equals("Active")) {
												%>

												<input type="text" name="current_status" readonly
													value="Active">
												<%
													}
														}
												%>

											</div>
										</div>

										<br>

										<div class="row">

											<div class="col-25">
												<p></p>

											</div>

											<div class="col-65" style="float: right">


												<%
													if (e.getAddress() == null) {
												%>

												<button type="button"
													style='float: right; margin-left: 15px'
													class="btn btn-primary" name="edit" value="">Save</button>
												<%
													} else {
												%>

												<button type="submit"
													style='float: right; margin-left: 15px'
													class="btn btn-primary" name="edit" value="Edit & Save">
													Save</button>

												<%
													if (e.getStatus().equals("Deactive")) {
												%>

												<button type="button" name="Activate" value="Activate"
													class="btn btn-primary" data-toggle="modal"
													data-target="#exampleModal" style="float: right">
													Activate</button>

												<!-- Modal -->
												<div class="modal fade" id="exampleModal" tabindex="-1"
													role="dialog" aria-labelledby="exampleModalLabel"
													aria-hidden="true">

													<div class="modal-dialog" role="document">

														<div class="modal-content">

															<div class="modal-header">

																<h5 class="modal-title" id="exampleModalLabel">
																	Are you sure want to Activate user
																	<%=e.getFirstName()%>
																	?
																</h5>

																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>

															<div class="modal-body">

																If you activate
																<%=e.getFirstName()%>, he will be able to login to the
																system.
															</div>

															<div class="modal-footer">

																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">Close</button>
																<input type="submit" name="Activate" value="Activate"
																	style='margin-right: 16px'>

															</div>

														</div>

													</div>

												</div>

												<%
													} else if (e.getStatus().equals("Active")) {
												%>

												<button type="button" name="Deactivate" style="float: right"
													value="Deactivate" style='' class="btn btn-primary"
													data-toggle="modal" data-target="#exampleModal">
													Deactivate</button>

												<!-- Modal -->
												<div class="modal fade" id="exampleModal" tabindex="-1"
													role="dialog" aria-labelledby="exampleModalLabel"
													aria-hidden="true">

													<div class="modal-dialog" role="document">
														<div class="modal-content">

															<div class="modal-header">

																<h5 class="modal-title" id="exampleModalLabel">
																	Are you sure want to Deactivate user
																	<%=e.getFirstName()%>
																	?
																</h5>

																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>

															</div>

															<div class="modal-body">
																If you deactivate
																<%=e.getFirstName()%>, he will not be able to login to
																the system.
															</div>

															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">Close</button>
																<input type="submit" name="Deactivate"
																	value="Deactivate" style='margin-right: 16px'>

															</div>

														</div>

													</div>

												</div>

												<%
													}
														}
												%>

											</div>

										</div>

									</form>

								</div>

								<%
									}
								%>

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
	</script>



</body>

</html>
