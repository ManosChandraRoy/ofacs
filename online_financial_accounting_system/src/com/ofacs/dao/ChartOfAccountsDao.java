package com.ofacs.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
@Component("chartofaccountsDao")
public class ChartOfAccountsDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(ChartOfAccountsMaster chartofaccountsMaster) {
		// TODO Auto-generated method stub
		session().saveOrUpdate(chartofaccountsMaster);
		
	}

	public void saveOrUpdate(ChartOfAccountsDetail chartofaccountsDetail) {
		// TODO Auto-generated method stub
		session().saveOrUpdate(chartofaccountsDetail);
		
	}

}
