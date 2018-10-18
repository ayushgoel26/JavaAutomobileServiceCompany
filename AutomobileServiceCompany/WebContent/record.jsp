<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Services</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
h1 {
	text-align: center;
}
</style>
<script type="text/javascript" src = "js/jquery-1.9.1.js"></script>
<script type="text/javascript" src = "js/recordJS.js"></script>

</head>
<body>
	<h1>Automobile Company - Services</h1>
	<br>
	<br>
	<nav class="navbar navbar navbar-inverse ">
		<div class="container-fluid" id="navbarNav">
			<div class="navbar-header">
				<a class="navbar-brand" href="home.jsp">Automobile Servicing</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="nav-item "><a class="nav-link" href="home.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Services</a></li>
				<li class="nav-item"><a class="nav-link" href="employee.jsp">Employee</a></li>
				<li class="nav-item"><a class="nav-link" href="policy.jsp">Policies</a></li>
				<li class="nav-item"><a class="nav-link" href="customer.jsp">Customer</a></li>
				<li class="nav-item active"><a class="nav-link" href="record.jsp">Record
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="logoff.jsp">Log Out</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<div>
	
	</div>
	<c:if test = "${isValidEmp}">

	
	
	<div id="sidebar-wrapper">
    	<ul class="nav nav-pills nav-stacked navbar-light col-md-4" id="sidebar">
 			<li><a id="addRec" href="#">Add Record</a></li>
 			<li><a id="getRecByCustId" href="#">Get Record By Customer ID</a></li>
 			<li><a id="getRecByRegNum" href="#">Get Record by Car Registration Number</a></li>
 			<li><a id="getAllRec" href="#">Get All Records</a></li>
 			<li><a id="removeRec" href="#">Remove a record</a></li>
   		</ul>
 	</div>
 	
	<div class="col-md-8">
		<div id="custRegDiv">
			<br>


			<div id="addRecDiv">
				<h3>Add Record</h3>
				<p>You will be redirected to home if added successfully</p>
				
				
				<form id="addRecFrm" class="form" method="post"
					action="rest/record/add">

					<div class="form-group">
						<label for="carRegNum">Car Registration Number : </label> <input type="number"
							name="carRegNum" id="carRegNum" class="form-control" />
					</div>

					<div class="form-group">
						<label for="serviceId">Service ID : </label>
						<input type="checkbox" name="serviceId"  id="serviceId" value="101" class="form-control"> Polishing <br>
 						<input type="checkbox" name="serviceId"  id="serviceId" value="102" class="form-control"> Decor <br>
 						<input type="checkbox" name="serviceId"  id="serviceId" value="103" class="form-control"> Wheel Balancing <br>
					</div>
					
					<div class="form-group">
						<label for="claimed">Claim Insurance </label>
						<input type="radio" name="claimed"  id="claimed" value="1" class="form-control"> Yes <br>
						<input type="radio" name="claimed"  id="claimed" value="0" class="form-control"> No <br>
					</div>
					
					<input type="submit" value="Add Record" class="btn btn-primary" />
					<a href = "#" role="button" id = "calcEst" onclick = "getEstimate()" class = "btn btn-primary">Calculate Estimate</a>
				</form>
			</div>


			<div id="getRecordByCustDiv">
				<h3>Get Record By Customer ID</h3>
				<form id="getRecordByCustFrm" class="form" method="get">

					<div class="form-group">
						<label for="custId">Customer ID: </label> <input type="number"
							name="custId" id="custId" class="form-control" />
					</div>



					<div id="btnDiv">
						<input type="submit" value="Display Customer Record"
							class="btn btn-primary" />
					</div>

				</form>
			</div>


			<div id="getAllRecordsDiv">
				<h3>Get All Records</h3>
				<form id="getAllRecordsFrm" class="form" method="get">

					<div id="btnDiv">
						<input type="submit" value="Display All Records"
							class="btn btn-primary" />
					</div>

				</form>
			</div>

			<div id="getRecordByRegNumDiv">
				<h3>Get Record By Car Registration Number</h3>
				<form id="getRecordByRegNumFrm" class="form" method="get">

					<div class="form-group">
						<label for="regNumber">Car Registration Number: </label> <input
							type="number" name="regNumber" id="regNumber"
							class="form-control" />
					</div>



					<div id="btnDiv">
						<input type="submit" value="Display Car Record"
							class="btn btn-primary" />
					</div>

				</form>
			</div>

			<div id="removeDiv">
				<h3>Remove Record By Car Registration Number</h3>
				<p>You will be redirected to home if added successfully</p>
				
				<form id="removeFrm" class="form" method="post"
					action="rest/record/remove">

					<div class="form-group">
						<label for="carRegNum">Car Registration Number: </label> <input type="number"
							name="carRegNum" id="carRegNum" class="form-control" />
					</div>

					<div id="btnDiv">
						<input type="submit" value="Remove Customer"
							class="btn btn-primary" />
					</div>
				</form>
			</div>
		</div>

	</div>
		
	</c:if>
	<c:if test = "${!isValidEmp}">
	
	<div id = "side1"style = "text-align: center">
		<h1> Not Logged In</h1>
		<a role = "button" href = "index.jsp" > Click to Login </a>
	</div>
		

	</c:if>
		
</body>
</html>