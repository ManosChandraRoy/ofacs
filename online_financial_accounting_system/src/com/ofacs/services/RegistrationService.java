package com.ofacs.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ofacs.dao.Registration;
import com.ofacs.dao.RegistrationDao;

@Service("registrationService")
public class RegistrationService {

	
	private RegistrationDao registrationDao;

	@Autowired
	public void setRegistrationDao(RegistrationDao registrationDao) {
		this.registrationDao = registrationDao;
	}

	public void saveOrUpdate(Registration registration) {
		registrationDao.saveOrUpdate(registration);
	}
	
	public void delete(Integer id) {
		Registration registration=registrationDao.getRegistrationById(id);
		registrationDao.delete(registration);
	}

	public List<Registration> getResultList() {
		return registrationDao.getResultList();
	}

	public Registration getRegistrationById(Integer regId) {
		return registrationDao.getRegistrationById(regId);
	}

	
}
