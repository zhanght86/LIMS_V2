package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.boncontact.dao.RoleDao;
import com.boncontact.domain.Role;
import com.boncontact.service.RoleService;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
	@Resource
	private RoleDao roleDao;

	@Override
	public void save(Role entity) {
		roleDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		roleDao.delete(id);
	}

	@Override
	public void update(Role entity) {
		roleDao.update(entity);
	}

	@Override
	public Role getById(Long id) {
		return roleDao.getById(id);
	}

	@Override
	public List<Role> getByIds(Long[] ids) {
		return roleDao.getByIds(ids);
	}

	@Override
	public List<Role> findAll(String str) {

		return roleDao.findAll(str);
	}

	@Override
	public Role getByIndetify(String indenity) {
		return roleDao.getByIndetify(indenity);
	}

	@Override
	public Role getAmount(String query) {
		return roleDao.getAmount(query);
	}

	@Override
	public Role findCustomer() {
		// TODO 自动生成的方法存根
		return roleDao.findCustomer();
	}

}
