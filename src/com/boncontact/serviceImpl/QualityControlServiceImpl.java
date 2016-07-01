package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.QualityControlDao;
import com.boncontact.domain.QualityControl;
import com.boncontact.service.QualityControlService;

@Service
@Transactional
public class QualityControlServiceImpl implements QualityControlService {

	@Resource
	private QualityControlDao qualityControlDao;

	@Override
	public void save(QualityControl entity) {
		qualityControlDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		qualityControlDao.delete(id);
	}

	@Override
	public void update(QualityControl entity) {
		qualityControlDao.update(entity);

	}

	@Override
	public QualityControl getById(Long id) {
		return qualityControlDao.getById(id);
	}

	@Override
	public QualityControl getByIndetify(String indenity) {
		return qualityControlDao.getByIndetify(indenity);
	}

	@Override
	public List<QualityControl> getByIds(Long[] ids) {
		return qualityControlDao.getByIds(ids);
	}

	@Override
	public List<QualityControl> findAll(String str) {
		return qualityControlDao.findAll(str);
	}

}
