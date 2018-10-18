<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Automobile Company</title>
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
      		<a class="navbar-brand" href="#">Automobile Servicing</a>
    	</div>
			<ul class="nav navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="service.jsp">Services</a></li>
				<li class="nav-item"><a class="nav-link" href="employee.jsp">Employee</a></li>
				<li class="nav-item"><a class="nav-link" href="policy.jsp">Policies</a></li>
				<li class="nav-item"><a class="nav-link" href="customer.jsp">Customer</a></li>
				<li class="nav-item"><a class="nav-link" href="record.jsp">Record</a></li>
				<li class="nav-item"><a class="nav-link" href="logoff.jsp">Log Out</a></li>
			</ul>
		</div>
	</nav>
	<c:if test = "${isValidEmp}">
	<div>
		<h2> HOME</h2>
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