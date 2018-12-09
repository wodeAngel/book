package com.oraclewdp.ddbookmaket.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oraclewdp.ddbookmaket.biz.BigTypeBiz;
import com.oraclewdp.ddbookmaket.biz.impl.BigTypeBizImpl;

@WebServlet("/bigTypeAdd")
public class BigTypeAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BigTypeAddServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		if(request.getSession().getAttribute("haslogined")==null||!(Boolean) request.getSession().getAttribute("haslogined")){
//			response.sendRedirect("login.jsp");
//			return;
//		}
    	//把用户填写大类名存到数据库
		String name=request.getParameter("name");
		BigTypeBiz bigTypeBiz=new BigTypeBizImpl();
		boolean ret=bigTypeBiz.save(name);
		if (ret) {
			response.sendRedirect("main.jsp");
		} else {
			request.setAttribute("name", name);
			request.getRequestDispatcher("/bigTypeAdd.jsp").forward(request, response);
		}
	}

}
