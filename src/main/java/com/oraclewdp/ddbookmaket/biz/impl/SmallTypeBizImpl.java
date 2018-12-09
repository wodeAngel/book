package com.oraclewdp.ddbookmaket.biz.impl;

import java.util.List;

import com.oraclewdp.ddbookmaket.biz.SmallTypeBiz;
import com.oraclewdp.ddbookmaket.dao.SmallTypeDao;
import com.oraclewdp.ddbookmaket.dao.impl.SmallTypeDaoImpl;
import com.oraclewdp.ddbookmaket.model.SmallType;

public class SmallTypeBizImpl implements SmallTypeBiz {

	@Override
	public boolean save(SmallType smallType) {
		SmallTypeDao smallTypeDao=new SmallTypeDaoImpl();
		return smallTypeDao.save(smallType);
	}


	@Override
	public List<SmallType> findAllByBid(int bid) {
		SmallTypeDao smallTypeDao=new SmallTypeDaoImpl();
		return smallTypeDao.findAllByBId(bid);
	}

	@Override
	public int findBidById(int sid) {
		SmallTypeDao smallTypeDao=new SmallTypeDaoImpl();
		return smallTypeDao.findById(sid);
	}

}
