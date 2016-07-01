package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.DeviceDao;
import com.boncontact.domain.Device;
import com.boncontact.service.DeviceService;

@Service
@Transactional
public class DeviceServiceImpl implements DeviceService {

	@Resource
	private DeviceDao deviceDao;

	@Override
	public void save(Device entity) {
		deviceDao.save(entity);

	}

	@Override
	public void delete(Long id) {
		deviceDao.delete(id);
	}

	@Override
	public void update(Device entity) {
		deviceDao.update(entity);

	}

	@Override
	public Device getById(Long id) {
		// TODO 自动生成的方法存根
		return deviceDao.getById(id);
	}

	@Override
	public Device getByIndetify(String indenity) {
		// TODO 自动生成的方法存根
		return deviceDao.getByIndetify(indenity);
	}

	@Override
	public List<Device> getByIds(Long[] ids) {
		// TODO 自动生成的方法存根
		return deviceDao.getByIds(ids);
	}

	@Override
	public List<Device> findAll(String str) {
		// TODO 自动生成的方法存根
		return deviceDao.findAll(str);
	}

	@Override
	public Device getAmount(String query) {
		// TODO 自动生成的方法存根
		return deviceDao.getAmount(query);
	}

}
