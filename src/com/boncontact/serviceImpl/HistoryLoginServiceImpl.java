package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.HistoryLoginDao;
import com.boncontact.domain.HistoryLogin;
import com.boncontact.service.HistoryLoginService;
@Service
@Transactional
public class HistoryLoginServiceImpl implements HistoryLoginService{
	@Resource
	private HistoryLoginDao historyLoginDao;
	@Override
	public void save(HistoryLogin entity) {
		// TODO 自动生成的方法存根
		historyLoginDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		historyLoginDao.delete(id);
	}

	@Override
	public void update(HistoryLogin entity) {
		// TODO 自动生成的方法存根
		historyLoginDao.update(entity);
	}

	@Override
	public HistoryLogin getById(Long id) {
		// TODO 自动生成的方法存根
		return historyLoginDao.getById(id);
	}

	@Override
	public List<HistoryLogin> findAll(String str) {
		// TODO 自动生成的方法存根
		return historyLoginDao.findAll(str);
	}

	@Override
	public HistoryLogin getLastLogin(Long id) {
		return historyLoginDao.getLastLogin(id);
	}

}
