<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acc Bank Checque</title>

<script type="text/javascript">
	$(function() {
		$("#voucherDate").datepicker({
			dateFormat : "yy-mm-dd"

		});
	});
	
	$(document).ready(function(){
		
		
		function validator(){
			
			var voucherNo= $.trim($("#voucherNo").val());	
			alert(voucherNo);
			var voucherDate = $.trim($("#voucherDate").val());
			var project = $.trim($("#project").val());
			var billNo = $.trim($("#billNo").val());
			var department = $.trim($("#department").val());
			var controlHead = $.trim($("#controlHead").val());
			var debit = $.trim($("#debit").val());
			var credit = $.trim($("#credit").val());
		

			if (voucherNo == "") {

				$("#errorMessage").html("Please enter vouchar id.");
				$("#errorMessage").removeClass("hidden");

				$("#successMessage").addClass("hidden");

				return false;
			}

			if (voucherDate == "") {
				$("#errorMessage").html("Please enter date.");
				$("#errorMessage").removeClass("hidden");

				$("#successMessage").addClass("hidden");
				return false;
			}

			if (project == "") {
				$("#errorMessage").html("Please enter project.");
				$("#errorMessage").removeClass("hidden");

				$("#successMessage").addClass("hidden");
				return false;
			}
			
			if (billNo == "") {
				$("#errorMessage").html("Please enter a bill.");
				$("#errorMessage").removeClass("hidden");

				$("#successMessage").addClass("hidden");
				return false;
			}
			if (department == "") {
				$("#errorMessage").html("Please enter dept name.");
				$("#errorMessage").removeClass("hidden");

				$("#successMessage").addClass("hidden");
				return false;
			}

			if (controlHead == "") {
				$("#errorMessage").html("Please enter control head.");
				$("#errorMessage").removeClass("hidden");

				$("#successMessage").addClass("hidden");
				return false;
			}
			if (debit == "") {
				$("#errorMessage").html("Please enter debit.");
				$("#errorMessage").removeClass("hidden");

				$("#successMessage").addClass("hidden");
				return false;
			}
			if (credit == "") {
				$("#errorMessage").html("Please enter credit.");
				$("#errorMessage").removeClass("hidden");

				$("#successMessage").addClass("hidden");
				return false;
			}
			
			
			return true;
			
			
		}
		

	
	/* add data form to table */
	$("#add").click(function(event){
		
		event.preventDefault();
		

		
		if(validator()){
		
		var data=[];
		var element ={ controlHead:[], debit:[], credit:[], project:[], department:[], billNo:[],voucherNo:[]};
	
		
		element["controlHead"] =$("#controlHead").val() ;
		element["debit"]=$("#debit").val();
		element["credit"]=$("#credit").val();
		element["project"]=$("#project").val();
		element["department"]=$("#department").val();
		element["billNo"]=$("#billNo").val();
		element["voucherNo"]=$("#voucherNo").val();
		
		
		data.push(element);
		
		$("#show_table").append('<tr><td>'+element["controlHead"]+'</td><td class="t_debit">'+element["debit"]+'</td><td class="t_credit">'+element["credit"]+
				'</td><td>'+element["project"]+'</td><td>'+element["department"]+
				'</td><td>'+element["billNo"]+'</td></tr>');
		}
		
	});
	
	$("#finish").click(function(event){
		
		var amountOfRows = $("#show_table  tbody  tr").length-1;
		alert("table row"+amountOfRows);
		
		var d_sum=0;
		var c_sum=0;
		$('.t_debit').each(function(){
			var value=parseFloat($(this).text());
			
			if(!isNaN(value) && value.length !=0){
				d_sum+=parseFloat(value);
				
			}
		});
		
		$("#total_debit").val(d_sum);
		
		
		$('.t_credit').each(function(){
			var value=parseFloat($(this).text());
			
			if(!isNaN(value) && value.length !=0){
				c_sum+=parseFloat(value);
				
			}
		});
		
		$("#total_credit").val(c_sum);
		
	});
	
	/* add data from to controller */
	$("#submit").click(function(event){
		event.preventDefault();
		
		 var total_credit = $('#total_credit').val();
		  var total_debit = $('#total_debit').val();
		  
		  if (total_credit == total_debit)
		  {
			  var amountOfRows = $("#show_table  tbody  tr").length-1;
				//alert("table row"+amountOfRows);
				
				var finalData=[];
				
				var variable={};
				for(var i=1;i<=amountOfRows;i++){
					
					var element ={ controlHead:[], debit:[], credit:[], project:[], client:[], department:[], billNo:[]};
					
					element["serialNo"] = i;
				
					element["controlHead"] =show_table.rows[i].cells[0].innerHTML ;
					element["debit"]=show_table.rows[i].cells[1].innerHTML;
					element["credit"]=show_table.rows[i].cells[2].innerHTML;
					element["project"]=show_table.rows[i].cells[3].innerHTML;
					element["department"]=show_table.rows[i].cells[4].innerHTML;
					element["billNo"]=show_table.rows[i].cells[5].innerHTML;
					
			
					finalData.push(element);
					
				}
				
					variable["narration"]=$("#narration").val();
					variable["voucherNo"]=$("#voucherNo").val();
					alert(variable["voucherNo"]);
					variable["voucherDate"]=$("#voucherDate").val();
					variable["journalDetails"]=finalData;
			
				
				
				//alert(JSON.stringify(variable));

				$.ajax({
					type : "POST",
					url : "saveJournalData",
					data : JSON.stringify(variable),
					contentType : "application/json; charset=utf-8",
					success : function(successData) {
						alert(JSON.stringify(variable));
						viewData();
						$("#submit").prop("disabled", false);			                 
						$("#successMessage").html(successData);
						$("#successMessage").removeClass("hidden");
						$("#errorMessage").addClass("hidden");

					},
					error : function(error) {
						/* $("#errorMessage").html("Error: Record Not Saved");
						$("#errorMessage").removeClass("hidden");
						$("#submit").prop("disabled", false); */
						//alert(JSON.stringify(error));
					}
				});
				
				
		  }
		  else
		  {
		    alert('Debit & Credit is not Matching !');
		    return false;
		  }
		
		
		
		
		
	})
	
	});

	
	
	
