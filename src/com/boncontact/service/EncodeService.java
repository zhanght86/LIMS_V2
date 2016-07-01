package com.boncontact.service;

import com.boncontact.domain.Encode;

public interface EncodeService {
	void save(Encode entity);
	/**
	 * update():更新对象
	 * 
	 * @param entity
	 *            ：更新后的对象实体
	 */
	void update(Encode entity);

	/**
	 * getById():根据id查找
	 * 
	 * @param id
	 *            :需要查找的id值
	 * @return
	 */
	Encode getEncode();
}
