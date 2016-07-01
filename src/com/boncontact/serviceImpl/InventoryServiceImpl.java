package com.boncontact.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.dao.InventoryDao;
import com.boncontact.domain.Inventory;
import com.boncontact.service.InventoryService;
@Service
@Transactional
public class InventoryServiceImpl implements InventoryService{
	@Resource
	private InventoryDao inventoryDao;

	@Override
	public void save(Inventory entity) {
		inventoryDao.save(entity);
		
	}

	@Override
	public void delete(Long id) {
		inventoryDao.delete(id);
	}

	@Override
	public void update(Inventory entity) {
		inventoryDao.update(entity);
		
	}

	@Override
	public Inventory getById(Long id) {
		// TODO 自动生成的方法存根
		return inventoryDao.getById(id);
	}

	@Override
	public Inventory getByIndetify(String indenity) {
		// TODO 自动生成的方法存根
		return inventoryDao.getByIndetify(indenity);
	}

	@Override
	public List<Inventory> getByIds(Long[] ids) {
		// TODO 自动生成的方法存根
		return inventoryDao.getByIds(ids);
	}

	@Override
	public List<Inventory> findAll(String str) {
		// TODO 自动生成的方法存根
		return inventoryDao.findAll(str);
	}

	@Override
	public Inventory getAmount(String query) {
		// TODO 自动生成的方法存根
		return inventoryDao.getAmount(query);
	}

}
