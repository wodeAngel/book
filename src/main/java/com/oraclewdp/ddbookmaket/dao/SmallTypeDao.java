package com.oraclewdp.ddbookmaket.dao;

import java.util.List;

import com.oraclewdp.ddbookmaket.model.SmallType;

public interface SmallTypeDao {

	boolean save(SmallType smallType);

	List<SmallType> findAllByBId(int bid);

    int findById(int sid);
}
