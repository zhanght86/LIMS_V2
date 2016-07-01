package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import org.springframework.stereotype.Service;

import com.boncontact.dao.ProjectDao;
import com.boncontact.dao.TrafficContractDao;
import com.boncontact.domain.TrafficContract;
import com.boncontact.service.TrafficContractService;

@Service
@Transactional
public class TrafficContractServiceImpl implements TrafficContractService {
	@Resource
	private TrafficContractDao trafficContractDao;
	@Resource
	private ProjectDao projectDao;

	@Override
	public void save(TrafficContract entity) {
		trafficContractDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		trafficContractDao.delete(id);
	}

	@Override
	public void update(TrafficContract entity) {
		trafficContractDao.update(entity);
	}

	@Override
	public TrafficContract getById(Long id) {
		return trafficContractDao.getById(id);
	}

	@Override
	public TrafficContract getByIndetify(String indenity) {
		return trafficContractDao.getByIndetify(indenity);
	}

	@Override
	public List<TrafficContract> getByIds(Long[] ids) {
		return trafficContractDao.getByIds(ids);
	}

	@Override
	public List<TrafficContract> findAll(String str) {
		return trafficContractDao.findAll(str);
	}

	@Override
	public TrafficContract getAmount(String query) {
		return trafficContractDao.getAmount(query);
	}

	@Override
	public boolean flow(TrafficContract tc) {
		try {
			if (tc == null) {
				return false;
			}
			trafficContractDao.save(tc);
			return true;
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
	}

}
