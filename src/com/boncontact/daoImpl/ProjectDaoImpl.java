package com.boncontact.daoImpl;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.base.BaseDaoImpl;
import com.boncontact.dao.ProjectDao;
import com.boncontact.domain.Project;

@Service
@Transactional
public class ProjectDaoImpl extends BaseDaoImpl<Project> implements ProjectDao {


}
