<!DOCTYPE html>
<%@page import="RoomRates.RoomRatesDAO"%>
<%@page import="register.RegisterBean"%>
<%@page import="dashboard.dashboardDAO"%>
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
<link rel="stylesheet" type="text/css" href="css/simple-sidebar.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<script type="text/javascript" src="js/clock.js"></script>



<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">



<title>Home</title>

<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">



</head>

<body onload="startTime()">



	<!-- java methods starts -->
	<%
		String countEmpOnBranch = (String) session.getAttribute("countEmpOnBranch");
		//System.out.println("countEmpOnBranch  :" +countEmpOnBranch);
	%>
	<!-- java methods end -->

	<div class="d-flex" id="sidebar-wrapper">

		<!-- Sidebar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div class="container-fluid">
			<div id="content">
				<jsp:include page="_navbar.jsp"></jsp:include>

				<div class="container mt-5 mb-5">

					<!-- body start -->

					<div class="mb-5 ">
						<form
							class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search mt-5">
							<div class="input-group  mt-5">
								<input type="text" class="form-control bg-light border-0 small"
									placeholder="Search for..." aria-label="Search"
									aria-describedby="basic-addon2">
								<div class="input-group-append">
									<button class="btn btn-primary" type="button">
										<i class="fas fa-search fa-sm"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
					<div class="container-fluid">
						<%
							String name = (String) session.getAttribute("Username");
							//System.out.println("name : "+name);

							String empno = (String) session.getAttribute("empno");
							//System.out.println("empno: "+empno);
							String branch = (String) session.getAttribute("branch");
							String takenameofbranchname = RoomRatesDAO.getBranchName(branch);
							//System.out.println("takenameofbranchname : "+takenameofbranchname);
						%>
						<!-- Page Heading -->

						<!-- Topbar Search -->


						<!-- Content Row -->
						<div class="row">


							<!-- Earnings (Monthly) Card Example -->
							<div class="col-xl-3 col-md-6 mb-4 mt-5">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-primary text-uppercase mb-1">Your
													employee Number</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800"><%=empno%></div>
											</div>
											<div class="col-auto">
												<i class="fas fa-calendar fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Earnings (Monthly) Card Example -->
							<div class="col-xl-3 col-md-6 mb-4 mt-5">
								<div class="card border-left-success shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-success text-uppercase mb-1">Your
													employee Number</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800"><%=branch%></div>
											</div>
											<div class="col-auto">
												<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Earnings (Monthly) Card Example -->
							<div class="col-xl-3 col-md-6 mb-4 mt-5">
								<div class="card border-left-info shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks</div>
												<div class="row no-gutters align-items-center">
													<div class="col-auto">
														<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">%</div>
													</div>
													<div class="col">
														<div class="progress progress-sm mr-2">
															<div class="progress-bar bg-info" role="progressbar"
																style="width: 60%" aria-valuenow="50" aria-valuemin="0"
																aria-valuemax="100"></div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Pending Requests Card Example -->
							<div class="col-xl-3 col-md-6 mb-4 mt-5">
								<div class="card border-left-warning shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-warning text-uppercase mb-1">Count
													of Employees in your branch</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">
													<%
														out.println(countEmpOnBranch);
													%>
												</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-comments fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>

						<!-- Content Row -->


						<!-- Content Row -->


						<!-- Content Column -->


						<!-- Project Card Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Projects</h6>
							</div>
							<div class="card-body">

								<div id="carouselExampleIndicators" class="carousel slide"
									data-ride="carousel">
									<ol class="carousel-indicators">
										<li data-target="#carouselExampleIndicators" data-slide-to="0"
											class="active"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="5"></li>

									</ol>
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img src="images/Dickoya.JPG" class="d-block w-50 alt="...">
										</div>
										<div class="carousel-item">
											<img src="images/Kataragama.jpg" class="d-block w-50 "
												alt="...">
										</div>
										<div class="carousel-item">
											<img src="images/Nuwara Eliya.jpg" class="d-block  w-50 "
												alt="...">
										</div>
										<div class="carousel-item">
											<img src="images/Pinnacle View Anuradhapura (1).jpg"
												class="d-block  w-50 " alt="...">
										</div>
										<div class="carousel-item">
											<img src="images/Pinnacle View Anuradhapura (2).jpg"
												class="d-block w-50" alt="...">
										</div>
									</div>
									<a class="carousel-control-prev"
										href="#carouselExampleIndicators" role="button"
										data-slide="prev"> <span
										class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="carousel-control-next"
										href="#carouselExampleIndicators" role="button"
										data-slide="next"> <span
										class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>

							</div>
						</div>

						<!-- Color System -->







						<!-- Illustrations -->
						<div class="card shadow mb-4 ">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
								<div class="text-center">
									<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
										style="width: 10rem;" src="images/news_icon.png" alt="">
								</div>
							</div>
							<div class="card-body mb-3">

								<p>
									Add some quality, svg illustrations to your project courtesy of
									<a target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>,
									a constantly updated collection of beautiful svg images that
									you can use completely free and without attribution!
								</p>

							</div>
						</div>


						<br>


					</div>
					<!-- /.container-fluid -->

					<!-- body end -->
				</div>



			</div>

		</div>

	</div>
	<!-- /#page-content-wrapper -->



	<jsp:include page="Footer.jsp"></jsp:include>

	<!-- Scroll to Top Button-->

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

