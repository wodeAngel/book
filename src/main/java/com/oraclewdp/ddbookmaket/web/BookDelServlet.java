package com.oraclewdp.ddbookmaket.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oraclewdp.ddbookmaket.biz.BookBiz;
import com.oraclewdp.ddbookmaket.biz.impl.BookBizImpl;

@WebServlet("/bookDel")
public class BookDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookDelServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strId=request.getParameter("id");
		int id=Integer.parseInt(strId);
		
		BookBiz bookBiz=new BookBizImpl();
		int ret=bookBiz.delById(id);
		
		response.sendRedirect("bookList");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
