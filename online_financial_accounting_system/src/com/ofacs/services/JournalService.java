package com.ofacs.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ofacs.dao.JournalDao;
import com.ofacs.dao.JournalDetail;
import com.ofacs.dao.JournalMaster;




@Service("journalService")
public class JournalService {
	
	private JournalDao journalDao;
	
	@Autowired
	public void setJournalDao(JournalDao journalDao) {
		this.journalDao =   journalDao;
	}
	

	public void saveOrUpdate(JournalMaster journalMaster) {
		// TODO Auto-generated method stub
		journalDao.saveOrUpdate(journalMaster);
	}


	public void saveOrUpdate(JournalDetail journalDetail) {
		// TODO Auto-generated method stub
		journalDao.saveOrUpdate(journalDetail);
		
	}

}
