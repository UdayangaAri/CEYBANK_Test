<!DOCTYPE html>
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
	String sid =(String)session.getAttribute("Username");

	LoginBean e = LoginDao.getEmployeeById(sid);
	
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

<title>My Details</title>

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

					<form method="POST" action="EditServlet2" method="post">


						<h3>User Profile</h3>

						<%
							if (null != request.getAttribute("errorMessage")) {
								out.println(request.getAttribute("errorMessage"));
							}
						%>

						<%
							System.out.println(e.getStatus());
						%>


						<div class="row">

							<div class="col-25">
								<p>Employee Number</p>

							</div>


							<div class="col-75">
								<input type="text" name="empno" readonly
									value="<%=e.getEmpno()%>" required>
							</div>
						</div>


						<div class="row">

							<div class="col-25">
								<p>First Name</p>

							</div>


							<div class="col-75">
								<input type="text" name="fname" readonly
									value="<%=e.getFname()%>" required>
							</div>
						</div>


						<div class="row">

							<div class="col-25">
								<p>Username</p>

							</div>


							<div class="col-75">
								<input type="text" name="uname" readonly
									value="<%=e.getusername()%>" required>
							</div>
						</div>



						<div class="row">

							<div class="col-25">
								<p>NIC</p>

							</div>


							<div class="col-75">
								<input type="text" name="nic" readonly
									value="<%=e.getNic()%>
								" maxlength="12">
							</div>
						</div>


						<br> <br>


						<div class="row">

							<div class="col-25">
								<p>Role</p>

							</div>


							<div class="col-75">
								<input type="text" name="role" readonly value="<%=e.getRole()%>">
							</div>
						</div>



						<div class="row">

							<div class="col-25">
								<p>Branch</p>

							</div>


							<div class="col-75">
								<input type="text" name="branch" readonly
									value="<%=e.getBranch()%>">
							</div>
						</div>

						<br> <br>




						<div class="row">

							<div class="col-25">
								<p>Mobile</p>

							</div>


							<div class="col-75">
								<input type="text" name="mobile" readonly maxlength="10"
									value="<%=e.getMobile()%>">
							</div>
						</div>





						<div class="row">

							<div class="col-25">
								<p>Status</p>

							</div>


							<div class="col-75">
								<input type="text" name="status" readonly value="Active">
							</div>
						</div>







						<br> <br>


					</form>



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
        function noBack()
        {
            window.history.forward();
        }
	</script>



</body>

</html>
