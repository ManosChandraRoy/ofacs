package com.ofacs.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
@Component("registrationDao")
public class RegistrationDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(Registration registration){
		session().saveOrUpdate(registration);
	}
	
	public void delete(Registration id){
		session().delete(id);
	}

	@SuppressWarnings("unchecked")
	public List<Registration> getResultList() {		
		DetachedCriteria criteria = DetachedCriteria.forClass(Registration.class);	
		return criteria.getExecutableCriteria(session()).list();
	}

	public Registration getRegistrationById(Integer regId) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Registration.class); 
		criteria.add(Restrictions.eq("id", regId));
		return (Registration) criteria.getExecutableCriteria(session()).uniqueResult();
	}

}
