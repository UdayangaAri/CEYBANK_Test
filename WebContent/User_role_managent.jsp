<%@page import="login.LoginDao"%>
<%@page import="login.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

<!-- #9999ff -->



<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Update Role</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/register.css">
<!-- Custom styles for this template -->
<link href="css/simple-sidebar.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/All.css">

<script type="text/javascript" src="js/clock.js"></script>

 <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">



</head>

<body onload="startTime()">

	<div class="d-flex" id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<jsp:include page="_navbar.jsp"></jsp:include>

			<div class="container-fluid">


				<h3>Add New Role</h3>
				<div class="container">

					<form action="SaveServlet" method="post">

						<div class="row">

							<div class="col-75">
								<input type="text" name="name" placeholder="Enter Role.."
									required>
							</div>
						</div>


						<div class="row">

							<div class="col-75">
								<input type="text" name="desc"
									placeholder="Enter Role Description..">
							</div>
						</div>

						<br>



						<div class="row">

							<input type="submit" value="Save Role" style='margin-right: 16px'>
						</div>



					</form>
				</div>
				<br /> 
				<a href='R_View.jsp' style="color:blue;">View All Roles</a>



			</div>

		</div>



		<!-- /#page-content-wrapper -->

	</div>

	<footer class="footer"
		style="background-color: #464646; z-index: 150; position: relative; margin-left: -15px; height: 40px; width: 103%;">
		<div class="container-fluid">

			<ul class="navbar-nav ml-auto mt-2 mt-lg-0">

				<li class="nav-link" style="text-color: #fff; text-align: center"><font
					color="#fffff">Developed By BOC IT Unit</font></li>
			</ul>

		</div>
	</footer>
	<!-- /#wrapper -->

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
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
