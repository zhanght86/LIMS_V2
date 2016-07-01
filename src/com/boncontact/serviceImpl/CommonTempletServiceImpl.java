package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.CommonTempletDao;
import com.boncontact.domain.CommonTemplet;
import com.boncontact.service.CommonTempletService;

@Service
@Transactional
public class CommonTempletServiceImpl implements CommonTempletService {
	@Resource
	private CommonTempletDao commonTempletDao;

	@Override
	public void save(CommonTemplet entity) {
		commonTempletDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		commonTempletDao.delete(id);

	}

	@Override
	public void update(CommonTemplet entity) {
		commonTempletDao.update(entity);

	}

	@Override
	public CommonTemplet getById(Long id) {
		return commonTempletDao.getById(id);
	}

	@Override
	public CommonTemplet getByIndetify(String indenity) {
		return commonTempletDao.getByIndetify(indenity);
	}

	@Override
	public List<CommonTemplet> getByIds(Long[] ids) {
		return commonTempletDao.getByIds(ids);
	}

	@Override
	public List<CommonTemplet> findAll(String str) {
		return commonTempletDao.findAll(str);
	}

}
