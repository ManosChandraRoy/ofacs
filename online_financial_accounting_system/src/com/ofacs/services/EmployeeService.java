package com.ofacs.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ofacs.dao.Employee;
import com.ofacs.dao.EmployeeDao;

@Service("employeeService")
public class EmployeeService {

	
	private EmployeeDao employeeDao;

	@Autowired
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	public void saveOrUpdate(Employee employee) {
		employeeDao.saveOrUpdate(employee);
	}
	
	public void delete(Integer id) {
		Employee employee=employeeDao.getEmployeeById(id);
		employeeDao.delete(employee);
	}

	public List<Employee> getResultList() {
		return employeeDao.getResultList();
	}

	public Employee getEmployeeById(Integer empId) {
		return employeeDao.getEmployeeById(empId);
	}

	
}
