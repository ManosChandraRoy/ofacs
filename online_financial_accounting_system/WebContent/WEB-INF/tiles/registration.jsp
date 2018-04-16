<script type="text/javascript">

	$(document).ready(function(){
		
		//	var countryList = [];	
		//	funGetCountryList();
		
		viewData();
		
		function validator(){
			
			var name = $.trim($("#name").val());
			var address = $.trim($("#address").val());
			
			if(name == ""){		
		   	 	$("#errorMessage").html("!! Please enter a name");
		   	    $("#errorMessage").removeClass("hidden");
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			
			if(address == ""){		
		   	 	$("#errorMessage").html("!! Please enter a address");
		   	    $("#errorMessage").removeClass("hidden");
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			
			return true;
		}
		
		
		/* Submitting form to controller*/
		$("#submit").click(function(event) {			
			event.preventDefault();
			
			if (validator()){
				
				var data = {};
				
				data["name"] = $("#name").val();
				data["address"] = $("#address").val();
				var id = $("#id").val();
				
				if( id == ""){
					id = 0;
				}
				///alert(JSON.stringify(data));
				//return false;
				$.ajax({
		             type: "POST",
		             url: "saveRegistration/" + id,
		             data: JSON.stringify(data),
		             contentType: "application/json; charset=utf-8",             
		             success: function (successData) {
		            	 $("#id").val("");
		            	 $("#name").val("");
		            	 $("#address").val("");
		            	 
		            	 //alert();
		            	viewData();
		             	//$("#submit").prop("disabled", false);			                 
		                $("#successMessage").html(successData); 
		                $("#successMessage").removeClass("hidden");
		                $("#errorMessage").addClass("hidden");
		               	       
		             },
		             error: function (error) {
		            	 $("#errorMessage").html("Error: Record Not Saved");
		            	 $("#errorMessage").removeClass("hidden");
		                 $("#submit").prop("disabled", false);
		                 //alert(JSON.stringify(error));
		                 
		             }
				}); 
	
			} // End of if validation		
		}); // End of form submission
		
		
		
		
	
	}); // End of document ready()
	
	function viewData(){
		
		$.post("showRegistrationList", function(data){
			
			var dataTable = '<table class="table"><tr><th>ID</th><th>Name</th><th>Address</th><th>Update</th><th>Delete</th></tr>';
			
			for(var key in data){
		        dataTable += '<tr><td>' + data[key].id + '</td><td>' + data[key].name + '</td><td>'
		        + data[key].address + '</td><td><input type="button" id="update" onclick="funPopulate(' + data[key].id + ",'" + data[key].name + "','" + data[key].address + "'" + ')" value="Update" class="update"></td><td><input type="button" id="delete" value="Delete" class="delete" onclick="funDelete(' +data[key].id + ')"></td></tr>';
		    }
			
			dataTable += '</table>';
			
			$("#divDataTable").html(dataTable);
		})
	}
	
	/**function funSearchRegistration(){
		
		
		
		$.post("showRegistrationById", {regId: $("#regSearch").val()}, function(data){
			
			$("#divDataTable").html("");
			var dataTable = '<table class="table"><tr><th>ID</th><th>Name</th><th>Address</th></tr>';
			
			
				
				dataTable += '<tr><td>' + data["id"] + '</td><td>' + data["name"] + '</td><td>' + data["address"] + '</td><td><input type="button" id="update" value="Update" class="update"></td><td><input type="button" id="delete" value="Delete" class="delete" onclick="funDelete()"></td></tr>';;
			
			
			dataTable += '</table>';
			
			$("#divDataTable").html(dataTable);
		})
	}**/
/**	
	function funGetCountryList(){
	
		$.post("showCountryList", function(data){
			countryList = data;
		});
		
	}
	
	**/
	

	// Function for returning Country name
/**	function funGetCountryName(vCountryId){
		
		var countryName = '';
		
		$.each(countryList, function(i, v) {
		    if (v.id == vCountryId) {
		  
		    	countryName = v.name;
		        
		    	return;
		    } 
		});
			
		return countryName;
	}
	**/  // End funGetAppraisalHeadName()
	
	
	
	function funPopulate(pId, pName, pAddress){
		$("#id").val(pId);
		$("#name").val(pName);
		$("#address").val(pAddress);
		
	}
	
	function funDelete(pId){
		
		var id = $("#id").val(pId);
		alert("Are you sure to delete ");		
		$.post("deleteRegistration",{id:pId},function(data){
			
			viewData();
			
			$("#successMessage").html("Data Deleted Successfully!!"); 
            $("#successMessage").removeClass("hidden");
            $("#errorMessage").addClass("hidden");
		});
	}
</script>

<div class="bootstrap-iso">
	<div class="container-fluid">
	<div class="row">
	
		
		<div class="col-xs-12 col-sm-6 col-md-6">
			<form id="frmRegistration" class="well">
				<fieldset>
					<legend>Setup Your Information</legend>
					
					<div id="successMessage" align="center" class="hidden alert alert-success"></div>
					<div id="errorMessage" align="center" class="hidden alert alert-danger"></div>	
						
					<!-- Text input-->
					<div class="form-group hidden">
						<label class="control-label requiredField" for="name">id</label>
						<div class="form-group">
							<input id="id" name="id"
								placeholder="Enter ID" class="form-control" type="text" />
							
						</div>
					</div>
							
					<!-- Text input-->
					<div class="form-group">
						<label class="control-label requiredField" for="name">First Name</label>
						<div class="form-group">
							<input id="name" name="name"
								placeholder="Enter head title" class="form-control" type="text" />
							
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label requiredField" for="name">Last Name</label>
						<div class="form-group">
							<input id="name" name="name"
								placeholder="Enter head title" class="form-control" type="text" />
							
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label requiredField" for="name">Company Name</label>
						<div class="form-group">
							<input id="name" name="name"
								placeholder="Enter head title" class="form-control" type="text" />
							
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label requiredField" for="name">Company Type</label>
						<div class="form-group">
							<input id="name" name="name"
								placeholder="Enter head title" class="form-control" type="text" />
							
						</div>
						
					</div>
					
					<div class="form-group">
						<label class="control-label requiredField" for="address"> Address</label>
						<div class="form-group">
							<input id="address" name="address"
								placeholder="Enter head title" class="form-control" type="text" />
							
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label requiredField" for="name">Phone No</label>
						<div class="form-group">
							<input id="name" name="name"
								placeholder="Enter head title" class="form-control" type="text" />
							
						</div>
							</div>
						
						<div class="form-group">
						<label class="control-label requiredField" for="name">Email</label>
						<div class="form-group">
							<input id="name" name="name"
								placeholder="Enter head title" class="form-control" type="text" />
							
						</div>
							</div>
						
						<div class="form-group">
						<label class="control-label requiredField" for="name">Password</label>
						<div class="form-group">
							<input id="name" name="name"
								placeholder="Enter head title" class="form-control" type="text" />
							
						</div>
							</div>
						
						<div class="form-group">
						<label class="control-label requiredField" for="name">Confirm Password</label>
						<div class="form-group">
							<input id="name" name="name"
								placeholder="Enter head title" class="form-control" type="text" />
								
								</div>
								
						</div>
					
					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="submit"></label>
						<div class="col-md-6">
							<input id="btnClear" type="reset" name="btnClear" value="Clear Form" class="btn btn-warning" />
							<button id="submit" name="submit" class="btn btn-primary">Save</button>
						</div>
					</div>
	
					
				</fieldset>
			</form>
			
		</div>
	</div>
	</div>
	</div>
	