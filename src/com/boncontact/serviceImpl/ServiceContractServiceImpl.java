package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.ServiceContractDao;
import com.boncontact.domain.ServiceContract;
import com.boncontact.service.ServiceContractService;

@Transactional
@Service
public class ServiceContractServiceImpl implements ServiceContractService {
	@Resource
	private ServiceContractDao serviceContractDdao;

	@Override
	public void save(ServiceContract entity) {
		serviceContractDdao.save(entity);
	}

	@Override
	public void delete(Long id) {
		serviceContractDdao.delete(id);
	}

	@Override
	public void update(ServiceContract entity) {
		serviceContractDdao.update(entity);
	}

	@Override
	public ServiceContract getById(Long id) {
		return serviceContractDdao.getById(id);
	}

	@Override
	public ServiceContract getByIndetify(String indenity) {
		return serviceContractDdao.getByIndetify(indenity);
	}

	@Override
	public List<ServiceContract> getByIds(Long[] ids) {
		return serviceContractDdao.getByIds(ids);
	}

	@Override
	public List<ServiceContract> findAll(String str) {
		return serviceContractDdao.findAll(str);
	}

	@Override
	public ServiceContract getAmount(String query) {
		return serviceContractDdao.getAmount(query);
	}

	@Override
	public boolean flow(ServiceContract tc) {
		try {
			if (tc == null) {
				return false;
			}
			serviceContractDdao.save(tc);
			return true;
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
	}

}
