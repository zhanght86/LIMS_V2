package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.AuthSignatorDao;
import com.boncontact.domain.AnalysisCategory;
import com.boncontact.domain.AuthSignator;
import com.boncontact.service.AuthSignatorService;

@Service
@Transactional
public class AuthSignatorServiceImpl implements AuthSignatorService {
	@Resource
	private AuthSignatorDao authSignatorDao;

	@Override
	public void save(AuthSignator entity) {
		// TODO 自动生成的方法存根
		authSignatorDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		authSignatorDao.delete(id);
	}

	@Override
	public void update(AuthSignator entity) {
		// TODO 自动生成的方法存根
		authSignatorDao.update(entity);
	}

	@Override
	public AuthSignator getById(Long id) {
		// TODO 自动生成的方法存根
		return authSignatorDao.getById(id);
	}

	@Override
	public AuthSignator getByIndetify(String indenity) {
		// TODO 自动生成的方法存根
		return authSignatorDao.getByIndetify(indenity);
	}

	@Override
	public List<AuthSignator> getByIds(Long[] ids) {
		// TODO 自动生成的方法存根
		return authSignatorDao.getByIds(ids);
	}

	@Override
	public List<AuthSignator> findAll(String str) {
		// TODO 自动生成的方法存根
		return authSignatorDao.findAll(str);
	}
	
	
	
}
