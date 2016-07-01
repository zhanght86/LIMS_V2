package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.DepartmentDao;
import com.boncontact.domain.Department;
import com.boncontact.service.DepartmentService;

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService {
	@Resource
	private DepartmentDao departmentDao;

	@Override
	public void save(Department entity) {
		departmentDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		departmentDao.delete(id);
	}

	@Override
	public void update(Department entity) {
		departmentDao.update(entity);
	}

	@Override
	public Department getById(Long id) {
		return departmentDao.getById(id);
	}

	@Override
	public List<Department> getByIds(Long[] ids) {
		return departmentDao.getByIds(ids);
	}

	@Override
	public List<Department> findAll(String str) {

		return departmentDao.findAll(str);
	}

	@Override
	public Department getByIndetify(String indenity) {
		return departmentDao.getByIndetify(indenity);
	}

	@Override
	public Department getAmount(String query) {
		return departmentDao.getAmount(query);
	}
}
