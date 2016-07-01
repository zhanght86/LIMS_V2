package com.boncontact.dao;


import com.boncontact.base.BaseDao;
import com.boncontact.domain.HistoryLogin;

public interface HistoryLoginDao extends BaseDao<HistoryLogin> {
	/**
	 * 查找登录用户的上次最后一条记录
	 * 
	 * @param id
	 * @return
	 */
	HistoryLogin getLastLogin(Long id);

}
