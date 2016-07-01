package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.ContractChangeDao;
import com.boncontact.domain.ContractChange;
import com.boncontact.service.ContractChangeService;

@Service
@Transactional
public class ContractChangeServiceImpl implements ContractChangeService {
	@Resource
	private ContractChangeDao contractChangeDao;

	@Override
	public void save(ContractChange entity) {
		// TODO 自动生成的方法存根
		contractChangeDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		contractChangeDao.delete(id);
	}

	@Override
	public void update(ContractChange entity) {
		// TODO 自动生成的方法存根
		contractChangeDao.update(entity);
	}

	@Override
	public ContractChange getById(Long id) {
		// TODO 自动生成的方法存根
		return contractChangeDao.getById(id);
	}

	@Override
	public List<ContractChange> findAll(String str) {
		// TODO 自动生成的方法存根
		return contractChangeDao.findAll(str);
	}

}
