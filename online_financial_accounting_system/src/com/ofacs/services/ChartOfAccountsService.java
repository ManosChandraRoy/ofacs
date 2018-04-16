package com.ofacs.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ofacs.dao.ChartOfAccountsDao;
import com.ofacs.dao.ChartOfAccountsDetail;
import com.ofacs.dao.ChartOfAccountsMaster;




@Service("chartofaccountsService")
public class ChartOfAccountsService {
	
	private ChartOfAccountsDao chartofaccountsDao;
	
	@Autowired
	public void setChartOfAccountsDao(ChartOfAccountsDao ChartOfAccountsDao) {
		this.chartofaccountsDao =   chartofaccountsDao;
	}
	

	public void saveOrUpdate(ChartOfAccountsMaster chartofaccountsMaster) {
		// TODO Auto-generated method stub
		chartofaccountsDao.saveOrUpdate(chartofaccountsMaster);
	}


	public void saveOrUpdate(ChartOfAccountsDetail chartofaccountsDetail) {
		// TODO Auto-generated method stub
		chartofaccountsDao.saveOrUpdate(chartofaccountsDetail);
		
	}

}
