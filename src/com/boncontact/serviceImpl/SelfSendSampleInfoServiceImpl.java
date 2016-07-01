package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.SelfSendSampleInfoDao;
import com.boncontact.domain.SelfSendSampleInfo;
import com.boncontact.service.SelfSendSampleInfoService;

@Service
@Transactional
public class SelfSendSampleInfoServiceImpl implements SelfSendSampleInfoService {
	@Resource
	private SelfSendSampleInfoDao selfSendSampleInfoDao;

	@Override
	public void save(SelfSendSampleInfo entity) {
		selfSendSampleInfoDao.save(entity);

	}

	@Override
	public void delete(Long id) {
		selfSendSampleInfoDao.delete(id);

	}

	@Override
	public void update(SelfSendSampleInfo entity) {
		selfSendSampleInfoDao.update(entity);

	}

	@Override
	public SelfSendSampleInfo getById(Long id) {
		return selfSendSampleInfoDao.getById(id);
	}

	@Override
	public SelfSendSampleInfo getByIndetify(String indenity) {
		return selfSendSampleInfoDao.getByIndetify(indenity);
	}

	@Override
	public List<SelfSendSampleInfo> getByIds(Long[] ids) {
		return selfSendSampleInfoDao.getByIds(ids);
	}

	@Override
	public List<SelfSendSampleInfo> findAll(String str) {
		return selfSendSampleInfoDao.findAll(str);
	}

}
