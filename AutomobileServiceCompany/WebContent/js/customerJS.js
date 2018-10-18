	$ (function(){
		$("#custRegDiv").hide();
		$("#addCarDiv").hide();
		$("#updateCustDiv").hide();
		$("#getCustDiv").hide();
		$("#getAllCustDiv").hide();
		$("#getCarByRegDiv").hide();
		$("#getCarsByCustIdDiv").hide();
		$("#removeCustByCustIdDiv").hide();
		$("#removeCarByRegNumDiv").hide();

		$("#property").bind("change",setType);
		
		$("#addCustomer").bind("click",{ key : 1},showForm);
		$("#addCar").bind("click",{ key : 2},showForm);
		$("#editCustomer").bind("click",{ key : 3},showForm);
		$("#getCustomerById").bind("click",{ key : 4},showForm);
		$("#getAllCust").bind("click",{ key : 5},showForm);
		$("#getCarByReg").bind("click",{ key : 6},showForm);
		$("#getCarByCustId").bind("click",{ key : 7},showForm);
		$("#removeCust").bind("click",{ key : 8},showForm);
		$("#removeCar").bind("click",{ key : 9},showForm);

		
		$("#getCustFrm").bind("submit",getCust);
		$("#getAllCustFrm").bind("submit",getAllCust);
		$("#getCarByRegFrm").bind("submit",getCarByReg);
		$("#getCarsByCustIdFrm").bind("submit",getCarsByCustId);

		
		
	});
	
	function showForm(event){
		var data = event.data;
		switch(data.key){
		case 1:
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#custRegDiv").show();
			break;
		case 2:
			$("#custRegDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#addCarDiv").show();
			break;
		case 3:
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#updateCustDiv").show();
			break;
		case 4:
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#getCustDiv").show();
			break;
		case 5: 
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#getAllCustDiv").show();
			break;
			
		case 6: 
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#getCarByRegDiv").show();
			break;
		case 7: 
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#getCarsByCustIdDiv").show();
			break;
		case 8: 
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCarByRegNumDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#removeCustByCustIdDiv").show();
			break;
		case 9: 
			$("#custRegDiv").hide();
			$("#addCarDiv").hide();
			$("#updateCustDiv").hide();
			$("#getCustDiv").hide();
			$("#getAllCustDiv").hide();
			$("#getCarsByCustIdDiv").hide();
			$("#removeCustByCustIdDiv").hide();
			$("#getCarByRegDiv").hide();
			$("#removeCarByRegNumDiv").show();

			break;
		default:
			break;
		}
	}
	
	function setType(){
		if($("#property").val()==="mobile"){
			$("#newValue").attr("type","number");
		}
		
	}
	
	function getAllCust(){
		$.ajax({
			url : "http://localhost:8080/AutomobileServiceCompany/rest/cust/getAllCustomer" ,
			type: "get", 
			success: function(response){
				$("#getAllCustFrm").append("<div id = 'AllCustDiv'></div>");
				jsonObjCust(response, "AllCustDiv");	
			} 
		});
	}	
	
	function getCarByReg(){
		var carRegNum = $("#carRegNum").val();
		$.ajax({
			url : "http://localhost:8080/AutomobileServiceCompany/rest/cust/getCarByReg/?carRegNum="+carRegNum ,
			type: "get", 
			success: function(response){
				$("#getCarByRegFrm").append("<div id = 'carByRegDiv'></div>");
				jsonObjCar(response, "carByRegDiv");	
			} 
		});
	}
	
	function getCarsByCustId(){
		var custId = $("#custId").val();

		$.ajax({
			url : "http://localhost:8080/AutomobileServiceCompany/rest/cust/getCarsByCustId?custId="+custId ,
			type: "get", 
			success: function(response){
				$("#getCarsByCustIdFrm").append("<div id = 'carByIdDiv'></div>");
				jsonObjCust(response, "carByIdDiv");	
			} 
		});
	}
	
	function getCust(){
		$.ajax({
			url : "http://localhost:8080/AutomobileServiceCompany/rest/cust/getCustomer",
			type: "get", 
			success: function(response){
				$("#getCustFrm").append("<div id = 'custDiv'></div>");
				jsonObjCust(response, "custDiv");	
			} 
		});
	}

	function jsonObjCust(response,divName) {
			console.log(response)
			for(var entry in response){
				
			    var cust = entry;
			    var custRec = response[cust];
			    console.log(cust);
			    
			    for(var rec in custRec){
			    	
			        var prop = rec;			        
			        var custVal = custRec[prop];
			        
			        console.log(rec);
			        
			        $("#"+divName).append(prop);
			        $("#"+divName).append(custVal);
			        if(prop === "carList"){
			        	
			        	console.log(custVal);
			        	for (carIdx in custVal){
			        		console.log(carIdx);
			        		 $("#"+divName).append(JSON.stringify(custVal[carIdx]));
			 		        $("#"+divName).append("<br>");

			        	}
			        	
			        }	
			        $("#"+divName).append("<br>");

			    }
			}
		}
	
	function jsonObjCar(response,divName) {
		console.log(response)
		for(var entry in response){
			
		    var carProp = entry;
		    var carVal = response[carProp];
		    
		       $("#"+divName).append("<br>");

		       $("#"+divName).append(carProp+": ");
		       $("#"+divName).append(carVal);

	
		}
	}