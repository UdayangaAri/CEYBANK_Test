<!DOCTYPE html>
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

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>View Branches</title>

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

					<!-- /#Type Body Here -->
					<%
						if (null != request.getAttribute("errorMessage")) {
					%>
					<div class="alert alert-danger" role="alert">Deleted
						Successfully..</div>
					<%
						}
					%>

					<h3>Branch List</h3>

					<a href='B_management.jsp'>Add New Branch</a> <br>

					<%
						List<Branch> list = BranchDao.getAllBranches();
					%>

					<br>
					<form>
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Id</th>
									<th scope="col">Status</th>
									<th scope="col">Display Name</th>
									<th scope="col">Name</th>

									<th scope="col">Phone 1</th>

									<th scope="col">Fax</th>
									<th scope="col">Email</th>

									<th scope="col">Edit</th>
									<th scope="col">Delete</th>
								</tr>
							</thead>
							<tbody>

								<%
									for (Branch e : list) {

										String st = e.getStatus();
								%>
								<tr>

									<%
										if (st.equals("Active")) {
									%>

									<td><%=e.getId()%></td>
									<td align='center'><img src="images/active.png" alt=""
										border=3 height=15 width=15></td>

									<td><%=e.getDisplayName()%></td>
									<td><%=e.getName()%></td>
									<td><%=e.getPhone1()%></td>

									<td><%=e.getFax()%></td>
									<td><%=e.getEmail()%></td>

									<td><a href='B_Edit.jsp?id=<%=e.getId()%>'>edit <img
											src="images/edit.png" alt="" border=3 height=20 width=20
											style="float: center; margin-right: 0.5em"></a></td>


									<td><a href='B_DeleteServlet?id=<%=e.getId()%>'>delete
											<img src="images/delete.png" alt="" border=3 height=20
											width=20 style="float: center; margin-right: 0.5em">
									</a></td>

								</tr>
								<tr>
									<%
										} else if (st.equals("Deactive")) {
									%>

									<td><%=e.getId()%></td>
									<td align='center'><img src="images/inactive.png" alt=""
										border=3 height=15 width=15></td>

									<td><%=e.getDisplayName()%></td>
									<td><%=e.getName()%></td>
									<td><%=e.getPhone1()%></td>

									<td><%=e.getFax()%></td>
									<td><%=e.getEmail()%></td>

									<td><a href='B_Edit.jsp?id=<%=e.getId()%>'>edit <img
											src="images/edit.png" alt="" border=3 height=20 width=20
											style="float: center; margin-right: 0.5em"></a></td>

									<td><a href='B_DeleteServlet?id=<%=e.getId()%>'>delete
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
