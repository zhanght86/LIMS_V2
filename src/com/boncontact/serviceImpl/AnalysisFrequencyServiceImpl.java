package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.AnalysisFrequencyDao;
import com.boncontact.domain.AnalysisFrequency;
import com.boncontact.service.AnalysisFrequencyService;
@Service
@Transactional
public class AnalysisFrequencyServiceImpl implements AnalysisFrequencyService {
	@Resource
	private AnalysisFrequencyDao analysisFrequencyDao;
	
	@Override
	public void save(AnalysisFrequency entity) {
		// TODO 自动生成的方法存根
		analysisFrequencyDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		analysisFrequencyDao.delete(id);
	}

	@Override
	public void update(AnalysisFrequency entity) {
		// TODO 自动生成的方法存根
		analysisFrequencyDao.update(entity);
	}

	@Override
	public AnalysisFrequency getById(Long id) {
		// TODO 自动生成的方法存根
		return analysisFrequencyDao.getById(id);
	}

	@Override
	public AnalysisFrequency getByIndetify(String indenity) {
		// TODO 自动生成的方法存根
		return analysisFrequencyDao.getByIndetify(indenity);
	}

	@Override
	public List<AnalysisFrequency> getByIds(Long[] ids) {
		// TODO 自动生成的方法存根
		return analysisFrequencyDao.getByIds(ids);
	}

	@Override
	public List<AnalysisFrequency> findAll(String str) {
		// TODO 自动生成的方法存根
		return analysisFrequencyDao.findAll(str);
	}

}
