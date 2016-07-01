package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.NonSelfSendSampleDao;
import com.boncontact.domain.NonSelfSendSample;
import com.boncontact.service.NonSelfSendSampleService;

@Service
@Transactional
public class NonSelfSendSampleServiceImpl implements NonSelfSendSampleService{
	@Resource
	private NonSelfSendSampleDao nonSelfSendSamplDao;

	@Override
	public void save(NonSelfSendSample entity) {
		// TODO 自动生成的方法存根
		nonSelfSendSamplDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		nonSelfSendSamplDao.delete(id);
	}

	@Override
	public void update(NonSelfSendSample entity) {
		// TODO 自动生成的方法存根
		nonSelfSendSamplDao.update(entity);
	}

	@Override
	public NonSelfSendSample getById(Long id) {
		// TODO 自动生成的方法存根
		return nonSelfSendSamplDao.getById(id);
	}

	@Override
	public NonSelfSendSample getByIndetify(String indenity) {
		// TODO 自动生成的方法存根
		return nonSelfSendSamplDao.getByIndetify(indenity);
	}

	@Override
	public List<NonSelfSendSample> getByIds(Long[] ids) {
		// TODO 自动生成的方法存根
		return nonSelfSendSamplDao.getByIds(ids);
	}

	@Override
	public List<NonSelfSendSample> findAll(String str) {
		// TODO 自动生成的方法存根
		return nonSelfSendSamplDao.findAll(str);
	}
	
}