</script>
</head>

<body>
	<div class="bootstrap-iso">
		<div class="container">
			<div class="row">
				<div class="col-xs-10 col-sm-10 col-md-10">

					<!-- start for full div -->
					
						<!--  div for fieldset -->
						<div class="col-md-12">
							<fieldset>
								<legend>Journal</legend>
						<div id="successMessage" align="center"
						class="hidden alert alert-success"></div>
						<div id="errorMessage" align="center"
						class="hidden alert alert-danger"></div>

							</fieldset>
						</div>

						<!-- end fieldset -->
					

					<!-- start form part -->
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<!--  start first line -->
								<div class="row">
									<div class="col-md-12">
										<div class="form-horizantal">
											<div class="form-group">
												<label class="control-label col-md-2 text-right"
													for="voucherNo" style="padding-top: 5px">Voucher Id
													:</label>
												<div class="col-md-4">
													<input type="text" class="form-control" id="voucherNo"
														name="voucherNo">
												</div>
												<label class="control-label col-md-2 text-right" for="date"
													style="padding-top: 5px">Date :</label>
												<div class="col-md-4">
													<input type="text" class="form-control" id="voucherDate"
														name="voucherDate">
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- end first line -->
								<!-- start second line -->
								<div class="row">
									<div class="col-md-12">
										<div class="form-horizantal">
											<div class="form-group">
												<label class="control-label col-md-2 text-right"
													for="project" style="padding-top: 5px">Project :</label>
												<div class="col-md-10">
													<select class="form-control" id="project">
														<option value="">Select</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
													</select>
												</div>
												
											</div>
										</div>
									</div>
								</div>
								<!-- end second line -->
								<!-- start third line -->
								<div class="row">
									<div class="col-md-12">
										<div class="form-horizantal">
											<div class="form-group">
												<label class="control-label col-md-2 text-right"
													for="department" style="padding-top: 5px">Department
													:</label>
												<div class="col-md-4">
													<select class="form-control" id="department">
														<option value="">Select</option>
														<option value="1">SWE</option>
														<option value="2">CSE</option>
														<option value="3">EEE</option>
													</select>
												</div>
												<label class="control-label col-md-2 text-right"
													for="billNo" style="padding-top: 5px">Bill/Inv No :</label>
												<div class="col-md-4">
													<input type="text" class="form-control" id="billNo"
														name="billNo">
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- end third line -->
								<!-- start fourth line -->
								<div class="row">
									<div class="col-md-12">
										<div class="form-horizantal">
											<div class="form-group">

												<label class="control-label col-md-2 text-right"
													for="controlHead" style="padding-top: 5px">Control
													Head :</label>
												<div class="col-md-10">
												<select class="form-control" id="controlHead">
														<option value="">Select</option>
														<option value="1">SWE</option>
														<option value="2">CSE</option>
														<option value="3">EEE</option>
													</select>
													
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- end fourth line -->
								<!-- start fifth line -->
								<div class="row">
									<div class="col-md-12">
										<div class="form-horizantal">
											<div class="form-group">
												<label class="control-label col-md-2 text-right" for="debit"
													style="padding-top: 5px">Debit :</label>
												<div class="col-md-4">
													<input type="text" class="form-control" id="debit"
														name="debit">
												</div>
												<label class="control-label col-md-2 text-right"
													for="credit" style="padding-top: 5px">credit :</label>
												<div class="col-md-4">
													<input type="text" class="form-control" id="credit"
														name="credit">
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- end fifth line -->
								<!-- start add button -->
								<div class="row">
										<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<label class="control-label col-md-2 text-right" for="blank"
														style="padding-top: 5px"></label>
													<div class="col-md-4">
														
													</div>

												</div>
												<label class="control-label col-md-2 text-right" for="blank"
													style="padding-top: 5px"></label>
												<div class="col-md-2 col-md-offset-2">
													<button id="add" name="add"
																class="btn btn-primary">Add</button>
												</div>
											</div>
										</div>

									</div>
								
								<!-- end add button -->
							</div>
						</div>
					</div>

					<!-- end form part -->

					<!--  start second panel -->
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
							<div class="row">
							<table class="table" id="show_table">
						    
						      <tr>
						        <th>Account Head</th>
						        <th>Debit</th>
						        <th>Credit</th>
						        <th>Project</th>
						        <th>Dept</th>
						        <th>Bill</th>
						      </tr>
						      
						      
						    </table>
								
								
							
							</div>
							<div class="row">
										<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<label class="control-label col-md-2 text-right" for="blank"
														style="padding-top: 5px"></label>
													<div class="col-md-4">
														
													</div>

												</div>
												<label class="control-label col-md-2 text-right" for="blank"
													style="padding-top: 5px"></label>
												<div class="col-md-2 col-md-offset-2">
													<button id="finish" name="finish"
																class="btn btn-primary">Finish</button>
												</div>
											</div>
										</div>

									</div>
						</div>
						</div>
					</div>

					<!--  end second panel -->

					<!--  start third panel -->
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<label class="control-label col-md-2" style="padding-top: 5px"></label>
										<div class="col-md-10">
											<input type="text" class="form-control" id="total_debit" name="total_debit">
										</div>
									</div>
									<div class="col-md-6">

										<div class="col-md-10">
											<input type="text" class="form-control" id="total_credit" name="total_credit">
										</div>
										<label class="control-label col-md-2" style="padding-top: 5px"></label>
									</div>
								</div>
								
							</div>
						</div>
					</div>

					<!-- end third panel -->

					<!--  start fourth panel -->
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
									<label class="control-label col-md-2 text-right"
										style="padding-top: 5px" for="narration">Narration :</label>
									<div class="col-md-10">
										<input type="text" class="form-control" name="narration"
											id="narration">
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- end fourth panel -->

					<!-- start fifth panel -->
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
									<div class="col-md-3 col-md-offset-2 text-right">
										<button id="submit" name="submit"
											class="btn btn-primary btn-block ">Save</button>
									</div>
									<div class="col-md-6 ">
										<div class="col-md-6">
											<button id="submit" type="reset" name="submit"
												class="btn btn-warning btn-block ">Clear</button>
										</div>
										<label class="control-label col-md-6" style="padding-top: 5px"></label>

									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- end fifth panel -->


					<!--  end full div -->
				</div>
			</div>
		</div>
	</div>



</body>


</html>
