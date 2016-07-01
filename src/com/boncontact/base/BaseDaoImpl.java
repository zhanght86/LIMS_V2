package com.boncontact.base;

import java.lang.reflect.ParameterizedType;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@SuppressWarnings("unchecked")
public class BaseDaoImpl<T> implements BaseDao<T> {
	
	@Resource
	private SessionFactory sessionFactory;
	private Class<T> clazz;

	public BaseDaoImpl() {

		ParameterizedType pt = (ParameterizedType) this.getClass()
				.getGenericSuperclass();
		this.clazz = (Class<T>) pt.getActualTypeArguments()[0];
		System.out.println("clazz ---> " + clazz);
	}

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public void save(T entity) {
		try {
			System.out.println(getSession());
			System.out.println(entity);
			getSession().save(entity);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	public void update(T entity) {
		getSession().update(entity);
		//getSession().merge(entity);
	}

	public void delete(Long id) {
		Object obj = getById(id);
		if (obj != null) {
			getSession().delete(obj);
		}
	}

	public T getById(Long id) {
		if (id == null) {
			return null;
		} else {
			return (T) getSession().get(clazz, id);
		}
	}

	public List<T> getByIds(Long[] ids) {
		if (ids == null || ids.length == 0) {
			return Collections.EMPTY_LIST;
		} else {
			return getSession().createQuery(//
					"FROM " + clazz.getSimpleName() + " WHERE id IN (:ids)")//
					.setParameterList("ids", ids)//
					.list();
		}
	}

	public List<T> findAll(String str) {
		return getSession().createQuery(//
				"FROM " + clazz.getSimpleName() + " c " + str)//
				.list();
	}

	public T getByIndetify(String indenity) {
		List<T> list = getSession()
				.createQuery(//
						"FROM " + clazz.getSimpleName()
								+ " WHERE identify = (:identity)")//
				.setString("identity", indenity)//
				.list();
		if (list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

	public T getAmount(String query) {
		T temp = null;
		List<T> list = getSession().createQuery(//
				"FROM " + clazz.getSimpleName() + query).list();
		if (list.size() > 0) {
			temp = list.get(list.size() - 1);
		}
		return temp;
	}

	@Override
	public void saveMerge(T entity) {
		try {
			System.out.println(entity);
			getSession().merge(entity);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

}
