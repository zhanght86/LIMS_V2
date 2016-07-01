package com.boncontact.daoImpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.boncontact.base.BaseDaoImpl;
import com.boncontact.dao.HistoryLoginDao;
import com.boncontact.domain.HistoryLogin;

@Service
public class HistoryLoginDaoImpl extends BaseDaoImpl<HistoryLogin> implements
		HistoryLoginDao {

	@SuppressWarnings("unchecked")
	@Override
	public HistoryLogin getLastLogin(Long id) {
		List<HistoryLogin> hisList = getSession().createQuery(
				"FROM HistoryLogin WHERE state=1 AND user=" + id
						+ " ORDER BY id DESC").list();
		if (hisList.size() != 0) {
			return hisList.get(0);
		}
		return null;
	}

}
