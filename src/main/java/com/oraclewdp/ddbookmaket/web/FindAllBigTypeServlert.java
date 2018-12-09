package com.oraclewdp.ddbookmaket.web;

import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.oraclewdp.ddbookmaket.biz.BigTypeBiz;
import com.oraclewdp.ddbookmaket.biz.impl.BigTypeBizImpl;
import com.oraclewdp.ddbookmaket.model.BigType;

@WebServlet("/findAllBigType")
public class FindAllBigTypeServlert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindAllBigTypeServlert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String callBack=request.getParameter("callback");
		BigTypeBiz bigTypeBiz=new BigTypeBizImpl();
		List<BigType> ls=bigTypeBiz.findAllBigType();
		//js
		//告诉客户端发送的是js
		response.setContentType("text/javascript;charset=UTF-8");
		PrintWriter out=response.getWriter();
		JSONArray jsonArray=new JSONArray(ls);
		out.println(callBack+"("+jsonArray.toString()+")");
		out.flush();
	}

}
