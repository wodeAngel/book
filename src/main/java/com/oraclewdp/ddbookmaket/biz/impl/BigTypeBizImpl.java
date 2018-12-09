package com.oraclewdp.ddbookmaket.biz.impl;

import java.util.List;

import com.oraclewdp.ddbookmaket.biz.BigTypeBiz;
import com.oraclewdp.ddbookmaket.dao.BigTypeDao;
import com.oraclewdp.ddbookmaket.dao.impl.BigTypeDaoJdbcImpl;
import com.oraclewdp.ddbookmaket.model.BigType;

public class BigTypeBizImpl implements BigTypeBiz {

	@Override
	public boolean save(String name) {
		BigTypeDao bigTypeDao=new BigTypeDaoJdbcImpl();
		return bigTypeDao.save(name);
	}

	@Override
	public List<BigType> findAllBigType() {
		BigTypeDao bigTypeDao=new BigTypeDaoJdbcImpl();
		return bigTypeDao.findAll();
	}

}
