package com.boncontact.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.EncodeDao;
import com.boncontact.domain.Encode;
import com.boncontact.service.EncodeService;

@Transactional
@Service
public class EncodeServiceImpl implements EncodeService {
	@Resource
	private EncodeDao encodeDao;

	@Override
	public void update(Encode entity) {
		encodeDao.update(entity);

	}

	@Override
	public Encode getEncode() {
		return encodeDao.getById(1L);
	}

	@Override
	public void save(Encode entity) {
		encodeDao.save(entity);
		
	}

}
