<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Services</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<style>
	h1{
	text-align: center;}
</style>
</head>
<body>
	<h1>Automobile Company - Services</h1>
	<br><br>
	<nav class="navbar navbar navbar-inverse ">
		<div class="container-fluid" id="navbarNav">
		<div class="navbar-header">
      		<a class="navbar-brand" href="home.jsp">Automobile Servicing</a>
    	</div>
			<ul class="nav navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="home.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Services
					<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="employee.jsp">Employee</a></li>
				<li class="nav-item"><a class="nav-link" href="policy.jsp">Policies</a></li>
				<li class="nav-item"><a class="nav-link" href="customer.jsp">Customer</a></li>
				<li class="nav-item"><a class="nav-link" href="record.jsp">Record</a></li>
				<li class="nav-item"><a class="nav-link" href="logoff.jsp">Log Out</a></li>
			</ul>
		</div>
	</nav>
	<br>
		<div id = "addServiceDiv" class = "col-md-6 col-md-offset-3">
			<h3>Add Service</h3>
			<p>You will be redirected to home page if added successfully</p>
			
			<form id = "addServiceFrm" class = "form" method = "post" action = "rest/service/add" >
	
			<div class = "form-group">
				<label for = "serviceId">Service ID : </label>
				<input type = "text" name = "serviceId" id = "serviceId" class = "form-control"/>
			</div>

			<div class = "form-group">
				<label for = "serviceName">Service Name: </label>
				<input type = "text" name = "serviceName" id = "serviceName" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "serviceCost" >Service Cost :</label>
				<input type = "number" name = "serviceCost" id = "serviceCost" class = "form-control"/>	
			</div>
				<input type = "submit" value = "Add Service" class = "btn btn-primary"/>
			
		</form>
		</div>
	
</body>
</html>