package com.boncontact.dao;

import java.util.List;

import com.boncontact.base.BaseDao;
import com.boncontact.domain.ContractMonitoringItem;

public interface ContractMonitoringItemDao extends
		BaseDao<ContractMonitoringItem> {
	/**
	 * getByContracts：根据合同组查找
	 * 
	 * @param ids
	 *            :id组
	 * @return
	 */
	List<ContractMonitoringItem> getByContracts(Long contractsId);
}
