package com.boncontact.base;

import java.util.List;

/**
 * 公用Dao接口，定义了Dao层最基本的方法
 * 
 * @author 瞿龙俊
 * 
 * @param <T>
 */
public interface BaseDao<T> {
	/**
	 * save()：保存对象
	 * 
	 * @param entity
	 *            ：实体对象
	 */
	void save(T entity);

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
	void update(T entity);

	/**
	 * getById():根据id查找
	 * 
	 * @param id
	 *            :需要查找的id值
	 * @return
	 */
	T getById(Long id);

	/**
	 * getByids：根据id组查找
	 * 
	 * @param ids
	 *            :id组
	 * @return
	 */
	List<T> getByIds(Long[] ids);

	/**
	 * findAll():查找全部对象
	 * 
	 * @param str
	 *            ：查询子句
	 * 
	 * @return
	 */
	List<T> findAll(String str);

	/**
	 * getByIndetify():根据业务编号查找
	 * 
	 * @param indenity
	 *            :需要查找的业务主键值
	 * @return
	 */
	T getByIndetify(String indenity);

	/**
	 * getAmount():计算自动编号
	 * 
	 * @param query
	 *            where子句
	 * @return
	 */
	T getAmount(String query);

	/**
	 * 通过merge()方法保存
	 * 
	 * @param entity
	 * @return
	 */
	void saveMerge(T entity);
}
