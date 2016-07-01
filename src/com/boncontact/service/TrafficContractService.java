package com.boncontact.service;

import java.util.List;

import com.boncontact.domain.TrafficContract;

public interface TrafficContractService {
	/**
	 * save()：保存对象
	 * 
	 * @param entity
	 *            ：实体对象
	 */
	void save(TrafficContract entity);

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
	void update(TrafficContract entity);

	/**
	 * getById():根据id查找
	 * 
	 * @param id
	 *            :需要查找的id值
	 * @return
	 */
	TrafficContract getById(Long id);

	/**
	 * getByIndetify():根据业务编号查找
	 * 
	 * @param indenity
	 * @return
	 */
	TrafficContract getByIndetify(String indenity);

	/**
	 * getByids：根据id组查找
	 * 
	 * @param ids
	 *            :id组
	 * @return
	 */
	List<TrafficContract> getByIds(Long[] ids);

	/**
	 * findAll():查找全部对象
	 * 
	 * @param str
	 *            :Where查询子句
	 * @return
	 */
	List<TrafficContract> findAll(String str);

	/**
	 * getAmount():查询记录总数
	 * 
	 * @param query
	 *            ：查询子句
	 * @return
	 */
	TrafficContract getAmount(String query);
	/**
	 * 进入流程
	 * @param tc
	 * @param pj
	 * @return
	 */
	boolean flow(TrafficContract tc);
}
