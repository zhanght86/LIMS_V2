package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.DeliveryReceitpDao;
import com.boncontact.domain.DeliveryReceitp;
import com.boncontact.service.DeliveryReceitpService;

@Service
@Transactional
public class DeliveryReceitpServiceImpl implements DeliveryReceitpService {
	@Resource
	private DeliveryReceitpDao deliveryReceitpDao;

	@Override
	public void save(DeliveryReceitp entity) {
		deliveryReceitpDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		deliveryReceitpDao.delete(id);
	}

	@Override
	public void update(DeliveryReceitp entity) {
		deliveryReceitpDao.update(entity);

	}

	@Override
	public DeliveryReceitp getById(Long id) {
		return deliveryReceitpDao.getById(id);
	}

	@Override
	public DeliveryReceitp getByIndetify(String indenity) {
		return deliveryReceitpDao.getByIndetify(indenity);
	}

	@Override
	public List<DeliveryReceitp> getByIds(Long[] ids) {
		return deliveryReceitpDao.getByIds(ids);
	}

	@Override
	public List<DeliveryReceitp> findAll(String str) {
		return deliveryReceitpDao.findAll(str);
	}

}
