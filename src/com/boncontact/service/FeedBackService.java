package com.boncontact.service;

import java.util.List;

import com.boncontact.domain.Feedback;

public interface FeedBackService {
	/**
	 * save()：保存对象
	 * 
	 * @param entity
	 *            ：实体对象
	 */
	void save(Feedback entity);

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
	void update(Feedback entity);

	/**
	 * getById():根据id查找
	 * 
	 * @param id
	 *            :需要查找的id值
	 * @return
	 */
	Feedback getById(Long id);



	/**
	 * findAll():查找全部对象
	 * 
	 * @param str
	 *            :Where查询子句
	 * @return
	 */
	List<Feedback> findAll(String str);

	/**
	 * getAmount():查询记录总数
	 * 
	 * @param query
	 *            ：查询子句
	 * @return
	 */
	Feedback getAmount(String query);
}
