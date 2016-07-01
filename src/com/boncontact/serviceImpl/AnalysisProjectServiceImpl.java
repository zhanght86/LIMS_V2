package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.AnalysisProjectDao;
import com.boncontact.domain.AnalysisProject;
import com.boncontact.service.AnalysisProjectService;
@Service
@Transactional
public class AnalysisProjectServiceImpl implements AnalysisProjectService {

	@Resource
	private AnalysisProjectDao analysisProjectDao;

	@Override
	public void save(AnalysisProject entity) {
		analysisProjectDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		analysisProjectDao.delete(id);
	}

	@Override
	public void update(AnalysisProject entity) {
		analysisProjectDao.update(entity);
	}

	@Override
	public AnalysisProject getById(Long id) {
		return analysisProjectDao.getById(id);
	}

	@Override
	public AnalysisProject getByIndetify(String indenity) {
		return analysisProjectDao.getByIndetify(indenity);
	}

	@Override
	public List<AnalysisProject> getByIds(Long[] ids) {
		return analysisProjectDao.getByIds(ids);
	}

	@Override
	public List<AnalysisProject> findAll(String str) {
		return analysisProjectDao.findAll(str);
	}

}
