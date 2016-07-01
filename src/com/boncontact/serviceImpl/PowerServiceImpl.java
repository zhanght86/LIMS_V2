package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.PowerDao;
import com.boncontact.domain.Power;
import com.boncontact.service.PowerService;

@Service
@Transactional
public class PowerServiceImpl implements PowerService {
	@Resource
	private PowerDao powerDao;

	@Override
	public void save(Power entity) {
		// TODO 自动生成的方法存根
		powerDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		powerDao.delete(id);
	}

	@Override
	public void update(Power entity) {
		// TODO 自动生成的方法存根
		powerDao.update(entity);
	}

	@Override
	public Power getById(Long id) {
		// TODO 自动生成的方法存根
		return powerDao.getById(id);
	}

	@Override
	public List<Power> findAll(String str) {
		// TODO 自动生成的方法存根
		return powerDao.findAll(str);
	}

	@Override
	public Power getByIndetify(String indenity) {
		// TODO 自动生成的方法存根
		return powerDao.getByIndetify(indenity);
	}

}
