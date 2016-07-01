package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.InspectionSheetDao;
import com.boncontact.domain.InspectionSheet;
import com.boncontact.service.InspectionSheetService;

@Service
@Transactional
public class InspectionSheetServiceImpl implements InspectionSheetService {
	@Resource
	private InspectionSheetDao inspectionSheetDao;

	@Override
	public void save(InspectionSheet entity) {
		inspectionSheetDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		inspectionSheetDao.delete(id);
	}

	@Override
	public void update(InspectionSheet entity) {
		inspectionSheetDao.update(entity);
	}

	@Override
	public InspectionSheet getById(Long id) {
		return inspectionSheetDao.getById(id);
	}

	@Override
	public InspectionSheet getByIndetify(String indenity) {
		return inspectionSheetDao.getByIndetify(indenity);
	}

	@Override
	public List<InspectionSheet> getByIds(Long[] ids) {
		return inspectionSheetDao.getByIds(ids);
	}

	@Override
	public List<InspectionSheet> findAll(String str) {
		return inspectionSheetDao.findAll(str);
	}

}
