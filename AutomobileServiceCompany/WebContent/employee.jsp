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
<style>
	h1{
	text-align: center;}
</style>
<script type="text/javascript" src = "js/jquery-1.9.1.js"></script>
<script>
	$ (function(){
		$("#formDiv").hide();
		$("#property").bind("change",setType);
		$("#editLink").bind("click",showForm);

	});
	function showForm(){
		$("#formDiv").show();
	}
	function setType(){
		if($("#property").val()==="empPassword"){
			$("#newValue").attr("type","password");
		}
		
	}
	
</script>
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
				<li class="nav-item"><a class="nav-link" href="#">Employee
					<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="policy.jsp">Policies</a></li>
				<li class="nav-item"><a class="nav-link" href="customer.jsp">Customer</a></li>
				<li class="nav-item"><a class="nav-link" href="record.jsp">Record</a></li>
				<li class="nav-item"><a class="nav-link" href="logoff.jsp">Log Out</a></li>
				
			</ul>
		</div>
	</nav>
	<br>
	<c:if test = "${isValidEmp}">
	
	<div id="sidebar-wrapper">
    	<ul class="nav nav-pills nav-stacked navbar-light col-md-4" id="sidebar">
 			<li><a id = "editLink" href = "#" >Edit Details</a></li>
   		</ul>
 	</div>
 	
	<div class = "col-md-8">
		<div id = "formDiv">
			<h4>Update Employee</h4>
			<form id = "updateEmp" class = "form" method = "post" action = "rest/emp/update" >
	
			<div class = "form-group">
				<label for = "empId">Employee ID: </label>
				<input type = "text" name = "empId" id = "empId" class = "form-control"/>
			</div>
			
			<div class = "form-group">
				<label for = "property" >Detail to edit: </label>
				<select name = "property" id = "property" class = "form-control">
					<option value ="empName" >Name</option>
					<option value ="empPassword" >Password</option>
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