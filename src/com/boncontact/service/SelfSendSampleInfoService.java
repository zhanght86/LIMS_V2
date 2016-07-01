package com.boncontact.service;

import java.util.List;

import com.boncontact.domain.SelfSendSampleInfo;

public interface SelfSendSampleInfoService {
	/**
	 * save()：保存对象
	 * 
	 * @param entity
	 *            ：实体对象
	 */
	void save(SelfSendSampleInfo entity);

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
	void update(SelfSendSampleInfo entity);

	/**
	 * getById():根据id查找
	 * 
	 * @param id
	 *            :需要查找的id值
	 * @return
	 */
	SelfSendSampleInfo getById(Long id);

	/**
	 * getByIndetify():根据业务编号查找
	 * 
	 * @param indenity
	 * @return
	 */
	SelfSendSampleInfo getByIndetify(String indenity);

	/**
	 * getByids：根据id组查找
	 * 
	 * @param ids
	 *            :id组
	 * @return
	 */
	List<SelfSendSampleInfo> getByIds(Long[] ids);

	/**
	 * findAll():查找全部对象
	 * 
	 * @param str
	 *            :Where查询子句
	 * @return
	 */
	List<SelfSendSampleInfo> findAll(String str);
}
