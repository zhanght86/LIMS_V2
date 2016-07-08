package com.boncontact.daoImpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.boncontact.base.BaseDaoImpl;
import com.boncontact.dao.Delvery_SampleTypeDao;
import com.boncontact.domain.AnalysisProject;
import com.boncontact.domain.Delivery_SampleType;
import com.boncontact.domain.Project;

@Service
public class Delvery_SampleTypeDaoImpl extends BaseDaoImpl<Delivery_SampleType>
		implements Delvery_SampleTypeDao {

	@Override
	public List<Delivery_SampleType> findByProject(Project project) {
		// TODO 自动生成的方法存根
		List<Delivery_SampleType> delivery_SampleTypes = getSession()
				.createQuery(
						"FROM Delivery_SampleType d WHERE d.project ="
								+ project).list();
		return delivery_SampleTypes;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Delivery_SampleType findByAnalysis(Project project,
			AnalysisProject analysisProject) {
		List<Delivery_SampleType> delivery_SampleTypes = getSession()
				.createQuery(
						"FROM Delivery_SampleType d WHERE d.project ="
								+ project.getId() + " and analysis =" + analysisProject.getId())
				.list();
		if (delivery_SampleTypes.size() != 0) {
			Delivery_SampleType type = delivery_SampleTypes.get(0);
			return type;
		}
		return null;
	}

}
