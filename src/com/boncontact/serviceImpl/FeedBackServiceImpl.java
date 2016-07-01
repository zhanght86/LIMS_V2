package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.FeedBackDao;
import com.boncontact.domain.Feedback;
import com.boncontact.service.FeedBackService;

@Service
@Transactional
public class FeedBackServiceImpl implements FeedBackService {
	@Resource
	private FeedBackDao feedBackDao;

	@Override
	public void save(Feedback entity) {
		// TODO 自动生成的方法存根
		feedBackDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		feedBackDao.delete(id);
	}

	@Override
	public void update(Feedback entity) {
		// TODO 自动生成的方法存根
		feedBackDao.update(entity);
	}

	@Override
	public Feedback getById(Long id) {
		// TODO 自动生成的方法存根
		return feedBackDao.getById(id);
	}

	@Override
	public List<Feedback> findAll(String str) {
		// TODO 自动生成的方法存根
		return feedBackDao.findAll(str);
	}

	@Override
	public Feedback getAmount(String query) {
		// TODO 自动生成的方法存根
		return feedBackDao.getAmount(query);
	}

}
