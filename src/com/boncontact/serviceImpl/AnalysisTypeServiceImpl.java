package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.AnalysisTypeDao;
import com.boncontact.domain.AnalysisType;
import com.boncontact.service.AnalysisTypeService;

@Service
@Transactional
public class AnalysisTypeServiceImpl implements AnalysisTypeService {
	@Resource
	private AnalysisTypeDao analysisTypeDao;

	@Override
	public void save(AnalysisType entity) {
		// TODO 自动生成的方法存根
		analysisTypeDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		analysisTypeDao.delete(id);
	}

	@Override
	public void update(AnalysisType entity) {
		// TODO 自动生成的方法存根
		analysisTypeDao.update(entity);
	}

	@Override
	public AnalysisType getById(Long id) {
		// TODO 自动生成的方法存根
		return analysisTypeDao.getById(id);
	}

	@Override
	public AnalysisType getByIndetify(String indenity) {
		// TODO 自动生成的方法存根
		return analysisTypeDao.getByIndetify(indenity);
	}

	@Override
	public List<AnalysisType> getByIds(Long[] ids) {
		// TODO 自动生成的方法存根
		return analysisTypeDao.getByIds(ids);
	}

	@Override
	public List<AnalysisType> findAll(String str) {
		// TODO 自动生成的方法存根
		return analysisTypeDao.findAll(str);
	}
}
