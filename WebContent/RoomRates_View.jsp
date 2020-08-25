<!DOCTYPE html>
<%@page import="RoomRates.RoomRatesDAO"%>
<%@page import="RoomRates.RoomRates"%>
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

<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="js/clock.js"></script>


<link href="css/sb-admin-2.min.css" rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>View Room Rates</title>

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

					<div class="container mt-5 mb-5">

						<!-- body start -->

						<div class="container mt-3 a">

							<div class="card shadow mb-4">

								<div class="card-header py-3">

									<h4 class="m-0 font-weight-bold text-primary">
										Room Rates <br>
									</h4>
									<a href='RoomRatesManagement.jsp'>Add New Room Rates </a>

								</div>
								<div class="card-body" style="left: 30%">


									<!-- /#Type Body Here -->
									<%
										if (null != request.getAttribute("errorMessage")) {
									%>
									<div class="alert alert-danger" role="alert">Deleted
										Successfully..</div>
									<%
										}
									%>



									<%
										List<RoomRates> list = RoomRatesDAO.getAllRoomRates();
									%>

									<br>
									<form>
										<table class="table">
											<thead class="thead-dark">
												<tr>
													<th scope="col">Status</th>
													<th scope="col">Branch</th>
													<th scope="col">Block</th>
													<th scope="col">Room type</th>
													<th scope="col">Meal Plan</th>
													<th scope="col">Rate</th>
													<th scope="col">Discount</th>
													<th scope="col">Discount Type</th>

													<th scope="col">Edit</th>
													<th scope="col">Delete</th>
												</tr>
											</thead>
											<tbody>

												<%
													for (RoomRates e : list) {

														String st = e.getStatus();
												%>
												<tr>

													<%
														if (st.equals("Active")) {
													%>


													<td align='center'><img src="images/active.png" alt=""
														border=3 height=15 width=15></td>

<%String a = e.getBranch();
String takenameofbranchname = RoomRatesDAO.getBranchName(a);
String b = e.getBlock();
String takenameofblockName = RoomRatesDAO.getBlockName(b);
String c = e.getRoomtype();
String takenameofRoomType = RoomRatesDAO.getRoomTypeName(c);

%>
													<td><%=takenameofbranchname%></td>
													<td><%=takenameofblockName%></td>
													<td><%=takenameofRoomType%></td>

													<td><%=e.getMealplan()%></td>
													<td><%=e.getBrate()%></td>
													<td><%=e.getDiscout()%></td>
													<td><%=e.getDicount_type()%></td>

													<td><a href='RoomRates_Edit.jsp?id=<%=e.getId()%>'>edit
															<img src="images/edit.png" alt="" border=3 height=20
															width=20 style="float: center; margin-right: 0.5em">
													</a></td>

													<td><a
														href='RoomRates_Delete_Servlet?id=<%=e.getId()%>'>delete
															<img src="images/delete.png" alt="" border=3 height=20
															width=20 style="float: center; margin-right: 0.5em">
													</a></td>

												</tr>
												

												<%
													}
												%>

												<%
													}
												%>




											</tbody>
										</table>
									</form>


								</div>
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
