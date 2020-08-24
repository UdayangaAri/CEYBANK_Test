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

<style>
* {
	box-sizing: border-box;
}
#regForm {
	background-color: #ffffff;
	margin: 100px auto;
	font-family: Raleway;
	padding: 40px;
	width: 70%;
	min-width: 300px;
}
h1 {
	text-align: center;
}
input {
	padding: 10px;
	width: 100%;
	font-size: 17px;
	font-family: Raleway;
	border: 1px solid #aaaaaa;
}
/* Mark input boxes that gets an error on validation: */
input.invalid {
	background-color: #ffdddd;
}
/* Hide all steps by default: */
.tab {
	display: none;
}
button {
	background-color: #4CAF50;
	color: #ffffff;
	border: none;
	padding: 10px 20px;
	font-size: 17px;
	font-family: Raleway;
	cursor: pointer;
}
button:hover {
	opacity: 0.8;
}
#prevBtn {
	background-color: #bbbbbb;
}
/* Make circles that indicate the steps of the form: */
.step {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbbbbb;
	border: none;
	border-radius: 50%;
	display: inline-block;
	opacity: 0.5;
}
.step.active {
	opacity: 1;
}
/* Mark the steps that are finished and valid: */
.step.finish {
	background-color: #4CAF50;
}
</style>
</head>
<body>


	<div class="d-flex" id="sidebar-wrapper">

		<!-- Sidebar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div class=container-fluid>
			<div id="content">
				<jsp:include page="_navbar.jsp"></jsp:include>

				<div class="container">

					<!-- One "tab" for each step in the form: -->



					<div class="tab">

						<br> <br> Guest Details <br> <br>


						<form action="" method="post">

							<div class="row">

								<div class="col-20">
									<p>Name</p>

								</div>

								<div class="col-75">

									<input type="text" name="nameres" value="" placeholder="Name">
								</div>

							</div>


							<div class="row">

								<div class="col-20">
									<p>NIC Number</p>

								</div>

								<div class="col-75">

									<input type="text" name="nicres" value="" placeholder="NIC">
								</div>


							</div>

							<div class="row">

								<div class="col-20">
									<p>Mobile Number</p>

								</div>



								<div class="col-75">

									<input type="text" name="mobileres" value=""
										placeholder="Mobile">
								</div>


							</div>

							<div class="row">

								<div class="col-20">
									<p>Email Address</p>

								</div>

								<div class="col-75">


									<input type="email" name="emailres" value=""
										placeholder="Email">
								</div>

							</div>

							<div class="row">

								<div class="col-20">
									<p>Guest Type</p>

								</div>

								
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
						</form>

					</div>

					<div class="tab">

						Login Info:
						<p>
							<input placeholder="Username..." oninput="this.className = ''"
								name="07">
						</p>
						<p>
							<input placeholder="Password..." oninput="this.className = ''"
								name="08" type="password">
						</p>
					</div>
					<div style="overflow: auto;">
						<div style="float: right;">
							<button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
							<button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
						</div>
					</div>
					<!-- Circles which indicates the steps of the form: -->
					<div style="text-align: center; margin-top: 40px;">
						<span class="step"></span> <span class="step"></span>
					</div>

					<script src="vendor/jquery/jquery.min.js"></script>
					<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

					<script>
						var currentTab = 0; // Current tab is set to be the first tab (0)
						showTab(currentTab); // Display the current tab
						function showTab(n) {
							// This function will display the specified tab of the form...
							var x = document.getElementsByClassName("tab");
							x[n].style.display = "block";
							//... and fix the Previous/Next buttons:
							if (n == 0) {
								document.getElementById("prevBtn").style.display = "none";
							} else {
								document.getElementById("prevBtn").style.display = "inline";
							}
							if (n == (x.length - 1)) {
								document.getElementById("nextBtn").innerHTML = "Submit";
							} else {
								document.getElementById("nextBtn").innerHTML = "Next";
							}
							//... and run a function that will display the correct step indicator:
							fixStepIndicator(n)
						}
						function nextPrev(n) {
							// This function will figure out which tab to display
							var x = document.getElementsByClassName("tab");
							// Exit the function if any field in the current tab is invalid:
							if (n == 1 && !validateForm())
								return false;
							// Hide the current tab:
							x[currentTab].style.display = "none";
							// Increase or decrease the current tab by 1:
							currentTab = currentTab + n;
							// if you have reached the end of the form...
							if (currentTab >= x.length) {
								// ... the form gets submitted:
								document.getElementById("regForm").submit();
								return false;
							}
							// Otherwise, display the correct tab:
							showTab(currentTab);
						}
						function validateForm() {
							// This function deals with validation of the form fields
							var x, y, i, valid = true;
							x = document.getElementsByClassName("tab");
							y = x[currentTab].getElementsByTagName("input");
							// A loop that checks every input field in the current tab:
							for (i = 0; i < y.length; i++) {
								// If a field is empty...
								if (y[i].value == "") {
									// add an "invalid" class to the field:
									y[i].className += " invalid";
									// and set the current valid status to false
									valid = false;
								}
							}
							// If the valid status is true, mark the step as finished and valid:
							if (valid) {
								document.getElementsByClassName("step")[currentTab].className += " finish";
							}
							return valid; // return the valid status
						}
						function fixStepIndicator(n) {
							// This function removes the "active" class of all steps...
							var i, x = document.getElementsByClassName("step");
							for (i = 0; i < x.length; i++) {
								x[i].className = x[i].className.replace(
										" active", "");
							}
							//... and adds the "active" class on the current step:
							x[n].className += " active";
						}
						//////////////////////////////////////////////////////////////////////////////////////////////////
						//////////////////////////////////////////////////////////////////////////////////////////////////
						//////////////////////////////////////////////////////////////////////////////////////////////////
						/////////////////////////////////////Scripts from main////////////////////////////////////////////
						//////////////////////////////////////////////////////////////////////////////////////////////////
						//////////////////////////////////////////////////////////////////////////////////////////////////
						//////////////////////////////////////////////////////////////////////////////////////////////////
						$("#menu-toggle").click(function(e) {
							e.preventDefault();
							$("#wrapper").toggleClass("active");
						});
						
						$(document).ready(function() {
							$('#sidebarCollapse').on('click', function() {
								$('#sidebar').toggleClass('active');
							});
						});
						var dropdown = document
								.getElementsByClassName("dropdown-btn");
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
						
						function yesnoCheck() {
							if (document.getElementById('yesCheck').checked) {
								document.getElementById('ifYes').style.visibility = 'visible';
							} else
								document.getElementById('ifYes').style.visibility = 'hidden';
						}
					</script>
				</div>
			</div>
		</div>
	</div>
</body>

</html>