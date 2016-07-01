package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.NoticeDao;
import com.boncontact.domain.Notice;
import com.boncontact.service.NoticeService;
@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{
	@Resource
	private NoticeDao noticeDao;

	@Override
	public void save(Notice entity) {
		// TODO 自动生成的方法存根
		noticeDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		noticeDao.delete(id);
	}

	@Override
	public void update(Notice entity) {
		// TODO 自动生成的方法存根
		noticeDao.update(entity);
	}

	@Override
	public Notice getById(Long id) {
		// TODO 自动生成的方法存根
		return noticeDao.getById(id);
	}


	@Override
	public List<Notice> findAll(String str) {
		// TODO 自动生成的方法存根
		return noticeDao.findAll(str);
	}

	
}
