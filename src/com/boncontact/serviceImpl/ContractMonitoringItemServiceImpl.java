package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.ContractMonitoringItemDao;
import com.boncontact.domain.ContractMonitoringItem;
import com.boncontact.service.ContractMonitoringItemService;

@Service
@Transactional
public class ContractMonitoringItemServiceImpl implements ContractMonitoringItemService{

	@Resource
	private ContractMonitoringItemDao contractMonitoringItemDao;
	@Override
	public void save(ContractMonitoringItem entity) {
		contractMonitoringItemDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		contractMonitoringItemDao.delete(id);
	}

	@Override
	public void update(ContractMonitoringItem entity) {
		contractMonitoringItemDao.update(entity);
	}

	@Override
	public ContractMonitoringItem getById(Long id) {
		return contractMonitoringItemDao.getById(id);
	}

	@Override
	public List<ContractMonitoringItem> getByContracts(Long contractsId) {
		return contractMonitoringItemDao.getByContracts(contractsId);
	}

	

}
