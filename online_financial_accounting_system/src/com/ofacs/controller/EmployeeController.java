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

import com.ofacs.dao.Employee;
import com.ofacs.services.EmployeeService;


@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;	
	

	@RequestMapping(value="/employee")
	public String showPage(){
		return "employee";
	}
	
	@RequestMapping(value="/saveEmployee/{id}",method=RequestMethod.POST)
	public @ResponseBody String save(@RequestBody Employee employee, @PathVariable(name="id",required=false) Integer id){		
		
		try {
			
			/*System.out.println(employee);
			employeeService.saveOrUpdate(employee);
			
			System.out.println(employee);*/
			if(id < 1) {
				employeeService.saveOrUpdate(employee);
			} else {
				employee.setId(id);
				employeeService.saveOrUpdate(employee);
			}	
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error.."+e);
			// TODO: handle exception
		}
		return "!! Record Saved Successfully";
	}
	
	@RequestMapping(value="/deleteEmployee",method=RequestMethod.POST)
	public @ResponseBody String delete(@RequestParam("id") Integer id){	
		
		try {
			employeeService.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error...."+e);
			return "Cannot Delete Record !!!";
		}		
		return "Successfully Deleted";
	}
	
	@RequestMapping(value="/showEmployeeList",method=RequestMethod.POST)
	public @ResponseBody List<Employee> getEmployee(){			
		return employeeService.getResultList();			
	}
	
	@RequestMapping(value="/showEmployeeById",method=RequestMethod.POST)
	public @ResponseBody Employee getEmployeeById(@RequestParam("empId") Integer empId){	
		return employeeService.getEmployeeById(empId);
			
	}
	
	
}
