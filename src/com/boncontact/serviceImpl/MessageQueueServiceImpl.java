package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.MessageQueueDao;
import com.boncontact.domain.MessageQueue;
import com.boncontact.service.MessageQueueService;

@Service
@Transactional
public class MessageQueueServiceImpl implements MessageQueueService {
	@Resource
	private MessageQueueDao messageQueueDao;

	@Override
	public void save(MessageQueue entity) {
		// TODO 自动生成的方法存根
		messageQueueDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		messageQueueDao.delete(id);
	}

	@Override
	public void update(MessageQueue entity) {
		// TODO 自动生成的方法存根
		messageQueueDao.update(entity);
	}

	@Override
	public MessageQueue getById(Long id) {
		// TODO 自动生成的方法存根
		return messageQueueDao.getById(id);
	}

	@Override
	public List<MessageQueue> findAll(String str) {
		// TODO 自动生成的方法存根
		return messageQueueDao.findAll(str);
	}

}
