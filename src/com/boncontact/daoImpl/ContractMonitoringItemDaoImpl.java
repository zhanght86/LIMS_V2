package com.boncontact.daoImpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.boncontact.base.BaseDaoImpl;
import com.boncontact.dao.ContractMonitoringItemDao;
import com.boncontact.domain.ContractMonitoringItem;

@Service
public class ContractMonitoringItemDaoImpl extends
		BaseDaoImpl<ContractMonitoringItem> implements
		ContractMonitoringItemDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<ContractMonitoringItem> getByContracts(Long contractsId) {
		return getSession().createQuery(
				"FROM ContractMonitoringItem WHERE contract=" + contractsId)
				.list();
	}

}
