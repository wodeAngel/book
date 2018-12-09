package com.oraclewdp.ddbookmaket.biz;

import java.util.List;

import com.oraclewdp.ddbookmaket.model.SmallType;

public interface SmallTypeBiz {

	boolean save(SmallType smallType);

	List<SmallType> findAllByBid(int bid);


    int findBidById(int sid);
}
