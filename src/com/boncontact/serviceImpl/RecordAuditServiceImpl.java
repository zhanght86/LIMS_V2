package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.RecordAuditDao;
import com.boncontact.domain.RecordAudit;
import com.boncontact.service.RecordAuditService;

@Service
@Transactional
public class RecordAuditServiceImpl implements RecordAuditService {
	@Resource
	private RecordAuditDao recordAuditDao;

	@Override
	public void save(RecordAudit entity) {
		recordAuditDao.save(entity);

	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		recordAuditDao.delete(id);
	}

	@Override
	public void update(RecordAudit entity) {
		// TODO 自动生成的方法存根
		recordAuditDao.update(entity);
	}

	@Override
	public RecordAudit getById(Long id) {
		// TODO 自动生成的方法存根
		return recordAuditDao.getById(id);
	}

	@Override
	public RecordAudit getByIndetify(String indenity) {
		// TODO 自动生成的方法存根
		return recordAuditDao.getByIndetify(indenity);
	}

	@Override
	public List<RecordAudit> getByIds(Long[] ids) {
		// TODO 自动生成的方法存根
		return recordAuditDao.getByIds(ids);
	}

	@Override
	public List<RecordAudit> findAll(String str) {
		// TODO 自动生成的方法存根
		return recordAuditDao.findAll(str);
	}

}
