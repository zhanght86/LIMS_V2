package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.MessageListenDao;
import com.boncontact.domain.MessageListen;
import com.boncontact.service.MessageListenService;

@Service
@Transactional
public class MessageListenServiceImpl implements MessageListenService {
	@Resource
	private MessageListenDao messageListenDao;

	@Override
	public void save(MessageListen entity) {
		// TODO 自动生成的方法存根
		messageListenDao.save(entity);
	}

	@Override
	public void delete(Long id) {
		// TODO 自动生成的方法存根
		messageListenDao.delete(id);
	}

	@Override
	public void update(MessageListen entity) {
		// TODO 自动生成的方法存根
		messageListenDao.update(entity);
	}

	@Override
	public MessageListen getById(Long id) {
		// TODO 自动生成的方法存根
		return messageListenDao.getById(id);
	}

	@Override
	public List<MessageListen> findAll(String str) {
		// TODO 自动生成的方法存根
		return messageListenDao.findAll(str);
	}

}
