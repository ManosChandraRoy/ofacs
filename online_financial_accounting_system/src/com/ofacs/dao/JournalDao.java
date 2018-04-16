package com.ofacs.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
@Component("journalDao")
public class JournalDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(JournalMaster journalMaster) {
		// TODO Auto-generated method stub
		session().saveOrUpdate(journalMaster);
		
	}

	public void saveOrUpdate(JournalDetail journalDetail) {
		// TODO Auto-generated method stub
		session().saveOrUpdate(journalDetail);
		
	}

}
