package com.boncontact.daoImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import com.boncontact.base.BaseDaoImpl;
import com.boncontact.dao.RoleDao;
import com.boncontact.domain.Role;

@Service
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao {

	@SuppressWarnings("unchecked")
	@Override
	public Role findCustomer() {
		List<Role> roleList = getSession().createQuery(
				"FROM Role WHERE name='客户'").list();
		if (roleList.size() == 1) {
			return roleList.get(0);
		}
		return null;
	}

}
