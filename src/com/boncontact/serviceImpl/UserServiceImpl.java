package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.UserDao;
import com.boncontact.domain.User;
import com.boncontact.service.UserService;



@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	@Override
	public void save(User entity) {
		userDao.save(entity);
		
	}

	@Override
	public void delete(Long id) {
		userDao.delete(id);
	}

	@Override
	public void update(User entity) {
		userDao.update(entity);
		
	}

	@Override
	public User getById(Long id) {
		// TODO 自动生成的方法存根
		return userDao.getById(id);
	}

	@Override
	public User getByIndetify(String indenity) {
		// TODO 自动生成的方法存根
		return userDao.getByIndetify(indenity);
	}

	@Override
	public List<User> getByIds(Long[] ids) {
		// TODO 自动生成的方法存根
		return userDao.getByIds(ids);
	}

	@Override
	public List<User> findAll(String str) {
		// TODO 自动生成的方法存根
		return userDao.findAll(str);
	}

	@Override
	public User getAmount(String query) {
		// TODO 自动生成的方法存根
		return userDao.getAmount(query);
	}
}
