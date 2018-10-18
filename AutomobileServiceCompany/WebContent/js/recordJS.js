	$ (function(){
		$("#addRecDiv").hide();
		$("#getRecordByCustDiv").hide();
		$("#getAllRecordsDiv").hide();
		$("#getRecordByRegNumDiv").hide();
		$("#removeDiv").hide();
		
		$("#addRec").bind("click",{ key : 1},showForm);
		$("#getRecByCustId").bind("click",{ key : 2},showForm);
		$("#getRecByRegNum").bind("click",{ key : 3},showForm);
		$("#getAllRec").bind("click",{ key : 4},showForm);
		$("#removeRec").bind("click",{ key : 5},showForm);
		
		$("#getAllRecordsFrm").bind("submit",getRec);
		$("#getRecordByCustFrm").bind("submit",getRecById);
		$("#getRecordByRegNumFrm").bind("submit",getRecordByReg);

		$("#calcEst").bind("click",getEstimate);


	});
	
	function getEstimate(){
		
		var carRegNum = $("#carRegNum").val();
		
		var services = $("input[name=serviceId]:checked").map(function () {return this.value;}).get().join(",");
	
		var path = "http://localhost:8080/AutomobileServiceCompany/rest/record/calcEstimate/?carRegNum=" + carRegNum + "&serviceId="+services;
		$.ajax({
			url : path,
			type: "get", 
			success: function(response) {
				console.log(response);
				console.log("Ayush")
				$("#addRecFrm").append("<div id = 'estSide'></div>");
				$("#estSide").append("<p>"+response+"</p>");
			} 
		});
	}
	
	function getRec(){
		$.ajax({
			url : "http://localhost:8080/AutomobileServiceCompany/rest/record/getAllRecords",
			type: "get", 
			success: function(response){
				$("#getAllRecordsFrm").append("<div id = 'allRecSide'></div>");
				jsonObj(response, "allRecSide");	
			} 
		});
	}
	
	function getRecById(){
		var custId = $("#custId").val();

		$.ajax({
			url : "http://localhost:8080/AutomobileServiceCompany/rest/record/getRecordByCustomerId?custId="+custId,
			type: "get", 
			success: function(response){
				$("#getRecordByCustFrm").append("<div id = 'custSide'></div>");
				jsonObj(response, "custSide");			
			}
		});
	}

	function getRecordByReg(){
		var regNumber = $("#regNumber").val();

		$.ajax({
			url : "http://localhost:8080/AutomobileServiceCompany/rest/record/getRecordByRegNum?regNumber="+regNumber,
			type: "get", 
			success: function(response){
		        $("#getRecordByRegNumFrm").append("<div id = 'regSide'></div>");
				jsonObj(response, "regSide");
			}
		});
	}
	
	function jsonObj(response,divName) {
		for(var entry in response){
		    var car = entry;
		    var records = response[car];
		    
	        $("#"+divName).append("<br><br><b>Car:</b>");
	        
	        $("#"+divName).append(entry + "  ");
	        
			console.log(car);
			
		    for(var rec in records){
		    	
		        var date = rec;
		        $("#"+divName).append("<br>");
		        $("#"+divName).append("<br>");

		        $("#"+divName).append("<b>Date: </b>");
		        
		        $("#"+divName).append(date);
				console.log(date)
		        var services = records[date];
		        	for (idx in services){
		        		
		        		service = services[idx];
				        $("#"+divName).append("<br>");

				        $("#"+divName).append(" SERVICE --> ");

				        for (prop in service){
					        $("#"+divName).append(prop + " : ");
					        $("#"+divName).append(service[prop] + "  ");
							console.log(service[prop]);

				        }
		        	}
		        		
		    }
		}
		
	}
	
	function showForm(event){
		console.log("a")
		var data = event.data;
		switch(data.key){
		case 1:
			$("#addRecDiv").show();
			$("#getRecordByCustDiv").hide();
			$("#getAllRecordsDiv").hide();
			$("#getRecordByRegNumDiv").hide();
			$("#removeDiv").hide();
			break;
		case 2:
			$("#addRecDiv").hide();
			$("#getRecordByCustDiv").show();
			$("#getAllRecordsDiv").hide();
			$("#getRecordByRegNumDiv").hide();
			$("#removeDiv").hide();
			break;
		case 3:
			$("#addRecDiv").hide();
			$("#getRecordByCustDiv").hide();
			$("#getAllRecordsDiv").hide();
			$("#getRecordByRegNumDiv").show();
			$("#removeDiv").hide();
			break;
		case 4:
			$("#addRecDiv").hide();
			$("#getRecordByCustDiv").hide();
			$("#getAllRecordsDiv").show();
			$("#getRecordByRegNumDiv").hide();
			$("#removeDiv").hide();
			break;
		case 5: 
			$("#addRecDiv").hide();
			$("#getRecordByCustDiv").hide();
			$("#getAllRecordsDiv").hide();
			$("#getRecordByRegNumDiv").hide();
			$("#removeDiv").show();
			break;

		default:
			break;
		}
	}
	
