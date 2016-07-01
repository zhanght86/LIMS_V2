package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.ReportDao;
import com.boncontact.domain.Report;
import com.boncontact.service.ReportService;

@Service
@Transactional
public class ReportServiceImpl implements ReportService {
	@Resource
	private ReportDao reportDao;

	@Override
	public void save(Report entity) {
		// TODO 自动生成的方法存根
		reportDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		reportDao.delete(id);
	}

	@Override
	public void update(Report entity) {
		// TODO 自动生成的方法存根
		reportDao.update(entity);
	}

	@Override
	public Report getById(Long id) {
		// TODO 自动生成的方法存根
		return reportDao.getById(id);
	}

	@Override
	public Report getByIndetify(String indenity) {
		// TODO 自动生成的方法存根
		return reportDao.getByIndetify(indenity);
	}

	@Override
	public List<Report> findAll(String str) {
		// TODO 自动生成的方法存根
		return reportDao.findAll(str);
	}

}
