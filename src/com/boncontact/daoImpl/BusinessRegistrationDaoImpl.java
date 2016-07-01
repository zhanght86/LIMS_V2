package com.boncontact.daoImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boncontact.base.BaseDaoImpl;
import com.boncontact.dao.BusinessRegistrationDao;
import com.boncontact.domain.BusinessRegistration;

@Service
@Transactional
public class BusinessRegistrationDaoImpl extends
		BaseDaoImpl<BusinessRegistration> implements BusinessRegistrationDao {

}
