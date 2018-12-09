package com.oraclewdp.ddbookmaket.biz;

import java.util.List;

import com.oraclewdp.ddbookmaket.model.BigType;

public interface BigTypeBiz {

	boolean save(String name);

	List<BigType> findAllBigType();

}
