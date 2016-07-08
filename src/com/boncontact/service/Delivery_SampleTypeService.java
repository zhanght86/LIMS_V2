package com.boncontact.service;

import java.util.List;

import com.boncontact.domain.AnalysisProject;
import com.boncontact.domain.AnalysisType;
import com.boncontact.domain.Delivery_SampleType;
import com.boncontact.domain.Project;

public interface Delivery_SampleTypeService {
	/**
	 * save()：保存对象
	 * 
	 * @param entity
	 *            ：实体对象
	 */
	void save(Delivery_SampleType entity);

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
	void update(Delivery_SampleType entity);

	/**
	 * getById():根据id查找
	 * 
	 * @param id
	 *            :需要查找的id值
	 * @return
	 */
	Delivery_SampleType getById(Long id);

	/**
	 * getByIndetify():根据业务编号查找
	 * 
	 * @param indenity
	 * @return
	 */
	Delivery_SampleType getByIndetify(String indenity);

	/**
	 * getByids：根据id组查找
	 * 
	 * @param ids
	 *            :id组
	 * @return
	 */
	List<Delivery_SampleType> getByIds(Long[] ids);

	/**
	 * findAll():查找全部对象
	 * 
	 * @param str
	 *            :Where查询子句
	 * @return
	 */
	List<Delivery_SampleType> findAll(String str);

	List<Delivery_SampleType> findByProject(Project project);

	Delivery_SampleType findByAnalysis(Project project,
			AnalysisProject analysisProject);

}
