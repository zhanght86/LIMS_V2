package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.ContractAuditDao;
import com.boncontact.domain.ContractAudit;
import com.boncontact.service.ContractAuditService;

@Service
@Transactional
public class ContractAuditServiceImpl implements ContractAuditService {
	@Resource
	private ContractAuditDao contractAuditDao;
	@Override
	public void save(ContractAudit entity) {
		// TODO 自动生成的方法存根
		contractAuditDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		contractAuditDao.delete(id);
	}

	@Override
	public void update(ContractAudit entity) {
		// TODO 自动生成的方法存根
		contractAuditDao.update(entity);
	}

	@Override
	public ContractAudit getById(Long id) {
		// TODO 自动生成的方法存根
		return contractAuditDao.getById(id);
	}

	@Override
	public List<ContractAudit> findAll(String str) {
		// TODO 自动生成的方法存根
		return contractAuditDao.findAll(str);
	}

}
