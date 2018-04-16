package com.ofacs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ofacs.dao.ChartOfAccountsDetail;
import com.ofacs.dao.ChartOfAccountsMaster;
import com.ofacs.services.ChartOfAccountsService;


@Controller
public class ChartOfAccountsController {

	@Autowired
	private ChartOfAccountsService chartofaccountsService ;
	
	
	
	@RequestMapping(value="/chartofaccounts")
	public String Showpage(){
		return "chartofaccounts";
		
	}
	
	
	@RequestMapping(value="/saveChartOfAccountsData",method=RequestMethod.POST)
	public @ResponseBody String saveChartOfAccounts (@RequestBody ChartOfAccountsMaster chartofaccountsMaster){		
		System.out.println(chartofaccountsMaster.toString());
		
	
		chartofaccountsMaster.setFinYear(1);
		chartofaccountsMaster.setCurrent("TK");
		chartofaccountsMaster.setActive("Y");
		chartofaccountsMaster.setDescription("Description");
		chartofaccountsMaster.setVerifiedBy("Rabbani");
		chartofaccountsMaster.setVerifiedDate("05-10-17");
		chartofaccountsMaster.setVoucherStatus("P");
		chartofaccountsMaster.setCompanyId(1);
		chartofaccountsMaster.setCreatedBy("Rishad");
	
		System.out.println(chartofaccountsMaster.toString());
		
		chartofaccountsService.saveOrUpdate(chartofaccountsMaster);
//		//registrationService.saveUser(registration);
//		
		for(ChartOfAccountsDetail chartofaccountsDetail: chartofaccountsMaster.getchartofaccountsDetails()){

			chartofaccountsDetail.setVoucherNo(chartofaccountsMaster);
			System.out.println(chartofaccountsMaster.toString());
			//voucherDetail.setProjectCode(null);
			//voucherDetail.setChartOfAccId(null);
			//voucherDetail.setDepartmentId(null);
			chartofaccountsDetail.setBankId(11);
			if(chartofaccountsDetail.getCredit()== 0){
				chartofaccountsDetail.setCredit(0);
			}else if (chartofaccountsDetail.getDebit()== 0) {
				chartofaccountsDetail.setDebit(0);
			}	
			chartofaccountsService.saveOrUpdate(chartofaccountsDetail);
			System.out.println("Controller"+chartofaccountsDetail.toString());
		}
		
		
		
		
		
		
	return "!! Record Saved Successfully";
		
		
	}
	
}
