package com.oraclewdp.ddbookmaket.web;

import com.oraclewdp.ddbookmaket.biz.BookBiz;
import com.oraclewdp.ddbookmaket.biz.SmallTypeBiz;
import com.oraclewdp.ddbookmaket.biz.impl.BookBizImpl;
import com.oraclewdp.ddbookmaket.biz.impl.SmallTypeBizImpl;
import com.oraclewdp.ddbookmaket.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ToBookEditServlet", value = "/toBookEdit")
public class ToBookEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取参数
        String strId = request.getParameter("id");
        int id = Integer.parseInt(strId);
        //调用业务层
        BookBiz bookBiz = new BookBizImpl();
        Book book = bookBiz.findBookById(id);

        SmallTypeBiz smallTypeBiz=new SmallTypeBizImpl();
        int bid=smallTypeBiz.findBidById(book.getSid());

        request.setAttribute("book", book);
        request.setAttribute("bid",bid);
        request.getRequestDispatcher("/bookEdit.jsp").forward(request, response);
    }
}
