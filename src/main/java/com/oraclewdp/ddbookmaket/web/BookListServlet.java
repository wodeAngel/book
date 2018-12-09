package com.oraclewdp.ddbookmaket.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oraclewdp.ddbookmaket.biz.BookBiz;
import com.oraclewdp.ddbookmaket.biz.impl.BookBizImpl;
import com.oraclewdp.ddbookmaket.model.Book;
import com.oraclewdp.ddbookmaket.util.PageConstant;

@WebServlet("/bookList")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		if(request.getSession().getAttribute("haslogined")==null||!(Boolean) request.getSession().getAttribute("haslogined")){
//			response.sendRedirect("login.jsp");
//			return;
//		}
    	String strCurrentPage=request.getParameter("currentPage");
		if (strCurrentPage==null) {//如果没有告诉看那一页就让第一页
			strCurrentPage="1";
		}
		int currentPage=Integer.parseInt(strCurrentPage);
		//获取name,sid和bid
		String name=request.getParameter("name");
		String strSid=request.getParameter("sid")==null?"-1":request.getParameter("sid");
		int sid=Integer.parseInt(strSid);
		String strBid=request.getParameter("bid")==null?"-1":request.getParameter("bid");
		int bid=Integer.parseInt(strBid);
		
		BookBiz bookBiz=new BookBizImpl();
		List<Book> ls=bookBiz.findAll(currentPage,name,sid);
		//查出总行数
		int totalRow=bookBiz.tatalRow(name,sid);
		int totalPage=totalRow%PageConstant.PAGE_SIZE==0?totalRow/PageConstant.PAGE_SIZE:totalRow/PageConstant.PAGE_SIZE+1;
		//把值传给bookList.jsp
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("ls", ls);
		request.setAttribute("bid", bid);
		request.setAttribute("sid", sid);
		request.setAttribute("name", name);
		request.getRequestDispatcher("bookList.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}




















