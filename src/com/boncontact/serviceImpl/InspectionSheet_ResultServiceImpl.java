package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.InspectionSheet_ResultDao;
import com.boncontact.domain.InspectionSheet_Result;
import com.boncontact.service.InspectionSheet_ResultService;
@Service
@Transactional
public class InspectionSheet_ResultServiceImpl implements InspectionSheet_ResultService {
	@Resource
	private InspectionSheet_ResultDao inspectionSheet_ResultDao;

	@Override
	public void save(InspectionSheet_Result entity) {
		// TODO 自动生成的方法存根
		inspectionSheet_ResultDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		inspectionSheet_ResultDao.delete(id);
	}

	@Override
	public void update(InspectionSheet_Result entity) {
		// TODO 自动生成的方法存根
		inspectionSheet_ResultDao.update(entity);
		
	}

	@Override
	public InspectionSheet_Result getById(Long id) {
		// TODO 自动生成的方法存根
		return inspectionSheet_ResultDao.getById(id);
	}

	@Override
	public InspectionSheet_Result getByIndetify(String indenity) {
		// TODO 自动生成的方法存根
		return inspectionSheet_ResultDao.getByIndetify(indenity);
	}

	@Override
	public List<InspectionSheet_Result> getByIds(Long[] ids) {
		// TODO 自动生成的方法存根
		return inspectionSheet_ResultDao.getByIds(ids);
	}

	@Override
	public List<InspectionSheet_Result> findAll(String str) {
		// TODO 自动生成的方法存根
		return inspectionSheet_ResultDao.findAll(str);
	}
}
