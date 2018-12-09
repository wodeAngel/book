package com.oraclewdp.ddbookmaket.biz;

import java.util.List;

import com.oraclewdp.ddbookmaket.model.Book;

public interface BookBiz {

	boolean save(Book bookType);

	List<Book> findAll(int currentPage, String name, int sid);

	int tatalRow(String name, int sid);

	int delById(int id);

    Book findBookById(int id);

    boolean update(Book book);
}
