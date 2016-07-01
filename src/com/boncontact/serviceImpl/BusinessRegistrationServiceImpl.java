package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.BusinessRegistrationDao;
import com.boncontact.domain.BusinessRegistration;
import com.boncontact.service.BusinessRegistrationService;

@Service
@Transactional
public class BusinessRegistrationServiceImpl implements BusinessRegistrationService{
	@Resource
	private BusinessRegistrationDao businessRegistrationDao;

	@Override
	public void save(BusinessRegistration entity) {
		businessRegistrationDao.save(entity);
		
	}

	@Override
	public void delete(Long id) {
		businessRegistrationDao.delete(id);
		
	}

	@Override
	public void update(BusinessRegistration entity) {
		businessRegistrationDao.update(entity);
		
	}

	@Override
	public BusinessRegistration getById(Long id) {
		return businessRegistrationDao.getById(id);
	}

	@Override
	public BusinessRegistration getByIndetify(String indenity) {
		return businessRegistrationDao.getByIndetify(indenity);
	}

	@Override
	public List<BusinessRegistration> getByIds(Long[] ids) {
		return businessRegistrationDao.getByIds(ids);
	}

	@Override
	public List<BusinessRegistration> findAll(String str) {
		return businessRegistrationDao.findAll(str);
	}
}
