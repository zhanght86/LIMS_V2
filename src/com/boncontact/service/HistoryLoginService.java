package com.boncontact.service;

import java.util.List;

import com.boncontact.domain.HistoryLogin;


public interface HistoryLoginService {
	/**
	 * save()：保存对象
	 * 
	 * @param entity
	 *            ：实体对象
	 */
	void save(HistoryLogin entity);

	/**
	 * delete()：删除对象
	 * 
	 * @param id
	 *            ：对象id
	 */
	void delete(Long id);

	/**
	 * update():更新对象
	 * 
	 * @param entity
	 *            ：更新后的对象实体
	 */
	void update(HistoryLogin entity);

	/**
	 * getById():根据id查找
	 * 
	 * @param id
	 *            :需要查找的id值
	 * @return
	 */
	HistoryLogin getById(Long id);

	/**
	 * findAll():查找全部对象
	 * 
	 * @param str
	 *            :Where查询子句
	 * @return
	 */
	List<HistoryLogin> findAll(String str);
	/**
	 * 获取最后一次登录信息
	 * @param id
	 * @return
	 */
	HistoryLogin getLastLogin(Long id);
}
