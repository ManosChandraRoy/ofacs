package com.ofacs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ofacs.dao.JournalDetail;
import com.ofacs.dao.JournalMaster;
import com.ofacs.services.JournalService;


@Controller
public class JournalController {

	@Autowired
	private JournalService journalService ;
	
	
	
	@RequestMapping(value="/journal")
	public String Showpage(){
		return "journal";
		
	}
	
	
	@RequestMapping(value="/saveJournalData",method=RequestMethod.POST)
	public @ResponseBody String saveJournal (@RequestBody JournalMaster journalMaster){		
		System.out.println(journalMaster.toString());
		
	
		journalMaster.setFinYear(1);
		journalMaster.setCurrent("TK");
		journalMaster.setActive("Y");
		journalMaster.setDescription("Description");
		journalMaster.setVerifiedBy("Rabbani");
		journalMaster.setVerifiedDate("05-10-17");
		journalMaster.setVoucherStatus("P");
		journalMaster.setCompanyId(1);
		journalMaster.setCreatedBy("Rishad");
	
		System.out.println(journalMaster.toString());
		
		journalService.saveOrUpdate(journalMaster);
//		//registrationService.saveUser(registration);
//		
		for(JournalDetail journalDetail: journalMaster.getjournalDetails()){

			journalDetail.setVoucherNo(journalMaster);
			System.out.println(journalMaster.toString());
			//voucherDetail.setProjectCode(null);
			//voucherDetail.setChartOfAccId(null);
			//voucherDetail.setDepartmentId(null);
			journalDetail.setBankId(11);
			if(journalDetail.getCredit()== 0){
				journalDetail.setCredit(0);
			}else if (journalDetail.getDebit()== 0) {
				journalDetail.setDebit(0);
			}	
			journalService.saveOrUpdate(journalDetail);
			System.out.println("Controller"+journalDetail.toString());
		}
		
		
		
		
		
		
	return "!! Record Saved Successfully";
		
		
	}
	
}
