package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.ProjectDao;
import com.boncontact.domain.Project;
import com.boncontact.service.ProjectService;

@Transactional
@Service
public class ProjectServiceImpl implements ProjectService {
	@Resource
	private ProjectDao projectDao;

	@Override
	public void save(Project entity) {
		projectDao.save(entity);

	}

	@Override
	public void delete(Long id) {
		projectDao.delete(id);

	}

	@Override
	public void update(Project entity) {
		projectDao.update(entity);

	}

	@Override
	public Project getById(Long id) {
		return projectDao.getById(id);
	}

	@Override
	public Project getByIndetify(String indenity) {
		return projectDao.getByIndetify(indenity);
	}

	@Override
	public List<Project> getByIds(Long[] ids) {
		return projectDao.getByIds(ids);
	}

	@Override
	public List<Project> findAll(String str) {
		return projectDao.findAll(str);
	}

	@Override
	public Project getAmount(String query) {
		return projectDao.getAmount(query);
	}

	@Override
	public void saveMerge(Project entity) {
		projectDao.saveMerge(entity);

	}

}
