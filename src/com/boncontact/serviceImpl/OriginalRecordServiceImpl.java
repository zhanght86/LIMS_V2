package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.CommonTempletDao;
import com.boncontact.dao.OriginalRecordDao;
import com.boncontact.domain.CommonTemplet;
import com.boncontact.domain.OriginalRecord;
import com.boncontact.service.CommonTempletService;
import com.boncontact.service.OriginalRecordService;

@Service
@Transactional
public class OriginalRecordServiceImpl implements OriginalRecordService {
	@Resource
	private OriginalRecordDao originalRecordDao;

	@Override
	public void save(OriginalRecord entity) {
		originalRecordDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		originalRecordDao.delete(id);

	}

	@Override
	public void update(OriginalRecord entity) {
		originalRecordDao.update(entity);

	}

	@Override
	public OriginalRecord getById(Long id) {
		return originalRecordDao.getById(id);
	}

	@Override
	public OriginalRecord getByIndetify(String indenity) {
		return originalRecordDao.getByIndetify(indenity);
	}

	@Override
	public List<OriginalRecord> getByIds(Long[] ids) {
		return originalRecordDao.getByIds(ids);
	}

	@Override
	public List<OriginalRecord> findAll(String str) {
		return originalRecordDao.findAll(str);
	}

}
