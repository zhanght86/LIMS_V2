package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.CustomerDao;
import com.boncontact.domain.Customer;
import com.boncontact.service.CustomerService;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
	@Resource
	private CustomerDao customerDao;

	@Override
	public void save(Customer entity) {
		customerDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		customerDao.delete(id);
	}

	@Override
	public void update(Customer entity) {
		customerDao.update(entity);
	}

	@Override
	public Customer getById(Long id) {
		return customerDao.getById(id);
	}

	@Override
	public Customer getByIndetify(String indenity) {
		return customerDao.getByIndetify(indenity);
	}

	@Override
	public List<Customer> getByIds(Long[] ids) {
		return customerDao.getByIds(ids);
	}

	@Override
	public List<Customer> findAll(String str) {
		return customerDao.findAll(str);
	}

	@Override
	public Customer getAmount(String query) {
		return customerDao.getAmount(query);
	}
	
}
