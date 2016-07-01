package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.AnalysisCategoryDao;
import com.boncontact.domain.AnalysisCategory;
import com.boncontact.service.AnalysisCategoryService;
@Service
@Transactional
public class AnalysisCategoryServiceImpl implements AnalysisCategoryService {
	@Resource
	private AnalysisCategoryDao analysisCategoryDao;
	
	@Override
	public void save(AnalysisCategory entity) {
		// TODO 自动生成的方法存根
		analysisCategoryDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		analysisCategoryDao.delete(id);
	}

	@Override
	public void update(AnalysisCategory entity) {
		// TODO 自动生成的方法存根
		analysisCategoryDao.update(entity);
	}

	@Override
	public AnalysisCategory getById(Long id) {
		// TODO 自动生成的方法存根
		return analysisCategoryDao.getById(id);
	}

	@Override
	public AnalysisCategory getByIndetify(String indenity) {
		// TODO 自动生成的方法存根
		return analysisCategoryDao.getByIndetify(indenity);
	}

	@Override
	public List<AnalysisCategory> getByIds(Long[] ids) {
		// TODO 自动生成的方法存根
		return analysisCategoryDao.getByIds(ids);
	}

	@Override
	public List<AnalysisCategory> findAll(String str) {
		// TODO 自动生成的方法存根
		return analysisCategoryDao.findAll(str);
	}

}
