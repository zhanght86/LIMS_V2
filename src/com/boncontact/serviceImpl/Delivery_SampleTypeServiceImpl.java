package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.Delvery_SampleTypeDao;
import com.boncontact.domain.AnalysisProject;
import com.boncontact.domain.Delivery_SampleType;
import com.boncontact.domain.Project;
import com.boncontact.service.Delivery_SampleTypeService;

@Service
@Transactional
public class Delivery_SampleTypeServiceImpl implements
		Delivery_SampleTypeService {
	@Resource
	private Delvery_SampleTypeDao delvery_SampleTypeDao;

	@Override
	public void save(Delivery_SampleType entity) {
		// TODO 自动生成的方法存根
		delvery_SampleTypeDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		delvery_SampleTypeDao.delete(id);
	}

	@Override
	public void update(Delivery_SampleType entity) {
		// TODO 自动生成的方法存根
		delvery_SampleTypeDao.update(entity);
	}

	@Override
	public Delivery_SampleType getById(Long id) {
		// TODO 自动生成的方法存根

		return delvery_SampleTypeDao.getById(id);
	}

	@Override
	public Delivery_SampleType getByIndetify(String indenity) {
		// TODO 自动生成的方法存根

		return delvery_SampleTypeDao.getByIndetify(indenity);
	}

	@Override
	public List<Delivery_SampleType> getByIds(Long[] ids) {
		// TODO 自动生成的方法存根

		return delvery_SampleTypeDao.getByIds(ids);
	}

	@Override
	public List<Delivery_SampleType> findAll(String str) {
		// TODO 自动生成的方法存根

		return delvery_SampleTypeDao.findAll(str);
	}

	@Override
	public List<Delivery_SampleType> findByProject(Project project) {
		// TODO 自动生成的方法存根

		return delvery_SampleTypeDao.findByProject(project);
	}

	@Override
	public Delivery_SampleType findByAnalysis(Project project,
			AnalysisProject analysisProject) {
		// TODO 自动生成的方法存根
		Delivery_SampleType type = delvery_SampleTypeDao.findByAnalysis(project, analysisProject);
		return type;
	}
}
