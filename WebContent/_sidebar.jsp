

  
<%@page import="sidebar.sideBarBeanClass"%>
<%@page import="Functions.FunctionDAO"%>
<%@page import="access.RoleFunctionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sidebar.sidebarDAO"%>
<%@page import="access.RoleFunction"%>
<%@page import="Update.Emp"%>


<nav id="sidebar">
	<div class="sidebar-header" style="margin-right: 1px;">
		<div>
			<img src="images/ceybankholi.png" class="image-cropper" alt="..."
				height="120" width="210">
		</div>
	</div>
	
	<%
String roleid = (String) session.getAttribute("roleid");
//System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&& role id in side bar : " + roleid +"&&&&&&&&&&&&&&&&");

List<RoleFunction> list = sidebarDAO.getFunctionsByRoleID(roleid);
%>


	<ul class="list-unstyled components">
<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
if(i == 1){ 
//style="display:none;"%>
		<li >
		<a href="home.jsp" style="color: #fafafa; background-color: transparent;">
		<img src="images/tile.png" alt="" border=3 height=27 width=27 style="float: left; margin-right: 0.5em"> 
		Dashboard
		</a>
		</li>
<%} }%>

		<li >
		<a href="#pageSubmenu4"	style="color: #fafafa; background-color: transparent;" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
		<img src="images/reserve.png" alt="" border=3 height=27 width=27 style="float: left; margin-right: 0.5em"> 
		Front Officer
		</a>

		<ul class="collapse list-unstyled" id="pageSubmenu4">
	<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
 //if(i == 2 || i == 3 || i == 4){
if(i == 14){%>
				<li >
				<a href="RoomStatus.jsp" style="color: #fafafa; background-color: transparent;">
				Room Status
				</a>
				</li>
<%} }%>
<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
 //if(i == 2 || i == 3 || i == 4){
if(i == 2){%>
				<li >
				<a href="reservation.jsp" style="color: #fafafa; background-color: transparent;">
				Reservation
				</a>
				</li>
<%} }%>
<%
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
 //if(i == 2 || i == 3 || i == 4){
if(i == 3){%>
				<li >
				<a href="" data-toggle="modal" data-target="#InsertUser" style="color: #fafafa; background-color: transparent;">
				Add New Guest
				</a>
				</li>
<%}}%>
<%
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
 //if(i == 2 || i == 3 || i == 4){
if(i == 4){%>
				<li >
				<a href="Guest_update.jsp" style="color: #fafafa; background-color: transparent;">
				Update Guest Details 
				</a>
				</li>
<%}}%>

			</ul>
			</li>
	
	
		<li>
		<a href="#pageSubmenu" style="color: #fafafa; background-color: transparent;" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
		<img src="images/homes.png" alt="" border=3 height=27 width=27 style="float: left; margin-right: 0.5em"> 
		House Keeping
		</a>	
			
			<ul class="collapse list-unstyled" id="pageSubmenu">
			
			<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
 //if(i == 5 || i == 6){
	 if(i == 6){%>	
 
				<li >
				<a href="block_view.jsp" style="color: #fafafa; background-color: transparent;">
				Block Management
				</a>
				</li>

<%}}%>
	
<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
 //if(i == 5 || i == 6){
	 if(i == 5){%>	
				<li >
				<a href="room_view.jsp" style="color: #fafafa; background-color: transparent;">
				Room Management
				</a>
				</li>
<%}}%>

<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
 //if(i == 5 || i == 6){
	 if(i == 16){%>	
				<li >
				<a href="Room_Status_Management.jsp" style="color: #fafafa; background-color: transparent;">
				Room Status Management
				</a>
				</li>
<%}}%>
<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
 //if(i == 5 || i == 6){
	 if(i == 15){%>	
				<li >
				<a href="RoomRatesManagement.jsp" style="color: #fafafa; background-color: transparent;">
				Room Rates Management
				</a>
				</li>
<%}}%>



			</ul>
			</li>
			


