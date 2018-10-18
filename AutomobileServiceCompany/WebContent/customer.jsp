<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Services</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	
<style>
	h1{
	text-align: center;}
</style>
<script type="text/javascript" src = "js/jquery-1.9.1.js"></script>
<script type="text/javascript" src = "js/customerJS.js"></script>

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
				<li class="nav-item"><a class="nav-link" href="service.jsp">Services</a></li>
				<li class="nav-item"><a class="nav-link" href="employee.jsp">Employee</a></li>
				<li class="nav-item"><a class="nav-link" href="policy.jsp">Policies</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Customer
					<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="record.jsp">Record</a></li>
				<li class="nav-item"><a class="nav-link" href="logoff.jsp">Log Out</a></li>
				
			</ul>
		</div>
	</nav>
	<br>	
	<c:if test = "${isValidEmp}">

	<div id="sidebar-wrapper">
    
    <ul class="nav nav-pills nav-stacked navbar-light col-md-4" id="sidebar">
 			<li><a id = "addCustomer" href = "#" >Add Customer</a></li>
			<li><a id = "addCar" href = "#" >Add Car</a></li>
			<li><a id = "editCustomer" href = "#" >Edit Details</a></li>
			<li><a id = "getCustomerById" href = "#" >Get Customer By ID</a></li>
			<li><a id = "getAllCust" href = "#" >Get All Customers</a></li>
			<li><a id = "getCarByReg" href = "#" >Get Car by Car Registration Number</a></li>
			<li><a id = "getCarByCustId" href = "#" >Get Cars by Customer ID</a></li>
			<li><a id = "removeCust" href = "#" >Remove Customer by Customer ID</a></li>
			<li><a id = "removeCar" href = "#" >Remove Car by Registration Number</a></li>
    </ul>
  </div>
  
	<div class = "col-md-8">
		<div id="custRegDiv">
		<h3>Customer Registration</h3><br>
		<p>You will be redirected to home page if added successfully</p>
		<form id = "registerCust" class = "form" method = "post" action = "rest/cust/add" >
	
			<div class = "form-group">
				<label for = "custId">Customer ID : </label>
				<input type = "text" name = "custId" id = "custId" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "custName">Customer Name : </label>
				<input type = "text" name = "custName" id = "custName" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "mobile" >Contact Number :</label>
				<input type = "number" name = "mobile" id = "mobile" class = "form-control"/>	
			</div>
			
			<div class = "form-group">
				<label for = "regNumber">Car Registration Number : </label>
				<input type = "number" name = "regNumber" id = "regNumber" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "carMake">Car Make : </label>
				<input type = "text" name = "carMake" id = "carMake" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "carModel">Car Model : </label>
				<input type = "text" name = "carModel" id = "carModel" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "policyId" >Policy Id :</label>
				<input type = "number" name = "policyId" id = "policyId" class = "form-control"/>	
			</div>
				<input type = "submit" value = "Register" class = "btn btn-primary"/>
			
		</form>
		</div>
		<div id = "addCarDiv">
			<h3>Add Car</h3>
			<p>You will be redirected to home page if added successfully</p>
			
			<form id = "addCarFrm" class = "form" method = "post" action = "rest/cust/addCar" >
	
			<div class = "form-group">
				<label for = "custId">Customer ID : </label>
				<input type = "text" name = "custId" id = "custId" class = "form-control"/>
			</div>

			<div class = "form-group">
				<label for = "regNumber">Car Registration Number : </label>
				<input type = "number" name = "regNumber" id = "regNumber" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "carMake">Car Make : </label>
				<input type = "text" name = "carMake" id = "carMake" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "carModel">Car Model : </label>
				<input type = "text" name = "carModel" id = "carModel" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "policyId" >Policy Id :</label>
				<input type = "number" name = "policyId" id = "policyId" class = "form-control"/>	
			</div>
				<input type = "submit" value = "Register" class = "btn btn-primary"/>
			
		</form>
		</div>
		
		<div id = "updateCustDiv">
			<h3>Update Customer</h3>
			<p>You will be redirected to home page if updated successfully</p>
			
			<form id = "updateCust" class = "form" method = "post" action = "rest/cust/update" >
	
			<div class = "form-group">
				<label for = "custId">Customer ID: </label>
				<input type = "number" name = "custId" id = "custId" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "property" >Detail to edit: </label>
				<select name = "property" id = "property" class = "form-control">
					<option value ="custName" >Name</option>
					<option value ="custMobNum" >Mobile Number</option>
				</select>		
			</div>
			
			<div class = "form-group">
				<label for = "newValue">Enter New: </label>
				<input type = "text" name = "newValue" id = "newValue" class = "form-control"/>
			</div>
			
			<div id="btnDiv">
				<input type = "submit" value = "Update" class = "btn btn-primary"/>
			</div>
			
			</form>
		</div>
		
		
		<div id = "getCustDiv">
			<h3>Get Customer By ID</h3>
			<form id = "getCustFrm" class = "form" method = "get" >
	
			<div class = "form-group">
				<label for = "custId">Customer ID: </label>
				<input type = "number" name = "custId" id = "custId" class = "form-control"/>
			</div>
			
			
			
			<div id="btnDiv">
				<input type = "submit" value = "Display Customer" class = "btn btn-primary"/>
			</div>
			
			</form>
		</div>
		
		
		<div id = "getAllCustDiv">
			<h3>Get All Customers</h3>
			<form id = "getAllCustFrm" class = "form" method = "get" >
				
			<div id="btnDiv">
				<input type = "submit" value = "Display Customers" class = "btn btn-primary"/>
			</div>
			
			</form>
		</div>
		
		<div id = "getCarByRegDiv">
			<h3>Get Car By Reg No</h3>
			<form id = "getCarByRegFrm" class = "form" method = "get" >
	
			<div class = "form-group">
				<label for = "carRegNum">Car Registration Number: </label>
				<input type = "number" name = "carRegNum" id = "carRegNum" class = "form-control"/>
			</div>
			
			
			
			<div id="btnDiv">
				<input type = "submit" value = "Display Car Details" class = "btn btn-primary"/>
			</div>
			
			</form>
		</div>
		
		<div id = "getCarsByCustIdDiv">
			<h3>Get Car By Customer ID</h3>
			<form id = "getCarsByCustIdFrm" class = "form" method = "get" >
	
			<div class = "form-group">
				<label for = "custId">Customer ID: </label>
				<input type = "number" name = "custId" id = "custId" class = "form-control"/>
			</div>
			
			<div id="btnDiv">
				<input type = "submit" value = "Display Car Details" class = "btn btn-primary"/>
			</div>
			
			</form>
		</div>
		
		<div id = "removeCustByCustIdDiv">
			<h3>Remove Customer By ID</h3>
			<p>You will be redirected to home page if removed successfully</p>
			
			<form id = "removeCustByCustIdFrm" class = "form" method = "post" action = "rest/cust/removeCust" >
	
			<div class = "form-group">
				<label for = "custId">Customer ID: </label>
				<input type = "number" name = "custId" id = "custId" class = "form-control"/>
			</div>
			
			<div id="btnDiv">
				<input type = "submit" value = "Remove Customer" class = "btn btn-primary"/>
			</div>
			
			</form>
		</div>
		
		<div id = "removeCarByRegNumDiv">
			<h3>Remove Car by Registration Number</h3>
			<p>You will be redirected to home page if removed successfully</p>
			
			<form id = "removeCarByRegNumFrm" class = "form" method = "post" action = "rest/cust/removeCarByRegNum" >
	
			<div class = "form-group">
				<label for = "regNum">Car Registration Number: </label>
				<input type = "number" name = "regNum" id = "regNum" class = "form-control"/>
			</div>
			
			<div id="btnDiv">
				<input type = "submit" value = "Remove Car" class = "btn btn-primary"/>
			</div>
			
			</form>
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