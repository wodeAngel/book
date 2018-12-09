package com.oraclewdp.ddbookmaket.dao;

import java.util.List;

import com.oraclewdp.ddbookmaket.model.Book;

public interface BookDao {

	boolean save(Book bookType);

	List<Book> findAll(int currentPage, String name, int sid);

	int total(String name, int sid);

	int del(int id);

    Book find(int id);

    boolean update(Book book);
}
