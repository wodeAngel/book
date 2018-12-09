package com.oraclewdp.ddbookmaket.web;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oraclewdp.ddbookmaket.biz.BookBiz;
import com.oraclewdp.ddbookmaket.biz.impl.BookBizImpl;
import com.oraclewdp.ddbookmaket.model.Book;
import com.oraclewdp.ddbookmaket.util.HtmlUtil;
import com.oraclewdp.ddbookmaket.util.MyBeanUtils;

@WebServlet("/bookAdd")
@MultipartConfig
public class BookAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookAddServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Book book=new Book();
		MyBeanUtils.populate(book, request.getParameterMap(),"yyyy-MM-dd");
		String newFile=null;
		Part part=request.getPart("photo");
		if (part.getHeader("Content-Disposition").contains("; filename=")) {
			if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().equals("")) {
				String es = part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf(".") + 1);
				newFile = UUID.randomUUID() + "." + es;
				part.write(request.getServletContext().getRealPath("/upload/" + newFile));
			}
		}
		book.setPhoto(newFile);
		//进行转义避免xss攻击
		book.setDescri(HtmlUtil.htmlEncode(book.getDescri()));
		BookBiz bookBiz=new BookBizImpl();
		boolean ret=bookBiz.save(book);
		if (ret) {
			response.sendRedirect("bookList");
		} else {
			request.setAttribute("smallType", book);
			request.getRequestDispatcher("bookAdd.jsp").forward(request, response);
		}
	}
}
