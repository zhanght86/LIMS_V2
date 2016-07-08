package com.boncontact.dao;

import java.util.List;

import com.boncontact.base.BaseDao;
import com.boncontact.domain.AnalysisProject;
import com.boncontact.domain.Delivery_SampleType;
import com.boncontact.domain.Project;

public interface Delvery_SampleTypeDao extends BaseDao<Delivery_SampleType> {
	List<Delivery_SampleType> findByProject(Project project);

	Delivery_SampleType findByAnalysis(Project project,
			AnalysisProject analysisProject);
}