<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
 if(i == 7){%>	
		<li >
		<a href="TextFileGenerating.jsp" style="color: #fafafa; background-color: transparent;">
		<img src="images/report.png" alt="" border=3 height=27 width=27 style="float: left; margin-right: 0.5em">
		Reports
		</a>
		</li>
<%}}%>
	

		<li>
		<a href="#pageSubmenu1" style="color: #fafafa; background-color: transparent;" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
		<img src="images/uses.png" alt="" border=3 height=27 width=27 style="float: left; margin-right: 0.5em"> 
		User Management
		</a>
			<ul class="collapse list-unstyled" id="pageSubmenu1">
			
<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
// if(i == 8 || i == 9){
if(i == 8){%>	
 
					<li >
					<a href="register.jsp" style="color: #fafafa; background-color: transparent;">
					Register User
					</a>
					</li>
<%}}%>

<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
 //if(i == 8 || i == 9){
if(i == 9){%>
				<li >
				<a href="Update.jsp" style="color: #fafafa; background-color: transparent;">
				Update User
				</a>
				</li>
<%}}%>
			</ul>
			</li>


		<li>
		<a href="#pageSubmenu2" style="color: #fafafa; background-color: transparent;" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
		<img src="images/setting.png" alt="" border=3 height=26 width=26 style="float: left; margin-right: 0.5em">
		Settings
		</a>
	
			<ul class="collapse list-unstyled" id="pageSubmenu2">
			
<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
//if(i == 10 || i == 11 || i == 12){
if(i == 10){%>
				<li >
				<a href="R_View.jsp" style="color: #fafafa; background-color: transparent;">
				User Role Groups
				</a>
				</li>
<%}}%>
<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
//if(i == 10 || i == 11 || i == 12){
 if(i == 11){%>
				<li >
				<a href="B_View.jsp" style="color: #fafafa; background-color: transparent;">
				Branch Management
				</a>
				</li>
<%}}%>
<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
//if(i == 10 || i == 11 || i == 12){
if(i == 12){%>
				<li >
				<a href="RoomTypeMasterView.jsp" style="color: #fafafa; background-color: transparent;">
				Room Type Master
				</a>
				</li>
<%}}%>
			</ul>
			</li>


<% 
for (RoleFunction e : list) {
int i = Integer.parseInt(e.getFunctionID()); 
//System.out.println("i value : "+i);
if(i == 13){%>
			<li >
			<a href="Role.jsp" style="color: #fafafa; background-color: transparent;">
			<img src="images/access.png" alt="" border=3 height=27 width=27 style="float: left; margin-right: 0.5em">
			Access
			</a>
			</li>

<%}}%>
	</ul>

</nav>


<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" id="InsertUser"
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
									placeholder="Mobile"  pattern=".{8,10}">
							</div>

						</div>

						<div class="row">


							<div class="col-25">Date of Birth</div>

							<div class="col-65">
								<input type="date" name="dob" value="" required
									placeholder="Date of Birth" id="doba">
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
								<div style="float: left;" >

									<label onclick="javascript:yesnoCheck();"> <input
										type="radio" name="options" id="noChecka" value="Public">Public
									</label>
									<label onclick="javascript:yesnoCheck();"> <input
										type="radio" name="options" id="yesChecka" checked value="BOC Staff">BOC Staff
									</label>  <br>
								</div>

								<div class="col-40" style="float: right;" id="ifYesa"
									style="visibility: hidden">
									<input type="text" id="yes" name="pfnovalue" value=""
										placeholder="PF Number" >
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
	

<script>
var today = new Date().toISOString().split('T')[0];
document.getElementsByName("doba")[0].setAttribute('max', today);
function yesnoCheck() {
	if (document.getElementById('yesChecka').checked) {
		document.getElementById('ifYesa').style.visibility = 'visible';
	} else
		document.getElementById('ifYesa').style.visibility = 'hidden';
}
function my1() {
    $(document).ready(function(){
        $("#update").modal('show');
        $tr = $this.closest('tr');
        tr = $(this).closet('tr');
    });
}
</script>

