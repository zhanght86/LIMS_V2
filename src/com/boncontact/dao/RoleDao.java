package com.boncontact.dao;

import com.boncontact.base.BaseDao;
import com.boncontact.domain.Role;

public interface RoleDao extends BaseDao<Role> {
	/**
	 * 查找客户对应的角色
	 * 
	 * @return
	 */
	Role findCustomer();
}
