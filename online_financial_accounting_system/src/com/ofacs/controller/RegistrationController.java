package com.ofacs.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ofacs.dao.Registration;
import com.ofacs.services.RegistrationService;


@Controller
public class RegistrationController {

	@Autowired
	private RegistrationService registrationService;	
	

	@RequestMapping(value="/registration")
	public String showPage(){
		return "registration";
	}
	
	@RequestMapping(value="/saveRegistration/{id}",method=RequestMethod.POST)
	public @ResponseBody String save(@RequestBody Registration registration, @PathVariable(name="id",required=false) Integer id){		
		
		try {
			
			/*System.out.println(registration);
			registrationService.saveOrUpdate(registration);
			
			System.out.println(registration);*/
			if(id < 1) {
				registrationService.saveOrUpdate(registration);
			} else {
				registration.setId(id);
				registrationService.saveOrUpdate(registration);
			}	
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error.."+e);
			// TODO: handle exception
		}
		return "!! Record Saved Successfully";
	}
	
	@RequestMapping(value="/deleteRegistration",method=RequestMethod.POST)
	public @ResponseBody String delete(@RequestParam("id") Integer id){	
		
		try {
			registrationService.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error...."+e);
			return "Cannot Delete Record !!!";
		}		
		return "Successfully Deleted";
	}
	
	@RequestMapping(value="/showRegistrationList",method=RequestMethod.POST)
	public @ResponseBody List<Registration> getRegistration(){			
		return registrationService.getResultList();			
	}
	
	@RequestMapping(value="/showRegistrationById",method=RequestMethod.POST)
	public @ResponseBody Registration getRegistrationById(@RequestParam("regId") Integer regId){	
		return registrationService.getRegistrationById(regId);
			
	}
	
	
}
