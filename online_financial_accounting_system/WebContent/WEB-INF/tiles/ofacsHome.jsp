     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


	
			
		
			
		

<div class="bootstrap-iso">
	<div class="container-fluid">
	<div class="row">
	
		
			
			
	
							
					
					  
					
				
					
				
				
					
					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="submit"></label>
						<div class="col-md-6">
							 <sec:authorize access="permitAll">
							 <div class="login-buttons">
							<a id=admin-btn class="btn btn-primary btn-lg" href="<c:url value='/login' />" role="button" >Admin</a>
							<a id= acc-btn class="btn btn-primary btn-lg" href="<c:url value='/acc_login' />" role="button" >Accountant</a>
							</div>
							<style>
                           
                            .login-buttons
				           {
				            
				           position: fixed; 
                                      top: 50%;
                                      left: 40%;
                                      
				                    }
				                    
				            #admin-btn
                            {
                            background-color: #42f474;
                            border-color: #42f474;
                            margin-right:50px;
                            left: 50px;
                            }
                            .btn_btn-primary_btn-lg:hover { 
   							 opacity: 0.7;
										}
							
							.row{
								background-image: url(static/images/wlc_pic.png);
 background-repeat: no-repeat;        
  background-position: center;
    background-repeat: no-repeat, repeat;
    max-height:100%;
    max-width:100%;
    height:610px;
    width:1400px;
							}
 
                           </style>
                             </sec:authorize>
						</div>
					</div>
	
			
			
					
			
			
		</div>
	</div>
	</div>
		
	
	