<!DOCTYPE html>
<%@page import="connections.DBConnection"%>
<%@page import="block_Register.blockDAO"%>
<%@page import="block_Register.block"%>
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


<%
String delete = (String)request.getAttribute("errorMessage");
	Connection con = DBConnection.getConnection();

	Statement ps = con.createStatement();
	
	
	rs = ps.executeQuery("select B_display_name,id from branches");
	

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

<title>BLock View</title>

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

				<h3>Add New Block</h3>

				<div class="container">

					<!-- /#Type Body Here -->

				
					<a href='block_save.jsp'>Add New block</a> <br>

					<%
						List<block> list = blockDAO.getAllBlocks();
					%>

					<br>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								
								<th scope="col">Location</th>
								<th scope="col">Block Name</th>
								<th scope="col">Status</th>
								<th scope="col">Edit</th>
								<th scope="col">Delete</th>

							</tr>
						</thead>
						<tbody>

							<%
								for (block e : list) {
									
									Branches.Branch b = blockDAO.getBranchIdByName(e.getLocation());
							%>
							<tr>

								<td><%=b.getDisplayName() %></td>
								<td><%=e.getBlock_name() %></td>
								<td><%=e.getBlock_status() %></td>


								<td><a href='block_edit.jsp?id=<%=e.getId()%>'> edit <img
										src="images/edit.png" alt="" border=3 height=23 width=23
										style="float: center; margin-right: 0.5em"></a></td>


								<td><a href="blockDeleteServlet?id=<%=e.getId()%>"> delete <img
										src="images/delete.png" alt="" border=3 height=23 width=23
										style="float: center; margin-right: 0.5em"></a>
								<td>
							</tr>
							<tr>

								<%
									}
								%>
							
						</tbody>
					</table>			
			
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
