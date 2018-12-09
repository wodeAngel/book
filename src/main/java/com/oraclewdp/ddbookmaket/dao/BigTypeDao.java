package com.oraclewdp.ddbookmaket.dao;

import java.util.List;

import com.oraclewdp.ddbookmaket.model.BigType;

public interface BigTypeDao {

	boolean save(String name);

	List<BigType> findAll();

}
